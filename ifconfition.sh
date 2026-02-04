#! /bin/bash 

#if [ condition ]; then
    # Commands to execute if the condition is true
#elif [ another_condition ]; then
    # Commands to execute if the first condition is false and the second is true
#else
    # Commands to execute if none of the conditions are true
##fi

echo "Welcome to the scripting world!!"

read Name

#echo "Weclcome to the bash scripting $Name"
if [ "$Name" == "kotesh" ]; then
    echo "Welcome to the scripting world! $Name"
elif [ "$Name" == "Hemanth" ] || [ "$Name" == "eswar" ]; then
    echo "Welcome to the Linux $Name planning to learn scripting??"
else
    echo "Unknow user trying to access the server!! PLEASE NOTE WILL BE PROSECUTED AS PER THE LAW"
fi    

