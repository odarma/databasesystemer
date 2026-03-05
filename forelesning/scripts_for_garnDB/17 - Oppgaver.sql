/*Oppgave 1
Finn garn som koster mer enn gjennomsnittsprisen.*/
select * from garn where pris>(select avg(pris) from garn);


/*Oppgave 2
Finn produsenter som har garn dyrere enn 80 kr.*/
select navn from produsent where id in (select produsent_id from garn where pris>80);


/*Oppgave 3
Finn garn som har samme pris som minst ett annet garn.*/
select g1.* from garn g1 where g1.pris = some (select g2.pris from garn g2 where not g1.id = g2.id);


/*Oppgave 4
Finn garn som har høyere pris enn alle garn fra produsent X.*/
select * from garn where pris > all (select pris from garn where produsent_id = 2);


/*Oppgave 5
Finn produsenter som har minst ett garn.*/
select * from produsent p where exists (select * from garn where produsent_id = p.id);


/*Oppgave 6
Vis garn og antall garn fra samme produsent.*/
select g1.navn, (select count(*) from garn g2 where g1.produsent_id = g2.produsent_id) as 'antall garn' from garn g1;


/*Oppgave 7
Finn produsenten med dyrest garn.*/
select * from produsent where id = (select produsent_id from garn order by pris desc limit 1);


/*Oppgave 8
Finn garn som er dyrere enn snittet for sin produsent.*/
select g1.* from garn g1 where g1.pris > (select avg(g2.pris) from garn g2 where g1.produsent_id=g2.produsent_id);
