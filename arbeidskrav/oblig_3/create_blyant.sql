CREATE SCHEMA IF NOT EXISTS blyant CHARSET utf8;
USE blyant;

CREATE TABLE pigment (
	id INT NOT NULL,
    navn VARCHAR(45),
    PRIMARY KEY (id)
);

CREATE TABLE dekkevne (
	id INT NOT NULL,
    navn VARCHAR(45),
    PRIMARY KEY (id)
);

CREATE TABLE vannloselighet (
	id INT NOT NULL,
    navn VARCHAR(45),
    PRIMARY KEY (id)
);

CREATE TABLE egenskap (
	id INT NOT NULL,
    dekkevne_id INT,
    vannloselighet_id INT,
    pigment_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (dekkevne_id) REFERENCES dekkevne (id),
    FOREIGN KEY (vannloselighet_id) REFERENCES vannloselighet (id),
    FOREIGN KEY (pigment_id) REFERENCES pigment (id)
);

CREATE TABLE type ( 
	id INT NOT NULL,
    navn VARCHAR(45),
    egenskap_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (egenskap_id) REFERENCES egenskap (id)
);

CREATE TABLE bruksomraade (
	id INT NOT NULL,
    navn VARCHAR(45),
    PRIMARY KEY (id)
); 

CREATE TABLE farge (
	id INT NOT NULL,
    navn VARCHAR(45),
    PRIMARY KEY (id)
);

CREATE TABLE blyant (
	id INT NOT NULL,
    brukernivaa VARCHAR(45),
    hardhet VARCHAR(45),
    farge_id INT,
    bruksomraade_id INT,
    type_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (farge_id) REFERENCES farge (id),
    FOREIGN KEY (bruksomraade_id) REFERENCES bruksomraade (id),
    FOREIGN KEY (type_id) REFERENCES type (id)
);