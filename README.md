# Disk-Free (1.0 Beta) #

This repository contains the Disk-Free Warning will send an email, when disk use in partition is bigger than threshold.


**How to setup**

Install mail command on CentOS/Redhat:
```
# yum install mailx 
```

Getting shell from repository
```
# wget https://raw.githubusercontent.com/aspirei7/disk-free-warning/master/dfwarning.sh
# chmod +x dfwarning.sh
# mv dfwarning.sh /usr/local/bin/
```

Install new crontab like this.
```
# 00 00 * * * sh /usr/local/bin/dfwarning.sh>>/usr/local/bin/dfwarning.log
```
**In .sh file you can setup your informations.**

Email 
requires enabling outgoing sendmail from localhost to a valid 
smtp server, which is usually disabled by default
```
ADMIN="first@email.com,second@email.com"
```
Threshold
that will send an email, when disk use in partition is bigger than threshold percent.
```
THRESHOLD=90 
```

That work at daily midnight for checking your disk used.

# Report Issues/Bugs #
## [Report](https://github.com/aspirei7/disk-free-warning/issues) ##