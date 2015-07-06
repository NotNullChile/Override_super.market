
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
INSERT INTO marcas VALUES(32,'Colun');
INSERT INTO marcas VALUES(33,'Ziploc');
INSERT INTO marcas VALUES(34,'Santa Rita');


/* Insert MetodosDePago */

INSERT INTO metodosDePago VALUES(1,'Tarjeta @Override');
INSERT INTO metodosDePago VALUES(2,'Tarjeta de credito');
INSERT INTO metodosDePago VALUES(3,'Tarjeta de debito');
INSERT INTO metodosDePago VALUES(4,'Cupones de pago');

/* Insert Administrador */

INSERT INTO administrador VALUES(19133111,'Ricardo','Carrasco','rcarrasco@override.cl',123456,'19133111');

/* Donde sale 1 poner tu rut y tambien en 'TuRut' */
INSERT INTO administrador VALUES(1,'Randy','Urtubia','rurtubia@override.cl',123456,'TuRut');

/*Insert Productos*/

/* Abarrotes */
INSERT INTO productos values (1,'Café'						,1750,20,'Sabor Créme Caramel Caja 120 g',1,1,'A_CafeGold_CremeCaramel.jpg');
INSERT INTO productos values (2,'Azúcar'					,610 ,50,'Blanca Granulada'				 ,1,2,'A_Iansa_Azucar.jpg');
INSERT INTO productos values (3,'Fideos'					,570 ,30,'Corbatitas 83'				 ,1,3,'A_Lucchetti_Corbatas.jpg');
INSERT INTO productos values (4,'Sal de Mesa'				,310 ,10,'Para compartir en familia'	 ,1,4,'A_Lobos_Sal.jpg');
INSERT INTO productos values (5,'Leche Condensada Azucarada',820 ,10,'Para compartir en familia'	 ,1,5,'A_LecheSur_LecheCondensada.jpg');
/* Productos Congelados */
INSERT INTO productos values (6,'Alverjas'			   		,1190,30,'Base para Cocinar Arvejado Congelado Bolsa 400 g',2,6,'Con_FrutosDelMaipo_Arvejado.jpg');
INSERT INTO productos values (7,'Nuggets'			   		,1340,20,'Congelados de Pollo Sabor Queso'				   ,2,7,'Con_Sadia_Nuggets.jpg');
INSERT INTO productos values (8,'Primavera de Verduras'		,1450,2 ,'Congelado Bolsa 500 g'						   ,2,8,'Con_MinutoVerde_PrimaveraDeVerduras.jpg');
INSERT INTO productos values (9,'Porotos'	   		   		,2190,1 ,'Granados Congelados 100% Natural'				   ,2,8,'Con_FrutosDelMaipo_PorotosGranados.jpg');
INSERT INTO productos values (10,'Pan Precocido'		   	,1790,3 ,'Barrita Congelado'							   ,2,9,'Con_BredenMaster_MarraquetaPrecocido.jpg');

/* Bebidas y licores */
INSERT INTO productos values (11,'Jugo '		,940 ,10,'Néctar Durazno'							         			       ,3,10,'ByL_Watts_Durazno.jpg');
INSERT INTO productos values (12,'Bebida'		,1350,31,'Bebida Fantasía Sabor Cola'										   ,3,11,'ByL_Pepsi_Bebida.jpg');
INSERT INTO productos values (13,'Pack Cervezas',3850,15,'Pack Cervezas Black Label (6 Botellas 355 cc c/u)'				   ,3,12,'ByL_RoyalGuard_PackCerveza.jpg');
INSERT INTO productos values (14,'Pisco 40°'	,7150,20,'Pisco 40° Nobel Extra Añejado'						   			   ,3,13,'ByL_Mistral_Nobel.jpg');
INSERT INTO productos values (41,'Vino'	   		,3290,5 ,'Vino Cabernet Sauvignon 750 cc'				   		   			   ,3,34,'ByL_SantaRita_Vino.jpg');

/* Carnes */
INSERT INTO productos values (16,'Trutro Corto'	,1990 ,5,'Trutro Corto de Pollo Congelado Bolsa 800 g'	 ,4,15,'C_Tyson_TrutoCorto.jpg');
INSERT INTO productos values (17,'Carne Molida'	,3990,10,'Carne Molida Tártaro 4% de Grasa Bandeja 500 g',4,15,'C_Tyson_CarneMolida.jpg');
INSERT INTO productos values (18,'Salmón'		,3990,20,'Congelado Salmón Filete Bolsa 500 g'			 ,4,16,'C_SuperSalmon_FileteEnteroDeSalmon.jpg');
INSERT INTO productos values (19,'Pollock'		,3390,5 ,'Alaska Pollock Filete Bolsa 500 g'		     ,4,17,'C_ElGolfo_Merluza.jpg');
INSERT INTO productos values (20,'Pollo'	   	,1990,10,'Pollo Entero Bolsa 1 Kg'				   		 ,4,18,'C_Ariztia_PolloEntero.jpg');

