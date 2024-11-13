drop database if exists funciones;
create database funciones;

use funciones;

drop table if exists departamento;
CREATE TABLE departamento (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
gastos DOUBLE UNSIGNED NOT NULL
); 

drop table if exists empleado;
CREATE TABLE empleado (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nif VARCHAR(9) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
id_departamento INT UNSIGNED,
FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero',
NULL);

-- 1. Lista el primer apellido de todos los empleados.
select apellido1 as Empleado from empleado;

-- 2. Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
select distinct apellido1 as Apellido from empleado;

-- 3. Lista todas las columnas de la tabla empleado.
select * from empleado;

-- 4. Lista el nombre y los apellidos de todos los empleados.
select nombre as Nombre, apellido1 as Primer_Apellido, apellido2 as Segundo_Apellido from empleado;

-- 5. Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado.
select id_departamento from empleado;

-- 6. Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado, eliminando los identificadores que aparecen repetidos.
select distinct id_departamento from empleado;

-- 7. Lista el nombre y apellidos de los empleados en una única columna.
select concat_ws('',nombre,  ' ',  apellido1, ' ',  apellido2) as Nombre_Completo  from empleado;

-- 8. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
select upper(concat_ws('',nombre,  ' ',  apellido1, ' ',  apellido2))  as Nombre_Completo from empleado;

-- 9. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
select lower(concat_ws('',nombre,  ' ',  apellido1, ' ',  apellido2)) as Nombre_Completo from empleado;

-- 10. Lista el identificador de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la otra la letra.
select  concat(id,' ' , substring(nif,1, 8) ) as ID_NIF, substring(nif, 9,1) as Letra_Nif from empleado;
select id, substring(nif,1, 8), substring(nif, 9,1) from empleado;

select id, REGEXP_REPLACE(nif,'[^A-Z]','') as Letras,
REGEXP_REPLACE(nif,'[^0-9]','') as codigo from empleado;

-- 11. Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. Para calcular este dato tendrá que restar al valor del
-- presupuesto inicial (columna presupuesto) los gastos que se han generado (columna gastos). Tenga en cuenta que en algunos casos pueden existir
-- valores negativos. Utilice un alias apropiado para la nueva columna columna que está calculando.
DELIMITER //
CREATE FUNCTION presupuesto_Fun(presupuesto double, gastos double)
RETURNS double DETERMINISTIC
BEGIN
	RETURN presupuesto - gastos;
END //
DELIMITER ;


select nombre as Departamento, presupuesto_fun(presupuesto, gastos) as Presupuesto from departamento;


-- 12. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
select nombre, presupuesto_fun(presupuesto, gastos) from departamento order by nombre asc;

-- 13. Lista el nombre de todos los departamentos ordenados de forma ascendente.
select nombre from departamento order by nombre asc;

-- 14. Lista el nombre de todos los departamentos ordenados de forma descendente.
select nombre from departamento order by nombre desc;

/*15. Lista los apellidos y el nombre de todos los empleados, ordenados de forma
alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su nombre.*/
select apellido1 as Primer_Apellido, apellido2 as Segundo_Apellido, nombre as Nombre from empleado order by 1,2,3 asc;

/*16. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.*/
select nombre as Nombre, presupuesto as Presupuesto from departamento order by 2 desc limit 3;

/*17. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.*/
select nombre as Nombre, presupuesto as Presupuesto from departamento order by 2 asc limit 3;

/*18. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.*/
select nombre as Nombre, gastos as Gastos from departamento order by 2 desc limit 2;

/*19. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.*/
select nombre as Nombre, gastos as Gastos from departamento order by 2 asc limit 2;

/*20. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La
tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.*/
select * from empleado limit 5 offset 2;
select * from empleado limit 2,5;

/*21. Devuelve una lista con el nombre de los departamentos y el presupuesto,
 de aquellos que tienen un presupuesto mayor o igual a 150000 euros.*/
 select nombre as Nombre, presupuesto as Presupuesto from departamento where presupuesto >= 150000;
 
/*22. Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.*/
select nombre as Nombre, gastos as Gastos from departamento where gastos <= 5000;

/*23. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin
utilizar el operador BETWEEN.*/
select nombre as Nombre, presupuesto as Presupuesto from departamento where presupuesto >= 100000 and presupuesto <= 200000;

/*24. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.*/
select nombre as Nombre, presupuesto as Presupuesto from departamento where presupuesto <= 100000 or presupuesto >= 200000;

/*25. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.*/
select nombre as Nombre, presupuesto as Presupuesto from departamento where presupuesto between 100000 and 200000;

/*26. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.*/
select nombre as Nombre, presupuesto as Presupuesto from departamento where presupuesto not between 100000 and 200000;

/*27. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean mayores
que el presupuesto del que disponen.*/
select nombre, gastos, presupuesto from departamento where gastos > presupuesto;

/*28. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean menores
que el presupuesto del que disponen.*/
select nombre, gastos, presupuesto from departamento where gastos < presupuesto;

/*29. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean iguales al
presupuesto del que disponen.*/
select nombre, gastos, presupuesto from departamento where gastos = presupuesto;

-- 30. Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
select * from empleado where apellido2 is null;
-- 31. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
select * from empleado where apellido2  is not null;

-- 32. Lista todos los datos de los empleados cuyo segundo apellido sea López.
select * from empleado where apellido2 = 'Lopez';

-- 33. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.
select * from empleado where apellido2 = 'Díaz' or apellido2 = 'Moreno';

-- 34. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.
select * from empleado where apellido2 in ('Díaz', 'Moreno');

-- 35. Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
select nombre as Nombre, apellido1 as Primer_Apellido, apellido2 as Segundo_Apellido, nif from empleado where id_departamento = 3;

