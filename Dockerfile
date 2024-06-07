FROM mysql:5.7
ENV MYSQL_ROOT_PASSWORD=password MSQL_DATABASE=flask-db
COPY CreateTable.sql /docker-entrypoint-initdb.d
