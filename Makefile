#!/usr/bin/make
# Makefile readme (ru): <https://blog.hook.sh/nix/makefile-full-doc/>
# Makefile readme (en): <https://www.gnu.org/software/make/manual/html_node/index.html#SEC_Contents>

SHELL = /bin/bash

# Image page: <https://hub.docker.com/r/tarampampam/hugo>
HUGO_IMAGE := tarampampam/hugo:0.56.0
RUN_ARGS = --rm -v "$(shell pwd):/src:rw" --user "$(shell id -u):$(shell id -g)"
FRONTEND_PORT := 1313

.PHONY : help pull start new-post clean
.DEFAULT_GOAL : help

help: ## Show this help
	@printf "\033[33m%s:\033[0m\n" 'Available commands'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[32m%-18s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

pull: ## Pull all required Docker images
	docker pull "$(HUGO_IMAGE)"

start: ## Start local hugo live server
	docker run $(RUN_ARGS) -p $(FRONTEND_PORT):$(FRONTEND_PORT) -ti "$(HUGO_IMAGE)" server \
		--watch \
		--logFile /dev/stdout \
		--baseURL 'http://127.0.0.1:$(FRONTEND_PORT)/' \
		--port $(FRONTEND_PORT) \
		--bind 0.0.0.0

.ONESHELL:
new-post: pull ## Make new post (post name must be passed through ENV value)
	@read -p "Enter new post name (like 'category/my-first-post', without '.md' extension): " NEW_POST_NAME
	docker run $(RUN_ARGS) "$(HUGO_IMAGE)" new "$$NEW_POST_NAME.md"
	-gedit "./content/$$NEW_POST_NAME.md" &

clean: ## Make some clean
	-rm -Rf ./public

