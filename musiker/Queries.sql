select name, titel from titel
join interpret on interpret_id = i_id;

select * from titel;
select * from interpret;

select name Band, titel Song from titel
join interpret on interpret_id = i_id;

select interpret.name Band, titel.titel Song, genre.genre Genre
from interpret join titel
on interpret.i_id = titel.interpret_id
join genre
on genre.g_id = titel.genre_id;


select i.name Band, t.titel Song, g.genre Genre
from interpret i join titel t
on i.i_id = t.interpret_id
join genre g
on g.g_id = t.genre_id;

select i.name Band, t.titel Song, g.genre Genre
from interpret i
join titel t on t.interpret_id = i.i_id
join genre g on g.g_id = t.genre_id
where g.genre in ('Rock', 'Reggae');
-- Alternativ:
--where g.genre = 'Rock' or g.genre = 'Reggae'


select i.name Band, t.titel Song, g.genre Genre
from interpret i join titel t
on t.interpret_id = i.i_id
join genre g on g.g_id = t.genre_id
where g.genre in ('Rock', 'Pop')
order by t.titel DESC;

select * from titel

select i.name Band, t.titel Song, g.genre Genre
from interpret i, genre g, titel t
where (i.i_id = t.interpret_id) and (g.g_id = t.genre_id)
and g.genre = 'Rock' or g.genre = 'Pop';
--Richtig:
--and (g.genre = 'Rock' or g.genre = 'Pop');


select distinct i.name Band, g.genre Genre
from interpret i join titel t
on t.interpret_id = i.i_id
join genre g on g.g_id = t.genre_id
--where g.genre in ('Rock', 'Pop')
order by t.titel ;


select i.name, ort.ort_name
from interpret i
join in_ver iv on iv.i_nr = i.i_id
join veranstaltungsort ort on ort.v_id = iv.v_nr;

select distinct i.name, g.genre
from interpret i
join titel t on t.interpret_id = i.i_id
join genre g on g.g_id = t.genre_id
order by g.genre;
