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

create table hardhet(
id int not null,
navn varchar(5),
primary key (id)
);

create table plante(
botanisk_navn varchar(45) not null,
navn varchar(45),
jordforhold varchar(45),
allergivennlig tinyint,
kategori_id int,
hardhet_id int,
primary key (botanisk_navn),
foreign key(kategori_id) references kategori(id),
foreign key(hardhet_id) references hardhet(id)
);

create table stell(
plante_botanisk_navn varchar(45),
lokasjon varchar(45),
grotid_uke int,
naering varchar(45),
lysforhold varchar(45),
hoeyde_cm int,
kvm int,
vanningsbehov_id int,
blomstringstid varchar(45),
primary key (plante_botanisk_navn, lokasjon),
foreign key (plante_botanisk_navn) references plante(botanisk_navn),
foreign key (vanningsbehov_id) references vanningsbehov(id)
);

create table plante_farge(
farge_id int not null,
plante_botanisk_navn varchar(45) not null,
primary key (farge_id,plante_botanisk_navn),
foreign key (plante_botanisk_navn) references plante(botanisk_navn),
foreign key (farge_id) references farge(id)
);

create table plante_dyr(
plante_botanisk_navn varchar(45) not null,
dyr_id int not null,
`skadedyr/nyttedyr` varchar(45),
primary key (dyr_id,plante_botanisk_navn),
foreign key (plante_botanisk_navn) references plante(botanisk_navn),
foreign key (dyr_id) references dyr(id)
);