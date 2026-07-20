#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]; then 
    echo "Error: run this script  with root privillages"
    exit 1 #failure is other than 0
fi
validate(){ #functions receives inputs through args 
    if [ $1 -ne 0 ]; then 
    echo " error : installing $2 is failed "
    exit 1
else
    echo " $2 succesfully installed "
fi
}
dnf install mysql -y
validate $? "mysql"

dnf install nginx -y
validate $? "nginx"
