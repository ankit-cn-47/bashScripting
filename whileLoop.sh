#!/bin/bash
NUM=10
CTR=1

while [ $CTR -le $NUM ]; do
    #echo $CTR
    (( CTR++ ))
done


for (( i=0; i<=10; i++)); do
    echo $i
done