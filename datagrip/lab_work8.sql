CREATE DATABASE lab_work8;

CREATE TABLE countries(
    location_id serial primary key,
    street_address varchar(25),
    postal_code varchar(12),
    name varchar(30),
    state_province varchar(12)
);

CREATE TABLE departments(
    department_id serial primary key,
    department_name varchar(50) unique,
    budget integer,
    location_id integer references locations
);

CREATE TABLE employees(
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(50),
    salary integer,
    substring integer
);

INSERT INTO countries(street_address, postal_code, name, state_province)
VALUES
('Tole bi', '59', 'Almaty', 'Almaly'),
('Baizhanbayeva', '9', 'Almaty','Ayezov'),
('Ashimov', '6TY2', 'Semei', 'Zhandosova'),
('Saina', 'UQ5T', 'Shymkent', 'Bostandyk'),
('Kazybek bi', 'E5M8', 'Astana', 'Medeu');


INSERT INTO departments(department_id, department_name, budget, location_id)
VALUES
(40, 'DEP1', 40000, 3),
(80, 'DEP3', 29300, 5),
(60, 'DEP2', 52000, 2),
(50, 'DEP5', 82000, 4),
(70, 'DEP4', 102000, 1);

INSERT INTO employees(first_name, last_name, email, phone_number, salary, substring)
VALUES
('Anya', 'Korsova', 'anya@gmail.com', '87923992299', 89000, 1),
('Riz', 'Smith', 'r_wizard@gmail.com', '87026673215', 77000, 4),
('Karen', 'Bilson', 'karen020345@gmail.com', '87007931288', 77000, 2),
('Tana', 'Tanys', 'ta_tanys@mail.com', '87204437744', 60000, 3),
('Bob', 'Debb', 'bobby@mail.com', '87074990015', 143000, null);

SELECT * FROM countries WHERE name = 'Almaty';
--1,Tole bi,59,Almaty,Almaly
--2,Baizhanbayeva,9,Almaty,Ayezov

EXPLAIN SELECT * FROM countries WHERE name = 'Almaty';
CREATE INDEX countriesName1 ON countries(name) WHERE name = 'Almaty';
--Seq Scan on countries  (cost=0.00..1.06 rows=1 width=234)
  --Filter: ((name)::text = 'Almaty'::text)

SELECT * FROM employees WHERE first_name = 'Karen' AND last_name = 'Bilson';
--3,Karen,Bilson,karen020345@gmail.com,87007931288,77000,8,
--8,Karen,Bilson,karen020345@gmail.com,87007931288,77000,2,

EXPLAIN SELECT * FROM employees WHERE first_name = 'Karen' AND last_name = 'Bilson';
CREATE INDEX employeesNames ON employees(first_name, last_name) WHERE first_name = 'Karen' AND last_name = 'Bilson';
--Seq Scan on employees  (cost=0.00..1.15 rows=1 width=500)
  --Filter: (((first_name)::text = 'Karen'::text) AND ((last_name)::text = 'Bilson'::text))

SELECT * FROM employees WHERE salary < 400000 AND salary > 40000;
--1,Anya,Korsova,anya@gmail.com,87923992299,89000,4,
--2,Riz,Smith,r_wizard@gmail.com,87026673215,77000,4,
--3,Karen,Bilson,karen020345@gmail.com,87007931288,77000,8,
--4,Tana,Tanys,ta_tanys@mail.com,87204437744,60000,6,
--5,Bob,Debb,bobby@mail.com,87074990015,143000,,
--6,Anya,Korsova,anya@gmail.com,87923992299,89000,1,
--7,Riz,Smith,r_wizard@gmail.com,87026673215,77000,4,
--8,Karen,Bilson,karen020345@gmail.com,87007931288,77000,2,
--9,Tana,Tanys,ta_tanys@mail.com,87204437744,60000,3,
--10,Bob,Debb,bobby@mail.com,87074990015,143000,,

EXPLAIN SELECT * FROM employees WHERE salary < 400000 AND salary > 40000;
CREATE UNIQUE INDEX employeesSalary1 ON employees(salary)WHERE salary > 400000 AND salary > 40000;
--Seq Scan on employees  (cost=0.00..1.15 rows=1 width=500)
  --Filter: ((salary < 400000) AND (salary > 40000))

SELECT * FROM employees WHERE substring(first_name from 1 for 4) = 'Karen';
EXPLAIN SELECT * FROM employees WHERE substring(first_name from 1 for 4) = 'Karen';
CREATE INDEX employees_subName ON employees(first_name)WHERE substring(first_name from 1 for 4) = 'Karen';
--Seq Scan on employees  (cost=0.00..1.15 rows=1 width=500)
--"  Filter: (""substring""((first_name)::text, 1, 4) = 'Karen'::text)"

SELECT * FROM employees e JOIN departments d ON d.department_id = department_id;
--1,Anya,Korsova,anya@gmail.com,87923992299,89000,4,,40,DEP1,40000,3
--1,Anya,Korsova,anya@gmail.com,87923992299,89000,4,,80,DEP3,29300,5
--1,Anya,Korsova,anya@gmail.com,87923992299,89000,4,,60,DEP2,52000,2
--1,Anya,Korsova,anya@gmail.com,87923992299,89000,4,,50,DEP5,82000,4
EXPLAIN SELECT * FROM employees e JOIN departments d ON d.department_id = department_id
WHERE d.budget > 30 AND e.salary < 30000;
CREATE INDEX join_salary ON employees using btree(salary);
--Nested Loop  (cost=0.00..18.81 rows=3 width=630)
  --->  Seq Scan on departments d  (cost=0.00..17.65 rows=1 width=130)
    --    Filter: ((department_id = department_id) AND (budget > 30))
 -- ->  Seq Scan on employees e  (cost=0.00..1.13 rows=3 width=500)
   --     Filter: (salary < 30000)


EXPLAIN SELECT * FROM employees;
CREATE INDEX name ON employees USING BTREE(first_name);

CREATE EXTENSION btree_gist;
EXPLAIN ANALYSE SELECT * FROM employees WHERE first_name is NULL;
CREATE INDEX rtree_employees1 ON employees USING RTREE(first_name);
EXPLAIN ANALYSE SELECT * FROM  employees WHERE first_name is Null;
--Execution time: 0.645 ms

SELECT budget FROM departments WHERE budget > 40;
--102000
EXPLAIN SELECT budget FROM departments WHERE budget > 40;
CREATE INDEX budget ON departments USING HASH(budget);
  --Filter: (budget > 40)

SELECT * FROM employees WHERE first_name = 'Bob' AND last_name = 'Debb';
--10,Bob,Debb,bobby@mail.com,87074990015,143000,,

EXPLAIN ANALYSE SELECT * FROM employees WHERE first_name = 'Bob' AND last_name = 'Debb';
CREATE UNIQUE INDEX index_updepart ON employees(first_name,last_name);
  --Filter: (((first_name)::text = 'Bob'::text) AND ((last_name)::text = 'Debb'::text))
 -- Rows Removed by Filter: 8
--Planning time: 0.347 ms
--Execution time: 0.053 ms


