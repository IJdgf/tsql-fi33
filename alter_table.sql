use test_db_1;


create table mitarbeiter2 (
id int , 
nachname varchar (20)
);

insert into mitarbeiter2 values 
(1, 'Müller'), 
(2, 'Wagner'),
(3, 'Murphy')

select * from mitarbeiter2;

alter table mitarbeiter2 add vname varchar(15);

select column_name, data_type, character_maximum_length 
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME = 'mitarbeiter2';

alter table mitarbeiter2 alter column vname varchar(30);

sp_rename 'mitarbeiter2.vname', 'vorname'; 

sp_rename 'mitarbeiter2', 'mitarbeiter3';

select * from mitarbeiter3;

-- DB umbenennen
ALTER DATABASE mitarbeiter_ub1
MODIFY NAME = mitarbeiter;

select * from mitarbeiter3;

alter table mitarbeiter3 drop column vorname;

alter table mitarbeiter3 
add vorname varchar(30) default 'Johnny';

insert into mitarbeiter3 values
(4, 'Doe', null);

insert into mitarbeiter3 (id, nachname) values
(5, 'Doe');

--create table datum2 (
--datum_date date,
--datum_char varchar(50)
--);

--insert into datum2 (datum_char) values
--(getdate());

--select * from datum2;

--insert into datum2 (datum_date) values
--(getdate());

--select * from datum2
--where datum_char <= getdate();

--select * from datum2
--where datum_date <= getdate();

--select year(datum_char) from datum2;
--select year(datum_date) from datum2;

create table spieler (
	spielernr int primary key, 
	nickname varchar(50) not null,
	nachname varchar(50) not null, 
	e_mail varchar(100) unique, 
	alter_jahre int check (alter_jahre between 12 and 80),
	registriert_am date default cast(getdate() as date)
);

create table kauf (
	kaufnr int primary key,
	spieler_fk int not null,
	artikel_name varchar(50) not null,
	preis decimal(8,2) check (preis > 0),
	rabatt_prozent int check (rabatt_prozent between 0 and 50),
	kaufdatum date default cast (getdate() as date)
	foreign key (spieler_fk) references spieler(spielernr)
);

insert into spieler (spielernr, nickname, nachname, e_mail, alter_jahre) values
(1, 'DragonSlayer', 'Meyer', 'dragon@example.de', 16),
(2, 'PixelPro', 'Schulz', 'pixel@example.de', 18);

insert into kauf (kaufnr, spieler_fk, artikel_name, preis, rabatt_prozent, kaufdatum) values
(100, 1, 'Skin Feuerdrache', 9.99, 10, '2025-11-20');

insert into kauf (kaufnr, spieler_fk, artikel_name, preis, rabatt_prozent) values
(101, 2 , 'XP-Booster 7 Tage', 4.49, 0);

select * from spieler;
select * from kauf;

insert into spieler (spielernr, nickname, nachname, e_mail, alter_jahre) values
(3, 'NoobMaster', 'Maier', 'dragon@example.de', 17);

insert into spieler (spielernr, nickname, nachname, e_mail, alter_jahre) values
(4, NULL, 'Berger', 'berger@example.de', 19);

insert into spieler (spielernr, nickname, nachname, e_mail, alter_jahre) values
(5, 'MiniGamer', 'Klein', 'mini@example.de', 82);


insert into kauf (kaufnr, spieler_fk, artikel_name, preis, rabatt_prozent) values
(102, 99 , 'Legendäres Schwert', 19.99, 5);

select * from spieler;

insert into kauf (kaufnr, spieler_fk, artikel_name, preis, rabatt_prozent) values
(103, 1 , 'Goldpaket', 14.99, 60);

insert into kauf (kaufnr, spieler_fk, artikel_name, preis, rabatt_prozent) values
(104, 1, 'Testartikel', 0.00, 10);

insert into kauf (kaufnr, spieler_fk, artikel_name,  rabatt_prozent) values
(104, 1, 'Testartikel', 10);

delete from kauf where preis is null;

select * from kauf;

alter table kauf alter column preis decimal(10,2) not null;
--alter table kauf add constraint kauf_check check (preis > 0);

insert into kauf (kaufnr, spieler_fk, artikel_name, preis, rabatt_prozent) values
(104, 1, 'Testartikel', 0.00, 10);

select * from mitarbeiter3;


alter table mitarbeiter3
add constraint pk_mitarbeiter3 primary key(id);

--Meldung 8111, Ebene 16, Status 1, Zeile 137
--Eine PRIMARY KEY-Einschränkung kann für eine Spalte in der mitarbeiter3-Tabelle, die NULL zulässt, nicht definiert werden.
--Meldung 1750, Ebene 16, Status 0, Zeile 137
--Die Einschränkung oder der Index konnte nicht erstellt werden. Siehe vorherige Fehler.

alter table mitarbeiter3 alter column id int not null;
-- und dann:
alter table mitarbeiter3
add constraint pk_mitarbeiter3 primary key(id);

alter table mitarbeiter3 add aktiv int;

alter table mitarbeiter3 add default 1 for aktiv; 

insert into mitarbeiter3 (id, nachname, vorname) values
(6, 'Presley', 'Elvis');

select * from mitarbeiter3;

update mitarbeiter3 set aktiv=0
where aktiv is null;

alter table mitarbeiter3
alter column aktiv int not null;

alter table mitarbeiter3
add constraint check_aktiv_ma3 
check (aktiv in (0, 1));

insert into mitarbeiter3 (id, nachname, vorname, aktiv) values
(7, 'Turner', 'Tina', 1);

select * from mitarbeiter3;

alter table mitarbeiter3 drop constraint check_aktiv_ma3;

insert into mitarbeiter3 (id, nachname, vorname, aktiv) values
(8, 'Berry', 'Chuck', 5);

delete from mitarbeiter3 where id = 4;

alter table mitarbeiter3 
add constraint unique_nachname_ma3 unique(nachname);

insert into mitarbeiter3 (id, nachname, vorname, aktiv) values
(9, 'Berry', 'Chuck', 5);
