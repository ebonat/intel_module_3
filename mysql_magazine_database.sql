DROP DATABASE IF EXISTS `magazine`;
CREATE DATABASE `magazine`;

USE `magazine`;

DROP TABLE IF EXISTS `publisher`;
CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) NOT NULL,
  `contact_name` varchar(30) NOT NULL,
  `contact_title` varchar(50) NOT NULL,
  `street_1` varchar(30) NOT NULL,
  `street_2` varchar(30) DEFAULT NULL,
  `city` varchar(30) NOT NULL,
  `state_province` varchar(30) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `website` varchar(50) NOT NULL,
  `notes` tinytext,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `updated_id` varchar(50) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`publisher_id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO publisher (publisher_id,company_name,contact_name,contact_title,street_1,street_2,city,state_province,zip_code,country,phone,fax,email,website,notes,active,updated_id,updated_date) 
VALUES (1,'Computer Publishing, Inc.','John White','General Manager','134th SW 9th Avenue',null,'Portland','OR','97893','USA','503.789.6721','503.789.6722','jw@computerpublishing.com','www.computerpublishing.com',null,1,100,'2009-05-02 23:17:48')
, (2,'International Magazine, LLC.','Brad Black','Senior Publisher','PO Box 8978',null,'Hillsboro','OR','97245','USA','503.672.8909','503.672.8910','bb@intlmagazine.com','www.intlmagazine.com',null,1,100,'2009-05-01 22:00:23')
, (3,'Net Publishing, LLC.','Chris Miller','Senior Editor','45th NE 5th Street',null,'Astoria','OR','97125','USA','530.567.4556','530.567.4557','cm@netpublishing.com','www.netpublishing.com',null,1,100,'2009-05-01 22:03:50')
, (4,'JR Software Magazine, Inc.','David Clark','Executive Editor','350 NW Baseline Aven',null,'Albany','OR','97190','USA','503.235.6556','503.235.6557','dc@jrsoftware.com','www.jrsoftware.com',null,1,100,'2009-05-01 22:14:42')
, (5,'SoftManazine, LLC.','Jessica Smith','Technical Editor','PO Box 5623',null,'Eugene','OR','97903','USA','503.651.4573','503.651.4574','jr@softmagazine.com','www.softmagazine.com',null,1,100,'2009-05-01 22:15:00');

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL,
  `notes` tinytext,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `updated_id` varchar(50) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`department_id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO department (department_id,name,description,notes,active,updated_id,updated_date) 
VALUES (1,'Windows','Windows Magazine Department',null,1,100,'2009-05-01 22:55:41')
, (2,'Internet','Internet Magazine Department',null,1,100,'2009-05-01 22:55:57')
, (3,'Linux','Linux Magazine Department',null,1,100,'2009-05-01 22:56:52')
, (4,'Open Source','Open Source Magazine Department',null,1,100,'2009-05-01 22:58:37')
, (5,'Programming','Programming Magazine Department',null,1,100,'2009-05-02 02:13:27')
, (6,'Review','Review Magazine Department',null,1,100,'2009-05-02 02:13:16')
, (7,'Editing','Editing Magazine Department',null,1,100,'2009-05-02 02:14:34')
, (8,'Production','Production Magazine Department',null,1,100,'2009-05-02 02:15:04')
, (9,'Educational','Educational Magazine Department',null,1,100,'2009-05-02 10:52:32');

