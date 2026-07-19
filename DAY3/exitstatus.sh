#!/bin/bash
USERID= $(id -u)
if [ $USERID -ne 0 ]; then 
    echo "Error: run this script root privillages"
fi
dnf install nginx -y
if [ $? -ne 0 ]; then 
    echo " error : installing nginx is failed "
else
    echo " succesfully installed "