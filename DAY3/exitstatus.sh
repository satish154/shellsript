#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]; then 
    echo "Error: run this script root privillages"
    exit 1 #failure is other than 0
fi
dnf install nginx -y
if [ $? -ne 0 ]; then 
    echo " error : installing nginx is failed "
    exit 1
else
    echo " succesfully installed "
fi

dnf install mongodb-mongosh -y
if [ $? -ne 0 ]; then 
    echo " error : installing mongod is failed "
    exit 1
else
    echo " succesfully installed "
fi