NAME = m0sth8
BASE_NAME = $(NAME)/base
BASE_PATH = images/base
BASE_VERSION = 0.0.3
UTILS_PATH = images/utils
PLATFORM_PATH = images/platform

build = docker build -t $(NAME)/$(1):$(BASE_VERSION) --rm $(2)/$(1)
tag_latest = docker tag $(NAME)/$(1):$(BASE_VERSION) $(NAME)/$(1):latest 
release = @if ! docker images $(NAME)/$1 | awk '{ print $$2 }' | grep -q -F $(BASE_VERSION); then echo "$(NAME)/$(1) version $(BASE_VERSION) is not yet built. Please run 'make build_$(1)'"; false; fi && docker push $(NAME)/$(1)	

util_build = $(call build,$(1),$(UTILS_PATH))
platform_build = $(call build,$(1),$(PLATFORM_PATH))

all: build_platforms tag_latest_platforms release_platforms build_utils tag_latest_utils release_utils

tag_latest_all: tag_latest_platforms tag_latest_utils

release_all:  release_platforms release_utils

build_platforms: build_golang build_ruby build_python build_phantomjs

release_platforms: release_golang release_phantomjs release_python release_ruby

tag_latest_platforms: tag_latest_golang tag_latest_ruby tag_latest_python tag_latest_phantomjs

build_utils: build_wpscan build_nmap build_w3af

release_utils: release_wpscan release_nmap release_w3af release_wweb 

tag_latest_utils: tag_latest_wpscan tag_latest_nmap tag_latest_w3af tag_latest_wweb

# platforms

# golang
build_golang:
	$(call platform_build,golang)

release_golang:
	$(call release,golang)

tag_latest_golang:
	$(call tag_latest,golang)

# ruby
build_ruby:
	$(call platform_build,ruby)

release_ruby:
	$(call release,ruby)

tag_latest_ruby:
	$(call tag_latest,ruby)

# python
build_python:
	$(call platform_build,python)

release_python:
	$(call release,python)

tag_latest_python:
	$(call tag_latest,python)

# phantomjs

build_phantomjs:
	$(call platform_build,phantomjs)

release_phantomjs:
	$(call release,phantomjs)

tag_latest_phantomjs:
	$(call tag_latest,phantomjs)

# utils

# wpscan
build_wpscan:
	$(call util_build,wpscan)

release_wpscan:
	$(call util_release,wpscan)		

tag_latest_wpscan:
	$(call tag_latest,wpscan)

# nmap
build_nmap:
	$(call util_build,nmap)

tag_latest_nmap:
	$(call tag_latest,nmap)

release_nmap:
	$(call release,nmap)

# w3af
build_w3af:
	$(call util_build,w3af)

tag_latest_w3af:
	$(call util_tag_latest,w3af)

release_w3af:
	$(call util_release,w3af)

# wweb
build_wweb:
	$(call util_build,wweb)

tag_latest_wweb:
	$(call util_tag_latest,wweb)

release_wweb:
	$(call util_release,wweb)


# base
build_base:
	rm -rf base_image
	cp -pR $(BASE_PATH) base_image
	echo ubuntu=trusty >> base_image/buildconfig
	docker build -t $(BASE_NAME):$(BASE_VERSION) --rm base_image
	rm -rf base_image

tag_latest_base:
	docker tag $(BASE_NAME):$(BASE_VERSION) $(BASE_NAME):latest

release_base: tag_latest_base
	@if ! docker images $(BASE_NAME) | awk '{ print $$2 }' | grep -q -F $(BASE_VERSION); then echo "$(BASE_NAME) version $(BASE_VERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(BASE_NAME)
	@echo "*** Don't forget to create a tag. git tag rel-$(BASE_VERSION) && git push origin rel-$(BASE_VERSION)"	
