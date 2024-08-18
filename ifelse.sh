#!/bin/bash

# if [expression]
# then
#     statement 1
#     statement 2
# else
#     statement 3
# fi

a=14
b=10
if [$a > $b]
then
    echo "a is greater than b"
else
    echo "b is greater than a"
fi
