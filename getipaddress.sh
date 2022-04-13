#!/bin/bash

# function for get ip address of network interface
function get_ip_by_interface() {
  while read network_interface; do
    echo $network_interface : $(ip a s $network_interface | grep "inet " | cut -d " " -f 6 | cut -d "/" -f 1)
  done < <(ls  /sys/class/net | fmt -1)
}

# call get_ip_by_interface function
get_ip_by_interface | column -t