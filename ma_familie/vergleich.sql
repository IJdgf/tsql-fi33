--Alle ids, Vornamen und Familienstandsbezeichnungen der Personen, 
--bei denen als Familienstandsbezeichnung (fbez) geschieden eingetragen wurde.

select m.id, m.vname, f.fbez
from menschlein m
join familienstand f on f.fid = m.fid
where f.fbez = 'geschieden';

--Alle ids, Vornamen und Familienstandsbezeichnungen der Personen,
-- die nicht geschieden sind

select m.id, m.vname, f.fbez
from menschlein m
join familienstand f on f.fid = m.fid
where f.fbez <> 'geschieden'

----Alle ids, Vornamen und Familienstandsbezeichnungen der Personen, 
--bei denen die Familienstands-Id (fid) gleich 1 ist.

select m.id, m.vname, f.fbez
from menschlein m
join familienstand f on f.fid = m.fid
where f.fid = 1;

--Alle ids, Vornamen und Familienstandsbezeichnungen der Personen, 
--bei denen die Familienstands-Id (fid) ungleich 1 ist.

select m.id, m.vname, f.fbez
from menschlein m
join familienstand f on f.fid = m.fid
where f.fid != 1;

--Alle ids, Vornamen und Familienstandsbezeichnungen der Personen, 
--bei denen die Familienstands-Id (fid) kleiner oder gleich 3 ist.

select m.id, m.vname, f.fbez
from menschlein m
join familienstand f on f.fid = m.fid
where f.fid <= 3;

alter table familienstand
alter column fbez varchar(50);

select * from familienstand;
select * from menschlein;

insert into familienstand values ('verwitwet'),('eingetr. Lebensgemeinschaft');

insert into menschlein values 
('Charlie',3),('Laura',5),('Melanie',1),
('Jack',1), ('Daniel',1),('Martha',null),('Harry',null);

--Alle Datensätze der Tabelle menschlein 
--bei denen die id zwischen 2 und 7 (jeweils. inkl.) ist.

select * from menschlein
where menschlein.id between 2 and 7;

--Alle ids, Vornamen und Familienstands-IDs und Familienstandsbezeichnungen der Personen, 
--bei denen die Familienstands-Id (fid) nicht zwischen 2 und 4 (jeweils. inkl.) liegt.

select m.id, m.vname, m.fid, f.fbez
from menschlein m
left join familienstand f on f.fid = m.fid
where f.fid not between 2 and 4
or f.fid is null;

select * from menschlein;

-- Alle Menschen ohne Familienstand
select * from menschlein m
where m.fid is null;

-- Alle Menschen mit Familienstand
select * from menschlein m
where m.fid is not null;

-- Alle Menschen mit dem 2. Buchstabe 'a' und danach genau 3 Buchstaben in Namen
select * from menschlein m
where m.vname like '_a___';

-- Alle Menschen mit dem 2. Buchstabe 'a'.
select * from menschlein m
where m.vname like '_a%'

insert into menschlein values ('Alex',3);
insert into menschlein values ('Klara',1);
insert into menschlein values ('Maren',4);
insert into menschlein values ('Jan',2);

select * from menschlein 
where id like ('1_');

-- Alle Menschen mit dem ID < 10, aber mit LIKE Operator
select * from menschlein m
where m.id like '_';

-- Alle Menschen mit dem ID < 10, aber mit NOT LIKE Operator
select * from menschlein
where id not like '__%';

-- Alle Menschen, die Lorenz, Jack oder Harry heißen
select * from menschlein
where menschlein.vname = 'Lorenz' or vname = 'Harry' or vname = 'Jack'

-- Alle anderen Menschen:
select * from menschlein
where menschlein.vname not in ('Lorenz', 'Harry', 'Jack');

-- Alle Menschen mit id nicht 5,7,11 oder 23,
select * from menschlein
where id not in (5,7,11, 23);