DROP TABLE IF EXISTS `file_format_type`;
CREATE TABLE `file_format_type` (
  `format_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(5) NOT NULL,
  `description` varchar(300) NOT NULL,
  `notes` tinytext,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `updated_id` varchar(50) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`format_type_id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO file_format_type (format_type_id,type,description,notes,active,updated_id,updated_date) 
VALUES (1,'html','HTML file',null,1,100,'2008-03-11 12:03:15')
, (2,'pdf','Adobe Acrobat file',null,1,100,'2008-03-11 12:04:20')
, (3,'chm','HTML Help compiled file ',null,1,100,'2008-03-11 12:16:28')
, (4,'hlp','Windows Help compiled file',null,1,100,'2008-03-11 12:18:25')
, (5,'doc','Windows Word document file',null,1,100,'2008-03-11 12:19:23')
, (6,'pub','Windows Publisher file',null,1,100,'2008-03-11 12:20:26');

DROP TABLE IF EXISTS `magazine_type`;
CREATE TABLE `magazine_type` (
  `magazine_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `description` varchar(300) NOT NULL,
  `notes` tinytext,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `update_id` varchar(50) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`magazine_type_id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO magazine_type (magazine_type_id,type,description,notes,active,update_id,updated_date) 
VALUES (1,'Windows','Windows development, tune up, repair, etc.',null,1,100,'2009-05-01 21:45:54')
, (2,'Internet','Internet development, browsers, setup, etc.',null,1,100,'2009-05-01 21:51:43')
, (3,'Database','Database design, development and implementation',null,1,100,'2009-05-01 21:52:08')
, (4,'Analysis','Analysis and documentation of computer software systems',null,1,100,'2009-05-01 21:52:31')
, (5,'Programming','Programming design and development for business applications',null,1,100,'2009-05-01 21:52:41')
, (6,'Design','Design of software systems for Windows and Internet',null,1,100,'2009-05-01 21:52:51')
, (7,'Deployment','Business application deployment and test',null,1,100,'2009-05-01 21:53:06');

DROP TABLE IF EXISTS `magazine`;
CREATE TABLE `magazine` (
  `magazine_id` int(11) NOT NULL AUTO_INCREMENT,
  `issn_number` varchar(50) NOT NULL,
  `magazine_type_id` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `company` varchar(100) NOT NULL,
  `street_1` varchar(50) NOT NULL,
  `street_2` varchar(50) DEFAULT NULL,
  `city` varchar(30) NOT NULL,
  `state_province` varchar(30) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `country` varchar(50) NOT NULL,
  `language` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `website` varchar(50) NOT NULL,
  `notes` tinytext,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `updated_id` varchar(50) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`issn_number`),
  UNIQUE KEY `magazine_id` (`magazine_id`),
  KEY `mag_type_id` (`magazine_type_id`),
  KEY `pub_id` (`publisher_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `magazine_ibfk_1` FOREIGN KEY (`magazine_type_id`) REFERENCES `magazine_type` (`magazine_type_id`),
  CONSTRAINT `magazine_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`),
  CONSTRAINT `magazine_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO magazine (magazine_id,issn_number,magazine_type_id,publisher_id,department_id,name,description,company,street_1,street_2,city,state_province,zip_code,country,language,phone,fax,email,website,notes,active,updated_id,updated_date) 
VALUES (15,'ACSD-2008',7,1,8,'Advanced Computer System Deployment','Provide advanced computer system deployment info','ABC  Advanced System Deployment, Inc.','89 NE Clark Avenue',null,'Astoria','OR','97125','USA','English','503.782.3723','503.782.3724','magazine@abcadvanced.com','www.abcadvanced.com',null,1,100,'2009-05-02 23:14:43')
, (4,'ADDD-2008',3,1,4,'Advanced Database Design and Development','Provide Windows tune up tips for any end-users','Database Design Services Co.','PO Box 2312',null,'Eugene','OR','97903','USA','English','503.894.8932','503.894.8933','magazine@databasenational.com','www.databasenational.com',null,1,100,'2009-05-02 23:07:24')
, (5,'AVSD-2008',4,5,7,'Analysis of Computer Systems Development','Provide info about computer systems analysis and development','Computer Systems for You, Inc.','PO Box A456',null,'Astoria','OR','97125','USA','English','503.674.7312','503.674.7313','magazine@computersystems.com','www.computersystems.com',null,1,100,'2009-05-02 23:14:43')
, (14,'BWDA-2008',2,5,4,'Business Website Design','Provide general design techniques for developing general business websites','Business Website Design Co.','PO Box 9123',null,'Portland','OR','97893','USA','English','503.456.8932','503.456.8933','magazine@businesswebsite.com','www.businesswebsite.com',null,1,100,'2009-05-02 22:30:18')
, (12,'CSAD-2008',4,3,8,'Computer System Analysis Documentation','Show how to document computer system analysis','CSA Consulting Services, Inc.','135 NW 500 Avenue',null,'Corvalis','OR','97155','USA','English','503.590.5254','503.590.5255','magazine@csaconsulting.com','www.csaconsulting.com',null,1,100,'2009-05-02 23:15:26')
, (18,'DBDS-2008',7,2,9,'Database Development for Students','Provide info about computer systems analysis and development','Database for Students, Inc.','5895 NW 1000 Road',null,'Astoria','OR','97125','USA','English','503.784.7897','503.784.7898','magazine@databaseforstudents.com','www.databaseforstudents.com',null,1,100,'2009-05-02 23:14:43')
, (13,'DWPM-2008',5,3,4,'Dynamic Website Development using PHP/MySQL','Provide programming techniques for developing PHP/MySQL dynamic websites','Dynamic Website Services, LLC.','PO Box 9090',null,'Hillsboro','OR','97245','USA','English','503.345.6732','503.345.6733','magazine@dynamicwebsite.com','www.dynamicwebsite.com',null,1,100,'2009-05-02 22:27:05')
, (16,'EDCS-2008',6,2,9,'Easy Design of Computer Systems','Show design techniques about computer systems','Business Computer Systems Co.','PO Box 3432',null,'Eugene','OR','97903','USA','English','503.894.3812','503.894.3813','magazine@businesscomputer.com','www.businesscomputer.com',null,1,100,'2009-05-02 23:05:39')
, (3,'EWUJ-2008',1,4,1,'Easy Windows Upgrade','Provide info about Widows services pack upgrades','Windows National Consulting, LLC.','45 SE Green Road',null,'Portland','OR','97893','USA','English','503.893.5231','503.893.5232','magazine@greenroad.com','www.greenroad.com',null,1,100,'2009-05-02 23:12:38')
, (19,'FSSA-2008',4,1,1,'First Steps of System Analysis','Provide first steps of system analysis design and development','First Steps SAD, Inc.','PO Box 7899',null,'Eugene','OR','97903','USA','English','503.783.4312','503.783.4313','magazine@firststeps.com','www.firststeps.com',null,1,100,'2009-05-02 22:57:52')
, (10,'IBIB-2008',2,5,2,'Internet Browsers','Provide info about Internet browsers installation and setup','Internet Browsers Consulting, LLC.','PO Box 3030',null,'Portland','OR','97893','USA','English','503.906.8342','503.906.8343','magazine@internetbrowsers.com','www.internetbrowsers.com',null,1,100,'2009-05-02 23:12:38')
, (2,'IFBT-2008',2,3,2,'Internet for Business','Provide info about relationship between Internet and Business','Internet National Company, Inc.','1000 NW White Road',null,'Corvalis','OR','97155','USA','English','503.672.5667','503.672.5668','magazine@internetnational.com','www.internetnational.com',null,1,100,'2009-05-02 23:15:26')
, (11,'LDDD-2008',3,4,9,'Learning Database Design and Development','Show main tutorials and tips of database desing and development for students','School Database Design Co.','PO Box 5665',null,'Astoria','OR','97125','USA','English','503.345.6743','503.345.6744','magazine@schooldatabase.com','www.schooldatabase.com',null,1,100,'2009-05-02 23:14:43')
, (7,'LPHP-2008',5,3,9,'Learning PHP/MySQL Website Programming','Provide tutorials and sample code for developing PHP/MySQL websites','Website Forever, Inc.','223 SW TJ Street',null,'Albany','OR','97190','USA','English','503.573.9043','503.573.9044','magazine@websiteforever.com','www.websiteforever.com',null,1,100,'2009-05-02 23:13:55')
, (8,'PHPS-2008',5,2,9,'PHP Programming for Students','Provide general PHP programming for any students','PHP Consulting Services, LLC.','PO Box 1011',null,'Corvalis','OR','97155','USA','English','503.346.5613','503.346.5614','magazine@phpconsulting.com','www.phpconsulting.com',null,1,100,'2009-05-02 23:13:55')
, (1,'QWTU-2008',1,5,1,'Quick Windows Tune-up','Provide Windows tune-up tips for any end-users','Windows Tuning, Inc.','PO Box 7852',null,'Portland','OR','97893','USA','English','503.783.5623','503.783.5624','magazine@windowstuning.com','www.windowstuning.com',null,1,100,'2009-05-02 23:12:38')
, (17,'SQLP-2008',5,4,5,'SQL Programming for MySQL Database','Show how to do SQL Programming for MySQL Database','SQL Programming Enterprises, LLC.','PO Box AB34',null,'Eugene','OR','97903','USA','English','503.784.4212','503.784.4213','magazine@sqlprogramming.com','www.sqlprogramming.com',null,1,100,'2009-05-02 23:09:02')
, (20,'UIBY-2008',2,3,9,'Using Internet by You','Show simple info about how to use the Internet for evert one','Easy Internet consulting, LLC','90 SE Black Road',null,'Astoria','OR','97125','USA','English','503.869.8932','503.869.8933','magazine@easyinternet.com','www.easyinternet.com',null,1,100,'2009-05-02 23:14:43')
, (6,'WADJ-2008',1,2,1,'Windows Applications Deployment','Provide info about Widows deployment for business applications','KTA Windows Deployment Co.','500 Main Avenue',null,'Albany','OR','97190','USA','English','503.462.9032','503.462.9032','magazine@ktawindows.com','www.ktawindows.com',null,1,100,'2009-05-02 22:11:14')
, (9,'WAOP-2008',1,4,4,'Windows and Open Source','Provide Windows and Open Source info','Open Source Services, Inc.','560 SW Miller Avenue',null,'Hillsboro','OR','97245','USA','English','503.478.9032','503.478.9034','magazine@basicopensource.com','www.basicopensource.com',null,1,100,'2009-05-02 23:13:55');

DROP TABLE IF EXISTS `issue`;
CREATE TABLE `issue` (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `issn_number` varchar(50) NOT NULL,
  `year_month` varchar(10) NOT NULL,
  `volume` smallint(5) unsigned NOT NULL,
  `number` smallint(5) unsigned NOT NULL,
  `issued_date` date NOT NULL,
  `unit_cost` decimal(6,2) NOT NULL,
  `unit_stock` smallint(5) NOT NULL,
  `unit_order` smallint(5) NOT NULL,
  `total_page` smallint(5) NOT NULL,
  `picture_cover` varchar(50) DEFAULT NULL,
  `discontinued` tinyint(1) NOT NULL DEFAULT '0',
  `discontinued_date` date DEFAULT NULL,
  `webpage` varchar(50) NOT NULL,
  `notes` tinytext,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `updated_id` varchar(50) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`issue_id`),
  UNIQUE KEY `issn_number_2` (`issn_number`,`year_month`),
  KEY `issn_number` (`issn_number`),
  CONSTRAINT `issue_ibfk_1` FOREIGN KEY (`issn_number`) REFERENCES `magazine` (`issn_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO issue (issue_id,issn_number,`year_month`,volume,number,issued_date,unit_cost,unit_stock,unit_order,total_page,picture_cover,discontinued,discontinued_date,webpage,notes,active,updated_id,updated_date) 
VALUES (1,'ADDD-2008','2008-01',1,1,'2008-01-14 00:00:00',6.95,50,1800,65,'ADDD.jpg',0,null,'http://www.abcadvanced.com/addd_2008_01.php',null,1,100,'2009-06-02 20:46:09')
, (2,'ADDD-2008','2008-03',1,2,'2008-03-10 00:00:00',6.95,40,1900,63,'ADDD.jpg',0,null,'http://www.abcadvanced.com/addd_2008_03.php',null,1,100,'2009-06-02 20:46:09')
, (3,'ADDD-2008 ','2008-05',1,3,'2008-05-12 00:00:00',6.95,50,1850,72,'ADDD.jpg',0,null,'http://www.abcadvanced.com/addd_2008_05.php',null,1,100,'2009-06-02 20:46:09')
, (4,'ADDD-2008 ','2008-07',1,4,'2008-07-07 00:00:00',6.95,45,1775,68,'ADDD.jpg',0,null,'http://www.abcadvanced.com/addd_2008_07.php',null,1,100,'2009-06-02 20:46:09')
, (5,'ADDD-2008 ','2008-09',1,5,'2008-09-08 00:00:00',6.95,55,1680,58,'ADDD.jpg',0,null,'http://www.abcadvanced.com/addd_2008_09.php',null,1,100,'2009-06-02 20:46:09')
, (6,'ADDD-2008 ','2009-11',1,6,'2008-11-10 00:00:00',6.95,40,1885,60,'ADDD.jpg',0,null,'http://www.abcadvanced.com/addd_2008_11.php',null,1,100,'2009-06-02 20:46:09')
, (7,'LPHP-2008','2008-01',1,1,'2008-01-07 00:00:00',8.95,45,2500,55,'LPHP.jpg',0,null,'http://www.websiteforever.com/lphp_2008_01.php',null,1,100,'2009-06-02 20:46:09')
, (8,'LPHP-2008','2008-03',1,2,'2008-03-03 00:00:00',8.95,50,2545,68,'LPHP.jpg',0,null,'http://www.websiteforever.com/lphp_2008_03.php',null,1,100,'2009-06-02 20:46:09')
, (9,'LPHP-2008','2008-05',1,3,'2008-05-06 00:00:00',8.95,52,2560,57,'LPHP.jpg',0,null,'http://www.websiteforever.com/lphp_2008_05.php',null,1,100,'2009-06-02 20:46:09')
, (10,'LPHP-2008','2008-07',1,4,'2008-07-08 00:00:00',8.95,55,2580,62,'LPHP.jpg',0,null,'http://www.websiteforever.com/lphp_2008_07.php',null,1,100,'2009-06-02 20:46:09')
, (11,'LPHP-2008','2008-09',1,5,'2008-09-09 00:00:00',8.95,60,2590,55,'LPHP.jpg',0,null,'http://www.websiteforever.com/lphp_2008_09.php',null,1,100,'2009-06-02 20:46:09')
, (12,'LPHP-2008','2008-11',1,6,'2008-11-03 00:00:00',8.95,65,2690,53,'LPHP.jpg',0,null,'http://www.websiteforever.com/lphp_2008_11.php',null,1,100,'2009-06-02 20:46:09')
, (13,'SQLP-2008','2008-01',1,1,'2008-01-07 00:00:00',5.95,40,2100,45,'SQLP.jpg',0,null,'http://www.sqlprogramming.com/sqlp_2008_01.php',null,1,100,'2009-06-02 20:46:09')
, (14,'SQLP-2008','2008-03',1,2,'2008-03-04 00:00:00',5.95,42,2150,42,'SQLP.jpg',0,null,'http://www.sqlprogramming.com/sqlp_2008_03.php',null,1,100,'2009-06-02 20:46:09')
, (15,'SQLP-2008','2008-05',1,3,'2008-05-12 00:00:00',5.95,53,2190,40,'SQLP.jpg',0,null,'http://www.sqlprogramming.com/sqlp_2008_05.php',null,1,100,'2009-06-02 20:46:09')
, (16,'SQLP-2008','2008-07',1,4,'2009-07-13 00:00:00',5.95,50,2120,48,'SQLP.jpg',0,null,'http://www.sqlprogramming.com/sqlp_2008_07.php',null,1,100,'2009-06-02 20:46:09')
, (17,'SQLP-2008','2008-09',1,5,'2009-09-14 00:00:00',5.95,48,2105,52,'SQLP.jpg',0,null,'http://www.sqlprogramming.com/sqlp_2008_09.php',null,1,100,'2009-06-02 20:46:09')
, (18,'SQLP-2008','2008-11',1,6,'2009-11-09 00:00:00',5.65,46,2135,41,'SQLP.jpg',0,null,'http://www.sqlprogramming.com/sqlp_2008_11.php',null,1,100,'2009-06-02 20:46:09');

DROP TABLE IF EXISTS `file_format`;
CREATE TABLE `file_format` (
  `file_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `format_type_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `location` varchar(100) NOT NULL,
  `created_date` date NOT NULL,
  `notes` tinytext,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `updated_id` varchar(50) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`file_format_id`),
  KEY `format_type_id` (`format_type_id`),
  KEY `issue_id` (`issue_id`),
  CONSTRAINT `file_format_ibfk_1` FOREIGN KEY (`format_type_id`) REFERENCES `file_format_type` (`format_type_id`),
  CONSTRAINT `file_format_ibfk_2` FOREIGN KEY (`issue_id`) REFERENCES `issue` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO file_format (file_format_id,format_type_id,issue_id,location,created_date,notes,active,updated_id,updated_date) 
VALUES (1,1,1,'C:magazineissueADDD-2008-1-1','2008-01-11 00:00:00',null,1,100,'2009-06-13 12:29:37')
, (2,1,2,'C:magazineissueADDD-2008-1-2','2008-03-07 00:00:00',null,1,100,'2009-06-13 13:50:40')
, (3,1,3,'C:magazineissueADDD-2008-1-3','2008-05-09 00:00:00',null,1,100,'2009-06-13 13:52:39')
, (4,1,4,'C:magazineissueADDD-2008-1-4','2008-07-04 00:00:00',null,1,100,'2009-06-13 13:54:21')
, (5,1,5,'C:magazineissueADDD-2008-1-5','2008-09-05 00:00:00',null,1,100,'2009-06-13 13:55:13')
, (6,1,6,'C:magazineissueADDD-2008-1-6','2008-11-07 00:00:00',null,1,100,'2009-06-13 20:02:21')
, (7,2,7,'C:magazineissueLPHP-2008-1-1','2008-01-10 00:00:00',null,1,100,'2009-06-13 20:05:46')
, (8,2,8,'C:magazineissueLPHP-2008-1-2','2008-03-06 00:00:00',null,1,100,'2009-06-13 20:08:21')
, (9,2,9,'C:magazineissueLPHP-2008-1-3','2008-05-08 00:00:00',null,1,100,'2009-06-13 20:10:55')
, (10,2,10,'C:magazineissueLPHP-2008-1-4','2008-07-03 00:00:00',null,1,100,'2009-06-13 20:12:42')
, (11,2,11,'C:magazineissueLPHP-2008-1-5','2008-09-04 00:00:00',null,1,100,'2009-06-13 20:14:18')
, (12,2,12,'C:magazineissueLPHP-2008-1-6','2008-11-06 00:00:00',null,1,100,'2009-06-13 20:14:32')
, (13,1,13,'C:magazineissueSQLP-2008-1-1','2008-01-11 00:00:00',null,1,100,'2009-06-13 20:16:25')
, (14,1,14,'C:magazineissueSQLP-2008-1-2','2008-03-07 00:00:00',null,1,100,'2009-06-13 20:18:56')
, (15,1,15,'C:magazineissueSQLP-2008-1-3','2008-05-08 00:00:00',null,1,100,'2009-06-13 20:22:19')
, (16,1,16,'C:magazineissueSQLP-2008-1-4','2008-07-03 00:00:00',null,1,100,'2009-06-13 20:22:43')
, (17,1,17,'C:magazineissueSQLP-2008-1-5','2008-09-04 00:00:00',null,1,100,'2009-06-13 20:24:31')
, (18,1,18,'C:magazineissueSQLP-2008-1-6','2008-11-07 00:00:00',null,1,100,'2009-06-13 20:25:18');

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` varchar(15) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL,
  `total_page` smallint(5) NOT NULL,
  `unit_cost` decimal(6,2) NOT NULL,
  `discount_cost` decimal(6,2) NOT NULL,
  `received_date` date NOT NULL,
  `approved_date` date NOT NULL,
  `webpage` varchar(50) NOT NULL,
  `notes` tinytext,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `updated_id` varchar(50) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_id`),
  KEY `issue_id` (`issue_id`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`issue_id`) REFERENCES `issue` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO article (article_id,issue_id,title,description,total_page,unit_cost,discount_cost,received_date,approved_date,webpage,notes,active,updated_id,updated_date) 
VALUES ('ADDD-2008-01-01',1,'Advanced LAMP Server Configuration','Explain how to setup MySQL servers using LAMP technologies',8,1.95,0.3,'2008-01-04 00:00:00','2008-01-07 00:00:00','http://www.abcadvanced.com/addd-2008_01_01.php',null,1,100,'2009-05-05 10:23:50')
, ('ADDD-2008-01-02',1,'Setting MySQL Database in WAMP Servers','Explain how to setup properly a MySQL database in production WAMP Servers',6,1.95,0,'2008-01-04 00:00:00','2008-01-07 00:00:00','http://www.abcadvanced.com/addd-2008_01_02.php',null,1,100,'2009-06-03 07:36:38')
, ('ADDD-2008-01-03',1,'Basis of Database Design and Development Using MyS','Show the basis of database design and development using MySQL',8,1.95,0.5,'2008-01-04 00:00:00','2008-01-07 00:00:00','http://www.abcadvanced.com/addd-2008_01_03.php',null,1,100,'2009-06-03 08:01:34')
, ('ADDD-2008-01-04',1,'MySQL Management Tool Using Toad','Explain how to use Toad for MySQL in Windows',5,1.95,0,'2008-01-04 00:00:00','2008-01-07 00:00:00','http://www.abcadvanced.com/addd-2008_01_04.php',null,1,100,'2009-06-03 08:03:23')
, ('ADDD-2008-01-05',1,'Setting MySQL Database in XAMPP Servers','Show how to setup MySQL network database engine in XAMPP servers',7,1.95,0.5,'2008-01-04 00:00:00','2008-01-07 00:00:00','http://www.abcadvanced.com/addd-2008_01_05.php',null,1,100,'2009-06-03 08:10:03')
, ('ADDD-2008-01-06',1,'Maintain MySQL Databases in Production Environment','Present production tutorials and tips for maintaining MySQL databases',5,1.95,0.2,'2008-01-04 00:00:00','2009-01-07 00:00:00','http://www.abcadvanced.com/addd-2008_01_06.php',null,1,100,'2009-06-03 08:14:02')
, ('ADDD-2008-03-01',2,'WAMP Technologies Made Simple','Show how to install and setup WAMP servers in Windows',6,1.95,0.3,'2008-03-03 00:00:00','2008-03-05 00:00:00','http://www.abcadvanced.com/addd-2008_03_01.php',null,1,100,'2009-06-03 08:38:37')
, ('ADDD-2008-03-02',2,'Database Warehouse Using MySQL','Provide the tools to install and maintain MySQL database warehouses',9,1.95,0,'2008-03-03 00:00:00','2008-03-05 00:00:00','http://www.abcadvanced.com/addd-2008_02_03.php',null,1,100,'2009-06-03 08:39:02')
, ('ADDD-2008-03-03',2,'Set Security Levels for MySQL Database','Show the basis of database design and development using MySQL',8,1.95,0.4,'2008-03-03 00:00:00','2008-03-05 00:00:00','http://www.abcadvanced.com/addd-2008_03_03.php',null,1,100,'2009-06-03 08:41:23')
, ('ADDD-2008-03-04',2,'Setting MySQL Database in LAMP Servers','Show different levels of security in MySQL database object',5,1.95,0,'2008-03-03 00:00:00','2008-03-05 00:00:00','http://www.abcadvanced.com/addd-2008_03_04.php',null,1,100,'2009-06-03 08:43:21')
, ('ADDD-2008-03-05',2,'Logical Database Development in MySQL Server','Present the main logical principles of MySQL database development',7,1.95,0.3,'2008-03-03 00:00:00','2008-03-05 00:00:00','http://www.abcadvanced.com/addd-2008_03_05.php',null,1,100,'2009-06-03 08:43:32')
, ('ADDD-2008-03-06',2,'Database Implementation Using MySQL','Show how to implement MySQL databases in production environments',9,1.95,0.2,'2008-03-03 00:00:00','2008-03-05 00:00:00','http://www.abcadvanced.com/addd-2008_03_06.php',null,1,100,'2009-06-03 08:44:06')
, ('LPHP-2008-01-01',1,'Simple PHP Programming For Fun','Present simple and easy PHP code to create static websites',5,2.95,0,'2008-01-03 00:00:00','2008-01-04 00:00:00','http://www.websiteforever.com/lphp_2008_01_01.php',null,1,100,'2009-06-03 08:44:53')
, ('LPHP-2008-01-02',1,'Learning PHP Programming for Night Students','Explain how easy is to code PHP for websites implementation',6,2.95,0.2,'2008-01-03 00:00:00','2008-01-04 00:00:00','http://www.websiteforever.com/lphp_2008_01_02.php',null,1,100,'2009-06-03 13:32:37')
, ('LPHP-2008-01-03',1,'Websites Development Using PHP Script','Provide excellent PHP techniques to develop companies websites',8,2.95,0.5,'2008-01-03 00:00:00','2008-01-04 00:00:00','http://www.websiteforever.com/lphp_2008_01_03.php',null,1,100,'2009-06-03 13:32:37')
, ('LPHP-2008-01-04',1,'PHP/MySQL Dynamic Websites Development','Introduce to PHP/MySQL dynamic websites development',7,2.95,0.4,'2008-01-03 00:00:00','2008-01-04 00:00:00','http://www.websiteforever.com/lphp_2008_01_04.php',null,1,100,'2009-06-03 13:32:37')
, ('LPHP-2008-01-05',1,'PHP and MySQL: A Great Combination','Explain the advantages of using PHP and MySQL to design and develop websites',6,2.95,0.2,'2008-01-03 00:00:00','2008-01-04 00:00:00','http://www.websiteforever.com/lphp_2008_01_05.php',null,1,100,'2009-06-03 13:32:37')
, ('LPHP-2008-01-06',1,'Is PHP Code Simple?','Show many simple examples of PHP code',9,2.95,0,'2008-01-03 00:00:00','2008-01-04 00:00:00','http://www.websiteforever.com/lphp_2008_01_06.php',null,1,100,'2009-06-03 13:32:37')
, ('LPHP-2008-03-01',2,'Doing PHP Code For Myself','Provide good practical PHP code for any website developer',8,2.95,0,'2008-03-04 00:00:00','2008-03-06 00:00:00','http://www.websiteforever.com/lphp_2008_03_01.php',null,1,100,'2009-06-03 13:32:37')
, ('LPHP-2008-03-02',2,'Introduction To Simple PHP Programming','Show how to simplify the PHP code ',5,2.95,0.4,'2008-03-04 00:00:00','2008-03-06 00:00:00','http://www.websiteforever.com/lphp_2008_03_02.php',null,1,100,'2009-06-03 13:32:37')
, ('LPHP-2008-03-03',2,'Using Database Tiers in PHP/MySQL Websites Develop','Explain how to use database tiers and components for developing PHP/MySQL websites ',6,2.95,0,'2008-03-04 00:00:00','2008-03-06 00:00:00','http://www.websiteforever.com/lphp_2008_03_03.php',null,1,100,'2009-06-03 13:32:37')
, ('LPHP-2008-03-04',2,'Advanced PHP Programming Using Stored Procedures','Provide the required techniques for designing and development of stored procedures to be called from PHP code',4,2.95,0.1,'2008-03-04 00:00:00','2008-03-06 00:00:00','http://www.websiteforever.com/lphp_2008_03_04.php',null,1,100,'2009-06-03 13:32:37')
, ('LPHP-2008-03-05',2,'Simply PHP Data Objects Programming ','Introduce to PHP Data Objects programming for developing dynamic websites',8,2.95,0.2,'2008-03-04 00:00:00','2008-03-06 00:00:00','http://www.websiteforever.com/lphp_2008_03_05.php',null,1,100,'2009-06-03 13:32:37')
, ('LPHP-2008-03-06',2,'Advanced PHP Data Objects Implementation and Test','Show how to use advanced website techniques using PHP Data Objects',6,2.95,0,'2008-03-04 00:00:00','2008-03-06 00:00:00','http://www.websiteforever.com/lphp_2008_03_06.php',null,1,100,'2009-06-03 13:32:37')
, ('SQLP-2008-01-01',1,'Simple SQL Programming For Fun','Explain a simple and easy way of SQL programming',5,1.59,0,'2008-01-02 00:00:00','2008-01-04 00:00:00','http://www.sqlprogramming.com/sqlp_2008_01_01.php',null,1,100,'2009-06-03 16:35:49')
, ('SQLP-2008-01-02',1,'Learning SQL Programming for Night Students','Show SQL programming tutorials and tips for any type of students',4,1.59,0.5,'2008-01-02 00:00:00','2008-01-04 00:00:00','http://www.sqlprogramming.com/sqlp_2008_01_01.php',null,1,100,'2009-06-03 16:35:49')
, ('SQLP-2008-01-03',1,'SQL Programming Language Made Easy','Explain how easy is to program SQL',8,1.59,0,'2008-01-02 00:00:00','2008-01-04 00:00:00','http://www.sqlprogramming.com/sqlp_2008_10_03.php',null,1,100,'2009-06-03 16:35:49')
, ('SQLP-2008-01-04',1,'Advanced SQL Programming for MySQL','Introduce to complex SQL programming scripts',7,1.59,0.3,'2008-01-02 00:00:00','2008-01-04 00:00:00','http://www.sqlprogramming.com/sqlp_2008_10_04.php',null,1,100,'2009-06-03 16:35:49')
, ('SQLP-2008-01-05',1,'Is SQL Script Simple?','Show many simple examples and tips of SQL scripts',6,1.59,0.4,'2008-01-02 00:00:00','2008-01-04 00:00:00','http://www.sqlprogramming.com/sqlp_2008_10_05.php',null,1,100,'2009-06-03 16:35:49')
, ('SQLP-2008-01-06',1,'Doing SQL Programming For Myself','Provide good practical of SQL scripts for any database developer',5,1.59,0,'2008-01-02 00:00:00','2008-01-04 00:00:00','http://www.sqlprogramming.com/sqlp_2008_10_06.php',null,1,100,'2009-06-03 16:35:49')
, ('SQLP-2008-03-01',2,'Introduction To SQL Programming For MySQL','Provide good practical of SQL scripts for any database developer',4,1.59,0.3,'2008-03-05 00:00:00','2008-03-07 00:00:00','http://www.sqlprogramming.com/sqlp_2008_03_01.php',null,1,100,'2009-06-03 16:35:49')
, ('SQLP-2008-03-02',2,'Programming Basics Of SQL Language','An introduction to SQL programming for MySQL',5,1.59,0.2,'2008-03-05 00:00:00','2008-03-07 00:00:00','http://www.sqlprogramming.com/sqlp_2008_03_02.php',null,1,100,'2009-06-03 16:35:49')
, ('SQLP-2008-03-03',2,'MySQL SQL Programming Using Toad','Show how to use Toad for MySQL freeware version to program SQL',7,1.59,0.25,'2008-03-05 00:00:00','2008-03-07 00:00:00','http://www.sqlprogramming.com/sqlp_2008_03_03.php',null,1,100,'2009-06-03 16:35:49')
, ('SQLP-2008-03-04',2,'SQL:2003 Programming For MySQL','Explain how to use SQL:2003 language to program MySQL data',8,1.59,0,'2008-03-05 00:00:00','2008-03-07 00:00:00','http://www.sqlprogramming.com/sqlp_2008_03_04.php',null,1,100,'2009-06-03 16:35:49')
, ('SQLP-2008-03-05',2,'Beginning SQL Programming','Provide simple scripts of SQL language for beginners',6,1.59,0.2,'2008-03-05 00:00:00','2008-03-07 00:00:00','http://www.sqlprogramming.com/sqlp_2008_03_05.php',null,1,100,'2009-06-03 16:35:49')
, ('SQLP-2008-03-06',2,'SQL Programming For Everyone','Introduce to SQL programming for everyone',4,1.59,0.15,'2008-03-05 00:00:00','2008-03-07 00:00:00','http://www.sqlprogramming.com/sqlp_2008_03_06.php',null,1,100,'2009-06-03 16:35:49');

DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `author_id` varchar(15) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `middle_name` char(1) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `job_description` varchar(300) DEFAULT NULL,
  `street_1` varchar(30) NOT NULL,
  `street_2` varchar(30) DEFAULT NULL,
  `city` varchar(30) NOT NULL,
  `state_province` varchar(20) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `country` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `website` varchar(50) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `notes` tinytext,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `updated_id` varchar(50) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO author (author_id,first_name,last_name,middle_name,title,job_description,street_1,street_2,city,state_province,zip_code,country,phone,fax,email,website,picture,notes,active,updated_id,updated_date) 
VALUES ('bko-96-234','Brian','Kelly','O','Junior Application Tester','Windows and Internet applications test and upgrades','892 NE Gray Avenue',null,'Portland','OR','97231','USA','503.932.6732','503.932.6733','bs.bkweblink.com','www.bkweblink.com','people1.jpg',null,1,100,'2009-05-04 16:08:31')
, ('cln-23-994','Cindy','Littler','N','MySQL Database Administrator','Manage MySQL production databases','PO Box 3432',null,'Hillsboro','OR','97231','USA','503.345.6745','503.345.6756','cl.alabcweb.com','www.clabcweb.com','people2.jpg',null,1,100,'2009-05-04 16:08:31')
, ('dth-34-345','David','Clark','H','General Software Manager','Computer system manage and support','PO Box 4563',null,'Astoria','OR','97231','USA','503.983.9040','503.983.9041','dt.dtonline.com','www.dtonline.com','people3.jpg',null,1,100,'2009-05-04 15:37:54')
, ('gdk-79-756','George','Dallas','K','Open Source Website Programmer','Design and development Open Source websites','PO Box 7893',null,'Beaverton','OR','97231','USA','503.672.9038','503.672.9039','gd.mdwebhours.com','www.gdwebhours.com','people4.jpg',null,1,100,'2009-05-04 16:08:31')
, ('jbm-89-792','John','Black','M','Business Analyst','Computer systems analysis and documentation','456 NW 10th Avenue',null,'Beaverton','OR','97231','USA','503.875.9043','503.875.9044','jb.jbweb.com','www.jbweb.com','people5.jpg',null,1,100,'2009-05-04 13:14:16')
, ('jps-34-345','John','Penne','S','Help Desk Manager Analyst','Help desk system analysis and documentation','12 NW 45th Avenue',null,'Hillsboro','OR','97231','USA','503.631.3462','503.631.3463','jp.jprightweb.com','www.jprightweb.com','people6.jpg',null,1,100,'2009-05-05 10:14:12')
, ('jpy-45-623','Jessica','Penny','Y','Windows Installation Assistant','Windows applications test and upgrades','90 SW Chart Street',null,'Beaverton','OR','97231','USA','503.783.6723','503.783.6724','jp.jbwebcongig.com','www.jbwebcongig.com','people7.jpg',null,1,100,'2009-05-05 10:14:12')
, ('jri-43-442','Joan','Richter','I','Database Technical Supporter','Support and upgrades production databases','PO Box TK23',null,'Hillsboro','OR','97231','USA','503.546.5353','503.546.5354','jr.jrweblab.com','www.jrweblab.com','people8.jpg',null,1,100,'2009-05-05 10:14:12')
, ('jsm-56-873','Joel','Smith','M','Junior Application Tester','Computer systems test and documentation','67 SW Clear Street',null,'Eugene','OR','97231','USA','503.784.3421','503.784.3422','js.jscool.com','www.jscool.com','people9.jpg',null,1,100,'2009-05-04 14:32:37')
, ('mbq-86-904','Maria','Beam','Q','Webinar Administrator','Webinar websites setup and maintenances','77 NE Main Avenue',null,'Astoria','OR','97231','USA','503.742.4581','503.742.4582','mb.mbworld.com','www.mbworld.com','people10.jpg',null,1,100,'2009-05-04 16:08:31')
, ('mjj-23-568','Michael','Junior','J','Senior Website Programmer','Design and development websites','90 SE North Plain Road',null,'Corvallis','OR','97231','USA','503.905.4593','503.905.4594','mj.mjsee.com','www.mjsee.com','people11.jpg',null,1,100,'2009-05-04 15:21:37')
, ('mmr-76-234','Matt','Miller','R','System Deployment Tester','Deploy and test computer systems','PO Box 5000',null,'Hillsboro','OR','97231','USA','503.675.2312','503.675.2313','mr.mrforweb.com','www.mrforweb.com','people12.jpg',null,1,100,'2009-05-04 16:08:31')
, ('mnt-53-789','Matthew','Novak','T','General Application Manager','System application manage and organization','PO Box 8765',null,'Portland','OR','97231','USA','503.643.8942','503.643.8943','mn.mnwebgain.com','www.mnwebgain.com','people1.jpg',null,1,100,'2009-05-05 10:14:12')
, ('nlb-75-566','Nancy','Lopez','B','Senior Website Programmer','Design and development dynamic websites','2020 NE 4th Avenue',null,'Eugene','OR','97231','USA','503.532.5432','503.532.5433','nl.nlallonline.com','www.nlallonline.com','people2.jpg',null,1,100,'2009-05-05 10:14:12')
, ('osk-87-839','Olga','Singer','K','Junior System Tester','Computer systems test, upgrades and documentation','PO Box 3432',null,'Portland','OR','97231','USA','503.732.2321','503.732.2322','os.osweblink.com','www.osweblink.com','people3.jpg',null,1,100,'2009-05-05 10:14:12')
, ('rws-64-891','Richard','White','S','Senior Technical Writer','Write system presentation and documentation','12 NE Base Street',null,'Portland','OR','97231','USA','503.893.2323','503.893.2324','rw.rwattheweb.com','www.rwattheweb.com','people4.jpg',null,1,100,'2009-05-04 15:37:54')
, ('sbq-45-905','Scott','Brown','Q','Network Administrator','Network systems setup and maintenances','PO Box 1232 ',null,'Corvallis','OR','97231','USA','503.562.4821','503.562.4822','sb.sbinter.com','www.sbinter.com','people5.jpg',null,1,100,'2009-05-04 15:37:54')
, ('stj-76-643','Steve','Timmer','J','Senior Website Designer','Graphical design of websites','120 NW Fast Road',null,'Corvallis','OR','97231','USA','503.742.1231','503.742.1232','st.stforweb.com','www.stforweb.com','people5.jpg',null,1,100,'2009-05-05 10:14:12')
, ('tge-85-452','Tony','Gates','E','Web Server Administrator','Web servers installation, configuration and maintenances','342 NE Michael Street',null,'Astoria','OR','97231','USA','503.351.3452','503.351.3453','tg.tgonlineworld.com','www.tgonlineworld.com','people6.jpg',null,1,100,'2009-05-05 10:14:12')
, ('tmp-21-528','Timothy','Myers','P','Assistant Software Engineer','Update and support of computer systems','124 NW 2nd Avenue',null,'Eugene','OR','97231','USA','503.563.5762','503.563.5763','tm.tmvisist.com','www.tmvisist.com','people7.jpg',null,1,100,'2009-05-04 16:08:31');

DROP TABLE IF EXISTS `article_author`;
CREATE TABLE `article_author` (
  `article_id` varchar(15) NOT NULL,
  `author_id` varchar(15) NOT NULL,
  `au_paid_amount` decimal(10,2) NOT NULL,
  `au_paid_date` date NOT NULL,
  `au_percent_increase` int(10) DEFAULT NULL,
  `notes` tinytext,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `updated_id` varchar(50) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_id`,`author_id`),
  KEY `au_id` (`author_id`),
  CONSTRAINT `article_author_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  CONSTRAINT `article_author_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO article_author (article_id,author_id,au_paid_amount,au_paid_date,au_percent_increase,notes,active,updated_id,updated_date) 
VALUES ('ADDD-2008-01-01','bko-96-234',125.75,'2007-12-04 00:00:00',10,null,1,100,'2009-06-13 20:37:19')
, ('ADDD-2008-01-02','cln-23-994',130.25,'2007-12-11 00:00:00',5,null,1,100,'2009-06-13 20:42:28')
, ('ADDD-2008-01-03','jri-43-442',122.25,'2007-12-14 00:00:00',25,null,1,100,'2009-06-13 21:13:07')
, ('ADDD-2008-01-04','jbm-89-792',155.17,'2007-12-06 00:00:00',10,null,1,100,'2009-06-13 21:11:53')
, ('ADDD-2008-01-05','jps-34-345',112.52,'2007-12-07 00:00:00',15,null,1,100,'2009-06-13 21:11:21')
, ('ADDD-2008-01-06','jpy-45-623',110.15,'2007-12-17 00:00:00',20,null,1,100,'2009-06-13 21:12:12')
, ('ADDD-2008-03-01','jsm-56-873',125.55,'2007-12-13 00:00:00',5,null,1,100,'2009-06-13 21:12:27')
, ('ADDD-2008-03-02','mbq-86-904',115.35,'2007-12-19 00:00:00',12,null,1,100,'2009-06-13 21:12:42')
, ('ADDD-2008-03-03','mjj-23-568',130.42,'2007-12-14 00:00:00',15,null,1,100,'2009-06-13 21:13:25')
, ('ADDD-2008-03-04','mmr-76-234',105.15,'2007-12-12 00:00:00',10,null,1,100,'2009-06-13 21:14:09')
, ('ADDD-2008-03-05','gdk-79-756',185.05,'2007-12-10 00:00:00',5,null,1,100,'2009-06-13 20:45:56')
, ('ADDD-2008-03-06','mnt-53-789',170.15,'2007-12-18 00:00:00',25,null,1,100,'2009-06-13 21:13:42')
, ('LPHP-2008-01-01','jpy-45-623',125.05,'2007-12-11 00:00:00',15,null,1,100,'2009-06-13 21:40:49')
, ('LPHP-2008-01-02','jsm-56-873',165.15,'2007-12-14 00:00:00',20,null,1,100,'2009-06-13 21:44:53')
, ('LPHP-2008-01-03','tmp-21-528',115.35,'2007-12-04 00:00:00',5,null,1,100,'2009-06-13 21:44:35')
, ('LPHP-2008-01-04','tge-85-452',145.12,'2007-12-03 00:00:00',10,null,1,100,'2009-06-13 21:43:33')
, ('LPHP-2008-01-05','stj-76-643',150.28,'2007-12-04 00:00:00',15,null,1,100,'2009-06-13 21:43:14')
, ('LPHP-2008-01-06','sbq-45-905',120.59,'2007-12-17 00:00:00',5,null,1,100,'2009-06-13 21:42:53')
, ('LPHP-2008-03-01','rws-64-891',138.35,'2007-12-21 00:00:00',10,null,1,100,'2009-06-13 21:41:54')
, ('LPHP-2008-03-02','nlb-75-566',165.25,'2007-12-07 00:00:00',25,null,1,100,'2009-06-13 21:41:07')
, ('LPHP-2008-03-03','jpy-45-623',145.69,'2007-12-17 00:00:00',20,null,1,100,'2009-06-13 21:52:45')
, ('LPHP-2008-03-03','sbq-45-905',170.35,'2007-12-14 00:00:00',5,null,1,100,'2009-06-13 21:53:32')
, ('LPHP-2008-03-04','jpy-45-623',115.28,'2007-12-19 00:00:00',15,null,1,100,'2009-06-13 21:53:14')
, ('LPHP-2008-03-06','osk-87-839',125.38,'2007-12-13 00:00:00',10,null,1,100,'2009-06-13 21:41:23')
, ('SQLP-2008-01-01','stj-76-643',130.16,'2007-12-21 00:00:00',5,null,1,100,'2009-06-13 22:07:50')
, ('SQLP-2008-01-02','jri-43-442',118.25,'2007-12-10 00:00:00',20,null,1,100,'2009-06-13 22:10:19')
, ('SQLP-2008-01-03','gdk-79-756',135.22,'2007-12-04 00:00:00',15,null,1,100,'2009-06-13 22:10:34')
, ('SQLP-2008-01-04','sbq-45-905',160.25,'2007-12-14 00:00:00',25,null,1,100,'2009-06-13 22:10:51')
, ('SQLP-2008-01-05','bko-96-234',115.35,'2007-12-10 00:00:00',10,null,1,100,'2009-06-13 22:08:14')
, ('SQLP-2008-01-06','cln-23-994',128.12,'2007-12-20 00:00:00',5,null,1,100,'2009-06-13 22:08:33')
, ('SQLP-2008-03-01','tmp-21-528',105.25,'2007-12-18 00:00:00',30,null,1,100,'2009-06-13 22:08:50')
, ('SQLP-2008-03-02','rws-64-891',145.35,'2007-12-21 00:00:00',20,null,1,100,'2009-06-13 22:09:00')
, ('SQLP-2008-03-03','mnt-53-789',155.29,'2007-12-19 00:00:00',10,null,1,100,'2009-06-13 22:09:11')
, ('SQLP-2008-03-04','sbq-45-905',140.15,'2007-12-17 00:00:00',5,null,1,100,'2009-06-13 22:09:25')
, ('SQLP-2008-03-05','osk-87-839',130.45,'2007-12-03 00:00:00',25,null,1,100,'2009-06-13 22:09:36')
, ('SQLP-2008-03-06','jpy-45-623',170.12,'2007-12-21 00:00:00',15,null,1,100,'2009-06-13 22:09:46');

