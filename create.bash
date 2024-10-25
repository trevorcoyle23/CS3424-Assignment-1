#/bin/bash

#create.bash

#reading from stdin
read -p "Item number: " item_number
read -p "Simple name: " simple_name
read -p "Item name: " item_name
read -p "Current Quantity: " current_qty
read -p "Maximum Quantity: " max_qty
read -p "Description: " desc

first_row="${simple_name} ${item_name}"
second_row="${current_qty} ${max_qty}"
third_row="${desc}"

#checking if file exists
file_name=data/${item_number}.item
if [ -s ${file_name} ]; then
    log="ERROR: item already exists"
    echo -e $log >> data/queries.log

#if it does not we will create it and update the query
else
    echo $first_row > "$file_name"
    echo $second_row >> "$file_name"
    echo -e $third_row >> "$file_name"
    date=`date`
    log="CREATED: ${simple_name} - ${date}"
    echo -e $log >> data/queries.log
fi
