drop database if exists telekomunikacijski_operater;
create database telekomunikacijski_operater default character set utf8;
use telekomunikacijski_operater;

# c:\xampp\mysql\bin\mysql.exe -uedunova -pedunova --default-character-set=utf8 < c:\telekomunikacijski_operater2.sqlx


create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar (50) not null,
    prezime varchar (50) not null,
    oib int (11) not null,
    mobilna_tarifa  int, 
    mobilni_uredaj int, 
    fiksni_telefon int, 
    tv int, 
    internet int
);

create table mobilna_tarifa(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,2),
    podatkovni_promet int not null,
    sms_min int not null
   
    
);

create table mobilni_uredaj (
    sifra int not null primary key auto_increment,
    marka varchar(50) not null,
    cijena decimal (18,2) not null,
    os varchar(20),
    mobilna_tarifa int 
);

create table fiksni_telefon (
    sifra int not null primary key auto_increment,
    cijena decimal (18,2) not null,
    min int not null
);

create table tv(
    sifra int not null primary key auto_increment,
    sportski_kanali boolean default false,
    filmski_kanali boolean default false,
    cijena decimal (18,2)
);

create table internet (
    sifra int not null primary key auto_increment,
    flat_internet boolean default false,
    pokucni_internet boolean default false,
    cijena decimal (18,2)
);



alter table korisnik add foreign key (mobilna_tarifa) references mobilna_tarifa(sifra);
alter table korisnik add foreign key (mobilni_uredaj) references mobilni_uredaj(sifra);
alter table korisnik add foreign key (fiksni_telefon) references fiksni_telefon(sifra);
alter table korisnik add foreign key (tv) references tv(sifra);
alter table korisnik add foreign key (internet) references internet(sifra);
alter table mobilni_uredaj add foreign key (mobilna_tarifa) references mobilna_tarifa(sifra);


insert into mobilna_tarifa (sifra, naziv, cijena , podatkovni_promet ,sms_min ) values
(null, 'smart', 100.00, 5000, 5000),
(null, 'poslovna', 155.50, 10240, 10000 ),
(null, 'pricam', 50.00, 0, 2000);

insert into mobilni_uredaj (sifra, marka, cijena, os, mobilna_tarifa)values
(null, 'smasung', 50000.00, 'android', 2 ),
(null, 'iphone', 8000.00, 'ios', 1),
(null, 'motorola', 1000.00, 'linux', 3),
(null, 'huawei', 3000.00, 'android', 1);

insert into fiksni_telefon (sifra, cijena, min)values
(null, 85.00, 5000),
(null, 50.00, 2000);

insert into internet (sifra, flat_internet, pokucni_internet, cijena)values
(null, true, false, 150.00),
(null,false, true, 180.00);

insert into tv (sifra, sportski_kanali, filmski_kanali, cijena)values
(null, true, false, 100.00),
(null, false, true, 110.00),
(null, true, true, 150.00);
