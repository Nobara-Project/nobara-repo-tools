#!/bin/bash

if [ ! $1 ]; then
	echo "Usage: $0 <releasenumber>"
	echo "Ex: $0 39"
	exit 1;
else
	RELEASE="$1"
fi

mkdir -p $HOME/nobara/official

sudo dnf config-manager --set-enabled fedora-$RELEASE
sudo dnf config-manager --set-enabled fedora-updates-$RELEASE

reposync --repoid=fedora-$RELEASE -m --download-metadata -p $HOME/nobara/official --downloadcomps
reposync --repoid=fedora-updates-$RELEASE -m --download-metadata -p $HOME/nobara/official --downloadcomps

sudo dnf config-manager --set-disabled fedora-$RELEASE
sudo dnf config-manager --set-disabled fedora-updates-$RELEASE

# remove rocm, we provide AMD's official versions
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/r/rocm-*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/r/rocm-*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/r/rocminfo*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/r/rocminfo*

# remove some packages so they dont get picked up in package updaters
# fedora base
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/g/gedit*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/n/nautilus-extensions*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/v/vulkan-headers*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/v/vulkan-loader*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/v/vulkan-tools*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/f/f38-backgrounds-kde*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/n/nautilus-44*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/n/nautilus-devel*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/n/nautilus-extensions*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/k/kde-settings*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/p/plasma-workspace*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/d/dnf-4*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/d/dnf-plugins-core*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/d/dnf-automatic*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/d/dnf-data*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/p/python3-dnf-4*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/y/yum-4*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/g/gnome-control-center*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/m/mesa-libGLU*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/p/plasma-desktop*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/d/dnf-utils*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/p/python3-dnf-plugins-core*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/b/blender*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/l/libkworkspace5*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/m/mesa*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/s/sddm-wayland-plasma*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/s/sddm-breeze*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/m/mutter*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/p/plasma-lookandfeel-fedora*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/p/python3-steam*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/k/kernel-srpm-macros*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/k/kernel-rpm-macros*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/k/kernel-6*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/k/kernel-core*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/k/kernel-debug*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/k/kernel-devel*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/k/kernel-doc*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/k/kernel-headers*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/k/kernel-modules*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/k/kernel-uki*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/d/dnfdaemon*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/f/fedora-repos*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/f/fedora-workstation-repositories*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/f/flatpak-1*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/f/flatpak-lib*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/f/flatpak-selinux*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/f/flatpak-session-helper*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/f/fedora-logos*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/f/fedora-release*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/g/grub-customizer*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/g/gedit*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/g/gamescope*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/m/mangohud*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/n/neofetch*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/s/snap-confine*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/s/setup*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/s/SDL2-*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/w/winetricks*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/w/wine-desktop*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/w/wine-core*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/w/wine*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/x/xorg-x11-server-Xwayland*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/f/fedora-release*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/w/wine-desktop*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/w/wine-core*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/w/wine*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/x/xorg-x11-server-Xwayland*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/g/gdm*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/q/qt-settings*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/s/switcheroo-control*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/h/hipcc*
rm -Rf $HOME/nobara/official/fedora-$RELEASE/Packages/h/hip-devel*

# fedora updates
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/g/gedit*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/n/nautilus-extensions*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/v/vulkan-headers*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/v/vulkan-loader*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/v/vulkan-tools*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/f/f38-backgrounds-kde*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/n/nautilus-44*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/n/nautilus-devel*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/n/nautilus-extensions*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/k/kde-settings*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/p/plasma-workspace*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/d/dnf-4*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/d/dnf-plugins-core*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/d/dnf-automatic*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/d/dnf-data*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/p/python3-dnf-4*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/y/yum-4*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/g/gnome-control-center*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/g/gamescope*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/m/mesa-libGLU*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/p/plasma-desktop*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/d/dnf-utils*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/p/python3-dnf-plugins-core*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/b/blender*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/l/libkworkspace5*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/m/mesa*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/s/sddm-wayland-plasma*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/s/sddm-breeze*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/m/mutter*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/p/plasma-lookandfeel-fedora*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/p/python3-steam*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/k/kernel-srpm-macros*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/k/kernel-rpm-macros*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/k/kernel-6*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/k/kernel-core*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/k/kernel-debug*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/k/kernel-devel*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/k/kernel-doc*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/k/kernel-headers*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/k/kernel-modules*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/k/kernel-uki*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/d/dnfdaemon*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/f/fedora-repos*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/f/fedora-workstation-repositories*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/f/flatpak-1*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/f/flatpak-lib*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/f/flatpak-selinux*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/f/flatpak-session-helper*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/f/fedora-logos*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/f/fedora-release*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/g/grub-customizer*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/g/gedit*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/m/mangohud*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/n/neofetch*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/s/snapd*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/s/snap-confine*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/s/setup*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/s/SDL2-*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/w/winetricks*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/w/wine-desktop*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/w/wine-core*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/w/wine*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/x/xorg-x11-server-Xwayland*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/f/fedora-release*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/w/wine-desktop*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/w/wine-core*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/w/wine*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/x/xorg-x11-server-Xwayland*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/g/gdm*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/q/qt-settings*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/s/switcheroo-control*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/h/hipcc*
rm -Rf $HOME/nobara/official/fedora-updates-$RELEASE/Packages/h/hip-devel*

createrepo -v $HOME/nobara/official/fedora-$RELEASE -g $HOME/nobara/official/fedora-$RELEASE/comps.xml
createrepo -v $HOME/nobara/official/fedora-updates-$RELEASE -g $HOME/nobara/official/fedora-updates-$RELEASE/comps.xml

# Requires buckets to be configured with rclone at $HOME/.config/rclone/rclone.conf
rclone copy $HOME/nobara/official/fedora-$RELEASE/ nobara:nobara-fedora/$RELEASE --timeout=36000m >/dev/null 2>&1 &
rclone copy $HOME/nobara/official/fedora-updates-$RELEASE/ nobara:nobara-fedora-updates/$RELEASE --timeout=36000m >/dev/null 2>&1 &

rclone copy $HOME/nobara/official/fedora-$RELEASE/ nobara-linode:nobara-fedora-linode.nobaraproject.org/$RELEASE --timeout=36000m >/dev/null 2>&1 &
rclone copy $HOME/nobara/official/fedora-updates-$RELEASE/ nobara-linode:nobara-fedora-updates-linode.nobaraproject.org/$RELEASE --timeout=36000m >/dev/null 2>&1 &

rclone copy $HOME/nobara/official/fedora-$RELEASE/ nobara-do:nobara-fedora-m1/$RELEASE --timeout=36000m >/dev/null 2>&1 &
rclone copy $HOME/nobara/official/fedora-updates-$RELEASE/ nobara-do:nobara-fedora-updates-m1/$RELEASE --timeout=36000m >/dev/null 2>&1 &

