#!/bin/bash

URL=$1
DURATION=$2
CONCURRENT=$3

# run load test
k6 run -e URL=$URL --duration $DURATION --vus $CONCURRENT script.js;

sleep 5;

# template html
sed -i -e "s|Test:|Test -> $URL :|g"  summary.html;

sleep 5;

# screenshoot html
google-chrome --headless --screenshot --window-size=1920,1080 --default-background-color=0 --no-sandbox summary.html;

sleep 5;

# send notif email
EMAIL=$(cat email.txt)
sendmail -t <<EOT
TO: $EMAIL
FROM: <uptime@webarq.com>
SUBJECT: Result Stats IIGF - $URL
MIME-Version: 1.0
Content-Type: multipart/related;text/html;boundary="XYZ"

--XYZ
Content-Type: text/html; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=summary.html
Content-Transfer-Encoding: base64

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=ISO-8859-15">
</head>
<body bgcolor="#ffffff" text="#000000">

<h3>Result Load Test : $URL </h3>

<img src="cid:part1.06090408.01060107" alt="">
</body>
</html>

--XYZ
Content-Type: image/png;name="screenshot.png"
Content-Transfer-Encoding: base64
Content-ID: <part1.06090408.01060107>
Content-Disposition: inline; filename="screenshot.png"

$(base64 screenshot.png)
--XYZ--
EOT