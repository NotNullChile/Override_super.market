
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
idTipoProducto int,
idMarca int,
Urlfoto varchar(100),
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

/*Insert Productos (Solo Pruebas)*/

INSERT INTO productos values (1,'pruebas1',3500,100,'producto1',1,1,'foto');
INSERT INTO productos values (2,'pruebas2',10000,100,'producto1',2,3,'foto');
INSERT INTO productos values (3,'pruebas3',5000,100,'producto1',2,1,'foto');
INSERT INTO productos values (4,'pruebas4',1000,100,'producto1',3,3,'foto');
INSERT INTO productos values (5,'pruebas5',200,100,'producto1',1,1,'foto');
INSERT INTO productos values (6,'pruebas6',3600,100,'producto1',2,3,'foto');
INSERT INTO productos values (7,'pruebas7',15000,100,'producto1',3,1,'foto');
INSERT INTO productos values (8,'pruebas8',500,100,'producto1',1,3,'foto');
INSERT INTO productos values (9,'pruebas9',3100,100,'producto1',2,1,'foto');

/*Select*/
select * from login;
select * from clientes;
SELECT * FROM metodosDePago;
SELECT * FROM tipoproductos;
SELECT * FROM marcas;
SELECT * FROM productos;
/* Buscando Usuario */
SELECT c.nombre, c.apellido FROM clientes c INNER JOIN login l  ON c.username = l.username WHERE l.username = '1' AND l.contraseña = '1';  

/* Buscando Admin*/

SELECT a.nombre, a.apellido FROM administrador a INNER JOIN login l  ON a.username = l.username WHERE l.username = '19133111' AND l.contraseña = 'rick'; 


/* Buscando Producto General */

SELECT p.idProducto, p.nombreProducto, p.precioUnitario, p.stock, p.descripcion, t.descripcion, m.descripcion , p.urlFoto
FROM productos p INNER JOIN tipoproductos t
ON p.idTipoProducto = t.idTipoProducto INNER JOIN marcas m
ON p.idMarca = m.idMarca;

/* Buscando Producto por tipoProducto */

SELECT p.idProducto, p.nombreProducto, p.precioUnitario, p.stock, p.descripcion, t.descripcion, m.descripcion , p.urlFoto
FROM productos p INNER JOIN tipoproductos t
ON p.idTipoProducto = t.idTipoProducto INNER JOIN marcas m
ON p.idMarca = m.idMarca
WHERE t.descripcion = 'Bebidas y Licores';

/* Buscando Producto por tipoProducto y valores*/

SELECT p.idProducto, p.nombreProducto, p.precioUnitario, p.stock, p.descripcion, t.descripcion, m.descripcion , p.urlFoto
FROM productos p INNER JOIN tipoproductos t
ON p.idTipoProducto = t.idTipoProducto INNER JOIN marcas m
ON p.idMarca = m.idMarca
WHERE t.descripcion = 'Abarrotes' and p.precioUnitario between 0 and 2000;

/* Buscando Producto por tipoProducto y marca */

SELECT p.idProducto, p.nombreProducto, p.precioUnitario, p.stock, p.descripcion, t.descripcion, m.descripcion , p.urlFoto
FROM productos p INNER JOIN tipoproductos t
ON p.idTipoProducto = t.idTipoProducto INNER JOIN marcas m
ON p.idMarca = m.idMarca
WHERE t.descripcion = 'Abarrotes' and m.descripcion like '%h%';

/* Buscando Producto por  producto */

SELECT p.idProducto, p.nombreProducto, p.precioUnitario, p.stock, p.descripcion, t.descripcion, m.descripcion , p.urlFoto
FROM productos p INNER JOIN tipoproductos t
ON p.idTipoProducto = t.idTipoProducto INNER JOIN marcas m
ON p.idMarca = m.idMarca
WHERE p.descripcion like '%p%' or m.descripcion like '%p%';

/* Buscando Producto por precio menor a mayor */

SELECT p.idProducto, p.nombreProducto, p.precioUnitario, p.stock, p.descripcion, t.descripcion, m.descripcion , p.urlFoto
FROM productos p INNER JOIN tipoproductos t
ON p.idTipoProducto = t.idTipoProducto INNER JOIN marcas m
ON p.idMarca = m.idMarca
WHERE t.descripcion = 'Abarrotes'
order by 3;

/* Buscando Producto por precio mayor a menor */

SELECT p.idProducto, p.nombreProducto, p.precioUnitario, p.stock, p.descripcion, t.descripcion, m.descripcion , p.urlFoto
FROM productos p INNER JOIN tipoproductos t
ON p.idTipoProducto = t.idTipoProducto INNER JOIN marcas m
ON p.idMarca = m.idMarca
WHERE t.descripcion = 'Abarrotes'
order by 3 desc;

/* Buscando Producto por orden alfabetico */

SELECT p.idProducto, p.nombreProducto, p.precioUnitario, p.stock, p.descripcion, t.descripcion, m.descripcion , p.urlFoto
FROM productos p INNER JOIN tipoproductos t
ON p.idTipoProducto = t.idTipoProducto INNER JOIN marcas m
ON p.idMarca = m.idMarca
WHERE t.descripcion = 'Abarrotes'
order by 2;

/* UPDATE */

UPDATE productos p INNER JOIN tipoProductos t
ON p.idTipoProducto = t.idTipoProducto INNER JOIN marcas m
ON p.idMarca = m.idMarca
SET p.nombreProducto = 'hola', p.precioUnitario = 122, p.stock = 12,
p.descripcion = 'Hola1', p.idTipoProducto = 2, p.idMarca = 4, p.Urlfoto = 'ds'
WHERE p.idProducto = 1;

/* DELETE */

DELETE FROM productos 
WHERE idProducto = 1;