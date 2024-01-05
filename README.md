bucket-configs:  
rclone.config -- configuration to place at ~/.config/rclone/rclone.conf  

there is an entry for cloudflare, digitalocean, and linode  
You will need to fill in your own keys and endpoints  
we use buckets to host our repositories. scripts/ are used to sync those repositories.  

scripts:  
HOW-TO-SIGN-PACKAGES -- please follow this before using any of the scripts. It is required to perform the steps in this file for signing newly built appstream and nvidia packages.  
appstream-sync.sh -- signs newly built packages, then creates/updates repo at $HOME/nobara/appstream/ and uploads to appstream repo bucket  
nvidia-sync.sh -- signs newly built creates/updates repo at $HOME/nobara/nvidia/ and uploads to nvidia repo bucket  
fedora-sync.sh -- clones fedora repos, removes packages we modify via our copr versions, uploads modified fedora repos to buckets  
baseos-sync.sh -- clones our copr repos, uploads copr repos to buckets  

fedora and baseos(copr) don't need package signing.  
For fedora's packages we don't modify anything, we just remove the packages we replace with copr versions and just clone the fedora-shipped keys for gpg verification on non-removed packages.  
For copr's packages the packages are signed during building on copr and provided to the user via the copr repository that our packages are built in. Again, we just clone these.  

yum.repos.d:  
place these files in /etc/yum.repos.d/ on a fedora system (needed for fedora's repo keys).  

