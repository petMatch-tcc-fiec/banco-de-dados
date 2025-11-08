-- Flyway Migration V1
-- Descrição: Criação do esquema base petmatchdb, incluindo a nova tabela Usuarios.

--
-- Table structure for table `usuarios` (NOVA TABELA BASE)
--
CREATE TABLE `usuarios` (
    `id` BINARY(16) NOT NULL, -- UUIDs são tipicamente armazenados como BINARY(16) no MySQL para performance
    `name` VARCHAR(255),
    `email` VARCHAR(255) NOT NULL,
    `senha_usuario` VARCHAR(255) NOT NULL,
    `picture` VARCHAR(255),
    `fcmToken` VARCHAR(255),
    `state` VARCHAR(50) NOT NULL,          -- Para o Enum RegisterState
    `accessLevel` VARCHAR(50) NOT NULL,    -- Para o Enum UserLevel
    PRIMARY KEY (`id`),
    UNIQUE KEY `email_usuario` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------------

--
-- Table structure for table `adminusuarios`
--
CREATE TABLE `adminusuarios` (
    -- Nota: Presumindo que esta tabela também fará referência à tabela Usuarios futuramente
    `id_admin` binary(16) NOT NULL,
    `nome_admin` varchar(255) NOT NULL,
    `email_admin` varchar(100) NOT NULL,
    `senha_admin` varchar(100) NOT NULL,
    `cpf_cnpj_admin` varchar(20) DEFAULT NULL,
    PRIMARY KEY (`id_admin`),
    UNIQUE KEY `email_admin` (`email_admin`),
    UNIQUE KEY `cpf_cnpj_admin` (`cpf_cnpj_admin`)
    CONSTRAINT `usuarios_admin_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `adotanteusuarios`
--
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
    CONSTRAINT `usuarios_adotante_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `ongusuarios`
--
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
    CONSTRAINT `usuarios_ong_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `animais`
--
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

--
-- Table structure for table `adocao`
--
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

--
-- Table structure for table `adocao_interesse`
--
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

--
-- Table structure for table `eventos`
--
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

--
-- Table structure for table `fichamedicaanimal`
--
CREATE TABLE `fichamedicaanimal` (
    `id_ficha_medica` binary(16) NOT NULL,
    `vacinas` varchar(255) DEFAULT NULL,
    `historico_saude` varchar(255) DEFAULT NULL,
    `fk_animais_id_animal` binary(16) NOT NULL,
    PRIMARY KEY (`id_ficha_medica`),
    UNIQUE KEY `fk_animais_id_animal` (`fk_animais_id_animal`),
    CONSTRAINT `fk_ficha_animal` FOREIGN KEY (`fk_animais_id_animal`) REFERENCES `animais` (`id_animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `fotosadotante`
--
CREATE TABLE `fotosadotante` (
    `id_foto` binary(16) NOT NULL,
    `arquivo` varchar(255) NOT NULL,
    `fk_adotanteUsuarios_id_adotante` binary(16) NOT NULL,
    PRIMARY KEY (`id_foto`),
    KEY `fk_foto_adotante` (`fk_adotanteUsuarios_id_adotante`),
    CONSTRAINT `fk_foto_adotante` FOREIGN KEY (`fk_adotanteUsuarios_id_adotante`) REFERENCES `adotanteusuarios` (`id_adotante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `fotosanimais`
--
CREATE TABLE `fotosanimais` (
    `id_foto_animal` binary(16) NOT NULL,
    `arquivo_animal` varchar(255) NOT NULL,
    `fk_animais_id_animal` binary(16) NOT NULL,
    PRIMARY KEY (`id_foto_animal`),
    KEY `fk_foto_animal` (`fk_animais_id_animal`),
    CONSTRAINT `fk_foto_animal` FOREIGN KEY (`fk_animais_id_animal`) REFERENCES `animais` (`id_animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
