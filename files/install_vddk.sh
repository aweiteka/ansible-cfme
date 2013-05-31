#!/usr/bin/env bash

# run unattended vddk install and reboot

if [ -z $1 ] ; then
   echo "Usage: ./`basename $0` <http://localhost/vddk.tar>"
   echo "Argument missing: URL required for VMware-vix-disklib-1.2.2-702422.x86_64.tar"
   exit
fi

VDDK_URL=$1
VDDK_FILE=VMware-vix-disklib.tar

curl -o $VDDK_FILE --url $VDDK_URL --insecure --fail
tar -xvf $VDDK_FILE
cd vmware-vix-disklib-distrib
./vmware-install.pl EULA_AGREED=yes --default --prefix=/usr
ldconfig
reboot

