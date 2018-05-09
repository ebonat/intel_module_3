# coding: utf-8 

from data.database import DatabaseConnector
import config

class DataEnum:
        article_id, title, received_date = range(0, 3)

if __name__ == '__main__':                
    try:     
        database = DatabaseConnector(config.USER, config.PASSWORD, config.HOST, config.DATABASE)    
        mysql_connect = database.mysql_open_connection()          
        sql = ('SELECT author_id, first_name, last_name, middle_name FROM author WHERE last_name LIKE %s ORDER BY first_name')             
        paremeters = ('%w%', )            
        cursor, data = database.mysql_execute_cursor_select(mysql_connect, sql, paremeters)                    
        if cursor.rowcount > 0:                
            for row in data :
                print (row[DataEnum.article_id], row[DataEnum.title], row[DataEnum.received_date], sep='\t')     
    except Exception as ex:     
        print('An error occurred: ' + str(ex) + '. Contact your System Administrator.')
    finally:                
        database.mysql_close_cursor(cursor)
        database.mysql_close_connection(mysql_connect)