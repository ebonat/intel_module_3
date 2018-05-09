-- 1 - SELECT FROM
SELECT `contact_name`
  FROM `publisher`;

-- 2 - SELECT AS FROM
SELECT `contact_name` AS 'Contact'
  FROM `publisher`;

-- 3 - SELECT CONCAT() FROM
	 SELECT 
CONCAT_WS ( ', ', company_name, street_1, street_2, city,
   CONCAT  (state_province, ' ', zip_code)
 				  ) AS 'Publisher Address'
   	 FROM   publisher;
	
-- 4 - SELECT FROM WHERE
SELECT `contact_name` AS 'Contact'
  FROM `publisher`
 WHERE `city` = 'portland';
 
-- 5 - SELECT DISTINCT FROM WHERE
  SELECT 
DISTINCT `publisher_id` AS 'Publisher ID'
    FROM `magazine`
   WHERE `department_id` = 5;
 
-- 6 - SELECT DISTINCTROW FROM WHERE
		 SELECT 
DISTINCTROW `city` AS 'Cities with Senior Website Programmers'
  		 FROM `author`
 			WHERE `title` = 'Senior Website Programmer';
 
-- 7 - SELECT FROM LIMIT WHERE
SELECT `title` AS 'Article Title', `description` AS 'Article Description'
  FROM `article`
 WHERE `active` = 1
 LIMIT  5;
 
-- 8 - SELECT FROM WHERE BETWEEN
SELECT `picture_cover` AS 'Cover Iamge', `webpage` AS 'Web Page', `year_month` AS 'Issue Period'
  FROM `issue`
 WHERE `issued_date` BETWEEN '2008-01-01' AND '2008-03-30';
 
-- 9 - SELECT FROM WHERE AND
SELECT `title` 				 AS 'Article Title',
       `description`   AS 'Article Description',
       `discount_cost` AS 'Discount Cost',
       `unit_cost` 		 AS 'Unit Cost'
	FROM `article`
 WHERE `discount_cost` > 0 AND `unit_cost` < 1.95;
 
-- 10 - SELECT FROM WHERE OR
SELECT `title` 				 AS 'Article Title',
       `description` 	 AS 'Article Description',
       `discount_cost` AS 'Discount Cost',
       `unit_cost` 		 AS 'Unit Cost'
  FROM `article`
 WHERE `discount_cost` > 0 OR `unit_cost` < 1.95;
 
-- 11 - SELECT FROM WHERE LIKE
SELECT `title` AS 'Article Title', `description` AS 'Article Description'
  FROM `article`
 WHERE `description` LIKE '%SQL%';

-- 12 - SELECT FROM WHERE NOT LIKE
SELECT `title`  AS 'Article Title', `description`  AS 'Article Description'
  FROM `article`
 WHERE `title` NOT LIKE '%SQL%' AND `title` NOT LIKE '%PHP%';
 
-- 13 - SELECT FROM WHERE ORDER BY
  SELECT `title` AS 'Article Title', `description` AS 'Article Description'
    FROM `article`
   WHERE `title` NOT LIKE '%SQL%'
ORDER BY `received_date`;

-- 14 - SELECT FROM WHERE GROUP BY
  SELECT `article_id` AS 'Article ID',
         `title` 			AS 'Article Title',
         `total_page` AS 'Page Count'
    FROM `article`
   WHERE `discount_cost` > 0
GROUP BY `total_page`;

-- 15 - SELECT FROM WHERE GROUP BY HAVING
  SELECT `article_id` AS 'Article ID',
         `title` 			AS 'Article Title',
         `total_page` AS 'Page Count'
    FROM `article`
   WHERE `discount_cost` > 0
GROUP BY `total_page`
  HAVING `total_page` > 3;

-- 16 - SELECT FROM WHERE EXISTS
SELECT `article_id` AS 'Article ID',
       `title` 			AS 'Article Title',
       `total_page` AS 'Page Count'
  FROM `article`
 WHERE EXISTS (SELECT `title`
                 FROM `article`
                WHERE `title` LIKE '%SQL%' AND `title` LIKE '%PHP%');

