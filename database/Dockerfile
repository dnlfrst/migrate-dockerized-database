FROM mysql:8.0.22

ENV MYSQL_DATABASE cars
ENV MYSQL_USER developer
ENV MYSQL_PASSWORD 3AMTf?DcXxpczeaUPx2_?tTethw4aFmF
ENV MYSQL_RANDOM_ROOT_PASSWORD TRUE

COPY ./seed.sql /docker-entrypoint-initdb.d/seed.sql

EXPOSE 3306
