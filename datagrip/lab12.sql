CREATE DATABASE lab12;

CREATE TABLE accounts (
    id INT GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    balance DEC(15,2) NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO accounts(name,balance)
VALUES('Asem',150);

BEGIN;

INSERT INTO accounts(name,balance)
VALUES('Nurai',120);

COMMIT;

SELECT *
FROM accounts;

BEGIN;

UPDATE accounts
SET balance = balance - 10
WHERE id = 1;

UPDATE accounts
SET balance = balance + 10
WHERE id = 2;

COMMIT;

SELECT *
FROM accounts;

INSERT INTO accounts(name, balance)
VALUES('Ayauzhan',0);

BEGIN;

UPDATE accounts
SET balance = balance - 15
WHERE id = 1;

UPDATE accounts
SET balance = balance + 15
WHERE id = 3;

ROLLBACK;

COMMIT;

SELECT *
FROM accounts;

CREATE TABLE students(
    id INT GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    gpa REAL NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO students(name, gpa)
VALUES ('Balausa', 4.0);

BEGIN;

INSERT INTO students(name, gpa)
VALUES ('Abzal', 3.0);

COMMIT;

BEGIN;

UPDATE students
SET gpa = gpa - 1.0
WHERE id = 1;

UPDATE students
SET gpa = gpa + 1.0
WHERE id = 2;

COMMIT;

BEGIN;

UPDATE students
SET gpa = gpa - 1.0
WHERE id = 2;

ROLLBACK;

COMMIT;

SELECT *
FROM students;