drop database if exists edunovajp21;
create database edunovajp21 default character set utf8;
use edunovajp21;
# c:\xampp\mysql\bin\mysql.exe -uedunova -pedunova --default-character-set=utf8 < c:\skriptajp21.sql

create table smjer(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    trajanje int not null,
    cijena decimal(18,2) not null,
    upisnina decimal(18,2) not null,
    verificiran boolean default true
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    email varchar(100) not null
);

create table grupa(
    sifra int not null primary key auto_increment,
    naziv varchar(20) not null,
    smjer int not null,
    predavac int,
    brojpolaznika int not null,
    datumpocetka datetime 
);

create table predavac(
    sifra int not null primary key auto_increment,
    osoba int not null,
    iban varchar(50)
);

create table polaznik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    brojugovora varchar(50) not null
);

create table clan(
    grupa int not null,
    polaznik int not null
);


alter table grupa add foreign key (smjer) references smjer(sifra);
alter table grupa add foreign key (predavac) references predavac(sifra);

alter table predavac add foreign key (osoba) references osoba(sifra);

alter table polaznik add foreign key (osoba) references osoba(sifra);

alter table clan add foreign key (grupa) references grupa(sifra);
alter table clan add foreign key (polaznik) references polaznik(sifra);




select * from smjer;

#describe smjer;

# ne tako dobra
#1
insert into smjer values (null,'Java programiranje',130,6999.99,500,null);

# malo bolji 1
#2
insert into smjer (naziv,trajanje,cijena,upisnina) values 
('PHP programer',130,4999.90,500);

# malo bolji 2
#3
insert into smjer (cijena, upisnina, trajanje, naziv) values
(1000,100,100,'RaÄ�unalni operator');

# primjer dobre prakse
#4
insert into smjer(sifra,naziv,trajanje,cijena,upisnina, verificiran) values
(null,'Knjigovodstveni operater',180,8900,500,true);

#describe grupa;

#select * from grupa;
#1
insert into grupa (naziv,smjer,brojpolaznika) values
('JP21',1,18);

#2
insert into grupa (naziv,smjer,brojpolaznika) values
('PP20',2,18);

#3
insert into grupa (naziv,smjer,brojpolaznika,datumpocetka) values
('RO1',4,18,'2019-11-13 20:00:00');


#describe osoba;

#select * from osoba;

#1
insert into osoba(ime,prezime,email) values 
('Tomislav','Jakopec','tjakopec@gmail.com');

# 2-23
insert into osoba(sifra,ime,prezime,email) values
(null,'Mirko','ReÅ¡etar','reso28@gmail.com'),
(null,'Filip','GelenÄ�ir','stoka199@gmail.com'),
(null,'Bruno','GelenÄ�ir','gelencirbruno@gmail.com'),
(null,'Filip','VolareviÄ‡','voki095@gmail.com'),
(null,'Marko','MiliÄ‡','marko.milic224@gmail.com'),
(null,'AziniÄ‡','Andrija','azinic1999@gmail.com'),
(null,'Zvonimir','Mesinger','zvonimir.mesinger@gmail.com'),
(null,'Boris','LasoviÄ‡','lasovic@gmail.com'),
(null,'Maksima','MijatoviÄ‡','maxima.mijatovic@gmail.com'),
(null,'Nikola','JuzbaÅ¡iÄ‡','nikolajuzbasic70@gmail.com'),
(null,'Sven','ÄŒevapoviÄ‡','svencevapovic77@gmail.com'),
(null,'Luka','PozniÄ‡','lpoznic@net.hr'),
(null,'Dario','PeriÅ¡iÄ‡','perisicdario2702@gmail.com'),
(null,'Dario','Trtanj','trtanjd@gmail.com'),
(null,'BoÅ¾ena','PaliÄ‡ CeriÄ‡','bozena.palic@gmail.com'),
(null,'Nikola','MiliÄ‡','nikk.mil@gmail.com'),
(null,'David','PetriÄ‡','petricdavid@protonmail.ch'),
(null,'Goran','Maras','goran.maras77@gmail.com'),
(null,'Marko','GrbeÅ¡','marko.grbes1@gmail.com'),
(null,'Matej','Å apina','sapina.matej@yahoo.com'),
(null,'Josip','DasoviÄ‡','josip.dasovic22@gmail.com'),
(null,'Goran','KovaÄ�','gokovac@gmail.com');

