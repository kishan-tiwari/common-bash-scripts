#!/bin/bash

vbox_count=$(VBoxManage list runningvms  | wc -l )
awk_min_count=2
awk_max_count=`expr $awk_min_count + $vbox_count` 


for vinfo in $(vagrant global-status | awk  -v awk_min_count="${awk_min_count}" -v awk_max_count="${awk_max_count}" 'NR > awk_min_count && NR <= awk_max_count { print $1","$NF}'); do 
  vbox_dir=$(echo $vinfo | awk -F "," '{print $2}')
  vbox_id=$(echo  $vinfo | awk -F "," '{print $1}')
  gnome-terminal --command="cd $vbox_dir" --command="vagrant ssh $vbox_id"
done
