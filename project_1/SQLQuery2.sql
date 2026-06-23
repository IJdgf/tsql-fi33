CREATE TABLE mein_test1 (nummer INT, vorname VARCHAR(10));

INSERT INTO mein_test1 VALUES 
(1, 'Karl'), 
(2, 'Klara');

SELECT * FROM mein_test1;

SELECT vorname FROM mein_test1;

SELECT nummer FROM mein_test1;

INSERT INTO mein_test1 (vorname) VALUES ('Jenny'), ('Johnny');

INSERT INTO mein_test1 (vorname, nummer) VALUES
('Fred', 24);

CREATE TABLE mein_test2 (
nummer int IDENTITY(1,1), 
vorname varchar(10)
);

INSERT INTO mein_test2 VALUES 
('Karl'), 
('Klara');

SELECT * FROM mein_test2;

CREATE TABLE mein_test3 (
id INT IDENTITY(100, 2) PRIMARY KEY,
vorname varchar(10)
);

insert into mein_test3 values 
('Kermit'), ('Piggieee'), ('Gonzo'),
(null), ('null'), ('Riz-zo'), ('Waldorf'), ('Waldorf');

select * from mein_test3;
select vorname from mein_test3;

select id Id, vorname VorrrrrName from mein_test3;

DELETE FROM mein_test3 where id = 108;
DELETE FROM mein_test3 where vorname = 'WALdorf';
DELETE FROM mein_test3 where vorname is null;
DELETE FROM mein_test3 where vorname = 'NUll';

DELETE FROM mein_test3;

DBCC CHECKIDENT ('mein_test3');

DBCC CHECKIDENT ('mein_test3', RESEED, 127);


create table mein_test4 (
id int Primary Key,
vorname varchar(10)
);

select * from mein_test4;

INSERT INTO mein_test4 VALUES 
(1, 'Karl'), 
(2, 'Klara');

INSERT INTO mein_test4 VALUES 
(3, 'Karl2'), 
(20, 'Klara3');


