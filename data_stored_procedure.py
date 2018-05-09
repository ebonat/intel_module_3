# coding: utf-8 

from data.database import DatabaseConnector
import config

class DataEnum:        
        author_id, first_name, last_name, middle_name, title, job_description, street_1, street_2, city, state_province, zip_code, country, phone, fax, email, website, picture, notes, active, updated_id, updated_date = range(0, 21) 

if __name__ == '__main__':
    try:    
        database = DatabaseConnector(config.USER, config.PASSWORD, config.HOST, config.DATABASE)
        mysql_connect = database.mysql_open_connection()    
        dataset = database.mysql_call_procedure_select(mysql_connect, "usp_author_select")
        for row in dataset :
            print (row[DataEnum.author_id], 
                    row[DataEnum.first_name], 
                    row[DataEnum.last_name], 
                    row[DataEnum.middle_name],                                     
                    row[DataEnum.title], 
                    row[DataEnum.job_description], 
                    row[DataEnum.street_1],                     
                    row[DataEnum.street_2], 
                    row[DataEnum.city], 
                    row[DataEnum.state_province],                                     
                    row[DataEnum.zip_code], 
                    row[DataEnum.country], 
                    row[DataEnum.phone],                     
                    row[DataEnum.fax], 
                    row[DataEnum.email], 
                    row[DataEnum.website],                                     
                    row[DataEnum.picture], 
                    row[DataEnum.notes], 
                    row[DataEnum.active],                     
                    row[DataEnum.updated_id], 
                    row[DataEnum.updated_date],                    
                    sep='\t')     
    except Exception as ex:     
        print('An error occurred: ' + str(ex) + '. Contact your System Administrator.')
    finally:                
        database.mysql_close_connection(mysql_connect)