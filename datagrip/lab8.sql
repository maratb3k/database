CREATE DATABASE lab8;

CREATE TABLE countries(
    countries_id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);


CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    budget INTEGER
);

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary INTEGER,
    department_id INTEGER REFERENCES departments
);

INSERT INTO countries(countries_id, name)
VALUES (1, 'USA'),
       (2, 'Korea'),
       (3, 'Russia'),
       (4, 'Kazakhstan'),
       (5, 'China');

INSERT INTO departments(department_id, department_name, budget)
VALUES (40, 'Nyam', 5000),
       (50, 'Search', 1222),
       (60, 'Kore', 2998),
       (70, 'ReZero', 4997),
       (80, 'Naruto', 6666);

INSERT INTO employees(employee_id, first_name, last_name, salary, department_id)
VALUES (1, 'Asem', 'Maratbek', 1111111, 40),
       (2, 'Nurai', 'Turganbaeva', 0, 50),
       (3, 'Midzuki', 'Tokugava', 100577, 60),
       (4, 'Agata', 'Alekseeva', 20000, 70),
       (5, 'Erym', 'Bukebayeva', 10050, 80);

CREATE INDEX country_name
ON countries(name);
SELECT * FROM countries
WHERE name = 'China';

CREATE INDEX employees_name
ON employees(first_name, last_name);
SELECT * FROM employees
WHERE first_name = 'Erym' AND last_name = 'Bukebayeva';

SELECT * FROM employees WHERE salary < 200000
AND salary > 100000;
CREATE INDEX employees_salary
ON employees(salary);

SELECT * FROM employees
WHERE substring(first_name from 1 for 4) = 'Midz';
CREATE INDEX employees_first_name
ON employees(substring(first_name from 1 for 3));

SELECT * FROM employees e JOIN departments
d ON d.department_id = e.department_id
WHERE d.budget > 40 AND e.salary < 70;


CREATE INDEX name ON departments USING RTREE(department_name);



