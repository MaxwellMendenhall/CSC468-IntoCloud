import mysql.connector
from mysql.connector import Error

config = {
    'user': 'root',
    'password': 'your_root_password',
    'host': '128.105.146.112',
    'port': 3306,
    #  'database': 'your_database',
    'raise_on_warnings': True
}

try:
    # Connect to the MySQL server
    cnx = mysql.connector.connect(**config)
    cursor = cnx.cursor()
    print("Connection was established")

    if cnx.is_connected():
            cursor.close()
            cnx.close()
            print("MySQL connection is closed")
except Error as e:
    print(f"Error: {e}")
