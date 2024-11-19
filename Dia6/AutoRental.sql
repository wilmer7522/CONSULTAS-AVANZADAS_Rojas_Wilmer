drop database if exists autorental;
create database autorental;
use autorental;

create table clientes(
id int primary key,
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
id int primary key,
ciudad varchar(45) not null,
direccion varchar(200) not null,
celular varchar(45) not null,
telefono_fijo varchar(45) null,
correo varchar(45) null
);

create table empleados(
id int primary key,
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
id int primary key,
fecha_inicio date null,
fecha_fin date null,
porcentaje_descuento int null
);

create table tipo_vehiculo(
id int primary key,
tipo_vehiculo varchar(45) not null,
id_descuento int,
foreign key (id_descuento) references descuentos (id)
);

create table vehiculos(
id int primary key,
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
id int primary key,
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
id int primary key,
dias_retraso int null,
porcentaje_dias int null,
id_alquiler int,
foreign key (id_alquiler) references alquileres (id));

INSERT INTO clientes (id, cedula, nombre1, nombre2, apellido1, apellido2, ciudad_residencia, direccion, celular, correo) VALUES
(1, '1012345678', 'Carlos', 'Andrés', 'Rodríguez', 'Pérez', 'Bogotá', 'Calle 45A #12-30', '3005129876', 'carlos.rodriguez@hotmail.com'),
(2, '1045789234', 'Laura', NULL, 'Gómez', 'Quintero', 'Medellín', 'Carrera 52 #84-23', '3102569834', 'laura.gomez@gmail.com'),
(3, '1234985678', 'Miguel', 'Ángel', 'Restrepo', 'Torres', 'Cali', 'Calle 9 #25-14', '3129876543', 'miguel.angel@hotmail.com'),
(4, '1054321987', 'Sofía', NULL, 'Martínez', 'Ruiz', 'Cartagena', 'Avenida Venezuela #10-45', '3201234598', 'sofia.martinez@yahoo.com'),
(5, '1098765432', 'Andrés', 'Felipe', 'Castaño', 'Ramírez', 'Barranquilla', 'Carrera 43 #65-32', '3114567890', 'andres.felipe@gmail.com'),
(6, '1012456789', 'Juan', 'Sebastián', 'Jiménez', 'Hernández', 'Bogotá', 'Calle 22 #45-67', '3007896541', 'juan.jimenez@hotmail.com'),
(7, '1087654321', 'Diana', 'Marcela', 'Fernández', 'López', 'Medellín', 'Carrera 12 #54-98', '3158765432', 'diana.fernandez@yahoo.com'),
(8, '1109876543', 'Luis', 'Alberto', 'Ospina', 'Montoya', 'Cali', 'Calle 72 #18-32', '3129874321', 'luis.ospina@gmail.com'),
(9, '1110987654', 'Camila', 'Andrea', 'Mejía', 'Cruz', 'Cartagena', 'Avenida del Lago #4-20', '3006549871', 'camila.mejia@hotmail.com'),
(10, '1012987654', 'Felipe', NULL, 'Zapata', 'García', 'Barranquilla', 'Carrera 8 #65-54', '3189876543', 'felipe.zapata@gmail.com'),
(11, '1023987654', 'Natalia', 'Paola', 'Rojas', 'Mendoza', 'Bogotá', 'Calle 30 #50-89', '3201236548', 'natalia.rojas@yahoo.com'),
(12, '1056789123', 'Andrés', 'Julián', 'Arango', 'Restrepo', 'Medellín', 'Carrera 48 #90-23', '3137896543', 'andres.arango@hotmail.com'),
(13, '1023987653', 'Laura', 'Vanessa', 'Cruz', 'Santos', 'Cali', 'Calle 8 #44-76', '3216547890', 'laura.cruz@gmail.com'),
(14, '1056789213', 'Mateo', 'Daniel', 'Hernández', 'Villa', 'Cartagena', 'Carrera 21 #45-32', '3007654321', 'mateo.hernandez@yahoo.com'),
(15, '1023987656', 'Santiago', 'Felipe', 'López', 'Castro', 'Barranquilla', 'Avenida San Martín #23-12', '3111234567', 'santiago.lopez@gmail.com'),
(16, '1098765234', 'Valentina', 'María', 'Acosta', 'Ríos', 'Bogotá', 'Calle 77 #19-45', '3229876543', 'valentina.acosta@hotmail.com'),
(17, '1109876542', 'Tomás', 'Alejandro', 'Muñoz', 'Velásquez', 'Medellín', 'Carrera 65 #87-12', '3148765432', 'tomas.munoz@gmail.com'),
(18, '1123456789', 'Sergio', NULL, 'Castillo', 'Moreno', 'Cali', 'Calle 10 #20-45', '3201236789', 'sergio.castillo@yahoo.com'),
(19, '1234567890', 'Julián', 'David', 'Ruiz', 'Martínez', 'Cartagena', 'Carrera 15 #30-50', '3012349876', 'julian.ruiz@gmail.com'),
(20, '1109876321', 'Manuela', 'Cristina', 'Pérez', 'Hernández', 'Barranquilla', 'Avenida del Río #23-67', '3115678901', 'manuela.perez@hotmail.com'),
(21, '1054321678', 'Ricardo', 'Esteban', 'Vargas', 'Ortiz', 'Bogotá', 'Calle 15 #23-78', '3002349876', 'ricardo.vargas@gmail.com'),
(22, '1098764321', 'Juliana', 'Isabel', 'Gutiérrez', 'Salazar', 'Medellín', 'Carrera 21 #54-23', '3152345678', 'juliana.gutierrez@yahoo.com'),
(23, '1087653210', 'Samuel', 'Andrés', 'Cárdenas', 'Villamizar', 'Cali', 'Calle 9 #14-56', '3128765432', 'samuel.cardenas@gmail.com'),
(24, '1023456789', 'Camilo', 'José', 'Moreno', 'López', 'Cartagena', 'Carrera 12 #45-89', '3009876541', 'camilo.moreno@hotmail.com'),
(25, '1108765432', 'Alejandra', 'Paola', 'Ramírez', 'Sánchez', 'Barranquilla', 'Avenida Murillo #21-12', '3219876543', 'alejandra.ramirez@gmail.com'),
(26, '1039876543', 'David', 'Leonardo', 'Torres', 'Pineda', 'Bogotá', 'Calle 100 #45-67', '3126543210', 'david.torres@yahoo.com'),
(27, '1109765432', 'Daniel', 'Alberto', 'González', 'Rico', 'Medellín', 'Carrera 34 #65-43', '3158765434', 'daniel.gonzalez@hotmail.com'),
(28, '1023786549', 'Paula', 'Andrea', 'Ortiz', 'Rivera', 'Cali', 'Carrera 10 #54-12', '3201239876', 'paula.ortiz@gmail.com'),
(29, '1109876423', 'Carlos', 'Javier', 'Pacheco', 'Guerrero', 'Cartagena', 'Avenida del Mar #98-65', '3016543219', 'carlos.pacheco@gmail.com'),
(30, '1110987632', 'Sara', 'Juliana', 'García', 'Morales', 'Barranquilla', 'Carrera 15 #76-43', '3128765432', 'sara.garcia@hotmail.com'),
(31, '1098765321', 'Felipe', 'Andrés', 'Jiménez', 'López', 'Bogotá', 'Calle 99 #21-32', '3207654321', 'felipe.jimenez@yahoo.com'),
(32, '1109875234', 'Camila', 'Sofía', 'Guzmán', 'Restrepo', 'Medellín', 'Carrera 43 #65-12', '3156543210', 'camila.guzman@hotmail.com'),
(33, '1098765123', 'Valeria', 'Mariana', 'Cruz', 'González', 'Cali', 'Calle 34 #65-89', '3134567890', 'valeria.cruz@gmail.com'),
(34, '1023456123', 'Jorge', 'Enrique', 'López', 'Quintero', 'Cartagena', 'Carrera 3 #54-76', '3009876543', 'jorge.lopez@gmail.com'),
(35, '1109874213', 'Sebastián', 'Daniel', 'Ruiz', 'Mendoza', 'Barranquilla', 'Avenida Las Américas #21-87', '3119876540', 'sebastian.ruiz@hotmail.com'),
(36, '1023456124', 'Juan', 'David', 'Ramírez', 'Moreno', 'Bogotá', 'Calle 77 #34-12', '3128765432', 'juan.ramirez@gmail.com'),
(37, '1109873123', 'Ana', 'Isabel', 'Salazar', 'Rojas', 'Medellín', 'Carrera 87 #23-45', '3151239876', 'ana.salazar@hotmail.com'),
(38, '1023456012', 'Mateo', 'Alejandro', 'Vélez', 'Mejía', 'Cali', 'Calle 19 #43-23', '3219876542', 'mateo.velez@gmail.com'),
(39, '1109872012', 'Isabela', 'Victoria', 'Cárdenas', 'Rodríguez', 'Cartagena', 'Carrera 12 #65-32', '3008765432', 'isabela.cardenas@hotmail.com'),
(40, '1098765432', 'Lucía', 'Gabriela', 'Hernández', 'López', 'Barranquilla', 'Carrera 21 #65-32', '3116549876', 'lucia.hernandez@gmail.com'),
(41, '1123456789', 'Santiago', 'Tomás', 'Vargas', 'García', 'Bogotá', 'Calle 100 #21-43', '3208765432', 'santiago.vargas@hotmail.com'),
(42, '1109876321', 'David', 'Fernando', 'Gutiérrez', 'Quintero', 'Medellín', 'Carrera 34 #87-23', '3159876543', 'david.gutierrez@gmail.com'),
(43, '1098764213', 'María', 'Camila', 'Ortiz', 'Ruiz', 'Cali', 'Calle 45 #12-76', '3129875432', 'maria.ortiz@hotmail.com'),
(44, '1109875312', 'Natalia', 'Andrea', 'Restrepo', 'López', 'Cartagena', 'Carrera 12 #32-45', '3201239876', 'natalia.restrepo@gmail.com'),
(45, '1098765321', 'Luis', 'Miguel', 'Sánchez', 'Rojas', 'Barranquilla', 'Avenida del Río #43-54', '3117654321', 'luis.sanchez@hotmail.com'),
(46, '1023456234', 'Javier', 'Alejandro', 'Morales', 'Pineda', 'Bogotá', 'Calle 55 #67-23', '3009876543', 'javier.morales@gmail.com'),
(47, '1109876432', 'Camila', 'Sofía', 'Vargas', 'Rico', 'Medellín', 'Carrera 12 #65-32', '3158765432', 'camila.vargas@hotmail.com'),
(48, '1098764321', 'Tomás', 'Julián', 'López', 'Quintero', 'Cali', 'Calle 19 #23-12', '3139876543', 'tomas.lopez@gmail.com'),
(49, '1023456012', 'Alejandro', 'David', 'Hernández', 'Castaño', 'Cartagena', 'Carrera 5 #12-45', '3012345678', 'alejandro.hernandez@gmail.com'),
(50, '1109874231', 'Juliana', 'Isabel', 'Castaño', 'López', 'Barranquilla', 'Avenida San Martín #23-45', '3119876543', 'juliana.castano@hotmail.com'),
(51, '1109876423', 'Carlos', 'Enrique', 'Ramírez', 'Martínez', 'Bogotá', 'Calle 22 #45-76', '3201239876', 'carlos.ramirez@gmail.com'),
(52, '1110987654', 'Laura', 'Paola', 'García', 'Rico', 'Medellín', 'Carrera 11 #65-23', '3152345678', 'laura.garcia@hotmail.com'),
(53, '1087654321', 'Felipe', 'David', 'Mejía', 'Restrepo', 'Cali', 'Calle 4 #12-43', '3129876543', 'felipe.mejia@gmail.com'),
(54, '1023456345', 'Ana', 'Carolina', 'Quintero', 'López', 'Cartagena', 'Avenida Venezuela #12-34', '3001239876', 'ana.quintero@gmail.com'),
(55, '1110987321', 'Daniel', 'Alejandro', 'Zapata', 'Hernández', 'Barranquilla', 'Carrera 76 #43-21', '3117654321', 'daniel.zapata@hotmail.com'),
(56, '1109874213', 'Laura', 'Isabel', 'Sánchez', 'Gómez', 'Bogotá', 'Calle 45 #21-23', '3208765432', 'laura.sanchez@gmail.com'),
(57, '1098764321', 'Santiago', 'Tomás', 'Pérez', 'Quintero', 'Medellín', 'Carrera 12 #76-43', '3159876543', 'santiago.perez@hotmail.com'),
(58, '1109873123', 'Carolina', 'María', 'Ramírez', 'Santos', 'Cali', 'Calle 65 #43-12', '3139876543', 'carolina.ramirez@gmail.com'),
(59, '1098763214', 'Sebastián', 'Julián', 'Castro', 'García', 'Cartagena', 'Carrera 32 #21-43', '3012349876', 'sebastian.castro@hotmail.com'),
(60, '1109874321', 'Tomás', 'Miguel', 'González', 'Ortiz', 'Barranquilla', 'Avenida 68 #32-45', '3119876543', 'tomas.gonzalez@gmail.com'),
(61, '1109876432', 'Sofía', 'Isabel', 'Sánchez', 'Pineda', 'Bogotá', 'Calle 12 #43-65', '3201238765', 'sofia.sanchez@hotmail.com'),
(62, '1098765123', 'Juan', 'Pablo', 'Gómez', 'Restrepo', 'Medellín', 'Carrera 23 #65-32', '3159871234', 'juan.gomez@gmail.com'),
(63, '1110987321', 'Camilo', 'Daniel', 'Rojas', 'Santos', 'Cali', 'Calle 65 #23-12', '3129876543', 'camilo.rojas@hotmail.com'),
(64, '1109874312', 'Valeria', 'Juliana', 'Muñoz', 'Quintero', 'Cartagena', 'Carrera 32 #12-34', '3009876543', 'valeria.munoz@gmail.com'),
(65, '1098765213', 'Carlos', 'Felipe', 'Vargas', 'Martínez', 'Barranquilla', 'Carrera 87 #43-21', '3117654321', 'carlos.vargas@hotmail.com'),
(66, '1109873124', 'Alejandra', 'Paola', 'Gutiérrez', 'Ortiz', 'Bogotá', 'Calle 99 #34-12', '3207654321', 'alejandra.gutierrez@gmail.com'),
(67, '1098765432', 'Tomás', 'Andrés', 'López', 'Moreno', 'Medellín', 'Carrera 54 #12-34', '3159871234', 'tomas.lopez@hotmail.com'),
(68, '1109876342', 'Daniel', 'Alejandro', 'Gómez', 'Santos', 'Cali', 'Calle 45 #23-45', '3139876543', 'daniel.gomez@gmail.com'),
(69, '1110987234', 'Valentina', 'María', 'Ruiz', 'Quintero', 'Cartagena', 'Carrera 3 #12-34', '3019876543', 'valentina.ruiz@gmail.com'),
(70, '1109873123', 'David', 'Esteban', 'Pérez', 'Restrepo', 'Barranquilla', 'Avenida Las Américas #32-65', '3118765432', 'david.perez@hotmail.com'),
(71, '1098765234', 'Juliana', 'Sofía', 'Ramírez', 'Santos', 'Bogotá', 'Calle 76 #32-12', '3209876543', 'juliana.ramirez@gmail.com'),
(72, '1098764321', 'Felipe', 'Alonso', 'Mejía', 'Sánchez', 'Medellín', 'Carrera 23 #12-45', '3156543210', 'felipe.mejia@gmail.com'),
(73, '1109876432', 'Carlos', 'Alejandro', 'Quintero', 'García', 'Cali', 'Calle 54 #65-32', '3139874321', 'carlos.quintero@hotmail.com'),
(74, '1098765432', 'Ana', 'Isabel', 'Santos', 'López', 'Cartagena', 'Carrera 23 #12-34', '3008765432', 'ana.santos@gmail.com'),
(75, '1109874321', 'Sofía', 'Gabriela', 'Ortiz', 'Quintero', 'Barranquilla', 'Carrera 43 #65-12', '3116549876', 'sofia.ortiz@hotmail.com'),
(76, '1098765432', 'Mateo', 'Julián', 'Vargas', 'Pérez', 'Bogotá', 'Calle 22 #32-45', '3201237654', 'mateo.vargas@gmail.com'),
(77, '1110987213', 'Daniel', 'Santiago', 'Restrepo', 'González', 'Medellín', 'Carrera 76 #43-21', '3157654321', 'daniel.restrepo@gmail.com'),
(78, '1109876543', 'Valentina', 'María', 'Rodríguez', 'Mejía', 'Cali', 'Calle 76 #21-43', '3128765432', 'valentina.rodriguez@gmail.com'),
(79, '1098765321', 'Juan', 'Felipe', 'García', 'Sánchez', 'Cartagena', 'Avenida Venezuela #12-34', '3001238765', 'juan.garcia@hotmail.com'),
(80, '1109874213', 'Ana', 'Cristina', 'Castaño', 'Rico', 'Barranquilla', 'Carrera 12 #34-45', '3119875432', 'ana.castano@gmail.com'),
(81, '1109876345', 'Felipe', 'David', 'Zapata', 'Moreno', 'Bogotá', 'Calle 65 #23-12', '3201236547', 'felipe.zapata@hotmail.com'),
(82, '1098765432', 'Santiago', 'Daniel', 'Sánchez', 'Ortiz', 'Medellín', 'Carrera 45 #32-65', '3159876543', 'santiago.sanchez@gmail.com'),
(83, '1109873214', 'Mateo', 'Alejandro', 'Quintero', 'Mejía', 'Cali', 'Calle 65 #12-34', '3139876543', 'mateo.quintero@hotmail.com'),
(84, '1110987432', 'Camila', 'Isabel', 'Ruiz', 'Gómez', 'Cartagena', 'Carrera 23 #12-45', '3019876543', 'camila.ruiz@gmail.com'),
(85, '1109876432', 'Luis', 'Miguel', 'Ortiz', 'Hernández', 'Barranquilla', 'Carrera 87 #43-21', '3119875432', 'luis.ortiz@hotmail.com'),
(86, '1109873123', 'Juliana', 'Sofía', 'Zapata', 'Gómez', 'Bogotá', 'Calle 76 #32-12', '3208765432', 'juliana.zapata@gmail.com'),
(87, '1098765432', 'Felipe', 'David', 'López', 'Pineda', 'Medellín', 'Carrera 45 #32-12', '3156549876', 'felipe.lopez@gmail.com'),
(88, '1109876432', 'Santiago', 'Alejandro', 'Gómez', 'Rico', 'Cali', 'Calle 54 #23-12', '3129876543', 'santiago.gomez@gmail.com'),
(89, '1098765432', 'Daniel', 'Alejandro', 'Hernández', 'Rojas', 'Cartagena', 'Carrera 23 #12-34', '3001237654', 'daniel.hernandez@hotmail.com'),
(90, '1109874321', 'Lucía', 'Sofía', 'Ortiz', 'González', 'Barranquilla', 'Carrera 43 #65-12', '3118765432', 'lucia.ortiz@gmail.com'),
(91, '1109876123', 'Mateo', 'Alejandro', 'García', 'Restrepo', 'Bogotá', 'Calle 32 #65-21', '3209875432', 'mateo.garcia@hotmail.com'),
(92, '1098764321', 'Valeria', 'Sofía', 'Ruiz', 'Pineda', 'Medellín', 'Carrera 12 #43-65', '3159875432', 'valeria.ruiz@hotmail.com'),
(93, '1109874321', 'Juan', 'David', 'Sánchez', 'Ortiz', 'Cali', 'Calle 12 #34-23', '3129876543', 'juan.sanchez@gmail.com'),
(94, '1110987654', 'Tomás', 'Alejandro', 'Rodríguez', 'Morales', 'Cartagena', 'Carrera 21 #43-12', '3019875432', 'tomas.rodriguez@gmail.com'),
(95, '1109876321', 'Lucía', 'Gabriela', 'López', 'Santos', 'Barranquilla', 'Carrera 12 #65-23', '3117654321', 'lucia.lopez@hotmail.com'),
(96, '1109876432', 'Felipe', 'David', 'Vargas', 'Hernández', 'Bogotá', 'Calle 45 #32-65', '3207654321', 'felipe.vargas@gmail.com'),
(97, '1098765432', 'Ana', 'María', 'Restrepo', 'Gómez', 'Medellín', 'Carrera 45 #32-12', '3159876543', 'ana.restrepo@gmail.com'),
(98, '1109876432', 'Mateo', 'Santiago', 'Gutiérrez', 'Rojas', 'Cali', 'Calle 65 #12-34', '3129876543', 'mateo.gutierrez@hotmail.com'),
(99, '1098765432', 'Juliana', 'Sofía', 'Ortiz', 'González', 'Cartagena', 'Carrera 23 #12-45', '3001239876', 'juliana.ortiz@gmail.com'),
(100, '1109876432', 'Tomás', 'Andrés', 'Gómez', 'Santos', 'Barranquilla', 'Carrera 87 #32-65', '3118765432', 'tomas.gomez@gmail.com');


