#!/bin/bash
# loop schedule

cat url.txt | while read line 
do
   rm -Rf .env
   cp .env.template .env
   sed -i -e "s|ENV_URL|$line|g" .env
   sh exec.sh
   rm -Rf .env .env-e
   sleep 10
done