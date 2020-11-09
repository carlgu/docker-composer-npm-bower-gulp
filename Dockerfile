# Pull base image.
FROM composer:2.0.4


# Install rsync for deployment
RUN apk add --no-cache \
  rsync \
  bzip2 \
  python2 \
  libmcrypt-dev \
  php7-pecl-mcrypt \
  php7-pdo_mysql \
  php7-curl \
  php7-gd \
  git \
  gnupg \
  --repository http://dl-cdn.alpinelinux.org/alpine/v3.7/main/ nodejs=8.9.3-r1


# Global install gulp and bower
RUN npm set progress=false && \
  npm install -g gulp grunt bower && \
  echo '{ "allow_root": true }' > /root/.bowerrc

# Binary may be called nodejs instead of node
#RUN ln -s /usr/bin/nodejs /usr/bin/node

#RUN apt-get purge -y --auto-remove $buildDeps

# Set correct entrypoint
CMD ["/bin/bash"]
ENTRYPOINT []
