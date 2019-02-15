ARG alpine_version=3.9
FROM alpine:${alpine_version}

# dependencies required for running "phpize"
# these get automatically installed and removed by "docker-php-ext-*" (unless they're already installed)
ENV PHPIZE_DEPS \
		autoconf \
		dpkg-dev dpkg \
		file \
		g++ \
		gcc \
		libc-dev \
		make \
		pkgconf \
		re2c

ENV PHP_INI_DIR /usr/local/etc/php
ENV PHP_CFLAGS "-g -O0 -fPIC"
ENV PHP_CPPFLAGS "$PHP_CFLAGS"
ENV PHP_LDFLAGS "-Wl,-O0 -Wl,--hash-style=both -pie"

COPY docker-php-ext-* docker-php-source /usr/local/bin/

# persistent / runtime deps
RUN set -eux; apk add --no-cache --virtual .persistent-deps \
		ca-certificates \
		curl \
		tar \
		xz \
		;\
	\
	apk add --no-cache --virtual .persistent-test-deps make autoconf gcc g++ git openssh valgrind gdb; \
	\
	# user/group www-data for circleci\
	addgroup -g 3434 -S circleci;\
	adduser -u 3434 -D -S -G circleci -G wheel circleci;\
	\
	apk add --no-cache sudo; \
	sed -e 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' -i /etc/sudoers; \
	adduser circleci wheel; \
	\
	# user/group www-data for apache and nginx setups\
	addgroup -g 82 -S www-data;\
	adduser -u 82 -D -S -G www-data www-data;\
	\
	mkdir -p "$PHP_INI_DIR/conf.d"; \
 	[ ! -d /var/www/html ]; \
 	mkdir -p /var/www/html; \
 	chown www-data:www-data /var/www/html; \
 	chmod 777 /var/www/html

### CircleCI dependencies

RUN set -ex \
	&& export DOCKER_VERSION=$(curl --silent --fail --retry 3 https://download.docker.com/linux/static/stable/x86_64/ | grep -o -e 'docker-[.0-9]*-ce\.tgz' | sort -r | head -n 1) \
	&& DOCKER_URL="https://download.docker.com/linux/static/stable/x86_64/${DOCKER_VERSION}" \
	&& echo Docker URL: $DOCKER_URL \
	&& curl --silent --show-error --location --fail --retry 3 --output /tmp/docker.tgz "${DOCKER_URL}" \
	&& ls -lha /tmp/docker.tgz \
	&& tar -xz -C /tmp -f /tmp/docker.tgz \
	&& mv /tmp/docker/* /usr/bin \
	&& rm -rf /tmp/docker /tmp/docker.tgz \
	&& which docker \
	&& (docker version || true); \
# install docker-compose\
	apk add --no-cache --virtual .persistent-docker-compose python3; \
	pip3 install docker-compose; \
	docker-compose --version; \
# install dockerize\
	DOCKERIZE_URL="https://circle-downloads.s3.amazonaws.com/circleci-images/cache/linux-amd64/dockerize-latest.tar.gz" \
	&& curl --silent --show-error --location --fail --retry 3 --output /tmp/dockerize-linux-amd64.tar.gz $DOCKERIZE_URL \
	&& tar -C /usr/local/bin -xzvf /tmp/dockerize-linux-amd64.tar.gz \
	&& rm -rf /tmp/dockerize-linux-amd64.tar.gz \
	&& dockerize --version

### End CircleCi dependencies

# Shared with PHP flavor part

ARG php_version=7.3.2
ARG php_url=https://secure.php.net/get/php-7.3.2.tar.xz/from/this/mirror
ARG php_sha=010b868b4456644ae227d05ad236c8b0a1f57dc6320e7e5ad75e86c5baf0a9a8
ENV PHP_VERSION=${php_version}
ENV PHP_URL=${php_url}
ENV PHP_SHA256=${php_sha}
ENV PHP_SRC_DIR=/usr/src/php

RUN set -xe; \
	apk add --no-cache --virtual .fetch-deps wget; \
	mkdir -p /usr/src; \
	cd /usr/src; \
	wget -O php.tar.xz "$PHP_URL"; \
	sha256sum php.tar.xz; \
	echo "$PHP_SHA256 *php.tar.xz" | sha256sum -c -; \
	apk del .fetch-deps; \
	docker-php-source extract; \
	cd $PHP_SRC_DIR; \
	cp .gdbinit /home/circleci; cp .gdbinit /root/; \
	cp -v php.ini-* "$PHP_INI_DIR/"; \
	docker-php-source delete;

# Optional ssl configuration
# can be set either to openssl or libressl and openssl-dev and libressl-dev respectively
arg ssl_dep="openssl"
arg ssl_dev_dep="${ssl_dep}-dev"
ENV SSL_DEP ${ssl_dep}
ENV SSL_DEV_DEP ${ssl_dev_dep}

# Compilation variable part
ARG php_config_args=""
ENV PHP_CONFIG_ARGS ${php_config_args}

RUN set -xe;\
	docker-php-source extract; \
	cd $PHP_SRC_DIR; \
	apk add --no-cache --virtual .build-deps \
		$PHPIZE_DEPS \
		coreutils \
		curl-dev \
		libedit-dev \
		libsodium-dev \
		libxml2-dev \
		${SSL_DEV_DEP} \
		sqlite-dev \
		postgresql-dev\
		;\
	\
	export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS"; \ 
	./configure \
		--with-config-file-path="$PHP_INI_DIR" \
		--with-config-file-scan-dir="$PHP_INI_DIR/conf.d" \
	 	--with-mhash --enable-ftp --enable-mbstring --enable-mysqlnd --with-sodium=shared --with-curl --with-libedit \
		$([ -n "$SSL_DEV_DEP" ] && echo --with-openssl || echo --without-openssl ) \
		--with-zlib \
		--enable-fpm \
		--with-fpm-user=www-data \
		--with-fpm-group=www-data \
		--with-pdo-pgsql --with-pdo-mysql \
		--with-mysqli \
		${PHP_CONFIG_ARGS}; \
	\
	make -j "$(nproc)"; \
	make install clean; \
	# docker-php-ext-enable sodium; \
	cd /; \
	docker-php-source delete;\
	export runDeps="$( \
		scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
			| tr ',' '\n' \
			| sort -u \
			| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
	)" \
	echo $runDeps; \
	apk add --no-cache --virtual .php-rundeps $runDeps; \
	\
	apk del .build-deps; \
 	pecl update-channels; \
	\
 	rm -rf /tmp/pear ~/.pearrc; \
	(curl -q https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer | php -- --filename=composer --install-dir=/usr/local/bin)

WORKDIR /home/circleci
USER circleci

CMD [ "sh" ]
