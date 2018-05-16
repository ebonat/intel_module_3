# coding: utf-8 

import sys
from database import DatabaseConnector
import config

def main():
    try:            
        database = DatabaseConnector(config.USER, config.PASSWORD, config.HOST, config.DATABASE) 
        mysql_connect = database.mysql_open_connection()               
        sql = ('INSERT INTO magazine_type (type, description, notes, update_id) VALUES (%s, %s, %s, %s)')             
        paremeters = ('Lunix', 'The Lunix Magazine', 'The Notes', 300)            
        database.mysql_execute_cursor_update(mysql_connect, sql, paremeters)                    
    except:
        exception_message = sys.exc_info()[0]
        print("An error occurred. {}".format(exception_message))
    finally:                     
        database.mysql_close_connection(mysql_connect)
        
if __name__ == '__main__':
    main()