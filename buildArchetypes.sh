#!/bin/bash

set -e

for i in `ls`; do
  if [[ -d $i ]]; then
    cd $i
    ARCHETYPE_VERSION=`cat pom.xml | grep version | grep SNAPSHOT | sed -e 's/[\<\>]/ /g' | awk '{print $2}'`
    mvn install
    if [[ $? -ne 0 ]]; then exit 1; fi
    mvn install -B -N -Parchetype
    if [[ $? -ne 0 ]]; then exit 2; fi
    cd ..
    mvn archetype:generate -DarchetypeGroupId=com.betfair.cougar.archetypes -DarchetypeArtifactId=simple-service-archetype -DarchetypeVersion=$ARCHETYPE_VERSION -DgroupId=wibble -DartifactId=wibble -Dversion=1.0-SNAPSHOT -Dpackage=wibble -B
    if [[ $? -ne 0 ]]; then exit 3; fi
    cd wibble
    mvn -Prename -Dupper=Wibble -Dlower=wibble install -N 
    if [[ $? -ne 0 ]]; then exit 4; fi
    mvn install
    if [[ $? -ne 0 ]]; then exit 5; fi
    cd ..
  fi
done 
