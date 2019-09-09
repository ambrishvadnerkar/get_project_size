#!/bin/sh
cd /var/www/html/
L_LOCAL_IP="$(/sbin/ifconfig | grep -A 1 'eth0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)"
L_HOSTNAME="$(hostname)"
L_OUTPUT="$(/usr/bin/du -chs /var/www/html/* | sort -rh)"
L_OUTPUT2="$(/bin/df -h)"

echo $"$L_OUTPUT" $'\n\n================================\nDISK USAGE\n================================\n\n'  "$L_OUTPUT2" | mail -s "Site Size Summary $L_HOSTNAME ($L_LOCAL_IP)" -r "info@devdigital.com" servers@devdigital.com
#du -chs * | sort -rh | mail -s "Site Size Summary $L_HOSTNAME ($L_LOCAL_IP)" -r "info@devdigital.com" servers@devdigital.com
