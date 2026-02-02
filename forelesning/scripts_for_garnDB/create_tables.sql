create table garn(
id int auto_increment not null,
produsent_id int,
navn varchar(20) not null,
vekt int not null,
pinnestr decimal(3,1) not null,
strikkefasthet int not null,
loepelengde int not null,
primary key (id),
foreign key (produsent_id) references produsent(id)
);

create table produsent(
id int not null,
navn varchar(20) not null,
primary key (id) 
);

create table fiber(
id int auto_increment not null,
type varchar(10) not null,
primary key (id)
);

create table garn_har_fiber(
garn_id int,
fiber_id int,
prosent int,
primary key (garn_id,fiber_id),
foreign key (garn_id) references garn(id),
foreign key (fiber_id) references fiber(id)
);

create table farge(
nummer int not null,
navn varchar(10) not null,
primary key (nummer)
);

create table garn_har_farge(
garn_id int,
farge_nr int,
primary key (garn_id,farge_nr),
foreign key (garn_id) references garn(id),
foreign key (farge_nr) references farge(nummer)
);