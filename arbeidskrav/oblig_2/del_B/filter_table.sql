select * from pasienter WHERE fodseldag LIKE "2010%";
select fornavn,etternavn,hoyde from pasienter order by hoyde desc limit 1;
select * from pasienter where id = 1 or id= 45 or id= 234 or id= 379 or id= 500;
select distinct sted,provins_id from pasienter where provins_id = "NS";
select fornavn,etternavn,fodseldag from pasienter where hoyde>160 and vekt>70;
select distinct year(fodseldag) from pasienter order by year(fodseldag) asc;
select distinct fornavn from pasienter;