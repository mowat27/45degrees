# Must be first in the file
default: clean-start init wp-admin

# Targets used for config and installation
.env:
	bin/install.sh

.PHONY: install
install: .env
	docker-compose pull 

.PHONY: init
init:
	docker-compose exec wordpress /usr/share/code/bin/init.sh

.PHONY: build
build:
	docker-compose build wordpress

# Targets used to start and stop the app
.PHONY: up
up: .env
	docker-compose up 

.PHONY: start
start: .env
	docker-compose up -d 
	bin/await.sh http://localhost:8080

.PHONY: down
down: 
	docker-compose down

.PHONY: prune
prune: down
	docker volume prune -f

.PHONY: clean-start
clean-start: down prune build start

# Targets used when working on the app
.PHONY: bash
bash:
	docker-compose exec wordpress bash

.PHONY: sh
sh: bash

.PHONY: web
web:
	open http://localhost:8080

.PHONY: wp-admin
wp-admin:
	open http://localhost:8080/wp-admin
