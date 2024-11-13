CREATE DATABASE mipais;

use mipais;

CREATE TABLE Pais(
idPais int not null primary key,
nombre varchar(20) not null,
continente varchar(50) not null,
poblacion int not null
);

CREATE TABLE Ciudad(
idCiudad int not null primary key auto_increment,
nombre varchar(50) not null,
idPais int not null,
FOREIGN KEY (idPais) REFERENCES Pais (idPais)
);
DROP TABLE Ciudad;

CREATE TABLE Idioma(
idIdioma int not null primary key,
idioma varchar(50) not null
);

CREATE TABLE idioma_Pais(
idIdioma int not null,
idPais int not null,
es_oficial tinyint,
primary key (idIdioma, idPais),
FOREIGN KEY (idPais) REFERENCES Pais (idPais),
FOREIGN KEY (idIdioma) REFERENCES Idioma (idIdioma)
);

insert into Idioma (idIdioma,idioma) values (1,'Español'),
(2,'Ingles'),(3,'Frances');

insert into Pais (idPais,nombre,continente,poblacion)
values  (1, 'México', 'América', 126000000),
(2, 'Estados Unidos', 'América', 331000000),
(3, 'Francia', 'Europa', 67000000),
(4, 'Canadá', 'América', 38000000);

insert into Ciudad (idPais,nombre)
values (1,'chihuhua'),(1,'Mexico DF'),(1,'Cancun');

insert into Ciudad (idPais,nombre)
values (2,'Washington'),(2,'New York');

select * from Ciudad;

-- alter table nombretabla modify column nombretabla varchar;
-- alter table             rename column nombreViejo to nombreNuevo;
-- truncate table Idioma; Eliminar todos los datos de la tabla
insert into idioma_Pais (idIdioma,idPais,es_oficial)
values (1,1,1),(2,1,0); -- Mexico

insert into idioma_Pais (idIdioma,idPais,es_oficial) values
(2,2,1), (1,2,0); -- USA

insert into idioma_Pais (idIdioma,idPais,es_oficial) values
(3,3,1),(2,3,0); -- Francia

insert into idioma_Pais (idIdioma,idPais,es_oficial) values
(2,4,1),(3,4,1); -- Canada

select * from Idioma; -- mostrar todos los datos

-- Consultas

-- 1.Listar todos los idiomas
select * from Idioma;
select idioma from Idioma;

-- 2.Listar el idioma con ID 1
select * from Idioma where idIdioma=1;
select idioma from Idioma where idIdioma=1;

-- 3.Consultar los paises que esten en America
select nombre from Pais where continente = 'America';
select * from Pais where continente = 'America';
select nombre as Nombre_Pais from Pais where continente = 'America';



-- SUBCONSULTAS
-- 4.Subconsulta que encuentre los idiomas oficioles
select idioma from Idioma where idIdioma in
(select idIdioma from idioma_Pais where es_oficial = 1);


