/*
SQLyog Ultimate v9.02 
MySQL - 5.5.62 : Database - dbhparking
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbhparking` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbhparking`;

/*Table structure for table `tb_cochera_tarifa` */

DROP TABLE IF EXISTS `tb_cochera_tarifa`;

CREATE TABLE `tb_cochera_tarifa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCochera` int(11) DEFAULT NULL,
  `nombre` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `descuento` float DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tb_cochera_tarifa` (`idCochera`),
  CONSTRAINT `FK_tb_cochera_tarifa` FOREIGN KEY (`idCochera`) REFERENCES `tbcochera` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `tb_cochera_tarifa` */

insert  into `tb_cochera_tarifa`(`id`,`idCochera`,`nombre`,`precio`,`descuento`,`estado`) values (1,3,'Alquiler',20,0,1),(2,4,'Alquiler',25,0,1),(3,5,'Alquiler',28,0,1),(4,6,'Alquiler',30,0,1),(5,8,'Alquiler',23,0,1),(6,9,'Alquiler',15,0,1),(7,10,'Alquiler',5,0,1),(8,11,'Alquiler',30,0,1),(9,12,'Alquiler',10,0,1),(10,13,'Alquiler',15,0,1),(11,14,'Alquiler',10,0,1),(12,15,'Alquiler',5,0,1);

/*Table structure for table `tbcliente` */

DROP TABLE IF EXISTS `tbcliente`;

CREATE TABLE `tbcliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `dni` varchar(8) COLLATE latin1_spanish_ci DEFAULT NULL,
  `celular` varchar(9) COLLATE latin1_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tbcliente_tbcliente` (`idUsuario`),
  CONSTRAINT `FK_tbcliente_tbcliente` FOREIGN KEY (`idUsuario`) REFERENCES `tbusuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `tbcliente` */

/*Table structure for table `tbcochera` */

DROP TABLE IF EXISTS `tbcochera`;

CREATE TABLE `tbcochera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) DEFAULT NULL,
  `idUbicacion` int(11) DEFAULT NULL,
  `nombre` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaActualizacion` datetime DEFAULT NULL,
  `direccion` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `numVehiculos` int(11) DEFAULT NULL,
  `banner` varchar(500) COLLATE latin1_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tbcochera_tbempresa` (`idEmpresa`),
  KEY `FK_tbcochera_tbubicacion` (`idUbicacion`),
  CONSTRAINT `FK_tbcochera_tbempresa` FOREIGN KEY (`idEmpresa`) REFERENCES `tbempresa` (`id`),
  CONSTRAINT `FK_tbcochera_tbubicacion` FOREIGN KEY (`idUbicacion`) REFERENCES `tbubicacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `tbcochera` */

