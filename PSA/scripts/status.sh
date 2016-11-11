#!/bin/bash
#
# status.sh
#   Created:    18/11/2015
#   Author:     Diego Montero
#   
#   Description:
#       Script that returns the current status of the PSA-dansguardian.
# 
# This script is called by the PSA API when the PSA's runtime status is requested.
# 
# Return value: 
# 1: PSA is alive
# 0: PSA not running correctly.
#
SQUID=squid3
DANSGUARDIAN=dansguardian
if P=$(pgrep $SQUID) && Q=$(pgrep $DANSGUARDIAN)
then
    echo 1
    exit 1
else
    echo 0
    exit 0
fi
