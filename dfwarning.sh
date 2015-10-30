#!/bin/bash
# 
# requires enabling outgoing sendmail from localhost to a valid 
# smtp server, which is usually disabled by default
# ADMIN="first@email.com,second@email.com"
# THRESHOLD that will send an email, when disk use in partition is bigger than

ADMIN="admin@company.com"
THRESHOLD=80

df -PkH | grep -vE '^Filesystem|tmpfs|cdrom|media' | awk '{ print $5 " " $6 }' | while read output;
do
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1 )
  partition=$(echo $output | awk '{print $2}' )
  if [ $usep -ge $THRESHOLD ]; then
    echo "Running out of space \"$partition ($usep%)\" on $(hostname) as on $(date)" |
    mail -s "Alert: Almost out of disk space $usep%" $ADMIN
  fi
done