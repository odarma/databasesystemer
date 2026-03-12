use arbeidskrav;
-- oppgave 1
select day(innleggelsesdato) as dag_av_måned, count(*) as 'antall innleggelser'
from innleggelser group by dag_av_måned order by count(*) desc;

-- oppgave 2
Select *
FROM innleggelser
WHERE  pasienter_id = 442 
ORDER BY innleggelsesdato DESC LIMIT 1;

-- oppgave 3
select l.fornavn,l.etternavn,count(i.id) as 'antall innleggelser håndtert' from leger l 
inner join innleggelser i on leger_id=l.id 
group by l.id ; 

-- oppgave 4
select leger_id, concat(l.fornavn," ",l.etternavn), spesialitet, min(innleggelsesdato), max(utskrivningsdato)
from leger l inner join innleggelser i on leger_id = l.id group by leger_id;

-- oppgave 5
select pr.navn as provins,count(pa.id) as antall_pasienter  from provins pr 
inner join pasienter pa on pr.id = provins_id group by provins order by antall_pasienter desc;

-- oppgave 6
select concat(p.fornavn," ",p.etternavn) as 'pasient', diagnose, concat(l.fornavn," ",l.etternavn) as lege 
from innleggelser i inner join leger l on leger_id = l.id inner join pasienter p on pasienter_id=p.id;

-- oppgave 7
select p.id, fornavn, etternavn from pasienter p 
where p.id not in (select pasienter_id from innleggelser);

-- oppgave 8
select fornavn,etternavn,count(i.id) as antall_forekomster from pasienter p inner join innleggelser i on p.id=pasienter_id
group by fornavn,etternavn having antall_forekomster>1;

-- oppgave 9
select pasienter_id, leger_id, diagnose from innleggelser where (leger_id in (1,5,19) 
and mod(pasienter_id,2)>0) or (leger_id like "%2%" and pasienter_id like"___");

-- oppgave 10
select 
    case 
        when vekt < 150 then concat('vektgruppe ', floor(vekt / 10) * 10, '-', (floor(vekt / 10) * 10) + 9)
        else 'vektgruppe 150+'
    end as vektgruppe,
    count(id) as antall
from pasienter
group by vektgruppe
order by min(vekt) desc; -- sortere etter minstevekt fra hver vektgruppe

-- oppgave 11
select id, vekt, hoyde, 
case
	when vekt/power(hoyde/100,2) >= 30 then '1'
	else '0' 
end as erOvervektig 
from pasienter;

-- oppgave 12
select pasienter_id, l.fornavn as lege_fornavn, l.etternavn as lege_etternavn, spesialitet 
from innleggelser i inner join leger l on leger_id = l.id where l.fornavn like "Lisa" 
and diagnose like "Epilepsy";

-- oppgave 13
select id, concat(id,length(etternavn),year(fodseldag)) as 'midlertidig passord' from pasienter;

-- oppgave 14
select id, 
case 
	when mod(id,2)=0 then 'ja'
	else 'nei'
end as 'har forsikring', 
case 
	when mod(id,2)=0 then 100
	else 500
end as 'kostnad (kr)'
from pasienter;

-- oppgave 15
select pr.navn as provins from provins pr inner join pasienter pa on provins_id=pr.id 
group by provins having 
(select count(kjonn) from pasienter where kjonn='M')>(select count(kjonn) from pasienter where kjonn='F');

-- oppgave 16
select p.* from pasienter p 
where fornavn like "__r%" and kjonn="F" and month(fodseldag) in (2,5,12) and
vekt between 60 and 80 and mod(p.id,2)>0 and sted="Hamilton";

-- oppgave 17
select round(sum(case when kjonn = "M" then 1 else 0 end)*100 / count(*),0) as prosent from pasienter;

-- oppgave 18
select innleggelsesdato, count(*) as antall_innleggelser,  
count(*) - lag(count(*)) over(order by innleggelsesdato) as endring_fra_dagen_før
from innleggelser group by innleggelsesdato order by innleggelsesdato asc;
-- lag() henter verdien fra forrige rad, 
-- over(order by innleggelsesdato) ser på at forrige rad er dagen før istedenfor tilfeldig dato, før utregning

-- oppgave 19
select navn from provins order by 
case 
	when navn="Ontario" then 1
    else 2
end asc;
select year(innleggelsesdato) from innleggelser;
-- oppgave 20
select leger_id, concat(fornavn,' ',etternavn) as fullt_navn, spesialitet, year(innleggelsesdato) as år, 
count(i.id) as antall_innleggelser 
from innleggelser i inner join leger l on leger_id = l.id 
group by l.id, l.fornavn, l.etternavn, spesialitet,år 
order by fullt_navn, spesialitet,år asc;