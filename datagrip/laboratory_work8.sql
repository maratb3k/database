CREATE DATABASE lab_8;

CREATE TABLE countries(
    countrie_id varchar(255),
    name VARCHAR(30)
);

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary varchar(255),
    department_id INTEGER REFERENCES departments
);

CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    budget varchar(255)
);
DROP TABLE departments;
DROP TABLE employees;
INSERT INTO countries (name) VALUES ('Andorra'),
                                    ('Belarus'),
                                    ('Slovenia'),
                                    ('China'),
                                    ('Turkey'),
                                    ('Italy'),
                                    ('Brazil'),
                                    ('Canada'),
                                    ('Malaysia'),
                                    ('Austria'),
                                    ('Ukraine'),
                                    ('France'),
                                    ('Latvia'),
                                    ('Greece'),
                                    ('Kazakhstan'),
                                    ('Taiwan'),
                                    ('Yemen'),
                                    ('Kyrgyzstan'),
                                    ('Germany'),
                                    ('North Korea'),
                                    ('South Korea'),
                                    ('Japan');
INSERT INTO countries (name) VALUES ('Egypt'),
                                    ('Oman'),
                                    ('Uzbekistan'),
                                    ('USA'),
                                    ('Saudi Arabia'),
                                    ('Qatar'),
                                    ('Pakistan'),
                                    ('New Zealand');
INSERT INTO countries (name) VALUES ('Afghanistan'),
                                    ('Albania'),
                                    ('Bangladesh'),
                                    ('Cambodia'),
                                    ('Antigua and Barbuda'),
                                    ('Algeria'),
                                    ('Liechtenstein'),
                                    ('Colombia'),
                                    ('Norway'),
                                    ('Honduras'),
                                    ('Lesotho'),
                                    ('Bolivia'),
                                    ('Haiti'),
                                    ('Chile'),
                                    ('Barbados'),
                                    ('Portugal'),
                                    ('Estonia'),
                                    ('Puerto Rico'),
                                    ('Nigeria'),
                                    ('North Macedonia'),
                                    ('Angola'),
                                    ('Netherlands'),
                                    ('Panama'),
                                    ('Uganda'),
                                    ('Somalia'),
                                    ('Mexico'),
                                    ('Monaco'),
                                    ('Zimbabwe'),
                                    ('Barbados'),
                                    ('Turkmenistan'),
                                    ('Tunisia'),
                                    ('Syria'),
                                    ('Peru'),
                                    ('Paraguay'),
                                    ('Slovakia'),
                                    ('Armenia'),
                                    ('Luxembourg'),
                                    ('Kenya'),
                                    ('Niger'),
                                    ('Argentina'),
                                    ('Belgium'),
                                    ('Haiti'),
                                    ('Ethiopia'),
                                    ('Madagascar'),
                                    ('UK'),
                                    ('Namibia'),
                                    ('Suriname'),
                                    ('Bhutan'),
                                    ('Belgium'),
                                    ('Uruguay'),
                                    ('Vanuatu'),
                                    ('Philippines'),
                                    ('Iran'),
                                    ('United Arab Emirates'),
                                    ('Venezuela'),
                                    ('Nicaragua'),
                                    ('Australia'),
                                    ('Finland'),
                                    ('Nepal'),
                                    ('Israel'),
                                    ('Israel'),
                                    ('Sudan'),
                                    ('Poland'),
                                    ('India'),
                                    ('Guyana'),
                                    ('Belize'),
                                    ('Azerbaijan'),
                                    ('Bahrain'),
                                    ('Singapore'),
                                    ('Spain');
