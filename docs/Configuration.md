# Configuring Bunseki

All configuration in Bunseki is optional. If you supply no configuration values then Bunseki will default to using a SQLite database in the current working directory.

If you're already running MySQL or PostgreSQL on the server you're installing Bunseki on, you'll most likely want to use one of those as your database driver.

To do so, either create a `.env` file in the working directory of your Bunseki application or point Bunseki to your configuration file by specifying the `--config` flag when starting Bunseki.

`
bunseki --config=/home/john/bunseki.env server
`

The default configuration looks like this:

```
BUNSEKI_GZIP=true
BUNSEKI_DEBUG=true
BUNSEKI_DATABASE_DRIVER="sqlite3"
BUNSEKI_DATABASE_NAME="./bunseki.db"
BUNSEKI_DATABASE_USER=""
BUNSEKI_DATABASE_PASSWORD=""
BUNSEKI_DATABASE_HOST=""
BUNSEKI_DATABASE_SSLMODE=""
BUNSEKI_SECRET="random-secret-string"
```

### Accepted values & defaults

| Name | Default | Description
| :---- | :---| :---
| BUNSEKI_DEBUG | `false` | If `true` will write more log messages.
| BUNSEKI_SERVER_ADDR | `:8080` | The server address to listen on
| BUNSEKI_GZIP | `false` | if `true` will HTTP content gzipped
| BUNSEKI_DATABASE_DRIVER | `sqlite3` | The database driver to use: `mysql`, `postgres` or `sqlite3`
| BUNSEKI_DATABASE_NAME |  | The name of the database to connect to (or path to database file if using sqlite3)
| BUNSEKI_DATABASE_USER |  | Database connection user
| BUNSEKI_DATABASE_PASSWORD | | Database connection password
| BUNSEKI_DATABASE_HOST |  | Database connection host
| BUNSEKI_DATABASE_SSLMODE | | For a list of valid values, look [here for Postgres](https://www.postgresql.org/docs/9.1/static/libpq-ssl.html#LIBPQ-SSL-PROTECTION) and [here for MySQL](https://github.com/Go-SQL-Driver/MySQL/#tls)
| BUNSEKI_DATABASE_URL | | Can be used to specify the connection string for your database, as an alternative to the previous 5 settings. 
| BUNSEKI_SECRET |  | Random string, used for signing session cookies

### Common issues

##### Bunseki panics when trying to connect to Postgres: `pq: SSL is not enabled on the server`

This usually means that you're running Postgres without SSL enabled. Set the `BUNSEKI_DATABASE_SSLMODE` config option to remedy this.

```
BUNSEKI_DATABASE_SSLMODE=disable
```

##### Using `BUNSEKI_DATABASE_URL`

When using `BUNSEKI_DATABASE_URL` to manually specify your database connection string, there are a few important things to consider.

- When using MySQL, include `?parseTime=true&loc=Local` in your DSN.
- When using SQLite, include `?_loc=auto` in your DSN.

Examples of valid values:

```
BUNSEKI_DATABASE_DRIVER=mysql
BUNSEKI_DATABASE_URL=root:@tcp/bunseki1?loc=Local&parseTime=true
```
