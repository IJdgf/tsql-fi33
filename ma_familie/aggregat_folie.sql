--select 
--	sum(gehalt), -- Alle Einträge bei gehalt werden aufsummiert 
--	avg(gehalt), -- Der Durchschnitt über alle Gehälter wird ermittelt 
--	min(gehalt), -- Das niedrigste Gehalt 
--	max(gehalt), -- Das höchste Gehalt 
--	count(*)	 -- Anzahl Zeilen in der Tabelle (alle, auch die mit null) 
--from personal;

--select abteilung, 
--avg(gehalt), 
--sum(gehalt), 
--count(*) 
--from personal 
--group by abteilung;

--select abteilung, avg(gehalt) from tabellenname group by abteilung having avg(gehalt) > 4000;

use menschlein;

select * from menschlein;

insert into menschlein (vname) values
('Lukas'), ('Peter');

select count(*) from menschlein;
select count(fid) from menschlein;
select count(vname) from menschlein;

select vname, count(fid) from menschlein
group by vname;
