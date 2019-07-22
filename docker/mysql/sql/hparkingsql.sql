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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `tb_cochera_tarifa` */

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
  CONSTRAINT `FK_tbcliente_tbcliente` FOREIGN KEY (`idUsuario`) REFERENCES `tbcliente` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `tbcochera` */

insert  into `tbcochera`(`id`,`idEmpresa`,`idUbicacion`,`nombre`,`fechaCreacion`,`fechaActualizacion`,`direccion`,`numVehiculos`,`banner`,`estado`) values (3,1,3940,'feat(buscador-avisos): Crear nuevo filtro departam','2019-07-21 21:13:56','2019-07-21 21:13:56','ddsda',2,NULL,1),(4,1,3940,'feat(buscador-avisos): Crear nuevo filtro departam','2019-07-21 21:13:56','2019-07-21 21:13:56','ddsda',2,NULL,1),(5,1,3940,'feat(buscador-avisos): Crear nuevo filtro departam','2019-07-21 21:13:56','2019-07-21 21:13:56','ddsda',2,NULL,1),(6,1,3940,'feat(buscador-avisos):','2019-07-21 21:13:56','2019-07-21 21:13:56','ddsda',2,NULL,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `tbempresa` */

insert  into `tbempresa`(`id`,`idUsuario`,`razonSocial`,`fechaCreacion`,`fechaActualizacion`,`ruc`,`celular`,`nombreComercial`,`direccion`,`logo`,`estado`) values (1,29,'solvier','2019-07-21 18:23:39','2019-07-21 18:23:39','15265254525','943627106','solvier sa','efsdfdf','null',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `tbusuario` */

insert  into `tbusuario`(`id`,`correo`,`password`,`rol`,`nombre`,`apellido`,`fechaCreacion`,`fechaActualizacion`,`estado`) values (23,'ronaldfox2015@gmail.com','12345678','empresa-user','Ronald','cutisaca','2019-06-30 00:00:00','2019-06-30 00:00:00',1),(24,'ronaldfox2015@gmail.com','12345678','empresa-user','Ronald','cutisaca','2019-06-30 00:00:00','2019-06-30 00:00:00',1),(25,'ronaldfox2015@gmail.com','12345678','empresa-user','Ronald','cutisaca','2019-06-30 00:00:00','2019-06-30 00:00:00',1),(26,'ronaldfox2015@gmail.com','12345678','empresa-user','Ronald','cutisaca','2019-06-30 00:00:00','2019-06-30 00:00:00',1),(27,'ronaldfox2015@gmail.com','12345678','empresa-user','Ronald','cutisaca','2019-06-30 00:00:00','2019-06-30 00:00:00',1),(28,'ronaldfox2015@gmail.com','12345678','empresa-user','Ronald','cutisaca','2019-06-30 00:00:00','2019-06-30 00:00:00',1),(29,'Ronald@gmail.com','ramirez2015','admin-empresa','Ronald','cutisaca','2019-07-21 18:23:39','2019-07-21 18:23:39',1);

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
