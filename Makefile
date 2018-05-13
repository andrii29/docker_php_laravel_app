include .env

.PHONY: up start stop rm

default: up

up:
	docker-compose up -d

start:
	docker-compose exec nginx_php_app bash -c  "cd /opt/ && composer install --prefer-dist --no-interaction --no-dev && chmod -R 777 /opt/storage && chmod -R 777 /opt/bootstrap/cache"
 
down:
	docker-compose stop

rm:
	docker-compose rm


 
 
 
