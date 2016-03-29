IMAGE_NAME := 'lukz/beanstalkd'

# bins
DOCKER := $(shell which adocker || which docker)

all: build

build:
	${DOCKER} build -t ${IMAGE_NAME}:latest .

build-no-cache:
	${DOCKER} build --rm --no-cache -t ${IMAGE_NAME}:latest .