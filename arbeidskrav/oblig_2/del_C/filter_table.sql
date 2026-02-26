select fornavn, etternavn, provins_id, provins.navn from pasienter inner join provins 
on provins_id = provins.id;

select innleggelser.id as innleggelse_id, pasienter.id as pasient_id, fornavn, etternavn, diagnose
from innleggelser inner join pasienter on innleggelser.pasienter_id = pasienter.id where diagnose 
like "%ementia";

