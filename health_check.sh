#!/bin/bash

echo "═══ System Health Check ══"
echo "Date: $(date)"
echo "Uptime: $(uptime -p)"
echo ""

echo "══════MEMORY USAGE══════"
free -h
echo ""

echo "══════DISK USAGE══════"
df -h

echo "════TOP 5 CPU PROCESSES════"
ps -eo pid,comm,%mem,%cpu --sort=-%cpu | head -n 6
