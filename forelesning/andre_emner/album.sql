
use albumdb;
create table album (
	Id int primary key not null auto_increment,
	Title varchar(50),
	Artist varchar(50),
	Year int);
insert into album (Title, Artist, Year) values ("In Rainbows","Radiohead", 2007);
insert into album (Title, Artist, Year) values ("Souvlaki", "Slowdive",1994);
insert into album (Title, Artist, Year) values ("98.12.28", "Fishmans",1999);
insert into album (Title, Artist, Year) values ("You Will Never Know Why","Sweet Trip", 2009);
insert into album (Title, Artist, Year) values ("The Mollusk", "Ween",1997);
insert into album (Title, Artist, Year) values ("EUSEXUA", "FKA Twigs",2025);

select * from album;