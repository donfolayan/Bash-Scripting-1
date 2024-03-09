#!/usr/bin/bash

#Check arguments

if [ "$#" -ne 2 ]; then
  echo "Usage Format: $0 source_directory destination_directory"
  exit 1
fi


#arguments
src_dir=$1
dest_dir=$2

#check if src exists
if [ ! -d "$src_dir" ]; then
  echo "Source directory does not exist."
  exit 1
fi

#create destination directory
mkdir -p "$dest_dir"

#get datetime
timestamp=$(date '+%Y%m%d%H%M%S')

#create backup
tar -czf "$dest_dir/backup_$timestamp.tar.gz" -C "$src_dir" .

echo "Backup of $src_dir completed at $dest_dir/backup_$timestamp.tar.gz"
