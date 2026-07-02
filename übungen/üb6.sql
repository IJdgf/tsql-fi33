use musiker_db;

--1. Bitte ermitteln Sie, wie viele Titel wir pro Genre gespeichert haben. Genre und Anzahl Songs
select top 1 * from titel;

select g.genre, count(*) 'Anzahl Songs'
from titel t
join genre g on g.g_id = t.genre_id
group by g.genre;

--2. Bitte erstellen Sie eine Auflistung, wie viele unterschiedliche Titel jeder Interpret in seinem
--Repertoire hat. Sortieren Sie die Ausgabe bitte nach Interpret.

select i.name, count(*) 'Anzahl Songs'
from titel t 
join interpret i on i.i_id  = t.interpret_id
group by i.name
order by i.name;

select i.name, count(*) 'Anzahl Songs'
from interpret i 
join titel t  on i.i_id  = t.interpret_id
group by i.name
order by i.name;

--3. Bei welchen Interpreten haben wir mehr als sechs Titel gespeichert. Sortieren Sie die Ausgabe
--bitte nach Interpret.

select i.name, count(*)
from interpret i
join titel t on t.interpret_id = i.i_id
group by i.name
having count(*) > 6
order by i.name;

--4. Bitte erzeugen Sie eine Liste die uns informiert, welches die jeweils ersten Auftrittstage der
--Interpreten sind und wo die Auftritte stattfinden. Sortierung bitte nach Interpret. 

select i.name, vo.ort_name, min(iv.datum_von) '1. Auftrittstag'
from interpret i
join in_ver iv on iv.i_nr = i.i_id
join veranstaltungsort vo on vo.v_id = iv.v_nr
group by i.name, vo.ort_name
order by i.name;

--5. Welche Familienstände sind wie häufig vertreten? Folgende Ausgabe wird erwartet.

use mitarbeiter_ub1;

select fs.fam_bez, count(*)
from mitarbeiter ma
join familienstand fs on fs.f_id = ma.f_id
group by fs.fam_bez;

--6. Wer ist unser jüngster Mitarbeiter und in welchem Arbeitszeitmodell arbeitet der MA? 

select max(ma.gebdatum)
from mitarbeiter ma;

select ma.ma_id, ma.vname, ma.nname, ma.gebdatum, azm.az_bez
from mitarbeiter ma
join arbeitszeitmodell azm on azm.modell_code = ma.azm_id
where ma.gebdatum = '1998-02-18'

select top 1 with ties ma.ma_id, ma.vname, ma.nname, ma.gebdatum, azm.az_bez
from mitarbeiter ma
join arbeitszeitmodell azm on azm.modell_code = ma.azm_id
order by ma.gebdatum desc;

--7. Wie viele Mitarbeiter beschäftigen wir je Abteilung?

select count(*), abt.abtbez Abteilung
from mitarbeiter ma
join abteilung abt on abt.abtnr = ma.abt_nr
group by abt.abtbez;


-- 8. In welcher/welchen Abteilungen arbeiten die meisten Mitarbeiter?
select top 1 with ties abt.abtbez Abteilung, count(*) 'Anzahl Mitarbeiter'
from mitarbeiter ma
join abteilung abt on abt.abtnr = ma.abt_nr
group by abt.abtbez
order by 'Anzahl Mitarbeiter' desc;

--9. Welche Mitarbeiter haben mehr als 2 Skills angegeben und wie viele Skills sind das?

select ma.vname, ma.nname,  count(*) 'Anzahl Skills'
from mitarbeiter ma
join ma_skills mas on mas.ma_id = ma.ma_id
--join skills s on s.s_id = mas.s_id
group by ma.vname, ma.nname
having count(*) > 2;

--10. Welche/r Skill/s wurde/n am häufigsten genannt?

select top 1 with ties s.s_bez, count(*) 'Anzahl Nennungen'
from mitarbeiter ma
join ma_skills mas on mas.ma_id = ma.ma_id
join skills s on s.s_id = mas.s_id
group by s.s_bez
order by 'Anzahl Nennungen' desc;

select top 1 with ties s.s_bez, count(*) 'Anzahl Nennungen'
from ma_skills mas 
join skills s on s.s_id = mas.s_id
group by s.s_bez
order by 'Anzahl Nennungen' desc;


--11. Erstellen Sie bitte nun selbstständig eine neue Datenbank mit dem Namen manwomanDB. Im
--Anhang finden Sie den SourceCode für die Erstellung der Tabellen und die Inserts.
--Aber Achtung, es hat sich ein Fehler eingeschlichen, entweder Sie finden und entfernen den fehlerhaften
--Eintrag zuerst oder Sie lassen sich beim inserten von der Fehlermeldung des Systems inspirieren
--und reagieren dann. Ihre Entscheidung

use manwoman;

--14. Bitte ermitteln Sie, welche Interessensnummer wie oft genannt wurde. Erwartet werden pro
--intnr die Anzahl der Nennungen. Hier ist eine Gruppierung erforderlich. Sortieren Sie die Ausgabe
--nach Anzahl intnr.

select mwi.intnr, count(*)
from tl3_manwoman mw
join tl3_mw_interessen mwi on mw.mwnr = mwi.mwnr
--join tl3_interessen i on i.intnr = mwi.intnr
group by mwi.intnr
order by count(*);

select mwi.intnr, i.inttext, count(*)
from  tl3_mw_interessen mwi 
join tl3_interessen i on i.intnr = mwi.intnr
group by mwi.intnr, inttext
order by count(*);

--15. Welches sind die drei Personen (Vornamen) mit der höchsten mwnr?
select top 3 mw.vorname
--, mw.mwnr
from tl3_manwoman mw
order by mw.mwnr desc;

--16. Welche intnr (ggf. auch mehrere) wurden am häufigsten genannt?
select top 1 with ties i.intnr, count(*)
from tl3_interessen i
join tl3_mw_interessen mwi on mwi.intnr = i.intnr
group by i.intnr
order by count(*) desc;

select top 1 with ties mwi.intnr, count(*)
from  tl3_mw_interessen  mwi
group by mwi.intnr
order by count(*) desc;

--17. Welches Interesse wurde am häufigsten genannt? (intnr, inttext, Anzahl Nennung)
select top 1 with ties i.intnr, i.inttext, count(*) 'Anzahl Nennungen'
from tl3_interessen i
join tl3_mw_interessen mwi on mwi.intnr = i.intnr
group by i.intnr, i.inttext
order by count(*) desc;


