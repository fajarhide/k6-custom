#!/bin/bash
# Single execution
# env
URL=$(cat .env | grep  'URL=' | awk -F'=' '{print $2}')
DURATION=$(cat .env | grep  'DURATION=' | awk -F'=' '{print $2}')
CONCURRENT=$(cat .env | grep  'CONCURRENT=' | awk -F'=' '{print $2}')
SENDER=$(cat .env | grep  'SENDER=' | awk -F'=' '{print $2}')
TITLE=$(cat .env | grep  'TITLE=' | awk -F'=' '{print $2}')
# run load test
k6 run -e URL=$URL --duration $DURATION --vus $CONCURRENT libs/script.js;
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
FROM: <$SENDER>
SUBJECT: $TITLE - $URL
MIME-Version: 1.0
Content-Type: multipart/related;boundary="XYZ"
--XYZ
Content-Type: text/html; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=ISO-8859-15">
</head>
<body bgcolor="#ffffff" text="#000000">
<h3>Result Load Test : $URL </h3>
<p>Download and open file html <b>summary.html</b> for view result load test</p>
<p>Thanks,</p>
<p><b>K6 Custom</b></p>
<img src="cid:part1.06090408.01060107" alt="">
</body>
</html>
--XYZ
Content-Type: image/png;name="screenshot.png"
Content-Transfer-Encoding: base64
Content-ID: <part1.06090408.01060107>
Content-Disposition: inline; filename="screenshot.png"

$(base64 screenshot.png)

Content-Type: text/html;name="summary.html"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="summary.html"

$(base64 summary.html)
--XYZ--
EOT
