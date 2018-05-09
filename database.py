
import sys
import traceback
import datetime

import mysql.connector

class AbstractDatabaseConnector(object):

    def mysql_open_connection(self):
        raise NotImplementedError
    
    def mysql_close_connection(self, var_mysql_connect):
        raise NotImplementedError

    def mysql_execute_cursor_select(self, mysql_connect, sql, parameters = None):
        raise NotImplementedError
    
    def mysql_execute_cursor_update(self, mysql_connect, sql, parameters = None):
        raise NotImplementedError
    
    def mysql_close_cursor(self, cursor):
        raise NotImplementedError
    
    def mysql_call_procedure_select(self, mysql_connect, procedure_name, arguments = None):
        raise NotImplementedError
    
    def mysql_call_procedure_update(self, mysql_connect, procedure_name, arguments):
        raise NotImplementedError
    
    def get_exception_message(self):
        raise NotImplementedError
    
class DatabaseConnector(AbstractDatabaseConnector):
    
    """ class constructor """            
    def __init__(self, user, password, host, database):
        self.user = user
        self.password = password
        self.host = host
        self.database = database
        
    def mysql_open_connection(self):
        try:    
            mysql_connect = mysql.connector.connect(user = self.user, 
                                                    password = self.password, 
                                                    host = self.host, 
                                                    database = self.database)            
            if (mysql_connect.is_connected()):
                return mysql_connect
            else:
                return None
        except:     
            exception_message = self.get_exception_message()        
            print(exception_message)
        finally:
            pass 
        
    def mysql_close_connection(self, var_mysql_connect):
        try:            
            if (var_mysql_connect.is_connected()):
                var_mysql_connect.close()        
        except:     
            exception_message = self.get_exception_message()        
            print(exception_message)
        finally:
            pass 
        
    def mysql_execute_cursor_select(self, mysql_connect, sql, parameters = None):
        try:    
            cursor = mysql_connect.cursor()    
            if parameters is not None:    
                cursor.execute(sql, parameters)
            else:
                cursor.execute(sql) 
            data = cursor.fetchall()                 
            if cursor is not None:  
                return cursor, data          
            else:
                return None, None
        except:     
            exception_message = self.get_exception_message()        
            print(exception_message)
        finally:
            pass 
        
    def mysql_execute_cursor_update(self, mysql_connect, sql, parameters = None):
        try:    
            cursor = mysql_connect.cursor()    
            if parameters is not None:    
                cursor.execute(sql, parameters)
            else:
                cursor.execute(sql)                         
            mysql_connect.commit()
        except:     
            exception_message = self.get_exception_message()        
            print(exception_message)
        finally:
            self.mysql_close_cursor(cursor)
        
    def mysql_close_cursor(self, cursor):
        try:                
            if cursor is not None:  
                cursor.close()                           
        except:     
            exception_message = self.get_exception_message()        
            print(exception_message)
        finally:
            pass
        
    def mysql_call_procedure_select(self, mysql_connect, procedure_name, arguments = None):
        try:    
            cursor = mysql_connect.cursor()    
            if arguments is not None:    
                cursor.callproc(procedure_name, arguments) 
            else:
                cursor.callproc(procedure_name)                
            for result in cursor.stored_results():
                dataset = result.fetchall()                            
            if dataset is not None:  
                return dataset
            else:
                return None
        except:     
            exception_message = self.get_exception_message()        
            print(exception_message)
        finally:
            self.mysql_close_cursor(cursor)            
    
    def mysql_call_procedure_update(self, mysql_connect, procedure_name, arguments):
        try:    
            cursor = mysql_connect.cursor()    
            result = cursor.callproc(procedure_name, arguments) 
            mysql_connect.commit()
            if result is not None:  
                return result
            else:
                return None            
        except:     
            exception_message = self.get_exception_message()        
            print(exception_message)
        finally:
            self.mysql_close_cursor(cursor)
        
    def get_exception_message(self):
        try:    
    #         sys.exc_info() â€“ system exception information function
    #         it returns: error type, exc_error value and traceback object
            exc_type, exc_value, exc_tb = sys.exc_info()    
            
    #         traceback - standard interface to extract, format and print stack traces
    #         extract_tb() - return a list of up to limit â€œpre-processedâ€� stack trace entries extracted from the traceback object
    #         it returns: file path name, line number, procedure name and line_code
            file_path_name, line_number, procedure_name, line_code = traceback.extract_tb(exc_tb)[-1]
           
    #         build the exception message
            exception_message = ''.join('[time stamp]: ' + str(datetime.datetime.now()) + ' ' 
                                        + '[error type]: ' + str(exc_type) + ' ' 
                                        + '[error value]: ' + str(exc_value) + ' ' 
                                        + '[file path name]: ' + str(file_path_name)    + ' ' 
                                        + '[line number]: ' + str(line_number)         + ' ' 
                                        + '[procedure name]: ' + str(procedure_name) + ' ' 
                                        + '[line of code]: ' + str(line_code))        
            return exception_message    
        except Exception as ex:     
            print('An error occurred: ' + str(ex) + '. Contact your System Administrator.')
        finally:
            pass 