use garn;

/*Oppgave 1 – Antall garn per produsent
Lag en spørring som viser:
	produsent
	hvor mange garn denne produsenten har
Sorter slik at produsenten med flest garn kommer først.*/



/*Oppgave 2 – Gjennomsnittspris per produsent
Lag en spørring som viser:
	produsent
	gjennomsnittspris på garn*/



/*Oppgave 3 – Garn dyrere enn gjennomsnittet
Finn garn som er dyrere enn gjennomsnittsprisen i databasen.*/



/*Oppgave 4 – Rangering av garn etter pris (vindusfunksjon)
Lag en liste over garnene med:
	navn
	produsent
	pris
rangering etter pris
Det dyreste garnet skal få rang 1.
Hvis to garn har samme pris skal neste tall hoppes over.*/
select g.navn, p.navn, pris, rank() over (order by pris desc) as pris_rekkefølge from garn g inner join produsent p on produsent_id = p.id;

/*Oppgave 5 – Rangering innen produsent (vindusfunksjon)
Finn de dyreste garnene per produsent.
Vis:
	produsent
	navn
	pris
	rangering innen produsenten*/
select p.navn,g.navn,pris,rank() over (partition by p.navn order by pris desc) as rekkefølge from garn g inner join produsent p on produsent_id=p.id;


/*Oppgave 6 – Glidende gjennomsnitt (5 rader)
Lag en spørring som viser:
	navn
	produsent
	pris
	gjennomsnittsprisen for de fem nærmeste garnene i prislisten

Vinduet skal bestå av:
	de to foregående radene
	den nåværende raden
	de to neste radene
Sorter etter pris.*/
select g.navn,p.navn,pris,round(avg(pris) over (order by pris rows between 2 preceding and 2 following),2) as 'glidende snitt' 
from garn g inner join produsent p on produsent_id=p.id;


/*Oppgave 7 – Hvor mye dyrere enn gjennomsnittet?
Lag en spørring som viser:
	navn
	pris
	gjennomsnittspris
	hvor mye dyrere eller billigere garnet er enn gjennomsnittet*/



/*Oppgave 8 – Topp 3 dyreste garn
Lag en spørring som viser de tre dyreste garnene ved hjelp av vindusfunksjoner.*/
select * from (select g.navn as garn,p.navn as produsent,pris,rank() over (order by pris desc) as rekkefølge 
from garn g inner join produsent p on produsent_id = p.id) t where rekkefølge <=3;