DROP PROCEDURE IF EXISTS magazine.usp_error_log_insert;
CREATE PROCEDURE magazine.`usp_error_log_insert`(  
  par_procedure_name varchar(50),
  par_error_number char(4),
  par_error_message text,
  par_update_id varchar(50)
)
BEGIN    
  DECLARE par_database_name varchar(50); 
  BEGIN
    SET par_database_name = DATABASE();           
  END;
  INSERT INTO error_log
    (database_name, 
    procedure_name, 
    error_number, 
    error_message, 
    update_id)    
  VALUES (par_database_name, 
    par_procedure_name, 
    par_error_number, 
    par_error_message, 
    par_update_id);    
END;