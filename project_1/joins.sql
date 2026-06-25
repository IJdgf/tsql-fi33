drop table if exists mitarbeiter;
drop table if exists abteilung;

create table abteilung(
id int identity(1,1) primary key,
bez varchar(50)
);

create table mitarbeiter(
id int identity(1,1) primary key,
vname varchar(50),
abt int,
foreign key (abt) references abteilung(id)
);

insert into abteilung values
('Verwaltung'), ('Marketing'), ('IT')

insert into mitarbeiter values
('Johnny', 1), ('Gabriela', 1),
('Karl', null), ('Lena', 2)

--select vname, bez 
--from mitarbeiter, abteilung
--where abt = abteilung.id

select * from mitarbeiter;
select * from abteilung;

select vname Vorname, bez Abteilung
from mitarbeiter
join
abteilung 
on abt = abteilung.id

select vname Vorname, bez Abteilung
from mitarbeiter
left join abteilung on abt = abteilung.id

select vname Vorname, bez Abteilung
from mitarbeiter
right join abteilung on abt = abteilung.id

select vname Vorname, bez Abteilung
from mitarbeiter
full outer join abteilung on abt = abteilung.id;

select vname Vorname, bez Abteilung
from mitarbeiter
left join abteilung on abt = abteilung.id
where abteilung.id is null;

select vname Vorname, bez Abteilung
from mitarbeiter
right join abteilung on abt = abteilung.id
where mitarbeiter.id is null

select vname Vorname, bez Abteilung
from mitarbeiter
full outer join abteilung on abt = abteilung.id
where mitarbeiter.id is null or abteilung.id is null
