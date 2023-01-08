#!/bin/bash
export LOG_FILE='./logs.txt'
exec > >(tee -a ${LOG_FILE}) 2>&1
echo -e '\n\n'
echo $(date +"%Y-%m-%d %H:%M:%s")
pip3 install -r ./requirements.txt
echo "Running python script"
python3 ./run.py
RC1=$? 
if [ ${RC1} == 0 ]
then echo "Successfully finished processing"
else echo "Error occurred: " ${RC1}
fi
