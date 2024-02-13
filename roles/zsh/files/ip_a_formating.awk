#!/bin/awk
# ip a | awk -f ./test.awk

/^[0-9]:/ { 
  interface = $2
  getline
  if (length($2)==17){
    macaddress = $2
    }
  else {
    macaddress = ""
    }
  getline
  if (length($2)<=18){
    ipaddress = $2
    }
  else {
    ipaddress = ""
    }
  printf "%-17s %-17s %s\n",  interface,ipaddress,macaddress
 }
