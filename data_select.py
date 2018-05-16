
import sys
from database import DatabaseConnector
import config
from enum import Enum
        
class AuthorColumn(Enum):
    author_id = 0
    first_name = 1
    last_name = 2
    middle_name = 3 

def main():
    try:            
        database = DatabaseConnector(config.USER, config.PASSWORD, config.HOST, config.DATABASE) 
        mysql_connect = database.mysql_open_connection()            
        sql = "SELECT author_id, first_name, last_name, middle_name FROM author ORDER BY first_name"
        cursor, data = database.mysql_execute_cursor_select(mysql_connect, sql)          
        if len(data) > 0:                
            for row in data :
                print (row[AuthorColumn.author_id.value], row[AuthorColumn.first_name.value], row[AuthorColumn.last_name.value], row[AuthorColumn.middle_name.value], sep='\t')     
    except:
        exception_message = sys.exc_info()[0]
        print("An error occurred. {}".format(exception_message))
    finally:                      
        database.mysql_close_cursor(cursor)
        database.mysql_close_connection(mysql_connect)
    
if __name__ == '__main__':   
    main()         
    
        
        
        