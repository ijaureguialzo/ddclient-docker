#!make

help: _header
	${info }
	@echo Opciones:
	@echo ------------------------
	@echo build
	@echo start / stop / restart
	@echo ------------------------
	@echo stats / logs / workspace
	@echo clean
	@echo ------------------------

_header:
	@echo ------------------
	@echo ddclient en Docker
	@echo ------------------

build:
	@docker compose build --pull

start:
	@docker compose up -d --remove-orphans

stop:
	@docker compose stop

restart: stop start

stats:
	@docker stats

logs:
	@docker compose logs ddclient

workspace:
	@docker compose exec ddclient /bin/sh

clean:
	@docker compose down -v --remove-orphans
