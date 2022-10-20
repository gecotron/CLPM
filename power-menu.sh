#!/bin/bash

# Get Columns
COLS="$(tput cols)"


# menu text
title="POWER MENU" 
power="⏻  p (power off)" 
rest="⏳ r (reboot)" 
hold="⏸  s (suspend)" 
lock="⏼  l (lock)" 
quit="  q (quit)"
menu="==> "

# Center Menu
printf "\e[1m\e[32m"
printf "%*s\n" $(((${#title}+$COLS)/2)) "$title"
printf "\e[31m"
printf "%*s\n" $(((${#power}+$COLS)/2)) "$power"
printf "%*s\n" $(((${#rest}+$COLS)/2)) "$rest"
printf "%*s\n" $(((${#hold}+$COLS)/2)) "$hold"
printf "%*s\n" $(((${#lock}+$COLS)/2)) "$lock"
printf "%*s\n" $(((${#quit}+$COLS)/2)) "$quit"
printf "\e[0m" 

# read user input
printf "%*s" $(((${#menu}+$COLS)/2)) "$menu"
read -r -n 1 answer
echo

# conditional
if [ "$answer" == "p" ]; then
    systemctl poweroff
elif [ "$answer" == "r" ]; then
    systemctl reboot
elif [ "$answer" == "s" ]; then
    systemctl suspend
elif [ "$answer" == "h" ]; then
    systemctl hibernate
elif [ "$answer" == "l" ]; then
    betterlockscreen -l dim
else
    exit
fi
