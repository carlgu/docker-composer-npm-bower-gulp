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
  git \
  gnupg \
  --repository http://dl-cdn.alpinelinux.org/alpine/v3.7/main/ nodejs=8.9.3-r1

# Download PHP Extension installer
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

# Set permissions and install PHP GD extension
RUN chmod +x /usr/local/bin/install-php-extensions && \
    sync && \
    install-php-extensions gd

# Global install gulp and bower
RUN npm set progress=false && \
  npm install -g gulp grunt bower && \
  echo '{ "allow_root": true }' > /root/.bowerrc

# Set correct entrypoint
CMD ["/bin/bash"]
ENTRYPOINT []
