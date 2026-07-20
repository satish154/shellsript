#!/bin/bash
echo -e "$G hello world $N"
echo " check this color "

USERID=$(id -u)
R="\e[33m"
G="\e[32m"
N="\e[0m"
if [ $USERID -ne 0 ]; then 
    echo "Error: run this script  with root privillages"
    exit 1 #failure is other than 0
fi
validate(){ #functions receives inputs through args 
    if [ $1 -ne 0 ]; then 
    echo -e " error : installing $2 is failed "
    exit 1
else
    echo  -e " $2 $G succesfully installed $n"
fi
}
dnf list installed mysql
if ($? -ne 0); then 
    dnf install mysql -y
    validate $? "mysql"
else
    echo -e " mysql already exists.........$Y Skipping $N"
fi

dnf list installed nginx
    if ($? -ne 0); then 
    dnf install nginx -y
    validate $? "nginx"
else
    echo -e " nginx already exists.........$Y Skipping $N"
fi
