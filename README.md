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

| Make Commands | Bash Commands |
|---------------|---------------|
| **make up**       | `docker-compose up -d` |
| **make down** | `docker-compose down --remove-orphans` |


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

| Make Commands | Bash Commands |
|---------------|---------------|
