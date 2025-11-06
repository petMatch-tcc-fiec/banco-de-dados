CREATE DATABASE  IF NOT EXISTS `petmatchdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `petmatchdb`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: petmatchdb
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `adminusuarios`
--

DROP TABLE IF EXISTS `adminusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminusuarios` (
  `id_admin` binary(16) NOT NULL,
  `nome_admin` varchar(255) NOT NULL,
  `email_admin` varchar(100) NOT NULL,
  `senha_admin` varchar(100) NOT NULL,
  `cpf_cnpj_admin` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `email_admin` (`email_admin`),
  UNIQUE KEY `cpf_cnpj_admin` (`cpf_cnpj_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adocao`
--

DROP TABLE IF EXISTS `adocao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adocao` (
  `fk_animais_id_animal` binary(16) NOT NULL,
  `fk_adotanteUsuarios_id_adotante` binary(16) NOT NULL,
  `data_adocao` date NOT NULL,
  `adocao_status` char(1) NOT NULL,
  PRIMARY KEY (`fk_animais_id_animal`,`fk_adotanteUsuarios_id_adotante`),
  KEY `fk_adotam_adotante` (`fk_adotanteUsuarios_id_adotante`),
  CONSTRAINT `fk_adotam_adotante` FOREIGN KEY (`fk_adotanteUsuarios_id_adotante`) REFERENCES `adotanteusuarios` (`id_adotante`),
  CONSTRAINT `fk_adotam_animal` FOREIGN KEY (`fk_animais_id_animal`) REFERENCES `animais` (`id_animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adocao_interesse`
--

DROP TABLE IF EXISTS `adocao_interesse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adocao_interesse` (
  `id_interesse` binary(16) NOT NULL,
  `data_de_criacao` datetime NOT NULL,
  `fk_animais_id_animal` binary(16) NOT NULL,
  `fk_adotanteUsuarios_id_adotante` binary(16) NOT NULL,
  PRIMARY KEY (`id_interesse`),
  UNIQUE KEY `unq_adocao_interesse` (`fk_animais_id_animal`,`fk_adotanteUsuarios_id_adotante`),
  KEY `fk_usuario_interesse` (`fk_adotanteUsuarios_id_adotante`),
  CONSTRAINT `fk_animal_interesse` FOREIGN KEY (`fk_animais_id_animal`) REFERENCES `animais` (`id_animal`),
  CONSTRAINT `fk_usuario_interesse` FOREIGN KEY (`fk_adotanteUsuarios_id_adotante`) REFERENCES `adotanteusuarios` (`id_adotante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adotanteusuarios`
--

DROP TABLE IF EXISTS `adotanteusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adotanteusuarios` (
  `id_adotante` binary(16) NOT NULL,
  `nome_adotante` varchar(100) NOT NULL,
  `cpf_adotante` varchar(14) NOT NULL,
  `endereco_adotante` varchar(255) NOT NULL,
  `celular_adotante` varchar(20) DEFAULT NULL,
  `email_adotante` varchar(100) DEFAULT NULL,
  `senha_adotante` varchar(100) NOT NULL,
  `descricao_outros_animais` varchar(255) DEFAULT NULL,
  `preferencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_adotante`),
  UNIQUE KEY `cpf_adotante` (`cpf_adotante`),
  UNIQUE KEY `email_adotante` (`email_adotante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animais`
--

DROP TABLE IF EXISTS `animais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animais` (
  `id_animal` binary(16) NOT NULL,
  `nome_animal` varchar(100) NOT NULL,
  `idade_animal` int DEFAULT NULL,
  `porte_animal` varchar(10) NOT NULL,
  `sexo_animal` char(1) NOT NULL,
  `especie_animal` varchar(50) NOT NULL,
  `raca_animal` varchar(50) DEFAULT NULL,
  `cor_animal` varchar(50) DEFAULT NULL,
  `observacoes_animal` varchar(255) DEFAULT NULL,
  `fk_ongUsuarios_id_ong` binary(16) NOT NULL,
  PRIMARY KEY (`id_animal`),
  KEY `fk_animal_ong` (`fk_ongUsuarios_id_ong`),
  CONSTRAINT `fk_animal_ong` FOREIGN KEY (`fk_ongUsuarios_id_ong`) REFERENCES `ongusuarios` (`id_ong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id_evento` binary(16) NOT NULL,
  `nome_evento` varchar(255) NOT NULL,
  `data_hora_evento` datetime NOT NULL,
  `endereco_evento` varchar(255) NOT NULL,
  `fk_ongUsuarios_id_ong` binary(16) NOT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `fk_evento_ong` (`fk_ongUsuarios_id_ong`),
  CONSTRAINT `fk_evento_ong` FOREIGN KEY (`fk_ongUsuarios_id_ong`) REFERENCES `ongusuarios` (`id_ong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fichamedicaanimal`
--

DROP TABLE IF EXISTS `fichamedicaanimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fichamedicaanimal` (
  `id_ficha_medica` binary(16) NOT NULL,
  `vacinas` varchar(255) DEFAULT NULL,
  `historico_saude` varchar(255) DEFAULT NULL,
  `fk_animais_id_animal` binary(16) NOT NULL,
  PRIMARY KEY (`id_ficha_medica`),
  UNIQUE KEY `fk_animais_id_animal` (`fk_animais_id_animal`),
  CONSTRAINT `fk_ficha_animal` FOREIGN KEY (`fk_animais_id_animal`) REFERENCES `animais` (`id_animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fotosadotante`
--

DROP TABLE IF EXISTS `fotosadotante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotosadotante` (
  `id_foto` binary(16) NOT NULL,
  `arquivo` varchar(255) NOT NULL,
  `fk_adotanteUsuarios_id_adotante` binary(16) NOT NULL,
  PRIMARY KEY (`id_foto`),
  KEY `fk_foto_adotante` (`fk_adotanteUsuarios_id_adotante`),
  CONSTRAINT `fk_foto_adotante` FOREIGN KEY (`fk_adotanteUsuarios_id_adotante`) REFERENCES `adotanteusuarios` (`id_adotante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fotosanimais`
--

DROP TABLE IF EXISTS `fotosanimais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotosanimais` (
  `id_foto_animal` binary(16) NOT NULL,
  `arquivo_animal` varchar(255) NOT NULL,
  `fk_animais_id_animal` binary(16) NOT NULL,
  PRIMARY KEY (`id_foto_animal`),
  KEY `fk_foto_animal` (`fk_animais_id_animal`),
  CONSTRAINT `fk_foto_animal` FOREIGN KEY (`fk_animais_id_animal`) REFERENCES `animais` (`id_animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ongusuarios`
--

DROP TABLE IF EXISTS `ongusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ongusuarios` (
  `id_ong` binary(16) NOT NULL,
  `nome_fantasia_ong` varchar(255) NOT NULL,
  `email_ong` varchar(100) NOT NULL,
  `senha_ong` varchar(100) NOT NULL,
  `endereco_ong` varchar(255) NOT NULL,
  `telefone_ong` varchar(20) DEFAULT NULL,
  `celular_ong` varchar(20) DEFAULT NULL,
  `cnpj_ong` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_ong`),
  UNIQUE KEY `email_ong` (`email_ong`),
  UNIQUE KEY `cnpj_ong` (`cnpj_ong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-06 19:56:46
