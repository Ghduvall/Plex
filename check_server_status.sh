#!/bin/bash

check_server_status () {

    echo -e "\nChecking server status..."

    if ping -c 1 $ipaddress > /dev/null; then
        echo -e "SERVER IS UP!"
        serverResponse="1"
    else
        echo -e "SERVER IS UNREACHABLE!"
        serverResponse="0"
    fi
}

check_server_status