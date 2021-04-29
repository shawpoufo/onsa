--use [master]
--create database onsa
--drop database onsa
--use onsa 

create table Station
(
id int,
nom nvarchar(20) unique not null,
capacite int not null,
ville nvarchar(20) not null,
constraint pk_station primary key (id)
);

create table Parking
(
id int,
capacite int,
id_station int,
prix_heure float,
constraint pk_parking primary key (id),
constraint fk_parking_station_id foreign key (id_station) references Station(id) 
);

create table Compagnie
(
id int,
nom nvarchar(50),
constraint pk_compagnie primary key(id)
);