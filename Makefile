.PHONY: debug start stop logs start-services

build:
	docker build -t myapp .

start:
	docker-compose up -d

stop:
	docker-compose down

logs:
	docker-compose logs -f app

start-services:
	docker compose up -d postgres