
/**************************
 *   Ricardo Carrasco S.  *
 *			 			  *
 *     Randy Urtubia      *
 *			  			  *
 *  SuperMarket DataBase  *
 *			  			  *
 **************************/ 

create database supermarketNotNull;

use supermarketNotNull;

create table login
(
username varchar(20),
contraseña varchar(20),
rol int, /* 0 = admin, 1 = cliente (posibilidad)*/
constraint pk_username primary key (username)
);

create table comunas
(
idComuna int,
nombreComuna varchar(50),
constraint pk_idComuna primary key (idComuna)
);

create table tipoProductos
(
idTipoProducto int,
descripcion varchar(50) unique,
constraint pk_idTipoProducto primary key (idTipoProducto)
);

create table marcas
(
idMarca int,
descripcion varchar(50) unique,
Constraint pk_idMarca primary key (idMarca)
);

create table metodosDePago
(
idMetodosDePago int,
descripcion varchar(50) unique,
constraint pk_idMetodosDePago primary key (idMetodosDePago)
);

create table administrador
(
rut int,
nombre varchar(50),
apellido varchar(50),
email varchar(50),
telefono int,
username varchar(20),
constraint pk_rut primary key (rut),
constraint fk_administrador_login foreign key (username) references login (username)
);

create table clientes
(
rut int,
nombre varchar(50),
apellido varchar(50),
email varchar(50),
telefono int,
username varchar(20),
constraint pk_rut primary key (rut),
constraint fk_cliente_login foreign key (username) references login (username)
);

create table productos
(
idProducto int,
nombreProducto varchar(50) unique,
precioUnitario int,
stock int,
descripcion varchar(255),
Urlfoto varchar(100),
idTipoProducto int,
idMarca int,
constraint pk_idProducto primary key (idProducto),
constraint fk_producto_tipoProducto foreign key (idTipoProducto) references tipoProductos (idTipoProducto),
constraint fk_producto_marca foreign key (idMarca) references marcas (idMarca)
);

create table carrito
(
idCarrito int,
idProducto int,
rut int,
constraint pk_idCarrito primary key (idCarrito),
constraint fk_idCarrito_producto foreign key (idProducto) references productos (idProducto),
constraint fk_idCarrito_cliente foreign key (rut) references clientes (rut)
);

create table despacho
(
idDespacho int,
direccion varchar(50),
nombrePersonaAEntregar varchar(50),
tamaño double,
precio int,
idComuna int,
constraint pk_idDespacho primary key (idDespacho),
constraint fk_despacho_comuna foreign key (idComuna) references comunas (idComuna)
);

create table venta
(
idVenta int,
subTotal int,
iva int,
total int,
idMetodosDePago int,
numeroTarjeta int,
rut int,
idCarrito int,
idDespacho int,
constraint pk_Venta primary key (idVenta),
constraint fk_Venta_metodosDePago foreign key (idMetodosDePago) references metodosDePago (idMetodosDePago),
constraint fk_Venta_cliente foreign key (rut) references clientes (rut),
constraint fk_Venta_carrito foreign key (idCarrito) references carrito (idCarrito),
constraint fk_venta_despacho foreign key (idDespacho) references despacho (idDespacho)
);

/* Insert Login */

INSERT INTO login VALUES('19133111','rick',0);
INSERT INTO login VALUES('TuRut','root',0);

/* Insert tipoProductos */

INSERT INTO tipoProductos VALUES(1,'Abarrotes');
INSERT INTO tipoProductos VALUES(2,'Alimentos Congelados');
INSERT INTO tipoProductos VALUES(3,'Bebidas y Licores');
INSERT INTO tipoProductos VALUES(4,'Carnes');
INSERT INTO tipoProductos VALUES(5,'Cereales y Snacks');
INSERT INTO tipoProductos VALUES(6,'Desayuno y Once');
INSERT INTO tipoProductos VALUES(7,'Hogar y Limpieza');
INSERT INTO tipoProductos VALUES(8,'Mascotas');

/* Insert Marcas*/

INSERT INTO marcas VALUES(1,'Gold');
INSERT INTO marcas VALUES(2,'Iansa');
INSERT INTO marcas VALUES(3,'Lucchetti');
INSERT INTO marcas VALUES(4,'Lobos');
INSERT INTO marcas VALUES(5,'Leche Sur');
INSERT INTO marcas VALUES(6,'Frutos del Maipo');
INSERT INTO marcas VALUES(7,'Sadia');
INSERT INTO marcas VALUES(8,'Minuto Verde');
INSERT INTO marcas VALUES(9,'Breden Master');
INSERT INTO marcas VALUES(10,'Watts');
INSERT INTO marcas VALUES(11,'Pepsi');
INSERT INTO marcas VALUES(12,'Royal Guard');
INSERT INTO marcas VALUES(13,'Mistral');
INSERT INTO marcas VALUES(14,'Casa Silva');
INSERT INTO marcas VALUES(15,'Tyson');
INSERT INTO marcas VALUES(16,'Super Salmón');
INSERT INTO marcas VALUES(17,'El Golfo');
INSERT INTO marcas VALUES(18,'Ariztía');
INSERT INTO marcas VALUES(19,'Natur');
INSERT INTO marcas VALUES(20,'Kelloggs');
INSERT INTO marcas VALUES(21,'Nestlé');
INSERT INTO marcas VALUES(22,'Cena');
INSERT INTO marcas VALUES(23,'Yemita');
INSERT INTO marcas VALUES(24,'Omo');
INSERT INTO marcas VALUES(25,'Quix');
INSERT INTO marcas VALUES(26,'Virginia');
INSERT INTO marcas VALUES(27,'Elite');
INSERT INTO marcas VALUES(28,'Whiskas');
INSERT INTO marcas VALUES(29,'Master Dog');
INSERT INTO marcas VALUES(30,'Champion Dog');
INSERT INTO marcas VALUES(31,'Drag Pharma');


/* Insert MetodosDePago */

INSERT INTO metodosDePago VALUES(1,'Tarjeta @Override');
INSERT INTO metodosDePago VALUES(2,'Tarjeta de credito');
INSERT INTO metodosDePago VALUES(3,'Tarjeta de debito');
INSERT INTO metodosDePago VALUES(4,'Cupones de pago');

/* Insert Administrador */

INSERT INTO administrador VALUES(19133111,'Ricardo','Carrasco','rcarrasco@override.cl',123456,'19133111');

/* Donde sale 1 poner tu rut y tambien en 'TuRut' */
INSERT INTO administrador VALUES(1,'Randy','Urtubia','rurtubia@override.cl',123456,'TuRut');

/*Select*/
select * from login;
select * from clientes;
