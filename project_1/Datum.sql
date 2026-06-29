drop table if exists datum;

create table datum (
id int identity(1,1) primary key,
datum date
);

insert into datum values ('06-29-2026');
--insert into datum values ('29-06-2026');
insert into datum values ('2026-06-29');

select * from datum;

select date_format Datumsformat, date_first "Erster Wochentag", 
language Sitzungssprache 
from sys.dm_exec_sessions 
where session_id = @@spid;

set dateformat mdy;

set dateformat ymd;

truncate table datum;

insert into datum values ('2025-07-30');
insert into datum values ('2026.08.01');
insert into datum values ('2024/02/29');

select * from datum;

set language us_english;
set language german;

select getdate() as Jetzt;

insert into datum values (getdate());

insert into datum values (getdate());

select year(getdate()) Jahr,
month(getdate()) Monat,
day(getdate()) Tag;

select * from datum;

select year(datum) Jahr,
month(datum) Monat,
day(datum) tag
from datum;

insert into datum values
('2025-01-01'),
('2025-12-31');

select * from datum;
select * from datum
where datum.datum between '2025-01-01' and '2025-12-31'


