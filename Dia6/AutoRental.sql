drop database if exists autorental;
create database autorental;
use autorental;

create table clientes(
id int primary key auto_increment,
cedula varchar(45) not null,
nombre1 varchar(30) not null,
nombre2 varchar(30) null,
apellido1 varchar(30) not null,
apellido2 varchar(30) null,
ciudad_residencia varchar(45) not null,
direccion varchar(200) not null,
celular varchar(45) not null,
correo varchar(45) null);

create table sucursales(
id int primary key auto_increment,
ciudad varchar(45) not null,
direccion varchar(200) not null,
celular varchar(45) not null,
telefono_fijo varchar(45) null,
correo varchar(45) null
);

create table empleados(
id int primary key auto_increment,
cedula varchar(45) not null,
nombre1 varchar(30) not null,
nombre2 varchar(30) null,
apellido1 varchar(30) not null,
apellido2 varchar(30) null,
direccion varchar(200) not null,
ciudad_residencia varchar(45) not null,
celular varchar(45) not null,
correo varchar(45) null,
id_sucursal int,
foreign key (id_sucursal) references sucursales (id));


create table descuentos(
id int primary key auto_increment,
fecha_inicio date null,
fecha_fin date null,
porcentaje_descuento int null
);

create table tipo_vehiculo(
id int primary key auto_increment,
tipo_vehiculo varchar(45) not null,
id_descuento int,
foreign key (id_descuento) references descuentos (id)
);

create table vehiculos(
id int primary key auto_increment,
placa varchar(45) not null,
referencia varchar(45) not null,
capacidad varchar(45) not null,
sunroof varchar(45) not null,
puertas varchar(45) not null,
modelo varchar(45) not null,
motor varchar(45) not null,
color varchar(45) not null,
id_tipo_vehiculo int,
foreign key (id_tipo_vehiculo) references tipo_vehiculo (id)
);

create table alquileres(
id int primary key auto_increment,
alquiler_semana int not null,
alquiler_dia int not null,
id_sucursal_salida int,
fecha_salida date not null,
id_sucursal_llegada int,
fecha_esperada date not null,
fecha_llegada date null,
id_cliente int,
id_empleado int,
id_vehiculo int,
valor_cotizado int not null,
valor_pagado int not null,
id_descuento int,
foreign key (id_sucursal_salida) references sucursales (id),
foreign key (id_sucursal_llegada) references sucursales (id),
foreign key (id_cliente) references clientes (id),
foreign key (id_empleado) references empleados (id),
foreign key (id_descuento) references descuentos (id),
foreign key (id_vehiculo) references vehiculos (id)
);

create table retraso(
id int primary key auto_increment,
dias_retraso int null,
porcentaje_dias int null,
id_alquiler int,
foreign key (id_alquiler) references alquileres (id));

