MAKEFLAGS += --silent

.PHONY: *

.DEFAULT_GOAL := restart-all

restart-all: down-all up-all

down-all:
	docker-compose -f gitea/docker-compose.yml          down
	docker-compose -f gitlab/docker-compose.yml         down
	docker-compose -f grafana/docker-compose.yml        down
	docker-compose -f keeweb/docker-compose.yml         down
	docker-compose -f pihole/docker-compose.yml         down
	docker-compose -f plex/docker-compose.yml           down
	docker-compose -f portainer/docker-compose.yml      down
	docker-compose -f wiki/docker-compose.yml           down

up-all:
	docker-compose -f gitea/docker-compose.yml          up -d
	docker-compose -f gitlab/docker-compose.yml         up -d
	docker-compose -f grafana/docker-compose.yml        up -d
	docker-compose -f keeweb/docker-compose.yml         up -d
	docker-compose -f pihole/docker-compose.yml         up -d
	docker-compose -f plex/docker-compose.yml           up -d
	docker-compose -f portainer/docker-compose.yml      up -d
	docker-compose -f wiki/docker-compose.yml           up -d

restart-gitea:
	docker-compose -f gitea/docker-compose.yml down
	docker-compose -f gitea/docker-compose.yml up -d

restart-gitlab:
	docker-compose -f gitlab/docker-compose.yml down
	docker-compose -f gitlab/docker-compose.yml up -d

restart-grafana:
	docker-compose -f grafana/docker-compose.yml down
	docker-compose -f grafana/docker-compose.yml up -d

restart-keeweb:
	docker-compose -f keeweb/docker-compose.yml down
	docker-compose -f keeweb/docker-compose.yml up -d

restart-pihole:
	docker-compose -f pihole/docker-compose.yml down
	docker-compose -f pihole/docker-compose.yml up -d

restart-plex:
	docker-compose -f plex/docker-compose.yml down
	docker-compose -f plex/docker-compose.yml up -d

restart-portainer:
	docker-compose -f portainer/docker-compose.yml down
	docker-compose -f portainer/docker-compose.yml up -d

restart-wiki:
	docker-compose -f wiki/docker-compose.yml down
	docker-compose -f wiki/docker-compose.yml up -d
