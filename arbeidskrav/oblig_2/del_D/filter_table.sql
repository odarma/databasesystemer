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
order by min(vekt) desc; -- sortere etter minstevekt for hver vektgruppe

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


-- oppgave 14


-- oppgave 15


-- oppgave 16


-- oppgave 17


-- oppgave 18


-- oppgave 19


-- oppgave 20