insert  into `tbcochera`(`id`,`idEmpresa`,`idUbicacion`,`nombre`,`fechaCreacion`,`fechaActualizacion`,`direccion`,`numVehiculos`,`banner`,`estado`) values (3,1,3928,'GRUPO CANTOLAO','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO CONSULTAGRO',0,'',20),(4,1,3929,'CONSULTAGRO INGENIEROS SAC','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO INTERSEGURO',0,'',12),(5,1,3933,'INTERSEGURO COMPAÑIA DE SEGUROS S.A.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO HUAMANI',0,'',30),(6,1,3935,'HUAMANI & ASOCIADOS S.A.C','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO TECNOLOGY',0,'',15),(7,1,3928,'TECNOLOGY AJR S.R.L.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO CORPORACION',0,'',27),(8,1,3928,'CORPORACION ABG S.A.C.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO TALLER',0,'',34),(9,1,3928,'TALLER REQUE E.I.R.L.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO ROJAS',0,'',10),(10,1,3928,'FRESH CONCEPT S.A.C','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO MIBANCO',0,'',20),(11,1,3928,'MIBANCO - BANCO DE LA MICROEMPRESA S.A.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO AGROLIGHT',0,'',14),(12,1,3928,'AGROLIGHT PERU S.A.C.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO LIBIAS',0,'',25),(13,1,3928,'LIBIAS CRISANTO FRANCISCO JOHN','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO LAOS',0,'',18),(14,1,3928,'LAOS FERNANDEZ MOISES FELIPE','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO FIERROS',0,'',20),(15,1,3928,'FIERROS LORENTE SOCIEDAD ANONIMA CERRADA','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO AUTO',0,'',12),(16,1,3928,'AUTO SERVICIOS J.R R E.I.R.L.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO TORRES',0,'',10),(17,1,3928,'TORRES HERNANDEZ LIZ VERONICA','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO GRUPO',0,'',20),(18,1,3928,'GRUPO MCH TRANSPORT S.A.C','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO GRUPO',0,'',20),(19,1,3928,'GRUPO SORIA EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO PROVEEDORES',0,'',15),(20,1,3928,'PROVEEDORES DE CAFE Y CACAO Y SERVICIOS GENERALES SOCIEDAD COMERCIAL DE RESPONSABILIDAD LIMITADA','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO VIVANCO',0,'',20),(21,1,3928,'VIVANCO PALANTA JESICA','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO PERUANA',0,'',18),(22,1,3928,'PERUANA DE MOTORES H.G. S.A.C. - PERUMOTOR H.G. S.A.C.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO DISTRIBUIDORA',0,'',30),(23,1,3928,'DISTRIBUIDORA EMBID S.A.C.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO TRANSVIZA',0,'',15),(24,1,3928,'TRANSVIZA INTERNACIONAL SOC DE RESP LTDA','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO RODRIGUEZ',0,'',27),(25,1,3928,'RODRIGUEZ SIFUENTES SYNDY','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO ODAR',0,'',34),(26,1,3928,'ODAR SOPLOPUCO LUIS HUMBERTO','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO K2',0,'',10),(27,1,3928,'K2 SEGURIDAD Y RESGUARDO S.A.C.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO GRUPO',0,'',15),(28,1,3928,'GRUPO KAT MERCANTIL EMPRESA INDIVIDUAL DE RESPONSABILIDAD LTDA.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO J & V',0,'',20),(29,1,3928,'J & V RESGUARDO S.A.C.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO PREFABRIC',0,'',14),(30,1,3928,'PREFABRIC E.I.R.L.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO REYES',0,'',25),(31,1,3928,'REYES RIOS LUCARIA','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO NEW',0,'',18),(32,1,3928,'NEW IMAGE COMPANY S.A.C.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO DIAZ',0,'',20),(33,1,3928,'DIAZ PEREZ JOSE ISMAEL','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO VENTAS',0,'',12),(34,1,3928,'VENTAS GENERALES Y SERVICIOS PERCY MAX E.I.R.L.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO GERMANIA',0,'',10),(35,1,3928,'GERMANIA AUTOMOTRIZ S.A.C.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO INMOBILIARIA',0,'',20),(36,1,3928,'INMOBILIARIA MIRAFLORES PERU S.A.C.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO SOTO',0,'',20),(37,1,3928,'SOTO TECSI JAVIER','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO PRODUCTOS',0,'',15),(38,1,3928,'PRODUCTOS Y SOLUCIONES INDUSTRIALES S.A.C.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO EMPRESA',0,'',20),(39,1,3928,'EMPRESA DE TRANSPORTES ELIZA E.I.R.L ETELIZA E.I.R.L.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO FOREX',0,'',15),(40,1,3928,'FOREX CONSTRUCTIONS EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA - FOREX CONSTRUCTIONS E.I.R.L','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO CONTRATISTAS',0,'',27),(41,1,3928,'CONTRATISTAS SERVICIOS Y ALQUILER RODRIGUEZ SA','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO FCA',0,'',34),(42,1,3928,'FCA DE PAPELES PARACAS S A','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO DECORACIONES',0,'',10),(43,1,3928,'DECORACIONES FATIMA E.I.R.L.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO CASIMIRES',0,'',15),(44,1,3928,'CASIMIRES NABILA S.A.C.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO HD',0,'',20),(45,1,3928,'HD CONFECCIONES E.I.R.L.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO L & L',0,'',14),(46,1,3928,'L & L DESIGNERS E.I.R.L','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO MADERERA',0,'',15),(47,1,3928,'MADERERA LA TABLADA EIRL','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO ORGANIZAC',0,'',27),(48,1,3928,'ORGANIZAC NACIONAL DE SERVS Y ABAST EIRL','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO NEUMA',0,'',34),(49,1,3928,'VAMOSDEX S.A.C.','2019-07-22 17:11:25','0000-00-00 00:00:00','ESTACIONAMIENTO SAN JORGE ',0,'',15),(50,1,3928,'SAN JORGE TRANSPORTES E INVERSIONES S.A.C.','2019-07-22 17:11:25','0000-00-00 00:00:00','',0,'',25);

/*Table structure for table `tbempresa` */

DROP TABLE IF EXISTS `tbempresa`;

