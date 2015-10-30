#!/bin/bash
#
# requires enabling outgoing sendmail from localhost to a valid
# smtp server, which is usually disabled by default
# ADMIN="first@email.com,second@email.com"
# THRESHOLD that will send an email, when disk use in partition is bigger than

ADMIN="manovisut.ktp@gmail.com"
THRESHOLD=20

df -PkH | grep -vE '^Filesystem|tmpfs|cdrom|media' | awk '{ print $5 " " $6 }' | while read output;
do
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1 )
  partition=$(echo $output | awk '{print $2}' )
  if [ $usep -ge $THRESHOLD ]; then

        echo "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">
<html>
<body style=\"padding: 20px; color: #fff; font-weight: normal; background-color: #FFB300; font-family:  sans-serif !important;\">
        <div id=\"container\" style=\"max-width: 600px; margin: auto auto;\">
                <div id=\"logo\" style=\" width: 100%; height: 60px; \"></div>
                <div id=\"content\" style=\"font-weight: 300; font-size: 16px; color: #666; background-color: #fff; padding: 30px;\">
                        <h1 style=\"color: #FFB300; font-size: 2em; font-weight: normal;\">Disk Warning!</h1>
                        <p>Running out of space $partition ($usep%) </p><p>on $(hostname) as on $(date)</p><br/>
                </div>
                <div id=\"contacts\" style=\"padding: 10px; font-size: 12px; letter-spacing: 0.02em;\">
                        <p>SPIN SOFT CO,. LTD.<br/>
                                Incubator, NSTDA.<br/>
                                support@spinsoft.co.th<br/>
                                Phone: (+66) -<br/><br/>
                                Pathum Thani,<br/>
                                Thailand 12120
                        </p>
                </div>
        </div>
</body></html>" | mail -s "$(echo -e "Almost out of disk space\nContent-Type: text/html")" -r "Service<services@spinsoft.co.th>"  $ADMIN
  fi
done
