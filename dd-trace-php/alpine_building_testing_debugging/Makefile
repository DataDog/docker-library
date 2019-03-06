## Make file use
### create all images for version
#> make 7.2
## produces images based on PHP 7.2 without debug (-vanila), with debug (-debug), with valgrind (-valgrind), with zts (-zts), and with zts debug (-zts-debug)

### create only "without debug" image
## make 7.2-vanila 
### create only "zts with debug" image
## make 7.2-zts-debug #... etc

## Make all images for supported versions
#> make all

## Make and push all images to repository (requires persmission)
#> make all-push

## Supported options
# make <...> Q= # disables quiet mode i.e. verbose build
# make <...> REPO= # build images for repository other than datadog/docker-library

WITH_VALGRIND_SUPPORT = --with-valgrind
WITH_DEBUG = --enable-debug
BUILD_CONTEXT := .
BUILD_DOCKERFILE := Dockerfile
Q=-q
DOCKER_BUILD := docker build $(Q)
DOCKER_EXTRA_QUIET := # > /dev/null 2>&1
DOCKER_BUILD_COMMON_ARGS := -f $(BUILD_DOCKERFILE) $(BUILD_CONTEXT) $(DOCKER_EXTRA_QUIET)
REPO := datadog/docker-library
REPO_PREFIX:= $(REPO):
BASE_IMAGE := $(REPO_PREFIX)ddtrace_alpine_php

%-vanila: TAG="$(BASE_VERSION_TAG)"
%-vanila: %-shared 
	@echo Building $(TAG)
	@$(DOCKER_BUILD) $(VERSION_BUILD_ARGS) $(DOCKER_BUILD_COMMON_ARGS) -t $(TAG) $(DOCKER_EXTRA_QUIET)

%-debug: TAG=$(BASE_VERSION_TAG)-debug
%-debug: %-shared 
	@echo Building $(TAG)
	@$(DOCKER_BUILD) --build-arg php_config_args="--enable-debug" $(VERSION_BUILD_ARGS) -t $(TAG) $(DOCKER_BUILD_COMMON_ARGS)

%-valgrind: TAG=$(BASE_VERSION_TAG)-valgrind
%-valgrind: %-shared
	@echo Building $(TAG)
	@$(DOCKER_BUILD) --build-arg php_config_args="--enable-debug --with-valgrind" $(VERSION_BUILD_ARGS) -t $(TAG) $(DOCKER_BUILD_COMMON_ARGS)

%-zts-debug: TAG=$(BASE_VERSION_TAG)-zts-debug
%-zts-debug: %-shared
	@echo Building $(TAG)
	@$(DOCKER_BUILD) --build-arg php_config_args="--enable-maintainer-zts --enable-debug" $(VERSION_BUILD_ARGS) -t $(TAG) $(DOCKER_BUILD_COMMON_ARGS)

%-zts: TAG=$(BASE_VERSION_TAG)-zts
%-zts: %-shared 
	@echo Building $(TAG)
	@$(DOCKER_BUILD) --build-arg php_config_args="--enable-maintainer-zts" $(VERSION_BUILD_ARGS) -t $(TAG) $(DOCKER_BUILD_COMMON_ARGS)

%-push: %
	@echo Pushing tag $(TAG)
	@docker push $(TAG)

%-push-all: %-vanila-push %-debug-push %-valgrind-push %-zts-debug-push %-zts-push
	@	

%: %-vanila %-debug %-valgrind %-zts-debug %-zts
	@

all: 5.4 5.5 5.6 7.0 7.0 7.1 7.2 7.3
push-all: 5.4-push-all 5.5-push-all 5.6-push-all 7.0-push-all 7.0-push-all 7.1-push-all 7.2-push-all 7.3-push-all

