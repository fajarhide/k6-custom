# k6-custom

A custom k6 reporting html and png send to email

## Installation

### Preparation
```shell
touch email.txt
```

### input email using format
```shell
echo "user1@email.com,user2@gmal.com" > email.txt
```

### Parameters environment:

Update `.env` file using parameter here :

`URL` is target website for load test, 
example : `https://www.detik.com` or using path `https://www.detik.com/redaksi`

`DURATION` is a string specifying the total duration of the test run, 
example : `5s` or `1m` or `1h`

`CONCURRENT` is a number specifying the number to run concurrently, 
example: `10` or `100`

`SENDER` is a email sender location in `FROM:` 
example: `user@mail.com`

`TITLE` is Subject email 
example: `Load test using K6`

## Usage Command Mode Running

```shell
sh exec.sh
```

<img width="858" alt="Screen Shot 2022-06-06 at 21 59 10" src="https://user-images.githubusercontent.com/4769529/172187422-90286649-1144-4553-b5c1-c9e53b5783eb.png">
