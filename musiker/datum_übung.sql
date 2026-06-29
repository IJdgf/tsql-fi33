--1. Bitte erstellen Sie eine Liste aller Interpreten und deren Titel

select top 0 * from interpret;
select top 0 * from titel;

select i.name, titel.titel
from interpret i
join titel on titel.interpret_id = i.i_id;

--2. Welche Titel fallen alle unter das Genre Klassik?
select top 0 * from titel;

select titel.titel, genre.genre
from titel
join genre on titel.genre_id = genre.g_id
where genre.genre = 'Klassik';

--3. Bitte überprüfen Sie, ob 'Miles Davis' 
--am 01.07.2027 gebucht werden kann
select top 1 * from in_ver;

select i.name, iv.datum_von, iv.datum_bis
from in_ver iv
join interpret i on i.i_id = iv.i_nr
where i.name = 'Miles Davis'
--where i.name like 'Miles%'
and  iv.datum_von <= '2027-07-01' 
and iv.datum_bis >= '2027-07-01';
--and '2027-07-01' between iv.datum_von and iv.datum_bis;

--4. Ich meine mich zu erinnern, 
--dass Miles Davis am 30.06.2026 bereits irgendwo 
--gebucht wurde. Ermitteln Sie an welchem 
--Veranstaltungsort er auftreten wird. Und am 2027-03-08?
--Und alle seine Veranstaltungen im 2026?


--select top 1 * from veranstaltungsort;

set dateformat dmy;

select i.name, ort.ort_name, iv.datum_von, iv.datum_bis
from interpret i
join in_ver iv on iv.i_nr = i.i_id
join veranstaltungsort ort on ort.v_id = iv.v_nr
where i.name = 'Miles Davis' and
('30.06.2026' between iv.datum_von and iv.datum_bis
or
'2027-03-08' between iv.datum_von and iv.datum_bis);




select i.name, ort.ort_name, iv.datum_von, iv.datum_bis
from interpret i
join in_ver iv on iv.i_nr = i.i_id
join veranstaltungsort ort on ort.v_id = iv.v_nr
where i.name = 'Miles Davis'
and 
year(iv.datum_von)<=2026 and year(iv.datum_bis)>=2026;
--2026 between year(iv.datum_von) and year(datum_bis);






select * from interpret where name = 'Miles Davis' -- 3
select * from in_ver

insert  into in_ver values
(3, 1, '2025-12-01', '2027-12-01'),
(3, 1, '2025-12-01', '2026-12-01'),
(3, 1, '2026-12-01', '2027-12-01');

--select i.name, in_ver.datum_von, in_ver.datum_bis, vort.ort_name  
--from interpret i
--join in_ver on in_ver.i_nr = i.i_id
--join veranstaltungsort vort on vort.v_id=in_ver.v_nr
--where i.name = 'Miles Davis' 
--and (year(in_ver.datum_von)=2026 or year(in_ver.datum_bis)=2026);


























set dateformat dmy;
select i.name, ort.ort_name, iv.datum_von, iv.datum_bis
from interpret i
join in_ver iv on i.i_id = iv.i_nr
join veranstaltungsort ort on ort.v_id = iv.v_nr
where i.name like 'Miles%' 
and 
(
'30.06.2026' between iv.datum_von and iv.datum_bis
or 
'08.03.2027' between iv.datum_von and iv.datum_bis
);


select i.name, ort.ort_name, iv.datum_von, iv.datum_bis
from interpret i
join in_ver iv on i.i_id = iv.i_nr
join veranstaltungsort ort on ort.v_id = iv.v_nr
where i.name like 'Miles%' 
and 
2026 in (year(iv.datum_von), year(iv.datum_bis));

--(year(iv.datum_von) = 2026 
--or 
--year(iv.datum_bis) = 2026);
