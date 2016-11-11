#!/bin/bash
#
# start.sh
#   Created:    18/11/2015
#   Author:     Diego Montero
#
#   Description:
#       Start script for the PSA-dansguardian
#
# This script is called by the PSA API when the PSA is requested to be started.

# Load PSA's current configuration

##############################################################
#Initializing Squid
service squid3 stop
service dansguardian stop

#squid3 -f /home/psa/pythonScript/psaConfigs/psaconf
squid3 -f /home/psa/etc/squid3/squid.conf

#dansguardian -c /home/psa/etc/dansguardian/dansguardian.conf

###Check the config file an copy it to the proper path
cfile="/home/psa/pythonScript/psaConfigs/psaconf"

if [ -f $cfile ]
then
 cp $cfile /etc/dansguardian/lists/pics
else
 cp /etc/dansguardian/lists/pics.orig /etc/dansguardian/lists/pics
fi
##execute dansguardian
dansguardian

echo "PSA Started"

exit 1;

