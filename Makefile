NAME = m0sth8
BASE_NAME = $(NAME)/base
BASE_PATH = images/base
BASE_VERSION = 0.0.1
UTILS_PATH = images/utils

util_build = docker build -t $(NAME)/$(1):$(BASE_VERSION) --rm $(UTILS_PATH)/$(1)
util_tag_latest = docker tag $(NAME)/$(1):$(BASE_VERSION) $(NAME)/$(1):latest 
util_release = @if ! docker images $(NAME)/$1 | awk '{ print $$2 }' | grep -q -F $(BASE_VERSION); then echo "$(NAME)/$(1) version $(BASE_VERSION) is not yet built. Please run 'make build_$(1)'"; false; fi && docker push $(NAME)/$(1)	

all: build_all

build_all: build_utils

tag_latest_all: tag_latest_utils

release_all: release_utils


build_utils: build_wpscan build_nmap build_w3af

release_utils: release_wpscan release_nmap release_w3af
	@echo "*** Don't forget to create a tag. git tag rel-$(BASE_VERSION) && git push origin rel-$(BASE_VERSION)"

tag_latest_utils: tag_latest_wpscan tag_latest_nmap tag_latest_w3af

# wpscan
build_wpscan:
	docker build -t $(NAME)/wpscan:$(BASE_VERSION) --rm $(UTILS_PATH)/wpscan

release_wpscan: tag_latest_wpscan
	$(call util_release,wpscan)		

tag_latest_wpscan:
	docker tag $(NAME)/wpscan:$(BASE_VERSION) $(NAME)/wpscan:latest

# nmap
build_nmap:
	$(call util_build,nmap)

tag_latest_nmap:
	$(call util_tag_latest,nmap)

release_nmap:
	$(call util_release,nmap)

# w3af
build_w3af:
	$(call util_build,w3af)

tag_latest_w3af:
	$(call util_tag_latest,w3af)

release_w3af:
	$(call util_release,w3af)

# base
build_base:
	rm -rf base_image
	cp -pR $(BASE_PATH) base_image
	# echo ruby18=1 >> base_image/buildconfig
	# echo ruby19=1 >> base_image/buildconfig
	# echo ruby20=1 >> base_image/buildconfig
	echo ruby21=1 >> base_image/buildconfig
	echo nodejs=1 >> base_image/buildconfig
	echo python=1 >> base_image/buildconfig
	echo final=1 >> base_image/buildconfig	
	docker build -t $(BASE_NAME):$(BASE_VERSION) --rm base_image
	rm -rf base_image

tag_latest_base:
	docker tag $(BASE_NAME):$(BASE_VERSION) $(BASE_NAME):latest

release_base: tag_latest_base
	@if ! docker images $(BASE_NAME) | awk '{ print $$2 }' | grep -q -F $(BASE_VERSION); then echo "$(BASE_NAME) version $(BASE_VERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(BASE_NAME)
	@echo "*** Don't forget to create a tag. git tag rel-$(BASE_VERSION) && git push origin rel-$(BASE_VERSION)"	
