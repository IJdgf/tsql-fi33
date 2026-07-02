
use manwoman;

-- tabellen droppen
drop table if exists tl3_mw_interessen;
drop table if exists tl3_manwoman;
drop table if exists tl3_interessen;

/*
Tabellen anlegen
tl3_interessen
tl3_manwoman
tl3_mw_interessen
*/

set dateformat dmy;
CREATE TABLE tl3_manwoman
(
mwnr integer primary key,
nachname varchar(30) not null,
vorname varchar(30),
geschlecht char(1),
email varchar(60),
gebdatum date
);
CREATE TABLE tl3_interessen
(
intnr integer primary key,
inttext varchar(30)
);
CREATE TABLE tl3_mw_interessen
(
mwnr integer,
intnr integer,
foreign key (intnr) references tl3_interessen(intnr),
foreign key (mwnr) references tl3_manwoman(mwnr),
primary key (intnr, mwnr)
);
-- nummer,nachname,vorname,geschlecht,email,gebdat
insert into tl3_manwoman values
(1,'Lecter','Hannibal','m','hunger@braini.de','17.12.1954'),
(02,'Pett','Brad','m','mrjolie@angelina.com','03.05.1965'),
(03,'Walker','Jonny','m','prost@feierlaune.net','07.06.1966'),
(04,'Daniels','Jackomo','m','casanova@kloster.de','01.03.1991'),
(05,'Blond','James','m','goldfinger@agent.com','01.03.1985'),
(06,'Hari','Martha','w','spion@ichsehdich.de','18.08.1965'),
(07,'Spass','Wilma','w','wilma,spass@arbeit.com','13.04.1972'),
(08,'Tuck','Tina','w','gacker@entenhausen.com','03.08.1966'),
(09,'Darling','Claire','w','area11@zelle17.net','11.11.1977'),
(10,'Kron','Maria','w','maria-kron@getraenkemarkt.com','02.02.1970'),
(11,'NFurter','Frank','m','franky@transilvania.com','31.10.1988'),
(12,'Maus','Mini','w','mausefalle@zugeschnappt.de','04.6.1977');

-- nr, interesse
insert into tl3_interessen values
(1,'lesen'),
(2,'ausgehen'),
(3,'schwimmen'),
(4,'tanzen'),
(5,'kochen'),
(6,'programmieren'),
(7,'singen'),
(8,'Filme'),
(9,'reisen'),
(10,'fotografieren'),
(11,'malen'),
(12,'heimwerkern');
-- mensch,interesse
insert into tl3_mw_interessen values
(1,1),(1,5),(1,9),(2,4),(2,2),(2,9),(3,1),(3,2),(3,12),(4,4),(4,2),
(4,10),(5,3),(5,8),(5,9),(5,2),(5,4),(6,1),(5,8),(6,11),(6,7),(7,5),
(7,12),(8,8),(8,4), (8,2),(8,9),(9,1),(9,2),(9,5),(9,9),(10,3),(10,8),
(10,9),(10,12);