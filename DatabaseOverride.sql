
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
password varchar(20),
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
descripcion varchar(50),
constraint pk_idTipoProducto primary key (idTipoProducto)
);

create table marcas
(
idMarca int,
descripcion varchar(50),
Urlfoto varchar(100),
Constraint pk_idMarca primary key (idMarca)
);

create table metodosDePago
(
idMetodosDePago int,
descripcion varchar(50),
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
nombreProducto varchar(50),
precioUnitario int,
stock int,
descripcion varchar(255),
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
INSERT INTO tipoProductos VALUES(8,'Lacteos');

/* Insert Marcas*/

INSERT INTO marcas VALUES(1,'Descripcion','urlFoto');

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

select * from cliente;
