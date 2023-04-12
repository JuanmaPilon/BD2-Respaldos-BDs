-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.34-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema mimusica
--

CREATE DATABASE IF NOT EXISTS mimusica;
USE mimusica;

--
-- Definition of table `artista`
--

DROP TABLE IF EXISTS `artistas`;
CREATE TABLE `Artistas` (
  `id_artista` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `artista` varchar(50) NOT NULL,
  PRIMARY KEY (`id_artista`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artista`
--

/*!40000 ALTER TABLE `artistas` DISABLE KEYS */;
INSERT INTO `Artistas` (`id_artista`,`artista`) VALUES 
 (1,'jaime roos'),
 (2,'laura canoura'),
 (3,'beatles'),
 (4,'fito paez'),
 (5,'ricardo montaner'),
 (6,'los olimareños'),
 (7,'queen'),
 (8,'alejandro lerner'),
 (9,'ma. elena walsh');
/*!40000 ALTER TABLE `artistas` ENABLE KEYS */;


--
-- Definition of table `cds`
--

DROP TABLE IF EXISTS `Cds`;
CREATE TABLE `Cds` (
  `id_cd` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_artista` int(10) unsigned NOT NULL,
  `nombre_cd` varchar(50) NOT NULL,
  `año` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_cd`),
  KEY `FK_cds_1` (`id_artista`),
  CONSTRAINT `FK_cds_1` FOREIGN KEY (`id_artista`) REFERENCES `Artistas` (`id_artista`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cds`
--

/*!40000 ALTER TABLE `cds` DISABLE KEYS */;
INSERT INTO `Cds` (`id_cd`,`id_artista`,`nombre_cd`,`año`) VALUES 
 (1,2,'esa tristeza',1995),
 (2,9,'para los mas chiquititos',1978),
 (3,9,'juguemos en el mundo',1985),
 (4,6,'cielito del olimar',1969),
 (5,1,'brindis por pierrot',1983),
 (6,5,'el ultimo lugar del mundo',1990),
 (7,8,'concierto',1992),
 (8,7,'story',1980),
 (9,3,'g hits',1982),
 (10,2,'puedes oirme',1983),
 (11,4,'lo mejor de fito',1994),
 (12,1,'mediocampo',1982),
 (13,1,'jaime roos en concierto',1996);
/*!40000 ALTER TABLE `cds` ENABLE KEYS */;


--
-- Definition of table `Temas`
--

DROP TABLE IF EXISTS `Temas`;

CREATE TABLE `Temas` (
  `id_cd` int(10) unsigned NOT NULL,
  `id_tema` int(10) unsigned NOT NULL,
  `nombre_pista` varchar(50) NOT NULL,
  `Tiempo_Tema` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cd`,`id_tema`),
  CONSTRAINT `FK_Temas` FOREIGN KEY (`id_cd`) REFERENCES `Cds` (`id_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Temas`
--

/*!40000 ALTER TABLE `Temas` DISABLE KEYS */;
INSERT INTO `Temas` (`id_cd`,`id_tema`,`nombre_pista`,`Tiempo_Tema`) VALUES 
 (1,1001,'detras del miedo',3),
 (1,1002,'andenes',4),
 (2,1006,'el reino del reves',4),
 (2,1007,'osias el osito',3),
 (3,1008,'los ejecutivos',3),
 (3,1009,'la naranja se pasea',4),
 (3,1010,'la cancion del jardinero',3),
 (4,1025,'el beso que te di',2),
 (4,1026,'cosas de artigas',3),
 (5,1019,'adios juventud',4),
 (5,1020,'piropo',3),
 (6,1015,'dejame llorar',3),
 (6,1016,'corazon fracturado',4),
 (7,1011,'cuatro estrofas',3),
 (7,1012,'todo a pulmon',3),
 (7,1013,'por un minuto de amor',4),
 (8,1028,'friends will be friends',3),
 (8,1030,'rapsodia bohemia',3),
 (9,1031,'yestreday',3),
 (9,1034,'please mr postman',4),
 (10,1005,'avalancha',4),
 (12,1021,'aquello',3),
 (12,1023,'adios juventud',4),
 (13,1018,'durazno y convencion',3);
/*!40000 ALTER TABLE `Temas` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
