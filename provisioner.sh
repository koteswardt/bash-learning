#! /bin/bash

read -p "Enter Project Name: " PROJ_NAME
while :
do
    clear 
    echo "=========================================="
    echo     "select which type of environment"        
    echo "=========================================="
    echo            "1. Development"
    echo            "2. QA"
    echo            "3. Production"
    echo            "4. Exit"
    read -p "Please select the option➡️  " option

    case $option in
        1)
            echo "Development environment for $PROJ_NAME being provisioned..."
            read -p "Please Enter to contnue..."
        ;;
         
        2)
            echo "QA environment for $PROJ_NAME being provisioned..."
            read -p "Please Enter to contnue..."
        ;;
          
        3)
            echo "Production environment for $PROJ_NAME being provisioned..."
            read -p "Please Enter to contnue..."
        ;;
        4)
            echo "GoodBye..."
            sleep 2
            exit 0
        ;;
        *)
            echo "invalid input..."
            exit 1
        ;;    
     esac

done
