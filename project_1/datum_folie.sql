select date_format Datumsformat, date_first "Erster Wochentag", language Sitzungssprache
from sys.dm_exec_sessions
where session_id = @@spid;drop table if exists datum;create table datum (datum date);set dateformat ymd;insert into datum values ('2023-01-22');insert into datum values ('01/22/2023');insert into datum values ('2023/22/01');select * from datum;select * from datum;set dateformat mdy;select date_format Datumsformat
from sys.dm_exec_sessions
where session_id = @@spid;

select DATENAME(year, '2026-06-29') as Jahr, 
DATENAME(month, '2026-06-29') as Monat, 
DATENAME(day, '2026-06-29') as Tag;

SELECT FORMAT(GETDATE(), 'dd MMMM yyyy', 'de-DE');

SELECT GETDATE() as Jetzt;

SELECT FORMAT(GETDATE(), 'dd MMMM yyyy', 'de-DE') as Heute;

SELECT YEAR(GETDATE()) as Jahr,
MONTH(GETDATE()) as Monat,
DAY(GETDATE()) as Tag;

insert into datum values (getdate());
select * from datum;

select * from datum
where datum between '2026-05-01' and '2027-01-01';