
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
estado int, /* 0 = sin oferta, 1 = Oferta*/
constraint pk_idProducto primary key (idProducto),
constraint fk_producto_tipoProducto foreign key (idTipoProducto) references tipoProductos (idTipoProducto),
constraint fk_producto_marca foreign key (idMarca) references marcas (idMarca)
);

create table carrito
(
idCarrito int AUTO_INCREMENT,
orden varchar(50),
constraint pk_idCarrito primary key (idCarrito)
);

/*SELECT orden FROM carrito WHERE idCarrito = 1;*/
create table despacho
(
idDespacho int AUTO_INCREMENT,
direccion varchar(50),
nombrePersonaAEntregar varchar(50),
idComuna int,
constraint pk_idDespacho primary key (idDespacho),
constraint fk_despacho_comuna foreign key (idComuna) references comunas (idComuna)
);

create table venta
(
idVenta int AUTO_INCREMENT,
subTotal int,
iva int,
total int,
idMetodosDePago int,
rut int,
fecha date,
idCarrito int,
idDespacho int,
constraint pk_Venta primary key (idVenta),
constraint fk_Venta_metodosDePago foreign key (idMetodosDePago) references metodosDePago (idMetodosDePago),
constraint fk_Venta_cliente foreign key (rut) references clientes (rut),
constraint fk_Venta_carrito foreign key (idCarrito) references carrito (idCarrito),
constraint fk_venta_despacho foreign key (idDespacho) references despacho (idDespacho)
);

