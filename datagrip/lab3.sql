CREATE DATABASE laboratory_work3;

CREATE TABLE departments (
  code INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  budget DECIMAL NOT NULL
);

CREATE TABLE employees (
  ssn INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  department INTEGER NOT NULL ,
  city VARCHAR(255),
  FOREIGN KEY (department) REFERENCES departments(code)
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  city VARCHAR(255)

);

INSERT INTO departments(code,name,budget) VALUES(14,'IT',65000);
INSERT INTO departments(code,name,budget) VALUES(37,'Accounting',15000);
INSERT INTO departments(code,name,budget) VALUES(59,'Human Resources',240000);
INSERT INTO departments(code,name,budget) VALUES(77,'Research',55000);
INSERT INTO departments(code,name,budget) VALUES(45,'Management',155000);
INSERT INTO departments(code,name,budget) VALUES(11,'Sales',85000);

INSERT INTO employees(ssn,name,lastname,department, city) VALUES('123234877','Michael','Rogers',14, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('152934485','Anand','Manikutty',14, 'Shymkent');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('222364883','Carol','Smith',37, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('326587417','Joe','Stevens',37, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332154719','Mary-Anne','Foster',14, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332569843','George','ODonnell',77, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('546523478','John','Doe',59, 'Shymkent');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('631231482','David','Smith',77, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('654873219','Zacary','Efron',59, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('745685214','Eric','Goldsmith',59, 'Atyrau');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657245','Elizabeth','Doe',14, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657246','Kumar','Swamy',14, 'Almaty');



INSERT INTO customers(name,lastname, city) VALUES('John','Wills', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Garry','Foster', 'London');
INSERT INTO customers(name,lastname, city) VALUES('Amanda','Hills', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('George','Doe', 'Tokyo');
INSERT INTO customers(name,lastname, city) VALUES('David','Little', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Shawn','Efron', 'Astana');
INSERT INTO customers(name,lastname, city) VALUES('Eric','Gomez', 'Shymkent');
INSERT INTO customers(name,lastname, city) VALUES('Elizabeth','Tailor', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Julia','Adams', 'Astana');

SELECT name FROM employees;
SELECT distinct lastname FROM employees;
SELECT * FROM employees WHERE lastname = 'Smith';
SELECT * FROM employees WHERE lastname = 'Smith' OR lastname = 'Doe';
SELECT * FROM employees WHERE department = 59;
SELECT * FROM employees WHERE department = 14 OR department = 77;
SELECT * FROM employees WHERE city = 'Almaty';
SELECT SUM(budget)
    FROM departments;
SELECT department, count(*) FROM employees GROUP BY department;
SELECT department, count(department) FROM employees GROUP BY department HAVING count(department) > 2;

SELECT name, budget FROM departments
WHERE budget = (SELECT MAX(budget)  FROM departments
WHERE budget < (SELECT MAX(budget)  FROM departments));

SELECT name,lastname FROM employees
WHERE department = (SELECT code FROM departments WHERE budget = (SELECT MAX(budget) FROM departments))
OR  department = (SELECT code FROM departments WHERE budget = (SELECT MIN(budget) FROM departments));

SELECT name FROM employees WHERE city = 'Astana'
UNION
SELECT name FROM customers WHERE city = 'Astana';

SELECT code FROM departments WHERE budget > 55000
    ORDER BY code desc, budget asc;

UPDATE departments
SET  budget = budget * 0.9
WHERE budget = (SELECT MIN(budget) FROM departments);

SELECT budget FROM departments;

UPDATE employees
SET department =
(SELECT code FROM departments WHERE name = 'IT')
WHERE department = (SELECT code FROM departments WHERE name = 'Reasearch');

SELECT name FROM departments;

DELETE FROM departments WHERE name = 'IT';
DELETE FROM employees;

SELECT * FROM departments
LIMIT 5 OFFSET 5;

SELECT code FROM departments
INTERSECT
SELECT department FROM employees;