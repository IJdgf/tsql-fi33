--use musiker_db;
use mitarbeiter_ub1;

--6. Lassen Sie den Nachnamen, den Vornamen und das Arbeitszeitmodell jedes 
--Mitarbeiters ausgeben. Sortiert nach Arbeitszeitmodell
select * from mitarbeiter

select ma.vname, ma.nname, azm.az_bez
from mitarbeiter ma
join arbeitszeitmodell azm on azm.modell_code = ma.azm_id
order by azm.az_bez, ma.nname, ma.vname;

--7. Nun bitte Nachname, Vorname und Geburtsdatum 
--aller ledigen Mitarbeiter im 'HomeOffice'


select ma.nname, ma.vname, ma.gebdatum
from mitarbeiter ma
join familienstand fs on fs.f_id = ma.f_id
join arbeitszeitmodell azm on azm.modell_code = ma.azm_id
where fs.fam_bez = 'ledig' 
and 
azm.az_bez like 'Home%';
--azm.az_bez = 'HomeOffice'
--azm.modell_code = 'ho';

--8. Bitte lassen Sie alle Nachnamen und Vornamen der Mitarbeiter ausgeben, 
--samt der Abteilung in welcher Sie arbeiten. 
--Sortiert nach abtbez, nname und vname. Gerne mit hübschen Überschriften.

select ma.vname Vorname, ma.nname Nachname, abt.abtbez Abteilung
from mitarbeiter ma
join abteilung abt on ma.abt_nr = abt.abtnr
order by abt.abtbez, ma.nname, ma.vname;

--9. Wie oben, aber nur von den Mitarbeitern 
--die in Teilzeit arbeiten. 
select ma.vname Vorname, ma.nname Nachname, abt.abtbez Abteilung
from mitarbeiter ma
join abteilung abt on ma.abt_nr = abt.abtnr
join arbeitszeitmodell azm on azm.modell_code = ma.azm_id
where azm.az_bez = 'Teilzeit'
order by abt.abtbez, ma.nname, ma.vname;

--10. Als letztes nun bitte eine Auflistung der 
--ledigen Mitarbeiter (Vorname, Nachname) aus Nürnberg

select ma.vname, ma.nname
from mitarbeiter ma
join familienstand fs on fs.f_id = ma.f_id
where fs.fam_bez = 'Ledig' 
and 
ma.ort like 'N%rnberg';
--ma.ort = 'Nuernberg';
