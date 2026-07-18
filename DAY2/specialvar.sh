#!/bin/bash
echo " all variables passe dto the script: $@"
echo  " all variables passe dto the script: $"
echo " script name :$0"
echo " present working directory $PWD"
echo  " who is runnign  : $USER"
echo "home directory : $HOME"
echo "pid of the script :$$"
sleep 50 &
echo " PID of the last command in background is : $!"