CREATE TABLE `tbempresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `razonSocial` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaActualizacion` datetime DEFAULT NULL,
  `ruc` varchar(11) COLLATE latin1_spanish_ci DEFAULT NULL,
  `celular` varchar(9) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nombreComercial` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `direccion` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `logo` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tbempresa_tbusuario` (`idUsuario`),
  CONSTRAINT `FK_tbempresa_tbusuario` FOREIGN KEY (`idUsuario`) REFERENCES `tbusuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `tbempresa` */

insert  into `tbempresa`(`id`,`idUsuario`,`razonSocial`,`fechaCreacion`,`fechaActualizacion`,`ruc`,`celular`,`nombreComercial`,`direccion`,`logo`,`estado`) values (1,1,'GRUPO CANTOLAO','0000-00-00 00:00:00','0000-00-00 00:00:00','20563267829','967456355','GRUPO CANTOLAO','AV. ELMER FAUCETT Nº 320 - URB. MARANGA  - SAN MIG','',1),(2,2,'CONSULTAGRO INGENIEROS SAC','0000-00-00 00:00:00','0000-00-00 00:00:00','20494356652','967456346','CONSULTAGRO INGENIEROS SAC','AV. CANADÁ Nº 298, ESQUINA CON JIRÓN CARVALO  - LA','',1),(3,3,'INTERSEGURO COMPAÑIA DE SEGUROS S.A.','0000-00-00 00:00:00','0000-00-00 00:00:00','20382748566','967456347','INTERSEGURO COMPAÑIA DE SEGUROS S.A.','AV. MANCO CÁPAC Nº 301,305,311,317 Y 321 ESQUINA C','',1),(4,4,'HUAMANI & ASOCIADOS S.A.C','0000-00-00 00:00:00','0000-00-00 00:00:00','20543376125','967456348','HUAMANI & ASOCIADOS S.A.C','AV. LOS HÉROES Nº 1187 - 1189 - SAN JUAN DE MIRAFL','',1),(5,5,'TECNOLOGY AJR S.R.L.','0000-00-00 00:00:00','0000-00-00 00:00:00','20601741351','967456349','TECNOLOGY AJR S.R.L.','AV. REPÚBLICA DE PANAMÁ  Nº 4120                  ','',1),(6,6,'CORPORACION ABG S.A.C.','0000-00-00 00:00:00','0000-00-00 00:00:00','20563267829','967456350','CORPORACION ABG S.A.C.','AV.  REPÚBLICA DE PANAMÁ  Nº 5025 - SURQUILLO','',1),(7,7,'TALLER REQUE E.I.R.L.','0000-00-00 00:00:00','0000-00-00 00:00:00','20445388069','967456351','TALLER REQUE E.I.R.L.','AV. NICOLÁS DE PIÉROLA Nº  800 ESQ. CON AV. VILLA ','',1),(8,8,'ROJAS MARKET E.I.R.L','0000-00-00 00:00:00','0000-00-00 00:00:00','20452258103','967456352','ROJAS MARKET E.I.R.L','AV. TÚPAC AMARÚ  Nº 3685 MZ. P, LOTE 24,25,26,27,2','',1),(9,9,'FRESH CONCEPT S.A.C','0000-00-00 00:00:00','0000-00-00 00:00:00','20603373007','967456353','FRESH CONCEPT S.A.C','AV. QUILCA S/N CDRA. 11 , INTERSECCIÓN CALLE 4 Y 5','',1),(10,10,'MIBANCO - BANCO DE LA MICROEMPRESA S.A.','0000-00-00 00:00:00','0000-00-00 00:00:00','20382036655','967456354','MIBANCO - BANCO DE LA MICROEMPRESA S.A.','AV. MARIANO CORNEJO Nº 1504-1508  - LIMA','',1),(11,11,'AGROLIGHT PERU S.A.C.','0000-00-00 00:00:00','0000-00-00 00:00:00','20552103816','967456355','AGROLIGHT PERU S.A.C.','AV. LIMA Nº 3100 ESQ. AV. PACASMAYO Y JR. CAMANÁ  ','',1),(12,12,'LIBIAS CRISANTO FRANCISCO JOHN','0000-00-00 00:00:00','0000-00-00 00:00:00','10443246172','967456356','LIBIAS CRISANTO FRANCISCO JOHN','AV. ARGENTINA Nº 798-790 ESQ. CON JR. RODOLFO BELT','',1),(13,13,'LAOS FERNANDEZ MOISES FELIPE','0000-00-00 00:00:00','0000-00-00 00:00:00','10095985004','967456357','LAOS FERNANDEZ MOISES FELIPE','AV. SALAVERRY Nº 930 - URB. PATAZCA - CHICLAYO','',1),(14,14,'FIERROS LORENTE SOCIEDAD ANONIMA CERRADA','0000-00-00 00:00:00','0000-00-00 00:00:00','20467936337','967456358','FIERROS LORENTE SOCIEDAD ANONIMA CERRADA','AV. LAS FLORES DE PRIMAVERA ESQ. CON JR. LAS RIMAR','',1),(15,16,'TORRES HERNANDEZ LIZ VERONICA','0000-00-00 00:00:00','0000-00-00 00:00:00','10477145545','967456360','TORRES HERNANDEZ LIZ VERONICA','AV. JOSÉ  CARLOS MARIÁTEGUI LT.1 MZ. G ASC E. DE V','',1),(16,17,'GRUPO MCH TRANSPORT S.A.C','0000-00-00 00:00:00','0000-00-00 00:00:00','20555774801','967456361','GRUPO MCH TRANSPORT S.A.C','AV. CAMINOS DEL INCA ESQ. CALLE LOS SINCHIS , MZ. ','',1),(17,18,'GRUPO SORIA EMPRESA INDIVIDUAL DE RESPONSABILIDAD ','0000-00-00 00:00:00','0000-00-00 00:00:00','20527756392','967456362','GRUPO SORIA EMPRESA INDIVIDUAL DE RESPONSABILIDAD ','AV. MALECÓN CHECA  Nº 2599, MZ. M, SUB LOTE 3-B-B,','',1),(18,19,'PROVEEDORES DE CAFE Y CACAO Y SERVICIOS GENERALES ','0000-00-00 00:00:00','0000-00-00 00:00:00','20528079131','967456363','PROVEEDORES DE CAFE Y CACAO Y SERVICIOS GENERALES ','PROLONGACIÓN AV. GENERAL JOSÉ DE LA MAR N° 2382 Y ','',1),(19,20,'VIVANCO PALANTA JESICA','0000-00-00 00:00:00','0000-00-00 00:00:00','10249948964','967456364','VIVANCO PALANTA JESICA','AV. SÁNCHEZ CERRO  MZ. 252, LOTE 2, ZONA  INDUSTRI','',1),(20,21,'PERUANA DE MOTORES H.G. S.A.C. - PERUMOTOR H.G. S.','0000-00-00 00:00:00','0000-00-00 00:00:00','20453919651','967456365','PERUANA DE MOTORES H.G. S.A.C. - PERUMOTOR H.G. S.','AV. LIMA Nº 2100  - VILLA MARÍA DEL TRIUNFO','',1),(21,22,'DISTRIBUIDORA EMBID S.A.C.','0000-00-00 00:00:00','0000-00-00 00:00:00','20485180797','967456366','DISTRIBUIDORA EMBID S.A.C.','AV. NICOLAS DUEÑAS Nº 308 - 310 ESQ. CON AV. ENRIQ','',1),(22,23,'TRANSVIZA INTERNACIONAL SOC DE RESP LTDA','0000-00-00 00:00:00','0000-00-00 00:00:00','20286155074','967456367','TRANSVIZA INTERNACIONAL SOC DE RESP LTDA','AV. MICAELA BASTIDAS Y CALLE 8 MZ. J GRUPO 19 LOTE','',1),(23,24,'RODRIGUEZ SIFUENTES SYNDY','0000-00-00 00:00:00','0000-00-00 00:00:00','10451940177','967456368','RODRIGUEZ SIFUENTES SYNDY','AV. LOS HÉROES Nº 1109 - SAN JUAN DE MIRAFLORES','',1),(24,25,'ODAR SOPLOPUCO LUIS HUMBERTO','0000-00-00 00:00:00','0000-00-00 00:00:00','10176058043','967456369','ODAR SOPLOPUCO LUIS HUMBERTO','AV. ELMER FAUCETT N° 417 ESQ. CALLE JAZPAMPA - CAL','',1),(25,26,'K2 SEGURIDAD Y RESGUARDO S.A.C.','0000-00-00 00:00:00','0000-00-00 00:00:00','20548314390','967456370','K2 SEGURIDAD Y RESGUARDO S.A.C.','AV. SAN LUIS 707, ESQUINA AUGUSTO DURAND - SAN LUI','',1),(26,27,'GRUPO KAT MERCANTIL EMPRESA INDIVIDUAL DE RESPONSA','0000-00-00 00:00:00','0000-00-00 00:00:00','20406507336','967456371','GRUPO KAT MERCANTIL EMPRESA INDIVIDUAL DE RESPONSA','AV. OSCAR BENAVIDES CDRA. 13 INTERSECCIÓN CON EL J','',1),(27,28,'J & V RESGUARDO S.A.C.','0000-00-00 00:00:00','0000-00-00 00:00:00','20100901481','967456372','J & V RESGUARDO S.A.C.','AV. CIRCUNVALACIÓN Nº 1411 ESQ. CON LAS CALLES LEÓ','',1),(28,29,'PREFABRIC E.I.R.L.','0000-00-00 00:00:00','0000-00-00 00:00:00','20603901241','967456373','PREFABRIC E.I.R.L.','PREDIO LARREA PARCELA B (ALTURA KM. 557 DE LA PANA','',1),(29,30,'REYES RIOS LUCARIA','0000-00-00 00:00:00','0000-00-00 00:00:00','10181592147','967456374','REYES RIOS LUCARIA','AV. REPUBLICA DE PANAMÁ 4909-4917 Y JR. MARIANO JU','',1),(30,31,'NEW IMAGE COMPANY S.A.C.','0000-00-00 00:00:00','0000-00-00 00:00:00','20600067673','967456375','NEW IMAGE COMPANY S.A.C.','AV. MARÍA REICH Y AV. SEPARADORA INDUSTRIAL, IV ET','',1),(31,32,'DIAZ PEREZ JOSE ISMAEL','0000-00-00 00:00:00','0000-00-00 00:00:00','15276171230','967456376','DIAZ PEREZ JOSE ISMAEL','AV. PACHACÚTEC   Nº  3859  ESQ. CON JR. LA MERCED,','',1),(32,33,'VENTAS GENERALES Y SERVICIOS PERCY MAX E.I.R.L.','0000-00-00 00:00:00','0000-00-00 00:00:00','20561302686','967456377','VENTAS GENERALES Y SERVICIOS PERCY MAX E.I.R.L.','AV. ALFREDO MENDIOLA N°6200, URB. INDUSTRIAL MOLIT','',1),(33,34,'GERMANIA AUTOMOTRIZ S.A.C.','0000-00-00 00:00:00','0000-00-00 00:00:00','20101341616','967456378','GERMANIA AUTOMOTRIZ S.A.C.','AV. SANTIAGO DE CHUCO   Nº 501 ESQ. CON AV. APÚRIM','',1),(34,35,'INMOBILIARIA MIRAFLORES PERU S.A.C.','0000-00-00 00:00:00','0000-00-00 00:00:00','20523155572','967456379','INMOBILIARIA MIRAFLORES PERU S.A.C.','CARRETERA PANAMERICANA SUR KM. 97.5 - ASIA','',1),(35,36,'SOTO TECSI JAVIER','0000-00-00 00:00:00','0000-00-00 00:00:00','10454443239','967456380','SOTO TECSI JAVIER','AV. PRÓCERES DE LA INDEPENDENCIA  Nº  2100  - SAN ','',1),(36,37,'PRODUCTOS Y SOLUCIONES INDUSTRIALES S.A.C.','0000-00-00 00:00:00','0000-00-00 00:00:00','20603038500','967456381','PRODUCTOS Y SOLUCIONES INDUSTRIALES S.A.C.','AV. CARLOS IZAGUIRRE  Nº 220  ESQ. CON CALLE NAPO ','',1),(37,38,'EMPRESA DE TRANSPORTES ELIZA E.I.R.L ETELIZA E.I.R','0000-00-00 00:00:00','0000-00-00 00:00:00','20538149307','967456382','EMPRESA DE TRANSPORTES ELIZA E.I.R.L ETELIZA E.I.R','AV. LA MOLINA Nº 377-397, PARCELA SEMIRÚSTICA LA M','',1),(38,39,'FOREX CONSTRUCTIONS EMPRESA INDIVIDUAL DE RESPONSA','0000-00-00 00:00:00','0000-00-00 00:00:00','20541517139','967456383','FOREX CONSTRUCTIONS EMPRESA INDIVIDUAL DE RESPONSA','AV. ALCIDES VIGO, ESQUINA CON CALLE NORUEGA, URB. ','',1),(39,40,'CONTRATISTAS SERVICIOS Y ALQUILER RODRIGUEZ SA','0000-00-00 00:00:00','0000-00-00 00:00:00','20166373191','967456384','CONTRATISTAS SERVICIOS Y ALQUILER RODRIGUEZ SA','AV. ALFREDO MENDIOLA N° 1395 - URB. LA MILLA - SAN','',1),(40,41,'FCA DE PAPELES PARACAS S A','0000-00-00 00:00:00','0000-00-00 00:00:00','20100009715','967456385','FCA DE PAPELES PARACAS S A','ANTIGUA PANAMERICANA NORTE KM. 196 - BARRANCA','',1),(41,42,'DECORACIONES FATIMA E.I.R.L.','0000-00-00 00:00:00','0000-00-00 00:00:00','20137516501','967456386','DECORACIONES FATIMA E.I.R.L.','AV. GERARDO UNGER Nº 3301, ESQUINA CON JR. RUFINO ','',1),(42,43,'CASIMIRES NABILA S.A.C.','0000-00-00 00:00:00','0000-00-00 00:00:00','20305882071','967456387','CASIMIRES NABILA S.A.C.','AV.  FELIPE SANTIAGO SALAVERRY Nº 341, URB. EL PIN','',1),(43,44,'HD CONFECCIONES E.I.R.L.','0000-00-00 00:00:00','0000-00-00 00:00:00','20557053566','967456388','HD CONFECCIONES E.I.R.L.','AV. UNIVERSITARIA N° 415 ENTRE AV. ENRIQUE MEIGSS ','',1),(44,45,'L & L DESIGNERS E.I.R.L','0000-00-00 00:00:00','0000-00-00 00:00:00','20524794366','967456389','L & L DESIGNERS E.I.R.L','AV. FERMÍN TANGUIS Nª 200-220 - PISCO','',1),(45,46,'MADERERA LA TABLADA EIRL','0000-00-00 00:00:00','0000-00-00 00:00:00','20294113101','967456390','MADERERA LA TABLADA EIRL','AV. LA MOLINA N° 448 - ATE','',1),(46,47,'ORGANIZAC NACIONAL DE SERVS Y ABAST EIRL','0000-00-00 00:00:00','0000-00-00 00:00:00','20102286899','967456391','ORGANIZAC NACIONAL DE SERVS Y ABAST EIRL','AV. ALFREDO MENDIOLA Nº 700- 704 - SAN MARTIN DE P','',1),(47,48,'NEUMA PERU CONTRATISTAS GENERALES S.A.C.','0000-00-00 00:00:00','0000-00-00 00:00:00','20110963875','967456392','NEUMA PERU CONTRATISTAS GENERALES S.A.C.','AV. EL TRIUNFO Nº 210                             ','',1),(48,49,'VAMOSDEX S.A.C.','0000-00-00 00:00:00','0000-00-00 00:00:00','20557829467','967456393','VAMOSDEX S.A.C.','AV. UNIVERSITARIA NORTE  Nº 5771-5779 - COMAS','',1),(49,50,'SAN JORGE TRANSPORTES E INVERSIONES S.A.C.','0000-00-00 00:00:00','0000-00-00 00:00:00','20503744245','967456394','SAN JORGE TRANSPORTES E INVERSIONES S.A.C.','MZ. A, LOTE 25, URB. INDUSTRIAL INFANTAS - LOS OLI','',1);

/*Table structure for table `tbreserva` */

DROP TABLE IF EXISTS `tbreserva`;

CREATE TABLE `tbreserva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idVehiculo` int(11) DEFAULT NULL,
  `idCochera` int(11) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaActualizacion` datetime DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tbreserva_tbvehiculo` (`idVehiculo`),
  KEY `FK_tbreserva_tbcochera` (`idCochera`),
  CONSTRAINT `FK_tbreserva_tbcochera` FOREIGN KEY (`idCochera`) REFERENCES `tbcochera` (`id`),
  CONSTRAINT `FK_tbreserva_tbvehiculo` FOREIGN KEY (`idVehiculo`) REFERENCES `tbvehiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `tbreserva` */

