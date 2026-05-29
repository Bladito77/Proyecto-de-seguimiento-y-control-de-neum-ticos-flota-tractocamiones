CREATE DATABASE  IF NOT EXISTS `gestion_llantas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gestion_llantas`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gestion_llantas
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `detalle_viaje_llanta`
--

DROP TABLE IF EXISTS `detalle_viaje_llanta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_viaje_llanta` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_viaje` int DEFAULT NULL,
  `id_llanta` varchar(50) DEFAULT NULL,
  `km_llanta` int DEFAULT NULL,
  `id_posicion` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `placa_trailer` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_viaje` (`id_viaje`),
  KEY `id_llanta` (`id_llanta`),
  KEY `id_posicion` (`id_posicion`),
  CONSTRAINT `detalle_viaje_llanta_ibfk_1` FOREIGN KEY (`id_viaje`) REFERENCES `viajes` (`id_viaje`),
  CONSTRAINT `detalle_viaje_llanta_ibfk_2` FOREIGN KEY (`id_llanta`) REFERENCES `llantas` (`id_llanta`),
  CONSTRAINT `detalle_viaje_llanta_ibfk_3` FOREIGN KEY (`id_posicion`) REFERENCES `posiciones` (`id_posicion`)
) ENGINE=InnoDB AUTO_INCREMENT=102392 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventos_mecanicos`
--

DROP TABLE IF EXISTS `eventos_mecanicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos_mecanicos` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `placa` varchar(10) DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `placa_trailer` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `placa` (`placa`),
  CONSTRAINT `eventos_mecanicos_ibfk_1` FOREIGN KEY (`placa`) REFERENCES `vehiculos` (`placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inspecciones`
--

DROP TABLE IF EXISTS `inspecciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inspecciones` (
  `id_inspeccion` int NOT NULL AUTO_INCREMENT,
  `id_llanta` varchar(50) DEFAULT NULL,
  `mm_actual` decimal(5,2) DEFAULT NULL,
  `km_acumulado` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_inspeccion`),
  KEY `id_llanta` (`id_llanta`),
  CONSTRAINT `inspecciones_ibfk_1` FOREIGN KEY (`id_llanta`) REFERENCES `llantas` (`id_llanta`)
) ENGINE=InnoDB AUTO_INCREMENT=4095 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `llantas`
--

DROP TABLE IF EXISTS `llantas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `llantas` (
  `id_llanta` varchar(50) NOT NULL,
  `id_referencia` int DEFAULT NULL,
  `vida_actual` int DEFAULT '0',
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_llanta`),
  KEY `id_referencia` (`id_referencia`),
  CONSTRAINT `llantas_ibfk_1` FOREIGN KEY (`id_referencia`) REFERENCES `referencias_llanta` (`id_referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `montajes`
--

DROP TABLE IF EXISTS `montajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `montajes` (
  `id_montaje` int NOT NULL AUTO_INCREMENT,
  `id_llanta` varchar(50) DEFAULT NULL,
  `placa` varchar(10) DEFAULT NULL,
  `id_posicion` int DEFAULT NULL,
  `km_inicio` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_montaje`),
  KEY `id_llanta` (`id_llanta`),
  KEY `placa` (`placa`),
  KEY `id_posicion` (`id_posicion`),
  CONSTRAINT `montajes_ibfk_1` FOREIGN KEY (`id_llanta`) REFERENCES `llantas` (`id_llanta`),
  CONSTRAINT `montajes_ibfk_2` FOREIGN KEY (`placa`) REFERENCES `vehiculos` (`placa`),
  CONSTRAINT `montajes_ibfk_3` FOREIGN KEY (`id_posicion`) REFERENCES `posiciones` (`id_posicion`)
) ENGINE=InnoDB AUTO_INCREMENT=5433 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movimientos_llanta`
--

DROP TABLE IF EXISTS `movimientos_llanta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_llanta` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `id_llanta` varchar(50) DEFAULT NULL,
  `tipo_movimiento` enum('MONTAJE','DESMONTAJE','ROTACION','ENVIO_REENCAUCHE','REENCauche','RECHAZO_REENCAUCHE','CAMBIO_ACCIDENTE','DESECHO_FINAL') DEFAULT NULL,
  `motivo` varchar(100) DEFAULT NULL,
  `placa` varchar(10) DEFAULT NULL,
  `id_posicion` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `placa_trailer` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `id_llanta` (`id_llanta`),
  KEY `placa` (`placa`),
  KEY `id_posicion` (`id_posicion`),
  CONSTRAINT `movimientos_llanta_ibfk_1` FOREIGN KEY (`id_llanta`) REFERENCES `llantas` (`id_llanta`),
  CONSTRAINT `movimientos_llanta_ibfk_2` FOREIGN KEY (`placa`) REFERENCES `vehiculos` (`placa`),
  CONSTRAINT `movimientos_llanta_ibfk_3` FOREIGN KEY (`id_posicion`) REFERENCES `posiciones` (`id_posicion`)
) ENGINE=InnoDB AUTO_INCREMENT=2430 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posiciones`
--

DROP TABLE IF EXISTS `posiciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posiciones` (
  `id_posicion` int NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `eje` int DEFAULT NULL,
  `lado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_posicion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `referencias_llanta`
--

DROP TABLE IF EXISTS `referencias_llanta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referencias_llanta` (
  `id_referencia` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) DEFAULT NULL,
  `ancho` int DEFAULT NULL,
  `perfil` int DEFAULT NULL,
  `rin` decimal(4,1) DEFAULT NULL,
  `tipo_labrado` varchar(50) DEFAULT NULL,
  `profundidad_nueva_mm` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_referencia`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rutas`
--

DROP TABLE IF EXISTS `rutas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutas` (
  `id_ruta` int NOT NULL AUTO_INCREMENT,
  `tipo_via` varchar(20) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `origen` varchar(100) DEFAULT NULL,
  `destino` varchar(100) DEFAULT NULL,
  `km` int DEFAULT NULL,
  PRIMARY KEY (`id_ruta`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trailers`
--

DROP TABLE IF EXISTS `trailers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trailers` (
  `placa` varchar(10) NOT NULL,
  `tipo` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos` (
  `placa` varchar(10) NOT NULL,
  `tipo` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viajes`
--

DROP TABLE IF EXISTS `viajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viajes` (
  `id_viaje` int NOT NULL AUTO_INCREMENT,
  `placa` varchar(10) DEFAULT NULL,
  `id_ruta` int DEFAULT NULL,
  `tipo_carga` varchar(20) DEFAULT NULL,
  `km_recorridos` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `placa_trailer` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_viaje`),
  KEY `placa` (`placa`),
  KEY `id_ruta` (`id_ruta`),
  CONSTRAINT `viajes_ibfk_1` FOREIGN KEY (`placa`) REFERENCES `vehiculos` (`placa`),
  CONSTRAINT `viajes_ibfk_2` FOREIGN KEY (`id_ruta`) REFERENCES `rutas` (`id_ruta`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-27  5:32:39
