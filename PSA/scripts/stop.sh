#!/bin/bash
#
# stop.sh
#   Created:    18/11/2015
#   Author:     Diego Montero
#
#   Description:
#       This script stops dansguardian and squid3, and clears the configuration environmet.
#
# This script is called by the PSA API when the PSA is requested to be stopped.
#

# Flush iptables
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
ip route flush table 100
echo "flushing routing cache"
ip route flush cache

iptables -t nat -F

# ########################
echo "flusing ebtables"
ebtables -F
ebtables -X
for T in filter nat broute; do   ebtables -t $T -F;   ebtables -t $T -X; done
ebtables -P INPUT ACCEPT
ebtables -P FORWARD ACCEPT
ebtables -P OUTPUT ACCEPT

# #######################
echo "stopping squid3"
service squid3 stop

echo "stopping dansguardian"
service dansguardian stop

echo "PSA Stopped"
exit 1;
