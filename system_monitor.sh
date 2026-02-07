#! /bin/bash

# this cript is used to check the system usage using infinate while loop with : ssymbol which makes the loop run
# infinate times along with case statements

while :
do
    #Always clear the screen before the menu is printed"
    clear
    echo "=============================="
    echo "     System Monitor menu      "
    echo "=============================="
    echo "     Select the Options       "
    echo "=============================="
    echo "1.) system disk space df -Th  "
    echo "2.) uptime -a                 "
    echo "3.) Memory Free -h            "
    echo "4.) Exit                      "
    read -p "Select the Option:" userInput
    case $userInput in 
        1)
            echo "The disk space of the server is"
            df -Th
            read -pread -p "Press Enter to continue..."
            ;;
        2)
            echo "Enter the server up time is..."
            uptime 
            read -p "Press Enter to continue..."
            ;;
        3) 
            echo "The server memory is.."
            free -h
            read -p "Press enter to continue..."
            ;;
        4)
            echo "GoodBye!"
            break
            ;;
        *)
            echo "Invalid input!!"
            sleep 2
            ;;
     esac

done

