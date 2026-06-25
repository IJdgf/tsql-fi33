--Wiederholung:

select * from mein_test3;

sp_rename 'mein_test3', 'kermit'

drop table mein_test_6

update mein_test4 set vorname = 'Hans' where id=20; 

insert into mein_test4 values (1, 'Lukas'), (4, 'Anna');

insert into mein_test4 values (25, null), (2, 'null');

insert into mein_test4 values (3, 'Lukas'), (2, 'null'), (-4, Null), (25, null);

delete from mein_test4 where vorname is null or vorname = 'null';

delete from mein_test4 where id < 0;

delete from mein_test4 where id != 42;

delete from mein_test4 where vorname <> 'Anna';

delete from mein_test4 where vorname = 'Lukas';

delete mein_test4;

truncate table mein_test4;

drop table mein_test1

sp_rename 'mein_test_9', 'vornamennn'

drop table mein_test4

--Tabelle aus Tabelle selektiv

select * from kermit;

select column_name, data_type, character_maximum_length 
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME = 'kermit';

create table kermit_archive (
nummer int,
vname varchar(10)
);

insert into kermit_archive
select * from kermit;

select * from kermit_archive;
delete from kermit_archive;

insert into kermit_archive
select * from kermit
where vorname <> 'Kermit' and vorname != 'null' 
and vorname is not null

create table kermit_archive_2 (
id int identity(1,1),
vname varchar(10)
);

select * from kermit_archive_2

insert into kermit_archive_2
select vorname from kermit;

select * from kermit_archive_2;

select * into kermit_archive_3 from kermit;
select * from kermit_archive_3;

select * into kermit_archive_2 from kermit;

select * into neu_kermit from kermit_archive_2;
select * from neu_kermit;

insert into neu_kermit values ('asök');





