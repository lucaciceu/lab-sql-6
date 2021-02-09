use sakila;

--  In this activity we are going to do some database maintenance. In the current database we only have information on movies for the year 2006. Now we have received the film catalog for 2020 as well. For this new data we will create another table and bulk insert all the data there. Code to create a new table has been provided below.
drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` varchar(255),
  `rental_rate` varchar(255),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` varchar(255) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

show variables like 'local_infile';
set global local_infile = 1;

show variables like 'secure_file_priv';

set sql_safe_updates = 0;


LOAD DATA INFILE '/ProgramData/MySQL/MySQL Server 8.0/Uploads/films_2020.csv' 
INTO TABLE films_2020
FIELDS TERMINATED BY ',';

select * from films_2020;

update films_2020 set rental_duration = '3', rental_rate = '2.99', replacement_cost = '8.99' ;
