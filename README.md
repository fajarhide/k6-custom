# k6-custom

A custom k6 reporting html and png send to email

## Requirement

- [k6](https://k6.io)
- [sendmail](https://linux.die.net/man/8/sendmail.sendmail)
- [google-chrome](https://developers.google.com/web/updates/2017/04/headless-chrome)
## Installation

### Preparation
```shell
touch email.txt
touch url.txt
```

### input email using format
```shell
echo "user1@email.com,user2@gmal.com" > email.txt
```

### input multi url
```shell
echo -e "URL_1\nURL_2\nURL_3e" >> url.txt

```

### Parameters environment:

Update `.env` file using parameter here :

| Parameter        | Description   | Example                           |
| --------------- | -------------- | --------------------------------- |
| `URL`           | target website for load test  | `https://www.detik.com` or using path `https://www.detik.com/redaksi` |
| `DURATION`      | a string specifying the total duration of the test run      |   `5s` or `1m` or `1h` |
| `CONCURRENT`      | a number specifying the number to run concurrently    |   `10` or `100` |
| `SENDER`      | a email sender location in `FROM:`       |  `user@mail.com` |
| `TITLE`      | Subject email       |    `Load test using K6` |

## Usage Mode Single

update file `.env` define parameters

```shell
sh exec.sh
```

## Usage Mode Multi

Input list url to file `url.txt` and don't update param `ENV_URL` on `.env.template`. you can update `DURATION` , `CONCURRENT` , `SENDER` and `TITLE`

```shell
sh multi.sh
```

## Maintainer
fajarhide (https://github.com/fajarhide)

<img width="858" alt="Screen Shot 2022-06-06 at 21 59 10" src="https://user-images.githubusercontent.com/4769529/172187422-90286649-1144-4553-b5c1-c9e53b5783eb.png">
