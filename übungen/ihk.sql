--2021 Teil 1
-- a).
select top 1 with ties * from Mitglied
order by gebdat desc;

--b).
select idmitglied, mitgliedName, avg(b.bewertungsZahl) Durchschnitt
from Mitglied m
join Bewertung b on b.mitgliedid = m.idmitglied
join leistungArt la on la.idleistungArt = b.leistungArtid
where la.artBezeichnung = 'Kinderbetreueng'
group by idmitglied, mitgliedName
order by avg(b.bewertungsZahl);

--c).
select m.idMitglied, m.MitgliedName, la.artBezeichnung, a.wochentag, a.vonZeit, a.bisZeit
from Mitglied m
join Angebot a on a.mitgliedArtid = m.idmitglied
join LeistungArt la on la.idleistungArt = a.leistungArtid
where a.wochentag = 'Donnerstag'
and a.vonZeit >= '14:00'
and a.bisZeit <= '16:00'

--d).
select * into MidgliedArchiv 
from Mitglied m
where m.idmitglied not in 
(select mitgliedid from Angebot)

delete from Mitglied
where idmitglied  IN
(select mitgliedid from MidgliedArchiv)










