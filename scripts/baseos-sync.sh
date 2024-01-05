#!/bin/bash

if [ ! $1 ]; then
	echo "Usage: $0 <releasenumber>"
	echo "Ex: $0 39"
	exit 1;
else
	RELEASE="$1"
fi

mkdir -p $HOME/nobara/copr
sudo dnf config-manager --set-enabled nobara-baseos-$RELEASE
sudo dnf config-manager --set-enabled nobara-baseos-multilib-$RELEASE

reposync --repoid=nobara-baseos-$RELEASE -m --download-metadata -p $HOME/nobara/copr --downloadcomps
reposync --repoid=nobara-baseos-multilib-$RELEASE -m --download-metadata -p $HOME/nobara/copr --downloadcomps

sudo dnf config-manager --set-disabled nobara-baseos-$RELEASE
sudo dnf config-manager --set-disabled nobara-baseos-multilib-$RELEASE

createrepo -v $HOME/nobara/copr/nobara-baseos-$RELEASE
createrepo -v $HOME/nobara/copr/nobara-baseos-multilib-$RELEASE

# Requires buckets to be configured with rclone at $HOME/.config/rclone/rclone.conf
rclone copy $HOME/nobara/copr/nobara-baseos-$RELEASE nobara:nobara-baseos/$RELEASE >/dev/null 2>&1 &
rclone copy $HOME/nobara/copr/nobara-baseos-multilib-$RELEASE/ nobara:nobara-baseos-multilib/$RELEASE >/dev/null 2>&1 &

rclone copy $HOME/nobara/copr/nobara-baseos-$RELEASE nobara-linode:nobara-baseos-linode.nobaraproject.org/$RELEASE >/dev/null 2>&1 &
rclone copy $HOME/nobara/copr/nobara-baseos-multilib-$RELEASE/ nobara-linode:nobara-baseos-multilib-linode.nobaraproject.org/$RELEASE >/dev/null 2>&1 &

rclone copy $HOME/nobara/copr/nobara-baseos-$RELEASE nobara-do:nobara-baseos-m1/$RELEASE >/dev/null 2>&1 &
rclone copy $HOME/nobara/copr/nobara-baseos-multilib-$RELEASE/ nobara-do:nobara-baseos-multilib-m1/$RELEASE >/dev/null 2>&1 &

