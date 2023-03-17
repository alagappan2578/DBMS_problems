-- SQL is case-insensitive

/*
We will follow 
Uppercase : Keywords

*/
-- USE exercise_hr;

-- SHOW TABLES;

-- USE store;
-- SELECT *
-- FROM customers;

-- SELECT *
-- FROM customers
-- ORDER BY first_name ASC;

-- -- ORDER BY <COLUMN_NAME> DESC for descending order

-- SELECT *
-- FROM customers
-- ORDER BY last_name DESC;

-- USE exercise_hr;

-- SELECT *
-- FROM employees
-- ORDER BY FIRST_NAME DESC;

-- SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY FROM employees ORDER BY salary ASC;
USE store;

-- SELECT *
-- FROM customers
-- ORDER BY last_name DESC, birth_date DESC;

-- SELECT 1 AS vaue;

-- SELECT  DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), birth_date)), '%Y') + 0 AS age
-- FROM customers;

-- USE store;

-- SELECT *
-- FROM customers
-- WHERE state = 'FL';

/* Comparing operator: > >= < <= = != or <> */

-- SELECT * 
-- FROM customers
-- WHERE points > 3000 ;
-- USE store;
-- SELECT * 
-- FROM customers
-- WHERE state = 'FL' AND birth_date >= '1990-01-01';

-- USE store;
-- SELECT * 
-- FROM customers
-- WHERE points > 3000 OR birth_date > '1990-01-01' OR state = 'FL';

-- USE store;
-- SELECT * 
-- FROM customers
-- WHERE birth_date >= '1989-01-01' OR points > 3000 AND state = 'VA';

-- USE store;
-- SELECT * 
-- FROM customers
-- WHERE points < 4000 AND birth_date >= '1989-01-01' OR state = 'VA';

-- USE store;
-- SELECT *
-- FROM customers
-- WHERE NOT (state = 'FL');

USE store;
SELECT *
FROM products
WHERE quantity_in_stock IN (49, 38, 72);

SELECT *
FROM customers
WHERE quantity_in_stock IN (49, 38, 72);

-- last name contain 'age'
SELECT *
FROM customers
WHERE last_name LIKE '%age%';

-- last name contain '5 letter and y'
SELECT *
FROM customers
WHERE last_name LIKE '_____y';

-- % any number of character
-- _ single character

-- all customers living in a state ending in A.

SELECT *
FROM customers
WHERE state LIKE '%A';

SELECT *
FROM customers
WHERE last_name LIKE 'b____y';

SELECT *
FROM customers
WHERE last_name REGEXP 'field';

-- ^p means it the word p is start letter.
-- 'field$' it means get word in last in word 
SELECT *
FROM customers
WHERE last_name REGEXP 'field$|^mac';

SELECT *
FROM customers
WHERE last_name REGEXP 'EY$|ON$';

/*
 ^ (caret) - start with 
 $ - ends with 
 | (pipe) - logical OR
 [.] - set 
 */
 SELECT *
FROM customers
WHERE last_name REGEXP 'ae|be|ce|de|ee|fe|ge|he';

 SELECT *
FROM customers
WHERE last_name REGEXP '[abcdef]e';

 SELECT *
FROM customers
WHERE last_name REGEXP '[a-h]e';

-- we want to have customers who have 'ge', 'ie' or'me' in their last name

 SELECT *
FROM customers
WHERE last_name REGEXP '[gim]e';

--  want to have customers last names with 6 chracter,
 SELECT *
FROM customers
WHERE last_name REGEXP '^[a-z][a-z][a-z][a-z][a-z][a-z]$';


 SELECT *
FROM customers
WHERE last_name REGEXP '[gim]e';

--  want to have customers last names with 6 chracter,

-- .*  = % 

-- B followed by R or U in last name

 SELECT *
FROM employees
WHERE last_name REGEXP 'b.*(r|u)';


 SELECT *
FROM employees
WHERE last_name REGEXP 'b.*[ru]';

-- NULL operator
-- select customers where phone is NULL

USE store ;
SELECT * 
FROM customers
-- we did not use = in sql (null = null ) not right in sql 
-- we should use IS key for that.
WHERE phone IS NULL ;

-- select customers where phone is not NULL
SELECT * 
FROM customers
WHERE phone IS NOT NULL ;

