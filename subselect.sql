use ma_familien;

select * from menschlein m
join familienstand f on f.fid = m.fid;

--1).
select fid from menschlein
where vname = 'Eddi'
--2).
select vname from menschlein
where fid = 2;

select vname 
from menschlein m 
where m.fid = 
(
select fid from menschlein
where vname = 'Eddi'
)

select vname 
from menschlein m 
where m.fid = 
(
select fid from menschlein
where vname = 'Eddi'
) and
--vname != 'Eddi'
vname not like 'Eddi';

use musiker_db;
--Wer bedient das gleiche Genre wie Coldplay?

-- 1). Welche Genre?
select distinct t.genre_id
from interpret i 
join titel t on t.interpret_id = i.i_id
where i.name = 'Coldplay'

-- 2). Wer noch?
select i.name
from interpret i
join titel t on t.interpret_id = i.i_id
where t.genre_id = 2;

--select genre from genre
--where genre.g_id = 2;

-- Mit subselect:
select distinct i.name
from interpret i
join titel t on t.interpret_id = i.i_id
where t.genre_id =
(
select distinct t.genre_id
from interpret i 
join titel t on t.interpret_id = i.i_id
where i.name = 'Coldplay'
);

-- Was ist mit Linkin Park?
select distinct t.genre_id
from interpret i 
join titel t on t.interpret_id = i.i_id
where i.name = 'Linkin Park'

select distinct i.name
from interpret i
join titel t on t.interpret_id = i.i_id
where t.genre_id in
(
select distinct t.genre_id
from interpret i 
join titel t on t.interpret_id = i.i_id
where i.name = 'Linkin Park'
);

use mitarbeiter_ub1;
-- Übungsblatt 6
--6. Wer ist unser jüngster Mitarbeiter und in welchem Arbeitszeitmodell arbeitet der MA? 

--1). Max(gebdatum)
select max(m.gebdatum)
from mitarbeiter m;

--2). MA mit dem gleichen Geburtsdatum
select vname, nname , gebdatum
from mitarbeiter 
where gebdatum = '1998-02-18'

-- 3). Subselect

select vname, nname, gebdatum, azm.az_bez
from mitarbeiter ma
join arbeitszeitmodell azm on azm.modell_code = ma.azm_id
where gebdatum =
(
select max(m.gebdatum)
from mitarbeiter m
)

--17. Welches Interesse wurde am häufigsten genannt? (intnr, inttext, Anzahl Nennung)
use manwoman;

--1). Gruppen mit Interessen
--2). Wie viel? Max()
--3). Welche Interesse?

select max(temp.Anzahl) Maxx
from
(
select mwi .intnr, count(*) Anzahl
from tl3_mw_interessen mwi
group by mwi.intnr
) temp

select i.intnr, i.inttext, count(*) 'Anzahl Nennungen'
from tl3_interessen i
join tl3_mw_interessen mwi on mwi.intnr = i.intnr
group by i.intnr, i.inttext
having count(*) =
(
select max(temp.Anzahl) 
from
(
select mwi .intnr, count(*) Anzahl
from tl3_mw_interessen mwi
group by mwi.intnr
) temp
)

--Noch eine Variante:
SELECT i.intnr, i.inttext, COUNT(*) AS Anzahl_Nennungen
FROM dbo.tl3_interessen i
JOIN dbo.tl3_mw_interessen mwi ON mwi.intnr = i.intnr
GROUP BY i.intnr, i.inttext
HAVING COUNT(*) >= ALL (
SELECT COUNT(*) 
FROM dbo.tl3_mw_interessen
GROUP BY intnr
);

use mitarbeiter_ub1;

--Welche/r Mitarbeiter wohnt an dem Ort, 
--an dem die meisten Mitarbeiter zu Hause sind?

-- 1). Gruppe (Ort) mit meist. MA count + group by
-- 2). Max oder TOP 1
-- 3). Welche/r Mitarbeiter wohnt an dem Ort, 

select ma.vname, ma.nname, ma.ort
from mitarbeiter ma
where ma.ort in 
(
select top 2 with ties ma.ort
from mitarbeiter ma
group by ma.ort
order by count(*) desc
)
order by ort

--Versuchen wir nun herauszufinden 
--welche Mitarbeiter in den mitarbeiterstärksten Abteilungen arbeiten.



select ma.vname, ma.nname, ma.abt_nr, abt.abtbez
from mitarbeiter ma
join abteilung abt on abt.abtnr = ma.abt_nr
where ma.abt_nr in
(
select top 2 with ties ma.abt_nr
from mitarbeiter ma
group by ma.abt_nr
order by count(*) desc
)
order by abt.abtbez

-- Nun geht es um die Skills, welche Mitarbeiter verfügen über die drei Kenntnisse, 
-- welche am wenigsten verbreitet sind?

select ma.vname, ma.nname, s.s_bez
from mitarbeiter ma
join ma_skills mas on mas.ma_id = ma.ma_id
join skills s on s.s_id = mas.s_id
where mas.s_id in
(
select top 3 with ties mas.s_id
from ma_skills mas 
group by mas.s_id
order by count(*)
)
order by s.s_bez









select ma.vname, ma.nname, sk.s_bez
from mitarbeiter ma
join ma_skills mas on mas.ma_id = ma.ma_id
join skills sk on sk.s_id = mas.s_id
where mas.s_id in 
(
select top 3 with ties mas.s_id
from ma_skills mas
GROUP BY s_id
order by count(*)
)
order by sk.s_bez

