#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ "$USERID" -ne 0 ]; then
    echo -e "${R}Error: Run this script with root privileges ${N}"
    exit 1
fi

validate() {
    if [ "$1" -ne 0 ]; then
        echo -e "${R}Error: Installing $2 failed${N}"
        exit 1
    else
        echo -e "${G}$2 successfully installed${N}"
    fi
}

# Check MySQL
dnf list installed mysql 
if [ $? -ne 0 ]; then
    dnf install mysql -y
    validate $? "mysql"
else
    echo -e "mysql already exists.........${Y}Skipping${N}"
fi

# Check Nginx
dnf list installed nginx 
if [ $? -ne 0 ]; then
    dnf install nginx -y
    validate $? "nginx"
else
    echo -e "nginx already exists.........${Y}Skipping${N}"
fi