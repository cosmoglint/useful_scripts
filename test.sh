#!/bin/sh
if [ $# -ge 1 ]
  then
    if [ $1 == "edit" ]
    then
        action="EDIT: "
    elif [ $1 == "bug" ]
    then
        action="BUG: "
    elif [ $1 == "start" ]
    then
        action="START: "
    elif [ $1 == "stop" ]
    then
        action="STOP: "
    elif [ $1 == "fix" ]
    then
        action="FIX: "
    else
        action="THEN: "
    fi
else
    action="ADD: "
fi


if [ $# -eq 0 ]
then
    read -p "enter commit message: $action" message
else
    message=""
    for x in {2..$#}
        do message+=$x
    done
fi

git add .
git commit -m "$action $message"
git push
