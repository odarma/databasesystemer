/* Oppgave 1
Vis garn med tilhørende farge.*/
select garn.*,farge.navn as fargenavn from garn inner join garn_har_farge on garn.id=garn_har_farge.garn inner join farge on garn_har_farge.farge=farge.nummer;


/* Oppgave 2
Vis alle garn over 60 kr i fargen hvit.*/
select garn.*,farge.navn as 'fargenavn' from garn inner join garn_har_farge on garn.id=garn_har_farge.garn inner join farge on garn_har_farge.farge=farge.nummer
where pris>60;


/* Oppgave 3
Antall garn per produsent.*/
select count(garn.id) as 'antall garn', produsent.navn as produsent from garn inner join produsent on garn.produsent_id=produsent.id group by produsent;


/* Oppgave 4
Snittpris per produsent.*/
select round(avg(pris),2) as snittpris, produsent.navn as produsent from garn inner join produsent on garn.produsent_id=produsent.id group by produsent;


/* Oppgave 5
Finn garn med samme pris.*/
select distinct g1.*,g2.* from garn g1 inner join garn g2 on g1.pris = g2.pris where not g1.id=g2.id;

/*Oppgave 6
Vis garnene med tilhørende prisklasse.
Under 75 kr er det Billig, Til og med 100 kr er middels, ellers er det dyrt*/
select *, 
case 
when pris<75 then 'billig'
when pris>=75 and pris<=100 then 'middels'
else 'dyrt'
end as prisklasse
from garn;


/* Oppgave 7
Vis alle garn og farge (også de uten registrert farge).*/
select garn.*, ifnull(farge.navn,1) as farge
from garn inner join garn_har_farge on garn.id=garn_har_farge.garn
inner join farge on garn_har_farge.farge=farge.nummer
;


/* Oppgave 8
Totalt antall farger per garn.*/

