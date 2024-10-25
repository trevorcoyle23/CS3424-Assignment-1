#!/bin/bash

#update.bash

#read from from vars from main
read -p "Item number: " item_number
read -p "Simple name: " simple_name
read -p "Item name: " item_name
read -p "Current quantity: " current_qty
read -p "Maximum quantity: " max_qty
read -p "Description: " desc

#checks to see if item exists
if [ ! -s $file_name ]; then
    echo "item not found"
    return
fi

#if file does exist, do whatever updates are necessary
file_name="data/${$item_name}.item";
first_line=`head -1 $file_name`
second_line=`awk 'NR==2' $file_name`
third_line=`awk 'NR==3' $file_name`
item=`echo $first_line | awk -F' ' '{print $1}'`
name=`echo $first_line | awk -F' ' '{print $2}'`
qty=`echo $second_line | awk -F' ' '{print $1}'`
max_qty=`echo $second_line | awk -F' ' '{print $2}'`
if [ -z "$simple_name" ]; then
    simple_name=$name
fi
if [ -z "$current_qty" ]; then
    current_qty=$qty
fi
if [-z "$max_qty" ]; then
    max_qty=$max
fi
if [-z "$desc" ]; then
    desc=$third_line
fi

first_row="${simple_name} ${item_name}"
second_row="${current_qty} ${max_qty}"
third_row="${desc}"

echo $first_row > "$file_name"
echo $second_row >> "$file_name"
echo -e $third_row >> "$file_name"
date=`date`
log="UPDATED: ${simple_name} - ${date}"
echo -e $log >> data/queries.log
