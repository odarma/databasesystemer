create table provins(
id varchar(2),
navn varchar(45),
primary key (id)
);
create table pasienter(
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