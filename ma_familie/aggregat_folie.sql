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


use mitarbeiter;

--Weiter: Aggregat_Folie in "Mitarbeiter"-Ordner öffnen

select top 0 * from mitarbeiter;

insert into mitarbeiter values ('Lecter','Hanni','Brainweg 11', 90455, 'Nuernberg','17.11.1962',4,5,null);

select * from mitarbeiter;

select count(*) from mitarbeiter;
select count(azm_id) from mitarbeiter;
select count(mitarbeiter.nname) from mitarbeiter;


--Count zählt Datensätze.
-- Count(*) zählt alle Datensätze,
-- count(geschlecht) zählt alle Datensätze, welche bei geschlecht einen Eintrag haben

--Grüppchenbildung mittels group by

select count(abt.abtbez)
from mitarbeiter ma join abteilung abt on ma.abt_nr = abt.abtnr

select count(*)
from mitarbeiter ma join abteilung abt on ma.abt_nr = abt.abtnr

select abt.abtnr Abtnr, abt.abtbez Abteilung, count(abt.abtbez) 'Anzahl Mitarbeiter'
from mitarbeiter ma join abteilung abt on ma.abt_nr = abt.abtnr
group by abt.abtbez;

--Meldung 8120, Ebene 16, Status 1, Zeile 57
--Die abteilung.abtnr-Spalte ist in der Auswahlliste ungültig, 
--da sie nicht in einer Aggregatfunktion und nicht in der GROUP BY-Klausel enthalten ist.

select abt.abtnr Abtnr, abt.abtbez Abteilung, count(abt.abtbez) 'Anzahl Mitarbeiter'
from mitarbeiter ma join abteilung abt on ma.abt_nr = abt.abtnr
group by abt.abtbez, abt.abtnr;

--Macht kein Sin mehr:
select ma.nname, abt.abtnr Abtnr, abt.abtbez Abteilung, count(abt.abtbez) 'Anzahl Mitarbeiter'
from mitarbeiter ma join abteilung abt on ma.abt_nr = abt.abtnr
group by abt.abtbez, abt.abtnr, ma.nname;

--Nun möchte ich wissen, wie viele Mitarbeiter wir pro Familienstand gespeichert haben.
--Es muss wieder gezählt und dann gruppiert werden

select fst.fam_bez Familienstand, count(*) 'Anzahl Mitarbeiter'
from familienstand fst
join mitarbeiter ma on ma.f_id = fst.f_id
group by fst.fam_bez;

--HAVING