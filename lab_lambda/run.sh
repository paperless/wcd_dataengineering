#!/bin/bash
export LOG_DIR='./log'
export LOG_FILE='logs.txt'
export CURR_TIME=$(date +"%Y-%m-%d_%H%M%s")
exec > >(tee -a $LOG_DIR/$CURR_TIME-${LOG_FILE}) 2>&1
# activate sandbox
source ./sandbox/bin/activate
echo "Running python script"
python3 ./run.py
RC1=$? 
# if script python succeeded proceed
if [ ${RC1} == 0 ]
then aws s3 cp result.json s3://dianaawsbucketwcd1/input/result.json
else echo "Error occurred in python script: " ${RC1}
fi
RC2=$?
# if all succeeded finish
if [ ${RC2} == 0 ]
then echo "Successfully finished all tasks."
else echo "Error. Could not upload file to s3."
fi
deactivate
