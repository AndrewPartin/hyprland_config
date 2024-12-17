#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
PINK=$(tput setaf 5)
RESET=$(tput sgr0)

BAT_INFO=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0)

PERCENTAGE=$(echo "$BAT_INFO" | grep "percentage:" | awk '{print $2}')
TIME_TO_EMPTY=$(echo "$BAT_INFO" | grep "time to empty:" | awk '{print $4, $5}')
TIME_TO_FULL=$(echo "$BAT_INFO" | grep "time to full:" | awk '{print $4, $5}')
CYCLES=$(echo "$BAT_INFO" | grep "charge-cycles:" | awk '{print $2}')
CAPACITY=$(echo "$BAT_INFO" | grep "capacity:" | awk '{print $2}')

echo "${BLUE}percentage:     ${RESET}$PERCENTAGE"
[ -n "$TIME_TO_EMPTY" ] && echo "${BLUE}time to empty:  ${RESET}$TIME_TO_EMPTY"
[ -n "$TIME_TO_FULL" ] && echo "${BLUE}time to full:   ${RESET}$TIME_TO_FULL"
echo "${RED}charge cycles:  ${RESET}$CYCLES"
echo "${RED}capacity:       ${RESET}$CAPACITY"

