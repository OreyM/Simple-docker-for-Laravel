CHDIR_SHELL := $(SHELL)
define chdir
	$(eval _D=$(firstword $(1) $(@D)))
	$(info $(MAKE): cd $(_D)) $(eval SHELL = cd $(_D); $(CHDIR_SHELL))
endef

ifeq (l,$(firstword $(MAKECMDGOALS)))
  ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
endif

ifeq (l:controller,$(firstword $(MAKECMDGOALS)))
  ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
endif

ifeq (l:migration,$(firstword $(MAKECMDGOALS)))
  ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
endif

ifeq (l:model,$(firstword $(MAKECMDGOALS)))
  ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
endif

ifeq (l:observer,$(firstword $(MAKECMDGOALS)))
  ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
endif

ifeq (l:seed,$(firstword $(MAKECMDGOALS)))
  ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
endif

ifeq (l:seed:run,$(firstword $(MAKECMDGOALS)))
  ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
endif

init: dc-down-clear dc-pull dc-build dc-up
up: dc-up
down: dc-down

serve:
	docker-compose up

dc-up:
	docker-compose up -d
dc-down:
	docker-compose down --remove-orphans
dc-down-clear:
	docker-compose down -v --remove-orphans
dc-pull:
	docker-compose pull
dc-build:
	docker-compose build

# LARAVEL
.ONESHELL: # Only applies to all target
l\:install:
	$(call chdir,src)
	rm .gitkeep
	composer create-project laravel/laravel .
	touch .gitkeep
l:
	docker-compose exec php php /var/www/html/artisan $(ARGS)
l\:c:
	docker-compose exec php php /var/www/html/artisan config:cache
l\:cv:
	docker-compose exec php php /var/www/html/artisan config:cache && docker-compose exec php php /var/www/html/artisan view:clear
l\:cr:
	docker-compose exec php php /var/www/html/artisan config:cache && docker-compose exec php php /var/www/html/artisan route:cache
l\:crv:
	docker-compose exec php php /var/www/html/artisan config:cache && docker-compose exec php php /var/www/html/artisan view:clear && docker-compose exec php php /var/www/html/artisan route:cache
l\:controller:
	docker-compose exec php php /var/www/html/artisan make:controller $(ARGS)
l\:fresh:
	docker-compose exec php php /var/www/html/artisan migrate:fresh
l\:refresh:
	docker-compose exec php php /var/www/html/artisan migrate:refresh --seed
l\:migrate:
	docker-compose exec php php /var/www/html/artisan migrate
l\:migrate\:status:
	docker-compose exec php php /var/www/html/artisan migrate:status
l\:migration:
	docker-compose exec php php /var/www/html/artisan make:migration $(ARGS)
l\:model:
	docker-compose exec php php /var/www/html/artisan make:model $(ARGS)
l\:observer:
	docker-compose exec php php /var/www/html/artisan make:observer $(ARGS)
l\:reset:
	docker-compose exec php php /var/www/html/artisan migrate:reset && docker-compose exec php php /var/www/html/artisan migrate --seed
l\:route:
	docker-compose exec php php /var/www/html/artisan route:list
l\:seed:
	docker-compose exec php php /var/www/html/artisan make:seed $(ARGS)
l\:seed\:run:
	docker-compose exec php php /var/www/html/artisan db:seed --class=$(ARGS)
l\:v:
	docker-compose exec php php /var/www/html/artisan --version

%:
	@echo 'completed'