#!/bin/bash
export LOG_DIR='./log'
export LOG_FILE='logs.txt'
export CURR_TIME=$(date +"%Y-%m-%d_%H%M%s")
exec > >(tee -a $LOG_DIR/$CURR_TIME-${LOG_FILE}) 2>&1
# echo -e '\n\n'
# echo $CURR_TIME
source sandbox/bin/activate
echo "Running python script"
python3 ./run.py
RC1=$? 
if [ ${RC1} == 0 ]
then echo "Successfully finished processing"
else echo "Error occurred: " ${RC1}
fi
deactivate
