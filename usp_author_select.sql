DROP PROCEDURE IF EXISTS magazine.usp_author_select;
CREATE PROCEDURE magazine.`usp_author_select`()
BEGIN   
  DECLARE mysql_errno char(4) DEFAULT '0000';
  DECLARE message_text text;  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
      GET DIAGNOSTICS CONDITION 1
      mysql_errno = MYSQL_ERRNO, 
      message_text = MESSAGE_TEXT;
    END;    
  SELECT author_id, 
    first_name, 
    last_name, 
    middle_name, 
    title, 
    job_description, 
    street_1, 
    street_2, 
    city, 
    state_province, 
    zip_code, 
    country, 
    phone, 
    fax, 
    email, 
    website, 
    picture, 
    notes, 
    active, 
    updated_id, 
    updated_date 
  FROM magazine.author
  ORDER BY first_name;
  IF mysql_errno <> '0000' THEN
     CALL usp_error_log_insert('usp_publisher_load', mysql_errno, message_text, CURRENT_USER());
  END IF; 
END;
