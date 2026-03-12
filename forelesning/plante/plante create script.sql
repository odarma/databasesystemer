CREATE SCHEMA IF NOT EXISTS plante DEFAULT CHARACTER SET utf8 ;
USE plante;

CREATE TABLE farge (
  id INT NOT NULL,
  navn VARCHAR(45),
  PRIMARY KEY (id)
);

CREATE TABLE dyr (
  id INT NOT NULL,
  latinsk_navn VARCHAR(45),
  navn VARCHAR(45),
  PRIMARY KEY (id)
);

CREATE TABLE kategori (
  id INT NOT NULL,
  navn VARCHAR(45),
  PRIMARY KEY (id)
);

CREATE TABLE hardhet (
  id INT NOT NULL,
  navn VARCHAR(5),
  PRIMARY KEY (id)
);

CREATE TABLE plante (
  botanisk_navn VARCHAR(45) NOT NULL,
  navn VARCHAR(45),
  jordforhold VARCHAR(45),
  allergivennlig TINYINT,
  kategori_id INT NOT NULL,
  hardhet_id INT NOT NULL,
  PRIMARY KEY (botanisk_navn),
  FOREIGN KEY (kategori_id) REFERENCES kategori (id),
  FOREIGN KEY (hardhet_id) REFERENCES hardhet (id)
);

CREATE TABLE plante_farge (
  farge_id INT NOT NULL,
  plante_botanisk_navn VARCHAR(45) NOT NULL,
  PRIMARY KEY (farge_id, plante_botanisk_navn),
    FOREIGN KEY (farge_id) REFERENCES farge (id),
    FOREIGN KEY (plante_botanisk_navn) REFERENCES plante (botanisk_navn)
);

CREATE TABLE vanningsbehov (
  id INT NOT NULL,
  navn VARCHAR(45),
  PRIMARY KEY (id)
);

CREATE TABLE stell (
  lokasjon VARCHAR(45) NOT NULL,
  grotid_uke INT,
  naering VARCHAR(45),
  lysforhold VARCHAR(45),
  hoyde_cm INT,
  kvm INT,
  plante_botanisk_navn VARCHAR(45) NOT NULL,
  vanningsbehov_id INT NOT NULL,
  blomstringstid VARCHAR(45) NULL,
  PRIMARY KEY (lokasjon, plante_botanisk_navn),
  FOREIGN KEY (plante_botanisk_navn) REFERENCES plante (botanisk_navn),
  FOREIGN KEY (vanningsbehov_id) REFERENCES vanningsbehov (id)
);

CREATE TABLE plante_dyr (
  plante_botanisk_navn VARCHAR(45) NOT NULL,
  dyr_id INT NOT NULL,
  `skadedyr/nyttedyr` VARCHAR(45),
  PRIMARY KEY (plante_botanisk_navn, dyr_id),
  FOREIGN KEY (plante_botanisk_navn) REFERENCES plante (botanisk_navn),
  FOREIGN KEY (dyr_id) REFERENCES dyr (id)
);
