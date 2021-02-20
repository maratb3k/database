CREATE DATABASE lab11;
--1
CREATE FUNCTION cubeofnum(value INTEGER) RETURNS INTEGER AS
$$
BEGIN
    RETURN value * value * value;
END;$$
    LANGUAGE PLPGSQL;

SELECT cubeofnum(5);
--2
CREATE FUNCTION average(
VARIADIC list NUMERIC[],
OUT total NUMERIC,
OUT average NUMERIC
) AS
$$
BEGIN
    SELECT INTO total SUM(list[i])
    FROM generate_subscripts(list, 1) g(i);

    SELECT INTO average AVG(list[i])
    FROM generate_subscripts(list, 1) g(i);
END;$$
    LANGUAGE PLPGSQL;

SELECT * FROM average(10, 20, 30);

--3
CREATE FUNCTION maximum(
VARIADIC list NUMERIC[],
OUT max NUMERIC) AS
$$
BEGIN
    SELECT INTO max MAX(list[i])
    FROM generate_subscripts(list, 1) g(i);
END;
$$
LANGUAGE PLPGSQL;

SELECT maximum(1, 2, 3);

--4
CREATE FUNCTION minimum(
VARIADIC list NUMERIC[],
OUT min NUMERIC) AS
$$
BEGIN
    SELECT INTO min MIN(list[i])
    FROM generate_subscripts(list, 1) g(i);
END;
$$
LANGUAGE PLPGSQL;

SELECT minimum(1, 2, 3);

--5
CREATE FUNCTION counter(
VARIADIC list NUMERIC[],
OUT cnt NUMERIC) AS
$$
BEGIN
    SELECT INTO cnt COUNT(list[i])
    FROM generate_subscripts(list, 1) g(i);
END;
$$
LANGUAGE PLPGSQL;

SELECT counter(1, 2, 5);

--6
CREATE TABLE students(
    id SERIAL PRIMARY KEY ,
    name varchar(50),
    specialty varchar(50),
    birth_date date,
    address varchar(50),
    mob_number varchar(11)
);
INSERT INTO students(id, name, specialty, birth_date, address, mob_number)
                                VALUES (1, 'Asem Maratbek', 'IS', '23/06/2002', 'Saryarka 16', '8747895623'),
                                       (2, 'Nurai Turganbaeva', 'BS', '04/08/2002', 'Ayapova 22', '87755106017');

CREATE OR REPLACE FUNCTION tableOfStudents()
RETURNS TABLE(
    id INT,
    name varchar(50),
    specialty varchar(50),
    birth_date date,
    address varchar(50),
    mob_number varchar(11)
)AS
$$
BEGIN
        RETURN QUERY SELECT
        s.id, s.name, s.specialty, s.birth_date, s.address, s.mob_number
        FROM students s;
END;$$
LANGUAGE PLPGSQL;

SELECT * FROM tableOfStudents();

--8
ALTER TABLE students ADD COLUMN height int DEFAULT 170;
UPDATE students SET height = 168  WHERE id = 2;

CREATE OR REPLACE FUNCTION maxHeightOfStudents()
RETURNS TABLE(
    id INT,
    name varchar(50),
    specialty varchar(50),
    birth_date date,
    address varchar(50),
    mob_number varchar(11),
    height int
)AS
$$
BEGIN
    RETURN QUERY SELECT s.* FROM students s
    WHERE s.height = (SELECT max(students.height) FROM students);
END;$$
LANGUAGE PLPGSQL;

SELECT * FROM maxHeightOfStudents();

