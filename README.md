## Init

Clone this rep.

Than:

```
make init
```

To stop docker:

```
make down
```

## Install Laravel

```
make l:install
```

.env settings:

```env
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=developer
DB_PASSWORD=secret
```

### Commands

```
make dc:up
    => docker-compose up -d

make dc:down
    => docker-compose down --remove-orphans
```