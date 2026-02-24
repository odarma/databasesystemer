USE blyant;

UPDATE pigment SET navn = 'oker' WHERE id = 2;

UPDATE vannloselighet SET navn = 'svært dårlig' WHERE id=1;
UPDATE vannloselighet SET navn = 'dårlig' WHERE id=2;
UPDATE vannloselighet SET navn = 'moderat' WHERE id=3;
UPDATE vannloselighet SET navn = 'god' WHERE id=4;
UPDATE vannloselighet SET navn = 'utmerket/svært god' WHERE id=5;

INSERT INTO bruksomraade (id,navn) VALUES (12, 'Skissering');

select type.navn from blyant inner join bruksomraade 
on blyant.bruksomraade_id = brukeromraade.id inner join type on blyant.type_id = type.id 
where brukeromraade = 'Skriving';

SELECT type.navn AS TypeNavn, bruksomraade.navn AS BruksomraadeNavn
FROM blyant
INNER JOIN type ON blyant.type_id = type.id
INNER JOIN blyant_bruksomraade ON blyant.id = blyant_bruksomraade.blyant_id
INNER JOIN bruksomraade ON blyant_bruksomraade.bruksomraade_id = bruksomraade.id
WHERE bruksomraade.navn = 'Skriving';