#!/bin/bash

if [ ! $1 ]; then
	echo "Usage: $0 <releasenumber>"
	echo "Ex: $0 39"
	exit 1;
else
	RELEASE="$1"
fi

# MUST FOLLOW STEPS IN HOW-TO-SIGN-PACKAGES BEFORE THIS WILL WORK
for i in $(find $HOME/nobara/appstream/$RELEASE/ -type f -name '*.rpm'); do
  rpm --resign $i
done

sudo createrepo -v $HOME/nobara/appstream/$RELEASE/x86_64/
chmod -R 777 $HOME/nobara/appstream

# Requires buckets to be configured with rclone at $HOME/.config/rclone/rclone.conf
rclone copy $HOME/nobara/appstream/$RELEASE nobara:nobara-appstream/$RELEASE --timeout=36000m >/dev/null 2>&1 &
rclone copy $HOME/nobara/appstream/$RELEASE nobara-linode:nobara-appstream-linode.nobaraproject.org/$RELEASE --timeout=36000m >/dev/null 2>&1 &
rclone copy $HOME/nobara/appstream/$RELEASE nobara-do:nobara-appstream-m1/$RELEASE --timeout=36000m >/dev/null 2>&1 &

