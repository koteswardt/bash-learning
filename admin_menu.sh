#! /bin/bash 
#Here we'll be learning about while and switch loops and cases
while : 
do
    # Clear the screen so that the menu can be clean 
    clear
    echo "=========================================="
    echo "Admin Menu - Week1"
    echo "=========================================="
    echo "Order Item from below Menu Options"
    echo "1. Create New User (Onboard)"
    echo "2. Back Files"
    echo "3. Create Directories"
    echo "4. Exist"

    # Ask for user Input use -p so that user can can enter on the same line as question 
    read -p "select the item" item
    #read the switch case"
    case $item in
    1)
        read -p "Enter the userName" user
        ./onboard.sh "$user"# Calls your script from bash directory
        read -p "Press Enter to Continue..."# Pauses so you can see result
        ;;
    2)
        ./filebackloop.sh      # Calls your backup script
         read -p "Press Enter to continue..."
         ;;
    3)
         read -p "Enter the Number of directories you want to create" numDir
         ./setup_projects.sh "$numDir"
         ;;
    4) 
        echo "GoodBye!"
        break
        ;;
    *)
        echo "Invalid selection"
        sleep 2
        ;;
    esac

done
