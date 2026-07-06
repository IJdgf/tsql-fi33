create login igor with password='1234', check_policy=off;

use dba1;

create user igor_dba1 for login igor;

create table table1 (id int);

select * from table1;

insert into table1 values (1), (2);

select USER_NAME();
select SYSTEM_USER;


execute as login = 'igor';
select USER_NAME();
select SYSTEM_USER;
revert;

use dba1;

grant select on table1 to igor_dba1;

select * from table1;
insert into table1 values (3);

grant insert on table1 to igor_dba1;

execute as login = 'igor';
select USER_NAME();
select SYSTEM_USER;

insert into table1 values (3);

delete from table1;
revert;

grant delete on table1 to igor_dba1;

execute as login = 'igor';
select USER_NAME();
select SYSTEM_USER;

delete from table1 where id=2;
select * from table1;
revert;

revoke delete on table1 to igor_dba1;

delete from table1 where id=3; 

revoke select on table1 to igor_dba1;
select * from table1;
insert into table1 values (23);

revoke insert on table1 to igor_dba1;

select * from table1;
insert into table1 values (33);
delete from table1;