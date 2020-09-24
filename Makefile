MAKEFLAGS += --silent

.PHONY: *

reload-reverse-proxy:
	docker-compose -f _reverse-proxy/docker-compose.yml exec -T nginx sh -c "nginx -s reload"

restart-reverse-proxy:
	docker-compose -f _reverse-proxy/docker-compose.yml down
	docker-compose -f _reverse-proxy/docker-compose.yml up -d

restart-grafana:
	docker-compose -f grafana/docker-compose.yml down
	docker-compose -f grafana/docker-compose.yml up -d

restart-plex:
	docker-compose -f plex/docker-compose.yml down
	docker-compose -f plex/docker-compose.yml up -d

restart-all: down-all up-all

down-all:
	docker-compose -f _reverse-proxy/docker-compose.yml down
	docker-compose -f grafana/docker-compose.yml down
	docker-compose -f plex/docker-compose.yml down

up-all:
	docker-compose -f plex/docker-compose.yml up -d
	docker-compose -f grafana/docker-compose.yml up -d
	docker-compose -f _reverse-proxy/docker-compose.yml up -d

.DEFAULT_GOAL := reload-reverse-proxy
