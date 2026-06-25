--Bitte erstellen Sie eine Kopie der kompletten Tabelle interpret. 
--Die neue Tabelle soll Kuenstler heißen

select * from interpret;

select * into kuenstler from interpret;

select name into kuenstler_2 from interpret; --nur für Test

select * from kuenstler_2;

--2. Eine weitere Kopie soll kuenstlernamen heißen, 
--dahinein gehören nur die Inhalte der Spalte name. 
--Diese Spalte in kuenstlernamen soll k_name heißen

select column_name, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'interpret';


create table kuenstlernamen (
k_namen varchar(200)
);

insert into kuenstlernamen 
select name from interpret;
select * from kuenstlernamen;

select name k_namen into kuenstlernamen_2 from interpret;
select * from kuenstlernamen_2;

--3. Bitte löschen Sie aus der Tabelle kuenstler die Person mit der i_id 6
delete from kuenstler where i_id = 6;
select * from kuenstler;

--4. Nun muss 'Adele' weg
delete from kuenstler where name = 'adele';

--5. Löschen Sie jetzt bitte den kompletten 
--Inhalt der Tabelle kuenstlernamen. Kontrollieren Sie.
truncate table kuenstlernamen;
delete kuenstlernamen;
select * from kuenstlernamen;

--6. Und nun ganz weg mit der Tabelle kuenstlernamen
drop table kuenstlernamen;
drop table if exists kuenstlernamen;

select * from kuenstlernamen_2;

--7. Als letztes löschen Sie bitte nun auch die Tabelle kuenstler komplett. 
--Nicht nur den Inhalt, sondern die ganze Tabelle

drop table if exists kuenstler;
drop table if exists kuenstler_2;

select * from INFORMATION_SCHEMA.TABLES

drop table if exists kuenstlernamen_2;
