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
  `idTarifa` int(11) DEFAULT NULL,
  `idUbicacion` int(11) DEFAULT NULL,
  `nombre` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaActualizacion` datetime DEFAULT NULL,
  `direccion` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `numVehiculos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tbcochera_tbempresa` (`idEmpresa`),
  KEY `FK_tbcochera_tbtarifa` (`idTarifa`),
  KEY `FK_tbcochera_tbubicacion` (`idUbicacion`),
  CONSTRAINT `FK_tbcochera_tbempresa` FOREIGN KEY (`idEmpresa`) REFERENCES `tbempresa` (`id`),
  CONSTRAINT `FK_tbcochera_tbtarifa` FOREIGN KEY (`idTarifa`) REFERENCES `tbtarifa` (`id`),
  CONSTRAINT `FK_tbcochera_tbubicacion` FOREIGN KEY (`idUbicacion`) REFERENCES `tbubicacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `tbcochera` */

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `tbempresa` */

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

/*Table structure for table `tbtarifa` */

DROP TABLE IF EXISTS `tbtarifa`;

CREATE TABLE `tbtarifa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `descuento` float DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `tbtarifa` */

/*Table structure for table `tbubicacion` */

DROP TABLE IF EXISTS `tbubicacion`;

CREATE TABLE `tbubicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `padre` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `coordenada` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `tbubicacion` */

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

/*Data for the table `tbusuario` */

insert  into `tbusuario`(`id`,`correo`,`password`,`rol`,`nombre`,`apellido`,`fechaCreacion`,`fechaActualizacion`,`estado`) values (23,'ronaldfox2015@gmail.com','12345678','empresa-user','Ronald','cutisaca','2019-06-30 00:00:00','2019-06-30 00:00:00',1),(24,'ronaldfox2015@gmail.com','12345678','empresa-user','Ronald','cutisaca','2019-06-30 00:00:00','2019-06-30 00:00:00',1),(25,'ronaldfox2015@gmail.com','12345678','empresa-user','Ronald','cutisaca','2019-06-30 00:00:00','2019-06-30 00:00:00',1),(26,'ronaldfox2015@gmail.com','12345678','empresa-user','Ronald','cutisaca','2019-06-30 00:00:00','2019-06-30 00:00:00',1),(27,'ronaldfox2015@gmail.com','12345678','empresa-user','Ronald','cutisaca','2019-06-30 00:00:00','2019-06-30 00:00:00',1),(28,'ronaldfox2015@gmail.com','12345678','empresa-user','Ronald','cutisaca','2019-06-30 00:00:00','2019-06-30 00:00:00',1);

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