INSERT INTO departments (department_name, budget)
VALUES ('KazMunaiGaz', 100000),
       ('Amazon', 135000),
       ('Apple', 300000),
       ('Facebook', 250000),
       ('Walt Disney', 412000),
       ('Oracle', 395600),
       ('Microsoft', 299600),
       ('Nike', 700530),
       ('Samsung', 388800),
       ('Lenovo', 755900),
       ('Ikea', 255700),
       ('Defacto', 388600),
       ('KaspiKz', 655500),
       ('Halyk Bank', 398000),
       ('Sulpak', 426300),
       ('Kazakhmys', 755233),
       ('Netflix', 788999),
       ('HBO', 755569),
       ('Helios', 255369),
       ('Magnum', 525500),
       ('Caspiy Neft', 788990),
       ('Rakhat', 588990),
       ('Nestle', 488990),
       ('Mars', 223468),
       ('Alibaba', 899758),
       ('General Motors', 355998),
       ('Visual Studio', 975863),
       ('Android', 759986),
       ('JetBrains', 366898),
       ('Eclipse', 359689);
INSERT INTO departments (department_name, budget) VALUES
                                ('Meat/Poultry', 121548),
                                ('Produce', 12544),
                                ('Seafood', 2121),
                                ('Dairy Products', 21215),
                                ('Beverages',126734),
                                 ('Condiments', 2121548),
                                ('Confections', 77252),
                                ('Grains/Cereals', 72890),
                                ('Speedy Express', 355893),
                                ('United Package', 4199),
                                ('Federal Shipping', 55599),
                                ('Chais', 18589),
                                ('Chang', 12119),
                                 ('Aniseed Syrup', 7885),
                                ('Chef Anton', 14522),
                                ('Chef Mix', 11235),
                                ('Grandma', 25485),
                                ('Organic Dried Pears', 15893),
                                ('Northwoods Cranberry Sauce', 4890),
                                ('Mishi Kobe Niku', 1297),
                                ('Ikura', 1231),
                                ('Queso Cabrales', 4521),
                                ('Queso Manchego Pastora', 4838),
                                ('Konbu', 4586),
                                ('Tofu', 2325),
                                ('Genen Shouyu', 15115),
                                ('Pavlova', 1745),
                                ('Alice Mutton', 11139),
                                ('Carnarvon Tigers', 62225),
                                ('Chocolate Biscuits', 9112),
                                ('Sir Marmalade', 45581),
                                ('Sir Scones', 44510),
                                ('Gustaf Knäckebröd', 45899),
                                ('Tunnbröd', 12589),
                                ('Guaraná Fantástica', 41555),
                                ('NuNuCa Nuß-Nougat-Creme', 12514),
                                ('Gumbär Gummibärchen', 1123),
                                ('Schoggi Schokolade', 43129),
                                 ('Rössle Sauerkraut', 45456),
                                ('Thüringer Rostbratwurst', 1239),
                                ('Nord-Ost Matjeshering', 2589),
                                ('Gorgonzola Telino', 1215),
                                 ('Mascarpone Fabioli', 1132),
                                 ('Geitost', 21155),
                                ('Sasquatch Ale', 25814),
                                ('Steeleye Stout', 7888),
                                ('Inlagd Sill', 1559),
                                ('Gravad lax', 77826),
                                ('Côte de Blaye', 26315),
                                ('Chartreuse verte', 55918),
                                ('Boston Crab Meat', 89184),
                                ('New England Clam Chowder', 965),
                                ('Singaporean Fried Mee', 4414),
                                ('Ipoh Coffee',41126),
                                ('Gula Malacca', 19845),
                                ('Røgede sild', 9885),
                                ('Spegesild', 17772),
                                ('Zaanse koeken',  9115),
                                ('Chocolade', 12375),
                                ('Maxilaku', 12520),
                                ('Valkoinen suklaa', 1625),
                                ('Manjimup Dried Apples', 12558),
                                ('Filo Mix', 88997),
                                ('Perth Pasties', 32998),
                                ('Tourtière', 57631),
                                ('Pâté chinois', 76924),
                                ('Gnocchi di nonna Alice', 1938),
                                ('Ravioli Angelo', 1195),
                                ('Escargots de Bourgogne', 3250),
                                ('Raclette Courdavault', 5559);

