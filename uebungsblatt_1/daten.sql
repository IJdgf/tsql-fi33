INSERT INTO abteilung VALUES
('Personal'),
('Vertrieb'),
('Marketing'),
('Buchhaltung'),
('IT'),
('Entwicklung'),
('Produktion'),
('Einkauf'),
('Logistik'),
('Verwaltung');


INSERT INTO arbeitszeitmodell VALUES
('ho', 'HomeOffice'),
('tz', 'Teilzeit'),
('vz', 'Vollzeit'),
('mm', 'Minijob');

select * from arbeitszeitmodell
select * from arbeitszeitmodell where modell_code = 'vz'
select * from arbeitszeitmodell where modell_code = 'VZ'



INSERT INTO familienstand VALUES
('ledig'),
('verheiratet'),
('geschieden'),
('verwitwet'),
('eingetr. Lebensgemeinschaft');


INSERT INTO mitarbeiter  VALUES 
('Fahrer', 'Bob', 'Mozartstr. 7', '90768', 'Fuerth', '1972-11-02', 5, 7, 'vz'),
('Platz', 'Alexander', 'Lessingstr. 72', '91054', 'Erlangen', '1955-08-01', 2, 7, 'vz'),  
('Kreuz', 'Andreas', 'Ringstr. 40', '90765', 'Fuerth', '1974-04-26', 3, 2, 'ho'),
('Geber', 'Ann', 'Schillerstr. 25', '90762', 'Fuerth', '1987-03-17', 3, 10, 'vz'),
('Zug', 'Ann', 'Lindenweg 12', '90411', 'Nuernberg', '1996-03-20', 5, 2, 'mm '),
('Bolika', 'Anna', 'Bahnhofstr. 142', '90425', 'Nuernberg', '1981-04-20', 5, 6,	'vz '),
('Nass', 'Anna', 'Dorfstr. 18', '90409', 'Nuernberg', '1959-02-10', 2, 5, 'ho'),
('Theke', 'Anna', 'Kirchplatz 60', '91052', 'Erlangen', '1964-01-23', 4, 5,	'tz '),
('Höhle', 'Axel', 'Mühlgasse 94', '90766', 'Fuerth', '1969-08-04', 3, 6, 'vz'),
('Diener', 'Bernhard', 'Mühlgasse 69', '90763', 'Fuerth', '1961-05-28', 5, 3, 'vz');

select * from mitarbeiter;
--ma_id INT IDENTITY(1,1),
--nname VARCHAR (100),
--vname VARCHAR (100),
--str_hsnr VARCHAR (100),
--plz VARCHAR (5),
--ort VARCHAR(50),
--gebdatum DATE,
--f_id INT,
--abt_nr INT,
--azm_id CHAR(2),

INSERT INTO Mitarbeiter (nname, vname, str_hsnr, plz, ort, gebdatum, f_id, abt_nr, azm_id) VALUES 
('Yard', 'Bill', 'Ringstr. 117', '90427', 'Nuernberg', '1966-10-13', 1, 9, 'vz'), 
('Essel', 'Bren', 'Bahnhofstr. 50', '90403', 'Nuernberg', '1980-02-07', 1, 3, 'vz'), 
('Grube', 'Claire', 'Hauptstr. 34', '90408', 'Nuernberg', '1962-01-14', 5, 9, 'vz'), 
('Erchen', 'Dick', 'Beethovenstr. 98', '90402', 'Nuernberg', '1983-05-19', 1, 3, 'ho'), 
('Tator', 'Dick', 'Wiesenweg 147', '90419', 'Nuernberg', '1960-12-09', 5, 9, 'vz'), 
('Reich', 'Frank', 'Mozartstr. 121', '91058', 'Erlangen', '1977-03-04', 2, 4, 'tz'), 
('Brandwein', 'Franz', 'Lindenweg 33', '90765', 'Fuerth', '1988-07-20', 1, 8, 'vz'), 
('Steiner', 'Gerold', 'Schillerstr. 3', '91056', 'Erlangen', '1957-07-01', 4, 7, 'vz'), 
('Wurst', 'Gutfried', 'Schulstr. 99', '90768', 'Fuerth', '1968-01-05', 1, 7, 'mm'), 
('Maul', 'Hans', 'Marktplatz 55', '90425', 'Nuernberg', '1975-09-27', 3, 1, 'vz'), 
('Bo', 'Harry', 'Goethestr. 85', '90409', 'Nuernberg', '1990-02-08', 3, 9, 'vz'), 
('Witzka', 'Heide', 'Gartenstr. 14', '90762', 'Fuerth', '1971-11-10', 5, 1, 'ho'), 
('Ser', 'Kai', 'Ringstr. 129', '90763', 'Fuerth', '1985-08-12', 2, 4, 'vz'), 
('Kästchen', 'Karo', 'Hauptstr. 81', '90419', 'Nuernberg', '1963-04-25', 5, 3, 'vz'), 
('Milch', 'Marga', 'Dorfstr. 104', '90408', 'Nuernberg', '1958-09-30', 4, 2, 'vz'), 
('Hari', 'Martha', 'Lessingstr. 5', '90766', 'Fuerth', '1982-06-03', 3, 10, 'vz'), 
('Bellenbaum', 'Mira', 'Schulstr. 59', '90403', 'Nuernberg', '1965-08-16', 2, 4, 'tz'), 
('Päde', 'Otto', 'Beethovenstr. 45', '90768', 'Fuerth', '1986-04-22', 5, 8, 'vz'), 
('Lahner', 'Paul', 'Marktplatz 7', '90411', 'Nuernberg', '1979-09-08', 4, 2, 'vz'), 
('Silie', 'Peter', 'Gartenstr. 49', '90427', 'Nuernberg', '1998-02-18', 1, 9, 'vz'), 
('Morris', 'Philip', 'Hauptstr. 19', '90402', 'Nuernberg', '1956-07-11', 1, 8, 'ho'), 
('Verlust', 'Rainer', 'Mozartstr. 131', '90425', 'Nuernberg', '1967-06-09', 2, 6, 'vz'), 
('Schreiber', 'Roman', 'Kirchplatz 88', '90765', 'Fuerth', '1970-05-21', 4, 3, 'vz'), 
('Wolke', 'Rosa', 'Lessingstr. 60', '90409', 'Nuernberg', '1993-04-17', 1, 7, 'mm'), 
('Paine', 'Sham', 'Schillerstr. 47', '90411', 'Nuernberg', '1992-07-02', 3, 6, 'tz'), 
('Buktu', 'Tim', 'Ringstr. 6', '90763', 'Fuerth', '1984-08-13', 5, 1, 'vz'), 
('Streit', 'Wilma', 'Bahnhofstr. 121', '90403', 'Nuernberg', '1995-10-24', 3, 10, 'vz'), 
('See', 'Wolfgang', 'Hauptstr. 22', '90419', 'Nuernberg', '1976-12-15', 2, 1, 'vz');





