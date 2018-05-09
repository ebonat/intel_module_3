
import sys
from database import DatabaseConnector
import config
from enum import Enum
        
class AuthorContact(Enum):
    author_id = 0
    first_name = 1
    last_name = 2
    middle_name = 3 
        
if __name__ == '__main__':            
    try:            
        database = DatabaseConnector(config.USER, config.PASSWORD, config.HOST, config.DATABASE) 
        mysql_connect = database.mysql_open_connection()            
        sql = "SELECT author_id, first_name, last_name, middle_name FROM author ORDER BY first_name"
        cursor, data = database.mysql_execute_cursor_select(mysql_connect, sql)          
        if len(data) > 0:                
            for row in data :
                print (row[AuthorContact.author_id.value], row[AuthorContact.first_name.value], row[AuthorContact.last_name.value], row[AuthorContact.middle_name.value], sep='\t')     
    except Exception as ex:     
        exception_message = sys.exc_info()[0]
        print("An error occurred. {}".format(exception_message))
    finally:                      
        database.mysql_close_cursor(cursor)
        database.mysql_close_connection(mysql_connect)
        
        
        