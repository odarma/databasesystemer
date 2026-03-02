/* Oppgave 1) Enkel JOIN:
Vis garnnavn, produsentnavn og pris.*/
select g.navn, p.navn, pris from garn g join produsent p on g.produsent_id = p.id;


/* Oppgave 2) Pris per 100 meter
Vis garnnavn, produsent og pris_per_100m, avrundet til 2 desimaler. Sorter billigst først.*/
select g.navn as 'garn', p.navn as 'produsent', round((pris/lopelengde)*100,2) as 'pris/100m' from garn g, produsent p where g.produsent_id = p.id;


/* Oppgave 3) Finn “premiumgarn”
Vis alle garn med pris over 80, sorter dyreste først.*/
select * from garn where pris>80 order by pris desc;


/* Oppgave 4) Normaliser navn i resultatet
Vis produsent i store bokstaver og garnnavn i små bokstaver.*/
select upper(p.navn) as 'produsent', lower(g.navn) as 'garn' from garn g, produsent p where g.produsent_id = p.id;


/* Oppgave 5) Antall og snittpris
Vis produsent, antall garn og snittpris (avrundet).*/
select p.navn as 'produsent', count(g.id) as 'antall garn', round(avg(pris),2) as 'snittpris' from garn g, produsent p where p.id=g.produsent_id group by p.navn;


/* Oppgave 6) Produsenter med minst 3 garn
Finn produsenter som har minst 15 garn i sortimentet.*/
select p.navn as 'produsent', count(g.id) as 'antall garn' from garn g, produsent p where p.id=g.produsent_id group by p.navn having count(g.id)>15;


/* Oppgave 7) Pris-spenn per produsent
For hver produsent: vis billigste, dyreste og prisforskjell (dyrest–billigst).*/
select p.navn as 'produsent', min(pris) as 'billigst', max(pris) as 'dyrest', max(pris) - min(pris) as 'prisforskjell' 
from garn g, produsent p where p.id=g.produsent_id group by p.navn;


/*Oppgave 8) Hva er vanligst?
Vis vekt (g) og hvor mange garn som finnes i hver vekt. Sorter mest vanlig først.*/
select vekt, count(id) as antall from garn group by vekt order by antall desc;


/* Oppgave 9) Snittpris for 50g over 70 kr
Finn produsenter der snittpris for garn med vekt = 50 er over 70.*/
select p.navn as 'produsent', avg(pris) as snittpris, vekt from garn g, produsent p where p.id=g.produsent_id and vekt=50 and snittpris>70;


/* Oppgave 10) “best value”-liste
Lag en topp 10-liste over garn som er minst 200 meter, og sorter etter lavest pris per 100m.*/

