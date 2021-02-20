CREATE DATABASE lab6;

CREATE TABLE locations(
    location_id SERIAL PRIMARY KEY,
    street_address VARCHAR(25),
    postal_code VARCHAR(12),
    city VARCHAR(30),
    state_province VARCHAR(12)
);

CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    budget INTEGER,
    location_id INTEGER REFERENCES locations
);

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    salary INTEGER,
    department_id INTEGER REFERENCES departments
);

INSERT INTO locations(location_id, street_address, postal_code, city, state_province)
VALUES (1, 'Zavetnaya', 155, 'Almaty', 'Kaskelen'),
       (2, 'Tole bi', 156, 'Almaty', 'Almaly'),
       (3, 'Turan', 157, 'Astana', 'Esil'),
       (4, 'Seifullin', 158, 'Astana', 'Saryarka'),
       (5, 'Tarazi', 159, 'Taraz', 'Zhambyl');

INSERT INTO departments(department_id, department_name, budget, location_id)
VALUES (40, 'Nyam', 5000, 1),
       (50, 'Search', 1222, 2),
       (60, 'Kore', 2998, 3),
       (70, 'ReZero', 4997, 4),
       (80, 'Naruto', 6666, 5);

INSERT INTO employees(employee_id, first_name, last_name, email, phone_number, salary, department_id)
VALUES (1, 'Asem', 'Maratbek', 'pupervuper@gmail.com', '87774449992', 1111111, 40),
       (2, 'Nurai', 'Turganbaeva', 'chort@gmail.com', '87755106017', 0, 50),
       (3, 'Midzuki', 'Tokugava', 'misatoki@inbox.ja', '0055333147', 100577, 60),
       (4, 'Agata', 'Alekseeva', 'a.aleks@mail.ru', '77785559993', 20000, 70),
       (5, 'Erym', 'Bukebayeva', 'zhivoitrup@kbtu.kz', '5555555555', 10050, 80);

SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
INNER JOIN departments d ON d.department_id = e.department_id;

SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
INNER JOIN departments d ON (d.department_id = e.department_id) AND (e.department_id = 40 OR e.department_id = 80);

SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province
FROM employees e
INNER JOIN departments d on d.department_id = e.department_id
INNER JOIN locations l on l.location_id = d.location_id;

SELECT * FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id;

SELECT * FROM employees e
RIGHT JOIN departments d on d.department_id = e.department_id;

SELECT e.first_name, e.last_name
FROM employees e
INNER JOIN locations l ON l.location_id = e.employee_id AND l.city = 'Almaty';

INSERT INTO employees(employee_id, first_name, last_name, email, phone_number, salary, department_id)
VALUES(7, 'Aset', 'Zhumekenov', 'aset@gmail.com', '87473551405', 1202, NULL);


SELECT * FROM departments d
LEFT JOIN employees e on d.department_id = e.department_id
WHERE e.department_id IS NULL;


