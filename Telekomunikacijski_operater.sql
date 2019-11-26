drop database if exists telekomunikacijski_operater;
create database telekomunikacijski_operater default character set utf8;
use telekomunikacijski_operater;

# c:\xampp\mysql\bin\mysql.exe -uedunova -pedunova --default-character-set=utf8 < c:\telekomunikacijski_operater.sql


create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar (50) not null,
    oib char (11) not null,
    adresa varchar (50),
    mobilna_tarifa  int not null,
    mobilni_uredaji int not null,
    fiksni_telefon int not null,
    tv int not null,
    internet int not null
);

create table mobilna_tarifa(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,2),
    podatkovni_promet int not null,
    SMS_MIN int not null,
    mobilni_uredaji int not null
    
);

create table mobilni_uredaji (
    sifra int not null primary key auto_increment,
    marka varchar(50) not null,
    model varchar (50) not null,
    cijena decimal (18,2) not null,
    OS varchar(20)
);

create table fiksni_telefon (
    sifra int not null primary key auto_increment,
    cijena decimal (18,2) not null,
    MIN int not null
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
alter table korisnik add foreign key (mobilni_uredaji) references mobilni_uredaji(sifra);
alter table korisnik add foreign key (fiksni_telefon) references fiksni_telefon(sifra);
alter table korisnik add foreign key (tv) references tv(sifra);
alter table korisnik add foreign key (internet) references internet(sifra);
alter table mobilna_tarifa add foreign key (mobilni_uredaji) references mobilni_uredaji(sifra);


