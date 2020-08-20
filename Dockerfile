FROM irreverentpixelfeats/dev-base:ubuntu_bionic-20200820012602-784bcad
MAINTAINER Dom De Re <"domdere@irreverentpixelfeats.com">

# Do stuff...

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -y \
  && apt-get install -y yarn

RUN yarn global add bs-platform reason-cli@latest-linux

RUN mkdir -p /var/versions

COPY data/version /var/versions/dev-reasonml
