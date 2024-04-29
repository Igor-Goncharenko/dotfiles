#!/bin/bash
# hardware_info.sh

MEMORY_TOTAL=$(free -m | grep Mem | awk '{ print $2 }')
MEMORY_USED=$(free -m | grep Mem | awk '{ print $3 }')
MEMORY_USED_PERCENTAGE=$(free -m | grep Mem | awk '{ printf "%.1f", $3/$2 * 100 }')
MEMORY_INFO="󰓅 Memory: ${MEMORY_USED}/${MEMORY_TOTAL} (${MEMORY_USED_PERCENTAGE}%%)"

CPU_LOAD=$(top -b -n1 | grep "Cpu(s)" | awk '{printf "%4.1f", $2 + $4}' )
CPU_TEMP=$(cat /sys/class/thermal/thermal_zone0/temp | awk '{ printf $0 / 1000 }')
CPU_INFO=" CPU: ${CPU_LOAD}%%  ${CPU_TEMP}°C"

HARDWARE_INFO_STR="${MEMORY_INFO}  ${CPU_INFO}"

printf "${HARDWARE_INFO_STR}"

