use plante;
/* 1. Vis planter med kategori og hardhet
Oppgave: Vis plantens norske navn, botaniske navn, kategori og hardhet.*/
select p.navn, p.botanisk_navn, k.navn as kategori, h.navn as hardhet from plante p inner join kategori k on p.kategori_id=k.id inner join hardhet h on p.hardhet_id=h.id;


/*2. Hvor mange planter finnes i hver kategori?
Oppgave: Lag en oversikt over antall planter per kategori.
Oversikten skal sorteres etter antall planter, med flest øverst, så alfabetisk etter kategori*/
select k.navn as kategori, count(*) as antall_planter from plante p 
inner join kategori k on p.kategori_id=k.id group by k.navn order by antall_planter desc, kategori;


/*3. Kategorier med minst 5 planter
Oppgave: Vis kategorier som har minst 10 planter registrert.*/
select k.navn as kategori, count(*) as antall_planter from plante p 
inner join kategori k on p.kategori_id=k.id group by k.navn order by antall_planter >=10 desc, kategori;

/*4. Hvilke planter har hvilke farger?
Oppgave: Vis plantens navn og tilhørende farge.
Sorter etter plante pg farge*/
select p.navn as plante, f.navn as farge from plante p, farge f, plante_farge pf where p.botanisk_navn = pf.plante_botanisk_navn
and pf.farge_id = f.id order by plante, farge;

/*5. Hvor mange planter finnes i hver farge?
Oppgave: Lag en oversikt over hvor mange planter som er registrert med hver farge.
Sorter etter antall planter, så farge*/
select f.navn as farge, count(*) as antall_planter from plante p 
inner join plante_farge pf on p.botanisk_navn = pf.plante_botanisk_navn
inner join farge f on pf.farge_id = f.id group by farge order by antall_planter,farge;

/* 6. Planter med mer enn én farge
Oppgave: Finn planter som er registrert med mer enn én farge.*/
select p.navn as plante, count(*) as antall_farger from plante p 
inner join plante_farge pf on p.botanisk_navn = pf.plante_botanisk_navn
inner join farge f on pf.farge_id=f.id group by plante having antall_farger>1 
order by antall_farger,plante;


/* 7. Planter som tiltrekker nyttedyr
Oppgave: Vis plantens navn og navn på dyret for alle relasjoner der planten er koblet til et nyttedyr.
Sorter på plantenavn og dyrenavn*/
select p.navn as plante, d.navn as dyr, pd.`skadedyr/nyttedyr` as relasjon
from plante p inner join plante_dyr pd 
on p.botanisk_navn=pd.plante_botanisk_navn
inner join dyr d on d.id = pd.dyr_id where pd.`skadedyr/nyttedyr`='Nyttedyr' order by plante,dyr;

/*8. Planter som har både skadedyr og nyttedyr
Oppgave: Finn planter som er koblet til minst ett skadedyr og minst ett nyttedyr.*/
select p.navn as plante from plante p 
where p.botanisk_navn in 
	(select pd.plante_botanisk_navn from plante_dyr pd
	where pd.`skadedyr/nyttedyr`='Skadedyr') 
and p.botanisk_navn in 
	(select pd.plante_botanisk_navn from plante_dyr pd
	where pd.`skadedyr/nyttedyr`='Nyttedyr');


/* 9. Høyeste plante per lokasjon
Oppgave: Finn den høyeste planten på hver lokasjon.*/



/* 10. Rangér planter etter høyde innen hver lokasjon
Oppgave: Ranger plantene etter høyde innen hver lokasjon.*/



/*11. Glidende gjennomsnitt av høyde
Oppgave: Vis et glidende gjennomsnitt av hoyde_cm over 5 rader, sortert etter høyde.*/

