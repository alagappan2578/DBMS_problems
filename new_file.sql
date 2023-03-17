CREATE DATABASE IF NOT EXISTS exam_work;

USE exam_work;

CREATE TABLE countries (
country_id VARCHAR(2) PRIMARY KEY,
country_name VARCHAR(40),
region_id INT
);

DESCRIBE countries;

ALTER TABLE countries
ADD country_code VARCHAR(3);

ALTER TABLE countries
DROP country_code ;

INSERT INTO countries ( country_id, country_name, region_id)
VALUES
("01", "America", 61101);

INSERT INTO countries ( country_id, country_name)
VALUES
("02", "Africa");

INSERT INTO countries ( country_id, country_name, region_id)
VALUES
("03", "Italy", null),
("04", "Germany", 61101),
("05", "India", 61101);

UPDATE countries
SET region_id = 1234567890;

SELECT *
FROM countries;

CREATE TABLE IF NOT EXISTS user(
userid VARCHAR(50),
username VARCHAR(50) PRIMARY KEY,
email VARCHAR(100),
address VARCHAR(200),
password VARCHAR(50),
phone VARCHAR(20)
);
Numbers: INT, BIGINT
Decimal numbers (eg. 3.14) : DOUBLE
Strings:
-- if fixed length : CHAR(2)
--if variable length: VARCHAR(255)
date: DATE
date:DATE
Datetime:DATETIME
Boolean:TINYINT
DESCRIBE user;
-- CREATE TABLE user (
-- );
-- ADD table
ALTER TABLE user
ADD whatsapp_no INT;
-- MODIFY table
ALTER TABLE user
MODIFY whatsapp_no VARCHAR(20);
-- Rename a column name
ALTER TABLE user
RENAME COLUMN username TO user_name;
-- Delete a column
ALTER TABLE user
DROP whatsapp_no;
-- CONSTRAINTS *****
-- NOT NULL
-- UNIQUE
-- PRIMARY KEY
-- FOREIGN KEY
-- DEFAULT
-- CHECK
DESCRIBE user;
-- Read the table
SELECT *
FROM user;
-- DELETE ALL ROWS
DELETE FROM user;
-- Insert users into the user table
INSERT INTO user (userid, user_name, email, address, password, phone)
VALUES
("user7", "Thamim", "thamim@gmail.com", "Chennai", "1234", "1234567897"),
("user8", "Raj", "raj@gmail.com", "Chennai", "1234", "1234567898"),
("user9", "Mardhu", "marudhu@gmail.com", "Chennai", "1234", "1234567899"),
("user10", "King", "king@gmail.com", "Chennai", "1234", "1234567811");
-- UPDATE TABLE values
UPDATE user
SET userid = "user6"
WHERE user_name = "Ram";
-- DELETE TABLE
DELETE FROM user
WHERE user_name ="KONG";
SELECT *
from user
order by userid;

