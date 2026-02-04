create schema plante default char set utf8;

create table farge(
id int not null,
navn varchar(45),
primary key (id)
);

create table kategori(
id int not null,
navn varchar(5),
primary key (id)
);

create table vanningsbehov(
id int not null,
navn varchar(5),
primary key (id)
);

create table dyr(
id int not null,
latinsk_navn varchar(45),
navn varchar(45),
primary key (id)
);

