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


-- oppgave 9


-- oppgave 10


-- oppgave 11


-- oppgave 12


-- oppgave 13


-- oppgave 14


-- oppgave 15


-- oppgave 16


-- oppgave 17


-- oppgave 18


-- oppgave 19


-- oppgave 20