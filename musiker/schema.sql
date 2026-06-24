CREATE TABLE genre (
g_id INT IDENTITY(1,1) PRIMARY KEY,
genre VARCHAR(30)
);

CREATE TABLE interpret (
i_id INT IDENTITY(1,1) PRIMARY KEY,
name VARCHAR(200)
);

CREATE TABLE titel (
t_id INT IDENTITY(1,1) PRIMARY KEY,
titel VARCHAR (200), 
interpret_id INT,
genre_id INT,
FOREIGN KEY (interpret_id) REFERENCES interpret(i_id),
FOREIGN KEY (genre_id) REFERENCES genre(g_id)
);

CREATE TABLE  veranstaltungsort (
v_id INT IDENTITY(1,1) PRIMARY KEY,
ort_name VARCHAR(50) NOT NULL
);

CREATE TABLE in_ver (
i_nr INT,
v_nr INT NOT NULL,
datum_von DATE,
datum_bis DATE,
CONSTRAINT PK_in_ver PRIMARY KEY(i_nr, datum_von, datum_bis),
FOREIGN KEY (v_nr) REFERENCES veranstaltungsort (v_id)
); 