INSERT INTO employees (first_name, last_name, salary, department_id)
VALUES ('Ayagoz', 'Ratkulova', 2350, 28),
       ('Asem', 'Maratbek', 1500, 29),
       ('Zhenis', 'Bukebayev', 4700, 30),
       ('Tomiris', 'Abdullaeva', 2570, 31),
       ('John', 'Kim', 1000, 32),
       ('Johnson', 'Steve', 1200, 33),
       ('Jim', 'Lee', 9100, 34),
       ('Stone', 'Sharon', 7500, 35),
       ('Krystal', 'Jung', 1900, 36),
       ('Yoon', 'Park', 8300, 37),
       ('Yun', 'Jin', 2700, 38),
       ('Sherlock', 'Holmes', 6600, 39),
       ('Andrei', 'Bolkonsky', 2559, 40),
       ('Pierre', 'Bezukhov', 5599, 41),
       ('Natasha', 'Rostova', 7890, 42),
       ('Elen', 'Kuragina', 1100, 43),
       ('Scott', 'McCall', 9999, 44),
       ('Allison', 'Argent', 4559, 45),
       ('Stiles', 'Stilinski', 9890, 46),
       ('Derek', 'Hale', 1222, 47),
       ('Malia', 'Tate', 5367, 48),
       ('Kira', 'Yukimura', 7865, 49),
       ('Lydia', 'Martin', 4597, 50),
       ('Naruto', 'Uzumaki', 7852, 51),
       ('Sakura', 'Haruno', 4590, 52),
       ('Itachi', 'Uchiha', 1259, 53),
       ('Hinata', 'Shoyo', 4500, 54),
       ('Kageyama', 'Tobio', 5000, 55),
       ('Mikaela', 'Hyakuya', 2700, 56),
       ('Yuichiro', 'Hyakuya', 3600, 57);

INSERT INTO employees(first_name, last_name, salary, department_id)
                    VALUES ('Alfreds', 'Futterkiste', 5700209, 58),
                           ('Ana', 'Trujillo', 222002, 59),
                            ('Antonio', 'Moreno', 2312, 60),
                            ('Thomas', 'Hardy', 552588, 61),
                            ('Christina', 'Berglund', 95822, 62),
                            ('Hanna', 'Moos', 68306, 63),
                            ('Frédérique', 'Citeaux', 67000, 64),
                            ('Martín', 'Sommer', 28023, 65),
                            ('Laurence', 'Lebihans', 13008, 66),
                            ('Elizabeth', 'Lincoln', 45896, 67),
                            ('Victoria', 'Ashworth', 547836, 68),
                            ('Patricio', 'Simpson', 33310, 69),
                            ('Francisco', 'Chang', 9993, 70),
                            ('Yang','Wang', 3012, 71),
                            ('Pedro', 'Afonso', 54323, 72),
                            ('Elizabeth', 'Brown', 57894, 73),
                            ('Sven', 'Ottlieb', 52066, 74),
                            ('Janine', 'Labre', 44000, 75),
                            ('Ann', 'Devon', 45488, 76),
                            ('Roland', 'Mendel', 8010, 77),
                            ('Aria', 'Cruz', 5440, 78),
                            ('Diego', 'Roel', 28034, 79),
                            ('Martine', 'Rancé', 90200, 80),
                            ('Maria', 'Larsson', 84467, 81),
                            ('Peter', 'Franken', 80805, 82),
                            ('Carine', 'Schmitt', 44040, 83),
                            ('Paolo', 'Accorti', 10100, 84),
                            ('Lino', 'Rodriguez', 1675, 85),
                            ('Eduardo', 'Saavedra', 8022, 86),
                            ('José', 'Pedro', 41101, 87),
                            ('André', 'Fonseca', 48766, 88),
                            ('Howard', 'Snyder', 97403, 89),
                            ('Manuel', 'Pereira', 10581, 90),
                             ('Mario', 'Pontes', 1081, 91),
                             ('Carlos', 'Hernández', 5022, 92),
                            ('Yoshi', 'Latimer', 97827, 93),
                             ('Patricia', 'McKenna', 5455, 94),
                             ('Helen', 'Bennett', 5431, 95),
                             ('Philip', 'Cramer', 14776, 96),
                             ('Daniel', 'Tonini', 78000, 97),
                             ('Annette', 'Roulet', 31000, 98),
                             ('Yoshi', 'Tannamuri', 21215, 99),
                             ('John', 'Steel', 99362, 100),
                            ('Renate', 'Messner', 60528, 101),
                             ('Jaime', 'Yorres', 94117, 102),
                             ('Carlos', 'González', 3508, 103),
                            ('Felipe', 'Izquierdo', 4980, 104),
                            ('Fran', 'Wilson', 97219, 105),
                             ('Giovanni','Rovelli', 24100, 106),
                            ('Catherine', 'Dewey', 1180, 107),
                             ('Jean', 'Fresnière', 1221, 108),
                             ('Alexander', 'Feuer', 4179, 109),
                             ('Simon', 'Crowther', 54556, 110),
                             ('Yvonne', 'Moncada', 1010, 111),
                             ('Rene', 'Phillips', 99508, 112),
                             ('Henriette', 'Pfalzheim', 50739, 113),
                             ('Marie', 'Bertrand', 75012, 114),
                             ('Guillermo', 'Fernández', 5033, 115),
                            ('Georg', 'Pipps', 5020, 116),
                            ( 'Isabel', 'Castro', 1756, 117),
                             ('Bernardo', 'Batista', 23873, 118),
                            ( 'Lúcia', 'Carvalho', 54872, 119),
                            ('Horst', 'Kloss', 1307, 120),
                            ('Sergio', 'Gutiérrez', 10110, 121),
                             ('Paula', 'Wilson', 87110, 122),
                            ('Maurizio', 'Moroni', 42100, 123),
                             ('Janete', 'Limeira', 23889, 124),
                            ('Michael', 'Holz', 1203, 125),
                             ('Alejandra', 'Camino', 28001, 126),
                             ('Jonas', 'Bergulfsen', 4110, 127);



