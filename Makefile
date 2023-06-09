#!make
include .env
export $(shell sed 's/=.*//' .env)

default:
	docker run -w /root/ --rm -it test-container

build-all: build-alpine build-alpine318 build-ubuntu

run-alpine:
	docker run --env-file .env -w /root/ --rm -it test-container-alpine
run-alpine318:
	docker run --env-file .env -w /root/ --rm -it test-container-alpine318
run-ubuntu:
	docker run --env-file .env -w /root/ --rm -it test-container-ubuntu

build-alpine:
	docker build $(foreach var,$(shell sed 's/=.*//' .env),--build-arg $(var)=$($(var))) --no-cache -t test-container-alpine - < Dockerfile-alpine
build-alpine318:
	docker build $(foreach var,$(shell sed 's/=.*//' .env),--build-arg $(var)=$($(var))) --no-cache -t test-container-alpine318 - < Dockerfile-alpine318
build-ubuntu:
	docker build $(foreach var,$(shell sed 's/=.*//' .env),--build-arg $(var)=$($(var))) --no-cache -t test-container-ubuntu - < Dockerfile-ubuntu
