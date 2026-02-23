-- select * from garn where lopelengde>200 order by lopelengde;
use garn;
-- oppgave 1
select garn.produsent_id,produsent.navn as produsent_navn,garn.navn as garn_navn, pris as orginal_pris, pris*1.1 as justert_pris 
from garn inner join produsent on garn.produsent_id = produsent.id;
select garn.produsent_id,produsent.navn as produsent_navn,garn.navn as garn_navn, pris as orginal_pris, pris*1.1 as justert_pris 
from garn,produsent where produsent_id = produsent.id;

-- oppgave 2
select navn, round(pris,-1) as avrundet_pris_tier from garn;

-- oppgave 3
select upper(produsent.navn) as produsent_navn,upper(garn.navn) as garn_navn from garn,produsent where produsent_id = produsent.id;

-- oppgave 4
select round(avg(pris),0) as snitt_pris from garn;

-- oppgave 5
select produsent_id, count(garn.navn) as antall_garn, round(avg(pris),0) as snitt_pris, min(pris) as minste_pris, max(pris) as høyeste_pris
from garn GROUP BY produsent_id;