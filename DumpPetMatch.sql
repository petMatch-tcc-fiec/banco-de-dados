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
-- Dumping data for table `adminusuarios`
--

LOCK TABLES `adminusuarios` WRITE;
/*!40000 ALTER TABLE `adminusuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminusuarios` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `adocao`
--

LOCK TABLES `adocao` WRITE;
/*!40000 ALTER TABLE `adocao` DISABLE KEYS */;
INSERT INTO `adocao` VALUES (_binary '_g+”»gğ‹ª\ĞÁµ\ëA',_binary '\Ö?Á»eğ‹ª\ĞÁµ\ëA','2025-04-02','A'),(_binary '_g2ª»gğ‹ª\ĞÁµ\ëA',_binary '\Ö?e»eğ‹ª\ĞÁµ\ëA','2025-07-05','A'),(_binary '_g4»gğ‹ª\ĞÁµ\ëA',_binary '\Ö>ùù»eğ‹ª\ĞÁµ\ëA','2025-03-12','A'),(_binary '_g4Ö»gğ‹ª\ĞÁµ\ëA',_binary '\Ö?Ù»eğ‹ª\ĞÁµ\ëA','2025-06-10','A'),(_binary '_g5Ì»gğ‹ª\ĞÁµ\ëA',_binary '\Ö?]»eğ‹ª\ĞÁµ\ëA','2025-05-20','E');
/*!40000 ALTER TABLE `adocao` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `adocao_interesse`
--

LOCK TABLES `adocao_interesse` WRITE;
/*!40000 ALTER TABLE `adocao_interesse` DISABLE KEYS */;
INSERT INTO `adocao_interesse` VALUES (_binary '\ï‡,û»hğ‹ª\ĞÁµ\ëA','2025-11-06 20:33:01',_binary '_g+”»gğ‹ª\ĞÁµ\ëA',_binary '\Ö>ùù»eğ‹ª\ĞÁµ\ëA'),(_binary '\ï‡2A»hğ‹ª\ĞÁµ\ëA','2025-11-06 20:33:01',_binary '_g5Ì»gğ‹ª\ĞÁµ\ëA',_binary '\Ö?Á»eğ‹ª\ĞÁµ\ëA'),(_binary '\ï‡3/»hğ‹ª\ĞÁµ\ëA','2025-11-06 20:33:01',_binary '_g4Ö»gğ‹ª\ĞÁµ\ëA',_binary '\Ö?]»eğ‹ª\ĞÁµ\ëA'),(_binary '\ï‡3‚»hğ‹ª\ĞÁµ\ëA','2025-11-06 20:33:01',_binary '_g2ª»gğ‹ª\ĞÁµ\ëA',_binary '\Ö?Ù»eğ‹ª\ĞÁµ\ëA'),(_binary '\ï‡3Ë»hğ‹ª\ĞÁµ\ëA','2025-11-06 20:33:01',_binary '_g4»gğ‹ª\ĞÁµ\ëA',_binary '\Ö?e»eğ‹ª\ĞÁµ\ëA');
/*!40000 ALTER TABLE `adocao_interesse` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `adotanteusuarios`
--

LOCK TABLES `adotanteusuarios` WRITE;
/*!40000 ALTER TABLE `adotanteusuarios` DISABLE KEYS */;
INSERT INTO `adotanteusuarios` VALUES (_binary '\Ö>ùù»eğ‹ª\ĞÁµ\ëA','Carla Mendes','123.456.789-01','Rua das AcÃ¡cias, 145 - Indaiatuba/SP','(19) 99999-1212','carla.mendes@email.com','senhaSegura1!','Possui uma gata idosa e um cachorro pequeno.','CÃ£es de pequeno porte'),(_binary '\Ö?Á»eğ‹ª\ĞÁµ\ëA','Rafael Souza','234.567.890-12','Av. ConceiÃ§Ã£o, 250 - Indaiatuba/SP','(19) 98888-3434','rafael.souza@email.com','senhaForte2!','JÃ¡ teve dois gatos adotados anteriormente.','Gatos adultos'),(_binary '\Ö?]»eğ‹ª\ĞÁµ\ëA','PatrÃ­cia Lima','345.678.901-23','Rua das Rosas, 77 - Indaiatuba/SP','(19) 97777-5656','patricia.lima@email.com','minhaSenha3!','Tem quintal grande, quer adotar um cachorro de porte mÃ©dio.','CÃ£es de mÃ©dio porte'),(_binary '\Ö?Ù»eğ‹ª\ĞÁµ\ëA','Eduardo Santos','456.789.012-34','Rua JoÃ£o Martini, 320 - Indaiatuba/SP','(19) 96666-7878','eduardo.santos@email.com','senhaForte4!','Sem outros animais atualmente.','CÃ£es ou gatos filhotes'),(_binary '\Ö?e»eğ‹ª\ĞÁµ\ëA','Mariana Oliveira','567.890.123-45','Av. Francisco de Paula Leite, 510 - Indaiatuba/SP','(19) 95555-9090','mariana.oliveira@email.com','seguraSenha5!','Tem uma casa com jardim e espaÃ§o aberto.','CÃ£es de grande porte');
/*!40000 ALTER TABLE `adotanteusuarios` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `animais`
--

LOCK TABLES `animais` WRITE;
/*!40000 ALTER TABLE `animais` DISABLE KEYS */;
INSERT INTO `animais` VALUES (_binary '_g+”»gğ‹ª\ĞÁµ\ëA','Luna',2,'Pequeno','F','Cachorro','Poodle','Branco','Muito dÃ³cil, acostumada com crianÃ§as.',_binary '\ít;&»fğ‹ª\ĞÁµ\ëA'),(_binary '_g2ª»gğ‹ª\ĞÁµ\ëA','Mingau',1,'Pequeno','M','Gato','SRD','Branco e cinza','Gato brincalhÃ£o, castrado e vacinado.',_binary '\ítC@»fğ‹ª\ĞÁµ\ëA'),(_binary '_g4»gğ‹ª\ĞÁµ\ëA','Thor',3,'MÃ©dio','M','Cachorro','Labrador','Dourado','Muito energÃ©tico, precisa de espaÃ§o para correr.',_binary '\ítCü»fğ‹ª\ĞÁµ\ëA'),(_binary '_g4Ö»gğ‹ª\ĞÁµ\ëA','Amora',4,'Pequeno','F','Gato','SiamÃªs','Bege e marrom','Gata calma e afetuosa, gosta de colo.',_binary '\ítDo»fğ‹ª\ĞÁµ\ëA'),(_binary '_g5Ì»gğ‹ª\ĞÁµ\ëA','Rex',5,'Grande','M','Cachorro','Pastor AlemÃ£o','Preto e caramelo','Protetor e inteligente, ideal para famÃ­lias com quintal.',_binary '\ítDÆ»fğ‹ª\ĞÁµ\ëA');
/*!40000 ALTER TABLE `animais` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (_binary '}¥Œ»gğ‹ª\ĞÁµ\ëA','Feira de AdoÃ§Ã£o de Primavera','2025-09-21 10:00:00','PraÃ§a Dom Pedro II - Centro, Indaiatuba/SP',_binary '\ít;&»fğ‹ª\ĞÁµ\ëA'),(_binary '}¥ù»gğ‹ª\ĞÁµ\ëA','Dia do Gato Feliz','2025-10-05 09:00:00','Parque EcolÃ³gico de Indaiatuba - Entrada Principal',_binary '\ítC@»fğ‹ª\ĞÁµ\ëA'),(_binary '}¥Q»gğ‹ª\ĞÁµ\ëA','MutirÃ£o de VacinaÃ§Ã£o e AdoÃ§Ã£o','2025-08-10 08:30:00','Av. Francisco de Paula Leite, 450 - Jardim Morada do Sol',_binary '\ítCü»fğ‹ª\ĞÁµ\ëA'),(_binary '}¥»gğ‹ª\ĞÁµ\ëA','Campanha LaÃ§os de Amor','2025-11-15 14:00:00','PraÃ§a do CidadÃ£o - Jardim Pau Preto',_binary '\ítDo»fğ‹ª\ĞÁµ\ëA'),(_binary '}¥‹»gğ‹ª\ĞÁµ\ëA','Natal Pet SolidÃ¡rio','2025-12-20 09:00:00','Shopping JaraguÃ¡ Indaiatuba - Estacionamento G4',_binary '\ítDÆ»fğ‹ª\ĞÁµ\ëA');
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `fichamedicaanimal`
--

LOCK TABLES `fichamedicaanimal` WRITE;
/*!40000 ALTER TABLE `fichamedicaanimal` DISABLE KEYS */;
INSERT INTO `fichamedicaanimal` VALUES (_binary 'Ç~»iğ‹ª\ĞÁµ\ëA','V8, AntirrÃ¡bica','Animal saudÃ¡vel, passou por castraÃ§Ã£o em 2024 e exames atualizados.',_binary '_g4»gğ‹ª\ĞÁµ\ëA'),(_binary 'Ç¥»iğ‹ª\ĞÁµ\ëA','V4, AntirrÃ¡bica','Apresentou leve rinite em 2023, tratada com sucesso. Castrada.',_binary '_g+”»gğ‹ª\ĞÁµ\ëA'),(_binary 'Ç¥™»iğ‹ª\ĞÁµ\ëA','V10, AntirrÃ¡bica','HistÃ³rico de dermatite controlada. Vermifugado e vacinado recentemente.',_binary '_g5Ì»gğ‹ª\ĞÁµ\ëA'),(_binary 'Ç¥×»iğ‹ª\ĞÁµ\ëA','V8, Gripe Canina','Resgatada em 2024, passou por tratamento contra pulgas e carrapatos.',_binary '_g4Ö»gğ‹ª\ĞÁµ\ëA'),(_binary 'Ç¦»iğ‹ª\ĞÁµ\ëA','V4, AntirrÃ¡bica','Animal dÃ³cil, vacinas em dia, sem histÃ³rico de doenÃ§as.',_binary '_g2ª»gğ‹ª\ĞÁµ\ëA');
/*!40000 ALTER TABLE `fichamedicaanimal` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `fotosadotante`
--

LOCK TABLES `fotosadotante` WRITE;
/*!40000 ALTER TABLE `fotosadotante` DISABLE KEYS */;
/*!40000 ALTER TABLE `fotosadotante` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `fotosanimais`
--

LOCK TABLES `fotosanimais` WRITE;
/*!40000 ALTER TABLE `fotosanimais` DISABLE KEYS */;
INSERT INTO `fotosanimais` VALUES (_binary '¨-9t»oğ‹ª\ĞÁµ\ëA','/imagens/animais/caes/thor.jpg',_binary '_g4»gğ‹ª\ĞÁµ\ëA'),(_binary '¨-E\â»oğ‹ª\ĞÁµ\ëA','/imagens/animais/gatos/luna.jpg',_binary '_g+”»gğ‹ª\ĞÁµ\ëA'),(_binary '¨-FÖ»oğ‹ª\ĞÁµ\ëA','/imagens/animais/caes/rex.jpg',_binary '_g5Ì»gğ‹ª\ĞÁµ\ëA'),(_binary '¨-GK»oğ‹ª\ĞÁµ\ëA','/imagens/animais/caes/amora.jpg',_binary '_g4Ö»gğ‹ª\ĞÁµ\ëA'),(_binary '¨-G«»oğ‹ª\ĞÁµ\ëA','/imagens/animais/gatos/mingau.jpg',_binary '_g2ª»gğ‹ª\ĞÁµ\ëA');
/*!40000 ALTER TABLE `fotosanimais` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `ongusuarios`
--

LOCK TABLES `ongusuarios` WRITE;
/*!40000 ALTER TABLE `ongusuarios` DISABLE KEYS */;
INSERT INTO `ongusuarios` VALUES (_binary '\ít;&»fğ‹ª\ĞÁµ\ëA','Amigos dos Animais','contato@amigosanimais.org','senhaOng1!','Rua das Violetas, 120 - Indaiatuba/SP','(19) 3834-1122','(19) 98888-1001','12.345.678/0001-01'),(_binary '\ítC@»fğ‹ª\ĞÁµ\ëA','Patinhas Felizes','atendimento@patinhasfelizes.org','senhaOng2!','Av. ConceiÃ§Ã£o, 455 - Indaiatuba/SP','(19) 3835-2244','(19) 97777-2002','23.456.789/0001-02'),(_binary '\ítCü»fğ‹ª\ĞÁµ\ëA','CoraÃ§Ã£o Peludo','contato@coracaopeludo.org','senhaOng3!','Rua das Margaridas, 89 - Indaiatuba/SP','(19) 3836-3344','(19) 96666-3003','34.567.890/0001-03'),(_binary '\ítDo»fğ‹ª\ĞÁµ\ëA','LaÃ§os de Amor Animal','contato@lacosdeamor.org','senhaOng4!','Av. ItororÃ³, 765 - Indaiatuba/SP','(19) 3837-4455','(19) 95555-4004','45.678.901/0001-04'),(_binary '\ítDÆ»fğ‹ª\ĞÁµ\ëA','EsperanÃ§a Pet','contato@esperancapet.org','senhaOng5!','Rua das Palmeiras, 310 - Indaiatuba/SP','(19) 3838-5566','(19) 94444-5005','56.789.012/0001-05');
/*!40000 ALTER TABLE `ongusuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-06 21:22:11
