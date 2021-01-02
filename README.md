# Migrating a dockerized MySQL database with SQLAlchemy and Alembic in Python

This is a minimal repository that showcases the migration (i.e., alteration of data models in a (MySQL) database) of a dockerized MySQL database using SQLAlchemy and Alembic in Python. For an in-depth explanation, refer to the corresponding blog post on [dev.to]().

## Running the Application

Simply execute the following command in a terminal:

```bash
docker-compose -p mysql-migration up --build
```

After the creation of the database, the backend executes the migration which should produce an output similar to the following:

<details>
<summary>Terminal</summary>

```bash
database_1  | 2021-01-02 15:10:20+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.0.22-1debian10 started.
database_1  | 2021-01-02 15:10:21+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
database_1  | 2021-01-02 15:10:21+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.0.22-1debian10 started.
database_1  | 2021-01-02 15:10:21+00:00 [Note] [Entrypoint]: Initializing database files
database_1  | 2021-01-02T15:10:21.128699Z 0 [System] [MY-013169] [Server] /usr/sbin/mysqld (mysqld 8.0.22) initializing of server in progress as process 46
database_1  | 2021-01-02T15:10:21.134926Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
database_1  | 2021-01-02T15:10:21.710354Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
database_1  | 2021-01-02T15:10:23.162961Z 6 [Warning] [MY-010453] [Server] root@localhost is created with an empty password ! Please consider switching off the --initialize-insecure option.
database_1  | 2021-01-02 15:10:26+00:00 [Note] [Entrypoint]: Database files initialized
database_1  | 2021-01-02 15:10:26+00:00 [Note] [Entrypoint]: Starting temporary server
database_1  | 2021-01-02T15:10:26.486959Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.0.22) starting as process 91
database_1  | 2021-01-02T15:10:26.531262Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
database_1  | 2021-01-02T15:10:26.855056Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
database_1  | 2021-01-02T15:10:27.008074Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Socket: /var/run/mysqld/mysqlx.sock
database_1  | 2021-01-02T15:10:27.264832Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
database_1  | 2021-01-02T15:10:27.265078Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
database_1  | 2021-01-02T15:10:27.268176Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
database_1  | 2021-01-02T15:10:27.315866Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.0.22'  socket: '/var/run/mysqld/mysqld.sock'  port: 0  MySQL Community Server - GPL.
database_1  | 2021-01-02 15:10:27+00:00 [Note] [Entrypoint]: Temporary server started.
database_1  | Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
database_1  | Warning: Unable to load '/usr/share/zoneinfo/leap-seconds.list' as time zone. Skipping it.
database_1  | Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
database_1  | Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.
database_1  | 2021-01-02 15:10:31+00:00 [Note] [Entrypoint]: GENERATED ROOT PASSWORD: buH0nai4ahz5ahdoh2phiXah7Chasha1
database_1  | 2021-01-02 15:10:31+00:00 [Note] [Entrypoint]: Creating database cars
database_1  | 2021-01-02 15:10:31+00:00 [Note] [Entrypoint]: Creating user developer
database_1  | 2021-01-02 15:10:31+00:00 [Note] [Entrypoint]: Giving user developer access to schema cars
database_1  | 
database_1  | 2021-01-02 15:10:31+00:00 [Note] [Entrypoint]: /usr/local/bin/docker-entrypoint.sh: running /docker-entrypoint-initdb.d/seed.sql
database_1  | 
database_1  | 
database_1  | 2021-01-02 15:10:31+00:00 [Note] [Entrypoint]: Stopping temporary server
database_1  | 2021-01-02T15:10:31.155633Z 14 [System] [MY-013172] [Server] Received SHUTDOWN from user root. Shutting down mysqld (Version: 8.0.22).
database_1  | 2021-01-02T15:10:32.783543Z 0 [System] [MY-010910] [Server] /usr/sbin/mysqld: Shutdown complete (mysqld 8.0.22)  MySQL Community Server - GPL.
database_1  | 2021-01-02 15:10:33+00:00 [Note] [Entrypoint]: Temporary server stopped
database_1  | 
database_1  | 2021-01-02 15:10:33+00:00 [Note] [Entrypoint]: MySQL init process done. Ready for start up.
database_1  | 
database_1  | 2021-01-02T15:10:33.394614Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.0.22) starting as process 1
database_1  | 2021-01-02T15:10:33.402355Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
database_1  | 2021-01-02T15:10:33.602351Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
database_1  | 2021-01-02T15:10:33.711959Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Bind-address: '::' port: 33060, socket: /var/run/mysqld/mysqlx.sock
database_1  | 2021-01-02T15:10:33.787515Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
database_1  | 2021-01-02T15:10:33.787710Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
database_1  | 2021-01-02T15:10:33.790638Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
database_1  | 2021-01-02T15:10:33.815348Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.0.22'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.
database_1  | mbind: Operation not permitted
backend_1   | INFO  [alembic.runtime.migration] Context impl MySQLImpl.
backend_1   | INFO  [alembic.runtime.migration] Will assume non-transactional DDL.
backend_1   | INFO  [alembic.runtime.migration] Running upgrade  -> 9669e7426172, Add Car's Horsepower
mysql-migration_backend_1 exited with code 0
```
</details>

## Inspecting the Data Model

After bringing up the Docker containers, you can verify the successful migration by connecting to the database and inspecting the table `Car`. In addition to the columns `ID`, `Manufacturer`, and `Model`, there is now also a column `Horsepower` which we created as part of [the migration](https://github.com/dnlfrst/migrate-dockerized-database/blob/7866a2abd81992779cff6bbafcefb85051b03823/backend/migrations/versions/9feec6f6f0c4_add_car_s_horse_power.py#L20).
