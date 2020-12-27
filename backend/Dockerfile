FROM python:3.9

COPY . /

# `mysqladmin` contained in `mariadb-client` is helpful to check whether the database is ready to accept connections.
RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-client

RUN pip3 install -r requirements.txt

CMD ["./startup.sh"]
