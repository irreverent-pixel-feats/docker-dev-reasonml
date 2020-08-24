FROM irreverentpixelfeats/dev-base:ubuntu_bionic-20200824020528-9691a02
MAINTAINER Dom De Re <"domdere@irreverentpixelfeats.com">

ENV NVM_DIR /root/.nvm
ENV NODE_VERSION 12.18.3

ADD etc/yarnpkg-pubkey.gpg /tmp/yarnpkg-pubkey.gpg
ADD etc/nvm-0.35.3-install.sh /tmp/nvm-0.35.3-install.sh
ADD etc/nvm.fish /root/.config/fish/functions/nvm.fish

# Do stuff...
RUN cat /tmp/yarnpkg-pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/v$NODE_VERSION/bin:$PATH

RUN cat /tmp/nvm-0.35.3-install.sh | bash \
  && . $NVM_DIR/nvm.sh \
  && nvm install $NODE_VERSION \
  && nvm alias default $NODE_VERSION \
  && nvm use default \
  && apt-get update -y \
  && apt-get upgrade -y \
  && apt-get dist-upgrade -y \
  && apt-get install --no-install-recommends -y yarn \
  && yarn global add bs-platform reason-cli@latest-linux

RUN mkdir -p /var/versions

COPY data/version /var/versions/dev-reasonml
