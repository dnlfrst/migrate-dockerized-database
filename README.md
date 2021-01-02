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
mysql-migration_database | 2021-01-02 11:54:12+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.0.22-1debian10 started.
mysql-migration_database | 2021-01-02 11:54:12+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
mysql-migration_database | 2021-01-02 11:54:12+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.0.22-1debian10 started.
mysql-migration_database | 2021-01-02 11:54:12+00:00 [Note] [Entrypoint]: Initializing database files
mysql-migration_database | 2021-01-02T11:54:12.408925Z 0 [System] [MY-013169] [Server] /usr/sbin/mysqld (mysqld 8.0.22) initializing of server in progress as process 45
mysql-migration_database | 2021-01-02T11:54:12.414030Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
mysql-migration_database | 2021-01-02T11:54:13.185594Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
mysql-migration_database | 2021-01-02T11:54:15.864960Z 6 [Warning] [MY-010453] [Server] root@localhost is created with an empty password ! Please consider switching off the --initialize-insecure option.mysql-migration_database | 2021-01-02 11:54:20+00:00 [Note] [Entrypoint]: Database files initialized
mysql-migration_database | 2021-01-02 11:54:20+00:00 [Note] [Entrypoint]: Starting temporary server
mysql-migration_database | 2021-01-02T11:54:20.633655Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.0.22) starting as process 90
mysql-migration_database | 2021-01-02T11:54:20.654049Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
mysql-migration_database | 2021-01-02T11:54:20.836966Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
mysql-migration_database | 2021-01-02T11:54:20.946785Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Socket: /var/run/mysqld/mysqlx.sock
mysql-migration_database | 2021-01-02T11:54:21.118201Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
mysql-migration_database | 2021-01-02T11:54:21.118396Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
mysql-migration_database | 2021-01-02T11:54:21.122951Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
mysql-migration_database | 2021-01-02T11:54:21.139846Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.0.22'  socket: '/var/run/mysqld/mysqld.sock'  port: 0  MySQL Community Server - GPL.
mysql-migration_database | 2021-01-02 11:54:21+00:00 [Note] [Entrypoint]: Temporary server started.
mysql-migration_database | Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
mysql-migration_database | Warning: Unable to load '/usr/share/zoneinfo/leap-seconds.list' as time zone. Skipping it.
mysql-migration_database | Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
mysql-migration_database | Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.
mysql-migration_database | 2021-01-02 11:54:23+00:00 [Note] [Entrypoint]: GENERATED ROOT PASSWORD: IepahPoh3Xub2unguMoar0aicohB9ahd
mysql-migration_database | 2021-01-02 11:54:23+00:00 [Note] [Entrypoint]: Creating database cars
mysql-migration_database | 2021-01-02 11:54:24+00:00 [Note] [Entrypoint]: Creating user developer
mysql-migration_database | 2021-01-02 11:54:24+00:00 [Note] [Entrypoint]: Giving user developer access to schema cars
mysql-migration_database | 
mysql-migration_database | 2021-01-02 11:54:24+00:00 [Note] [Entrypoint]: /usr/local/bin/docker-entrypoint.sh: running /docker-entrypoint-initdb.d/seed.sql
mysql-migration_database |
mysql-migration_database |
mysql-migration_database | 2021-01-02 11:54:24+00:00 [Note] [Entrypoint]: Stopping temporary server
mysql-migration_database | 2021-01-02T11:54:24.191434Z 14 [System] [MY-013172] [Server] Received SHUTDOWN from user root. Shutting down mysqld (Version: 8.0.22).
mysql-migration_database | 2021-01-02T11:54:26.222404Z 0 [System] [MY-010910] [Server] /usr/sbin/mysqld: Shutdown complete (mysqld 8.0.22)  MySQL Community Server - GPL.
mysql-migration_database | 2021-01-02 11:54:27+00:00 [Note] [Entrypoint]: Temporary server stopped
mysql-migration_database |
mysql-migration_database | 2021-01-02 11:54:27+00:00 [Note] [Entrypoint]: MySQL init process done. Ready for start up.
mysql-migration_database |
mysql-migration_database | 2021-01-02T11:54:27.434212Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.0.22) starting as process 1
mysql-migration_database | 2021-01-02T11:54:27.445186Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
mysql-migration_database | 2021-01-02T11:54:27.602223Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
mysql-migration_database | 2021-01-02T11:54:27.702788Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Bind-address: '::' port: 33060, socket: /var/run/mysqld/mysqlx.sock
mysql-migration_database | 2021-01-02T11:54:27.818436Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
mysql-migration_database | 2021-01-02T11:54:27.818613Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
mysql-migration_database | 2021-01-02T11:54:27.822875Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
mysql-migration_database | 2021-01-02T11:54:27.839703Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.0.22'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.
mysql-migration_database | mbind: Operation not permitted
mysql-migration_backend | INFO  [alembic.runtime.migration] Context impl MySQLImpl.
mysql-migration_backend | INFO  [alembic.runtime.migration] Will assume non-transactional DDL.
mysql-migration_backend | INFO  [alembic.runtime.migration] Running upgrade  -> 9feec6f6f0c4, Add Car's Horse Power
mysql-migration_backend exited with code 0
```
</details>

## Inspecting the Data Model

After bringing up the Docker containers, you can verify the successful migration by connecting to the database and inspecting the table `Car`. In addition to the columns `ID`, `Manufacturer`, and `Model`, there is now also a column `Horse Power` which we created as part of [the migration](https://github.com/dnlfrst/migrate-dockerized-database/blob/7866a2abd81992779cff6bbafcefb85051b03823/backend/migrations/versions/9feec6f6f0c4_add_car_s_horse_power.py#L20).