USE exercise_hr;

-- HR : sort employees based according to their department and their first name 

-- get top 3 customers
SELECT * 
FROM customers
LIMIT 3;

-- get top 3 loyal customers
SELECT * 
FROM customers
ORDER BY points DESC LIMIT 3;

SELECT * 
FROM customers
LIMIT 3,3;

-- EXPLAIN statement

EXPLAIN
SELECT *
FROM customers;

EXPLAIN
SELECT * 
FROM employees
WHERE first_name = 'Lex' ;

-- Write a query to get the total salaries payable to employees.

USE exercise_hr;

SELECT department_id
FROM departments
WHERE DEPARTMENT_NAME = 'IT' ;

SELECT *
FROM employees
WHERE DEPARTMENT_ID =  ;



SELECT SUM(salary) AS total_salary
FROM employees;

-- Write a query to get the maximum and minimum salary from employees table.

SELECT MIN(salary) AS min_salary
FROM employees;
SELECT MAX(salary) AS max_salary
FROM employees;

-- Write a query to get the average salary and number of employees in the employees table.

SELECT AVG(salary) AS AVG_salary
FROM employees;

SELECT COUNT(employee_id) AS count_of_employee
FROM employees;

-- Write a query to get the number of employees working with the company.


-- Write a query to get the number of distinct jobs available in the employees table.
SELECT COUNT( DISTINCT job_id) as no_of_jobs
FROM employees;

-- Write a query to get the names ('<first name> <last name>') (for example Ellen Abel, Sundar Ande etc.) as a single column of all the employees from employees table.

SELECT CONCAT(first_name," ",last_name) AS fullname
FROM employees;

-- Write a query to get the length of the employee names ('<first name> <last name>') from employees table.

SELECT LENGTH(CONCAT(first_name," ",last_name)) AS fullname_length
FROM employees;

-- Write a query to get monthly salary (round 2 decimal places) of each and every employee

SELECT ROUND(salary)
FROM employees;

-- Write the join query to get the information of the manager of every employee
SELECT *
FROM employees AS e INNER JOIN employees AS m
ON e.manager_id = m.employee_id;

SELECT e.employee_id AS 'Employee ID',
CONCAT(e.first_name, e.last_name) AS 'Employee name', 
m.employee_id AS 'Manager ID', 
CONCAT(m.first_name, m.last_name) AS 'Manager name'
FROM employees AS e INNER JOIN employees AS m
ON e.manager_id = m.employee_id;

-- Write a query to find the name (first_name, last name), department ID and name of all the employees.
use exercise_hr;
select first_name, last_name, d.department_id, department_name
from employees AS e inner join departments AS d
on e.department_id = d.department_id;

-- Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.

SELECT first_name,last_name,e.department_id,city,job_title
FROM employees AS e INNER JOIN departments AS d INNER JOIN locations AS n INNER JOIN jobs AS j
ON e.department_id = d.department_id
WHERE city = 'london';

 
--  3. Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).
SELECT e.employee_id AS 'Emp_Id', e.last_name AS 'Employee', m.employee_id AS 'Mgr_Id', m.last_name AS 'Manager' 
FROM employees AS e INNER join employees AS m 
ON (e.manager_id = m.employee_id);
​
 
--  4. Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'.
 
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > (
SELECT hire_date
FROM employees
WHERE last_name = 'Jones'
)
ORDER BY hire_date;
​

-- 5.Write a query to get the department name and number of employees in the department. (Requires GROUP BY)
​
SELECT departments.department_name, COUNT(employees.employee_id) as num_employees
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
GROUP BY departments.department_name;
​
-- 6.Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.
​
SELECT e.employee_id, n.job_title, DATEDIFF(j.end_date, j.start_date)  AS days_worked,e.department_id
FROM employees AS e INNER JOIN job_history AS j INNER JOIN jobs AS n
ON e.job_id = n.job_id INNER JOIN departments as d
ON e.department_id = d.department_id
WHERE e.department_id = 90;
​
-- 7.Find the CEO from the employee table.
SELECT *
FROM employees AS e INNER JOIN employees AS m
ON e.manager_id = m.employee_id
WHERE m.manager_id = null;
SELECT*
FROM employees;

SELECT*
FROM departments;





