drop database arbeidskrav;
create schema if not exists `arbeidskrav` default character set utf8 collate utf8_bin;
use arbeidskrav;

create table if not exists leger(
id int not null,
fornavn varchar(45),
etternavn varchar(45),
spesialitet varchar(45),
primary key (id)
);

create table if not exists provins(
id varchar(2),
navn varchar(45),
primary key (id)
);

create table if not exists pasienter(
id int not null,
fornavn varchar(45),
etternavn varchar(45),
kjonn varchar(1),
fodseldag date,
sted varchar(45),
provins_id varchar(2),
allergier varchar(45),
hoyde int, 
vekt int,
primary key (id),
foreign key (provins_id) references provins(id)
);

CREATE TABLE IF NOT EXISTS innleggelser (
    id INT NOT NULL AUTO_INCREMENT, 
    pasienter_id INT NOT NULL,
    innleggelsesdato DATE,
    utskrivningsdato DATE,
    diagnose VARCHAR(100),
    leger_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (leger_id) REFERENCES leger(id), 
    foreign key (pasienter_id) references pasienter(id)
);