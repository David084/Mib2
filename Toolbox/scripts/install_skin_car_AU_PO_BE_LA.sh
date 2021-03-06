#!/bin/sh
# This script will install car-skin files only for AUDI, BENTLEY, LAMBORGHINI and PORSCHE
# Author:  Olli
#########################################################################################
# Info
export TOPIC=Skinfiles
export MIBPATH=/net/mmx/mnt/app/eso/content.kzb
export TYPE="file"

echo "This script will install $TOPIC"

# Include info script
. /eso/hmi/engdefs/scripts/mqb/util_info.sh

export SDPATH=$TOPIC/$BRAND-Car

# Checkup for brands and if this is the correct script for the brand
if [[ $BRAND == "Volkswagen" || $BRAND == "Skoda" || $BRAND == "Seat" ]]; then
	echo "Wrong brand for this script detected: $BRAND. Aborting"
	exit 0
	
elif [[ $BRAND == "Audi" || $BRAND == "Porsche"  || $BRAND == "Bentley" || $BRAND == "Lamborghini" ]]; then
	echo "Correct brand for this script detected: $BRAND. Moving on..."
	
else
	echo "No brand detected. Aborting"
	exit 0
fi

# Include script to make backup
. /eso/hmi/engdefs/scripts/mqb/util_backup.sh

# Include script to copy file(s)
. /eso/hmi/engdefs/scripts/mqb/util_copy.sh

echo "Done. Now restart the unit."
exit 0
