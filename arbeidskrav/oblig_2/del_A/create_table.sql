create table pasient(
id int not null,
fornavn varchar(45),
etternavn varchar(45),
kjoenn varchar(1),
foedselsdato date,
sted varchar(45),
allergier varchar(45),
hoeyde int, 
vekt int,
primary key (id)
);