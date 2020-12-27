#!/bin/sh

# Is the database read to accept connections?
# If the database is not ready to accept connections and this script proceeds regardless, the Docker container will crash.
while ! mysqladmin ping -h"database" --silent; do
  sleep 1
done

# Run all migrations on the database.
alembic upgrade head

# Start the backend...
