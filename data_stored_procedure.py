# coding: utf-8 

import sys
from database import DatabaseConnector
import config
from enum import Enum

class AuthorColumn(Enum):
    author_id = 0
    first_name = 1
    last_name = 2
    middle_name = 3 
    title =4
    job_description = 5
    street_1 = 6
    street_2 = 7 
    city = 8
    state_province = 9
    zip_code = 10
    country = 11
    phone = 12
    fax = 13
    email = 14
    website = 15
    picture = 16
    notes = 17
    active = 18
    updated_id = 19
    updated_date = 20
    
#     author_id, first_name, last_name, middle_name, title, job_description, street_1, street_2, city, 
#     state_province, zip_code, country, phone, fax, email, website, picture, notes, active, updated_id, updated_date

# class DataEnum:        
#         author_id, first_name, last_name, middle_name, title, job_description, street_1, street_2, city, state_province, zip_code, country, phone, fax, email, website, picture, notes, active, updated_id, updated_date = range(0, 21) 

if __name__ == '__main__':
    try:    
        database = DatabaseConnector(config.USER, config.PASSWORD, config.HOST, config.DATABASE)
        mysql_connect = database.mysql_open_connection()    
        dataset = database.mysql_call_procedure_select(mysql_connect, "usp_author_select")
        for row in dataset :
            print (row[AuthorColumn.author_id.value], 
                    row[AuthorColumn.first_name.value], 
                    row[AuthorColumn.last_name.value], 
                    row[AuthorColumn.middle_name.value],                                     
                    row[AuthorColumn.title.value], 
                    row[AuthorColumn.job_description.value], 
                    row[AuthorColumn.street_1.value],                     
                    row[AuthorColumn.street_2.value], 
                    row[AuthorColumn.city.value], 
                    row[AuthorColumn.state_province.value],                                     
                    row[AuthorColumn.zip_code.value], 
                    row[AuthorColumn.country.value], 
                    row[AuthorColumn.phone.value],                     
                    row[AuthorColumn.fax.value], 
                    row[AuthorColumn.email.value], 
                    row[AuthorColumn.website.value],                                     
                    row[AuthorColumn.picture.value], 
                    row[AuthorColumn.notes.value], 
                    row[AuthorColumn.active.value],                     
                    row[AuthorColumn.updated_id.value], 
                    row[AuthorColumn.updated_date.value],                    
                    sep='\t')     
    except:
        exception_message = sys.exc_info()[0]
        print("An error occurred. {}".format(exception_message))
    finally:                
        database.mysql_close_connection(mysql_connect)