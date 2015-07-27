#!/bin/bash

for i in `ls`; do
  if [[ -d $i ]]; then
    cd $i
    mvn install -B -N -Parchetype
    cd ..
  fi
done 
