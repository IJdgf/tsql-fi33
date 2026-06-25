select * from mein_test_6;

UPDATE mein_test_6 SET nummer=0 WHERE nummer = 2;

UPDATE mein_test_6 SET nummer = -123 WHERE nummer = 1;

CREATE TABLE mein_test_9 (
id INT IDENTITY(1,1) PRIMARY KEY,   --CONSTRAINTS
vorname VARCHAR(20)
);

insert into mein_test_9 values 
('Kermit'), ('Piggieee'), ('Gonzo'),
(null), ('null'), ('Riz-zo'), ('Waldorf'), ('Waldorf');

select * from mein_test_9;

UPDATE mein_test_9 SET id = 123 WHERE id = 1; -- Funktioniert micht!

UPDATE mein_test_9 SET vorname = 'Null' WHERE vorname is NULL;

UPDATE mein_test_9 SET vorname = 'JJJ' WHERE vorname = 'Null';