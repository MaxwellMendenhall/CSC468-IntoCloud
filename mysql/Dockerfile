# Use mysql/mysql-server:latest as the base image
FROM mysql/mysql-server:latest

# Set environment variables for MySQL (optional)
ENV MYSQL_ROOT_PASSWORD=root_password
ENV MYSQL_DATABASE=csc468

# Copy the init_db.sql script and cattle_data.csv into the image
COPY init_db.sql /docker-entrypoint-initdb.d/
COPY cattle.csv /var/lib/mysql-files/