/*Table structure for table `tbubicacion` */

DROP TABLE IF EXISTS `tbubicacion`;

CREATE TABLE `tbubicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `padre` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `coordenada` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3971 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `tbubicacion` */

insert  into `tbubicacion`(`id`,`name`,`padre`,`coordenada`,`estado`) values (3928,'Cercado de Lima','3927','',1),(3929,'Ancon','3927','',1),(3930,'Ate','3927','',1),(3931,'Barranco','3927','',1),(3932,'BreÃ±a','3927','',1),(3933,'Carabayllo','3927','',1),(3934,'Chaclacayo','3927','',1),(3935,'Chorrillos','3927','',1),(3936,'Cieneguilla','3927','',1),(3937,'Comas','3927','',1),(3938,'El Agustino','3927','',1),(3939,'Independencia','3927','',1),(3940,'Jesus Maria','3927','',1),(3941,'La Molina','3927','',1),(3942,'La Victoria','3927','',1),(3943,'Lince','3927','',1),(3944,'Los Olivos','3927','',1),(3945,'Lurigancho','3927','',1),(3946,'Lurin','3927','',1),(3947,'Magdalena del Mar','3927','',1),(3948,'Pueblo Libre','3927','',1),(3949,'Miraflores','3927','',1),(3950,'Pachacamac','3927','',1),(3951,'Pucusana','3927','',1),(3952,'Puente Piedra','3927','',1),(3953,'Punta Hermosa','3927','',1),(3954,'Punta Negra','3927','',1),(3955,'Rimac','3927','',1),(3956,'San Bartolo','3927','',1),(3957,'San Borja','3927','',1),(3958,'San Isidro','3927','',1),(3959,'San Juan de Lurigancho','3927','',1),(3960,'San Juan de Miraflores','3927','',1),(3961,'San Luis','3927','',1),(3962,'San Martin de Porres','3927','',1),(3963,'San Miguel','3927','',1),(3964,'Santa Anita','3927','',1),(3965,'Santa Maria del Mar','3927','',1),(3966,'Santa Rosa','3927','',1),(3967,'Santiago de Surco','3927','',1),(3968,'Surquillo','3927','',1),(3969,'Villa El Salvador','3927','',1),(3970,'Villa Maria del Triunfo','3927','',1);

/*Table structure for table `tbusuario` */

DROP TABLE IF EXISTS `tbusuario`;

CREATE TABLE `tbusuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `correo` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `password` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `rol` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nombre` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `apellido` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaActualizacion` datetime DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `tbusuario` */

