use menschlein;

select * from menschlein
join familienstand on menschlein.fid = familienstand.fid;

--Wer hat den gleichen Familienstand wie Eddi?

-- 1).
select fs.fid, fs.fbez
from familienstand fs
join menschlein m on m.fid = fs.fid
where m.vname = 'Eddi';


-- Antwort: 2 - Verheiratet

--oder einfacher:
select m.fid from menschlein m 
where m.vname = 'Eddi';
-- Antwort: 2

-- 2).
select m.vname
from menschlein m
where m.fid = 2
-- Antwort: Eddi, Lorenz und Jan

-- Können wir es in einer Abfrage schreiben? Die antwort ist ja:

select m.vname
from menschlein m
where m.fid = 
(select m.fid from menschlein m 
where m.vname = 'Eddi'
);

--Alle außer Eddi:
select m.vname
from menschlein m
where m.fid = 
(select m.fid from menschlein m 
where m.vname = 'Eddi'
)
and m.vname != 'Eddi';

-- Zu Intepreten wechseln
use musiker;

--Wer bedient das gleiche Genre wie Coldplay?

-- 1). Welche Genre?
select distinct t.genre_id
from interpret i
join titel t on t.interpret_id = i.i_id
where i.name = 'Coldplay';

-- Ergebnis: 2. Das ist Pop, wir können es mit einer anderen Abfrage ausfinden. 

--Der innere select darf immer nur eine Spalte zurückgeben.
--Mehrere Zeilen sind möglich, dazu kommen wir gleich noch.

-- 2). Wer noch das Genre 'Pop' bedient?
select distinct i.name
from interpret i
join titel t on t.interpret_id = i.i_id
where t.genre_id = 2

-- Ergebnis: Adele und Coldplay

--Beides in einer Abfrage zusammen mit genre dazu:
select distinct i.name, g.genre
from interpret i
join titel t on t.interpret_id = i.i_id
join genre g on g.g_id = t.genre_id
where t.genre_id = 
(select distinct t.genre_id
from interpret i 
join titel t on t.interpret_id = i.i_id
where i.name = 'Adele'
);

-- Was ist mit Linkin Park?
select distinct t.genre_id
from interpret i
join titel t on t.interpret_id = i.i_id
where i.name = 'Linkin Park';

-- Das Ergebnis ist 2 und 7. 7 ist aber Reggae, es ist falsch. Muss Alternative sein. Ändern wir.
update titel set titel.genre_id=8 where titel='Numb';
-- Schon besser!

-- 2 Genres! Wir können nicht aber mit 2 oder mehreren Werte mit "=" vergleichen
-- die Lösung: "IN"

select distinct i.name, g.genre
from interpret i
join titel t on t.interpret_id = i.i_id
join genre g on g.g_id = t.genre_id
where t.genre_id IN 
(select distinct t.genre_id
from interpret i 
join titel t on t.interpret_id = i.i_id
where i.name = 'Linkin Park'
);


