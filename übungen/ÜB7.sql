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

--7. Welcher meiner Freunde (nachname, vorname) hat die gleichen Hobbies wie Lecter?

select vorname, nachname
from tl3_manwoman mw
join tl3_mw_interessen mwi on mwi.mwnr = mw.mwnr
where mwi.intnr in 
(select

)


