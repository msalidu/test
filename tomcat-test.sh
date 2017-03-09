#!/bin/bash

URLTEST="http://localhost:8080/.resources/defaultLoginForm/img/logo-magnolia.png"

echo "Sleep 30s (per essere sicuro che il tomcat sia partito)"
sleep 30

START_TIME_FUNCTION=$SECONDS

echo -e "--- START testRunTime: $URLTEST $(date +"%Y-%m-%d_%H-%M-%S") ----------------------------------" 
echo -e "Eseguo testRunTime: $URLTEST  \n" 

TESTPAGE=$(wget -O- -nd  -t 4 -T 120 --delete-after  $URLTEST) 
RETCODE=$?

ELAPSED_TIME_FUNCTION=$(($SECONDS - $START_TIME_FUNCTION))

if [ $RETCODE -ne 0 ]; then
    echo -e "\n KO runtime test $URLTEST" 
    echo -e " --- END testRunTime in $ELAPSED_TIME_FUNCTION seconds [ $(date +"%Y-%m-%d_%H-%M-%S") ] ---------------------------------------------"	  
    exit 1
else
	echo -e "\n OK runtime test.. . $TESTPAGE" 
	echo -e "--- END testRunTime in $ELAPSED_TIME_FUNCTION seconds [ $(date +"%Y-%m-%d_%H-%M-%S") ] ---------------------------------------------"	  
fi

exit 0