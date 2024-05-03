#!/bin/sh

set -e
user=$HOME/Lightworks
allusers=/app/share/lightworks

# Generate DefNetDrives.txt (if there isn't one already)
if [ ! -f $user/Projects/DefNetDrive.txt ];
then
mkdir -p $user/Media
mkdir -p $user/Logs
mkdir -p $user/Projects
mkdir -p $user/Lists
mkdir -p $user/Devices
mkdir -p $user/Databases
cat > $user/Projects/DefNetDrive.txt << EOF
$user/Media/
EOF
fi

# Generate a machine number (if there isn't one already)
if [ ! -f $user/machine.num ];
then
if [ ! -f $allusers/machine.num ];
then
cat > $user/machine.num << EOF
$((`cat /dev/urandom|od -N1 -An -i` % 2500))
EOF
else
cp $allusers/machine.num $user/machine.num
fi
fi

#Launch the app
GDK_BACKEND=x11 GDK_SCALE=1 /app/lib/lightworks/ntcardvt