INSERT INTO clientes (cedula, nombre1, nombre2, apellido1, apellido2, ciudad_residencia, direccion, celular, correo) VALUES
('1012345678', 'Carlos', 'Andrés', 'Rodríguez', 'Pérez', 'Bogotá', 'Calle 45A #12-30', '3005129876', 'carlos.rodriguez@hotmail.com'),
('1045789234', 'Laura', NULL, 'Gómez', 'Quintero', 'Medellín', 'Carrera 52 #84-23', '3102569834', 'laura.gomez@gmail.com'),
('1234985678', 'Miguel', 'Ángel', 'Restrepo', 'Torres', 'Cali', 'Calle 9 #25-14', '3129876543', 'miguel.angel@hotmail.com'),
('1054321987', 'Sofía', NULL, 'Martínez', 'Ruiz', 'Cartagena', 'Avenida Venezuela #10-45', '3201234598', 'sofia.martinez@yahoo.com'),
('1098765432', 'Andrés', 'Felipe', 'Castaño', 'Ramírez', 'Barranquilla', 'Carrera 43 #65-32', '3114567890', 'andres.felipe@gmail.com'),
('1012456789', 'Juan', 'Sebastián', 'Jiménez', 'Hernández', 'Bogotá', 'Calle 22 #45-67', '3007896541', 'juan.jimenez@hotmail.com'),
('1087654321', 'Diana', 'Marcela', 'Fernández', 'López', 'Medellín', 'Carrera 12 #54-98', '3158765432', 'diana.fernandez@yahoo.com'),
('1109876543', 'Luis', 'Alberto', 'Ospina', 'Montoya', 'Cali', 'Calle 72 #18-32', '3129874321', 'luis.ospina@gmail.com'),
('1110987654', 'Camila', 'Andrea', 'Mejía', 'Cruz', 'Cartagena', 'Avenida del Lago #4-20', '3006549871', 'camila.mejia@hotmail.com'),
('1012987654', 'Felipe', NULL, 'Zapata', 'García', 'Barranquilla', 'Carrera 8 #65-54', '3189876543', 'felipe.zapata@gmail.com'),
('1023987654', 'Natalia', 'Paola', 'Rojas', 'Mendoza', 'Bogotá', 'Calle 30 #50-89', '3201236548', 'natalia.rojas@yahoo.com'),
('1056789123', 'Andrés', 'Julián', 'Arango', 'Restrepo', 'Medellín', 'Carrera 48 #90-23', '3137896543', 'andres.arango@hotmail.com'),
('1023987653', 'Laura', 'Vanessa', 'Cruz', 'Santos', 'Cali', 'Calle 8 #44-76', '3216547890', 'laura.cruz@gmail.com'),
('1056789213', 'Mateo', 'Daniel', 'Hernández', 'Villa', 'Cartagena', 'Carrera 21 #45-32', '3007654321', 'mateo.hernandez@yahoo.com'),
('1023987656', 'Santiago', 'Felipe', 'López', 'Castro', 'Barranquilla', 'Avenida San Martín #23-12', '3111234567', 'santiago.lopez@gmail.com'),
('1098765234', 'Valentina', 'María', 'Acosta', 'Ríos', 'Bogotá', 'Calle 77 #19-45', '3229876543', 'valentina.acosta@hotmail.com'),
('1109876542', 'Tomás', 'Alejandro', 'Muñoz', 'Velásquez', 'Medellín', 'Carrera 65 #87-12', '3148765432', 'tomas.munoz@gmail.com'),
('1123456789', 'Sergio', NULL, 'Castillo', 'Moreno', 'Cali', 'Calle 10 #20-45', '3201236789', 'sergio.castillo@yahoo.com'),
('1234567890', 'Julián', 'David', 'Ruiz', 'Martínez', 'Cartagena', 'Carrera 15 #30-50', '3012349876', 'julian.ruiz@gmail.com'),
('1109876321', 'Manuela', 'Cristina', 'Pérez', 'Hernández', 'Barranquilla', 'Avenida del Río #23-67', '3115678901', 'manuela.perez@hotmail.com'),
('1054321678', 'Ricardo', 'Esteban', 'Vargas', 'Ortiz', 'Bogotá', 'Calle 15 #23-78', '3002349876', 'ricardo.vargas@gmail.com'),
('1098764321', 'Juliana', 'Isabel', 'Gutiérrez', 'Salazar', 'Medellín', 'Carrera 21 #54-23', '3152345678', 'juliana.gutierrez@yahoo.com'),
('1087653210', 'Samuel', 'Andrés', 'Cárdenas', 'Villamizar', 'Cali', 'Calle 9 #14-56', '3128765432', 'samuel.cardenas@gmail.com'),
('1023456789', 'Camilo', 'José', 'Moreno', 'López', 'Cartagena', 'Carrera 12 #45-89', '3009876541', 'camilo.moreno@hotmail.com'),
('1108765432', 'Alejandra', 'Paola', 'Ramírez', 'Sánchez', 'Barranquilla', 'Avenida Murillo #21-12', '3219876543', 'alejandra.ramirez@gmail.com'),
('1039876543', 'David', 'Leonardo', 'Torres', 'Pineda', 'Bogotá', 'Calle 100 #45-67', '3126543210', 'david.torres@yahoo.com'),
('1109765432', 'Daniel', 'Alberto', 'González', 'Rico', 'Medellín', 'Carrera 34 #65-43', '3158765434', 'daniel.gonzalez@hotmail.com'),
('1023786549', 'Paula', 'Andrea', 'Ortiz', 'Rivera', 'Cali', 'Carrera 10 #54-12', '3201239876', 'paula.ortiz@gmail.com'),
('1109876423', 'Carlos', 'Javier', 'Pacheco', 'Guerrero', 'Cartagena', 'Avenida del Mar #98-65', '3016543219', 'carlos.pacheco@gmail.com'),
('1110987632', 'Sara', 'Juliana', 'García', 'Morales', 'Barranquilla', 'Carrera 15 #76-43', '3128765432', 'sara.garcia@hotmail.com'),
('1123456790', 'Fernando', 'Antonio', 'Quintero', 'López', 'Bogotá', 'Calle 50 #32-18', '3107654321', 'fernando.quintero@gmail.com'),
('1134567890', 'Marcela', 'Verónica', 'Morales', 'Hernández', 'Medellín', 'Carrera 42 #12-76', '3006785432', 'marcela.morales@yahoo.com'),
('1145678901', 'Esteban', 'Gabriel', 'Torres', 'Gómez', 'Cali', 'Calle 18 #32-54', '3209876543', 'esteban.torres@hotmail.com'),
('1156789012', 'Andrea', 'Patricia', 'Rico', 'Martínez', 'Cartagena', 'Avenida Bolívar #67-12', '3117654321', 'andrea.rico@gmail.com'),
('1167890123', 'Javier', 'Manuel', 'García', 'Salas', 'Barranquilla', 'Carrera 9 #54-32', '3138765432', 'javier.garcia@hotmail.com'),
('1178901234', 'Luisa', 'Alejandra', 'Villalobos', 'Rojas', 'Bogotá', 'Calle 77 #21-54', '3229871234', 'luisa.villalobos@gmail.com'),
('1189012345', 'Sebastián', 'Felipe', 'Trujillo', 'Ortiz', 'Medellín', 'Carrera 33 #44-65', '3147659876', 'sebastian.trujillo@yahoo.com'),
('1190123456', 'Catalina', 'Paula', 'Herrera', 'Riveros', 'Cali', 'Calle 12 #65-98', '3005436789', 'catalina.herrera@gmail.com'),
('1201234567', 'Germán', 'Ricardo', 'Arango', 'Moreno', 'Cartagena', 'Carrera 23 #54-21', '3218765432', 'german.arango@hotmail.com'),
('1212345678', 'Isabella', 'Daniela', 'Sánchez', 'López', 'Barranquilla', 'Avenida 20 de Julio #32-76', '3156785432', 'isabella.sanchez@gmail.com'),
('1223456789', 'Daniel', 'Francisco', 'Peña', 'Montes', 'Bogotá', 'Calle 18 #65-43', '3127654321', 'daniel.pena@yahoo.com'),
('1234567891', 'Mariana', 'Lucía', 'Medina', 'Ríos', 'Medellín', 'Carrera 12 #54-65', '3209871234', 'mariana.medina@gmail.com'),
('1245678910', 'Alberto', 'Jorge', 'Cano', 'Morales', 'Cali', 'Avenida San Martín #65-43', '3012347654', 'alberto.cano@hotmail.com'),
('1256789102', 'Tatiana', 'Andrea', 'Velasco', 'Quintero', 'Cartagena', 'Calle 23 #45-76', '3209876543', 'tatiana.velasco@yahoo.com'),
('1267891023', 'Francisco', 'José', 'Gómez', 'Restrepo', 'Barranquilla', 'Carrera 8 #21-45', '3115436789', 'francisco.gomez@gmail.com'),
('1278910234', 'María', 'Ángela', 'Becerra', 'Rodríguez', 'Bogotá', 'Calle 98 #76-54', '3147653210', 'maria.becerra@hotmail.com'),
('1289102345', 'Felipe', 'Arturo', 'Gutiérrez', 'Cruz', 'Medellín', 'Carrera 14 #45-32', '3009876543', 'felipe.gutierrez@gmail.com'),
('1291023456', 'Santiago', 'Ignacio', 'Vega', 'Hernández', 'Cali', 'Calle 67 #12-43', '3108765432', 'santiago.vega@yahoo.com'),
('1301234567', 'Camila', 'Sofía', 'Luna', 'Villanueva', 'Cartagena', 'Avenida Bolívar #32-12', '3226547890', 'camila.luna@gmail.com'),
('1312345678', 'Leonardo', 'Enrique', 'Mendoza', 'Pérez', 'Barranquilla', 'Calle 54 #76-21', '3189876543', 'leonardo.mendoza@hotmail.com'),
('1323456789', 'Ana', 'María', 'López', 'Salazar', 'Bogotá', 'Calle 23 #45-65', '3123456789', 'ana.lopez@yahoo.com'),
('1334567890', 'Ricardo', 'Fernando', 'Pacheco', 'Guerrero', 'Medellín', 'Carrera 18 #76-54', '3154321987', 'ricardo.pacheco@gmail.com'),
('1345678901', 'Laura', 'Victoria', 'Palacios', 'Rincón', 'Cali', 'Calle 67 #45-32', '3206549870', 'laura.palacios@hotmail.com'),
('1356789012', 'Jorge', 'Alfredo', 'Castañeda', 'Ocampo', 'Cartagena', 'Carrera 32 #54-21', '3017654329', 'jorge.castaneda@gmail.com'),
('1367890123', 'Viviana', 'Fernanda', 'Delgado', 'Montoya', 'Barranquilla', 'Avenida 30 de Agosto #21-43', '3116543210', 'viviana.delgado@hotmail.com'),
('1378901234', 'Hernán', 'Eduardo', 'Navarro', 'Arévalo', 'Bogotá', 'Calle 15 #12-45', '3205432167', 'hernan.navarro@gmail.com'),
('1389012345', 'Mónica', 'Carolina', 'Ortiz', 'Mendoza', 'Medellín', 'Carrera 20 #43-76', '3156789123', 'monica.ortiz@yahoo.com'),
('1390123456', 'Álvaro', 'Rafael', 'Pineda', 'Beltrán', 'Cali', 'Calle 25 #45-12', '3123456780', 'alvaro.pineda@hotmail.com'),
('1401234567', 'Carolina', 'Alejandra', 'Salcedo', 'Muñoz', 'Cartagena', 'Carrera 67 #23-54', '3118765432', 'carolina.salcedo@gmail.com'),
('1412345678', 'Diego', 'Antonio', 'Ramírez', 'Pérez', 'Barranquilla', 'Avenida 45 #32-21', '3009876543', 'diego.ramirez@yahoo.com'),
('1423456789', 'Juliana', 'Marcela', 'Espinosa', 'López', 'Bogotá', 'Calle 56 #12-67', '3227654321', 'juliana.espinosa@hotmail.com'),
('1434567890', 'Mauricio', 'Esteban', 'Cárdenas', 'Reyes', 'Medellín', 'Carrera 21 #54-32', '3148765432', 'mauricio.cardenas@gmail.com'),
('1445678901', 'Andrea', 'Fernanda', 'Acosta', 'Zapata', 'Cali', 'Calle 98 #76-45', '3156789120', 'andrea.acosta@yahoo.com'),
('1456789012', 'Luis', 'Carlos', 'Marín', 'Rivera', 'Cartagena', 'Carrera 76 #21-34', '3115439876', 'luis.marin@gmail.com'),
('1467890123', 'Patricia', 'Sofía', 'Vargas', 'Gómez', 'Barranquilla', 'Avenida 12 #34-65', '3229876543', 'patricia.vargas@hotmail.com'),
('1478901234', 'Camilo', 'Andrés', 'Buitrago', 'Cruz', 'Bogotá', 'Calle 45 #23-56', '3108765432', 'camilo.buitrago@gmail.com'),
('1489012345', 'Gabriela', 'Paola', 'Rodríguez', 'Moreno', 'Medellín', 'Carrera 18 #32-54', '3137654321', 'gabriela.rodriguez@yahoo.com'),
('1490123456', 'Jorge', 'Luis', 'Suárez', 'Navarro', 'Cali', 'Calle 12 #43-56', '3205432109', 'jorge.suarez@hotmail.com'),
('1501234567', 'Natalia', 'María', 'Silva', 'Ortega', 'Cartagena', 'Carrera 32 #54-65', '3009876540', 'natalia.silva@gmail.com'),
('1512345678', 'Fabián', 'Germán', 'López', 'Martínez', 'Barranquilla', 'Avenida 67 #12-34', '3186543210', 'fabian.lopez@hotmail.com'),
('1523456789', 'Claudia', 'Beatriz', 'Montoya', 'Salas', 'Bogotá', 'Calle 43 #21-65', '3115439870', 'claudia.montoya@yahoo.com'),
('1534567890', 'Alejandro', 'José', 'Peñalosa', 'Vargas', 'Medellín', 'Carrera 76 #12-45', '3123456789', 'alejandro.penalosa@gmail.com'),
('1545678901', 'Sofía', 'Isabel', 'Morales', 'Hernández', 'Cali', 'Calle 32 #65-21', '3105432167', 'sofia.morales@hotmail.com'),
('1556789012', 'Carlos', 'Eduardo', 'Arévalo', 'Rojas', 'Cartagena', 'Avenida 12 #34-56', '3228765432', 'carlos.arevalo@yahoo.com'),
('1567890123', 'Paola', 'Andrea', 'Reyes', 'Cárdenas', 'Barranquilla', 'Calle 67 #23-12', '3007654321', 'paola.reyes@gmail.com'),
('1578901234', 'Juan', 'David', 'Beltrán', 'Guzmán', 'Bogotá', 'Calle 45 #12-34', '3209876543', 'juan.beltran@hotmail.com'),
('1589012345', 'Liliana', 'Carolina', 'Rincón', 'Pérez', 'Medellín', 'Carrera 21 #43-65', '3156789102', 'liliana.rincon@yahoo.com'),
('1590123456', 'Oscar', 'Iván', 'Restrepo', 'Morales', 'Cali', 'Calle 54 #12-45', '3115432167', 'oscar.restrepo@gmail.com'),
('1601234567', 'Valeria', 'Alejandra', 'Torres', 'Riveros', 'Cartagena', 'Avenida 67 #21-54', '3129876543', 'valeria.torres@hotmail.com'),
('1612345678', 'Manuel', 'Antonio', 'Zapata', 'Cano', 'Barranquilla', 'Carrera 43 #12-34', '3227654321', 'manuel.zapata@yahoo.com'),
('1623456789', 'Fernando', 'Arturo', 'González', 'Trujillo', 'Bogotá', 'Carrera 12 #34-45', '3158765432', 'fernando.gonzalez@gmail.com'),
('1634567890', 'Laura', 'Beatriz', 'Pérez', 'López', 'Medellín', 'Calle 54 #76-12', '3106543210', 'laura.perez@hotmail.com'),
('1645678901', 'Daniel', 'Santiago', 'Castaño', 'Mendoza', 'Cali', 'Avenida 21 #45-67', '3113456789', 'daniel.castano@yahoo.com'),
('1656789012', 'María', 'Clara', 'Londoño', 'Fernández', 'Cartagena', 'Carrera 67 #12-34', '3138765432', 'maria.londono@gmail.com'),
('1667890123', 'Julián', 'Alberto', 'Hurtado', 'Paredes', 'Barranquilla', 'Calle 98 #32-21', '3225432109', 'julian.hurtado@hotmail.com'),
('1678901234', 'Isabel', 'Cristina', 'Vargas', 'Martínez', 'Bogotá', 'Avenida 32 #54-76', '3006543210', 'isabel.vargas@yahoo.com'),
('1689012345', 'Sebastián', 'Francisco', 'Quiñones', 'Arango', 'Medellín', 'Carrera 76 #32-12', '3148765432', 'sebastian.quinones@gmail.com'),
('1690123456', 'Angela', 'María', 'Ruiz', 'Rojas', 'Cali', 'Calle 43 #21-54', '3103456789', 'angela.ruiz@hotmail.com'),
('1701234567', 'Raúl', 'Eduardo', 'Nieto', 'García', 'Cartagena', 'Carrera 12 #65-43', '3159876543', 'raul.nieto@gmail.com'),
('1712345678', 'Carolina', 'Alejandra', 'Valencia', 'Díaz', 'Barranquilla', 'Avenida 45 #76-12', '3115432167', 'carolina.valencia@yahoo.com'),
('1723456789', 'Pedro', 'Julián', 'Castillo', 'Ortega', 'Bogotá', 'Calle 67 #23-45', '3008765432', 'pedro.castillo@gmail.com'),
('1734567890', 'Daniela', 'Fernanda', 'Ortiz', 'Navarro', 'Medellín', 'Carrera 43 #65-12', '3229876543', 'daniela.ortiz@hotmail.com'),
('1745678901', 'Jorge', 'Iván', 'Camargo', 'Zapata', 'Cali', 'Avenida 98 #32-21', '3123456789', 'jorge.camargo@yahoo.com'),
('1756789012', 'Sofía', 'Estefanía', 'Rojas', 'Moreno', 'Cartagena', 'Carrera 12 #45-67', '3136543210', 'sofia.rojas@gmail.com'),
('1767890123', 'Felipe', 'Andrés', 'Montes', 'Velásquez', 'Barranquilla', 'Calle 43 #21-54', '3105432167', 'felipe.montes@hotmail.com'),
('1778901234', 'Lucía', 'Cristina', 'Álvarez', 'Gómez', 'Bogotá', 'Carrera 54 #32-76', '3118765432', 'lucia.alvarez@yahoo.com'),
('1789012345', 'Esteban', 'Francisco', 'Zambrano', 'Pérez', 'Medellín', 'Calle 76 #43-12', '3149876543', 'esteban.zambrano@gmail.com'),
('1790123456', 'Mariana', 'Gabriela', 'Ríos', 'Hernández', 'Cali', 'Avenida 65 #43-21', '3003456789', 'mariana.rios@hotmail.com'),
('1801234567', 'Luis', 'Eduardo', 'Muñoz', 'Rivera', 'Cartagena', 'Carrera 32 #12-54', '3227654321', 'luis.munoz@gmail.com'),
('1812345678', 'Natalia', 'Paola', 'Beltrán', 'Cruz', 'Barranquilla', 'Calle 45 #32-76', '3156543210', 'natalia.beltran@yahoo.com');



