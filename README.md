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

## Usage

Running using parameter in command line

### Format :
```shell
sh exec.sh URL DURATION CONCURRENT
```

### Parameters:

`URL` is target website for load test, 
example : `https://www.detik.com` or using path `https://www.detik.com/redaksi`

`DURATION` is a string specifying the total duration of the test run, 
example : `5s` or `1m` or `1h`

`CONCURRENT` is a number specifying the number to run concurrently, 
example: `10` or `100`

## Command Mode Running

```shell
sh exec.sh https://www.detik.com/redaksi 10s 10
```


