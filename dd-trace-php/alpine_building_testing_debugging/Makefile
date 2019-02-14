
.PHONY=all 7.3
WITH_VALGRIND_SUPPORT = --with-valgrind
WITH_DEBUG = --enable-debug
BUILD_CONTEXT := .
BUILD_DOCKERFILE := Dockerfile


.PHONY = $(.PHONY) 7.3-shared 7.3-vanila 7.3-debug 7.3-valgrind
7.3-shared:
	$(eval TAG = alpine_php_7.3.2)
	$(eval PHP_VERSION = 7.3.2)
	$(eval PHP_URL = https://secure.php.net/get/php-7.3.2.tar.xz/from/this/mirror)
	$(eval PHP_SHA = 010b868b4456644ae227d05ad236c8b0a1f57dc6320e7e5ad75e86c5baf0a9a8)

	$(eval VERSION_BUILD_ARGS = --build-arg php_version=$(PHP_VERSION) --build-arg php_sha=${PHP_SHA} --build-arg php_url=${PHP_URL})

%-vanila: %-shared
	docker build ${VERSION_BUILD_ARGS} -f $(BUILD_DOCKERFILE) $(BUILD_CONTEXT) -t $(TAG)

%-debug: %-shared
	docker build --build-arg php_config_args="--enable-debug" ${VERSION_BUILD_ARGS} -f $(BUILD_DOCKERFILE) $(BUILD_CONTEXT) -t $(TAG):debug

%-valgrind: %-shared
	docker build --build-arg php_config_args="--enable-debug --with-valgrind" ${VERSION_BUILD_ARGS} -f $(BUILD_DOCKERFILE) $(BUILD_CONTEXT) -t $(TAG):valgrind

%-zts-debug: %-shared
	docker build --build-arg php_config_args="--enable-maintainer-zts --enable-debug" ${VERSION_BUILD_ARGS} -f $(BUILD_DOCKERFILE) $(BUILD_CONTEXT) -t $(TAG):zts-debug

%-zts: %-shared
	docker build --build-arg php_config_args="--enable-maintainer-zts" ${VERSION_BUILD_ARGS} -f $(BUILD_DOCKERFILE) $(BUILD_CONTEXT) -t $(TAG):zts-debug

%: %-vanila %-debug %-valgrind %-zts-debug %-zts
	@

.PHONY = $(.PHONY) 7.2-shared 7.2 7.2-debug 7.2-valgirnd %-all

7.2-shared:
	$(eval TAG = alpine_php_7.2.9)
	$(eval PHP_VERSION = 7.2.9)
	$(eval PHP_URL = https://secure.php.net/get/php-7.2.9.tar.xz/from/this/mirror)
	$(eval PHP_SHA = 3585c1222e00494efee4f5a65a8e03a1e6eca3dfb834814236ee7f02c5248ae0)

	$(eval VERSION_BUILD_ARGS = --build-arg php_version=$(PHP_VERSION) --build-arg php_sha=${PHP_SHA} --build-arg php_url=${PHP_URL})

7.1-shared:
	$(eval TAG = alpine_php_7.1.21)
	$(eval PHP_VERSION = 7.1.21)
	$(eval PHP_URL = https://secure.php.net/get/php-7.1.21.tar.xz/from/this/mirror)
	$(eval PHP_SHA = d4da6dc69d3fe1e6b2b80f16b262f391037bfeb21213c966e026bd45d7ca2813)

	$(eval VERSION_BUILD_ARGS = --build-arg php_version=$(PHP_VERSION) --build-arg php_sha=${PHP_SHA} --build-arg php_url=${PHP_URL})

7.0-shared:
	$(eval TAG = alpine_php_7.0.33)
	$(eval PHP_VERSION = 7.0.33)
	$(eval PHP_URL = https://secure.php.net/get/php-7.0.33.tar.xz/from/this/mirror)
	$(eval PHP_SHA = ab8c5be6e32b1f8d032909dedaaaa4bbb1a209e519abb01a52ce3914f9a13d96)

	$(eval VERSION_BUILD_ARGS = --build-arg php_version=$(PHP_VERSION) --build-arg php_sha=${PHP_SHA} --build-arg php_url=${PHP_URL})

5.6-shared:
	$(eval TAG = alpine_php_5.6.40)
	$(eval PHP_VERSION = 5.6.40)
	$(eval PHP_URL = https://secure.php.net/get/php-5.6.40.tar.xz/from/this/mirror)
	$(eval PHP_SHA = 1369a51eee3995d7fbd1c5342e5cc917760e276d561595b6052b21ace2656d1c)

	$(eval VERSION_BUILD_ARGS = --build-arg php_version=$(PHP_VERSION) --build-arg php_sha=${PHP_SHA} --build-arg php_url=${PHP_URL})


5.4-shared:
	$(eval TAG = alpine_php_5.4.39)
	$(eval PHP_VERSION =5.4.39)
	$(eval PHP_URL = https://secure.php.net/get/php-5.4.39.tar.bz2/from/this/mirror)
	$(eval PHP_SHA = 7ceb76538e709c74533210ae41148d5c01c330ac8a73220954bbc4fcae69d77e)

	$(eval VERSION_BUILD_ARGS = --build-arg php_version=$(PHP_VERSION) --build-arg php_sha=${PHP_SHA} --build-arg php_url=${PHP_URL})

