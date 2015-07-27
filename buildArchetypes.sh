#!/bin/bash

for i in `ls`; do
  if [[ -d $i ]]; then
    cd $i
    mvn install -B
    cd ..
  fi
done 
