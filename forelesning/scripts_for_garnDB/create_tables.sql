create table garn(
id int auto_increment not null,
produsent_id, int
navn varchar(20) not null,
vekt int not null,
pinnestr decimal(3,1) not null,
strikkefasthet int not null,
loepelengde in not null,
sammensetning,
farge
primary key (id)
foreign key (produsent_id) references produsent(id)
);

create table produsent(
id int not null
navn varchar(20) not null,
primary key (id) 
);

create table fiber(
id int not null
type varchar(10) not mull,
primary key (id)
);

create table farge(
navn,

);