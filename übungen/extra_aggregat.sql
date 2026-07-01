--Erstellen Sie eine neue Datenbank "uebungen"
use uebungen;

--AUFGABE 1
--Schreibe eine SQL-Abfrage, die die Anzahl der Studierenden (Tabelle students) nach Studienform 
--ausgibt: Fernstudium (is_full_time = 'no') und Vollzeitstudium (is_full_time = 'yes').

DROP TABLE IF EXISTS students;

CREATE TABLE students
(
id INT not null ,
name VARCHAR(100) not null,
age INT not null,
is_full_time varchar(3) not null,
PRIMARY KEY (id)
);

insert into students (id, name, age, is_full_time)
values 
(11, 'Mary', 21, 'no'),
(2, 'Peter', 24, 'yes'),
(5, 'Amy', 22, 'no'),
(7, 'John', 19, 'yes'),
(6, 'Dexter', 40, 'no'),
(1, 'Maria', 26, 'yes'),
(9, 'Alex', 21, 'yes')

--LÖSUNG





--AUFGABE 2
--Schreiben Sie eine SQL-Abfrage, die aus der Tabelle employee ermittelt,
--wie viele Mitarbeiter in einem bestimmten Jahr geboren wurden (date_of_birth).

DROP TABLE IF EXISTS employee;

CREATE TABLE employee
(
    id INT not null,
    name VARCHAR(100) not null,
    date_of_birth DATE not null,
    position VARCHAR(100) not null,
    department VARCHAR(100) not null,
    PRIMARY KEY (id)
);

insert into employee (id, name, date_of_birth, position, department)
values (1, 'Tom', '1985-10-05', 'backend developer', 'omega'),
       (2, 'Jim', '1979-11-24', 'manager', 'bravo'),
       (3, 'Daniel', '2000-07-09', 'frontend developer', 'delta'),
       (4, 'Amy', '1995-05-22', 'backend developer', 'alpha'),
       (5, 'Lee', '2001-07-11', 'backend developer', 'omega'),
       (6, 'Maria', '2000-11-01', 'frontend developer', 'alpha'),
       (7, 'Julia', '2001-01-30', 'designer', 'delta'),
       (8, 'Kim', '1986-05-01', 'backend developer', 'alpha'),
       (9, 'Andy', '1999-10-22', 'frontend developer', 'omega'),
       (10, 'Marcus', '1995-01-13', 'manager', 'bravo'),
       (11, 'Bill', '1990-08-08', 'manager', 'alpha'),
       (12, 'Oscar', '1980-03-27', 'manager', 'delta'),
       (13, 'Alex', '1996-03-30', 'frontend developer', 'alpha'),
       (14, 'Mohamed', '1992-06-28', 'backend developer', 'delta'),
       (15, 'Luka', '1984-09-17', 'backend developer', 'omega'),
       (16, 'Earl', '1991-04-11', 'frontend developer', 'alpha'),
       (17, 'Albert', '1989-07-07', 'designer', 'alpha'),
       (18, 'Robert', '1990-08-26', 'backend developer', 'delta'),
       (19, 'Joe', '1993-02-09', 'frontend developer', 'omega'),
       (20, 'Timothy', '1995-03-25', 'manager', 'bravo'),
       (21, 'Nicholas', '2000-01-05', 'designer', 'omega')

-- LÖSUNG





--AUFGABE 3
--Schreiben Sie eine SQL-Abfrage, die aus der Tabelle employee ermittelt, 
--wie viele Mitarbeiter, deren Position (position) das Wort 'developer' enthält, 
--in einem bestimmten Jahr geboren wurden (date_of_birth). 
--Die Spalte mit dem Geburtsjahr soll im Ergebnis den Namen year_of_birth tragen

DROP TABLE IF EXISTS employee;

CREATE TABLE employee
(
    id INT not null,
    name VARCHAR(100) not null,
    date_of_birth DATE not null,
    position VARCHAR(100) not null,
    department VARCHAR(100) not null,
    PRIMARY KEY (id)
);

insert into employee (id, name, date_of_birth, position, department)
values (1, 'Tom', '1985-10-05', 'backend developer', 'omega'),
       (2, 'Jim', '1979-11-24', 'manager', 'bravo'),
       (3, 'Daniel', '2000-07-09', 'frontend developer', 'delta'),
       (4, 'Amy', '1995-05-22', 'backend developer', 'alpha'),
       (5, 'Lee', '2001-07-11', 'backend developer', 'omega'),
       (6, 'Maria', '2000-11-01', 'frontend developer', 'alpha'),
       (7, 'Julia', '2001-01-30', 'designer', 'delta'),
       (8, 'Kim', '1986-05-01', 'backend developer', 'alpha'),
       (9, 'Andy', '1999-10-22', 'frontend developer', 'omega'),
       (10, 'Marcus', '1995-01-13', 'manager', 'bravo'),
       (11, 'Bill', '1990-08-08', 'manager', 'alpha'),
       (12, 'Oscar', '1980-03-27', 'manager', 'delta'),
       (13, 'Alex', '1996-03-30', 'frontend developer', 'alpha'),
       (14, 'Mohamed', '1992-06-28', 'backend developer', 'delta'),
       (15, 'Luka', '1984-09-17', 'backend developer', 'omega'),
       (16, 'Earl', '1991-04-11', 'frontend developer', 'alpha'),
       (17, 'Albert', '1989-07-07', 'designer', 'alpha'),
       (18, 'Robert', '1990-08-26', 'backend developer', 'delta'),
       (19, 'Joe', '1993-02-09', 'frontend developer', 'omega'),
       (20, 'Timothy', '1995-03-25', 'manager', 'bravo'),
       (21, 'Nicholas', '2000-01-05', 'designer', 'omega')