/* Cereales y Snack */
INSERT INTO productos values (21,'Cereal Trigo'		,1250 ,5,'Cereal Trigo Inflado Bolsa 200 g',5,19,'CyS_Natur_Snack.jpg');
INSERT INTO productos values (22,'Choco Krispis'	,3499,10,'Cereal Choco Krispis Caja 730 g' ,5,20,'CyS_Kelloggs_ChocoKrispis.jpg');
INSERT INTO productos values (23,'Milo'				,3250,20,'Cereal Milo Caja 800 g'		   ,5,21,'CyS_Nestle_Milo.jpg');
INSERT INTO productos values (24,'Zucaritas'		,3290,5 ,'Cereal Hojuelas Zucaritas'	   ,5,20,'CyS_Kelloggs_Zucaritas.jpg');
INSERT INTO productos values (25,'Trix '	   		,2690,10,'Cereal Trix Caja 480 g'		   ,5,21,'CyS_Nestle_Trix.jpg');

/* Desayuno Y Once */
INSERT INTO productos values (26,'Pan de Molde'		   ,1510,600,'Pan de Molde Fibra Grande'					 ,6,22,'DyO_Cena_Pan.jpg');
INSERT INTO productos values (27,'Leche Semidescremada',960 ,500,'Leche Semidescremada Natural' 				 ,6,32,'DyO_Colun_Leche.jpg');
INSERT INTO productos values (28,'Pack Yogur '		   ,1700,100,'Pack Yogur Batido Sabores (12 Potes 120 g c/u)',6,21,'DyO_Nestle_Yogur.jpg');
INSERT INTO productos values (29,'Queso '		       ,6690,200,'Queso Ranco Laminado'	   						 ,6,32,'DyO_Colun_Queso.jpg');
INSERT INTO productos values (30,'Huevo '	   		   ,3690,200,'Huevo Mediano (30 un)'		  				 ,6,23,'DyO_Yemita_Huevos.jpg');

/* Desayuno Y Once */
INSERT INTO productos values (31,'Detergente'	  ,8730,20,'Detergente Líquido Matic Multiacción 3 L'				,7,24,'LyH_PyG_Omo.jpg');
INSERT INTO productos values (32,'Lavalozas'	  ,2460,10,'Lavalozas Gel Aroma Limón 600 ml' 				 		,7,25,'LyH_Quix_LimpiaVajillas.jpg');
INSERT INTO productos values (33,'Pack Limpiadore',5460,5 ,'Pack Limpiadores para Pisos Flotantes 3 Un'				,7,26,'LyH_Virginia_Pack.jpg');
INSERT INTO productos values (34,'Papel Higiénico',9100,30,'Papel Higiénico Ultra Doble Hoja 30 m Paquete 24 Rollos',7,27,'LyH_Elite_PapelHigienico.jpg');
INSERT INTO productos values (35,'Bolsa'	      ,2520,20,'Bolsa para Sandwich'		  				 		    ,7,33,'LyH_Ziploc_bolsa.jpg');

/* Mascotas */
INSERT INTO productos values (36,'Alimento Seco'	      ,16560,50 ,'Alimento Seco Sabor Atún y Sardina para Gato (6 Kg)' ,8,28,'M_Whiskas_ComidaGatos.jpg');
INSERT INTO productos values (37,'Alimento Húmedo'	      ,420  ,100,'Alimento Húmedo para Gato Sabor Sardina' 			   ,8,28,'M_Whiskas_SnackGatos.jpg');
INSERT INTO productos values (38,'Alimento Perro Master'  ,14870,5  ,'Alimento Perro Adulto Carne, Arroz y Vegetales 15 Kg',8,29,'M_MasterDog_ComidaPerros.jpg');
INSERT INTO productos values (39,'Alimento Perro Champion',11450,10 ,'Alimento Perro Raza Pequeña 8 kg'					   ,8,30,'M_Champion_ComidaPerros.jpg');
INSERT INTO productos values (40,'Suplemento Nutricional' ,3990 ,30 ,'Suplemento Nutricional para Perros Senior'		   ,8,31,'M_DragPharma_Superpet.jpg');

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
WHERE p.descripcion like '%p%' or m.descripcion like '%p%' or p.nombreProducto like '%p%';

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

/* Buscando Producto por URL */

SELECT p.idProducto, p.nombreProducto, p.precioUnitario, p.stock, p.descripcion, t.descripcion, m.descripcion , p.urlFoto
FROM productos p INNER JOIN tipoproductos t
ON p.idTipoProducto = t.idTipoProducto INNER JOIN marcas m
ON p.idMarca = m.idMarca
WHERE p.Urlfoto = 'ByL_DoñaDominga_Vino.jpg';

/* Busqueda despacho */

SELECT d.idDespacho, d.direccion, d.nombrePersonaAEntregar, d.tamaño, d.precio, c.nombreComuna
FROM despacho d INNER JOIN comunas c
ON d.idComuna = c.idComuna;

/* UPDATE */

UPDATE productos p INNER JOIN tipoProductos t
ON p.idTipoProducto = t.idTipoProducto INNER JOIN marcas m
ON p.idMarca = m.idMarca
SET p.nombreProducto = 'hola', p.precioUnitario = 122, p.stock = 12,
p.descripcion = 'Hola1', p.idTipoProducto = 2, p.idMarca = 4, p.Urlfoto = 'A_CafeGold_CremeCaramel.jpg'
WHERE p.idProducto = 19;

/* DELETE */

DELETE FROM productos 
WHERE idProducto = 15;