#24-44
insert into osoba (sifra,ime,prezime,oib,email) values
(null,'Damir','Å krebljin',null,'skrebljin@hotmail.com'),
(null,'Mirza','DeagiÄ‡',null,'mirza.delagic@gmail.com'),
(null,'Marko','BiskupiÄ‡',null,'biskupicmarko4@gmail.com'),
(null,'Filip','Poslek',null,'fposlek@gmail.com'),
(null,'Kristijan','VidakoviÄ‡',null,'kristijan.vidakovic111@gmail.com'),
(null,'Matej','MalÄ�iÄ‡',null,'matej.malcic3@gmail.com'),
(null,'Antonio','GrbeÅ¡a',null,'agrbesa995@gmail.com'),
(null,'Ivan','Jozing',null,'ivan.jozing1@gmail.com'),
(null,'Ivan','DamjanoviÄ‡',null,'damjanovic.ivan87@gmail.com'),
(null,'Stjepan','PeriÅ¡in',null,'stjepan@xenios.hr'),
(null,'Luka','Vuk',null,'luka.vuk456@gmail.com'),
(null,'Vedran','StojnoviÄ‡',null,'phidrho@gmail.com'),
(null,'Ivor','Ä†eliÄ‡',null,'ivorcelic@gmail.com'),
(null,'Matija','Å poljar',null,'spoljo1122@gmail.com'),
(null,'Anita','RaÄ�man',null,'racmananita@gmail.com'),
(null,'Tomislav','Zidar',null,'zidarto@hotmail.com'),
(null,'Renato','TopiÄ‡',null,'renato.topic@gmail.com'),
(null,'Tomislav','Grebenar',null,'tomislav.grebenarlb@gmail.com'),
(null,'Vladimir','Grebenar',null,'vladimir.grebenar@gmail.com'),
(null,'David','ÄŒiÄ�ek',null,'official.davidcicek@gmail.com'),
(null,'Dijana','PandureviÄ‡',null,'dijana.pandurevic@gmail.com');

#45
insert into osoba(ime,prezime,email) values 
('Shaquille','O''Neal','Å¡aki@gmail.com');

#describe predavac;

#select * from predavac;

insert into predavac (osoba) values (1),(45);

#describe polaznik;

#1-43
insert into polaznik (osoba,brojugovora)
select sifra, '' from osoba where sifra not in (1,45);

#describe clan;

insert into clan(grupa,polaznik)
select 1,sifra from polaznik where sifra<=22;

insert into clan(grupa,polaznik)
select 2,sifra from polaznik where sifra>22;





#
#DZ
#


select * from osoba;

insert into osoba(sifra,ime, prezime, oib, email)values
(null,'Marko','Polo', 27621145421, 'polo@gmail.com'),
(null,'Luka','Lukić', 89567617150, 'lukic@gmail.com'),
(null,'Ivan', 'Ivić', 31186135753, 'ivic@gmail.com'),
(null, 'Nikola', 'Nikolić', 95736632076, 'nikolic@gmail.com');

select * from predavac;
insert into predavac (osoba) values(46);
insert into predavac (osoba) values(47);
insert into predavac (osoba) values(48);


select * from polaznik;

insert into polaznik(sifra, osoba, brojugovora)values
(null, 46, '');
insert into polaznik(sifra, osoba, brojugovora)values
(null, 47, '');
insert into polaznik(sifra, osoba, brojugovora)values
(null, 48, '');

select * from smjer;

insert into smjer (sifra,cijena, upisnina, trajanje, naziv) values
(null, 1000,100,100,'Marketing');
insert into smjer (sifra,cijena, upisnina, trajanje, naziv) values
(null, 2000,200,50,'Javni govor');
insert into smjer (sifra,cijena, upisnina, trajanje, naziv) values
(null, 3000,100,100,'Serviser');


select*from grupa;

insert into grupa (sifra,naziv,smjer,predavac,brojpolaznika) values
(null,'M22',7,3,22);
insert into grupa (sifra,naziv,smjer,predavac,brojpolaznika) values
(null,'JG23',6,4,23);
insert into grupa (sifra,naziv,smjer,predavac,brojpolaznika) values
(null,'S24',5,5,24);

select * from clan;

insert into clan (grupa, polaznik) values (6,64);
insert into clan (grupa, polaznik) values (5,65);
insert into clan (grupa, polaznik) values (4,66);




select * from osoba where sifra=46;
select * from osoba where sifra=47;

update osoba set oib='35229208719', email='marko@gmail.com' where sifra=46;
update osoba set oib='31479543941', email='luka@gmail.com' where sifra=47;

select * from predavac;


update predavac set iban='HR7624840082651635989' where sifra=3;
update predavac set iban='HR7825000091686331337' where sifra=4;

select * from smjer;

update smjer set cijena='2000'where sifra=5;
update smjer set cijena='5000'where sifra=6;
update smjer set cijena=cijena*1.5 where sifra=5;

select*from grupa;

update grupa set brojpolaznika='25' where sifra=4;
update grupa set brojpolaznika='24' where sifra=5;


select * from clan;

delete from clan where grupa=4 and polaznik=66;


select * from polaznik;

delete from polaznik where sifra=48;



select * from predavac;

delete from predavac where sifra=48;





