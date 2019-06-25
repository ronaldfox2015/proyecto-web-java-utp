-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.40-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para dbhparking
CREATE DATABASE IF NOT EXISTS `dbhparking` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */;
USE `dbhparking`;

-- Volcando estructura para tabla dbhparking.tbcliente
CREATE TABLE IF NOT EXISTS `tbcliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `dni` varchar(8) COLLATE latin1_spanish_ci DEFAULT NULL,
  `celular` varchar(9) COLLATE latin1_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tbcliente_tbcliente` (`idUsuario`),
  CONSTRAINT `FK_tbcliente_tbcliente` FOREIGN KEY (`idUsuario`) REFERENCES `tbcliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla dbhparking.tbcliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbcliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbcliente` ENABLE KEYS */;

-- Volcando estructura para tabla dbhparking.tbcochera
CREATE TABLE IF NOT EXISTS `tbcochera` (
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

-- Volcando datos para la tabla dbhparking.tbcochera: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbcochera` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbcochera` ENABLE KEYS */;

-- Volcando estructura para tabla dbhparking.tbempresa
CREATE TABLE IF NOT EXISTS `tbempresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `razonSocial` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaActualizacion` datetime DEFAULT NULL,
  `ruc` varchar(9) COLLATE latin1_spanish_ci DEFAULT NULL,
  `celular` varchar(9) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nombreComercial` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `direccion` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `logo` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tbempresa_tbusuario` (`idUsuario`),
  CONSTRAINT `FK_tbempresa_tbusuario` FOREIGN KEY (`idUsuario`) REFERENCES `tbusuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla dbhparking.tbempresa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbempresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbempresa` ENABLE KEYS */;

-- Volcando estructura para tabla dbhparking.tbreserva
CREATE TABLE IF NOT EXISTS `tbreserva` (
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

-- Volcando datos para la tabla dbhparking.tbreserva: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbreserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbreserva` ENABLE KEYS */;

-- Volcando estructura para tabla dbhparking.tbtarifa
CREATE TABLE IF NOT EXISTS `tbtarifa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `descuento` float DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla dbhparking.tbtarifa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbtarifa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbtarifa` ENABLE KEYS */;

-- Volcando estructura para tabla dbhparking.tbubicacion
CREATE TABLE IF NOT EXISTS `tbubicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `padre` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `coordenada` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla dbhparking.tbubicacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbubicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbubicacion` ENABLE KEYS */;

-- Volcando estructura para tabla dbhparking.tbusuario
CREATE TABLE IF NOT EXISTS `tbusuario` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla dbhparking.tbusuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbusuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbusuario` ENABLE KEYS */;

-- Volcando estructura para tabla dbhparking.tbvehiculo
CREATE TABLE IF NOT EXISTS `tbvehiculo` (
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

-- Volcando datos para la tabla dbhparking.tbvehiculo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbvehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbvehiculo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
