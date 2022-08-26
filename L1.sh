#!/bin/bash

ip () 
{ 
    if [ "$(uname)" == "Darwin" ]; then
        echo `ipconfig getifaddr en0`;
    else
        echo `hostname -I && systemd-resolve --status | grep 'Current DNS' | awk '{ print \$(NF) }'`;
    fi
}

cv () 
{ 
    if [ -z "$1" ]; then
        echo -e "\nCall 'cv <output-base>' to run this command!";
        echo "where base can be 2, 8, 10 or 16." 1>&2;
    else
        if [ -z "$2" ]; then
            echo -e "\nCall 'cv <output-base> <input-base>' to run this command!";
            echo "where base can be 2, 8, 10 or 16." 1>&2;
        else
            if [ -z "$3" ]; then
                echo -e "\nCall 'cv <output-base> <input-base> <number-to-convert>' to run this command!";
                echo "where base can be 2, 8, 10 or 16." 1>&2;
            else
                echo "obase=$1; ibase=$2; $3" | bc;
            fi;
        fi;
    fi
}

tnet () 
{ 
    if [ -z "$1" ]; then
        echo -e "\nCall 'tnet <ip-or-url>' to run this command!\n";
    else
        if [ -z "$2" ]; then
            echo -e "\nCall 'tnet <ip-or-url> <port>' to run this command!\n";
        else
            echo quit | telnet $1 $2;
        fi;
    fi
}