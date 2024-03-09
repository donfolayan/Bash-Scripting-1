#!/usr/bin/bash

#Default
n=8
d=false

#Parse CL options
while getopts "n:d" opt;
  do
    if [[ ${opt} == "n" ]]; then
    n=${OPTARG}
    elif [[ ${opt} == "d" ]]; then
    d=true
  fi
done

#shift opt and optarg

shift $((OPTIND -1))
dirs=$@

#checking dir validity
for dir in $dirs
  do
    if [[ ! -s $dir ]]; then
      echo "Directory $dir not valid."
      exit 1
    fi
  done

#check du
for dir in $dirs
  do
    if $d; then
      echo "Disk usuage for $dir:"
      du -ah $dir | sort -hr | head -n $n
    else
      echo "Disk usage for $dir:"
      du -h --max-depth=1 $dir | sort -hr | head -n $n
    fi
  done

