#!/bin/sh

read -p "enter commit message: " message
git add .
git commit -m "$message"
git push
