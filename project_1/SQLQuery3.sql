--DROP TABLE mein_test5;
--DROP TABLE mein_test7;
--DROP TABLE mein_test1;
--DROP TABLE mein_test2;
--DROP TABLE mein_test8;

CREATE TABLE mein_test1 (nummer INT, vorname VARCHAR(10));
CREATE TABLE mein_test7 (nummer INT, vorname VARCHAR(10));
CREATE TABLE mein_test5 (nummer INT, vorname VARCHAR(10));


--select * from mein_test1;

--DELETE FROM mein_test1 
--WHERE vorname = 'Fred';

--DELETE FROM mein_test1 WHERE nummer is NULL;

INSERT INTO mein_test1 (vorname) VALUES ('Jenny'), ('Johnny');

INSERT INTO mein_test1 VALUES 
(2, 'Karl'), 
(1, 'Klara');

--DELETE FROM mein_test1 WHERE nummer is not NULL;

--DELETE mein_test1;

--DROP TABLE mein_test1;

--CREATE TABLE mein_test1 (nummer INT, vorname VARCHAR(10));

--sp_rename 'mein_test1', 'mein_test_6';

-- MySQL, PostgreSQL:
-- ALTER TABLE mein_test_6 RENAME TO neu_name;


SELECT column_name, data_type, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'mein_test1';

CREATE TABLE mein_test1 (
id INT IDENTITY(1,1) PRIMARY KEY,   --CONSTRAINTS
vorname VARCHAR(20)
);



SELECT name FROM sys.key_constraints;

CREATE TABLE mein_test8 (
id INT IDENTITY(1,1),
vorname VARCHAR(20),
nachname VARCHAR(20),
email VARCHAR(100),
CONSTRAINT PK_test8_id PRIMARY KEY (id),
CONSTRAINT UQ_test8_email UNIQUE (email),
CONSTRAINT UQ_test8_vname_nname UNIQUE (vorname, nachname)
);

SELECT * FROM sys.foreign_keys;





