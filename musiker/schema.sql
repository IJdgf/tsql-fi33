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