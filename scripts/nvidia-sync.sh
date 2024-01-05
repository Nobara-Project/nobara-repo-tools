#!/bin/bash

# NOTE: This script is for NON-PRODUCTION Nvidia driver branches only: new-feature, beta
# For production branch, place the built rpm files from rpm-sources/appstream/nobara-nvidia-drivers/<driver-version>/RELEASE/$RELEASE
# into $HOME/nobara/appstream/$RELEASE/production/<driver-version> and run appstream-sync.sh instead.

# After building packages from rpm-sources/appstream/nobara-nvidia-drivers/ the resulting rpms are placed in
# rpm-sources/appstream/nobara-nvidia-drivers/<driver-version>/RELEASE/$RELEASE. If they are not production branch
# place them at $HOME/nobara/nvidia/$RELEASE/<branch>/<driver-version> then run this script.

if [ ! $1 ]; then
	echo "Usage: $0 <releasenumber>"
	echo "Ex: $0 39"
	exit 1;
else
	RELEASE="$1"
fi

# MUST FOLLOW STEPS IN HOW-TO-SIGN-PACKAGES BEFORE THIS WILL WORK
for i in $(find $HOME/nobara/nvidia/$RELEASE/ -type f -name '*.rpm'); do
  rpm --resign $i
done

sudo createrepo -v $HOME/nobara/nvidia/$RELEASE/x86_64/
chmod -R 777 $HOME/nobara/nvidia

# Requires buckets to be configured with rclone at $HOME/.config/rclone/rclone.conf
rclone copy $HOME/nobara/nvidia/$RELEASE nobara:nobara-nvidia/$RELEASE --timeout=36000m >/dev/null 2>&1 &
rclone copy $HOME/nobara/nvidia/$RELEASE nobara-linode:nobara-nvidia-linode.nobaraproject.org/$RELEASE --timeout=36000m >/dev/null 2>&1 &
rclone copy $HOME/nobara/nvidia/$RELEASE nobara-do:nobara-nvidia-m1/$RELEASE --timeout=36000m >/dev/null 2>&1 &

