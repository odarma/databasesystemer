/* Oppgave 1: Beregnet kolonne + alias
Vis produsent id, navn, pris og en beregnet pris med 12% påslag. Gi kolonnen et passende alias.*/
use garn;
select produsent_id, navn, pris, pris*1.12 as 'pris med påslag' from garn;


/* Oppgave 2: Tekstfunksjon + sortering
Vis navn i store bokstaver og sorter alfabetisk på originalt navn.*/
select upper(navn) as navn from garn order by navn asc;


/* Oppgave 3: “Verdi for pengene” 
Lag en kolonne pris_per_100m (pris per 100 meter) og sorter så billigst først.*/
select (pris/lopelengde)*100 as pris_per_100m from garn order by pris_per_100m asc;


/*Oppgave 4: Enkelt aggregat
Finn antall garn og gjennomsnittspris (avrundet til nærmeste heltall). */
select count(navn) as antall_garn, round(avg(pris)) as snitt_pris from garn group by snitt_pris;


/* Oppgave 5: oversikt per produsent
For hver produsent, vis antall garn og snittpris (avrundet). Sorter produsentnavn A–Å.*/



/*Oppgave 6: gruppering og flere aggregater
For hver pinnestørrelse, vis billigste, dyreste og snittpris. Sorter etter høyest snittpris først.*/



/* Oppgave 7: filtrer grupper
Finn pinnestørrelser som har minst 3 garn i databasen.*/



/* Oppgave 8: WHERE vs HAVING
Finn pinnestørrelser der snittprisen på garn med vekt = 50 er over 70.*/

