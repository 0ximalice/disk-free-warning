# Disk-Free (1.0 Beta) #

This repository contains the Disk-Free Warning will send an email, when disk use in partition is bigger than threshold.


**How to setup**

Install mail command on CentOS/Redhat:

```
# yum install mailx 

```

Getting shell from repository
```
# wget https://bitbucket.org/sptpclinux/disk-free-warning/raw/27db65fcbf133cdccd19408b5f54d37f6323dff6/dfwarning.sh
# chmod +x dfwarning.sh
# mv dfwarning.sh /usr/local/bin/

```

Install new crontab like this.
```
# 00 00 * * * sh /usr/local/crontabs/dfwarning.sh>>/usr/local/crontabs/dfwarning.log

```

# Report Issues/Bugs #
## [Issue](https://bitbucket.org/sptspeech-ios/partykit_lib/issues) ##