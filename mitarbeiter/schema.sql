use mitarbeiter

DROP TABLE if exists mitarbeiter;
DROP TABLE if exists ma_skills;
DROP TABLE if exists skills;
DROP TABLE if exists abteilung;
DROP TABLE if exists arbeitszeitmodell;
DROP TABLE if exists familienstand;


CREATE TABLE arbeitszeitmodell (
modell_code CHAR(2) PRIMARY KEY,
az_bez VARCHAR(50)
);

CREATE TABLE familienstand (
f_id INT IDENTITY(1,1) PRIMARY KEY,
fam_bez VARCHAR(50)
);


CREATE TABLE abteilung (
abtnr INT IDENTITY(1,1) PRIMARY KEY,
abtbez VARCHAR(100)
);


CREATE TABLE mitarbeiter (
ma_id INT IDENTITY(1,1),
nname VARCHAR (100),
vname VARCHAR (100),
str_hsnr VARCHAR (100),
plz VARCHAR (5),
ort VARCHAR(50),
gebdatum DATE,
f_id INT,
abt_nr INT,
azm_id CHAR(2),
CONSTRAINT PK_mitarbeieter PRIMARY KEY (ma_id),
CONSTRAINT FK_ma_fam_f_id FOREIGN KEY (f_id) REFERENCES familienstand(f_id), 
CONSTRAINT FK_ma_azm_azm_id FOREIGN KEY (azm_id) REFERENCES arbeitszeitmodell(modell_code),
CONSTRAINT FK_ma_abt_abt_nr FOREIGN KEY (abt_nr) REFERENCES abteilung(abtnr)
);

--select ma.vname Vorname, ma.nname Nachname, abt.abtbez Abteilung, 
--azm.az_bez
--from mitarbeiter ma
--join abteilung abt on abt.abtnr = ma.abt_nr
--join arbeitszeitmodell azm on azm.modell_code = ma.azm_id
--where (abt.abtbez = 'Marketing' or abt.abtbez = 'IT')
--and azm.modell_code = 'vz'
--order by abt.abtbez DESC;



--Von jedem Mitarbeiter sollen seine Skills gespeichert werden. 
--Jeder Skill kann mehreren Mitarbeitern zugeordnet werden 
--und jeder Mitarbeiter kann mehrere Skills haben.
--Bitte erweitern Sie die Mitarbeiter Datenbank entsprechend.
--Folgende Skills sind im Unternehmen vorhanden:
--• Java-Programmierung
--• Netzwerk
--• Projektmanagement
--• Marketing
--• Englisch
--• Spanisch
--• Bildbearbeitung

create table skills (
s_id int identity(1,1) primary key,
s_bez varchar(100) not null
);

create table ma_skills (
ma_id int,
s_id int,
constraint pk_maskilss primary key (ma_id, s_id),
--primary key (ma_id, s_id),
foreign key (ma_id) references mitarbeiter (ma_id),
foreign key (s_id) references skills (s_id)
);

--select m.ma_id,nname,vname,str_hsnr,plz,ort,gebdatum,f.f_id,fam_bez,
--abtnr,abtbez,az_bez,s.s_id,s_bez
--from mitarbeiter m
--join familienstand f on m.f_id=f.f_id
--join abteilung a on a.abtnr=m.abt_nr
--join arbeitszeitmodell azm on azm.modell_code=m.azm_id
--join ma_skills ms on ms.ma_id=m.ma_id
--join skills s on s.s_id=ms.s_id
--order by ma_id
