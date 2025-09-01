CREATE DATABASE  IF NOT EXISTS `petmatchdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `petmatchdb`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: petmatchdb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `adocao`
--

DROP TABLE IF EXISTS `adocao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adocao` (
  `fk_animais_id_animal` int DEFAULT NULL,
  `fk_adotanteUsuarios_id_adotante` int DEFAULT NULL,
  `data_hora_adocao` date DEFAULT NULL,
  `status_adocao` varchar(50) DEFAULT NULL,
  KEY `fk_animais_id_animal` (`fk_animais_id_animal`),
  KEY `fk_adotanteUsuarios_id_adotante` (`fk_adotanteUsuarios_id_adotante`),
  CONSTRAINT `adocao_ibfk_1` FOREIGN KEY (`fk_animais_id_animal`) REFERENCES `animais` (`id_animal`),
  CONSTRAINT `adocao_ibfk_2` FOREIGN KEY (`fk_adotanteUsuarios_id_adotante`) REFERENCES `adotantesusuarios` (`id_adotante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adotantesusuarios`
--

DROP TABLE IF EXISTS `adotantesusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adotantesusuarios` (
  `id_adotante` int NOT NULL AUTO_INCREMENT,
  `nome_adotante` varchar(255) NOT NULL,
  `cpf_adotante` char(14) NOT NULL,
  `endereco_adotante` varchar(255) NOT NULL,
  `celular_adotante` char(15) NOT NULL,
  `email_adotante` varchar(255) NOT NULL,
  `descricao_outros_animais` varchar(500) DEFAULT NULL,
  `preferencia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_adotante`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animais`
--

DROP TABLE IF EXISTS `animais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animais` (
  `id_animal` int NOT NULL AUTO_INCREMENT,
  `nome_animal` varchar(255) NOT NULL,
  `idade_animal` int NOT NULL,
  `porte_animal` varchar(50) DEFAULT NULL,
  `sexo_animal` char(1) NOT NULL,
  `especie_animal` varchar(100) NOT NULL,
  `raca_animal` varchar(100) DEFAULT NULL,
  `cor_animal` varchar(100) DEFAULT NULL,
  `fk_fotosAnimais_id_foto_animal` int DEFAULT NULL,
  `observacoes_animal` varchar(500) DEFAULT NULL,
  `fk_ong_id` int DEFAULT NULL,
  PRIMARY KEY (`id_animal`),
  KEY `fk_animais_ong` (`fk_ong_id`),
  CONSTRAINT `fk_animais_ong` FOREIGN KEY (`fk_ong_id`) REFERENCES `ongusuarios` (`id_ong`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id_eventos` int NOT NULL AUTO_INCREMENT,
  `nome_eventos` varchar(255) NOT NULL,
  `data_hora_eventos` date DEFAULT NULL,
  `endereco_eventos` varchar(255) DEFAULT NULL,
  `fk_ongUsuarios_id_ong` int DEFAULT NULL,
  PRIMARY KEY (`id_eventos`),
  KEY `fk_ongUsuarios_id_ong` (`fk_ongUsuarios_id_ong`),
  CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`fk_ongUsuarios_id_ong`) REFERENCES `ongusuarios` (`id_ong`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fichamedicaanimal`
--

DROP TABLE IF EXISTS `fichamedicaanimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fichamedicaanimal` (
  `id_ficha_medica` int NOT NULL AUTO_INCREMENT,
  `vacinas` varchar(500) DEFAULT NULL,
  `historico_saude` varchar(500) DEFAULT NULL,
  `fk_animais_id_animal` int DEFAULT NULL,
  PRIMARY KEY (`id_ficha_medica`),
  KEY `fk_animais_id_animal` (`fk_animais_id_animal`),
  CONSTRAINT `fichamedicaanimal_ibfk_1` FOREIGN KEY (`fk_animais_id_animal`) REFERENCES `animais` (`id_animal`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fotosadotantes`
--

DROP TABLE IF EXISTS `fotosadotantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotosadotantes` (
  `id_foto_usuario` int NOT NULL AUTO_INCREMENT,
  `arquivo_adotante` varchar(255) DEFAULT NULL,
  `fk_adotanteUsuarios_id_adotante` int DEFAULT NULL,
  PRIMARY KEY (`id_foto_usuario`),
  KEY `fk_adotanteUsuarios_id_adotante` (`fk_adotanteUsuarios_id_adotante`),
  CONSTRAINT `fotosadotantes_ibfk_1` FOREIGN KEY (`fk_adotanteUsuarios_id_adotante`) REFERENCES `adotantesusuarios` (`id_adotante`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fotosanimais`
--

DROP TABLE IF EXISTS `fotosanimais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotosanimais` (
  `id_foto_animal` int NOT NULL AUTO_INCREMENT,
  `arquivo_animal` varchar(255) DEFAULT NULL,
  `fk_animais_id_animal` int DEFAULT NULL,
  PRIMARY KEY (`id_foto_animal`),
  KEY `fk_animais_id_animal` (`fk_animais_id_animal`),
  CONSTRAINT `fotosanimais_ibfk_1` FOREIGN KEY (`fk_animais_id_animal`) REFERENCES `animais` (`id_animal`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `listaespera`
--

DROP TABLE IF EXISTS `listaespera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listaespera` (
  `id_lista_espera` int NOT NULL AUTO_INCREMENT,
  `data_hora_lista` date DEFAULT NULL,
  `fk_adotanteUsuarios_id_adotante` int DEFAULT NULL,
  `fk_animais_id_animal` int DEFAULT NULL,
  PRIMARY KEY (`id_lista_espera`),
  KEY `fk_adotanteUsuarios_id_adotante` (`fk_adotanteUsuarios_id_adotante`),
  KEY `fk_animais_id_animal` (`fk_animais_id_animal`),
  CONSTRAINT `listaespera_ibfk_1` FOREIGN KEY (`fk_adotanteUsuarios_id_adotante`) REFERENCES `adotantesusuarios` (`id_adotante`),
  CONSTRAINT `listaespera_ibfk_2` FOREIGN KEY (`fk_animais_id_animal`) REFERENCES `animais` (`id_animal`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ongusuarios`
--

DROP TABLE IF EXISTS `ongusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ongusuarios` (
  `id_ong` int NOT NULL AUTO_INCREMENT,
  `nome_fantasia_ong` varchar(255) NOT NULL,
  `razao_social_ong` varchar(255) NOT NULL,
  `endereco_ong` varchar(255) NOT NULL,
  `telefone_ong` varchar(15) NOT NULL,
  `cnpj_ong` char(18) NOT NULL,
  `email_ong` varchar(255) NOT NULL,
  `contato_ong` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_ong`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-01 19:03:35
