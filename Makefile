CHDIR_SHELL := $(SHELL)
define chdir
	$(eval _D=$(firstword $(1) $(@D)))
	$(info $(MAKE): cd $(_D)) $(eval SHELL = cd $(_D); $(CHDIR_SHELL))
endef

ifeq (l,$(firstword $(MAKECMDGOALS)))
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
l\:migrate:
	docker-compose exec php php /var/www/html/artisan migrate
l\:v:
	docker-compose exec php php /var/www/html/artisan --version

%:
	@echo 'completed'