drop database if exists drzavnauprava;
create database drzavnauprava default character set utf8;
use drzavnauprava;
# c:\xampp\mysql\bin\mysql.exe -uedunova -pedunova --default-character-set=utf8 < c:\drzavnauprava.sql


create table zupanija(
    sifra int not null primary key auto_increment,
    naziv varchar (50) not null,
    zupan varchar (50) not null

);

create table opcina(
    sifra int not null primary key auto_increment,
    zupanija int not null ,
    naziv varchar (50) not null,
    nacelnik varchar (50) not null
);
create table mjesto (
    sifra int not null primary key auto_increment,
    naziv varchar (50) not null,
    opcina int not null,
    brojstanovnika int not null

);

alter table opcina add foreign key (zupanija) references zupanija(sifra);
alter table mjesto add foreign key (opcina) references opcina(sifra);


select * from zupanija;

insert into zupanija (sifra, naziv, zupan)values
(null,'Osijecko baranjska zupanija', 'Anusic');

select * from opcina;

insert into opcina (sifra, zupanija, naziv, nacelnik)values
(null,1,'Bilje','Peric');

select * from mjesto;

insert into mjesto (sifra, naziv, opcina, brojstanovnika)values
(null, 'Bilje', 1, 10000);


#Insertano kasnije

select * from mjesto;

insert into mjesto (sifra, naziv, opcina, brojstanovnika)values
(null, 'Petrijevci', 1, 5000);
insert into mjesto (sifra, naziv, opcina, brojstanovnika)values
(null, 'Andrijaševci', 2 , 6000);



select * from opcina;

insert into opcina(sifra, zupanija, naziv,nacelnik)values
(null,1,'Petrijevci','Džurić' );
insert into opcina(sifra, zupanija, naziv,nacelnik)values
(null,2,'Andrijaševci','Peroć' );



select * from zupanija;

insert into zupanija(sifra, naziv, zupan)values
(null,'Vukovarsko srijemska','Božo Galić');
