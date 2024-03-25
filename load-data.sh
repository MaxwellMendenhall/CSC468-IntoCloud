#!/bin/bash
cp /var/lib/mysql-files/*.csv /tmp/
chown mysql:mysql /tmp/*.csv

# Wait for MySQL to be up
until mysql -h localhost -u root -p"my-secret-pw" -e "SELECT 1" cattledb > /dev/null 2>&1; do
    echo "Waiting for MySQL server..."
    sleep 1
done

echo "MySQL server is up. Inserting data."

# Insert data into MySQL
mysql -h localhost -u root -p"my-secret-pw" cattledb <<EOF
LOAD DATA LOCAL INFILE '/var/lib/mysql-files/cattle_data.csv'
INTO TABLE cattle
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
EOF

echo "Data inserted successfully."
