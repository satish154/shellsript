#!/bin/bash
NUMBER1=20
NUMBER2=30
NAME=Devops
SUM=$(($NUMBER2+$NUMBER1+$NAME))
echo "sume is : ${SUM}"

#collection of elements is called an array 
LEADERS=("satish" "kumar" "Thota")
echo "one leader: ${LEADERS[@]}"
echo "one leader: ${LEADERS[1]}"
echo "one leader: ${LEADERS[2]}"

