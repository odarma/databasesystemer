-- oppgave 3
select fornavn, etternavn, provins_id, provins.navn from pasienter inner join provins 
on provins_id = provins.id; 

-- oppgave 4
select innleggelser.id as innleggelse_id, pasienter.id as pasient_id, fornavn, etternavn, diagnose
from innleggelser inner join pasienter on innleggelser.pasienter_id = pasienter.id where diagnose 
like "%ementia";

-- oppgave 5
select fornavn, etternavn, allergier, sted from pasienter where not allergier = 'NULL' and sted = 'Hamilton';

-- oppgave 6
select count(id) as antall_innleggelser from innleggelser;

-- oppgave 7
select pasienter_id, innleggelsesdato, utskrivningsdato from innleggelser 
where innleggelsesdato = utskrivningsdato;

-- oppgave 8
select count(id) as antall_innleggelser, pasienter_id from innleggelser group by pasienter_id
having pasienter_id = 179;

-- oppgave 9
select count(id) as antall_innleggelser, diagnose from innleggelser group by diagnose 
order by antall_innleggelser desc;

-- oppgave 10
select pasienter_id, count(id) as  antall_innleggelser, diagnose from innleggelser group by diagnose, pasienter_id
having antall_innleggelser>1;

-- oppgave 11
select count(id) as antall_pasienter, sted from pasienter GROUP BY sted order by antall_pasienter desc, sted asc;

-- oppgave 12
select sum(hoyde) as total_hoyde, provins_id from pasienter GROUP BY provins_id having total_hoyde>=7000;

-- oppgave 13
select concat(fornavn," ", etternavn) as fullt_navn, round(hoyde*30.48,1) as "høyde|fot", 
round(vekt*2.205,0) as "vekt|pund", fodseldag as "fødselsdato",
case
	when kjonn = "M" then "Mann"
    else "Kvinne"
end as "kjønn"
from pasienter;