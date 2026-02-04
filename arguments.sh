#! /bin/bash

# Today in this script we are learning about the argument such as
# $1 $2 is when we execute the script we need to passon the arguments example ./script.sh kotesh 27

echo "Welcome to the scripting world!!"
#echo "Name:$1"
#echo "Background:$2"
#inproduction its dangerous when forgot to give variable values some time when we are removing it might delete
#home directory so use as below "${1:-} or ${2:-}"
echo "Name:${1:-unknown user}"
echo "Background:${2:-newbie}"
echo "Welcome to the linux world $1 and you have a solid background $2 you can start scripting when your free"

#if condition

if [ "$1" == "eswar" ]; then
    echo "perfect you learnt the ifconditions"
elif [ "$1" == "kotesh" ] && [ "$2" == "linux" ]; then
    echo "Greate to see $1 you have $2 knowledge"
else
    echo "Unknow user enterd the server safety measures are ON!!!!!!!!!!"
fi
