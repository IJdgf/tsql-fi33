drop table if exists menschlein;
drop table if exists familienstand;

create table familienstand (
fid int identity(1,1) primary key,
fbez varchar(20)
);

create table menschlein(
id int identity(1,1),
vname varchar(50) not null,
fid int,
constraint PK_mensch primary key(id),
constraint FK_mensch_famstand_fid 
foreign key (fid) references familienstand(fid)
);

insert into familienstand values
('Ledig'), ('Verheiratet'), ('Geschieden');

insert into menschlein values
('Lisa', 3),
('Hanni', 1),
('Eddi', 2),
('Lorenz', 2);

insert into menschlein values
('Lina', 1);

select vname Vorname, fbez "Familienstand des Mitarbeiters" from menschlein
join familienstand on menschlein.fid = familienstand.fid
where vname like '____';    -- Vorname hat 4 Symbolen
--where vname like 'Li_a';  -- Lisa oder Lina: 1 Symbol dazwischen
--where vname like '%i%';   -- Name enthält "i"

-- % = belibig viele Symbolen
-- _ = genau 1 Symbol

--SELECT t.name AS Tabelle,    c.name AS Spalte, 
--CASE WHEN EXISTS (SELECT 1 FROM sys.index_columns ic 
--WHERE ic.object_id = c.object_id AND ic.column_id = c.column_id 
--AND EXISTS (SELECT 1 FROM sys.indexes i 
--WHERE i.object_id = ic.object_id AND i.index_id = ic.index_id 
--AND i.is_primary_key = 1)) 
--THEN 'PK' ELSE 'NULL' END AS PK,CASE WHEN EXISTS 
--(SELECT 1 FROM sys.foreign_key_columns fkc 
--WHERE fkc.parent_object_id = c.object_id AND 
--fkc.parent_column_id = c.column_id) 
--THEN 'FK' ELSE 'NULL' END AS FK,
--ISNULL(OBJECT_NAME(fkc.referenced_object_id) + '.' + rc.name, 
--'NULL') AS FK_zeigt_auf FROM sys.tables t INNER JOIN 
--sys.columns c ON t.object_id = c.object_id 
--LEFT JOIN sys.foreign_key_columns fkc 
--ON fkc.parent_object_id = t.object_id AND 
--fkc.parent_column_id = c.column_id 
--LEFT JOIN sys.columns rc ON fkc.referenced_object_id = rc.object_id 
--AND fkc.referenced_column_id = rc.column_id
--WHERE t.name IN ('familienstand', 'menschlein')
--ORDER BY Tabelle, Spalte;