insert  into `tbusuario`(`id`,`correo`,`password`,`rol`,`nombre`,`apellido`,`fechaCreacion`,`fechaActualizacion`,`estado`) values (1,'cathita_acosta@hotmail.com','N00Bbo6UE8','empresa-user','Lorena Cahterine ','Acosta Olivares','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(2,'ambrosio82@gmail.com','SgqFfpaDry','empresa-user','Camilo','Aros Verdugo','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(3,'caIrolaasm@hotmail.com','pNN36rjmA3','empresa-user','Carola ','Avendaño San Martín','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(4,'danycast98@hotmail.com','cqCMJkwY4L','empresa-user','Daniel','Castillo Vega','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(5,'marjobio@hotmail.com','aVHOdpgtVc','empresa-user','Marjorie','Castro Castro','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(6,'mldelgadillo.v@hotmail.com','nmg0FGAQgL','empresa-user','María Liliana ','Delgadillo Vera','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(7,'Lorena_firu@yahoo.es','hKIEkdQqZ9','empresa-user','Caahterine Lorena ','Fernández del Rio Donoso','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(8,'mgajardo@utalca.cl','QIyInXn1HB','empresa-user','Manuel Jesús','Gajardo Ordenes','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(9,'jgutierrezp@santotomas.cl','UDMtpbAi9x','empresa-user','Juan José ','Gutierrez Paredes','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(10,'claudiohinojosa@hotmail.com','NooSmRHAQY','empresa-user','Claudio','Hinojosa Torres','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(11,'emarin@upla.cl','y5KF0xg1oO','empresa-user','Elias','Marín Valenzuela','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(12,'rmerino@amqualitas.cl','L5Ojo8bwao','empresa-user','Roberto','Merino Orostica','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(13,'neilorange2952@yahoo.com','H46VPvAoVI','empresa-user','Nelson','Naranjo Mayorga','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(14,'orregoldi@hotmail.com','uRPl5UIP2q','empresa-user','Karina','Orrego Ebertoldi','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(15,'Judith.rabuco@udelmar.cl','pHbfTNaS9L','empresa-user','Judith','Rabuco Madera','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(16,'t_soto@dsvalpo.cl','SgFG4xlKFw','empresa-user','Tatiana','Soto Schurter','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(17,'rvaldes@udec.cl','AVbJ4tLRHy','empresa-user','Rosina','Valdés Carrasco','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(18,'hvargas@unab.cl','XGHS9sTGeB','empresa-user','Hugo','Vargas Díaz','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(19,'kcastro@yahoo.com','iPrgGJqn1P','empresa-user','Karina','Castro Villanueva','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(20,'CarlosEnrique@hotmail.com','LQQ7YPPJVx','empresa-user','Carlos Enrique','Hucacachi Ramirez','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(21,'miriamc@udelmar.cl','oo4NFEFGE3','empresa-user','Miriam Esther','Cordova Gutarra','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(22,'lsoto@dsvalpo.cl','ypDv42W2uJ','empresa-user','Lorena Cristral','Soto Canchari','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(23,'iabarcae@yahoo.es','T79VBeN2FuQtdEp9','empresa-user','Ingrid','Abarca Alvarez','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(24,'xxxa@gmail.com','oVEhN0aivrd7Zgwp','empresa-user','Francisca','Abumohor Castillo','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(25,'carlosaguileram@hotmail.com','N3bevf0qPQ','empresa-user','Carlos','Aguilar Morales','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(26,'ronaldfox2015@gmail.com','WAi58ja8KQ','empresa-user','Eduardo Arancibia Luna','cutisaca','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(27,'paulifran@hotmail.com','AOIKn3jFAe','empresa-user','Paula','Araya Vargas','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(28,'bantomaui@gmail.com','u3uLviadCV','empresa-user','Luis Leonardo','Banto Fernandez','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(29,'jbarrera05@hotmail.com','3oRg6wFutR','empresa-user','Jorge','Barrera Calderon','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(30,'ricardo.espinosa.z@hotmail.com','6qF8kB51As','empresa-user','Ricardo','Espinoza Sernades','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(31,'isabelina50@yahoo.com.es','VLKoAp77fh','empresa-user','Isabel','Espoz Huerta','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(32,'enrigom@gmail.com','EnZoeGkvpb','empresa-user','Enrique','Gomez Alva','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(33,'cathita_acosta@hotmail.com','u934cLsCOM','empresa-user','Cahterine ','Acosta Olivares','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(34,'carolaasm@hotmail.com','CB4Zd7T6K3','empresa-user','Carola','Avendaño San Martin','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(35,'marjobio@hotmail.com','JBIBUlWNJ3','empresa-user','Marjorie','Castro Castro','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(36,'mldelgadillo.v@hotmail.com','cD8N1oul1E','empresa-user','Maria Liliana','Delgadillo Vera','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(37,'Lorena_firu@yahoo.es','spoI9TE4XV','empresa-user','Lorena ','Fernandez del Rio Donoso','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(38,'mgajardo@utalca.cl','acdk3jf0dd','empresa-user','Manuel Jesús ','Gajardo Ordenes','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(39,'jgutierrezp@santotomas.cl','Ts9TjLf731','empresa-user','Claudio','Hinojosa Torres','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(40,'emarin@upla.cl','N00Bbo6UE8','empresa-user','Elías ','Marín Valenzuela','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(41,'ramirezflor@hotmail.com','B47GxIEMSS','empresa-user','Flor','Ramirez Yovera','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(42,'ecardenas@udec.cl','MjxZyhgu5d','empresa-user','Estherfilia','Fernandez Cardenas','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(43,'agaray@unab.cl','8LeKpewGlg','empresa-user','Luis Alberto','Garay Rivera','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(44,'lvillena@yahoo.com','7joGv3Todr','empresa-user','Luis Alberto','Yañez Villena','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(45,'ralva@hotmail.com','7joGv3Todr','empresa-user','Rodolfo ','Alva Belupu','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(46,'jsernades@udelmar.cl','2jkQ9nrtm0','empresa-user','Jose Carlos','Sernades Cordova','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(47,'cramirez@dsvalpo.cl','lolLTZdLLf','empresa-user','Claudia ','Ramirez Villa','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(48,'projas@udec.cl','xAQaTSrVeW','empresa-user','Percy Eddy','Rojas Castillo','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(49,'mvillafranca@unab.cl','VKESGOJF57','empresa-user','Maria Alejandra','Villafranca Ramirez','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(50,'maeillanes@hotmail.com','WrueO1UcL7y1SE1Y','empresa-user','Maritza Maria','Alcantara Villanueva','0000-00-00 00:00:00','0000-00-00 00:00:00',1);

/*Table structure for table `tbvehiculo` */

DROP TABLE IF EXISTS `tbvehiculo`;

CREATE TABLE `tbvehiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) DEFAULT NULL,
  `placa` varchar(7) COLLATE latin1_spanish_ci DEFAULT NULL,
  `modelo` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  `descripcion` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaActualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tbvehiculo_tbcliente` (`idCliente`),
  CONSTRAINT `FK_tbvehiculo_tbcliente` FOREIGN KEY (`idCliente`) REFERENCES `tbcliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `tbvehiculo` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
