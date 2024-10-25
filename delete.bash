#!/bin/bash

#delete.bash

#read from main
read -p "Item number: " item_number

file_name=data/${item_number}.item
if [ -s $file_name ]; then
    first_line=`head -1 $file_name`
    name=`echo $first_line | awk -F' ' '{print $2}'`
    rm -f $file_name
    log="DELETED: ${name} - ${date}"
    pwd=`pwd`
    echo -e $log >> data/queries.log

#if nothing is found --error
else
    echo "item not found --error"
fi
