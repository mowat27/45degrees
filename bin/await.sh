#!/usr/bin/env bash

url=$1
pause=${2:-1}
[[ -z $url ]] && exit 1

while true; do
    curl -s $url 2>&1 >/dev/null
    if [[ $? -eq 0 ]]; then  
        echo ""
        exit 0
    fi 
    echo -n "."
    sleep ${pause}
done

