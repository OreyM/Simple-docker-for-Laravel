## Init

Clone this rep.

Than:

```
make init
```

## Install Laravel

```
make l:install
```

Open your browser and go to:

```
http://localhost:8088/
```

### Migration

Open .env file and set next settings:

```env
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=developer
DB_PASSWORD=secret
```

Make migration:

```
make l:migrate
```

### Connecting to MySQL database via SQL IDE (TablePlus, Sequel Pro etc.)

MySQL ver. 5.x

local

```
Host: 127.0.0.1
Port: 4306
User: developer
Password: secret
Database: laravel
```

### Commands

#### Docker Commands

| Make Commands     | Bash Commands                          |
|-------------------|----------------------------------------|
| **make up**       | `docker-compose up -d`                 |
| **make down**     | `docker-compose down --remove-orphans` |
| **make serve**    | `docker-compose up`                    |


#### Composer Commands

| Make Commands                             | Bash Commands                                                                   |
|-------------------------------------------|---------------------------------------------------------------------------------|
| **make c:require PACKAGE_NAME**           | `composer require PACKAGE_NAME`                                                 |
| **make c:require:dev PACKAGE_NAME**       | `composer require PACKAGE_NAME --dev`                                           |


#### Laravel Commands

Universal command to call artisan commands:

```
make l ARTISAN_COMMAND
```

for example:

```bash
make l migrate # php artisan migrate
make l migrate:refresh # php artisan migrate:refresh
```

> BUT! If your want to add arg '--', for example '--seed', '--model' and etc., the artisan command must be enclosed in quotes:
> 
> ```bash
> make l 'migrate:refresh --seed' # php artisan migrate:refresh --seed
> ```

| Make Commands                             | Bash Commands                                                                   |
|-------------------------------------------|---------------------------------------------------------------------------------|
| **make l:c**                              | `php artisan config:cache`                                                      |
| **make l:cv**                             | `php artisan config:cache && php artisan view:clear`                            |
| **make l:cr**                             | `php artisan config:cache && php artisan route:cache`                           |
| **make l:crv**                            | `php artisan config:cache && php artisan view:clear && php artisan route:cache` |
| **make l:controller CONTROLLER_NAME**     | `php artisan make:controller`                                                   |
| **make l:factory FACTORY model=MODEL**    | `php artisan make:factory FACTORY --model=MODEL`                                |
| **make l:fresh**                          | `php artisan migrate:fresh`                                                     |
| **make l:refresh**                        | `php artisan migrate:refresh --seed`                                            |
| **make l:migrate**                        | `php artisan migrate`                                                           |
| **make l:migrate:status**                 | `php artisan migrate:status`                                                    |
| **make l:migration MIGRATION_NAME**       | `php artisan make:migration`                                                    |
| **make l:model MODEL_NAME**               | `php artisan make:model`                                                        |
| **make l:observer OBSERVER_NAME**         | `php artisan make:observer`                                                     |
| **make l:reset**                          | `php artisan migrate:reset && php artisan migrate --seed`                       |
| **make l:route**                          | `php artisan route:list`                                                        |
| **make l:seed SEED_NAME**                 | `php artisan make:seed`                                                         |
| **make l:seed:run SEED_CLASS_NAME**       | `php artisan db:seed --class=`                                                  |
| **make l:v**                              | `php artisan --version`                                                         |

