CREATE SCHEMA if not exists `garn` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;

CREATE TABLE produsent (
	id INT NOT NULL,
	navn VARCHAR(20),
    PRIMARY KEY (id)
);

CREATE TABLE fiber (
	id INT AUTO_INCREMENT NOT NULL,
	type VARCHAR(10),
    PRIMARY KEY (id)
);

INSERT INTO fiber (type)
VALUES ('Alpakka');

CREATE TABLE garn (
	id INT AUTO_INCREMENT NOT NULL,
	produsent_id INT,
    navn VARCHAR(20),
    vekt INT,
    pinnestr DECIMAL(3,1),
    strikkefasthet INT,
    lopelengde INT,
    PRIMARY KEY (id),
    FOREIGN KEY (produsent_id) REFERENCES produsent (id)
);

CREATE TABLE garn_har_fiber (
	garn INT,
    fiber INT,
    prosent INT,
    PRIMARY KEY (garn, fiber),
    FOREIGN KEY (garn) REFERENCES garn (id),
    FOREIGN KEY (fiber) REFERENCES fiber (id)
);

CREATE TABLE farge (
	nummer INT,
    navn VARCHAR(15),
    PRIMARY KEY (nummer)
);

CREATE TABLE garn_har_farge (
	garn INT,
    farge INT,
    PRIMARY KEY (garn, farge),
    FOREIGN KEY (garn) REFERENCES garn (id),
    FOREIGN KEY (farge) REFERENCES farge (nummer)
);