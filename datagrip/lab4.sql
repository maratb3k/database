CREATE DATABASE laboratory_work_4;

CREATE TABLE "Warehouses"(
    code INT,
    location VARCHAR(255),
    capacity INT
);

INSERT INTO "Warehouses"(code, location, capacity) VALUES(1, 'Chicago', 3);
INSERT INTO "Warehouses"(code, location, capacity) VALUES(2, 'Chicago', 4);
INSERT INTO "Warehouses"(code, location, capacity) VALUES(3, 'New York', 7);
INSERT INTO "Warehouses"(code, location, capacity) VALUES(4, 'Los Angeles', 2);
INSERT INTO "Warehouses"(code, location, capacity) VALUES(5, 'San Francisco', 8);

SELECT * FROM "Warehouses";

CREATE TABLE "Packs"(
    code character(4),
    contents VARCHAR(255),
    value REAL,
    warehouse INT
);

INSERT INTO "Packs"(code, contents, value, warehouse) VALUES('OMN7', 'Rocks', 180, 3);
INSERT INTO "Packs"(code, contents, value, warehouse) VALUES('4H8P', 'Rocks', 250, 1);
INSERT INTO "Packs"(code, contents, value, warehouse) VALUES('4RT3', 'Scissors', 190, 4);
INSERT INTO "Packs"(code, contents, value, warehouse) VALUES('7G3H', 'Rocks', 200, 1);
INSERT INTO "Packs"(code, contents, value, warehouse) VALUES('8JN6', 'Papers', 75, 1);
INSERT INTO "Packs"(code, contents, value, warehouse) VALUES('8Y6U', 'Papers', 50, 3);
INSERT INTO "Packs"(code, contents, value, warehouse) VALUES('9J6F', 'Papers', 175, 2);
INSERT INTO "Packs"(code, contents, value, warehouse) VALUES('LL08', 'Rocks', 140, 4);
INSERT INTO "Packs"(code, contents, value, warehouse) VALUES('P0H6', 'Scissors', 125, 1);
INSERT INTO "Packs"(code, contents, value, warehouse) VALUES('P2T6', 'Scissors', 150, 2);
INSERT INTO "Packs"(code, contents, value, warehouse) VALUES('TU55', 'Papers', 90, 5);

SELECT * FROM "Packs";

SELECT * FROM "Packs" WHERE value > 180;

SELECT DISTINCT contents FROM "Packs";

SELECT warehouse, count(*)
FROM "Packs" GROUP BY warehouse;

SELECT warehouse, count(*)
FROM "Packs"
GROUP BY warehouse
HAVING warehouse > 2;

INSERT INTO "Warehouses"(CODE, LOCATION, CAPACITY) VALUES(6, 'Texas', 5);
SELECT * FROM "Warehouses";

INSERT INTO "Packs"(code, contents, value, warehouse) VALUES('H5RT', 'Papers', 350, 2);
SELECT * FROM "Packs";

UPDATE "Packs" SET value = value * 0.82
WHERE value = (SELECT value FROM "Packs"
                ORDER BY value ASC
                OFFSET 2 LIMIT 1);
DELETE FROM "Packs"
WHERE value < 150;

SELECT * FROM "Warehouses" WHERE location = 'Chicago';
DELETE  FROM "Packs" WHERE warehouse = 3 OR warehouse = 4;


SELECT * FROM "Packs" WHERE value > 180
EXCEPT SELECT * FROM "Packs" WHERE warehouse > 3;

SELECT contents FROM "Packs"
WHERE value = ALL (SELECT value FROM "Packs" WHERE value > 200);

SELECT location FROM "Warehouses"
WHERE capacity = ANY (SELECT capacity FROM "Warehouses" WHERE capacity > 3);

SELECT code, contents,
COALESCE(code, contents)
FROM "Packs";

SELECT contents, value,
CASE
    WHEN value > 200 THEN 'The value is greater than 200'
    WHEN value = 200 THEN 'The value is 200'
    ELSE 'The value is under 200'
END AS comparevalues
FROM "Packs";

SELECT location
FROM "Warehouses"
WHERE EXISTS (SELECT capacity FROM "Warehouses" WHERE "Warehouses".capacity > 4);




