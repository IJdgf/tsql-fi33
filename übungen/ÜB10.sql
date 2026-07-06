--1. Bitte erstellen Sie eine Tabelle namens zahlen2. 
--Diese soll nur das Attribut zahl vom Typ integer enthalten.
create table zahlen2 (zahl int);

--2. Via alter table fügen Sie bitte nun das Constraint zahlPruef hinzu, 
--welches gewährleisten soll, 
--dass bei zahl nur Werte zwischen 1 und 200 inkl. eingegeben werden dürfen. 
--Testen Sie Ihr 'Werk' im Anschluss mittels folgenden inserts.

alter table zahlen2 
add constraint zahlPruef check(zahl between 1 and 200);

insert into zahlen2 values (300);
insert into zahlen2 values (111);

--3. Erstellen Sie nun bitte eine Tabelle zahlen3 mit der gleichen check-Bedingung wie zuvor.
--Nun soll das Constraint aber direkt bei der Tabellenanlage mitgegeben werden. 
--Testen Sie Ihr 'Werk' im Anschluss mittels folgenden inserts.
create table zahlen3 (
zahl int check(zahl between 1 and 200)
);

insert into zahlen2 values (300);
insert into zahlen2 values (111);

--4. Unsere Mitarbeiter arbeiten weltweit an unterschiedlichen Projekten. 
--Sie sind die meiste Zeit an Ihrem Heimatstandort, 
--oftmals aber auch für einige Wochen im Ausland. 
--Damit wir immer wissen, wann wir Sie vermutlich erreichen können, 
--soll die DB um Länder und Zeitzonen erweitert werden.
use mitarbeiter;

drop table if exists zeitzone;
drop table if exists land;

create table land(
landnr int,
landbez varchar(20)
constraint pk_land_landnr primary key (landnr)
);


insert into land values
(1,'Deutschland'),
(2,'Brasilien'),
(3,'Indien'),
(4,'China'),
(5,'Australien'),
(6,'Kanada'),
(7,'USA'),
(8,'Japan'),
(9,'Südafrika');

create table zeitzone(
zonennr int, 
zonenbez varchar(100), 
utc_offset varchar(10)
constraint pk_zeitzone_zonennr primary key(zonennr),
--constraint fk_zeitzone_land_zonennr foreign key(zonennr)
--references land(landnr)
);

alter table land add constraint fk_land_zeitzone_landnr
foreign key (landnr) references zeitzone (zonennr);

--alter table zeitzone drop fk_zeitzone_land_zonennr;

insert into zeitzone (zonennr, zonenbez, utc_offset) values
(1,'mitteleuropäische zeit (mez)','+1'),
(2,'brasília-zeit','-3'),
(3,'indische standardzeit','+5,30'),
(4,'chinesische standardzeit','+8'),
(5,'australische ostzeit (aest)','+10'),
(6,'pazifische zeit (z. b. vancouver)','-8'),
(7,'eastern standard time (z. b. new york)','-5'),
(8,'japanische standardzeit','+9'),
(9,'südafrikanische standardzeit','+2');

--5. Nun werden die Mitarbeiter zugeteilt

select * from mitarbeiter;

alter table mitarbeiter 
add mlandnr int;

alter table mitarbeiter
add constraint fk_ma_land_mlandnr 
foreign key (mlandnr) references land(landnr);

--• Die Mitarbeiter mit der ma_id 6 und 7 sind aktuell in Brasilien.
--• Die Mitarbeiter mit der ma_id 16, 23, 37 und 12 befinden sich in Australien.
--• Die Mitarbeiter mit der ma_id 11 und 13 arbeiten aktuell in Südafrika.
--• Alle anderen sind bei uns in Deutschland.
select * from mitarbeiter;

update mitarbeiter set mlandnr=
(select landnr from land where land.landbez='Brasilien')
where mitarbeiter.ma_id in (6,7);

update mitarbeiter set mlandnr=
(select landnr from land where land.landbez='Australien')
where mitarbeiter.ma_id in (16,23,37,12);

update mitarbeiter set mlandnr=
(select landnr from land where land.landbez='Südafrika')
where mitarbeiter.ma_id in (11,13);

update mitarbeiter set mlandnr=
(select landnr from land where land.landbez='Deutschland')
where mitarbeiter.mlandnr is null;

--6. Wir benötigen nun eine Information, 
--welche Mitarbeiter aktuell nicht in Deutschland sind.

select ma_id 'MA-ID', nname Nachname, vname Vorname, 
l.landbez Land, z.zonenbez Zonenbezeichnung, z.utc_offset 'UTC-Offset'
from mitarbeiter ma
join land l on l.landnr = ma.mlandnr
join zeitzone z on z.zonennr = l.landnr
where landbez != 'Deutschland';