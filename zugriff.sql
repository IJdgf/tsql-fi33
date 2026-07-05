
create login igor2 with password='1234';

-- Login = Zugriff zum Server. Kann 0 (keine DB) bis n (mehrere DB) users haben.

use dba1;
-- Создадим заранее таблицу
create table table1 (id int);
select * from table1;

create user igor_dba1 for login igor2;
-- Passiert in der DB. USER = Benutzer der DB. Gehört zu einem Login


--Löschen in der anderen Reihenfolge:
--drop user igor_dba1; -- Erstmal user in jeder DB
--drop login igor2;    -- Dann login, passiert auf dem Server


--Перед подключением проверить: Mixed Mode скорее всего выключен
--SQL Server может не принимать SQL логины
-- Правая мыш на сервер - свойства - безопасность - проверка Windows И Sql-server. 
--Теперь можно подключаться:
--File -> подключить к обозревателю объектов (самая верхняя)
--ИЛИ:
--Проверка внутри SSMS через impersonation (очень полезно)

--Ты можешь “стать пользователем” без нового подключения:

--EXECUTE AS LOGIN = 'igor2';

--Теперь выполняешь запросы как он:

--SELECT USER_NAME();
--SELECT SYSTEM_USER;
--Вернуться обратно:
--REVERT;


--File ->

--Выбираем второй открытый снизу сервер, в нем создаем запрос и пробуем:
use dba1;
select * from table1;
--Сообщение 229, уровень 14, состояние 5, строка 1
--The SELECT permission was denied on the object 'table1', database 'dba1', schema 'dbo'.

--В основном файле:
grant select on table1 to igor_dba1;  -- Доступ даем к конкретной таблице!

-- переподключаемся к пользователю:
select * from table1; -- теперь работает!

--А вот это нет!
insert into table1 values (1), (2), (3);
--Сообщение 229, уровень 14, состояние 5, строка 55
--The INSERT permission was denied on the object 'table1', database 'dba1', schema 'dbo'.

--Переподключаемся и даем права на insert:
grant insert on table1 to igor_dba1;

EXECUTE AS LOGIN = 'igor2';
select SYSTEM_USER; --igor_dba1
select USER_NAME(); --igor2

insert into table1 values (1), (2), (3);
select * from table1;

delete from table1 where id = 3;
--The DELETE permission was denied on the object 'table1', database 'dba1', schema 'dbo'.

revert;
select SYSTEM_USER; --windows login
select USER_NAME(); --dbo

-- Wir werden unserem Nutzer alle Rechte entziehen
revoke insert on table1 to igor_dba1;
revoke select on table1 to igor_dba1; 

EXECUTE AS LOGIN = 'igor2';
select SYSTEM_USER; --igor_dba1
select USER_NAME(); --igor2

insert into table1 values (4);
select * from table1;

revert;


--BESSER: Rolle eingeben

--Стандартные роли:
--📖 db_datareader
--SELECT ко всем таблицам
--ALTER ROLE db_datareader ADD MEMBER igor_dba1;

--✏️ db_datawriter
--INSERT / UPDATE / DELETE ко всем таблицам
--ALTER ROLE db_datawriter ADD MEMBER igor_dba1;

--👑 db_owner
--Полный контроль над базой (почти root внутри DB)
--ALTER ROLE db_owner ADD MEMBER igor_dba1;

--🔐 db_securityadmin
--Управление правами в базе

--🧱 db_ddladmin
--Создание/изменение объектов (CREATE/ALTER TABLE etc.)

--Как назначать роли (главный синтаксис)
--✔ Добавить пользователя в роль
--ALTER ROLE db_datareader ADD MEMBER igor_dba1;
--✔ Удалить
--ALTER ROLE db_datareader DROP MEMBER igor_dba1;


-- ROLLE DATAREADER
alter role db_datareader add member igor_dba1;

EXECUTE AS LOGIN = 'igor2';
select SYSTEM_USER; --igor_dba1
select USER_NAME(); --igor2

select * from table1;
insert into table1 values (4); --Fehlermeldung

revert;

-- ROLLE DATAWRITER
alter role db_datawriter add member igor_dba1;

EXECUTE AS LOGIN = 'igor2';
select SYSTEM_USER; --igor_dba1
select USER_NAME(); --igor2

insert into table1 values (4); --Allright!
select * from table1;
revert;
--

-- Writer entzogen:
alter role db_datawriter drop member igor_dba1;
EXECUTE AS LOGIN = 'igor2';
select SYSTEM_USER; --igor_dba1
select USER_NAME(); --igor2

select * from table1;
insert into table1 values (5); --Fehlermeldung

revert;
--

-- Reader entzogen:
alter role db_datareader drop member igor_dba1;
EXECUTE AS LOGIN = 'igor2';
select SYSTEM_USER; --igor_dba1
select USER_NAME(); --igor2


select * from table1; --Fehlermeldung

insert into table1 values (5); --Fehlermeldung

revert;
--

-- Wieder DATAWRITER ohne Reader
alter role db_datawriter add member igor_dba1;

EXECUTE AS LOGIN = 'igor2';
select SYSTEM_USER; --igor_dba1
select USER_NAME(); --igor2

select * from table1; --Fehlermeldung!
insert into table1 values (5); --Allright!
revert;
--

--Löschen in der anderen Reihenfolge:
--drop user igor_dba1; -- Erstmal user in jeder DB
--drop login igor2;    -- Dann login, passiert auf dem Server


-- Erstmal von den Rollen entziehen - nicht nötig. Alle anschauen:
--SELECT r.name AS role_name
--FROM sys.database_role_members rm
--JOIN sys.database_principals r 
--    ON rm.role_principal_id = r.principal_id
--JOIN sys.database_principals u 
--    ON rm.member_principal_id = u.principal_id
--WHERE u.name = 'igor_dba1';

drop user igor_dba1; -- Für jede DB! Wir haben den User aber nur für 1 DB erstellt. 
drop login igor2; -- Fehler: Could not drop login 'igor2' as the user is currently logged in.

SELECT 
    session_id,
    login_name,
    host_name,
    program_name,
    status
FROM sys.dm_exec_sessions
WHERE login_name = 'igor2';

kill 57; -- session_id
kill 55;

drop login igor2; -- Erfolg