create table studie(id int not null, navn varchar(20) not null, primary key(id));

create table student(
	id int not null,
    foedselsnummer varchar(11) not null,
    fornavn varchar(20) not null,
    etternavn varchar(20) not null,
    studie int not null,
    start int not null, 
    primary key(id),
    foreign key(studie) references studie(id)
);