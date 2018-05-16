# coding: utf-8 

import sys
from database import DatabaseConnector
import config

def main():
    try:             
        database = DatabaseConnector(config.USER, config.PASSWORD, config.HOST, config.DATABASE) 
        mysql_connect = database.mysql_open_connection()         
        sql = ("UPDATE magazine_type SET type = %s , description = %s, notes = %s, update_id = %s WHERE magazine_type_id = %s")             
        paremeters = ('Windows', 'The Windows IT Magazine', 'The Notes', 300, 14)            
        database.mysql_execute_cursor_update(mysql_connect, sql, paremeters)                             
    except:
        exception_message = sys.exc_info()[0]
        print("An error occurred. {}".format(exception_message))
    finally:                     
        database.mysql_close_connection(mysql_connect)
        
if __name__ == '__main__':
    main()