-- 36. Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
select id_departamento,nombre as Nombre, apellido1 as Primer_Apellido, apellido2 as Segundo_Apellido, nif from empleado where id_departamento = 2 or id_departamento = 4 or id_departamento = 5 ;
select id_departamento,nombre as Nombre, apellido1 as Primer_Apellido, apellido2 as Segundo_Apellido, nif from empleado where id_departamento in(2,4,5);

-- Consultas multitabla (Composición interna)

-- 1. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
select * from empleado E
join departamento D on E.id_departamento = D.id;
/* 2. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre
 del departamento (en orden alfabético) y en segundo lugar por los apellidos y el nombre de los empleados.*/
 select D.nombre, E.apellido1, E.apellido2, E.nombre from empleado E
join departamento D on E.id_departamento = D.id order by 1,2,3,4 desc ;
 
-- 3. Devuelve un listado con el identificador y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
select D.id, D.nombre from empleado E
join departamento D  on   E.id_departamento = D.id group by 1,2;

select distinct D.id, D.nombre from empleado E
join departamento D  on   E.id_departamento = D.id ;

/* 4. Devuelve un listado con el identificador, el nombre del departamento y el valor del presupuesto actual del que dispone, solamente de aquellos
departamentos que tienen empleados. El valor del presupuesto actual lo puede calcular restando al valor del presupuesto inicial
(columna presupuesto) el valor de los gastos que ha generado (columna gastos).*/
select D.id, D.nombre, presupuesto_Fun(presupuesto,gastos) as Presupuesto_Actual from departamento D
join empleado E on D.id = E.id_departamento group by 1, 2;

-- 5. Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
select D.nombre from departamento D
join empleado E on D.id = E.id_departamento  where E.nif = '38382980M';

-- 6. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
select D.nombre, E.* from departamento D
join empleado E on D.id = E.id_departamento  where E.nombre = 'Pepe' and E.apellido1 = 'Ruiz' and E.apellido2 = 'Santana';

-- 7. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
select E.* from empleado E
join departamento D on E.id_departamento = D.id where D.nombre = 'I+D' order by E.nombre asc;
-- 8. Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
select E.* from empleado E
join departamento D on E.id_departamento = D.id where D.nombre in ('Sistemas', 'Contabilidad' , 'I+D') order by E.nombre asc;

-- 9. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
select E.nombre from empleado E
join departamento D on E.id_departamento = D.id where presupuesto not between 100000 and 200000;

-- 10. Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL. Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.
select distinct D.nombre from departamento D
join empleado E on D.id = E.id_departamento where E.apellido2 is null;

-- Consultas multitabla (Composición externa)

-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

/*1. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. Este listado también debe incluir los
empleados que no tienen ningún departamento asociado.*/
select * from empleado E
left join departamento D on E.id_departamento = D.id;

-- 2. Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
select * from empleado E
left join departamento D on E.id_departamento = D.id where E.id_departamento is null;

-- 3. Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.
select D.nombre from departamento D
left join empleado E on E.id_departamento = D.id where E.id_departamento is null;

/*4. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. El listado debe incluir los empleados que no
tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.*/
select * from empleado E
left join departamento D on E.id_departamento = D.id
union
select * from empleado E
right join departamento D on E.id_departamento = D.id order by 8 asc;


/*5. Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado.
Ordene el listado alfabéticamente por el nombre del departamento.*/
select * from empleado E
left join departamento D on E.id_departamento = D.id where E.id_departamento is null
union
select * from empleado E
right join departamento D on E.id_departamento = D.id where E.id_departamento is null order by 8 asc;

-- Consultas resumen

-- 1. Calcula la suma del presupuesto de todos los departamentos.
select sum(presupuesto) as Presupuesto_Total from departamento;
-- 2. Calcula la media del presupuesto de todos los departamentos.
select avg(presupuesto) as Promedio_Presupuesto from departamento;

-- 3. Calcula el valor mínimo del presupuesto de todos los departamentos.
select min(presupuesto) from departamento;

-- 4. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con menor presupuesto.
select nombre, presupuesto from departamento order by 2 limit 1;

-- 5. Calcula el valor máximo del presupuesto de todos los departamentos.
select max(presupuesto) as Presupuesto_Maximo from departamento;

-- 6. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con mayor presupuesto.
select nombre, presupuesto from departamento order by 2 desc limit 1 ;

-- 7. Calcula el número total de empleados que hay en la tabla empleado.
select count(id) as Total_empleados from empleado;

-- 8. Calcula el número de empleados que no tienen NULL en su segundo apellido.
select count(*) from empleado where apellido2 is not null;

/* 9. Calcula el número de empleados que hay en cada departamento. Tienes que devolver dos columnas, una con el nombre del departamento y otra con el
número de empleados que tiene asignados.*/
select D.nombre, count(E.id) from empleado E
join departamento D on E.id_departamento = D.id group by 1;

/*10. Calcula el nombre de los departamentos que tienen más de 2 empleados. El resultado debe tener dos columnas, una con el nombre del departamento y
otra con el número de empleados que tiene asignados.*/
select D.nombre, count(E.id) from empleado E
right join departamento D on E.id_departamento = D.id  group by 1 having count(E.id) > 2 ;


/*11. Calcula el número de empleados que trabajan en cada uno de los departamentos. El resultado de esta consulta también tiene que incluir
aquellos departamentos que no tienen ningún empleado asociado.*/
select D.nombre, count(E.id) from empleado E
right join departamento D on E.id_departamento = D.id group by 1;

-- 12. Calcula el número de empleados que trabajan en cada unos de los departamentos que tienen un presupuesto mayor a 200000 euros.
select count(E.id) as Cantidad from empleado E
join departamento D on E.id_departamento = D.id  where presupuesto > 200000;
