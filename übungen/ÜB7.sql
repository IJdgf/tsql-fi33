use manwoman;

--1. Wer hat alles das gleiche Geschlecht wie die Person mit dem Nachname Lecter?

select vorname, nachname, geschlecht
from tl3_manwoman
where geschlecht = 
(
select geschlecht
from tl3_manwoman
where nachname = 'Lecter'
)

--2. Welcher meiner Freunde (Nachname) hat zugeordnete Interessen?

select distinct nachname
from tl3_manwoman mw
join tl3_mw_interessen mwi on mwi.mwnr = mw.mwnr
order by nachname

--ODER

select nachname
from tl3_manwoman mw
where mw.mwnr in
(select mwnr from tl3_mw_interessen);

--3. Wer hat keine zugeordneten Interessen?
select nachname
from tl3_manwoman mw
where mw.mwnr not in
(select mwnr from tl3_mw_interessen);

--4. Welche Interessen haben meine Freunde? (nachname, Vorname, Interesse (also z. B. Lesen))

select vorname, nachname, i.inttext
from tl3_manwoman mw
join tl3_mw_interessen mwi on mwi.mwnr = mw.mwnr
join tl3_interessen i on i.intnr = mwi.intnr
order by vorname

--oder
select vorname, nachname, i.inttext
from tl3_manwoman mw, tl3_interessen i
where mw.mwnr in 
(select mwi.mwnr
from tl3_mw_interessen mwi
where mwi.intnr = i.intnr
)
order by vorname

--5.Welcher meiner Freunde liest gerne?
select vorname, nachname
from tl3_manwoman mw
join tl3_mw_interessen mwi on mwi.mwnr = mw.mwnr
join tl3_interessen i on i.intnr = mwi.intnr
where i.inttext = 'Lesen';

select vorname, nachname
from tl3_manwoman
where mwnr in 
(
	select mwi.mwnr
	from tl3_mw_interessen mwi
	where mwi.intnr = 
		(
		select i.intnr
		from tl3_interessen i
		where i.inttext = 'Lesen'
		)
)

--6. Wie viele Interessen (Anzahl) hat Frau Kron
select count(*) Anzahl
from tl3_mw_interessen mwi
where mwi.mwnr = 
(select mwnr
from tl3_manwoman
where nachname = 'Kron'
)

--Prüfung:
select * from tl3_mw_interessen
where mwnr = 10;

select mw.nachname, mw.vorname, count(*)
from tl3_interessen i
join tl3_mw_interessen mwi on mwi.intnr=i.intnr
join tl3_manwoman mw  on mw.mwnr=mwi.mwnr 
where mw.nachname = 'Kron'
group by mw.nachname, mw.vorname

--7. Welcher meiner Freunde (nachname, vorname) hat die gleichen Hobbies wie Lecter?

select distinct vorname, nachname
from tl3_manwoman mw
join tl3_mw_interessen mwi on mwi.mwnr = mw.mwnr
join tl3_interessen i on i.intnr = mwi.intnr --Nur wenn wir Interesse auch zeigen möchten!
where mwi.intnr in 
(select mwi.intnr
from tl3_mw_interessen mwi
join tl3_manwoman mw on mw.mwnr = mwi.mwnr
where mw.nachname = 'Lecter'
);

-- Mit MEHR selects
select nachname, vorname
from tl3_manwoman
where mwnr in
(select mwnr
from tl3_mw_interessen
where intnr in
(select intnr
from tl3_mw_interessen
where mwnr=
(select mwnr
from tl3_manwoman
where nachname='lecter'
)
)
)

-- Aufgabe 7
SELECT nachname, vorname
FROM tl3_manwoman
WHERE mwnr <> (
    SELECT mwnr
    FROM tl3_manwoman
    WHERE nachname = 'Lecter'
)
AND mwnr IN
(
    SELECT mwnr
    FROM tl3_mw_interessen
    WHERE intnr IN
    (
        SELECT intnr
        FROM tl3_mw_interessen
        WHERE mwnr =
        (
            SELECT mwnr
            FROM tl3_manwoman
            WHERE nachname = 'Lecter'
        )
    )
);

--8. Welche intnr wurden am häufigsten genannt und wie oft? Sternchenaufgabe
-- Tipp: count und max aber ohne top
select mwi.intnr, count(mwi.intnr)
from tl3_mw_interessen mwi
group by mwi.intnr
having count(mwi.intnr) =
(
select max(inter.Anzahl)
from
(select  count(*) Anzahl
from tl3_mw_interessen mwi 
group by mwi.intnr) inter 
)

SELECT intnr, COUNT(*) AS anzahl
FROM tl3_mw_interessen
GROUP BY intnr
HAVING COUNT(*) = (
SELECT MAX(anzahl_berechnet)
FROM (
SELECT COUNT(*) AS anzahl_berechnet
FROM tl3_mw_interessen
GROUP BY intnr
) AS Nebentabelle
);
 

--Prüfung:
select intnr, count(*)
from tl3_mw_interessen
group by intnr;

select * from tl3_interessen
where intnr in (2,9);

--9. Gleiches nun mit dem inttext
select mwi.intnr, i.inttext, count(mwi.intnr)
from tl3_mw_interessen mwi
join tl3_interessen i on i.intnr = mwi.intnr 
group by mwi.intnr, i.inttext
having count(mwi.intnr) =
(
select max(inter.Anzahl)
from
(select mwi.intnr Nummer, count(*) Anzahl
from tl3_mw_interessen mwi 
group by mwi.intnr) inter 
)

--10.Wer hat genauso viele Interessen wir die Person mit dem Nachnamen Tuck?

select mw.vorname, mw.nachname
from tl3_manwoman mw
where mw.mwnr in 
	(
	select mwi.mwnr
	from tl3_mw_interessen mwi
	group by mwi.mwnr
	having count(*) =
		(
			select count(*)
			from tl3_mw_interessen mwi
			where mwi.mwnr = 
			(select mw.mwnr
			from tl3_manwoman mw
			where mw.nachname = 'Tuck')
		)
	)

-- Subselect mit Join
SELECT m.nachname, m.vorname, COUNT(*) AS anzahl_interessen
FROM tl3_manwoman m
JOIN tl3_mw_interessen mwi ON m.mwnr = mwi.mwnr
GROUP BY m.mwnr, m.nachname, m.vorname
HAVING COUNT(*) = (
SELECT COUNT(*) 
FROM tl3_manwoman t_m
JOIN tl3_mw_interessen t_mwi ON t_m.mwnr = t_mwi.mwnr
WHERE t_m.nachname = 'Tuck'
)
AND m.nachname <> 'Tuck';


--11. Ein oder mehrere Hobbies wurden am häufigsten genannt.
--Was ist es und von wem wurde es genannt?

select mw.mwnr, mw.nachname, mw.vorname, i.inttext 
from tl3_interessen i 
join tl3_mw_interessen mwi on i.intnr=mwi.intnr 
join tl3_manwoman mw on mwi.mwnr=mw.mwnr 
where mwi.intnr in 
( 
select top 1 with ties intnr 
from tl3_mw_interessen 
group by intnr 
order by count(*) desc 
);