USE blyant; -- velge rikitg database 

ALTER TABLE blyant DROP FOREIGN KEY blyant_ibfk_1;  
-- fjerne farge_id sin status som fremmednøkkel for å unngå feilkode 1452, 
-- som gis ved insert eller update av rader i barnetabellen med fremmednøkkel som refererer til ikke-eksisterende verdier i foreldertabellen  
-- blyant_ibfk_1 er autogenerert "navn" for farge_id som fremmednøkkel. tallet øker for hver fremmednøkkel etter.  
-- blyant_ibfk_2 blir bruksomraade_id sin "navn", osv.  

-- kode under sikrer at id-enes tall minker og fortsatt refererer til riktig verdi. Dette sikrer dataintegritet.  
UPDATE blyant SET farge_id = 18 WHERE farge_id = 19; 
DELETE FROM farge WHERE id = 19; 
UPDATE blyant SET farge_id = farge_id - 1 WHERE farge_id > 19; 
UPDATE farge SET id = id - 1 WHERE id > 19; 

-- koden under sikrer at farge_id blir en fremmednøkkel igjen og får sine begrensninger tilbake for å aktivere feilkode 1452 igjen.  
ALTER TABLE blyant  
ADD CONSTRAINT blyant_ibfk_1  
FOREIGN KEY (farge_id) REFERENCES farge(id)  
ON UPDATE CASCADE  
ON DELETE SET NULL; 
-- ON UPDATE CASCADE for å håndtere endring av tallene (slik at 20 blir 19, osv.). 
-- ON DELETE SET NULL hvis man vil beholde blyantene selv om en farge forsvinner. 