-- 17 - SELECT FROM WHERE NOT EXISTS
SELECT `article_id` AS 'Article ID'
  FROM `article`
 WHERE NOT EXISTS (SELECT `notes`
                     FROM `article`
                    WHERE `notes` IS NOT NULL);
										
-- 18 - SELECT FROM WHERE INNER JOIN
SELECT   `magazine`.`name` 					AS 'Magazine Name',
         `magazine`.`description` 	AS 'Magazine Description',
         `publisher`.`company_name` AS 'Publisher'
    FROM `magazine`
   INNER JOIN
         `publisher`
      ON `magazine`.`publisher_id` = `publisher`.`publisher_id`
ORDER BY `magazine`.`name`;

-- 19 - SELECT FROM WHERE LEFT JOIN
SELECT   `magazine`.`name`        AS 'Magazine Name',
         `magazine`.`description` AS 'Magazine Description',
         `department`.`name`      AS 'Department'
    FROM `magazine`
    LEFT JOIN
         `department`
      ON `magazine`.`department_id` = `department`.`department_id`
ORDER BY `magazine`.`name`;

-- 20 - SELECT FROM WHERE RIGHT JOIN
SELECT 	 `magazine`.`name` 				AS 'Magazine Name',
       	 `magazine`.`description` AS 'Magazine Description',
       	 `department`.`name` 			AS 'Department'
 	  FROM `magazine`
   RIGHT JOIN 
	 			 `department`
      ON `magazine`.`department_id` = `department`.`department_id`
ORDER BY `magazine.name`;

-- 21 - SELECT FROM WHERE CROSS JOIN
 SELECT CONCAT_WS (' ', `author`.`first_name`, `author`.`middle_name`, `author`.`last_name`) 
 																	AS 'Author',
         `author`.`email` 				AS 'Email',
         `article`.`title` 				AS 'Title',
         `article`.`description` 	AS 'Description',
         `article`.`total_page` 	AS 'Page Count',
         `article`.`unit_cost` 		AS 'Cost Each'
    FROM `article`, `author`
ORDER BY `author`.`last_name`;

-- 22 - SELECT UNION
   DROP TABLE IF EXISTS `file_format_type2`;
 CREATE TABLE `file_format_type2` ENGINE=innodb SELECT * FROM `file_format_type`;

  SELECT `type` 		    		AS 'File Type',
         `description`  		AS 'File Description'
    FROM `file_format_type`
   UNION ALL
  SELECT `type` 		    		AS 'File Type',
         `description`  		AS 'File Description'
    FROM `file_format_type2`
ORDER BY `File Type`;

-- 23 - SELECT INTO FROM WHERE
-- SELECT INTO to create new tables is not supported by MySQL.
-- http://www.linuxforums.org/forum/linux-programming-scripting/118218-sql-cant-create-new-table-select-into.html
-- Here is another way to acomplish the same thing.
  DROP TABLE IF EXISTS `author_contact`;
CREATE TABLE `author_contact` ENGINE=innodb
SELECT CONCAT_WS(' ', `first_name`, `middle_name`, `last_name`) AS 'author',
       `title`, `email`, `phone`, `website`
  FROM `author`
 WHERE `active` = 1;

-- 24 - SELECT INTO OUTFILE FROM WHERE
SELECT CONCAT_WS (' ', `first_name`, `middle_name`, `last_name`) AS 'author',
       							 `title`, `email`,`phone`,`website`
  INTO OUTFILE 			 'c:/Docs/author_contact.csv'
FIELDS TERMINATED BY ','
 LINES TERMINATED BY '\r\n'
  FROM `author`
 WHERE `active` = 1;

-- 25 - LOAD DATA INFILE
TRUNCATE TABLE author_contact;
  LOAD DATA INFILE 'c:/Docs/author_contact.csv'
  INTO TABLE author_contact
FIELDS TERMINATED BY ','
 LINES TERMINATED BY '\r\n';