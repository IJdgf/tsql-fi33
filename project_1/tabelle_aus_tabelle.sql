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



