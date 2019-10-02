#! /bin/bash 
#
# Build for docker
# Usage: ./build.sh
#

# We'll need RE-flex if we don't already have it
[ ! -d RE-flex ] && \
     curl -LOk https://github.com/Genivia/RE-flex/archive/master.zip && \
     unzip master.zip && \
     mv RE-flex-master RE-flex && \
     rm master.zip

docker build --tag=reflex .
docker tag reflex michalyoung/cis461:base


