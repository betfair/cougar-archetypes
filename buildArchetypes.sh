#!/bin/bash

set -e

for i in `ls`; do
  if [[ -d $i ]]; then
    cd $i
    ARCHETYPE_VERSION=`cat pom.xml | grep version | grep SNAPSHOT | sed -e 's/[\<\>]/ /g' | awk '{print $2}'`
    mvn install
    mvn install -B -N -Parchetype
    cd ..
    mvn archetype:generate -DarchetypeGroupId=com.betfair.cougar.archetypes -DarchetypeArtifactId=simple-service-archetype -DarchetypeVersion=$ARCHETYPE_VERSION -DgroupId=wibble -DartifactId=wibble -Dversion=1.0-SNAPSHOT -Dpackage=wibble -B
    cd wibble
    mvn -Prename -Dupper=Wibble -Dlower=wibble install -N 
    mvn install
    cd ..
  fi
done 
