#!/bin/sh

PROVISION_LIB=/vagrant/provision/lib
PROVISION_DATA=/vagrant/provision/data

. $PROVISION_LIB/provision.sh && provision_load

# set root password
user_passwd root root

# add admin user 
user_add admin
user_passwd admin admin

# prepare APT
apt_prepare

# install base utilities
apt_install vim iputils-ping

# install docker requirements
apt_install docker.io


exit 0
