CREATE DATABASE lab7;

CREATE TABLE salesmen(
      salesman_id INT,
      name VARCHAR(255),
      city VARCHAR(255),
      commision REAL
);

CREATE TABLE customers(
    customer_id INT,
    cust_name VARCHAR(255),
    city VARCHAR(255),
    grade INT,
    salesman_id INT
);

CREATE TABLE orders(
    ord_no INT,
    purch_amt REAL,
    ord_date VARCHAR(255),
    customer_id INT,
    salesman_id INT
);

INSERT INTO salesmen(salesman_id, name, city, commision) VALUES (5001, 'James Hoog', 'New York', 0.15);
INSERT INTO salesmen(salesman_id, name, city, commision) VALUES (5002, 'Nail Knite', 'Paris', 0.13);
INSERT INTO salesmen(salesman_id, name, city, commision) VALUES (5005, 'Pit Alex', 'London', 0.11);
INSERT INTO salesmen(salesman_id, name, city, commision) VALUES (5006, 'Mc Lyon', 'Paris', 0.14);
INSERT INTO salesmen(salesman_id, name, city, commision) VALUES (5007, 'Paul Adam', 'Rome', 0.13);
INSERT INTO salesmen(salesman_id, name, city, commision) VALUES (5003, 'Lauson Hen', 'San Jose', 0.12);

INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id)  VALUES (3002, 'Nick Rimando', 'New York', 100, 5001);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3007, 'Brad Davis', 'New York', 200, 5001);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3005, 'Graham Zusi', 'California', 200, 5002);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3008, 'Julian Green', 'London', 300, 5002);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3004, 'Fabian Johnson', 'Paris', 300, 5006);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3009, 'Geoff Cameron', 'Berlin', 100, 5003);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3003, 'Jozy Altidor', 'Moscow', 200, 5007);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3001, 'Brad Guzan', 'London', null, 5005);

INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70001, 150.5, '2012-10-05', 3005, 5002);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70009, 270.65, '2012-09-10', 3001, 5005);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70002, 65.26, '2012-10-05', 3002, 5001);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70004, 110.5, '2012-08-17', 3009, 5003);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70007, 948.5, '2012-09-10', 3005, 5002);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70005, 2400.6, '2012-07-27', 3007, 5001);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70008, 5760, '2012-09-10', 3002, 5001);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70010, 1983.43, '2012-10-10', 3004, 5006);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70003, 2480.4, '2012-10-10', 3009, 5003);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70012, 250.45, '2012-06-27', 3008, 5002);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70011, 75.29, '2012-08-17', 3003, 5007);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70013, 3045.6, '2012-04-25', 3002, 5001);

SELECT s.name, c.cust_name, s.city
FROM customers c
INNER JOIN salesmen s ON c.city = s.city;

SELECT o.ord_no, o.purch_amt, c.cust_name, c.city
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id AND (500<=o.purch_amt  AND o.purch_amt<= 2000);

SELECT s.name, c.cust_name
FROM salesmen s
INNER JOIN customers c ON s.salesman_id = c.salesman_id;

SELECT c.cust_name, s.commision
FROM customers c
INNER JOIN salesmen s ON c.salesman_id = s.salesman_id
WHERE s.commision > 0.12;

SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY o.ord_date;

INSERT INTO salesmen(salesman_id, name, city, commision) VALUES (5008, 'Sam Smith', 'Astana', 0.17);

SELECT s.name, s.city, c.cust_name
FROM salesmen s
LEFT JOIN customers c ON s.salesman_id = c.salesman_id
ORDER BY s.salesman_id;

INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES (3011, 'Amili Toki', 'Tokyo', null, null);
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70001, 150.5, '2012-10-05', null, 5002);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES (4000, 'Asem Maratbek', 'Pavlodar', null, 5005);
SELECT c.cust_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;