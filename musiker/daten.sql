INSERT INTO genre VALUES
('Rock'), 
('Pop'),
('Jazz'),
('Hip-Hop'),
('Klassik'),
('Electronic'),
('Reggae');

INSERT INTO genre VALUES
('Alternative')

select * from genre;

INSERT INTO interpret VALUES
('The Rolling Stones'),
('Adele'),
('Miles Davis'),
('Eminem'),
('Ludwig van Beethoven'),
('Daft Punk'),
('Bob Marley Junior'),
('Coldplay'),
('Nina Simone'),
('Linkin Park')

insert into titel values
('Satisfaction', 1, 1), 
('Start Me Up', 1, 1), 
('Paint It Black', 1, 1), 
('Jumpin’ Jack Flash', 1, 1), 
('Brown Sugar', 1, 1), 
('Wild Horses', 1, 1), 
('Hello', 2, 2), 
('Rolling in the Deep', 2, 2), 
('Someone Like You', 2, 2), 
('Easy On Me', 2, 2), 
('So What', 3, 3), 
('Freddie Freeloader', 3, 3), 
('Blue in Green', 3, 3), 
('All Blues', 3, 3), 
('Milestones', 3, 3), 
('Nardis', 3, 3), 
('Lose Yourself', 4, 4), 
('The Real Slim Shady', 4, 4), 
('Without Me', 4, 4), 
('Mockingbird', 4, 4), 
('Stan', 4, 4), 
('Symphonie Nr. 5', 5, 5), 
('Für Elise', 5, 5), 
('Mondscheinsonate', 5, 5), 
('Ode an die Freude', 5, 5), 
('Harder Better Faster Stronger', 6, 6), 
('One More Time', 6, 6), 
('Digital Love', 6, 6), 
('Robot Rock', 6, 6), 
('Get Lucky', 6, 6), 
('Around the World', 6, 6), 
('Technologic', 6, 6), 
('No Woman No Cry', 7, 7), 
('Three Little Birds', 7, 7),
('Redemption Song', 7, 7), 
('Jamming', 7, 7), 
('Could You Be Loved', 7, 7), 
('Viva La Vida', 8, 2), 
('Paradise', 8, 2), 
('Fix You', 8, 2), 
('The Scientist', 8, 2), 
('Clocks', 8, 2), 
('Yellow', 8, 2), 
('Hymn for the Weekend', 8, 2), 
('A Sky Full of Stars', 8, 2), 
('Feeling Good', 9, 3), 
('I Put a Spell on You', 9, 3), 
('Don’t Let Me Be Misunderstood', 9, 3), 
('Ain’t Got No, I Got Life', 9, 3), 
('Numb', 10, 1), 
('In the End', 10, 1), 
('Breaking the Habit', 10, 1), 
('One Step Closer', 10, 1), 
('Crawling', 10, 1), 
('Faint', 10, 1), 
('Papercut', 10, 1), 
('Somewhere I Belong', 10, 1)

select * from genre
select * from titel where titel.titel = 'Numb'

update titel set titel.genre_id = 7 where titel.titel = 'Numb'

select titel, interpret.name, genre.genre from titel
join interpret on titel.interpret_id = interpret.i_id
join genre on titel.genre_id = genre.g_id

select * from titel


/*
INSERT INTO titel (titel, interpret_id, genre_id) VALUES
('Satisfaction', 1, 1),
('Start Me Up', 1, 1),
('Paint It Black', 1, 1),
('Jumpin’ Jack Flash', 1, 1),
('Brown Sugar', 1, 1),
('Wild Horses', 1, 1),
('Hello',2, 2),
('Rolling in the Deep', 2, 2),
('Someone Like You', 2, 2),
('Easy On Me', 2, 2),
('So What', 3, 3),
('Freddie Freeloader', 3, 3),
('Blue in Green', 3, 3),
('All Blues', 3, 3),
('Milestones', 3, 3),
('Nardis', 3, 3),
('Lose Yourself', 4, 4),
('The Real Slim Shady', 4, 4),
('Without Me', 4, 4),
('Mockingbird', 4, 4),
('Stan', 4, 4),
('Symphonie Nr. 5', 5, 5),
('Für Elise', 5, 5),
('Mondscheinsonate', 5, 5),
('Ode an die Freude', 5, 5),
('Harder Better Faster Stronger', 6, 6),
('One More Time', 6, 6),
('Digital Love', 6, 6),
('Robot Rock', 6, 6),
('Get Lucky', 6, 6),
('Around the World', 6, 6),
('Technologic', 6, 6),
('No Woman No Cry', 7, 7),
('Three Little Birds', 7, 7),
('Redemption Song', 7, 7),
('Jamming', 7, 7),
('Could You Be Loved', 7, 7),
('Viva La Vida', 8, 2),
('Paradise', 8, 2),
('Fix You', 8, 2),
('The Scientist', 8, 2),
('Clocks', 8, 2),
('Yellow', 8, 2),
('Hymn for the Weekend', 8, 2),
('A Sky Full of Stars', 8, 2),
('Feeling Good', 9, 3),
('I Put a Spell on You', 9, 3),
('Don’t Let Me Be Misunderstood', 9, 3),
('Ain’t Got No, I Got Life', 9, 3),
('Numb', 10, 1),
('In the End', 10, 1),
('Breaking the Habit', 10, 1),
('One Step Closer', 10, 1),
('Crawling', 10, 1),
('Faint', 10, 1),
('Papercut', 10, 1),
('Somewhere I Belong', 10, 1)
*/


