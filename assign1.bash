#!/bin/bash

#assign1.bash

#reading input from user
go=0
while [ $go ]; do
    echo "Enter one of the following actions or press CTRL-D to exit."
    echo "C - create a new item"
    echo "R - read an existing item"
    echo "U - update an existing item"
    echo "D - delete an existing tiem"
    
    #end of input then stored
    if ! read choice; then
        break
    fi

    #input compared using a case statement
    case "$choice" in
        [Cc])
            ./create.bash
            ;;
        [Rr])
            ./read.bash
            ;;
        [Uu])
            ./update.bash
            ;;
        [Dd])
            ./delete.bash
            ;;
        *)
            #invalid choice
            echo "invalid action option --error"
            exit 1
            ;;
    esac
done

