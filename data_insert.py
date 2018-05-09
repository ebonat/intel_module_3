# coding: utf-8 

from data.database import DatabaseConnector
import config

if __name__ == '__main__':
    try:            
        database = DatabaseConnector(config.USER, config.PASSWORD, config.HOST, config.DATABASE) 
        mysql_connect = database.mysql_open_connection()               
        sql = ('INSERT INTO magazine_type (type, description, notes, update_id) VALUES (%s, %s, %s, %s)')             
        paremeters = ('Lunix', 'The Lunix Magazine', 'The Notes', 300)            
        database.mysql_execute_cursor_update(mysql_connect, sql, paremeters)                    
    except Exception as ex:     
        print('An error occurred: ' + str(ex) + '. Contact your System Administrator.')
    finally:                     
        database.mysql_close_connection(mysql_connect)