create table venta_producto
(
idVenta int,
idProducto int,
constraint fk_venta_producto_venta foreign key (idVenta) references venta (idVenta),
constraint fk_venta_producto_producto foreign key (idProducto) references productos (idProducto)
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
INSERT INTO productos values (1,'Café'						,1750,20,'Sabor Créme Caramel Caja 120 g',1,1,'A_CafeGold_CremeCaramel.jpg'	  ,0);
INSERT INTO productos values (2,'Azúcar'					,610 ,50,'Blanca Granulada'				 ,1,2,'A_Iansa_Azucar.jpg'			  ,0);
INSERT INTO productos values (3,'Fideos'					,570 ,30,'Corbatitas 83'				 ,1,3,'A_Lucchetti_Corbatas.jpg'	  ,0);
INSERT INTO productos values (4,'Sal de Mesa'				,310 ,10,'Para compartir en familia'	 ,1,4,'A_Lobos_Sal.jpg'				  ,0);
INSERT INTO productos values (5,'Leche Condensada Azucarada',820 ,10,'Para compartir en familia'	 ,1,5,'A_LecheSur_LecheCondensada.jpg',0);
/* Productos Congelados */
INSERT INTO productos values (6,'Alverjas'			   		,1190,30,'Base para Cocinar Arvejado Congelado Bolsa 400 g',2,6,'Con_FrutosDelMaipo_Arvejado.jpg'			,0);
INSERT INTO productos values (7,'Nuggets'			   		,1340,20,'Congelados de Pollo Sabor Queso'				   ,2,7,'Con_Sadia_Nuggets.jpg'						,0);
INSERT INTO productos values (8,'Primavera de Verduras'		,1450,2 ,'Congelado Bolsa 500 g'						   ,2,8,'Con_MinutoVerde_PrimaveraDeVerduras.jpg'	,0);
INSERT INTO productos values (9,'Porotos'	   		   		,2190,1 ,'Granados Congelados 100% Natural'				   ,2,8,'Con_FrutosDelMaipo_PorotosGranados.jpg'	,0);
INSERT INTO productos values (10,'Pan Precocido'		   	,1790,3 ,'Barrita Congelado'							   ,2,9,'Con_BredenMaster_MarraquetaPrecocido.jpg'	,0);

/* Bebidas y licores */
INSERT INTO productos values (11,'Jugo '		,940 ,10,'Néctar Durazno'							         			       ,3,10,'ByL_Watts_Durazno.jpg'		 ,0);
INSERT INTO productos values (12,'Bebida'		,1350,31,'Bebida Fantasía Sabor Cola'										   ,3,11,'ByL_Pepsi_Bebida.jpg'			 ,0);
INSERT INTO productos values (13,'Pack Cervezas',3850,15,'Pack Cervezas Black Label (6 Botellas 355 cc c/u)'				   ,3,12,'ByL_RoyalGuard_PackCerveza.jpg',0);
INSERT INTO productos values (14,'Pisco 40°'	,7150,20,'Pisco 40° Nobel Extra Añejado'						   			   ,3,13,'ByL_Mistral_Nobel.jpg'		 ,1);
INSERT INTO productos values (41,'Vino'	   		,3290,5 ,'Vino Cabernet Sauvignon 750 cc'				   		   			   ,3,34,'ByL_SantaRita_Vino.jpg'		 ,0);

/* Carnes */
INSERT INTO productos values (16,'Trutro Corto'	,1990 ,5,'Trutro Corto de Pollo Congelado Bolsa 800 g'	 ,4,15,'C_Tyson_TrutoCorto.jpg'					,0);
INSERT INTO productos values (17,'Carne Molida'	,3990,10,'Carne Molida Tártaro 4% de Grasa Bandeja 500 g',4,15,'C_Tyson_CarneMolida.jpg'				,0);
INSERT INTO productos values (18,'Salmón'		,3990,20,'Congelado Salmón Filete Bolsa 500 g'			 ,4,16,'C_SuperSalmon_FileteEnteroDeSalmon.jpg' ,1);
INSERT INTO productos values (19,'Pollock'		,3390,5 ,'Alaska Pollock Filete Bolsa 500 g'		     ,4,17,'C_ElGolfo_Merluza.jpg'					,0);
INSERT INTO productos values (20,'Pollo'	   	,1990,10,'Pollo Entero Bolsa 1 Kg'				   		 ,4,18,'C_Ariztia_PolloEntero.jpg'				,0);

/* Cereales y Snack */
INSERT INTO productos values (21,'Cereal Trigo'		,1250 ,5,'Cereal Trigo Inflado Bolsa 200 g',5,19,'CyS_Natur_Snack.jpg'			,0);
INSERT INTO productos values (22,'Choco Krispis'	,3499,10,'Cereal Choco Krispis Caja 730 g' ,5,20,'CyS_Kelloggs_ChocoKrispis.jpg',0);
INSERT INTO productos values (23,'Milo'				,3250,20,'Cereal Milo Caja 800 g'		   ,5,21,'CyS_Nestle_Milo.jpg'			,0);
INSERT INTO productos values (24,'Zucaritas'		,3290,5 ,'Cereal Hojuelas Zucaritas'	   ,5,20,'CyS_Kelloggs_Zucaritas.jpg'	,0);
INSERT INTO productos values (25,'Trix '	   		,2690,10,'Cereal Trix Caja 480 g'		   ,5,21,'CyS_Nestle_Trix.jpg'			,0);

/* Desayuno Y Once */
INSERT INTO productos values (26,'Pan de Molde'		   ,1510,600,'Pan de Molde Fibra Grande'					 ,6,22,'DyO_Cena_Pan.jpg'		,0);
INSERT INTO productos values (27,'Leche Semidescremada',960 ,500,'Leche Semidescremada Natural' 				 ,6,32,'DyO_Colun_Leche.jpg'	,0);
INSERT INTO productos values (28,'Pack Yogur '		   ,1700,100,'Pack Yogur Batido Sabores (12 Potes 120 g c/u)',6,21,'DyO_Nestle_Yogur.jpg'	,0);
INSERT INTO productos values (29,'Queso '		       ,6690,200,'Queso Ranco Laminado'	   						 ,6,32,'DyO_Colun_Queso.jpg'	,0);
INSERT INTO productos values (30,'Huevo '	   		   ,3690,200,'Huevo Mediano (30 un)'		  				 ,6,23,'DyO_Yemita_Huevos.jpg'	,0);

/* Desayuno Y Once */
INSERT INTO productos values (31,'Detergente'	  ,8730,20,'Detergente Líquido Matic Multiacción 3 L'				,7,24,'LyH_PyG_Omo.jpg'				,1);
INSERT INTO productos values (32,'Lavalozas'	  ,2460,10,'Lavalozas Gel Aroma Limón 600 ml' 				 		,7,25,'LyH_Quix_LimpiaVajillas.jpg'	,0);
INSERT INTO productos values (33,'Pack Limpiadore',5460,5 ,'Pack Limpiadores para Pisos Flotantes 3 Un'				,7,26,'LyH_Virginia_Pack.jpg'		,0);
INSERT INTO productos values (34,'Papel Higiénico',9100,30,'Papel Higiénico Ultra Doble Hoja 30 m Paquete 24 Rollos',7,27,'LyH_Elite_PapelHigienico.jpg',0);
INSERT INTO productos values (35,'Bolsa'	      ,2520,20,'Bolsa para Sandwich'		  				 		    ,7,33,'LyH_Ziploc_bolsa.jpg'		,0);

/* Mascotas */
INSERT INTO productos values (36,'Alimento Seco'	      ,16560,50 ,'Alimento Seco Sabor Atún y Sardina para Gato (6 Kg)' ,8,28,'M_Whiskas_ComidaGatos.jpg'	,0);
INSERT INTO productos values (37,'Alimento Húmedo'	      ,420  ,100,'Alimento Húmedo para Gato Sabor Sardina' 			   ,8,28,'M_Whiskas_SnackGatos.jpg'		,1);
INSERT INTO productos values (38,'Alimento Perro Master'  ,14870,5  ,'Alimento Perro Adulto Carne, Arroz y Vegetales 15 Kg',8,29,'M_MasterDog_ComidaPerros.jpg'	,0);
INSERT INTO productos values (39,'Alimento Perro Champion',11450,10 ,'Alimento Perro Raza Pequeña 8 kg'					   ,8,30,'M_Champion_ComidaPerros.jpg'	,0);
INSERT INTO productos values (40,'Suplemento Nutricional' ,3990 ,30 ,'Suplemento Nutricional para Perros Senior'		   ,8,31,'M_DragPharma_Superpet.jpg'	,0);

/* Insert COmunas */

INSERT INTO comunas
VALUES
(1,'Arica'),
(2,'Camarones'),
(3,'General Lagos'),
(4,'Putre'),
(5,'Alto Hospicio'),
(6,'Iquique'),
(7,'Camiña'),
(8,'Colchane'),
(9,'Huara'),
(10,'Pica'),
(11,'Pozo Almonte'),
(12,'Antofagasta'),
(13,'Mejillones'),
(14,'Sierra Gorda'),
(15,'Taltal'),
(16,'Calama'),
(17,'Ollague'),
(18,'San Pedro de Atacama'),
(19,'María Elena'),
(20,'Tocopilla'),
(21,'Chañaral'),
(22,'Diego de Almagro'),
(23,'Caldera'),
(24,'Copiapó'),
(25,'Tierra Amarilla'),
(26,'Alto del Carmen'),
(27,'Freirina'),
(28,'Huasco'),
(29,'Vallenar'),
(30,'Canela'),
(31,'Illapel'),
(32,'Los Vilos'),
(33,'Salamanca'),
(34,'Andacollo'),
(35,'Coquimbo'),
(36,'La Higuera'),
(37,'La Serena'),
(38,'Paihuaco'),
(39,'Vicuña'),
(40,'Combarbalá'),
(41,'Monte Patria'),
(42,'Ovalle'),
(43,'Punitaqui'),
(44,'Río Hurtado'),
(45,'Isla de Pascua'),
(46,'Calle Larga'),
(47,'Los Andes'),
(48,'Rinconada'),
(49,'San Esteban'),
(50,'La Ligua'),
(51,'Papudo'),
(52,'Petorca'),
(53,'Zapallar'),
(54,'Hijuelas'),
(55,'La Calera'),
(56,'La Cruz'),
(57,'Limache'),
(58,'Nogales'),
(59,'Olmué'),
(60,'Quillota'),
(61,'Algarrobo'),
(62,'Cartagena'),
(63,'El Quisco'),
(64,'El Tabo'),
(65,'San Antonio'),
(66,'Santo Domingo'),
(67,'Catemu'),
(68,'Llaillay'),
(69,'Panquehue'),
(70,'Putaendo'),
(71,'San Felipe'),
(72,'Santa María'),
(73,'Casablanca'),
(74,'Concón'),
(75,'Juan Fernández'),
(76,'Puchuncaví'),
(77,'Quilpué'),
(78,'Quintero'),
(79,'Valparaíso'),
(80,'Villa Alemana'),
(81,'Viña del Mar'),
(82,'Colina'),
(83,'Lampa'),
(84,'Tiltil'),
(85,'Pirque'),
(86,'Puente Alto'),
(87,'San José de Maipo'),
(88,'Buin'),
(89,'Calera de Tango'),
(90,'Paine'),
(91,'San Bernardo'),
(92,'Alhué'),
(93,'Curacaví'),
(94,'María Pinto'),
(95,'Melipilla'),
(96,'San Pedro'),
(97,'Cerrillos'),
(98,'Cerro Navia'),
(99,'Conchalí'),
(100,'El Bosque'),
(101,'Estación Central'),
(102,'Huechuraba'),
(103,'Independencia'),
(104,'La Cisterna'),
(105,'La Granja'),
(106,'La Florida'),
(107,'La Pintana'),
(108,'La Reina'),
(109,'Las Condes'),
(110,'Lo Barnechea'),
(111,'Lo Espejo'),
(112,'Lo Prado'),
(113,'Macul'),
(114,'Maipú'),
(115,'Ñuñoa'),
(116,'Pedro Aguirre Cerda'),
(117,'Peñalolén'),
(118,'Providencia'),
(119,'Pudahuel'),
(120,'Quilicura'),
(121,'Quinta Normal'),
(122,'Recoleta'),
(123,'Renca'),
(124,'San Miguel'),
(125,'San Joaquín'),
(126,'San Ramón'),
(127,'Santiago'),
(128,'Vitacura'),
(129,'El Monte'),
(130,'Isla de Maipo'),
(131,'Padre Hurtado'),
(132,'Peñaflor'),
(133,'Talagante'),
(134,'Codegua'),
(135,'Coínco'),
(136,'Coltauco'),
(137,'Doñihue'),
(138,'Graneros'),
(139,'Las Cabras'),
(140,'Machalí'),
(141,'Malloa'),
(142,'Mostazal'),
(143,'Olivar'),
(144,'Peumo'),
(145,'Pichidegua'),
(146,'Quinta de Tilcoco'),
(147,'Rancagua'),
(148,'Rengo'),
(149,'Requínoa'),
(150,'San Vicente de Tagua Tagua'),
(151,'La Estrella'),
(152,'Litueche'),
(153,'Marchihue'),
(154,'Navidad'),
(155,'Peredones'),
(156,'Pichilemu'),
(157,'Chépica'),
(158,'Chimbarongo'),
(159,'Lolol'),
(160,'Nancagua'),
(161,'Palmilla'),
(162,'Peralillo'),
(163,'Placilla'),
(164,'Pumanque'),
(165,'San Fernando'),
(166,'Santa Cruz'),
(167,'Cauquenes'),
(168,'Chanco'),
(169,'Pelluhue'),
(170,'Curicó'),
(171,'Hualañé'),
(172,'Licantén'),
(173,'Molina'),
(174,'Rauco'),
(175,'Romeral'),
(176,'Sagrada Familia'),
(177,'Teno'),
(178,'Vichuquén'),
(179,'Colbún'),
(180,'Linares'),
(181,'Longaví'),
(182,'Parral'),
(183,'Retiro'),
(184,'San Javier'),
(185,'Villa Alegre'),
(186,'Yerbas Buenas'),
(187,'Constitución'),
(188,'Curepto'),
(189,'Empedrado'),
(190,'Maule'),
(191,'Pelarco'),
(192,'Pencahue'),
(193,'Río Claro'),
(194,'San Clemente'),
(195,'San Rafael'),
(196,'Talca'),
(197,'Arauco'),
(198,'Cañete'),
(199,'Contulmo'),
(200,'Curanilahue'),
(201,'Lebu'),
(202,'Los Álamos'),
(203,'Tirúa'),
(204,'Alto Biobío'),
(205,'Antuco'),
(206,'Cabrero'),
(207,'Laja'),
(208,'Los Ángeles'),
(209,'Mulchén'),
(210,'Nacimiento'),
(211,'Negrete'),
(212,'Quilaco'),
(213,'Quilleco'),
(214,'San Rosendo'),
(215,'Santa Bárbara'),
(216,'Tucapel'),
(217,'Yumbel'),
(218,'Chiguayante'),
(219,'Concepción'),
(220,'Coronel'),
(221,'Florida'),
(222,'Hualpén'),
(223,'Hualqui'),
(224,'Lota'),
(225,'Penco'),
(226,'San Pedro de La Paz'),
(227,'Santa Juana'),
(228,'Talcahuano'),
(229,'Tomé'),
(230,'Bulnes'),
(231,'Chillán'),
(232,'Chillán Viejo'),
(233,'Cobquecura'),
(234,'Coelemu'),
(235,'Coihueco'),
(236,'El Carmen'),
(237,'Ninhue'),
(238,'Ñiquen'),
(239,'Pemuco'),
(240,'Pinto'),
(241,'Portezuelo'),
(242,'Quillón'),
(243,'Quirihue'),
(244,'Ránquil'),
(245,'San Carlos'),
(246,'San Fabián'),
(247,'San Ignacio'),
(248,'San Nicolás'),
(249,'Treguaco'),
(250,'Yungay'),
(251,'Carahue'),
(252,'Cholchol'),
(253,'Cunco'),
(254,'Curarrehue'),
(255,'Freire'),
(256,'Galvarino'),
(257,'Gorbea'),
(258,'Lautaro'),
(259,'Loncoche'),
(260,'Melipeuco'),
(261,'Nueva Imperial'),
(262,'Padre Las Casas'),
(263,'Perquenco'),
(264,'Pitrufquén'),
(265,'Pucón'),
(266,'Saavedra'),
(267,'Temuco'),
(268,'Teodoro Schmidt'),
(269,'Toltén'),
(270,'Vilcún'),
(271,'Villarrica'),
(272,'Angol'),
(273,'Collipulli'),
(274,'Curacautín'),
(275,'Ercilla'),
(276,'Lonquimay'),
(277,'Los Sauces'),
(278,'Lumaco'),
(279,'Purén'),
(280,'Renaico'),
(281,'Traiguén'),
(282,'Victoria'),
(283,'Corral'),
(284,'Lanco'),
(285,'Los Lagos'),
(286,'Máfil'),
(287,'Mariquina'),
(288,'Paillaco'),
(289,'Panguipulli'),
(290,'Valdivia'),
(291,'Futrono'),
(292,'La Unión'),
(293,'Lago Ranco'),
(294,'Río Bueno'),
(295,'Ancud'),
(296,'Castro'),
(297,'Chonchi'),
(298,'Curaco de Vélez'),
(299,'Dalcahue'),
(300,'Puqueldón'),
(301,'Queilén'),
(302,'Quemchi'),
(303,'Quellón'),
(304,'Quinchao'),
(305,'Calbuco'),
(306,'Cochamó'),
(307,'Fresia'),
(308,'Frutillar'),
(309,'Llanquihue'),
(310,'Los Muermos'),
(311,'Maullín'),
(312,'Puerto Montt'),
(313,'Puerto Varas'),
(314,'Osorno'),
(315,'Puero Octay'),
(316,'Purranque'),
(317,'Puyehue'),
(318,'Río Negro'),
(319,'San Juan de la Costa'),
(320,'San Pablo'),
(321,'Chaitén'),
(322,'Futaleufú'),
(323,'Hualaihué'),
(324,'Palena'),
(325,'Aisén'),
(326,'Cisnes'),
(327,'Guaitecas'),
(328,'Cochrane'),
(329,'O\'higgins'),
(330,'Tortel'),
(331,'Coihaique'),
(332,'Lago Verde'),
(333,'Chile Chico'),
(334,'Río Ibáñez'),
(335,'Antártica'),
(336,'Cabo de Hornos'),
(337,'Laguna Blanca'),
(338,'Punta Arenas'),
(339,'Río Verde'),
(340,'San Gregorio'),
(341,'Porvenir'),
(342,'Primavera'),
(343,'Timaukel'),
(344,'Natales'),
(345,'Torres del Paine');

/*Select*/
select * from login;
select * from clientes;
SELECT * FROM metodosDePago;
SELECT * FROM tipoproductos;
SELECT * FROM marcas;
SELECT * FROM productos where idProducto = 37;
SELECT * FROM despacho ;
SELECT * FROM carrito;
SELECT * FROM venta;
SELECT * FROM venta_producto;

/* Buscar Compra Clientes */ 

SELECT p.UrlFoto, p.nombreProducto, v.subTotal, v.iva, v.total
FROM venta_producto vp INNER JOIN productos p 
ON vp.idProducto = p.idProducto INNER JOIN venta v
ON vp.idVenta = v.idVenta INNER JOIN carrito c
ON v.idCarrito = c.idCarrito INNER JOIN clientes cli
ON cli.rut = v.rut
WHERE cli.rut = 191331117 AND c.orden = '#Orden de Compra N°1';


/* Listado Ordenes de compra por fecha */ 
SELECT v.fecha, c.orden
FROM venta_producto vp INNER JOIN productos p 
ON vp.idProducto = p.idProducto INNER JOIN venta v
ON vp.idVenta = v.idVenta INNER JOIN carrito c
ON v.idCarrito = c.idCarrito INNER JOIN clientes cli
ON cli.rut = v.rut
WHERE cli.rut = 191331117
GROUP BY 2
ORDER BY 2;


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

/* Buscando Producto por oferta */

SELECT p.idProducto, p.nombreProducto, p.precioUnitario, p.stock, p.descripcion, t.descripcion, m.descripcion , p.urlFoto
FROM productos p INNER JOIN tipoproductos t
ON p.idTipoProducto = t.idTipoProducto INNER JOIN marcas m
ON p.idMarca = m.idMarca
WHERE p.estado = 1
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

/* buscar Stock producto */
SELECT stock FROM productos WHERE idProducto = 37;

/* UPDATE */

UPDATE productos p INNER JOIN tipoProductos t
ON p.idTipoProducto = t.idTipoProducto INNER JOIN marcas m
ON p.idMarca = m.idMarca
SET p.nombreProducto = 'hola', p.precioUnitario = 122, p.stock = 12,
p.descripcion = 'Hola1', p.idTipoProducto = 2, p.idMarca = 4, p.Urlfoto = 'A_CafeGold_CremeCaramel.jpg'
WHERE p.idProducto = 19;



UPDATE productos p INNER JOIN tipoProductos t ON p.idTipoProducto = t.idTipoProducto INNER JOIN marcas m ON p.idMarca = m.idMarca SET p.stock = 120 WHERE p.idProducto = 37;

/* DELETE */

DELETE FROM productos 
WHERE idProducto = 15;