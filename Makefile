DOCKER_BUILD_IMG := alpinelocale
DOCKER_RUN_NAME  := alpinelocale00
LOCALE_FILE      := /usr/share/i18n/locales/musl/ja_JP.UTF-8

all: help

build: ## docker build ja_JP.UTF-8
	docker build -t $(DOCKER_BUILD_IMG) .
	docker run --name $(DOCKER_RUN_NAME) $(DOCKER_BUILD_IMG)
	docker wait $(DOCKER_RUN_NAME)
	docker cp $(DOCKER_RUN_NAME):$(LOCALE_FILE) .
	docker rm $(DOCKER_RUN_NAME)

run: ## docker run
	docker run --rm -it $(DOCKER_BUILD_IMG)

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: all build run help