INSERT INTO sucursales (id, ciudad, direccion, celular, telefono_fijo, correo) VALUES
(1, 'Bogotá', 'Calle 45 #23-12', '3201234567', '6012345678', 'bogota@sucursales.co'),
(2, 'Medellín', 'Carrera 65 #32-45', '3159876543', '6041234567', 'medellin@sucursales.co'),
(3, 'Cali', 'Calle 19 #12-34', '3129876543', '6023456789', 'cali@sucursales.co'),
(4, 'Cartagena', 'Avenida San Martín #23-45', '3001234567', '6051234567', 'cartagena@sucursales.co'),
(5, 'Barranquilla', 'Carrera 54 #12-34', '3119876543', '6059876543', 'barranquilla@sucursales.co');


INSERT INTO empleados (id, cedula, nombre1, nombre2, apellido1, apellido2, direccion, ciudad_residencia, celular, correo, id_sucursal) VALUES
(1, '1012345678', 'Juan', 'Carlos', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3201234567', 'juan.gomez@empresa.co', 1),
(2, '1023456789', 'María', 'Fernanda', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3152345678', 'maria.rodriguez@empresa.co', 2),
(3, '1034567890', 'Carlos', 'Andrés', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3123456789', 'carlos.perez@empresa.co', 3),
(4, '1045678901', 'Ana', 'Sofía', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3002345678', 'ana.ramirez@empresa.co', 4),
(5, '1056789012', 'Luis', 'Miguel', 'Hernández', 'Gómez', 'Carrera 54 #23-12', 'Barranquilla', '3113456789', 'luis.hernandez@empresa.co', 5),
(6, '1067890123', 'Camila', 'Andrea', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3203456789', 'camila.ortiz@empresa.co', 1),
(7, '1078901234', 'Mateo', 'David', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3154567890', 'mateo.garcia@empresa.co', 2),
(8, '1089012345', 'Santiago', 'Alejandro', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3124567890', 'santiago.martinez@empresa.co', 3),
(9, '1090123456', 'Valentina', 'Isabel', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3004567890', 'valentina.lopez@empresa.co', 4),
(10, '1101234567', 'Tomás', 'Sebastián', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3114567890', 'tomas.zapata@empresa.co', 5),
(11, '1112345678', 'Gabriela', 'María', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3205678901', 'gabriela.gomez@empresa.co', 1),
(12, '1123456789', 'Daniel', 'Felipe', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3155678901', 'daniel.rodriguez@empresa.co', 2),
(13, '1134567890', 'Lucía', 'Victoria', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3125678901', 'lucia.perez@empresa.co', 3),
(14, '1145678901', 'Miguel', 'Ángel', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3005678901', 'miguel.ramirez@empresa.co', 4),
(15, '1156789012', 'Sofía', 'Andrea', 'Hernández', 'Gómez', 'Carrera 54 #23-12', 'Barranquilla', '3115678901', 'sofia.hernandez@empresa.co', 5),
(16, '1167890123', 'David', 'Alejandro', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3206789012', 'david.ortiz@empresa.co', 1),
(17, '1178901234', 'Laura', 'Cristina', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3156789012', 'laura.garcia@empresa.co', 2),
(18, '1189012345', 'Santiago', 'Julián', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3126789012', 'santiago.julian@empresa.co', 3),
(19, '1190123456', 'Martín', 'Sebastián', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3006789012', 'martin.lopez@empresa.co', 4),
(20, '1201234567', 'Valeria', 'Gabriela', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3116789012', 'valeria.zapata@empresa.co', 5),
(21, '1212345678', 'Alejandro', 'Carlos', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3207890123', 'alejandro.gomez@empresa.co', 1),
(22, '1223456789', 'Laura', 'Isabel', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3157890123', 'laura.rodriguez@empresa.co', 2),
(23, '1234567890', 'Felipe', 'Andrés', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3127890123', 'felipe.perez@empresa.co', 3),
(24, '1245678901', 'Andrea', 'Paula', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3007890123', 'andrea.ramirez@empresa.co', 4),
(25, '1256789012', 'Camilo', 'José', 'Hernández', 'Gómez', 'Carrera 54 #23-12', 'Barranquilla', '3117890123', 'camilo.hernandez@empresa.co', 5),
(26, '1267890123', 'Isabel', 'Cristina', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3208901234', 'isabel.ortiz@empresa.co', 1),
(27, '1278901234', 'Daniel', 'José', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3158901234', 'daniel.garcia@empresa.co', 2),
(28, '1289012345', 'Julián', 'Camilo', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3128901234', 'julian.martinez@empresa.co', 3),
(29, '1290123456', 'Mariana', 'Andrea', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3008901234', 'mariana.lopez@empresa.co', 4),
(30, '1301234567', 'Emilio', 'David', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3118901234', 'emilio.zapata@empresa.co', 5),
(31, '1312345678', 'José', 'Manuel', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3209012345', 'jose.gomez@empresa.co', 1),
(32, '1323456789', 'Lucía', 'María', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3159012345', 'lucia.rodriguez@empresa.co', 2),
(33, '1334567890', 'David', 'Fernando', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3129012345', 'david.perez@empresa.co', 3),
(34, '1345678901', 'Juan', 'Andrés', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3009012345', 'juan.ramirez@empresa.co', 4),
(35, '1357891230', 'Alejandra', 'Rocío', 'Díaz', 'Castro', 'Calle 35 #12-34', 'Medellín', '3187654321', 'alejandra.diaz@empresa.co', 2),
(36, '1367890123', 'Paula', 'Andrea', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3209123456', 'paula.ortiz@empresa.co', 1),
(37, '1378901234', 'Manuel', 'Felipe', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3159123456', 'manuel.garcia@empresa.co', 2),
(38, '1389012345', 'Carolina', 'Isabel', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3129123456', 'carolina.martinez@empresa.co', 3),
(39, '1390123456', 'Álvaro', 'Joaquín', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3009123456', 'alvaro.lopez@empresa.co', 4),
(40, '1401234567', 'Liliana', 'María', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3119123456', 'liliana.zapata@empresa.co', 5),
(41, '1412345678', 'Joaquín', 'Álvaro', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3209234567', 'joaquin.gomez@empresa.co', 1),
(42, '1423456789', 'Beatriz', 'Carolina', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3159234567', 'beatriz.rodriguez@empresa.co', 2),
(43, '1434567890', 'Héctor', 'José', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3129234567', 'hector.perez@empresa.co', 3),
(44, '1445678901', 'Johana', 'Sofía', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3009234567', 'johana.ramirez@empresa.co', 4),
(45, '1456789012', 'Ricardo', 'Felipe', 'Hernández', 'Gómez', 'Carrera 54 #23-12', 'Barranquilla', '3119234567', 'ricardo.hernandez@empresa.co', 5),
(46, '1467890123', 'Sergio', 'Alberto', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3209345678', 'sergio.ortiz@empresa.co', 1),
(47, '1478901234', 'Juliana', 'Eugenia', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3159345678', 'juliana.garcia@empresa.co', 2),
(48, '1489012345', 'Francisco', 'José', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3129345678', 'francisco.martinez@empresa.co', 3),
(49, '1490123456', 'Andrea', 'Felisa', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3009345678', 'andrea.lopez@empresa.co', 4),
(50, '1501234567', 'Hernán', 'Joaquín', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3119345678', 'hernan.zapata@empresa.co', 5),
(51, '1512345678', 'Carlos', 'Javier', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3209456789', 'carlos.gomez@empresa.co', 1),
(52, '1523456789', 'Felipe', 'Miguel', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3159456789', 'felipe.rodriguez@empresa.co', 2),
(53, '1534567890', 'Marta', 'Isabel', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3129456789', 'marta.perez@empresa.co', 3),
(54, '1545678901', 'Sebastián', 'Alonso', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3009456789', 'sebastian.ramirez@empresa.co', 4),
(55, '1556789012', 'José', 'Luis', 'Hernández', 'Gómez', 'Carrera 54 #23-12', 'Barranquilla', '3119456789', 'jose.hernandez@empresa.co', 5),
(56, '1567890123', 'Cristina', 'Juliana', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3209567890', 'cristina.ortiz@empresa.co', 1),
(57, '1578901234', 'Andrés', 'Felipe', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3159567890', 'andres.garcia@empresa.co', 2),
(58, '1589012345', 'Esteban', 'Emilio', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3129567890', 'esteban.martinez@empresa.co', 3),
(59, '1590123456', 'Liliana', 'Diana', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3009567890', 'liliana.lopez@empresa.co', 4),
(60, '1601234567', 'Ramón', 'Alberto', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3119567890', 'ramon.zapata@empresa.co', 5),
(61, '1612345678', 'Carolina', 'Estefanía', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3209678901', 'carolina.gomez@empresa.co', 1),
(62, '1623456789', 'Julio', 'Aurelio', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3159678901', 'julio.rodriguez@empresa.co', 2),
(63, '1634567890', 'Rosa', 'Alejandra', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3129678901', 'rosa.perez@empresa.co', 3),
(64, '1645678901', 'Manuela', 'Milena', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3009678901', 'manuela.ramirez@empresa.co', 4),
(65, '1656789012', 'Alfredo', 'Tomás', 'Hernández', 'Gómez', 'Carrera 54 #23-12', 'Barranquilla', '3119678901', 'alfredo.hernandez@empresa.co', 5),
(66, '1667890123', 'Fernando', 'Rafael', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3209789012', 'fernando.ortiz@empresa.co', 1),
(67, '1678901234', 'Patricia', 'Del Carmen', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3159789012', 'patricia.garcia@empresa.co', 2),
(68, '1689012345', 'Antonio', 'Luis', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3129789012', 'antonio.martinez@empresa.co', 3),
(69, '1690123456', 'Sandra', 'Elena', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3009789012', 'sandra.lopez@empresa.co', 4),
(70, '1701234567', 'Javier', 'Antonio', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3119789012', 'javier.zapata@empresa.co', 5),
(71, '1712345678', 'Margarita', 'Lucía', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3209890123', 'margarita.gomez@empresa.co', 1),
(72, '1723456789', 'Leonardo', 'Eduardo', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3159890123', 'leonardo.rodriguez@empresa.co', 2),
(73, '1734567890', 'Inés', 'Cecilia', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3129890123', 'ines.perez@empresa.co', 3),
(74, '1745678901', 'Oscar', 'Julián', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3009890123', 'oscar.ramirez@empresa.co', 4),
(75, '1756789012', 'Verónica', 'Marina', 'Hernández', 'Gómez', 'Carrera 54 #23-12', 'Barranquilla', '3119890123', 'veronica.hernandez@empresa.co', 5),
(76, '1767890123', 'Rubén', 'Antonio', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3209901234', 'ruben.ortiz@empresa.co', 1),
(77, '1778901234', 'Felicia', 'Jacqueline', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3159901234', 'felicia.garcia@empresa.co', 2),
(78, '1789012345', 'Ricardo', 'Felipe', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3129901234', 'ricardo.martinez@empresa.co', 3),
(79, '1790123456', 'Paola', 'Viviana', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3009901234', 'paola.lopez@empresa.co', 4),
(80, '1801234567', 'Santiago', 'Andrés', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3119901234', 'santiago.zapata@empresa.co', 5),
(81, '1812345678', 'Carlos', 'Enrique', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3209912345', 'carlos.gomez@empresa.co', 1),
(82, '1823456789', 'Fabiola', 'Elena', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3159912345', 'fabiola.rodriguez@empresa.co', 2),
(83, '1834567890', 'David', 'Alejandro', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3129912345', 'david.perez@empresa.co', 3),
(84, '1845678901', 'Yolanda', 'María', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3009912345', 'yolanda.ramirez@empresa.co', 4),
(85, '1856789012', 'Victor', 'Raúl', 'Hernández', 'Gómez', 'Carrera 54 #23-12', 'Barranquilla', '3119912345', 'victor.hernandez@empresa.co', 5),
(86, '1867890123', 'Héctor', 'Javier', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3209923456', 'hector.ortiz@empresa.co', 1),
(87, '1878901234', 'Ramón', 'Gustavo', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3159923456', 'ramon.garcia@empresa.co', 2),
(88, '1889012345', 'Carla', 'Andrea', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3129923456', 'carla.martinez@empresa.co', 3),
(89, '1890123456', 'Eduardo', 'Antonio', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3009923456', 'eduardo.lopez@empresa.co', 4),
(90, '1901234567', 'Laura', 'Fernanda', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3119923456', 'laura.zapata@empresa.co', 5),
(91, '1912345678', 'María', 'Paula', 'Gómez', 'Pérez', 'Calle 45 #12-34', 'Bogotá', '3209934567', 'maria.gomez@empresa.co', 1),
(92, '1923456789', 'Julio', 'Antonio', 'Rodríguez', 'López', 'Carrera 65 #32-12', 'Medellín', '3159934567', 'julio.rodriguez@empresa.co', 2),
(93, '1934567890', 'Daniela', 'Berenice', 'Pérez', 'Martínez', 'Calle 19 #23-45', 'Cali', '3129934567', 'daniela.perez@empresa.co', 3),
(94, '1945678901', 'Luis', 'Carlos', 'Ramírez', 'Torres', 'Avenida San Martín #12-34', 'Cartagena', '3009934567', 'luis.ramirez@empresa.co', 4),
(95, '1956789012', 'Esteban', 'Raúl', 'Hernández', 'Gómez', 'Carrera 54 #23-12', 'Barranquilla', '3119934567', 'esteban.hernandez@empresa.co', 5),
(96, '1967890123', 'Patricia', 'Luz', 'Ortiz', 'Vargas', 'Calle 45 #12-34', 'Bogotá', '3209945678', 'patricia.ortiz@empresa.co', 1),
(97, '1978901234', 'Luis', 'Fernando', 'García', 'Moreno', 'Carrera 65 #32-12', 'Medellín', '3159945678', 'luis.garcia@empresa.co', 2),
(98, '1989012345', 'Juan', 'Carlos', 'Martínez', 'Castro', 'Calle 19 #23-45', 'Cali', '3129945678', 'juan.martinez@empresa.co', 3),
(99, '1990123456', 'Beatriz', 'María', 'López', 'Ruiz', 'Avenida San Martín #12-34', 'Cartagena', '3009945678', 'beatriz.lopez@empresa.co', 4),
(100, '2001234567', 'Ana', 'Fernanda', 'Zapata', 'Restrepo', 'Carrera 54 #23-12', 'Barranquilla', '3119945678', 'ana.zapata@empresa.co', 5);

INSERT INTO descuentos (id, fecha_inicio, fecha_fin, porcentaje_descuento) VALUES
(1, '2024-01-01', '2024-03-31', 10),
(2, '2024-04-01', '2024-06-30', 15),
(3, '2024-07-01', '2024-09-30', 20),
(4, '2024-10-01', '2024-12-31', 5),
(5, '2024-01-01', '2024-02-29', 25),
(6, '2024-03-01', '2024-04-30', 30),
(7, '2024-05-01', '2024-06-30', 10),
(8, '2024-07-01', '2024-08-31', 12),
(9, '2024-09-01', '2024-10-31', 18),
(10, '2024-11-01', '2024-11-30', 22),
(11, '2025-01-01', '2025-03-31', 5),
(12, '2025-04-01', '2025-06-30', 8),
(13, '2025-07-01', '2025-09-30', 15),
(14, '2025-10-01', '2025-12-31', 20),
(15, '2025-01-01', '2025-02-28', 12),
(16, '2025-03-01', '2025-04-30', 10),
(17, '2025-05-01', '2025-06-30', 18),
(18, '2025-07-01', '2025-08-31', 25),
(19, '2025-09-01', '2025-10-31', 7),
(20, '2025-11-01', '2025-11-30', 30),
(21, '2026-01-01', '2026-03-31', 5),
(22, '2026-04-01', '2026-06-30', 10),
(23, '2026-07-01', '2026-09-30', 12),
(24, '2026-10-01', '2026-12-31', 20),
(25, '2026-01-01', '2026-02-28', 15),
(26, '2026-03-01', '2026-04-30', 8),
(27, '2026-05-01', '2026-06-30', 17),
(28, '2026-07-01', '2026-08-31', 22),
(29, '2026-09-01', '2026-10-31', 19),
(30, '2026-11-01', '2026-11-30', 10),
(31, '2027-01-01', '2027-03-31', 15),
(32, '2027-04-01', '2027-06-30', 12),
(33, '2027-07-01', '2027-09-30', 10),
(34, '2027-10-01', '2027-12-31', 5),
(35, '2027-01-01', '2027-02-28', 18),
(36, '2027-03-01', '2027-04-30', 20),
(37, '2027-05-01', '2027-06-30', 25),
(38, '2027-07-01', '2027-08-31', 30),
(39, '2027-09-01', '2027-10-31', 8),
(40, '2027-11-01', '2027-11-30', 22),
(41, '2028-01-01', '2028-03-31', 7),
(42, '2028-04-01', '2028-06-30', 10),
(43, '2028-07-01', '2028-09-30', 12),
(44, '2028-10-01', '2028-12-31', 5),
(45, '2028-01-01', '2028-02-28', 25),
(46, '2028-03-01', '2028-04-30', 15),
(47, '2028-05-01', '2028-06-30', 8),
(48, '2028-07-01', '2028-08-31', 18),
(49, '2028-09-01', '2028-10-31', 10),
(50, '2028-11-01', '2028-11-30', 12),
(51, '2029-01-01', '2029-03-31', 20),
(52, '2029-04-01', '2029-06-30', 15),
(53, '2029-07-01', '2029-09-30', 10),
(54, '2029-10-01', '2029-12-31', 25),
(55, '2029-01-01', '2029-02-28', 30),
(56, '2029-03-01', '2029-04-30', 5),
(57, '2029-05-01', '2029-06-30', 7),
(58, '2029-07-01', '2029-08-31', 18),
(59, '2029-09-01', '2029-10-31', 12),
(60, '2029-11-01', '2029-11-30', 20),
(61, '2030-01-01', '2030-03-31', 25),
(62, '2030-04-01', '2030-06-30', 5),
(63, '2030-07-01', '2030-09-30', 12),
(64, '2030-10-01', '2030-12-31', 15),
(65, '2030-01-01', '2030-02-28', 20),
(66, '2030-03-01', '2030-04-30', 25),
(67, '2030-05-01', '2030-06-30', 7),
(68, '2030-07-01', '2030-08-31', 10),
(69, '2030-09-01', '2030-10-31', 8),
(70, '2030-11-01', '2030-11-30', 22),
(71, '2031-01-01', '2031-03-31', 12),
(72, '2031-04-01', '2031-06-30', 15),
(73, '2031-07-01', '2031-09-30', 10),
(74, '2031-10-01', '2031-12-31', 20),
(75, '2031-01-01', '2031-02-28', 5),
(76, '2031-03-01', '2031-04-30', 30),
(77, '2031-05-01', '2031-06-30', 12),
(78, '2031-07-01', '2031-08-31', 7),
(79, '2031-09-01', '2031-10-31', 18),
(80, '2031-11-01', '2031-11-30', 25),
(81, '2032-01-01', '2032-03-31', 10),
(82, '2032-04-01', '2032-06-30', 22),
(83, '2032-07-01', '2032-09-30', 5),
(84, '2032-10-01', '2032-12-31', 15),
(85, '2032-01-01', '2032-02-28', 30),
(86, '2032-03-01', '2032-04-30', 20),
(87, '2032-05-01', '2032-06-30', 8),
(88, '2032-07-01', '2032-08-31', 12),
(89, '2032-09-01', '2032-10-31', 25),
(90, '2032-11-01', '2032-11-30', 7),
(91, '2033-01-01', '2033-03-31', 18),
(92, '2033-04-01', '2033-06-30', 10),
(93, '2033-07-01', '2033-09-30', 5),
(94, '2033-10-01', '2033-12-31', 12),
(95, '2033-01-01', '2033-02-28', 22),
(96, '2033-03-01', '2033-04-30', 30),
(97, '2033-05-01', '2033-06-30', 10),
(98, '2033-07-01', '2033-08-31', 25),
(99, '2033-09-01', '2033-10-31', 18),
(100, '2033-11-01', '2033-11-30', 5);

INSERT INTO tipo_vehiculo (id, tipo_vehiculo, id_descuento) VALUES
(1, 'Sedán', 1),       -- Descuento 20%
(2, 'SUV', 2),         -- Descuento 15%
(3, 'Camioneta', 3),   -- Descuento 10%
(4, 'Coupé', 4),       -- Descuento 25%
(5, 'Convertible', 5), -- Descuento 30%
(6, 'Hatchback', 6),   -- Descuento 5%
(7, 'Minivan', 7),     -- Descuento 7%
(8, 'Pick-up', 8),     -- Descuento 18%
(9, 'Deportivo', 9),   -- Descuento 12%
(10, 'Furgoneta', 10), -- Descuento 20%
(11, 'Eléctrico', 11), -- Descuento 25%
(12, 'Híbrido', 12),   -- Descuento 5%
(13, 'Camión', 13),    -- Descuento 22%
(14, 'Monovolumen', 14); -- Descuento 7%


INSERT INTO vehiculos (id, placa, referencia, capacidad, sunroof, puertas, modelo, motor, color, id_tipo_vehiculo) VALUES
(1, 'ABC123', 'Sedán 2023', '5', 'Sí', '4', 'Sedán Turbo', '2.0', 'Negro', 1),
(2, 'DEF456', 'SUV 2022', '7', 'Sí', '5', 'SUV Familiar', '3.0', 'Blanco', 2),
(3, 'GHI789', 'Camioneta 2023', '5', 'No', '4', 'Camioneta Off-Road', '3.5', 'Rojo', 3),
(4, 'JKL012', 'Coupé 2024', '4', 'Sí', '2', 'Coupé Deportivo', '2.5', 'Azul', 4),
(5, 'MNO345', 'Convertible 2023', '2', 'Sí', '2', 'Convertible Turbo', '3.0', 'Plata', 5),
(6, 'PQR678', 'Hatchback 2024', '5', 'No', '4', 'Hatchback Eco', '1.8', 'Verde', 6),
(7, 'STU901', 'Minivan 2023', '7', 'Sí', '5', 'Minivan Familiar', '2.5', 'Gris', 7),
(8, 'VWX234', 'Pick-up 2024', '2', 'Sí', '2', 'Pick-up Turbo', '4.0', 'Negro', 8),
(9, 'YZA567', 'Deportivo 2024', '2', 'Sí', '2', 'Deportivo X', '3.2', 'Rojo', 9),
(10, 'BCD890', 'Furgoneta 2023', '2', 'No', '4', 'Furgoneta Carga', '2.2', 'Blanco', 10),
(11, 'EFG123', 'Eléctrico 2024', '5', 'Sí', '4', 'Eléctrico Power', '0', 'Azul', 11),
(12, 'HIJ456', 'Híbrido 2023', '5', 'Sí', '4', 'Híbrido Eco', '2.0', 'Verde', 12),
(13, 'KLM789', 'Camión 2023', '2', 'No', '2', 'Camión Grande', '6.5', 'Amarillo', 13),
(14, 'NOP012', 'Monovolumen 2024', '7', 'Sí', '5', 'Monovolumen Familiar', '2.8', 'Naranja', 14),
(15, 'ABC124', 'Sedán 2023', '5', 'Sí', '4', 'Sedán Lux', '2.3', 'Blanco', 1),
(16, 'DEF457', 'SUV 2023', '7', 'No', '5', 'SUV Adventure', '3.1', 'Negro', 2),
(17, 'GHI790', 'Camioneta 2022', '5', 'No', '4', 'Camioneta Work', '3.3', 'Azul', 3),
(18, 'JKL013', 'Coupé 2024', '4', 'Sí', '2', 'Coupé Classic', '2.4', 'Gris', 4),
(19, 'MNO346', 'Convertible 2023', '2', 'Sí', '2', 'Convertible Sport', '3.1', 'Negro', 5),
(20, 'PQR679', 'Hatchback 2024', '5', 'No', '4', 'Hatchback Turbo', '1.9', 'Rojo', 6),
(21, 'STU902', 'Minivan 2023', '7', 'Sí', '5', 'Minivan City', '2.6', 'Blanco', 7),
(22, 'VWX235', 'Pick-up 2024', '2', 'Sí', '2', 'Pick-up Pro', '4.1', 'Gris', 8),
(23, 'YZA568', 'Deportivo 2024', '2', 'Sí', '2', 'Deportivo R', '3.3', 'Verde', 9),
(24, 'BCD891', 'Furgoneta 2023', '2', 'No', '4', 'Furgoneta Eco', '2.1', 'Amarillo', 10),
(25, 'EFG124', 'Eléctrico 2024', '5', 'Sí', '4', 'Eléctrico Green', '0', 'Negro', 11),
(26, 'HIJ457', 'Híbrido 2023', '5', 'Sí', '4', 'Híbrido Power', '2.1', 'Azul', 12),
(27, 'KLM790', 'Camión 2023', '2', 'No', '2', 'Camión Heavy', '6.6', 'Rojo', 13),
(28, 'NOP013', 'Monovolumen 2024', '7', 'No', '5', 'Monovolumen City', '2.9', 'Gris', 14),
(29, 'ABC125', 'Sedán 2024', '5', 'Sí', '4', 'Sedán Plus', '2.5', 'Gris', 1),
(30, 'DEF458', 'SUV 2023', '7', 'Sí', '5', 'SUV Extreme', '3.4', 'Verde', 2),
(31, 'GHI791', 'Camioneta 2022', '5', 'No', '4', 'Camioneta Deluxe', '3.5', 'Naranja', 3),
(32, 'JKL014', 'Coupé 2024', '4', 'Sí', '2', 'Coupé Turbo', '2.8', 'Blanco', 4),
(33, 'MNO347', 'Convertible 2023', '2', 'Sí', '2', 'Convertible Lux', '3.4', 'Azul', 5),
(34, 'PQR680', 'Hatchback 2024', '5', 'No', '4', 'Hatchback Deluxe', '2.0', 'Gris', 6),
(35, 'STU903', 'Minivan 2023', '7', 'No', '5', 'Minivan Turbo', '2.9', 'Verde', 7),
(36, 'VWX236', 'Pick-up 2024', '2', 'No', '2', 'Pick-up Sport', '4.2', 'Negro', 8),
(37, 'YZA569', 'Deportivo 2024', '2', 'Sí', '2', 'Deportivo Speed', '3.1', 'Blanco', 9),
(38, 'BCD892', 'Furgoneta 2023', '2', 'No', '4', 'Furgoneta Pro', '2.0', 'Rojo', 10),
(39, 'EFG125', 'Eléctrico 2024', '5', 'Sí', '4', 'Eléctrico Pro', '0', 'Gris', 11),
(40, 'HIJ458', 'Híbrido 2023', '5', 'Sí', '4', 'Híbrido Max', '2.2', 'Naranja', 12),
(41, 'KLM791', 'Camión 2023', '2', 'No', '2', 'Camión Super', '6.7', 'Azul', 13),
(42, 'NOP014', 'Monovolumen 2024', '7', 'Sí', '5', 'Monovolumen Max', '3.1', 'Blanco', 14),
(43, 'ABC126', 'Sedán 2024', '5', 'Sí', '4', 'Sedán Super', '2.6', 'Naranja', 1),
(44, 'DEF459', 'SUV 2023', '7', 'No', '5', 'SUV Lux', '3.5', 'Gris', 2),
(45, 'GHI792', 'Camioneta 2022', '5', 'No', '4', 'Camioneta Turbo', '3.7', 'Verde', 3),
(46, 'JKL015', 'Coupé 2024', '4', 'Sí', '2', 'Coupé Max', '2.9', 'Amarillo', 4),
(47, 'MNO348', 'Convertible 2023', '2', 'Sí', '2', 'Convertible R', '3.6', 'Verde', 5),
(48, 'PQR681', 'Hatchback 2024', '5', 'No', '4', 'Hatchback Eco', '1.7', 'Rojo', 6),
(49, 'STU904', 'Minivan 2023', '7', 'Sí', '5', 'Minivan Plus', '2.7', 'Negro', 7),
(50, 'VWX237', 'Pick-up 2024', '2', 'Sí', '2', 'Pick-up Max', '4.3', 'Azul', 8),
(51, 'YZA570', 'Deportivo 2024', '2', 'Sí', '2', 'Deportivo Classic', '3.4', 'Blanco', 9),
(52, 'BCD893', 'Furgoneta 2023', '2', 'No', '4', 'Furgoneta Turbo', '2.3', 'Amarillo', 10),
(53, 'EFG126', 'Eléctrico 2024', '5', 'Sí', '4', 'Eléctrico Turbo', '0', 'Negro', 11),
(54, 'HIJ459', 'Híbrido 2023', '5', 'Sí', '4', 'Híbrido Lux', '2.3', 'Azul', 12),
(55, 'KLM792', 'Camión 2023', '2', 'No', '2', 'Camión Max', '6.9', 'Rojo', 13),
(56, 'NOP015', 'Monovolumen 2024', '7', 'Sí', '5', 'Monovolumen X', '3.3', 'Naranja', 14),
(57, 'ABC127', 'Sedán 2024', '5', 'Sí', '4', 'Sedán Lux', '2.8', 'Gris', 1),
(58, 'DEF460', 'SUV 2023', '7', 'Sí', '5', 'SUV Turbo', '3.7', 'Verde', 2),
(59, 'GHI793', 'Camioneta 2022', '5', 'No', '4', 'Camioneta Max', '3.8', 'Blanco', 3),
(60, 'JKL016', 'Coupé 2024', '4', 'Sí', '2', 'Coupé Speed', '3.0', 'Negro', 4),
(61, 'MNO349', 'Convertible 2023', '2', 'Sí', '2', 'Convertible Classic', '3.8', 'Rojo', 5),
(62, 'PQR682', 'Hatchback 2024', '5', 'No', '4', 'Hatchback Speed', '1.9', 'Amarillo', 6),
(63, 'STU905', 'Minivan 2023', '7', 'Sí', '5', 'Minivan Deluxe', '3.0', 'Gris', 7),
(64, 'VWX238', 'Pick-up 2024', '2', 'Sí', '2', 'Pick-up Turbo', '4.5', 'Verde', 8),
(65, 'YZA571', 'Deportivo 2024', '2', 'Sí', '2', 'Deportivo Speedster', '3.5', 'Azul', 9),
(66, 'BCD894', 'Furgoneta 2023', '2', 'No', '4', 'Furgoneta Max', '2.5', 'Negro', 10),
(67, 'EFG127', 'Eléctrico 2024', '5', 'Sí', '4', 'Eléctrico Max', '0', 'Blanco', 11),
(68, 'HIJ460', 'Híbrido 2023', '5', 'Sí', '4', 'Híbrido Speed', '2.5', 'Rojo', 12),
(69, 'KLM793', 'Camión 2023', '2', 'No', '2', 'Camión Turbo', '7.0', 'Amarillo', 13),
(70, 'NOP016', 'Monovolumen 2024', '7', 'Sí', '5', 'Monovolumen Turbo', '3.5', 'Verde', 14),
(71, 'ABC128', 'Sedán 2024', '5', 'Sí', '4', 'Sedán Deluxe', '3.0', 'Azul', 1),
(72, 'DEF461', 'SUV 2023', '7', 'Sí', '5', 'SUV Max', '3.8', 'Amarillo', 2),
(73, 'GHI794', 'Camioneta 2022', '5', 'No', '4', 'Camioneta Turbo', '3.9', 'Rojo', 3),
(74, 'JKL017', 'Coupé 2024', '4', 'Sí', '2', 'Coupé Max', '3.1', 'Naranja', 4),
(75, 'MNO350', 'Convertible 2023', '2', 'Sí', '2', 'Convertible Speed', '3.9', 'Amarillo', 5),
(76, 'PQR683', 'Hatchback 2024', '5', 'No', '4', 'Hatchback X', '2.1', 'Negro', 6),
(77, 'STU906', 'Minivan 2023', '7', 'Sí', '5', 'Minivan Sport', '3.2', 'Verde', 7),
(78, 'VWX239', 'Pick-up 2024', '2', 'Sí', '2', 'Pick-up X', '4.7', 'Gris', 8),
(79, 'YZA572', 'Deportivo 2024', '2', 'Sí', '2', 'Deportivo Max', '3.6', 'Rojo', 9),
(80, 'BCD895', 'Furgoneta 2023', '2', 'No', '4', 'Furgoneta X', '2.7', 'Azul', 10),
(81, 'EFG128', 'Eléctrico 2024', '5', 'Sí', '4', 'Eléctrico Speed', '0', 'Gris', 11),
(82, 'HIJ461', 'Híbrido 2023', '5', 'Sí', '4', 'Híbrido X', '2.6', 'Naranja', 12),
(83, 'KLM794', 'Camión 2023', '2', 'No', '2', 'Camión Max', '7.1', 'Azul', 13),
(84, 'NOP017', 'Monovolumen 2024', '7', 'Sí', '5', 'Monovolumen X', '3.7', 'Blanco', 14),
(85, 'ABC129', 'Sedán 2024', '5', 'Sí', '4', 'Sedán X', '3.2', 'Negro', 1),
(86, 'DEF462', 'SUV 2023', '7', 'Sí', '5', 'SUV Speed', '4.0', 'Blanco', 2),
(87, 'GHI795', 'Camioneta 2022', '5', 'No', '4', 'Camioneta X', '4.0', 'Gris', 3),
(88, 'JKL018', 'Coupé 2024', '4', 'Sí', '2', 'Coupé X', '3.2', 'Verde', 4),
(89, 'MNO351', 'Convertible 2023', '2', 'Sí', '2', 'Convertible Max', '4.0', 'Blanco', 5),
(90, 'PQR684', 'Hatchback 2024', '5', 'No', '4', 'Hatchback Deluxe', '2.3', 'Amarillo', 6),
(91, 'STU907', 'Minivan 2023', '7', 'Sí', '5', 'Minivan Max', '3.4', 'Azul', 7),
(92, 'VWX240', 'Pick-up 2024', '2', 'Sí', '2', 'Pick-up X', '4.8', 'Negro', 8),
(93, 'YZA573', 'Deportivo 2024', '2', 'Sí', '2', 'Deportivo X', '3.8', 'Verde', 9),
(94, 'BCD896', 'Furgoneta 2023', '2', 'No', '4', 'Furgoneta X', '2.8', 'Naranja', 10),
(95, 'EFG129', 'Eléctrico 2024', '5', 'Sí', '4', 'Eléctrico Deluxe', '0', 'Amarillo', 11),
(96, 'HIJ462', 'Híbrido 2023', '5', 'Sí', '4', 'Híbrido Star', '2.4', 'Plata', 12),
(97, 'KLM795', 'Camión 2023', '2', 'No', '2', 'Camión H-Drive', '7.0', 'Naranja', 13),
(98, 'NOP018', 'Monovolumen 2024', '7', 'No', '5', 'Monovolumen Classic', '3.1', 'Negro', 14),
(99, 'ABC130', 'Sedán 2024', '5', 'Sí', '4', 'Sedán Super', '3.5', 'Verde', 1),
(100, 'DEF463', 'SUV 2023', '7', 'Sí', '5', 'SUV Pro', '3.9', 'Plata', 2);


INSERT INTO alquileres (id, alquiler_semana, alquiler_dia, id_sucursal_salida, fecha_salida, id_sucursal_llegada, fecha_esperada, fecha_llegada, id_cliente, id_empleado, id_vehiculo, valor_cotizado, valor_pagado, id_descuento) VALUES
(1, 700000, 120000, 1, '2024-01-15', 3, '2024-01-22', '2024-01-21', 1, 1, 1, 840000, 820000, 1),
(2, 650000, 115000, 2, '2024-01-18', 4, '2024-01-25', NULL, 2, 2, 2, 780000, 750000, 2),
(3, 720000, 130000, 3, '2024-01-20', 5, '2024-01-27', '2024-01-26', 3, 3, 3, 860000, 830000, 3),
(4, 680000, 125000, 4, '2024-01-22', 1, '2024-01-29', '2024-01-28', 4, 4, 4, 810000, 800000, 4),
(5, 690000, 118000, 5, '2024-01-24', 2, '2024-01-31', NULL, 5, 5, 5, 830000, 820000, 5),
(6, 720000, 128000, 1, '2024-01-26', 3, '2024-02-02', '2024-02-01', 6, 6, 6, 850000, 830000, 6),
(7, 750000, 135000, 2, '2024-01-28', 4, '2024-02-04', NULL, 7, 7, 7, 880000, 870000, 7),
(8, 760000, 138000, 3, '2024-01-30', 5, '2024-02-06', '2024-02-05', 8, 8, 8, 900000, 890000, 8),
(9, 700000, 120000, 4, '2024-02-01', 1, '2024-02-08', '2024-02-07', 9, 9, 9, 850000, 840000, 9),
(10, 670000, 115000, 5, '2024-02-03', 2, '2024-02-10', NULL, 10, 10, 10, 820000, 810000, 10),
(11, 720000, 125000, 1, '2024-02-05', 3, '2024-02-12', '2024-02-11', 11, 11, 11, 860000, 850000, 11),
(12, 690000, 122000, 2, '2024-02-07', 4, '2024-02-14', '2024-02-13', 12, 12, 12, 850000, 830000, 12),
(13, 740000, 130000, 3, '2024-02-09', 5, '2024-02-16', NULL, 13, 13, 13, 880000, 870000, 13),
(14, 710000, 123000, 4, '2024-02-11', 1, '2024-02-18', '2024-02-17', 14, 14, 14, 840000, 830000, 14),
(15, 700000, 121000, 5, '2024-02-13', 2, '2024-02-20', NULL, 15, 15, 15, 850000, 830000, 15),
(16, 730000, 128000, 1, '2024-02-15', 3, '2024-02-22', '2024-02-21', 16, 16, 16, 870000, 860000, 16),
(17, 750000, 135000, 2, '2024-02-17', 4, '2024-02-24', NULL, 17, 17, 17, 890000, 880000, 17),
(18, 760000, 140000, 3, '2024-02-19', 5, '2024-02-26', '2024-02-25', 18, 18, 18, 910000, 900000, 18),
(19, 690000, 118000, 4, '2024-02-21', 1, '2024-02-28', '2024-02-27', 19, 19, 19, 850000, 840000, 19),
(20, 720000, 125000, 5, '2024-02-23', 2, '2024-03-01', NULL, 20, 20, 20, 880000, 860000, 20),
(21, 760000, 138000, 1, '2024-02-25', 3, '2024-03-04', '2024-03-03', 21, 21, 21, 920000, 910000, 21),
(22, 750000, 135000, 2, '2024-02-27', 4, '2024-03-06', NULL, 22, 22, 22, 890000, 880000, 22),
(23, 720000, 130000, 3, '2024-02-29', 5, '2024-03-07', '2024-03-06', 23, 23, 23, 880000, 870000, 23),
(24, 740000, 132000, 4, '2024-03-02', 1, '2024-03-09', '2024-03-08', 24, 24, 24, 890000, 880000, 24),
(25, 760000, 140000, 5, '2024-03-04', 2, '2024-03-11', NULL, 25, 25, 25, 910000, 900000, 25),
(26, 700000, 120000, 1, '2024-03-06', 3, '2024-03-13', '2024-03-12', 26, 26, 26, 850000, 840000, 26),
(27, 670000, 115000, 2, '2024-03-08', 4, '2024-03-15', NULL, 27, 27, 27, 820000, 810000, 27),
(28, 730000, 128000, 3, '2024-03-10', 5, '2024-03-17', '2024-03-16', 28, 28, 28, 870000, 860000, 28),
(29, 750000, 135000, 4, '2024-03-12', 1, '2024-03-19', '2024-03-18', 29, 29, 29, 890000, 880000, 29),
(30, 760000, 138000, 5, '2024-03-14', 2, '2024-03-21', NULL, 30, 30, 30, 910000, 900000, 30),
(31, 720000, 130000, 1, '2024-03-16', 3, '2024-03-23', '2024-03-22', 31, 31, 31, 880000, 870000, 31),
(32, 740000, 132000, 2, '2024-03-18', 4, '2024-03-25', NULL, 32, 32, 32, 890000, 880000, 32),
(33, 760000, 140000, 3, '2024-03-20', 5, '2024-03-27', '2024-03-26', 33, 33, 33, 920000, 910000, 33),
(34, 750000, 135000, 4, '2024-03-22', 1, '2024-03-29', '2024-03-28', 34, 34, 34, 890000, 880000, 34),
(35, 720000, 130000, 5, '2024-03-24', 2, '2024-03-31', NULL, 35, 35, 35, 880000, 870000, 35),
(36, 760000, 138000, 1, '2024-03-26', 3, '2024-04-02', '2024-04-01', 36, 36, 36, 910000, 900000, 36),
(37, 700000, 120000, 2, '2024-03-28', 4, '2024-04-04', NULL, 37, 37, 37, 850000, 840000, 37),
(38, 730000, 128000, 3, '2024-03-30', 5, '2024-04-06', '2024-04-05', 38, 38, 38, 870000, 860000, 38),
(39, 740000, 132000, 4, '2024-04-01', 1, '2024-04-08', '2024-04-07', 39, 39, 39, 890000, 880000, 39),
(40, 760000, 140000, 5, '2024-04-03', 2, '2024-04-10', NULL, 40, 40, 40, 910000, 900000, 40),
(41, 690000, 118000, 1, '2024-04-05', 3, '2024-04-12', '2024-04-11', 41, 41, 41, 850000, 840000, 1),
(42, 720000, 125000, 2, '2024-04-07', 4, '2024-04-14', NULL, 42, 42, 42, 880000, 860000, 2),
(43, 750000, 135000, 3, '2024-04-09', 5, '2024-04-16', '2024-04-15', 43, 43, 43, 910000, 900000, 3),
(44, 710000, 123000, 4, '2024-04-11', 1, '2024-04-18', '2024-04-17', 44, 44, 44, 870000, 860000, 4),
(45, 700000, 120000, 5, '2024-04-13', 2, '2024-04-20', NULL, 45, 45, 45, 850000, 840000, 5),
(46, 720000, 128000, 1, '2024-04-15', 3, '2024-04-22', '2024-04-21', 46, 46, 46, 870000, 860000, 6),
(47, 750000, 135000, 2, '2024-04-17', 4, '2024-04-24', NULL, 47, 47, 47, 890000, 880000, 7),
(48, 760000, 140000, 3, '2024-04-19', 5, '2024-04-26', '2024-04-25', 48, 48, 48, 910000, 900000, 8),
(49, 690000, 118000, 4, '2024-04-21', 1, '2024-04-28', '2024-04-27', 49, 49, 49, 850000, 840000, 9),
(50, 720000, 125000, 5, '2024-04-23', 2, '2024-04-30', NULL, 50, 50, 50, 880000, 860000, 10),
(51, 760000, 138000, 1, '2024-04-25', 3, '2024-05-02', '2024-05-01', 51, 51, 51, 920000, 910000, 11),
(52, 750000, 135000, 2, '2024-04-27', 4, '2024-05-04', NULL, 52, 52, 52, 890000, 880000, 12),
(53, 720000, 130000, 3, '2024-04-29', 5, '2024-05-06', '2024-05-05', 53, 53, 53, 880000, 870000, 13),
(54, 740000, 132000, 4, '2024-05-01', 1, '2024-05-08', '2024-05-07', 54, 54, 54, 890000, 880000, 14),
(55, 760000, 140000, 5, '2024-05-03', 2, '2024-05-10', NULL, 55, 55, 55, 910000, 900000, 15),
(56, 700000, 120000, 1, '2024-05-05', 3, '2024-05-12', '2024-05-11', 56, 56, 56, 850000, 840000, 16),
(57, 670000, 115000, 2, '2024-05-07', 4, '2024-05-14', NULL, 57, 57, 57, 820000, 810000, 17),
(58, 730000, 128000, 3, '2024-05-09', 5, '2024-05-16', '2024-05-15', 58, 58, 58, 870000, 860000, 18),
(59, 750000, 135000, 4, '2024-05-11', 1, '2024-05-18', '2024-05-17', 59, 59, 59, 890000, 880000, 19),
(60, 760000, 138000, 5, '2024-05-13', 2, '2024-05-20', NULL, 60, 60, 60, 910000, 900000, 20),
(61, 720000, 130000, 1, '2024-05-15', 3, '2024-05-22', '2024-05-21', 61, 61, 61, 880000, 870000, 21),
(62, 740000, 132000, 2, '2024-05-17', 4, '2024-05-24', NULL, 62, 62, 62, 890000, 880000, 22),
(63, 760000, 140000, 3, '2024-05-19', 5, '2024-05-26', '2024-05-25', 63, 63, 63, 920000, 910000, 23),
(64, 750000, 135000, 4, '2024-05-21', 1, '2024-05-28', '2024-05-27', 64, 64, 64, 890000, 880000, 24),
(65, 720000, 130000, 5, '2024-05-23', 2, '2024-05-30', NULL, 65, 65, 65, 880000, 870000, 25),
(66, 760000, 138000, 1, '2024-05-25', 3, '2024-06-01', '2024-05-31', 66, 66, 66, 910000, 900000, 26),
(67, 700000, 120000, 2, '2024-05-27', 4, '2024-06-03', NULL, 67, 67, 67, 850000, 840000, 27),
(68, 730000, 128000, 3, '2024-05-29', 5, '2024-06-05', '2024-06-04', 68, 68, 68, 870000, 860000, 28),
(69, 740000, 132000, 4, '2024-06-01', 1, '2024-06-08', '2024-06-07', 69, 69, 69, 890000, 880000, 29),
(70, 760000, 140000, 5, '2024-06-03', 2, '2024-06-10', NULL, 70, 70, 70, 910000, 900000, 30),
(71, 690000, 118000, 1, '2024-06-05', 3, '2024-06-12', '2024-06-11', 71, 71, 71, 850000, 840000, 31),
(72, 720000, 125000, 2, '2024-06-07', 4, '2024-06-14', NULL, 72, 72, 72, 880000, 860000, 32),
(73, 750000, 135000, 3, '2024-06-09', 5, '2024-06-16', '2024-06-15', 73, 73, 73, 910000, 900000, 33),
(74, 710000, 123000, 4, '2024-06-11', 1, '2024-06-18', '2024-06-17', 74, 74, 74, 870000, 860000, 34),
(75, 700000, 120000, 5, '2024-06-13', 2, '2024-06-20', NULL, 75, 75, 75, 850000, 840000, 35),
(76, 720000, 128000, 1, '2024-06-15', 3, '2024-06-22', '2024-06-21', 76, 76, 76, 870000, 860000, 36),
(77, 750000, 135000, 2, '2024-06-17', 4, '2024-06-24', NULL, 77, 77, 77, 890000, 880000, 37),
(78, 760000, 140000, 3, '2024-06-19', 5, '2024-06-26', '2024-06-25', 78, 78, 78, 910000, 900000, 38),
(79, 690000, 118000, 4, '2024-06-21', 1, '2024-06-28', '2024-06-27', 79, 79, 79, 850000, 840000, 39),
(80, 720000, 125000, 5, '2024-06-23', 2, '2024-06-30', NULL, 80, 80, 80, 880000, 860000, 40),
(81, 760000, 138000, 1, '2024-06-25', 3, '2024-07-02', '2024-07-01', 81, 81, 81, 920000, 910000, 41),
(82, 750000, 135000, 2, '2024-06-27', 4, '2024-07-04', NULL, 82, 82, 82, 890000, 880000, 42),
(83, 720000, 130000, 3, '2024-06-29', 5, '2024-07-06', '2024-07-05', 83, 83, 83, 880000, 870000, 43),
(84, 740000, 132000, 4, '2024-07-01', 1, '2024-07-08', '2024-07-07', 84, 84, 84, 890000, 880000, 44),
(85, 760000, 140000, 5, '2024-07-03', 2, '2024-07-10', NULL, 85, 85, 85, 910000, 900000, 45),
(86, 700000, 120000, 1, '2024-07-05', 3, '2024-07-12', '2024-07-11', 86, 86, 86, 850000, 840000, 46),
(87, 670000, 115000, 2, '2024-07-07', 4, '2024-07-14', NULL, 87, 87, 87, 820000, 810000, 47),
(88, 730000, 128000, 3, '2024-07-09', 5, '2024-07-16', '2024-07-15', 88, 88, 88, 870000, 860000, 48),
(89, 750000, 135000, 4, '2024-07-11', 1, '2024-07-18', '2024-07-17', 89, 89, 89, 890000, 880000, 49),
(90, 760000, 138000, 5, '2024-07-13', 2, '2024-07-20', NULL, 90, 90, 90, 910000, 900000, 50),
(91, 720000, 130000, 1, '2024-07-15', 3, '2024-07-22', '2024-07-21', 91, 91, 91, 880000, 870000, 51),
(92, 740000, 132000, 2, '2024-07-17', 4, '2024-07-24', NULL, 92, 92, 92, 890000, 880000, 52),
(93, 760000, 140000, 3, '2024-07-19', 5, '2024-07-26', '2024-07-25', 93, 93, 93, 920000, 910000, 53),
(94, 750000, 135000, 4, '2024-07-21', 1, '2024-07-28', '2024-07-27', 94, 94, 94, 890000, 880000, 54),
(95, 720000, 130000, 5, '2024-07-23', 2, '2024-07-30', NULL, 95, 95, 95, 880000, 870000, 55),
(96, 760000, 138000, 1, '2024-07-25', 3, '2024-08-01', '2024-07-31', 96, 96, 96, 910000, 900000, 56),
(97, 700000, 120000, 2, '2024-07-27', 4, '2024-08-03', NULL, 97, 97, 97, 850000, 840000, 57),
(98, 730000, 128000, 3, '2024-07-29', 5, '2024-08-05', '2024-08-04', 98, 98, 98, 870000, 860000, 58),
(99, 740000, 132000, 4, '2024-07-31', 1, '2024-08-07', '2024-08-06', 99, 99, 99, 890000, 880000, 59),
(100, 760000, 140000, 5, '2024-08-02', 2, '2024-08-09', NULL, 100, 100, 100, 910000, 900000, 60);

INSERT INTO retraso (id, dias_retraso, porcentaje_dias, id_alquiler) VALUES
(1, 2, 10, 1),
(2, NULL, NULL, 2),
(3, 1, 5, 3),
(4, NULL, NULL, 4),
(5, 3, 15, 5),
(6, 2, 10, 6),
(7, NULL, NULL, 7),
(8, 0, 0, 8),
(9, NULL, NULL, 9),
(10, 5, 25, 10),
(11, NULL, NULL, 11),
(12, 4, 20, 12),
(13, NULL, NULL, 13),
(14, 1, 5, 14),
(15, NULL, NULL, 15),
(16, 3, 15, 16),
(17, NULL, NULL, 17),
(18, 0, 0, 18),
(19, 6, 30, 19),
(20, NULL, NULL, 20),
(21, 2, 10, 21),
(22, NULL, NULL, 22),
(23, 4, 20, 23),
(24, NULL, NULL, 24),
(25, 1, 5, 25),
(26, NULL, NULL, 26),
(27, 5, 25, 27),
(28, NULL, NULL, 28),
(29, 3, 15, 29),
(30, NULL, NULL, 30),
(31, 0, 0, 31),
(32, NULL, NULL, 32),
(33, 2, 10, 33),
(34, NULL, NULL, 34),
(35, 4, 20, 35),
(36, NULL, NULL, 36),
(37, 1, 5, 37),
(38, NULL, NULL, 38),
(39, 3, 15, 39),
(40, NULL, NULL, 40),
(41, 6, 30, 41),
(42, NULL, NULL, 42),
(43, 0, 0, 43),
(44, NULL, NULL, 44),
(45, 5, 25, 45),
(46, NULL, NULL, 46),
(47, 2, 10, 47),
(48, NULL, NULL, 48),
(49, 4, 20, 49),
(50, NULL, NULL, 50),
(51, 1, 5, 51),
(52, NULL, NULL, 52),
(53, 3, 15, 53),
(54, NULL, NULL, 54),
(55, 6, 30, 55),
(56, NULL, NULL, 56),
(57, 0, 0, 57),
(58, NULL, NULL, 58),
(59, 2, 10, 59),
(60, NULL, NULL, 60),
(61, 4, 20, 61),
(62, NULL, NULL, 62),
(63, 1, 5, 63),
(64, NULL, NULL, 64),
(65, 3, 15, 65),
(66, NULL, NULL, 66),
(67, 5, 25, 67),
(68, NULL, NULL, 68),
(69, 2, 10, 69),
(70, NULL, NULL, 70),
(71, 4, 20, 71),
(72, NULL, NULL, 72),
(73, 1, 5, 73),
(74, NULL, NULL, 74),
(75, 3, 15, 75),
(76, NULL, NULL, 76),
(77, 6, 30, 77),
(78, NULL, NULL, 78),
(79, 0, 0, 79),
(80, NULL, NULL, 80),
(81, 5, 25, 81),
(82, NULL, NULL, 82),
(83, 2, 10, 83),
(84, NULL, NULL, 84),
(85, 4, 20, 85),
(86, NULL, NULL, 86),
(87, 1, 5, 87),
(88, NULL, NULL, 88),
(89, 3, 15, 89),
(90, NULL, NULL, 90),
(91, 6, 30, 91),
(92, NULL, NULL, 92),
(93, 0, 0, 93),
(94, NULL, NULL, 94),
(95, 2, 10, 95),
(96, NULL, NULL, 96),
(97, 4, 20, 97),
(98, NULL, NULL, 98),
(99, 1, 5, 99),
(100, NULL, NULL, 100);



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