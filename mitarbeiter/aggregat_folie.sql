
use mitarbeiter;

select top 0 * from mitarbeiter;

set dateformat dmy;
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

--select abt.abtnr Abtnr, abt.abtbez Abteilung, count(abt.abtbez) 'Anzahl Mitarbeiter'
--from mitarbeiter ma join abteilung abt on ma.abt_nr = abt.abtnr
--group by abt.abtbez;

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
-- Abteilungen mit mehr als 3 Mitarbeiter:

select abt.abtnr AbtNr, abt.abtbez Abteilung, count(ma.ma_id) 'Anzahl MA' --count(*) passt auch
from abteilung abt
join mitarbeiter ma on abt.abtnr = ma.abt_nr
group by abt.abtnr, abt.abtbez
having count(ma.ma_id) > 3;

--Ohne Count-Spalte:
select abt.abtnr AbtNr, abt.abtbez Abteilung
from abteilung abt
join mitarbeiter ma on abt.abtnr = ma.abt_nr
group by abt.abtnr, abt.abtbez
having count(ma.ma_id) > 3;

--Jetzt möchten wir noch wissen welche Familienstände, acht-Mal oder mehr angegeben wurden

select fs.fam_bez, count(*)
from familienstand fs 
join mitarbeiter ma on ma.f_id = fs.f_id
group by fs.fam_bez
having count(*) >= 8;

select abt.abtnr, abt.abtbez, count(*)
from abteilung abt
join mitarbeiter ma on ma.abt_nr = abt.abtnr
group by abt.abtnr, abt.abtbez
having abt.abtbez in ('IT', 'Logistik');

--Besser:
select abt.abtnr, abt.abtbez, count(*)
from abteilung abt
join mitarbeiter ma on ma.abt_nr = abt.abtnr
where abt.abtbez in ('IT', 'Logistik')
group by abt.abtnr, abt.abtbez;
-- Keine Bedingung in der Aggregatfunktion (z.B. count(*)>5) => WHERE. Logisch und schneller.

select fam_bez, anzahl
from 
(
 select fam_bez, count(*) as anzahl
 from mitarbeiter
 join familienstand on familienstand.f_id = mitarbeiter.f_id
 group by fam_bez
) zwi
where anzahl = 
(
 select max(anzahl)
 from 
 (
 select fam_bez, count(*) as anzahl
 from mitarbeiter
 join familienstand on familienstand.f_id = mitarbeiter.f_id
 group by fam_bez
 ) zwi2
);