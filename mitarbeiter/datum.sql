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


