-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: salud
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `atiende`
--

DROP TABLE IF EXISTS `atiende`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atiende` (
  `ciMed` varchar(12) DEFAULT NULL,
  `ciPac` varchar(12) DEFAULT NULL,
  `fechaAtencion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atiende`
--

LOCK TABLES `atiende` WRITE;
/*!40000 ALTER TABLE `atiende` DISABLE KEYS */;
INSERT INTO `atiende` VALUES ('1.111.111-1','1.111.111-2','2019-08-01'),('2.222.222-1','1.111.111-2','2019-02-23'),('1.111.111-1','2.222.222-2','2019-07-19'),('2.222.222-1','2.222.222-2','2019-05-23'),('1.111.111-1','3.333.333-2','2019-05-23'),('3.333.333-1','4.444.444-2','2020-02-20'),('4.444.444-1','1.111.111-2','2020-09-05'),('5.555.555-1','3.333.333-2','2020-11-05'),('5.555.555-1','6.666.666-2','2021-07-15'),('3.333.333-1','4.444.444-2','2021-12-07'),('2.222.222-1','3.333.333-2','2021-12-27');
/*!40000 ALTER TABLE `atiende` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitales`
--

DROP TABLE IF EXISTS `hospitales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospitales` (
  `codhosp` int NOT NULL,
  `nomhosp` varchar(30) DEFAULT NULL,
  `localidad` varchar(20) DEFAULT NULL,
  `cantcamas` int DEFAULT NULL,
  PRIMARY KEY (`codhosp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitales`
--

LOCK TABLES `hospitales` WRITE;
/*!40000 ALTER TABLE `hospitales` DISABLE KEYS */;
INSERT INTO `hospitales` VALUES (1,'Elbio Rivero','Maldonado',30),(2,'Manuel Quintela','Montevideo',100),(3,'Hospital de Rocha','Rocha',30),(4,'Pereira Rossell','Montevideo',50),(5,'Hospital Maciel','Montevideo',60),(6,'Florencio Alvariza','San Carlos',20),(7,'Dr. Alfredo Vidal y Fuentes','Minas',20);
/*!40000 ALTER TABLE `hospitales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicos` (
  `ciMed` varchar(12) NOT NULL,
  `nomMed` varchar(30) DEFAULT NULL,
  `especialidad` varchar(50) DEFAULT NULL,
  `codhosp` int DEFAULT NULL,
  PRIMARY KEY (`ciMed`),
  KEY `codhosp` (`codhosp`),
  CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`codhosp`) REFERENCES `hospitales` (`codhosp`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos`
--

LOCK TABLES `medicos` WRITE;
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
INSERT INTO `medicos` VALUES ('1.111.111-1','Juan Lopez','cardiologo',1),('2.222.222-1','Ana Alonso','pediatra',2),('3.333.333-1','Julio Long','medicina general',3),('4.444.444-1','Julio Nicola','Oncologo',4),('5.555.555-1','Nestor Cardoso','cardiologo',5),('6.666.666-1','Alba Muniz','Traumatologa',6);
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `ciPac` varchar(12) NOT NULL,
  `nomPac` varchar(30) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `localidad` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ciPac`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES ('1.111.111-2','Maria Alvez','1970-12-21','F','Maldonado'),('2.222.222-2','Pedro Ventura','1960-05-08','M','Maldonado'),('3.333.333-2','Veronica Sosa','1960-05-08','F','Canelones'),('4.444.444-2','Letica Barroco','1981-10-10','F','Minas'),('5.555.555-2','Mario Rosas','1977-04-22','F','Montevideo'),('6.666.666-2','Marcela Miranda','1977-08-14','F','Montevideo');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros`
--

DROP TABLE IF EXISTS `registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `operacion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros`
--

LOCK TABLES `registros` WRITE;
/*!40000 ALTER TABLE `registros` DISABLE KEYS */;
/*!40000 ALTER TABLE `registros` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-06 22:50:16
