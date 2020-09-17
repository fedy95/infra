MAKEFLAGS += --silent

.PHONY: *

restart:\grafana:
	docker-compose -f grafana/docker-compose.yml down
	docker-compose -f grafana/docker-compose.yml up -d

restart:\nginx:
	docker-compose -f _reverse-proxy/docker-compose.yml down
	docker-compose -f _reverse-proxy/docker-compose.yml up -d

restart\:all: down\:all up\:all

down\:all:
	docker-compose -f _reverse-proxy/docker-compose.yml down
	docker-compose -f grafana/docker-compose.yml down
	docker-compose -f keeweb/docker-compose.yml down
	docker-compose -f pihole/docker-compose.yml down
	docker-compose -f wiki/docker-compose.yml down

up\:all:
	docker-compose -f grafana/docker-compose.yml up -d
	docker-compose -f keeweb/docker-compose.yml up -d
	docker-compose -f pihole/docker-compose.yml up -d
	docker-compose -f wiki/docker-compose.yml up -d
	docker-compose -f _reverse-proxy/docker-compose.yml up -d

.DEFAULT_GOAL := restart:\nginx