7.3-shared:
	$(eval PHP_VERSION = 7.3.2)
	$(eval PHP_SHA = 010b868b4456644ae227d05ad236c8b0a1f57dc6320e7e5ad75e86c5baf0a9a8)

	$(eval BASE_VERSION_TAG = $(BASE_IMAGE)-7.3)
	$(eval PHP_URL = https://secure.php.net/get/php-$(PHP_VERSION).tar.xz/from/this/mirror)

	$(eval VERSION_BUILD_ARGS = --build-arg php_version=$(PHP_VERSION) --build-arg php_sha=${PHP_SHA} --build-arg php_url=${PHP_URL})

7.2-shared:
	$(eval PHP_VERSION = 7.2.9)
	$(eval PHP_SHA = 3585c1222e00494efee4f5a65a8e03a1e6eca3dfb834814236ee7f02c5248ae0)

	$(eval BASE_VERSION_TAG = $(BASE_IMAGE)-7.2)
	$(eval PHP_URL = https://secure.php.net/get/php-$(PHP_VERSION).tar.xz/from/this/mirror)

	$(eval VERSION_BUILD_ARGS = --build-arg php_version=$(PHP_VERSION) --build-arg php_sha=${PHP_SHA} --build-arg php_url=${PHP_URL})

7.1-shared:
	$(eval PHP_VERSION = 7.1.21)
	$(eval PHP_SHA = d4da6dc69d3fe1e6b2b80f16b262f391037bfeb21213c966e026bd45d7ca2813)

	$(eval BASE_VERSION_TAG = $(BASE_IMAGE)-7.1)
	$(eval PHP_URL = https://secure.php.net/get/php-$(PHP_VERSION).tar.xz/from/this/mirror)

	$(eval VERSION_BUILD_ARGS = --build-arg php_version=$(PHP_VERSION) --build-arg php_sha=${PHP_SHA} --build-arg php_url=${PHP_URL})

7.0-shared:
	$(eval PHP_VERSION = 7.0.33)
	$(eval PHP_SHA = ab8c5be6e32b1f8d032909dedaaaa4bbb1a209e519abb01a52ce3914f9a13d96)

	$(eval BASE_VERSION_TAG = $(BASE_IMAGE)-7.0)
	$(eval PHP_URL = https://secure.php.net/get/php-$(PHP_VERSION).tar.xz/from/this/mirror)

	$(eval VERSION_BUILD_ARGS = --build-arg php_version=$(PHP_VERSION) --build-arg php_sha=${PHP_SHA} --build-arg php_url=${PHP_URL})

5.6-shared:
	$(eval PHP_VERSION = 5.6.40)
	$(eval PHP_SHA = 1369a51eee3995d7fbd1c5342e5cc917760e276d561595b6052b21ace2656d1c)

	$(eval BASE_VERSION_TAG = $(BASE_IMAGE)-5.6)
	$(eval PHP_URL = https://secure.php.net/get/php-$(PHP_VERSION).tar.xz/from/this/mirror)

	$(eval VERSION_BUILD_ARGS = --build-arg alpine_version=3.4 --build-arg php_version=$(PHP_VERSION) --build-arg php_sha=${PHP_SHA} --build-arg php_url=${PHP_URL})

5.5-shared:
	$(eval PHP_VERSION = 5.5.38)
	$(eval PHP_SHA = 473c81ebb2e48ca468caee031762266651843d7227c18a824add9b07b9393e38)

	$(eval BASE_VERSION_TAG = $(BASE_IMAGE)-5.5)
	$(eval PHP_URL = https://secure.php.net/get/php-$(PHP_VERSION).tar.bz2/from/this/mirror)

	$(eval VERSION_BUILD_ARGS = --build-arg alpine_version=3.4 --build-arg php_version=$(PHP_VERSION) --build-arg php_sha=${PHP_SHA} --build-arg php_url=${PHP_URL})


5.4-shared:
	$(eval PHP_VERSION =5.4.39)
	$(eval PHP_SHA = 7ceb76538e709c74533210ae41148d5c01c330ac8a73220954bbc4fcae69d77e)

	$(eval BASE_VERSION_TAG = $(BASE_IMAGE)-5.4)
	$(eval PHP_URL = https://secure.php.net/get/php-$(PHP_VERSION).tar.bz2/from/this/mirror)

	$(eval VERSION_BUILD_ARGS = --build-arg alpine_version=3.4 --build-arg php_version=$(PHP_VERSION) --build-arg php_sha=${PHP_SHA} --build-arg php_url=${PHP_URL})
