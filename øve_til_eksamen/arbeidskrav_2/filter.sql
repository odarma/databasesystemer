use øve_til_eksamen;
select fornavn, etternavn from pasienter where upper(allergier='nka');
select fornavn from pasienter where fornavn like 'C%';
select fornavn, etternavn from pasienter where vekt>=100 and vekt <=120;
update pasienter set allergier='NKA' where allergier='null';
select concat(fornavn,' ', etternavn) as full_navn from pasienter;
select * from pasienter where id in (1,45,234,379,500);
select distinct sted, provins.id, navn from pasienter join provins on provins_id = provins.id where provins.id='NS';
select distinct year(fodseldag) as unike_fødselsdag from pasienter order by unike_fødselsdag asc;
select fornavn from pasienter group by fornavn having count(fornavn)=1; -- for nøyaktighet
select distinct fornavn from pasienter; -- for oversikt 
select fornavn from pasienter order by length(fornavn) asc, fornavn asc;
select fornavn, etternavn, navn as 'provins' from pasienter join provins on provins_id = provins.id;
select innleggelser.id as innleggelse_id, pasienter.id as pasient_id, fornavn, etternavn, diagnose
from innleggelser inner join pasienter on innleggelser.pasienter_id = pasienter.id where diagnose like "%ementia";
