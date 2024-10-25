#!/bin/bash

#read.bash

#read number from main
read -p "Item number: " item_number

file_name=data/${item_number}.item

if [ -s $file_name ]; then
    log="ERROR: item not found"
    echo -e $log >> data/queries.log
else
    
        
