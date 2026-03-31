create role administrator;
create role utvikler;
create role bruker;

create user 'DBA'@'localhost' identified by 'dba';
create user 'dev'@'localhost' identified by 'dev';
create user 'user'@'%' identified by 'user';

grant all privileges on app.* to 'administrator';
grant 'administrator' to 'DBA'@'localhost';
set default role 'administrator' to 'DBA'@'localhost';

grant select, insert, update on app.* to utvikler;
grant 'utvikler' to 'dev'@'localhost';
set default role 'utvikler' to 'dev'@'localhost';

grant select, insert, update on app.bestilling to bruker;
grant select, insert, update on app.profil to bruker;
grant 'bruker' to 'user'@'%';