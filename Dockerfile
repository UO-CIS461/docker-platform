# Docker build recipe for Linux image with gcc,
# ReFlex lexical analyzer generator, bison parser generator
# (more later)
#  (Work in progress September 2019, M Young)
#
# Build with:
#   docker build --tag=reflex .
#
FROM ubuntu

# Basic build support
#
RUN apt-get -y update && \
    apt-get -y install build-essential gcc && \
    apt-get -y install autotools-dev && \
    apt-get -y install libtool m4 automake && \
    apt-get -y install autoconf

# Bison is available through apt-get (but Re-Flex is not)
RUN  apt-get -y install bison

# We need to build and install Re-Flex ourself

# Make products of Re-flex build (below) visible to
# the C++ compiler and linker.
#
ENV  LD_LIBRARY_PATH  /usr/local/lib
ENV CPATH /usr/local/include

COPY  RE-flex /usr/src/RE-flex
WORKDIR /usr/src/RE-flex

RUN  ./clean.sh && \
     ./build.sh && \
     ./allinstall.sh

