MAKEFLAGS += --silent

.PHONY: *

.DEFAULT_GOAL := restart-all

restart-all: down-all up-all

down-all:
	docker-compose -f gitlab/docker-compose.yml         down
	docker-compose -f grafana/docker-compose.yml        down

up-all:
	docker-compose -f gitlab/docker-compose.yml         up -d
	docker-compose -f grafana/docker-compose.yml        up -d

restart-gitlab:
	docker-compose -f gitlab/docker-compose.yml down
	docker-compose -f gitlab/docker-compose.yml up -d

restart-grafana:
	docker-compose -f grafana/docker-compose.yml down
	docker-compose -f grafana/docker-compose.yml up -d
