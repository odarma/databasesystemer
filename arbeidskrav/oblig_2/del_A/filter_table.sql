select fornavn, etternavn from pasient where allergier="null";
select fornavn, etternavn,kjoenn from pasient where kjoenn="M";
select fornavn from pasient where fornavn like 'C%';
select fornavn, etternavn from pasient where vekt between 100 and 120;
update pasient set allergier='NKA' where allergier='null';
select * from pasient where allergier='NKA';
select concat(fornavn,' ', etternavn) as fullt_navn from pasient;