select * from genre;
select * from interpret;

select * from titel;

insert into veranstaltungsort values 
('Nuernberg'),
('Fuerth'),
('Elan-gen'),
('Dortmund'),
('Vegas'), 
('Nuernberg');

UPDATE veranstaltungsort SET ort_name='Erlangen' WHERE ort_name='Elan-gen';
UPDATE veranstaltungsort SET ort_name='Eryasdlfjlangen' WHERE v_id=3;
UPDATE veranstaltungsort SET ort_name='Erlangen' WHERE v_id=3;


select * from veranstaltungsort;

INSERT INTO in_ver (i_nr, v_nr, datum_von, datum_bis) VALUES
(1, 1, '2026-03-10', '2026-03-11'),
(1, 3, '2026-07-05', '2026-07-07'),
(1, 2, '2027-06-01', '2027-06-01'),
(2, 5, '2026-09-12', '2026-09-13'),
(2, 2, '2027-02-14', '2027-02-15'),
(3, 1, '2026-05-20', '2026-05-21'),
(3, 1, '2027-03-08', '2027-03-08'),
(3, 4, '2027-08-25', '2027-08-26'),
(4, 3, '2026-11-11', '2026-11-12'),
(4, 5, '2027-06-01', '2027-06-02'),
(4, 5, '2026-06-15', '2026-06-16'),
(4, 1, '2027-12-01', '2027-12-02'),
(5, 2, '2026-04-30', '2026-05-01'),
(5, 3, '2027-07-04', '2027-07-06'),
(5, 3, '2026-12-10', '2026-12-10'),
(6, 4, '2026-08-01', '2026-08-02'),
(6, 1, '2026-03-14', '2026-03-15'),
(6, 2, '2026-10-10', '2026-10-10'),
(6, 5, '2027-04-04', '2027-04-04'),
(7, 5, '2026-06-12', '2026-06-12'),
(7, 5, '2027-03-03', '2027-03-04'),
(8, 1, '2026-01-01', '2026-01-02'),
(8, 1, '2027-01-15', '2027-01-16'),
(8, 3, '2026-07-07', '2026-07-07'),
(8, 2, '2026-09-21', '2026-09-22'),
(8, 4, '2027-09-01', '2027-09-01'),
(9, 3, '2026-10-05', '2026-10-06'),
(9, 2, '2027-05-20', '2027-05-21'),
(9, 4, '2027-08-30', '2027-08-31'),
(9, 1, '2026-06-01', '2026-06-01'),
(9, 5, '2026-03-03', '2026-03-03'),
(10, 1, '2026-02-22', '2026-02-22'),
(10, 3, '2027-03-10', '2027-03-11'),
(10, 4, '2026-05-05', '2026-05-06'),
(10, 2, '2026-12-12', '2026-12-13'),
(10, 2, '2027-10-10', '2027-10-11'),
(3, 5, '2026-07-10', '2026-07-11'),
(4, 2, '2027-04-01', '2027-04-01'),
(6, 3, '2026-11-01', '2026-11-01'),
(1, 4, '2026-10-01', '2026-10-01'),
(2, 3, '2026-04-04', '2026-04-04'),
(5, 4, '2026-05-18', '2026-05-18'),
(7, 1, '2026-07-14', '2026-07-14'),
(8, 5, '2027-11-15', '2027-11-16'),
(3, 2, '2027-07-01', '2027-07-01'),
(6, 1, '2027-12-31', '2027-12-31'),
(9, 1, '2027-06-20', '2027-06-21'),
(10, 5, '2027-01-01', '2027-01-02'),
(4, 1, '2026-08-08', '2026-08-08'),
(2, 1, '2026-03-03', '2026-03-04'),
(1, 2, '2027-05-05', '2027-05-05');

select * from in_ver;