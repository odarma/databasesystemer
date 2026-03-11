use garn;
/* Oppgave 1 – Lag et enkelt view
Lag et view som viser alle garn som koster mer enn 80 kroner.*/
create view dyre_garn as select * from garn where pris>80;


/* Oppgave 2 – Spørring mot view
Bruk viewet dyre_garn til å finne:
	produsent
	navn
	pris
Sorter etter pris fra høyest til lavest.*/
select produsent_id, navn,pris from dyre_garn order by pris desc;


/* Oppgave 3 – View med beregning
Lag et view som viser:
	produsent
	navn
	pris
	pris per 100 meter*/
create view garn_pris_per_100m as select p.navn as produsent,g.navn as garn, pris, 
round((pris/lopelengde)*100,2) as pris_per_100m
from garn g, produsent p where produsent_id=p.id;


/* Oppgave 4 – Analyse mot view
Bruk viewet fra oppgave 3 og finn:
de 5 garnene med lavest pris per 100 meter.*/
select * from garn_pris_per_100m order by pris_per_100m asc limit 5;
select *, rank() over (order by pris_per_100m) as rekkefølge from garn_pris_per_100m limit 5;

/* Ny oppgave 5 – View som kobler flere tabeller
Lag et view som viser:
	garnprodusent
	garnnavn
	fibernavn
    fiberprosent
Viewet skal koble sammen tabellene:
	garn
	garn_har_fiber
	fiber*/
create view garn_produsent_fiber as
select g.navn as garn,p.navn as produsent,f.type as fiber, ghf.prosent
from garn g,produsent p,fiber f, garn_har_fiber ghf 
where p.id = g.produsent_id and g.id=ghf.garn and f.id=ghf.fiber;


/*Oppgave 6 – Spørring mot view
Bruk viewet garn_fiber til å finne:
alle garn som inneholder minst 10% ull.*/
select * from garn_produsent_fiber gpf where fiber='Ull' and prosent >=10;


/*Oppgave 7 – Analyse mot view
Bruk viewet garn_fiber til å finne:
hvor mange garn som finnes per fiber.*/

