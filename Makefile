init: docker-down-clear docker-pull docker-build docker-up
up: docker-up
down: docker-down

docker-up:
	docker-compose up -d
docker-down:
	docker-compose down --remove-orphans
docker-down-clear:
	docker-compose down -v --remove-orphans
docker-pull:
	docker-compose pull
docker-build:
	docker-compose build

# LARAVEL
l\:intall:
	cd src
	composer create-project laravel/laravel .
	cd ..
l\:migrate:
	docker-compose exec php php /var/www/html/artisan migrate