INSERT INTO sucursales ( ciudad, direccion, celular, telefono_fijo, correo) VALUES
( 'Bogotá', 'Calle 45 #23-12', '3201234567', '6012345678', 'bogota@sucursales.co'),
( 'Medellín', 'Carrera 65 #32-45', '3159876543', '6041234567', 'medellin@sucursales.co'),
( 'Cali', 'Calle 19 #12-34', '3129876543', '6023456789', 'cali@sucursales.co'),
( 'Cartagena', 'Avenida San Martín #23-45', '3001234567', '6051234567', 'cartagena@sucursales.co'),
( 'Barranquilla', 'Carrera 54 #12-34', '3119876543', '6059876543', 'barranquilla@sucursales.co');


INSERT INTO empleados (cedula, nombre1, nombre2, apellido1, apellido2, direccion, ciudad_residencia, celular, correo, id_sucursal) VALUES
('1012345678', 'Juan', 'Carlos', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3201234567', 'juan.gomez@empresa.co', 1),
('1023456789', 'María', 'Fernanda', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3152345678', 'maria.rodriguez@empresa.co', 2),
('1034567890', 'Carlos', 'Andrés', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3123456789', 'carlos.perez@empresa.co', 3),
('1045678901', 'Ana', 'Sofía', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3002345678', 'ana.ramirez@empresa.co', 4),
('1056789012', 'Luis', 'Miguel', 'Hernández', 'Gómez', 'Carrera 54 #23-12', 'Barranquilla', '3113456789', 'luis.hernandez@empresa.co', 5),
('1067890123', 'Camila', 'Andrea', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3203456789', 'camila.ortiz@empresa.co', 1),
('1078901234', 'Mateo', 'David', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3154567890', 'mateo.garcia@empresa.co', 2),
('1089012345', 'Santiago', 'Alejandro', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3124567890', 'santiago.martinez@empresa.co', 3),
('1090123456', 'Valentina', 'Isabel', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3004567890', 'valentina.lopez@empresa.co', 4),
('1101234567', 'Tomás', 'Sebastián', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3114567890', 'tomas.zapata@empresa.co', 5),
('1112345678', 'Gabriela', 'María', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3205678901', 'gabriela.gomez@empresa.co', 1),
('1123456789', 'Daniel', 'Felipe', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3155678901', 'daniel.rodriguez@empresa.co', 2),
('1134567890', 'Lucía', 'Victoria', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3125678901', 'lucia.perez@empresa.co', 3),
('1145678901', 'Miguel', 'Ángel', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3005678901', 'miguel.ramirez@empresa.co', 4),
('1156789012', 'Sofía', 'Andrea', 'Hernández', 'Gómez', 'Carrera 54 #23-12', 'Barranquilla', '3115678901', 'sofia.hernandez@empresa.co', 5),
('1167890123', 'David', 'Alejandro', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3206789012', 'david.ortiz@empresa.co', 1),
('1178901234', 'Laura', 'Cristina', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3156789012', 'laura.garcia@empresa.co', 2),
('1189012345', 'Santiago', 'Julián', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3126789012', 'santiago.julian@empresa.co', 3),
('1190123456', 'Martín', 'Sebastián', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3006789012', 'martin.lopez@empresa.co', 4),
('1201234567', 'Valeria', 'Gabriela', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3116789012', 'valeria.zapata@empresa.co', 5),
('1212345678', 'Alejandro', 'Carlos', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3207890123', 'alejandro.gomez@empresa.co', 1),
('1223456789', 'Laura', 'Isabel', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3157890123', 'laura.rodriguez@empresa.co', 2),
('1234567890', 'Felipe', 'Andrés', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3127890123', 'felipe.perez@empresa.co', 3),
('1245678901', 'Andrea', 'Paula', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3007890123', 'andrea.ramirez@empresa.co', 4),
('1256789012', 'Camilo', 'José', 'Hernández', 'Gómez', 'Carrera 54 #23-12', 'Barranquilla', '3117890123', 'camilo.hernandez@empresa.co', 5),
('1267890123', 'Mariana', 'Sofía', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3208901234', 'mariana.ortiz@empresa.co', 1),
('1278901234', 'Esteban', 'Andrés', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3158901234', 'esteban.garcia@empresa.co', 2),
('1289012345', 'Daniela', 'Paula', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3128901234', 'daniela.martinez@empresa.co', 3),
('1290123456', 'Samuel', 'David', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3008901234', 'samuel.lopez@empresa.co', 4),
('1301234567', 'Elena', 'Victoria', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3118901234', 'elena.zapata@empresa.co', 5),
('1312345678', 'Julián', 'Sebastián', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3209012345', 'julian.gomez@empresa.co', 1),
('1323456789', 'Carolina', 'Isabel', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3159012345', 'carolina.rodriguez@empresa.co', 2),
('1334567890', 'Ricardo', 'Ángel', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3129012345', 'ricardo.perez@empresa.co', 3),
('1345678901', 'Laura', 'Andrea', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3009012345', 'laura.ramirez@empresa.co', 4),
('1356789012', 'Emilio', 'José', 'Hernández', 'Gómez', 'Carrera 54 #23-12', 'Barranquilla', '3119012345', 'emilio.hernandez@empresa.co', 5),
('1367890123', 'Manuela', 'Cristina', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3209123456', 'manuela.ortiz@empresa.co', 1),
('1378901234', 'Pablo', 'Andrés', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3159123456', 'pablo.garcia@empresa.co', 2),
('1389012345', 'Sara', 'María', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3129123456', 'sara.martinez@empresa.co', 3),
('1390123456', 'Adriana', 'Paula', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3009123456', 'adriana.lopez@empresa.co', 4),
('1401234567', 'Roberto', 'Sebastián', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3119123456', 'roberto.zapata@empresa.co', 5),
('1412345678', 'Camilo', 'Felipe', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3209234567', 'camilo.gomez@empresa.co', 1),
('1423456789', 'Natalia', 'Andrea', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3159234567', 'natalia.rodriguez@empresa.co', 2),
('1434567890', 'Andrés', 'Miguel', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3129234567', 'andres.perez@empresa.co', 3),
('1445678901', 'Sofía', 'María', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3009234567', 'sofia.ramirez@empresa.co', 4),
('1456789012', 'Mario', 'José', 'Hernández', 'Gómez', 'Carrera 54 #23-12', 'Barranquilla', '3119234567', 'mario.hernandez@empresa.co', 5),
('1467890123', 'Andrea', 'Isabel', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3209345678', 'andrea.ortiz@empresa.co', 1),
('1478901234', 'Felipe', 'David', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3159345678', 'felipe.garcia@empresa.co', 2),
('1489012345', 'Camila', 'Lucía', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3129345678', 'camila.martinez@empresa.co', 3),
('1490123456', 'Jorge', 'Miguel', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3009345678', 'jorge.lopez@empresa.co', 4),
('1501234567', 'Gabriela', 'Victoria', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3119345678', 'gabriela.zapata@empresa.co', 5),
('1512345678', 'Oscar', 'Andrés', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3209456789', 'oscar.gomez@empresa.co', 1),
('1523456789', 'Eliana', 'Fernanda', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3159456789', 'eliana.rodriguez@empresa.co', 2),
('1534567890', 'David', 'Esteban', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3129456789', 'david.esteban@empresa.co', 3),
('1545678901', 'Vanessa', 'Carolina', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3009456789', 'vanessa.ramirez@empresa.co', 4),
('1556789012', 'Juan', 'Pablo', 'Hernández', 'Gómez', 'Carrera 54 #23-12', 'Barranquilla', '3119456789', 'juan.pablo@empresa.co', 5),
('1567890123', 'Clara', 'Isabel', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3209567890', 'clara.ortiz@empresa.co', 1),
('1578901234', 'Sergio', 'Felipe', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3159567890', 'sergio.garcia@empresa.co', 2),
('1589012345', 'Valeria', 'Ana', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3129567890', 'valeria.martinez@empresa.co', 3),
('1590123456', 'Juliana', 'Cristina', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3009567890', 'juliana.lopez@empresa.co', 4),
('1601234567', 'Andrés', 'Camilo', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3119567890', 'andres.camilo@empresa.co', 5),
('1612345678', 'Isabela', 'Victoria', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3209678901', 'isabela.gomez@empresa.co', 1),
('1623456789', 'Fernando', 'David', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3159678901', 'fernando.rodriguez@empresa.co', 2),
('1634567890', 'Daniel', 'Santiago', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3129678901', 'daniel.santiago@empresa.co', 3),
('1645678901', 'Catalina', 'Gabriela', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3009678901', 'catalina.ramirez@empresa.co', 4),
('1656789012', 'Joaquín', 'Andrés', 'Hernández', 'Gómez', 'Carrera 54 #23-12', 'Barranquilla', '3119678901', 'joaquin.hernandez@empresa.co', 5),
('1667890123', 'Natalia', 'Andrea', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3209789012', 'natalia.ortiz@empresa.co', 1),
('1678901234', 'Matías', 'David', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3159789012', 'matias.garcia@empresa.co', 2),
('1689012345', 'Sara', 'Lucía', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3129789012', 'sara.martinez@empresa.co', 3),
('1690123456', 'Alejandra', 'Carolina', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3009789012', 'alejandra.lopez@empresa.co', 4),
('1701234567', 'Santiago', 'Felipe', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3119789012', 'santiago.zapata@empresa.co', 5),
('1712345678', 'Carolina', 'Isabel', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3209890123', 'carolina.gomez@empresa.co', 1),
('1723456789', 'Mauricio', 'David', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3159890123', 'mauricio.rodriguez@empresa.co', 2),
('1734567890', 'Lucía', 'Paula', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3129890123', 'lucia.perez@empresa.co', 3),
('1745678901', 'Andrea', 'Victoria', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3009890123', 'andrea.victoria@empresa.co', 4),
('1756789012', 'Camila', 'Gabriela', 'Hernández', 'Gómez', 'Carrera 54 #23-12', 'Barranquilla', '3119890123', 'camila.hernandez@empresa.co', 5),
('1767890123', 'Carlos', 'Andrés', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3209901234', 'carlos.ortiz@empresa.co', 1),
('1778901234', 'Paula', 'María', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3159901234', 'paula.garcia@empresa.co', 2),
('1789012345', 'Martín', 'David', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3129901234', 'martin.martinez@empresa.co', 3),
('1790123456', 'Claudia', 'Andrea', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3009901234', 'claudia.lopez@empresa.co', 4),
('1801234567', 'Sebastián', 'Felipe', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3119901234', 'sebastian.zapata@empresa.co', 5),
('1812345678', 'Ana', 'Lucía', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3209912345', 'ana.gomez@empresa.co', 1),
('1823456789', 'Diego', 'Mauricio', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3159912345', 'diego.rodriguez@empresa.co', 2),
('1834567890', 'Valentina', 'Sofía', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3129912345', 'valentina.perez@empresa.co', 3),
('1845678901', 'Adriana', 'Paula', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3009912345', 'adriana.ramirez@empresa.co', 4),
('1856789012', 'Lucas', 'Andrés', 'Hernández', 'Gómez', 'Carrera 54 #23-12', 'Barranquilla', '3119912345', 'lucas.hernandez@empresa.co', 5),
('1867890123', 'Mariana', 'Gabriela', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3209923456', 'mariana.ortiz@empresa.co', 1),
('1878901234', 'Francisco', 'Miguel', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3159923456', 'francisco.garcia@empresa.co', 2),
('1889012345', 'Daniela', 'Isabel', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3129923456', 'daniela.martinez@empresa.co', 3),
('1890123456', 'Juan', 'José', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3009923456', 'juan.lopez@empresa.co', 4),
('1901234567', 'Alejandra', 'Lucía', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3119923456', 'alejandra.zapata@empresa.co', 5),
('1912345678', 'Camilo', 'Felipe', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3209934567', 'camilo.gomez@empresa.co', 1),
('1923456789', 'Sara', 'Victoria', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3159934567', 'sara.rodriguez@empresa.co', 2),
('1934567890', 'Miguel', 'Ángel', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3129934567', 'miguel.perez@empresa.co', 3),
('1945678901', 'Natalia', 'Cristina', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3009934567', 'natalia.ramirez@empresa.co', 4),
('1956789012', 'Gabriel', 'José', 'Hernández', 'Gómez', 'Carrera 54 #23-12', 'Barranquilla', '3119934567', 'gabriel.hernandez@empresa.co', 5),
('1967890123', 'Laura', 'Paula', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3209945678', 'laura.ortiz@empresa.co', 1),
('1978901234', 'Felipe', 'Andrés', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3159945678', 'felipe.garcia@empresa.co', 2),
('1989012345', 'Juliana', 'María', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3129945678', 'juliana.martinez@empresa.co', 3),
('1990123456', 'Ricardo', 'David', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3009945678', 'ricardo.lopez@empresa.co', 4),
('2001234567', 'Victoria', 'Andrea', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3119945678', 'victoria.zapata@empresa.co', 5);


INSERT INTO descuentos (fecha_inicio, fecha_fin, porcentaje_descuento) VALUES
('2024-01-01', '2024-03-31', 10),
('2024-04-01', '2024-06-30', 15),
('2024-07-01', '2024-09-30', 20),
('2024-10-01', '2024-12-31', 5),
('2024-01-01', '2024-02-29', 25),
('2024-03-01', '2024-04-30', 30),
('2024-05-01', '2024-06-30', 10),
('2024-07-01', '2024-08-31', 12),
('2024-09-01', '2024-10-31', 18),
('2024-11-01', '2024-11-30', 22),
('2025-01-01', '2025-03-31', 5),
('2025-04-01', '2025-06-30', 8),
('2025-07-01', '2025-09-30', 15),
('2025-10-01', '2025-12-31', 20),
('2025-01-01', '2025-02-28', 12),
('2025-03-01', '2025-04-30', 10),
('2025-05-01', '2025-06-30', 18),
('2025-07-01', '2025-08-31', 25),
('2025-09-01', '2025-10-31', 7),
('2025-11-01', '2025-11-30', 30),
('2026-01-01', '2026-03-31', 5),
('2026-04-01', '2026-06-30', 10),
('2026-07-01', '2026-09-30', 12),
('2026-10-01', '2026-12-31', 20),
('2026-01-01', '2026-02-28', 15),
('2026-03-01', '2026-04-30', 8),
('2026-05-01', '2026-06-30', 17),
('2026-07-01', '2026-08-31', 22),
('2026-09-01', '2026-10-31', 19),
('2026-11-01', '2026-11-30', 10),
('2027-01-01', '2027-03-31', 15),
('2027-04-01', '2027-06-30', 12),
('2027-07-01', '2027-09-30', 10),
('2027-10-01', '2027-12-31', 5),
('2027-01-01', '2027-02-28', 18),
('2027-03-01', '2027-04-30', 20),
('2027-05-01', '2027-06-30', 25),
('2027-07-01', '2027-08-31', 30),
('2027-09-01', '2027-10-31', 8),
('2027-11-01', '2027-11-30', 22),
('2028-01-01', '2028-03-31', 7),
('2028-04-01', '2028-06-30', 10),
('2028-07-01', '2028-09-30', 12),
('2028-10-01', '2028-12-31', 5),
('2028-01-01', '2028-02-28', 25),
('2028-03-01', '2028-04-30', 15),
('2028-05-01', '2028-06-30', 8),
('2028-07-01', '2028-08-31', 18),
('2028-09-01', '2028-10-31', 10),
('2028-11-01', '2028-11-30', 12),
('2029-01-01', '2029-03-31', 20),
('2029-04-01', '2029-06-30', 15),
('2029-07-01', '2029-09-30', 10),
('2029-10-01', '2029-12-31', 25),
('2029-01-01', '2029-02-28', 30),
('2029-03-01', '2029-04-30', 5),
('2029-05-01', '2029-06-30', 7),
('2029-07-01', '2029-08-31', 18),
('2029-09-01', '2029-10-31', 12),
('2029-11-01', '2029-11-30', 20),
('2030-01-01', '2030-03-31', 25),
('2030-04-01', '2030-06-30', 5),
('2030-07-01', '2030-09-30', 12),
('2030-10-01', '2030-12-31', 15),
('2030-01-01', '2030-02-28', 20),
('2030-03-01', '2030-04-30', 25),
('2030-05-01', '2030-06-30', 7),
('2030-07-01', '2030-08-31', 10),
('2030-09-01', '2030-10-31', 8),
('2030-11-01', '2030-11-30', 22),
('2031-01-01', '2031-03-31', 12),
('2031-04-01', '2031-06-30', 15),
('2031-07-01', '2031-09-30', 10),
('2031-10-01', '2031-12-31', 20),
('2031-01-01', '2031-02-28', 5),
('2031-03-01', '2031-04-30', 30),
('2031-05-01', '2031-06-30', 12),
('2031-07-01', '2031-08-31', 7),
('2031-09-01', '2031-10-31', 18),
('2031-11-01', '2031-11-30', 25),
('2032-01-01', '2032-03-31', 10),
('2032-04-01', '2032-06-30', 22),
('2032-07-01', '2032-09-30', 5),
('2032-10-01', '2032-12-31', 15),
('2032-01-01', '2032-02-28', 30),
('2032-03-01', '2032-04-30', 20),
('2032-05-01', '2032-06-30', 8),
('2032-07-01', '2032-08-31', 12),
('2032-09-01', '2032-10-31', 25),
('2032-11-01', '2032-11-30', 7),
('2033-01-01', '2033-03-31', 18),
('2033-04-01', '2033-06-30', 10),
('2033-07-01', '2033-09-30', 5),
('2033-10-01', '2033-12-31', 12),
('2033-01-01', '2033-02-28', 22),
('2033-03-01', '2033-04-30', 30),
('2033-05-01', '2033-06-30', 10),
('2033-07-01', '2033-08-31', 25),
('2033-09-01', '2033-10-31', 18),
('2033-11-01', '2033-11-30', 5);

INSERT INTO tipo_vehiculo (tipo_vehiculo, id_descuento) VALUES
( 'Sedán', 1),       -- Descuento 20%
('SUV', 2),         -- Descuento 15%
('Camioneta', 3),   -- Descuento 10%
( 'Coupé', 4),       -- Descuento 25%
('Convertible', 5), -- Descuento 30%
( 'Hatchback', 6),   -- Descuento 5%
( 'Minivan', 7),     -- Descuento 7%
('Pick-up', 8),     -- Descuento 18%
( 'Deportivo', 9),   -- Descuento 12%
( 'Furgoneta', 10), -- Descuento 20%
( 'Eléctrico', 11), -- Descuento 25%
( 'Híbrido', 12),   -- Descuento 5%
( 'Camión', 13),    -- Descuento 22%
( 'Monovolumen', 14); -- Descuento 7%


INSERT INTO vehiculos (placa, referencia, capacidad, sunroof, puertas, modelo, motor, color, id_tipo_vehiculo) VALUES
('ABC123', 'Sedán 2023', '5', 'Sí', '4', 'Sedán Turbo', '2.0', 'Negro', 1),
('DEF456', 'SUV 2022', '7', 'Sí', '5', 'SUV Familiar', '3.0', 'Blanco', 2),
('GHI789', 'Camioneta 2023', '5', 'No', '4', 'Camioneta Off-Road', '3.5', 'Rojo', 3),
('JKL012', 'Coupé 2024', '4', 'Sí', '2', 'Coupé Deportivo', '2.5', 'Azul', 4),
('MNO345', 'Convertible 2023', '2', 'Sí', '2', 'Convertible Turbo', '3.0', 'Plata', 5),
('PQR678', 'Hatchback 2024', '5', 'No', '4', 'Hatchback Eco', '1.8', 'Verde', 6),
('STU901', 'Minivan 2023', '7', 'Sí', '5', 'Minivan Familiar', '2.5', 'Gris', 7),
('VWX234', 'Pick-up 2024', '2', 'Sí', '2', 'Pick-up Turbo', '4.0', 'Negro', 8),
('YZA567', 'Deportivo 2024', '2', 'Sí', '2', 'Deportivo X', '3.2', 'Rojo', 9),
('BCD890', 'Furgoneta 2023', '2', 'No', '4', 'Furgoneta Carga', '2.2', 'Blanco', 10),
('EFG123', 'Eléctrico 2024', '5', 'Sí', '4', 'Eléctrico Power', '0', 'Azul', 11),
('HIJ456', 'Híbrido 2023', '5', 'Sí', '4', 'Híbrido Eco', '2.0', 'Verde', 12),
('KLM789', 'Camión 2023', '2', 'No', '2', 'Camión Grande', '6.5', 'Amarillo', 13),
('NOP012', 'Monovolumen 2024', '7', 'Sí', '5', 'Monovolumen Familiar', '2.8', 'Naranja', 14),
('ABC124', 'Sedán 2023', '5', 'Sí', '4', 'Sedán Lux', '2.3', 'Blanco', 1),
('DEF457', 'SUV 2023', '7', 'No', '5', 'SUV Adventure', '3.1', 'Negro', 2),
('GHI790', 'Camioneta 2022', '5', 'No', '4', 'Camioneta Work', '3.3', 'Azul', 3),
('JKL013', 'Coupé 2024', '4', 'Sí', '2', 'Coupé Classic', '2.4', 'Gris', 4),
('MNO346', 'Convertible 2023', '2', 'Sí', '2', 'Convertible Sport', '3.1', 'Negro', 5),
('PQR679', 'Hatchback 2024', '5', 'No', '4', 'Hatchback Turbo', '1.9', 'Rojo', 6),
('STU902', 'Minivan 2023', '7', 'Sí', '5', 'Minivan City', '2.6', 'Blanco', 7),
('VWX235', 'Pick-up 2024', '2', 'Sí', '2', 'Pick-up Pro', '4.1', 'Gris', 8),
('YZA568', 'Deportivo 2024', '2', 'Sí', '2', 'Deportivo R', '3.3', 'Verde', 9),
('BCD891', 'Furgoneta 2023', '2', 'No', '4', 'Furgoneta Eco', '2.1', 'Amarillo', 10),
('EFG124', 'Eléctrico 2024', '5', 'Sí', '4', 'Eléctrico Speed', '0', 'Blanco', 11),
('HIJ457', 'Híbrido 2023', '5', 'Sí', '4', 'Híbrido Max', '2.2', 'Gris', 12),
('KLM790', 'Camión 2023', '2', 'No', '2', 'Camión Power', '7.0', 'Rojo', 13),
('NOP013', 'Monovolumen 2023', '7', 'Sí', '5', 'Monovolumen Max', '3.0', 'Azul', 14),
('ABC125', 'Sedán 2023', '5', 'Sí', '4', 'Sedán Sport', '2.0', 'Rojo', 1),
('DEF458', 'SUV 2022', '7', 'Sí', '5', 'SUV Comfort', '3.2', 'Plata', 2),
('GHI791', 'Camioneta 2024', '5', 'No', '4', 'Camioneta Work 4x4', '3.7', 'Blanco', 3),
('JKL014', 'Coupé 2024', '4', 'Sí', '2', 'Coupé Sport', '2.6', 'Negro', 4),
('MNO347', 'Convertible 2023', '2', 'Sí', '2', 'Convertible Speed', '3.2', 'Rojo', 5),
('PQR680', 'Hatchback 2023', '5', 'No', '4', 'Hatchback Style', '1.9', 'Plata', 6),
('STU903', 'Minivan 2023', '7', 'Sí', '5', 'Minivan Plus', '2.7', 'Gris', 7),
('VWX236', 'Pick-up 2024', '2', 'Sí', '2', 'Pick-up Sport', '4.2', 'Naranja', 8),
('YZA569', 'Deportivo 2024', '2', 'Sí', '2', 'Deportivo Turbo', '3.5', 'Azul', 9),
('BCD892', 'Furgoneta 2023', '2', 'No', '4', 'Furgoneta Max', '2.3', 'Verde', 10),
('EFG125', 'Eléctrico 2024', '5', 'Sí', '4', 'Eléctrico Evo', '0', 'Naranja', 11),
('HIJ458', 'Híbrido 2023', '5', 'Sí', '4', 'Híbrido Sport', '2.3', 'Negro', 12),
('KLM791', 'Camión 2023', '2', 'No', '2', 'Camión XL', '6.8', 'Blanco', 13),
('NOP014', 'Monovolumen 2024', '7', 'Sí', '5', 'Monovolumen Family', '2.9', 'Rojo', 14),
('ABC126', 'Sedán 2023', '5', 'Sí', '4', 'Sedán Pro', '2.1', 'Azul', 1),
('DEF459', 'SUV 2024', '7', 'Sí', '5', 'SUV High', '3.4', 'Verde', 2),
('GHI792', 'Camioneta 2023', '5', 'No', '4', 'Camioneta City', '3.1', 'Rojo', 3),
('JKL015', 'Coupé 2024', '4', 'Sí', '2', 'Coupé Luxe', '2.7', 'Gris', 4),
('MNO348', 'Convertible 2023', '2', 'Sí', '2', 'Convertible X', '3.0', 'Blanco', 5),
('PQR681', 'Hatchback 2023', '5', 'No', '4', 'Hatchback Sport', '2.0', 'Rojo', 6),
('STU904', 'Minivan 2023', '7', 'Sí', '5', 'Minivan Family', '2.8', 'Gris', 7),
('VWX237', 'Pick-up 2024', '2', 'Sí', '2', 'Pick-up Max', '4.0', 'Negro', 8),
('YZA570', 'Deportivo 2023', '2', 'Sí', '2', 'Deportivo Sport', '3.4', 'Verde', 9),
('BCD893', 'Furgoneta 2024', '2', 'No', '4', 'Furgoneta Power', '2.4', 'Naranja', 10),
('EFG126', 'Eléctrico 2023', '5', 'Sí', '4', 'Eléctrico Pro', '0', 'Azul', 11),
('HIJ459', 'Híbrido 2024', '5', 'Sí', '4', 'Híbrido Max', '2.5', 'Negro', 12),
('KLM792', 'Camión 2024', '2', 'No', '2', 'Camión Turbo', '7.5', 'Blanco', 13),
('NOP015', 'Monovolumen 2024', '7', 'Sí', '5', 'Monovolumen Premium', '3.5', 'Rojo', 14),
('ABC127', 'Sedán 2024', '5', 'Sí', '4', 'Sedán Plus', '2.2', 'Plata', 1),
('DEF460', 'SUV 2024', '7', 'Sí', '5', 'SUV High End', '3.8', 'Azul', 2),
('GHI793', 'Camioneta 2023', '5', 'No', '4', 'Camioneta Plus', '3.4', 'Plata', 3),
('JKL016', 'Coupé 2023', '4', 'Sí', '2', 'Coupé GT', '2.9', 'Negro', 4),
('MNO349', 'Convertible 2024', '2', 'Sí', '2', 'Convertible R', '3.3', 'Verde', 5),
('PQR682', 'Hatchback 2024', '5', 'No', '4', 'Hatchback X', '2.4', 'Rojo', 6),
('STU905', 'Minivan 2024', '7', 'Sí', '5', 'Minivan Deluxe', '3.0', 'Gris', 7),
('VWX238', 'Pick-up 2023', '2', 'Sí', '2', 'Pick-up Super', '4.5', 'Blanco', 8),
('YZA571', 'Deportivo 2024', '2', 'Sí', '2', 'Deportivo X', '3.6', 'Azul', 9),
('BCD894', 'Furgoneta 2023', '2', 'No', '4', 'Furgoneta XL', '2.5', 'Naranja', 10),
('EFG127', 'Eléctrico 2024', '5', 'Sí', '4', 'Eléctrico Speed Pro', '0', 'Rojo', 11),
('HIJ460', 'Híbrido 2024', '5', 'Sí', '4', 'Híbrido Sport', '2.6', 'Plata', 12),
('KLM793', 'Camión 2024', '2', 'No', '2', 'Camión Heavy', '8.0', 'Verde', 13),
('NOP016', 'Monovolumen 2024', '7', 'Sí', '5', 'Monovolumen Urban', '3.4', 'Blanco', 14),
('ABC128', 'Sedán 2024', '5', 'Sí', '4', 'Sedán Elite', '2.3', 'Negro', 1),
('DEF461', 'SUV 2024', '7', 'Sí', '5', 'SUV Sport', '3.6', 'Rojo', 2),
('GHI794', 'Camioneta 2024', '5', 'No', '4', 'Camioneta Sport', '3.7', 'Negro', 3),
('JKL017', 'Coupé 2024', '4', 'Sí', '2', 'Coupé Super', '3.1', 'Blanco', 4),
('MNO350', 'Convertible 2024', '2', 'Sí', '2', 'Convertible GTR', '3.5', 'Azul', 5),
('PQR683', 'Hatchback 2024', '5', 'No', '4', 'Hatchback Sport', '2.6', 'Rojo', 6),
('STU906', 'Minivan 2024', '7', 'Sí', '5', 'Minivan Premium', '3.3', 'Gris', 7),
('VWX239', 'Pick-up 2024', '2', 'Sí', '2', 'Pick-up Work', '4.3', 'Blanco', 8),
('YZA572', 'Deportivo 2024', '2', 'Sí', '2', 'Deportivo X2', '3.8', 'Verde', 9),
('BCD895', 'Furgoneta 2024', '2', 'No', '4', 'Furgoneta Cargo', '2.7', 'Naranja', 10),
('EFG128', 'Eléctrico 2024', '5', 'Sí', '4', 'Eléctrico Ultra', '0', 'Plata', 11),
('HIJ461', 'Híbrido 2024', '5', 'Sí', '4', 'Híbrido Sport Plus', '2.7', 'Azul', 12),
('KLM794', 'Camión 2024', '2', 'No', '2', 'Camión Power', '7.8', 'Negro', 13),
('NOP017', 'Monovolumen 2024', '7', 'Sí', '5', 'Monovolumen Sport', '3.7', 'Rojo', 14),
('ABC129', 'Sedán 2024', '5', 'Sí', '4', 'Sedán Super', '2.5', 'Plata', 1),
('DEF462', 'SUV 2024', '7', 'Sí', '5', 'SUV Extreme', '3.9', 'Azul', 2),
('GHI795', 'Camioneta 2024', '5', 'No', '4', 'Camioneta Work', '3.5', 'Plata', 3),
('JKL018', 'Coupé 2024', '4', 'Sí', '2', 'Coupé Turbo', '3.0', 'Rojo', 4),
('MNO351', 'Convertible 2024', '2', 'Sí', '2', 'Convertible Pro', '3.7', 'Negro', 5),
('PQR684', 'Hatchback 2024', '5', 'No', '4', 'Hatchback Turbo', '2.7', 'Blanco', 6),
('STU907', 'Minivan 2024', '7', 'Sí', '5', 'Minivan Eco', '3.2', 'Verde', 7),
('VWX240', 'Pick-up 2024', '2', 'Sí', '2', 'Pick-up Premium', '4.6', 'Rojo', 8),
('YZA573', 'Deportivo 2024', '2', 'Sí', '2', 'Deportivo Elite', '3.9', 'Negro', 9),
('BCD896', 'Furgoneta 2024', '2', 'No', '4', 'Furgoneta Mini', '2.9', 'Naranja', 10),
('EFG129', 'Eléctrico 2024', '5', 'Sí', '4', 'Eléctrico Turbo', '0', 'Rojo', 11),
('HIJ462', 'Híbrido 2024', '5', 'Sí', '4', 'Híbrido Luxury', '2.8', 'Blanco', 12),
('KLM795', 'Camión 2024', '2', 'No', '2', 'Camión Elite', '7.5', 'Gris', 13),
('NOP018', 'Monovolumen 2024', '7', 'Sí', '5', 'Monovolumen Eco', '3.4', 'Negro', 14),
('ABC130', 'Sedán 2024', '5', 'Sí', '4', 'Sedán Sport', '2.6', 'Verde', 1),
('DEF463', 'SUV 2024', '7', 'Sí', '5', 'SUV Luxury', '3.8', 'Gris', 2);



-- Primer bloque (1 al 25)
INSERT INTO alquileres (alquiler_semana, alquiler_dia, id_sucursal_salida, fecha_salida, id_sucursal_llegada, fecha_esperada, fecha_llegada, id_cliente, id_empleado, id_vehiculo, valor_cotizado, valor_pagado, id_descuento) VALUES
(700000, 120000, 1, '2024-01-15', 3, '2024-01-22', '2024-01-21', 1, 1, 1, 840000, 820000, 1),
(650000, 115000, 2, '2024-01-18', 4, '2024-01-25', NULL, 2, 2, 2, 780000, 750000, 2),
(720000, 130000, 3, '2024-01-20', 5, '2024-01-27', '2024-01-26', 3, 3, 3, 860000, 830000, 3),
(680000, 125000, 4, '2024-01-22', 1, '2024-01-29', '2024-01-28', 4, 4, 4, 810000, 800000, 4),
(690000, 118000, 5, '2024-01-24', 2, '2024-01-31', NULL, 5, 5, 5, 830000, 820000, 5),
(720000, 128000, 1, '2024-01-26', 3, '2024-02-02', '2024-02-01', 6, 6, 6, 850000, 830000, 6),
(750000, 135000, 2, '2024-01-28', 4, '2024-02-04', NULL, 7, 7, 7, 880000, 870000, 7),
(760000, 138000, 3, '2024-01-30', 5, '2024-02-06', '2024-02-05', 8, 8, 8, 900000, 890000, 8),
(700000, 120000, 4, '2024-02-01', 1, '2024-02-08', '2024-02-07', 9, 9, 9, 850000, 840000, 9),
(670000, 115000, 5, '2024-02-03', 2, '2024-02-10', NULL, 10, 10, 10, 820000, 810000, 10),
(720000, 125000, 1, '2024-02-05', 3, '2024-02-12', '2024-02-11', 11, 11, 11, 860000, 850000, 11),
(690000, 122000, 2, '2024-02-07', 4, '2024-02-14', '2024-02-13', 12, 12, 12, 850000, 830000, 12),
(740000, 130000, 3, '2024-02-09', 5, '2024-02-16', NULL, 13, 13, 13, 880000, 870000, 13),
(710000, 123000, 4, '2024-02-11', 1, '2024-02-18', '2024-02-17', 14, 14, 14, 840000, 830000, 14),
(700000, 121000, 5, '2024-02-13', 2, '2024-02-20', NULL, 15, 15, 15, 850000, 830000, 15),
(730000, 128000, 1, '2024-02-15', 3, '2024-02-22', '2024-02-21', 16, 16, 16, 870000, 860000, 16),
(750000, 135000, 2, '2024-02-17', 4, '2024-02-24', NULL, 17, 17, 17, 890000, 880000, 17),
(760000, 140000, 3, '2024-02-19', 5, '2024-02-26', '2024-02-25', 18, 18, 18, 910000, 900000, 18),
(690000, 118000, 4, '2024-02-21', 1, '2024-02-28', '2024-02-27', 19, 19, 19, 850000, 840000, 19),
(720000, 125000, 5, '2024-02-23', 2, '2024-03-01', NULL, 20, 20, 20, 880000, 860000, 20),
(760000, 138000, 1, '2024-02-25', 3, '2024-03-04', '2024-03-03', 21, 21, 21, 920000, 910000, 21),
(750000, 135000, 2, '2024-02-27', 4, '2024-03-06', NULL, 22, 22, 22, 890000, 880000, 22),
(720000, 130000, 3, '2024-02-29', 5, '2024-03-07', '2024-03-06', 23, 23, 23, 880000, 870000, 23),
(740000, 132000, 4, '2024-03-02', 1, '2024-03-09', '2024-03-08', 24, 24, 24, 890000, 880000, 24),
(760000, 140000, 5, '2024-03-04', 2, '2024-03-11', NULL, 25, 25, 25, 910000, 900000, 25),
(700000, 120000, 1, '2024-03-06', 3, '2024-03-13', '2024-03-12', 26, 26, 26, 850000, 840000, 26),
(670000, 115000, 2, '2024-03-08', 4, '2024-03-15', NULL, 27, 27, 27, 820000, 810000, 27),
(730000, 128000, 3, '2024-03-10', 5, '2024-03-17', '2024-03-16', 28, 28, 28, 870000, 860000, 28),
(750000, 135000, 4, '2024-03-12', 1, '2024-03-19', '2024-03-18', 29, 29, 29, 890000, 880000, 29),
(760000, 138000, 5, '2024-03-14', 2, '2024-03-21', NULL, 30, 30, 30, 910000, 900000, 30),
(720000, 130000, 1, '2024-03-16', 3, '2024-03-23', '2024-03-22', 31, 31, 31, 880000, 870000, 31),
(740000, 132000, 2, '2024-03-18', 4, '2024-03-25', NULL, 32, 32, 32, 890000, 880000, 32),
(760000, 140000, 3, '2024-03-20', 5, '2024-03-27', '2024-03-26', 33, 33, 33, 920000, 910000, 33),
(750000, 135000, 4, '2024-03-22', 1, '2024-03-29', NULL, 34, 34, 34, 890000, 880000, 34),
(720000, 125000, 5, '2024-03-24', 2, '2024-03-31', '2024-03-30', 35, 35, 35, 860000, 850000, 35),
(700000, 120000, 1, '2024-03-26', 3, '2024-04-02', '2024-04-01', 36, 36, 36, 840000, 820000, 36),
(670000, 115000, 2, '2024-03-28', 4, '2024-04-04', NULL, 37, 37, 37, 820000, 810000, 37),
(720000, 130000, 3, '2024-03-30', 5, '2024-04-06', '2024-04-05', 38, 38, 38, 860000, 850000, 38),
(690000, 122000, 4, '2024-04-01', 1, '2024-04-08', '2024-04-07', 39, 39, 39, 850000, 830000, 39),
(740000, 128000, 5, '2024-04-03', 2, '2024-04-10', NULL, 40, 40, 40, 880000, 870000, 40),
(710000, 120000, 1, '2024-04-05', 3, '2024-04-12', '2024-04-11', 41, 41, 41, 850000, 840000, 41),
(750000, 135000, 2, '2024-04-07', 4, '2024-04-14', NULL, 42, 42, 42, 880000, 870000, 42),
(760000, 140000, 3, '2024-04-09', 5, '2024-04-16', '2024-04-15', 43, 43, 43, 910000, 900000, 43),
(750000, 133000, 4, '2024-04-11', 1, '2024-04-18', '2024-04-17', 44, 44, 44, 890000, 880000, 44),
(740000, 132000, 5, '2024-04-13', 2, '2024-04-20', NULL, 45, 45, 45, 880000, 860000, 45),
(760000, 140000, 1, '2024-04-15', 3, '2024-04-22', '2024-04-21', 46, 46, 46, 920000, 910000, 46),
(730000, 135000, 2, '2024-04-17', 4, '2024-04-24', NULL, 47, 47, 47, 890000, 880000, 47),
(710000, 130000, 3, '2024-04-19', 5, '2024-04-26', '2024-04-25', 48, 48, 48, 850000, 840000, 48),
(720000, 128000, 4, '2024-04-21', 1, '2024-04-28', NULL, 49, 49, 49, 860000, 850000, 49),
(740000, 132000, 5, '2024-04-23', 2, '2024-04-30', '2024-04-29', 50, 50, 50, 880000, 870000, 50),
(760000, 140000, 1, '2024-04-25', 3, '2024-05-02', NULL, 51, 51, 51, 910000, 900000, 51),
(750000, 135000, 2, '2024-04-27', 4, '2024-05-04', '2024-05-03', 52, 52, 52, 890000, 880000, 52),
(730000, 130000, 3, '2024-04-29', 5, '2024-05-06', '2024-05-05', 53, 53, 53, 860000, 850000, 53),
(740000, 132000, 4, '2024-05-01', 1, '2024-05-08', '2024-05-07', 54, 54, 54, 880000, 870000, 54),
(760000, 140000, 5, '2024-05-03', 2, '2024-05-10', NULL, 55, 55, 55, 910000, 900000, 55),
(730000, 135000, 1, '2024-05-05', 3, '2024-05-12', '2024-05-11', 56, 56, 56, 880000, 870000, 56),
(710000, 128000, 2, '2024-05-07', 4, '2024-05-14', NULL, 57, 57, 57, 850000, 840000, 57),
(720000, 130000, 3, '2024-05-09', 5, '2024-05-16', '2024-05-15', 58, 58, 58, 860000, 850000, 58),
(750000, 135000, 4, '2024-05-11', 1, '2024-05-18', '2024-05-17', 59, 59, 59, 890000, 880000, 59),
(760000, 140000, 5, '2024-05-13', 2, '2024-05-20', NULL, 60, 60, 60, 910000, 900000, 60),
(730000, 130000, 1, '2024-05-15', 3, '2024-05-22', '2024-05-21', 61, 61, 61, 860000, 850000, 61),
(740000, 132000, 2, '2024-05-17', 4, '2024-05-24', NULL, 62, 62, 62, 880000, 870000, 62),
(750000, 135000, 3, '2024-05-19', 5, '2024-05-26', '2024-05-25', 63, 63, 63, 890000, 880000, 63),
(720000, 128000, 4, '2024-05-21', 1, '2024-05-28', '2024-05-27', 64, 64, 64, 860000, 850000, 64),
(710000, 130000, 5, '2024-05-23', 2, '2024-05-30', NULL, 65, 65, 65, 850000, 840000, 65),
(740000, 132000, 1, '2024-05-25', 3, '2024-06-01', '2024-05-31', 66, 66, 66, 880000, 870000, 66),
(760000, 140000, 2, '2024-05-27', 4, '2024-06-03', NULL, 67, 67, 67, 910000, 900000, 67),
(730000, 135000, 3, '2024-05-29', 5, '2024-06-05', '2024-06-04', 68, 68, 68, 880000, 870000, 68),
(750000, 130000, 4, '2024-05-31', 1, '2024-06-07', NULL, 69, 69, 69, 890000, 880000, 69),
(720000, 128000, 5, '2024-06-02', 2, '2024-06-09', '2024-06-08', 70, 70, 70, 860000, 850000, 70),
(740000, 132000, 1, '2024-06-04', 3, '2024-06-11', '2024-06-10', 71, 71, 71, 880000, 870000, 71),
(750000, 135000, 2, '2024-06-06', 4, '2024-06-13', NULL, 72, 72, 72, 890000, 880000, 72),
(730000, 130000, 3, '2024-06-08', 5, '2024-06-15', '2024-06-14', 73, 73, 73, 860000, 850000, 73),
(720000, 128000, 4, '2024-06-10', 1, '2024-06-17', '2024-06-16', 74, 74, 74, 860000, 850000, 74),
(740000, 132000, 5, '2024-06-12', 2, '2024-06-19', NULL, 75, 75, 75, 880000, 870000, 75),
(760000, 140000, 1, '2024-06-14', 3, '2024-06-21', '2024-06-20', 76, 76, 76, 910000, 900000, 76),
(750000, 135000, 2, '2024-06-16', 4, '2024-06-23', NULL, 77, 77, 77, 890000, 880000, 77),
(730000, 130000, 3, '2024-06-18', 5, '2024-06-25', '2024-06-24', 78, 78, 78, 860000, 850000, 78),
(740000, 132000, 4, '2024-06-20', 1, '2024-06-27', NULL, 79, 79, 79, 880000, 870000, 79),
(760000, 140000, 5, '2024-06-22', 2, '2024-06-29', '2024-06-28', 80, 80, 80, 910000, 900000, 80),
(750000, 135000, 1, '2024-06-24', 3, '2024-07-01', NULL, 81, 81, 81, 890000, 880000, 81),
(730000, 130000, 2, '2024-06-26', 4, '2024-07-03', NULL, 82, 82, 82, 860000, 850000, 82),
(740000, 132000, 3, '2024-06-28', 5, '2024-07-05', '2024-07-04', 83, 83, 83, 880000, 870000, 83),
(760000, 140000, 4, '2024-06-30', 1, '2024-07-07', NULL, 84, 84, 84, 910000, 900000, 84),
(750000, 135000, 5, '2024-07-02', 2, '2024-07-09', '2024-07-08', 85, 85, 85, 890000, 880000, 85),
(730000, 130000, 1, '2024-07-04', 3, '2024-07-11', '2024-07-10', 86, 86, 86, 860000, 850000, 86),
(740000, 132000, 2, '2024-07-06', 4, '2024-07-13', NULL, 87, 87, 87, 880000, 870000, 87),
(760000, 140000, 3, '2024-07-08', 5, '2024-07-15', NULL, 88, 88, 88, 910000, 900000, 88),
(730000, 135000, 4, '2024-07-10', 1, '2024-07-17', '2024-07-16', 89, 89, 89, 880000, 870000, 89),
(750000, 130000, 5, '2024-07-12', 2, '2024-07-19', NULL, 90, 90, 90, 890000, 880000, 90),
(740000, 132000, 1, '2024-07-14', 3, '2024-07-21', NULL, 91, 91, 91, 880000, 870000, 91),
(750000, 135000, 2, '2024-07-16', 4, '2024-07-23', '2024-07-22', 92, 92, 92, 890000, 880000, 92),
(730000, 130000, 3, '2024-07-18', 5, '2024-07-25', NULL, 93, 93, 93, 860000, 850000, 93),
(740000, 132000, 4, '2024-07-20', 1, '2024-07-27', '2024-07-26', 94, 94, 94, 880000, 870000, 94),
(760000, 140000, 5, '2024-07-22', 2, '2024-07-29', NULL, 95, 95, 95, 910000, 900000, 95),
(750000, 135000, 1, '2024-07-24', 3, '2024-07-31', '2024-07-30', 96, 96, 96, 890000, 880000, 96),
(730000, 130000, 2, '2024-07-26', 4, '2024-08-02', NULL, 97, 97, 97, 860000, 850000, 97),
(740000, 132000, 3, '2024-07-28', 5, '2024-08-04', '2024-08-03', 98, 98, 98, 880000, 870000, 98),
(760000, 140000, 4, '2024-07-30', 1, '2024-08-06', NULL, 99, 99, 99, 910000, 900000, 99),
(750000, 135000, 5, '2024-08-01', 2, '2024-08-08', '2024-08-07', 100, 100, 100, 890000, 880000, 100);



INSERT INTO retraso (dias_retraso, porcentaje_dias, id_alquiler) VALUES
(2, 10, 1),
(NULL, NULL, 2),
(1, 5, 3),
(NULL, NULL, 4),
(3, 15, 5),
(2, 10, 6),
(NULL, NULL, 7),
(0, 0, 8),
(NULL, NULL, 9),
(5, 25, 10),
(NULL, NULL, 11),
(4, 20, 12),
(NULL, NULL, 13),
(1, 5, 14),
(NULL, NULL, 15),
(3, 15, 16),
(NULL, NULL, 17),
(0, 0, 18),
(6, 30, 19),
(NULL, NULL, 20),
(2, 10, 21),
(NULL, NULL, 22),
(4, 20, 23),
(NULL, NULL, 24),
(1, 5, 25),
(NULL, NULL, 26),
(5, 25, 27),
(NULL, NULL, 28),
(3, 15, 29),
(NULL, NULL, 30),
(0, 0, 31),
(NULL, NULL, 32),
(2, 10, 33),
(NULL, NULL, 34),
(4, 20, 35),
(NULL, NULL, 36),
(1, 5, 37),
(NULL, NULL, 38),
(3, 15, 39),
(NULL, NULL, 40),
(6, 30, 41),
(NULL, NULL, 42),
(0, 0, 43),
(NULL, NULL, 44),
(5, 25, 45),
(NULL, NULL, 46),
(2, 10, 47),
(NULL, NULL, 48),
(4, 20, 49),
(NULL, NULL, 50),
(1, 5, 51),
(NULL, NULL, 52),
(3, 15, 53),
(NULL, NULL, 54),
(6, 30, 55),
(NULL, NULL, 56),
(0, 0, 57),
(NULL, NULL, 58),
(2, 10, 59),
(NULL, NULL, 60),
(4, 20, 61),
(NULL, NULL, 62),
(1, 5, 63),
(NULL, NULL, 64),
(3, 15, 65),
(NULL, NULL, 66),
(5, 25, 67),
(NULL, NULL, 68),
(2, 10, 69),
(NULL, NULL, 70),
(4, 20, 71),
(NULL, NULL, 72),
(1, 5, 73),
(NULL, NULL, 74),
(3, 15, 75),
(NULL, NULL, 76),
(6, 30, 77),
(NULL, NULL, 78),
(0, 0, 79),
(NULL, NULL, 80),
(5, 25, 81),
(NULL, NULL, 82),
(2, 10, 83),
(NULL, NULL, 84),
(4, 20, 85),
(NULL, NULL, 86),
(1, 5, 87),
(NULL, NULL, 88),
(3, 15, 89),
(NULL, NULL, 90),
(6, 30, 91),
(NULL, NULL, 92),
(0, 0, 93),
(NULL, NULL, 94),
(2, 10, 95),
(NULL, NULL, 96),
(4, 20, 97),
(NULL, NULL, 98),
(1, 5, 99),
(NULL, NULL, 100);




-- 1 ver todos los clientes
select * from clientes;

-- 2 ver los clientes que no tienen segundo nombre
select * from clientes where nombre2 is null;

-- 3 ver los clientes que solo tienen primer apellido
select * from clientes where nombre1 is not null;

-- 4 contar cuantos clientes hay en la ciudad de Bogota
select distinct count(*) from clientes where ciudad_residencia = 'Bogota';


-- 5 clientes con al menos un dia de retraso
select c.nombre1, c.nombre2, c.apellido1, c.apellido2, a.fecha_salida, r.dias_retraso
from clientes c
join alquileres a ON c.id = a.id_cliente
join retraso r ON a.id = r.id_alquiler
where r.dias_retraso >=1;

-- 6 empleados que pertenecen a la sucursal 'Medellin'
select e.nombre1, e.nombre2, e.apellido1, e.apellido2, s.ciudad
from empleados e
join sucursales s ON e.id_sucursal = s.id
where s.ciudad = 'Medellín';


-- 7 los vehículos que tienen un descuento del 20%.
select v.placa, v.referencia, v.modelo, t.tipo_vehiculo, d.porcentaje_descuento
from vehiculos v
join tipo_vehiculo t ON v.id_tipo_vehiculo = t.id
join descuentos d ON t.id_descuento = d.id
where d.porcentaje_descuento = 20;

-- 8 vehiculos de color Rojo
select v.placa, v.modelo, v.color
from vehiculos v
where v.color = 'Rojo';


-- 9 cantidad de alquilesres por cliente
select c.nombre1, c.apellido1, COUNT(a.id) AS total_alquileres
from clientes c
join alquileres a ON c.id = a.id_cliente
group by c.id;


-- 10 vehiculos disponibles en la sucursal Bogota
select v.placa, v.modelo, v.color, s.ciudad
from vehiculos v
join alquileres a ON v.id = a.id_vehiculo
join sucursales s ON a.id_sucursal_salida = s.id
where s.ciudad = 'Bogotá';

-- 11 clientes sin dias de retrasos
SELECT c.nombre1, c.nombre2, c.apellido1, c.apellido2
FROM clientes c
LEFT JOIN alquileres a ON c.id = a.id_cliente
LEFT JOIN retraso r ON a.id = r.id_alquiler
WHERE r.dias_retraso IS NULL;

-- 12 ver descuento aplicado para las camionetas
SELECT v.modelo, v.color, d.porcentaje_descuento
FROM vehiculos v
JOIN tipo_vehiculo t ON v.id_tipo_vehiculo = t.id
JOIN descuentos d ON t.id_descuento = d.id
WHERE t.tipo_vehiculo = 'Camioneta';


-- 13 ver descuentos para todos los tipos de vehiculos ordenados por porcentaje de menos a mayor
SELECT v.modelo, v.color, d.porcentaje_descuento
FROM vehiculos v
JOIN tipo_vehiculo t ON v.id_tipo_vehiculo = t.id
JOIN descuentos d ON t.id_descuento = d.id order by 3 asc;

-- 14 contar cuantos vehiculos tienen 4 puertas
select count(*) from vehiculos where puertas = 4;

-- 15 cuantos tipos de descuento hay en los vehiculos ordenado de mayor a menor
select distinct porcentaje_descuento from descuentos order by 1 desc;


-- 16 vehiculo que ha alquilado un cliente con id 10
select c.id, c.nombre1, v.* from vehiculos v
join alquileres a on v.id = a.id_vehiculo
join clientes c on c.id  = a.id_cliente where c.id = 10;

-- 17 empleados asignados a clientes con apellido Rodriguez
select e.*, c.* from empleados e
join alquileres a on e.id = a.id_empleado
join clientes c on c.id = a.id_cliente where c.apellido1 = 'Rodriguez' ;

-- 18 clientes con alquileres entre 500000 y 800000
select c.*, a.valor_pagado from clientes c
join alquileres a on c.id = a.id_cliente where a.valor_pagado between 500000 and 800000;

-- 19 empleados con apellidos Perez que trabajan en la sucursal Cali
select e.* from empleados e
join alquileres a on e.id = a.id_empleado
join sucursales s on s.id = a.id_sucursal_salida where e.apellido1 = 'Perez' and s.ciudad = 'Cali';

-- 20 cliente con numero de cedula  1012456789
select * from clientes where cedula = 1012456789;

-- 21 clientes que no tienen segundo nombre
select * from clientes where nombre2 is null;

-- 22 contar los clientes que tengas el mismo nombre Carlos
select count(*) from clientes where nombre1 = 'Carlos';

-- 23 ver la sucursal del empleado con el id 85
select e.*, s.ciudad from empleados e
left join alquileres a on e.id = a.id_empleado
join sucursales s on s.id = a.id_sucursal_salida where e.id = 85;

-- 24 ordenar por orden alfadetico los clientes por el primer nombre
select nombre1, nombre2, apellido1, apellido2 from clientes order by 1 asc;

-- 25 listar cantidad de empleados por sucursales
select distinct s.ciudad,  count(e.id)  from empleados e
join alquileres a on e.id = a.id_empleado
join sucursales s on s.id = a.id_sucursal_salida group by 1;

-- 1 funcion para contar la cantidad de clientes existentes
delimiter //
create function contar_clientes()
returns int deterministic
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM clientes;
    RETURN total;
END //
delimiter ;

select contar_clientes() as clientes;


-- 2 funcion para mostrar vehiculos de color verde
delimiter //
create function contar_vehiculos_verdes()
RETURNS INT deterministic
BEGIN
    DECLARE verde INT;
    SELECT COUNT(*) INTO verde FROM vehiculos where color = 'Verde';
    RETURN verde;
END //
delimiter ;

select contar_vehiculos_verdes() as color;



-- 3 funcion para determinar el porcentaje de descuento total a un cliente
delimiter //
create function calcular_descuento_cliente(cliente_id int)
returns int deterministic
begin
    declare descuento_total INT ;
    
    
    SELECT SUM(d.porcentaje_descuento)
    INTO descuento_total
    FROM alquileres a
    JOIN tipo_vehiculo t ON a.id_vehiculo = t.id
    JOIN descuentos d ON t.id_descuento = d.id
    WHERE a.id_cliente = cliente_id;
    
    RETURN descuento_total;
END //
delimiter ;

select calcular_descuento_cliente(10) AS descuento_total_cliente;

-- 4 funcion para sumar el total de todas los alquileres
delimiter //
create function valor_total_pagado()
returns int deterministic
begin
    declare valor_total INT ;
    
    
    SELECT SUM(a.valor_pagado)
    INTO valor_total
    FROM alquileres a
    WHERE a.valor_pagado;
    
    RETURN valor_total;
END //
delimiter ;

select valor_total_pagado() as valor_total_pagado;

-- 5 diferencia de valor cotizado y valor pagado
delimiter //
create function diferencia_total_pagada(valor_cotizado int, valor_pagado int)
returns int deterministic
begin
    declare diferencia INT ;
    
    
    set diferencia = valor_cotizado - valor_pagado;
   
    
    RETURN diferencia;
END //
delimiter ;


select diferencia_total_pagada(valor_cotizado, valor_pagado) as diferencia_pagada from alquileres;


-- 1 Insertar nuevo cliente
delimiter //
create procedure insertarCliente(in cedula_in varchar(45), nombre1_in varchar(30), nombre2_in varchar(30), apellido1_in varchar(30), apellido2_in varchar(30), ciudad_residencia_in varchar(45), direccion_in varchar(200), celular_in varchar(45), correo_in varchar(45))
begin
insert into clientes(cedula, nombre1, nombre2, apellido1, apellido2, ciudad_residencia, direccion, celular, correo) values (cedula_in, nombre1_in, nombre2_in, apellido1_in, apellido2_in, ciudad_residencia_in, direccion_in, celular_in, correo_in);
end
// delimiter ;

call insertarCliente('1022345670', 'Wilmer', 'Alexander', 'Rojas', 'Fuentes', 'Bogotá', 'Calle 15A #08-98', '3185503428', 'wilmer7522@gmail.com');

select * from clientes where nombre1 = 'Wilmer';

-- 2 eliminar un registro de un vehiculo
DELIMITER //

CREATE PROCEDURE eliminar_vehiculo(IN id_vehiculo_in INT)
BEGIN
    -- Verificar si el vehículo existe en la tabla
    IF EXISTS (SELECT 1 FROM vehiculos v JOIN alquileres a ON v.id = a.id_vehiculo WHERE v.id = id_vehiculo_in) THEN
        -- Eliminar primero los registros de la tabla retraso relacionados con el alquiler
        DELETE FROM retraso WHERE id_alquiler IN (SELECT id FROM alquileres WHERE id_vehiculo = id_vehiculo_in);

        -- Eliminar los registros en alquileres
        DELETE FROM alquileres WHERE id_vehiculo = id_vehiculo_in;

        -- Eliminar el vehículo de la tabla vehiculos
        DELETE FROM vehiculos WHERE id = id_vehiculo_in;

        -- Mensaje de éxito
        SELECT CONCAT('Vehículo con ID ', id_vehiculo_in, ' ha sido eliminado.') AS mensaje;
    ELSE
        -- Si no existe, mostrar un mensaje de error
        SELECT 'Vehículo no encontrado.' AS mensaje_error;
    END IF;
END //

DELIMITER ;



CALL eliminar_vehiculo(200);

select a.id_vehiculo, v.id from vehiculos v
join alquileres a on v.id = a.id_vehiculo order by 1 asc;


-- 3 eliminar un cliente

DELIMITER //
CREATE PROCEDURE eliminar_clientes(IN id_cliente_in INT)
BEGIN
    
    IF EXISTS (SELECT 1 from alquileres WHERE id_cliente = id_cliente_in) THEN
    
     DELETE FROM retraso WHERE id_alquiler IN (SELECT id FROM alquileres WHERE id_cliente = id_cliente_in);
        
        delete from alquileres WHERE id_cliente = id_cliente_in;
        
        DELETE FROM clientes WHERE id = id_cliente_in;
    
        
        SELECT CONCAT('Cliente con ID ', id_cliente_in, ' ha sido eliminado.') AS mensaje;
    ELSE
        
        SELECT 'Cliente no encontrado.' AS mensaje_error;
    END IF;
END //
DELIMITER ;

describe alquileres;

call eliminar_clientes(1);

select * from clientes;

-- 4 Actualizar ciudad de residencia de un empleado
delimiter //
create procedure actualizar_Residencia(id_empleado_in int, nueva_residencia varchar(45))
begin
	IF EXISTS (SELECT 1 from empleados WHERE id = id_empleado_in) THEN
    
		update empleados
		set ciudad_residencia = nueva_residencia
		where id = id_empleado_in;
    
		select concat('Residencia de empleado ', id_empleado_in, ' actualizada a ', nueva_residencia) as mensaje;
    
	else
		select 'Empleado no encontrado' as Mensaje_error;
	end if;
end //
delimiter ;

select * from empleados;

call actualizar_residencia(1, 'Medellin');

-- 6 cambiar sucursal de empleado
delimiter //
create procedure actualizar_Sucursal(id_empleado_in int, nueva_sucursal int)
begin
	IF EXISTS (SELECT 1 from empleados WHERE id = id_empleado_in) THEN
    
		update empleados
		set id_sucursal = nueva_sucursal
		where id = id_empleado_in;
    
		select concat('Sucursal de empleado ', id_empleado_in, ' actualizada a ', nueva_sucursal) as mensaje;
    
	else
		select 'Empleado no encontrado' as Mensaje_error;
	end if;
end //
delimiter ;

	call actualizar_Sucursal(102, 2);
    
select * from empleados;

-- 7 agregar una nueva sucursal
delimiter //
create procedure agregar_Sucursal(ciudad_in varchar(45) , direccion_in varchar(200), celular_in varchar(45), telefono_fijo_in varchar(45), correo_in varchar(45))
begin
	insert into sucursales(ciudad, direccion, celular, telefono_fijo, correo) values (ciudad_in, direccion_in, celular_in, telefono_fijo_in, correo_in);
end //
delimiter ;

call agregar_Sucursal('Tibú', 'Barrio Miraflores calle 10 #05-18','3152234487', null, 'tibu@gmail.com');
select * from sucursales;


select * from alquileres a
join retraso r on a.id = r.id_alquiler;

-- 8 agregar empleado
delimiter //
create procedure agregar_Empleado(cedula_in varchar(45), nombre1_in varchar(45), nombre2_in varchar(45), apellido1_in varchar(45),
 apellido2_in varchar(45), direccion_in varchar(45), ciudad_residencia_in varchar(45), celular_in varchar(45), correo_in varchar(45), id_sucursal_in int)
 begin
    insert into empleados (cedula, nombre1, nombre2, apellido1, apellido2, direccion, ciudad_residencia, celular, correo, id_sucursal) values (cedula_in, nombre1_in, nombre2_in, apellido1_in, apellido2_in, direccion_in, ciudad_residencia_in, celular_in, correo_in, id_sucursal_in );
end //
delimiter ;

 call agregar_Empleado('1016811445', 'Yessica', 'Andrea', 'Perez', 'Machuca', 'Calle 18A #30-25', 'Bogotá', '3118530131', 'yesssica@gmail.com', 1);
 select * from empleados;
 
 -- 9 modificar telefono de cliente
 
 