;

--LÖSUNG





--AUFGABE 4
--Schreiben Sie eine SQL-Abfrage, die aus der Tabelle employee auf Grundlage
--des Geburtsdatums (date_of_birth) das Geburtsjahr und den Geburtsmonat (als Monatsnummer) 
--der Mitarbeiter ermittelt, die im Winter geboren wurden. 
--Das Geburtsjahr und der Geburtsmonat sollen in zwei getrennten Spalten ausgegeben werden.
--Die Ergebnisse sollen nach dem Geburtsjahr sortiert werden.

DROP TABLE IF EXISTS employee;

CREATE TABLE employee
(
    id INT not null,
    name VARCHAR(100) not null,
    date_of_birth DATE not null,
    position VARCHAR(100) not null,
    department VARCHAR(100) not null,
    PRIMARY KEY (id)
);

insert into employee (id, name, date_of_birth, position, department)
values (1, 'Tom', '1985-10-05', 'backend developer', 'omega'),
       (2, 'Jim', '1979-11-24', 'manager', 'bravo'),
       (3, 'Daniel', '2000-07-09', 'frontend developer', 'delta'),
       (4, 'Amy', '1995-05-22', 'backend developer', 'alpha'),
       (5, 'Lee', '2001-07-11', 'backend developer', 'omega'),
       (6, 'Maria', '2000-11-01', 'frontend developer', 'alpha'),
       (7, 'Julia', '2001-01-30', 'designer', 'delta'),
       (8, 'Kim', '1986-05-01', 'backend developer', 'alpha'),
       (9, 'Andy', '1999-10-22', 'frontend developer', 'omega'),
       (10, 'Marcus', '1995-01-13', 'manager', 'bravo'),
       (11, 'Bill', '1990-08-08', 'manager', 'alpha'),
       (12, 'Oscar', '1980-03-27', 'manager', 'delta'),
       (13, 'Alex', '2002-03-30', 'frontend developer', 'alpha'),
       (14, 'Mohamed', '1992-06-28', 'backend developer', 'delta'),
       (15, 'Luka', '1984-09-17', 'backend developer', 'omega'),
       (16, 'Earl', '2001-04-11', 'frontend developer', 'alpha'),
       (17, 'Albert', '2000-07-07', 'designer', 'alpha'),
       (18, 'Robert', '1990-08-26', 'backend developer', 'delta'),
       (19, 'Joe', '1993-02-09', 'frontend developer', 'omega'),
       (20, 'Timothy', '1995-03-25', 'manager', 'bravo'),
       (21, 'Nicholas', '2000-01-05', 'designer', 'omega')
;

--LÖSUNG





--AUFGABE 5
--Schreiben Sie eine SQL-Abfrage, die aus der Tabelle cars auf Grundlage 
--des Produktionsdatums (prod_date) das Produktionsjahr (prod_year) und 
--den Produktionsmonat (prod_month) sowie die Anzahl der in diesem Zeitraum 
--produzierten Fahrzeuge ermittelt. Es sollen nur Fahrzeuge mit dem 
--Namen (name) 'Black Car' und einem Preis (price) größer als 99000 berücksichtigt werden. 
--Die Ergebnisse sollen nach Jahr und Monat gruppiert werden.


DROP TABLE IF EXISTS cars;

CREATE TABLE cars
(
    id INT not null,
    name VARCHAR(100) not null,
    prod_date DATE not null,
    price INT not null,
    PRIMARY KEY (id)
);

insert into cars (id, name, prod_date, price)
values (1, 'White Car', '2020-03-19', 45000),
       (2, 'Black Car', '2020-01-25', 35000),
       (3, 'Grey Car', '2021-11-20', 25000),
       (4, 'Blue Car', '2021-04-10', 100000),
       (5, 'Red Car', '2012-12-12', 10000),
       (6, 'White Car', '2020-02-20', 115000),
       (7, 'Blue Car', '2020-03-04', 19000),
       (8, 'Yellow Car', '2021-05-15', 35000),
       (9, 'Grey Car', '2021-10-11', 45000),
       (10, 'Blue Car', '2020-08-22', 45000),
       (11, 'Red Car', '2000-07-14', 65000),
       (12, 'Blue Car', '2015-09-19', 85000),
       (13, 'Green Car', '2022-03-26', 6000),
       (14, 'Yellow Car', '2019-01-29', 95000),
       (15, 'Red Car', '2020-08-01', 50000),
       (16, 'Green Car', '2021-11-27', 55000),
       (17, 'Blue Car', '2011-06-24', 20000),
       (18, 'Yellow Car', '2015-04-02', 80000),
       (19, 'Blue Car', '2018-07-12', 39000),
       (20, 'White Car', '2002-12-24', 15000),
       (21, 'Black Car', '2023-03-25', 150000);
;

--LÖSUNG


--AUFGABE 6
--Schreiben Sie eine SQL-Abfrage, die aus der Tabelle cars den Namen (name) der Fahrzeuge 
--sowie die Gesamtsumme und den Durchschnitt der Preise (price) für jedes Fahrzeug ermittelt
--Benutzen Sie die Tabelle cars aus der Aufgabe 5

--LÖSUNG


--AUFGABE 7
--Schreiben Sie eine SQL-Abfrage, die aus der Tabelle cars den Namen (name) der Fahrzeuge, 
--die durchschnittliche und die gesamte Summe der Preise (price) auswählt. 
--In das Ergebnis sollen nur Fahrzeuge aufgenommen werden, 
--deren durchschnittlicher Preis größer als 100000 ist.
--Benutzen Sie die Tabelle cars aus der Aufgabe 5

--LÖSUNG
