CREATE TABLE Kunde (
    KNr INT,
    Fornavn VARCHAR(20),
    Etternavn VARCHAR(30),
    Telefon VARCHAR(16),
    -- Primærindeks (Gjør KNr unik og lager en "Clustered Index")
    PRIMARY KEY (KNr),
    -- Sekundærindeks (Gjør søk på Etternavn mye raskere)
    INDEX idx_etternavn (Etternavn)
    );

ALTER TABLE Kunde ADD PRIMARY KEY (KNr);

-- Alternativ 1: Ved å bruke CREATE INDEX (veldig vanlig)
CREATE INDEX idx_etternavn ON Kunde(Etternavn);

-- Alternativ 2: Ved å bruke ALTER TABLE
ALTER TABLE Kunde ADD INDEX idx_telefon (Telefon);

start transaction;
insert into provins (id,navn) values ('NK','Ne Ko');
update provins set navn = 'New Knot' where id = 'NK';
rollback;
delete from provins where id = 'NK';