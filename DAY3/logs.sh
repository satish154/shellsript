#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOG_FOLDER
echo "script started executed at $(date)" | tee -a $LOG_FILE

if [ "$USERID" -ne 0 ]; then
    echo -e "${R}Error: Run this script with root privileges ${N}"
    exit 1
fi

validate() {
    if [ "$1" -ne 0 ]; then
        echo -e "${R}Error: Installing $2 failed${N}" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "${G}$2 successfully installed${N}" | tee -a $LOG_FILE
    fi
}

# Check MySQL
dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y $>>$LOG_FILE
    validate $? "mysql"
else
    echo -e "mysql already exists.........${Y}Skipping${N}" 
fi

# Check Nginx

dnf list installed nginx $>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y $>>$LOG_FILE
    validate $? "nginx"
else
    echo -e "nginx already exists.........${Y}Skipping${N}" | tee -a $LOG_FILE
fi