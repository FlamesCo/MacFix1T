#!/bin/bash
## (C) - MaxFit It - F.O.S Repair toolkit for UNIX M1 Users
# This script will fix all m1 partitions and merge them together, then delete the files off of the Linux partition on a Mac.
## ask if it is ran as root
echo "This script will fix all m1 partitions and merge them together, then delete the files off of the Linux partition on a Mac."
echo "Are you sure you want to continue? (y/n)"
## vailidate the user if she/he wants to check for disk errors

read answer
case "$answer" in
  y|Y )
    echo "Starting MacFixit..."
    ;;
  n|N )
    echo "Exiting MacFixit..."
    exit
    ;;
  * )
    echo "Exiting MacFixit..."
    exit
    ;;
esac

# Check for root
 # write a max script that deletes all the gunk from all other partitions accept linux m1 and mac and emrgres the containers
 if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Check for Mac
if [ $(uname -s) != "Darwin" ]; then
   echo "This script must be run on a Mac" 1>&2
   exit 1
fi

# Check for diskutil
if ! [ -x "$(command -v diskutil)" ]; then
  echo "Please install the diskutil command"
  exit 1
fi

# Check for gparted
if ! [ -x "$(command -v gparted)" ]; then
  echo "Please install the gparted command"
  exit 1
fi

# Check for hdiutil
if ! [ -x "$(command -v hdiutil)" ]; then
  echo "Please install the hdiutil command"
  exit 1
fi

# Check for mkfs.hfsplus
if ! [ -x "$(command -v mkfs.hfsplus)" ]; then
  echo "Please install the mkfs.hfsplus command"
  exit 1
fi

# Check for mount
if ! [ -x "$(command -v mount)" ]; then
  echo "Please install the mount command"
  exit 1
fi

# Check for unmount
if ! [ -x "$(command -v unmount)" ]; then
  echo "Please install the unmount command"
  exit 1
fi

# Check for diskutil list
if ! [ -x "$(command -v diskutil list)" ]; then
  echo "Please install the diskutil list command"
  exit 1
fi

# Check for diskutil info
if ! [ -x "$(command -v diskutil info)" ]; then
  echo "Please install the diskutil info command"
  exit 1
fi

# Check for diskutil eject
if ! [ -x "$(command -v diskutil eject)" ]; then
  echo "Please install the diskutil eject command"
  exit 1
fi

# Check for diskutil unmountDisk
if ! [ -x "$(command -v diskutil unmountDisk)" ]; then
  echo "Please install the diskutil unmountDisk command"
  exit 1
fi

# Check for diskutil mount
if ! [ -x "$(command -v diskutil ])" ]; then
  echo "Please install the diskutil mount command"
  exit 1
fi

##  restore the fusion drive to default and ask which drive they want to fix
echo "Restoring the fusion drive to default..."
diskutil unmountDisk /dev/disk0s1
diskutil unmountDisk /dev/disk0s2
diskutil unmountDisk /dev/disk0s3
diskutil unmountDisk /dev/disk0s4
diskutil unmountDisk /dev/disk0s5
## relocate the data back to the first part
echo "Relocating the data back to the first part..."
diskutil unmountDisk /dev/disk0s1
fdisk /dev/rdisk0
echo "Done."