DROP TABLE countries;
--1
SELECT * FROM countries WHERE name = 'Canada';

EXPLAIN SELECT * FROM countries WHERE name = 'Canada';
INSERT INTO countries(countrie_id, name)
SELECT 'Country-' || i, 'Canada'||i*2|| i
FROM generate_series(1,50) i;
CREATE INDEX ind_country_name ON countries(name);
DROP INDEX ind_country_name;

INSERT INTO departments(department_name, budget)
SELECT 'Department-' || i, '100000'||i*2|| i
FROM generate_series(1,50) i;
--2

EXPLAIN SELECT * FROM employees WHERE first_name = 'Asem' AND last_name = 'Maratbek';
INSERT INTO employees(first_name, last_name, salary)
SELECT 'Asem' || i, 'Maratbek' ||i, '9999999'||i*2|| i
FROM generate_series(1,50) i;

CREATE INDEX ind_employee_name ON employees(first_name, last_name);

--3

EXPLAIN SELECT * FROM employees WHERE salary < '999999999' AND salary > '9999999';

CREATE UNIQUE INDEX ind_employee_salary ON employees(salary);

DROP INDEX ind_employee_salary;

--4

EXPLAIN SELECT * FROM employees WHERE substring(first_name FROM 1 for 4) = 'Asem';

CREATE INDEX ind_employee_firstname ON employees(substring(first_name from 1 for 4));

DROP INDEX ind_employee_firstname;
SELECT * FROM employees;
--5
SELECT * FROM employees e
    JOIN departments d ON d.department_id = e.department_id
WHERE d.budget > 100000 AND e.salary < 700000;

EXPLAIN SELECT * FROM employees e
WHERE  e.salary < '999999999';

CREATE INDEX ind_djoin_salary ON employees USING btree(salary);
DROP INDEX ind_djoin_salary;
--6
SELECT last_name FROM employees;

EXPLAIN SELECT last_name FROM employees;

CREATE INDEX ind_employee_lastname ON employees USING BTREE(last_name);
DROP INDEX ind_employee_lastname;

--7
SELECT department_name FROM departments;

EXPLAIN SELECT department_name FROM departments;

CREATE INDEX ind_department_name ON departments USING HASH (department_name);
DROP INDEX ind_department_name;

--8
SELECT * FROM countries;

EXPLAIN SELECT * FROM countries;

CREATE UNIQUE INDEX ind_countries ON countries (countrie_id, name);
DROP INDEX ind_countries;