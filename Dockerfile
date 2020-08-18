FROM ubuntu:xenial
MAINTAINER Dom De Re <"domdere@irreverentpixelfeats.com">

# Do stuff...

RUN mkdir -p /var/versions

COPY data/version /var/versions/dev-reasonml
