use test_1;
select * from mitarbeiter;

alter table mitarbeiter add nname varchar(10);

select column_name, data_type, character_maximum_length
from INFORMATION_SCHEMA.COLUMNS
where table_name = 'mitarbeiter';

alter table mitarbeiter alter column nname varchar(30);

sp_rename 'mitarbeiter.nname', 'nachname';

select * from mitarbeiter;

alter table mitarbeiter drop column nachname;

alter table mitarbeiter add nname varchar(10);
--??
alter table mitarbeiter drop column "mitarbeiter.nname";


--Nicht möglich:
--alter table mitarbeiter 
--add constraint vorname_notnull  not null (vorname)

--NOT NULL und DEFAULT sind column eigenschaften, nicht table constraints

