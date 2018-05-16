# coding: utf-8 

import sys
from database import DatabaseConnector
import config
from enum import Enum
import datetime

class ArticleColumn(Enum):
    article_id = 0
    title = 1
    received_date = 2
    
def main():
    try:            
        database = DatabaseConnector(config.USER, config.PASSWORD, config.HOST, config.DATABASE) 
        mysql_connect = database.mysql_open_connection()            
        sql = ('SELECT article_id, title, received_date FROM article WHERE received_date BETWEEN %s AND %s')
        received_date_start = datetime.date(2008, 1, 4)
        received_date_end = datetime.date(2008, 3, 5)          
        paremeters = (received_date_start, received_date_end)            
        cursor, data = database.mysql_execute_cursor_select(mysql_connect, sql, paremeters)                    
        if cursor.rowcount > 0:                
            for row in data :
                print (row[ArticleColumn.article_id.value], row[ArticleColumn.title.value], row[ArticleColumn.received_date.value], sep='\t')     
    except:
        exception_message = sys.exc_info()[0]
        print("An error occurred. {}".format(exception_message))
    finally:                
        database.mysql_close_cursor(cursor)
        database.mysql_close_connection(mysql_connect)

if __name__ == '__main__':                
    main()