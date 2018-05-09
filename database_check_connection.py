import mysql.connector

def main():
    config = {
    'user': 'root',
    'password': 'your_password',
    'host': '127.0.0.1',
    'database': 'magazine',
    'raise_on_warnings': True,
    }
    mysql_connector = mysql.connector.connect(**config)
    if (mysql_connector.is_connected()):
        print("YES Connection!")
        mysql_connector.close()
    else:
        print("NO Connection!")

if __name__ == '__main__':
    print(mysql.connector.__version__)
    main()