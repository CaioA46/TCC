-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 10.107.134.64    Database: db_theribs
-- ------------------------------------------------------
-- Server version	5.7.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_adiantamentos`
--

DROP TABLE IF EXISTS `tbl_adiantamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_adiantamentos` (
  `id_adiantamento` int(11) NOT NULL AUTO_INCREMENT,
  `porcentagem` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `validacao` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_adiantamento`),
  KEY `fk_funcionario_adiantamento_idx` (`id_funcionario`),
  CONSTRAINT `fk_funcionario_adiantamento` FOREIGN KEY (`id_funcionario`) REFERENCES `tbl_funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_adiantamentos`
--

LOCK TABLES `tbl_adiantamentos` WRITE;
/*!40000 ALTER TABLE `tbl_adiantamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_adiantamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_avaliacao`
--

DROP TABLE IF EXISTS `tbl_avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_avaliacao` (
  `id_avaliacao` int(11) NOT NULL,
  `avaliacao` int(11) NOT NULL,
  `observacoes` varchar(120) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_avaliacao`),
  KEY `fk_cliente_avaliacao_idx` (`id_cliente`),
  CONSTRAINT `fk_cliente_avaliacao` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_avaliacao`
--

LOCK TABLES `tbl_avaliacao` WRITE;
/*!40000 ALTER TABLE `tbl_avaliacao` DISABLE KEYS */;
INSERT INTO `tbl_avaliacao` VALUES (1,5,'Ótimo',1),(2,4,'Bom',2),(3,5,'Muito bom',3);
/*!40000 ALTER TABLE `tbl_avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_avaliacao_funcionario`
--

DROP TABLE IF EXISTS `tbl_avaliacao_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_avaliacao_funcionario` (
  `id_avaliacao` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  KEY `fk_avaliacao_funcionario_idx` (`id_avaliacao`),
  KEY `fk_funcionario_avaliacao_idx` (`id_funcionario`),
  CONSTRAINT `fk_avaliacao_funcionario` FOREIGN KEY (`id_avaliacao`) REFERENCES `tbl_avaliacao` (`id_avaliacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionario_avaliacao` FOREIGN KEY (`id_funcionario`) REFERENCES `tbl_funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_avaliacao_funcionario`
--

LOCK TABLES `tbl_avaliacao_funcionario` WRITE;
/*!40000 ALTER TABLE `tbl_avaliacao_funcionario` DISABLE KEYS */;
INSERT INTO `tbl_avaliacao_funcionario` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `tbl_avaliacao_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_avaliacao_produto`
--

DROP TABLE IF EXISTS `tbl_avaliacao_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_avaliacao_produto` (
  `id_avaliacao` int(11) NOT NULL,
  `id_produuto` int(11) NOT NULL,
  KEY `fk_produto_cliente_avaliacao_idx` (`id_produuto`),
  KEY `fk_avaliacao_cliente_produto` (`id_avaliacao`),
  CONSTRAINT `fk_avaliacao_cliente_produto` FOREIGN KEY (`id_avaliacao`) REFERENCES `tbl_avaliacao` (`id_avaliacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_cliente_avaliacao` FOREIGN KEY (`id_produuto`) REFERENCES `tbl_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_avaliacao_produto`
--

LOCK TABLES `tbl_avaliacao_produto` WRITE;
/*!40000 ALTER TABLE `tbl_avaliacao_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_avaliacao_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_avaliacao_restaurante`
--

DROP TABLE IF EXISTS `tbl_avaliacao_restaurante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_avaliacao_restaurante` (
  `id_avaliacao` int(11) NOT NULL,
  `id_restaurante` int(11) NOT NULL,
  KEY `fk_avaliacao_cliente_restaurante_idx` (`id_avaliacao`),
  KEY `fk_restaurante_cliente_avaliacao_idx` (`id_restaurante`),
  CONSTRAINT `fk_avaliacao_cliente_restaurante` FOREIGN KEY (`id_avaliacao`) REFERENCES `tbl_avaliacao` (`id_avaliacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_restaurante_cliente_avaliacao` FOREIGN KEY (`id_restaurante`) REFERENCES `tbl_restaurante` (`id_restaurante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_avaliacao_restaurante`
--

LOCK TABLES `tbl_avaliacao_restaurante` WRITE;
/*!40000 ALTER TABLE `tbl_avaliacao_restaurante` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_avaliacao_restaurante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_boleto`
--

DROP TABLE IF EXISTS `tbl_boleto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_boleto` (
  `id_boleto` int(11) NOT NULL,
  `emissao` date NOT NULL,
  `vencimento` date NOT NULL,
  `valor` float NOT NULL,
  `situacao` tinyint(1) NOT NULL,
  `id_compra` int(11) NOT NULL,
  PRIMARY KEY (`id_boleto`),
  KEY `fk_compra_boleto_idx` (`id_compra`),
  CONSTRAINT `fk_compra_boleto` FOREIGN KEY (`id_compra`) REFERENCES `tbl_compra` (`id_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_boleto`
--

LOCK TABLES `tbl_boleto` WRITE;
/*!40000 ALTER TABLE `tbl_boleto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_boleto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_brinde`
--

DROP TABLE IF EXISTS `tbl_brinde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_brinde` (
  `id_brinde` int(11) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `valor_min` float NOT NULL,
  `img` varchar(45) NOT NULL,
  PRIMARY KEY (`id_brinde`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_brinde`
--

LOCK TABLES `tbl_brinde` WRITE;
/*!40000 ALTER TABLE `tbl_brinde` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_brinde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cabecalho`
--

DROP TABLE IF EXISTS `tbl_cabecalho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cabecalho` (
  `id_cabecalho` int(11) NOT NULL AUTO_INCREMENT,
  `foto` varchar(100) DEFAULT NULL,
  `texto_boas_vindas` varchar(50) DEFAULT NULL,
  `foto_usuario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cabecalho`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cabecalho`
--

LOCK TABLES `tbl_cabecalho` WRITE;
/*!40000 ALTER TABLE `tbl_cabecalho` DISABLE KEYS */;
INSERT INTO `tbl_cabecalho` VALUES (1,'05adf28eebe50d54c838964329ac097a.png','Bem Vindo!','3fd4e4773700f93432c649a2a6f4a268.png');
/*!40000 ALTER TABLE `tbl_cabecalho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cartao`
--

DROP TABLE IF EXISTS `tbl_cartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cartao` (
  `id_cartao` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(45) NOT NULL,
  `vencimento` date NOT NULL,
  `id_cilente` int(11) NOT NULL,
  PRIMARY KEY (`id_cartao`),
  KEY `fk_cliente_cartao_idx` (`id_cilente`),
  CONSTRAINT `fk_cliente_cartao` FOREIGN KEY (`id_cilente`) REFERENCES `tbl_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cartao`
--

LOCK TABLES `tbl_cartao` WRITE;
/*!40000 ALTER TABLE `tbl_cartao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cliente`
--

DROP TABLE IF EXISTS `tbl_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `senha` varchar(12) NOT NULL,
  `numero` varchar(6) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cliente`
--

LOCK TABLES `tbl_cliente` WRITE;
/*!40000 ALTER TABLE `tbl_cliente` DISABLE KEYS */;
INSERT INTO `tbl_cliente` VALUES (1,'Llala','(11) 4202-8396','(11) 95118-1978','bruno27@uol.com','444.176.588-62','bcd127','',NULL,'06390070'),(2,'haghagshdgahsgh','(11) 4202-8396','(11) 95118-1978','bruno@uol.com','444.176.588-62','123456','',NULL,'06390070'),(3,'diego','42028396','11992965490','bubu-diego@hotmail.com','444.176.588-62','152115','',NULL,'06390070');
/*!40000 ALTER TABLE `tbl_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cliente_endereco`
--

DROP TABLE IF EXISTS `tbl_cliente_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cliente_endereco` (
  `id_cliente` int(11) NOT NULL,
  `id_endereco` int(11) NOT NULL,
  KEY `fk_cliente_endereco_idx` (`id_cliente`),
  KEY `fk_endereco_cliente_idx` (`id_endereco`),
  CONSTRAINT `fk_cliente_endereco` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_cliente` FOREIGN KEY (`id_endereco`) REFERENCES `tbl_endereco` (`id_endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cliente_endereco`
--

LOCK TABLES `tbl_cliente_endereco` WRITE;
/*!40000 ALTER TABLE `tbl_cliente_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cliente_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_compra`
--

DROP TABLE IF EXISTS `tbl_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_compra` (
  `id_compra` int(11) NOT NULL AUTO_INCREMENT,
  `id_fornecedor` int(11) NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `fk_fornecedor_compra_idx` (`id_fornecedor`),
  CONSTRAINT `fk_fornecedor_compra` FOREIGN KEY (`id_fornecedor`) REFERENCES `tbl_fornecedor` (`id_fornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_compra`
--

LOCK TABLES `tbl_compra` WRITE;
/*!40000 ALTER TABLE `tbl_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_compra_ingrediente`
--

DROP TABLE IF EXISTS `tbl_compra_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_compra_ingrediente` (
  `id_compra` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor_unidade` float NOT NULL,
  KEY `fk_compra_ingrediente_idx` (`id_compra`),
  KEY `fk_ingrediente_compra_idx` (`id_ingrediente`),
  CONSTRAINT `fk_compra_ingrediente` FOREIGN KEY (`id_compra`) REFERENCES `tbl_compra` (`id_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingrediente_compra` FOREIGN KEY (`id_ingrediente`) REFERENCES `tbl_ingrediente` (`id_igrediente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_compra_ingrediente`
--

LOCK TABLES `tbl_compra_ingrediente` WRITE;
/*!40000 ALTER TABLE `tbl_compra_ingrediente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_compra_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_compra_nota`
--

DROP TABLE IF EXISTS `tbl_compra_nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_compra_nota` (
  `id_compra` int(11) NOT NULL,
  `id_nota` int(11) NOT NULL,
  KEY `fk_nota_compra_idx` (`id_nota`),
  KEY `fk_compra_nota` (`id_compra`),
  CONSTRAINT `fk_compra_nota` FOREIGN KEY (`id_compra`) REFERENCES `tbl_compra` (`id_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_nota_compra` FOREIGN KEY (`id_nota`) REFERENCES `tbl_nota_fiscal` (`id_nota_fiscal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_compra_nota`
--

LOCK TABLES `tbl_compra_nota` WRITE;
/*!40000 ALTER TABLE `tbl_compra_nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_compra_nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_compra_produto`
--

DROP TABLE IF EXISTS `tbl_compra_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_compra_produto` (
  `id_compra` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor_unidade` float NOT NULL,
  KEY `fk_compra_produto_idx` (`id_compra`),
  KEY `fk_produto_compra_idx` (`id_produto`),
  CONSTRAINT `fk_compra_produto` FOREIGN KEY (`id_compra`) REFERENCES `tbl_compra` (`id_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_compra` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_compra_produto`
--

LOCK TABLES `tbl_compra_produto` WRITE;
/*!40000 ALTER TABLE `tbl_compra_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_compra_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cor`
--

DROP TABLE IF EXISTS `tbl_cor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cor` (
  `id_cor` int(11) NOT NULL AUTO_INCREMENT,
  `rgb` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cor`
--

LOCK TABLES `tbl_cor` WRITE;
/*!40000 ALTER TABLE `tbl_cor` DISABLE KEYS */;
INSERT INTO `tbl_cor` VALUES (1,'rgb(219,113,70)');
/*!40000 ALTER TABLE `tbl_cor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_deposito_bancario`
--

DROP TABLE IF EXISTS `tbl_deposito_bancario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_deposito_bancario` (
  `id_deposito_bancario` int(11) NOT NULL,
  `valor` double NOT NULL,
  `situacao` tinyint(1) NOT NULL,
  `data_limite` date NOT NULL,
  `id_compra` int(11) NOT NULL,
  PRIMARY KEY (`id_deposito_bancario`),
  KEY `fk_compra_deposito_idx` (`id_compra`),
  CONSTRAINT `fk_compra_deposito` FOREIGN KEY (`id_compra`) REFERENCES `tbl_compra` (`id_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_deposito_bancario`
--

LOCK TABLES `tbl_deposito_bancario` WRITE;
/*!40000 ALTER TABLE `tbl_deposito_bancario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_deposito_bancario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_destaque`
--

DROP TABLE IF EXISTS `tbl_destaque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_destaque` (
  `id_destaque` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `id_img` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  PRIMARY KEY (`id_destaque`),
  KEY `fk_produto_destaque_idx` (`id_produto`),
  KEY `fk_img_destaque_idx` (`id_img`),
  CONSTRAINT `fk_img_destaque` FOREIGN KEY (`id_img`) REFERENCES `tbl_imagem` (`id_imagem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_destaque` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_destaque`
--

LOCK TABLES `tbl_destaque` WRITE;
/*!40000 ALTER TABLE `tbl_destaque` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_destaque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_endereco`
--

DROP TABLE IF EXISTS `tbl_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_endereco` (
  `id_endereco` int(11) NOT NULL AUTO_INCREMENT,
  `cep` varchar(45) NOT NULL,
  `complemento` varchar(45) NOT NULL,
  `logradouro` varchar(45) NOT NULL,
  PRIMARY KEY (`id_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_endereco`
--

LOCK TABLES `tbl_endereco` WRITE;
/*!40000 ALTER TABLE `tbl_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estoque`
--

DROP TABLE IF EXISTS `tbl_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_estoque` (
  `id_estoque` int(11) NOT NULL AUTO_INCREMENT,
  `id_restaurante` int(11) NOT NULL,
  PRIMARY KEY (`id_estoque`),
  KEY `fk_estoque_restaurante_idx` (`id_restaurante`),
  CONSTRAINT `fk_estoque_restaurante` FOREIGN KEY (`id_restaurante`) REFERENCES `tbl_restaurante` (`id_restaurante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estoque`
--

LOCK TABLES `tbl_estoque` WRITE;
/*!40000 ALTER TABLE `tbl_estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_evento_imagem`
--

DROP TABLE IF EXISTS `tbl_evento_imagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_evento_imagem` (
  `id_evento` int(11) NOT NULL,
  `id_img` int(11) NOT NULL,
  KEY `evento_imagem_idx` (`id_evento`),
  KEY `imagem_evento_idx` (`id_img`),
  CONSTRAINT `id_evento_imagem` FOREIGN KEY (`id_evento`) REFERENCES `tbl_eventos` (`id_evento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_imagem_evento` FOREIGN KEY (`id_img`) REFERENCES `tbl_imagem` (`id_imagem`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_evento_imagem`
--

LOCK TABLES `tbl_evento_imagem` WRITE;
/*!40000 ALTER TABLE `tbl_evento_imagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_evento_imagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_evento_restaurante`
--

DROP TABLE IF EXISTS `tbl_evento_restaurante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_evento_restaurante` (
  `id_evento` int(11) NOT NULL,
  `id_restaurante` int(11) NOT NULL,
  KEY `id_evento_restaurante_idx` (`id_evento`),
  KEY `id_restaurante_evento_idx` (`id_restaurante`),
  CONSTRAINT `id_evento_restaurante` FOREIGN KEY (`id_evento`) REFERENCES `tbl_eventos` (`id_evento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_restaurante_evento` FOREIGN KEY (`id_restaurante`) REFERENCES `tbl_restaurante` (`id_restaurante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_evento_restaurante`
--

LOCK TABLES `tbl_evento_restaurante` WRITE;
/*!40000 ALTER TABLE `tbl_evento_restaurante` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_evento_restaurante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_eventos`
--

DROP TABLE IF EXISTS `tbl_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_eventos` (
  `id_evento` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `sobre` varchar(45) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventos`
--

LOCK TABLES `tbl_eventos` WRITE;
/*!40000 ALTER TABLE `tbl_eventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fale`
--

DROP TABLE IF EXISTS `tbl_fale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_fale` (
  `id_fale` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `celular` varchar(45) NOT NULL,
  `ocorencia` int(11) NOT NULL,
  `descritivo` varchar(45) NOT NULL,
  `unidade` int(11) NOT NULL,
  PRIMARY KEY (`id_fale`),
  KEY `id_unidade_idx` (`unidade`),
  KEY `ocorrencia_idx` (`ocorencia`),
  CONSTRAINT `id_unidade` FOREIGN KEY (`unidade`) REFERENCES `tbl_restaurante` (`id_restaurante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ocorrencia` FOREIGN KEY (`ocorencia`) REFERENCES `tbl_ocorrencia` (`id_ocorrencia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fale`
--

LOCK TABLES `tbl_fale` WRITE;
/*!40000 ALTER TABLE `tbl_fale` DISABLE KEYS */;
INSERT INTO `tbl_fale` VALUES (4,'Bruno','bruno@uol.com','40024922','951181978',2,'O site poderia ser melhor',10);
/*!40000 ALTER TABLE `tbl_fale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ferias`
--

DROP TABLE IF EXISTS `tbl_ferias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ferias` (
  `id_ferias` int(11) NOT NULL AUTO_INCREMENT,
  `qtde_dias` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `validacao` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_ferias`),
  KEY `fk_ferias_funcionario_idx` (`id_funcionario`),
  CONSTRAINT `fk_ferias_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `tbl_funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ferias`
--

LOCK TABLES `tbl_ferias` WRITE;
/*!40000 ALTER TABLE `tbl_ferias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ferias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fornecedor`
--

DROP TABLE IF EXISTS `tbl_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_fornecedor` (
  `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `cnpj` varchar(45) NOT NULL,
  PRIMARY KEY (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fornecedor`
--

LOCK TABLES `tbl_fornecedor` WRITE;
/*!40000 ALTER TABLE `tbl_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fornecedor_endereco`
--

DROP TABLE IF EXISTS `tbl_fornecedor_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_fornecedor_endereco` (
  `id_fornecedor` int(11) NOT NULL,
  `id_endereco` int(11) NOT NULL,
  KEY `fk_fornecedor_endereco_idx` (`id_fornecedor`),
  KEY `fk_endereco_fornecedor_idx` (`id_endereco`),
  CONSTRAINT `fk_endereco_fornecedor` FOREIGN KEY (`id_endereco`) REFERENCES `tbl_endereco` (`id_endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fornecedor_endereco` FOREIGN KEY (`id_fornecedor`) REFERENCES `tbl_fornecedor` (`id_fornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fornecedor_endereco`
--

LOCK TABLES `tbl_fornecedor_endereco` WRITE;
/*!40000 ALTER TABLE `tbl_fornecedor_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_fornecedor_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_funcao`
--

DROP TABLE IF EXISTS `tbl_funcao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_funcao` (
  `id_funcao` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `id_setor` int(11) NOT NULL,
  PRIMARY KEY (`id_funcao`),
  KEY `fk_setor_funcao_idx` (`id_setor`),
  CONSTRAINT `fk_setor_funcao` FOREIGN KEY (`id_setor`) REFERENCES `tbl_setor` (`id_setor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_funcao`
--

LOCK TABLES `tbl_funcao` WRITE;
/*!40000 ALTER TABLE `tbl_funcao` DISABLE KEYS */;
INSERT INTO `tbl_funcao` VALUES (1,'Marketing',22),(2,'Garçom',23);
/*!40000 ALTER TABLE `tbl_funcao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_funcionario`
--

DROP TABLE IF EXISTS `tbl_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `celular` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `id_funcao` int(11) NOT NULL,
  `id_restaurante` int(11) NOT NULL,
  `senha` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `fk_restaurante_funcionario_idx` (`id_restaurante`),
  KEY `fk_funcao_funcionario_idx` (`id_funcao`),
  CONSTRAINT `fk_funcao_funcionario` FOREIGN KEY (`id_funcao`) REFERENCES `tbl_funcao` (`id_funcao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_restaurante_funcionario` FOREIGN KEY (`id_restaurante`) REFERENCES `tbl_restaurante` (`id_restaurante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_funcionario`
--

LOCK TABLES `tbl_funcionario` WRITE;
/*!40000 ALTER TABLE `tbl_funcionario` DISABLE KEYS */;
INSERT INTO `tbl_funcionario` VALUES (1,'Marcelo Bruno','951181978','bruno@uol.com',1,10,'666'),(2,'Patati','50505050','patati@email.com',2,11,'321'),(3,'Patata','40404040','patata@email.com',2,11,'543');
/*!40000 ALTER TABLE `tbl_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_funcionario_endereco`
--

DROP TABLE IF EXISTS `tbl_funcionario_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_funcionario_endereco` (
  `id_funcionario` int(11) NOT NULL,
  `id_endereco` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_funcionario_endereco`
--

LOCK TABLES `tbl_funcionario_endereco` WRITE;
/*!40000 ALTER TABLE `tbl_funcionario_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_funcionario_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_galeria`
--

DROP TABLE IF EXISTS `tbl_galeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_galeria` (
  `id_galeria` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_galeria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_galeria`
--

LOCK TABLES `tbl_galeria` WRITE;
/*!40000 ALTER TABLE `tbl_galeria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_galeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_galeria_img`
--

DROP TABLE IF EXISTS `tbl_galeria_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_galeria_img` (
  `id_galeria` int(11) NOT NULL,
  `id_img` int(11) NOT NULL,
  KEY `id_galeria_img_idx` (`id_galeria`),
  KEY `id_img_galeria_idx` (`id_img`),
  CONSTRAINT `id_galeria_img` FOREIGN KEY (`id_galeria`) REFERENCES `tbl_galeria` (`id_galeria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_img_galeria` FOREIGN KEY (`id_img`) REFERENCES `tbl_imagem` (`id_imagem`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_galeria_img`
--

LOCK TABLES `tbl_galeria_img` WRITE;
/*!40000 ALTER TABLE `tbl_galeria_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_galeria_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_galeria_titulo`
--

DROP TABLE IF EXISTS `tbl_galeria_titulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_galeria_titulo` (
  `idTitulo` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`idTitulo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_galeria_titulo`
--

LOCK TABLES `tbl_galeria_titulo` WRITE;
/*!40000 ALTER TABLE `tbl_galeria_titulo` DISABLE KEYS */;
INSERT INTO `tbl_galeria_titulo` VALUES (1,'The Ribs','O melhor restaurante');
/*!40000 ALTER TABLE `tbl_galeria_titulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_graduacoes`
--

DROP TABLE IF EXISTS `tbl_graduacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_graduacoes` (
  `id_graduacao` int(11) NOT NULL AUTO_INCREMENT,
  `desc` text NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  PRIMARY KEY (`id_graduacao`),
  KEY `fk_graduacao_funcionario_idx` (`id_funcionario`),
  CONSTRAINT `fk_graduacao_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `tbl_funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_graduacoes`
--

LOCK TABLES `tbl_graduacoes` WRITE;
/*!40000 ALTER TABLE `tbl_graduacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_graduacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_historia`
--

DROP TABLE IF EXISTS `tbl_historia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_historia` (
  `id_historia` int(11) NOT NULL AUTO_INCREMENT,
  `ano` int(11) NOT NULL,
  `descricao` text NOT NULL,
  PRIMARY KEY (`id_historia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_historia`
--

LOCK TABLES `tbl_historia` WRITE;
/*!40000 ALTER TABLE `tbl_historia` DISABLE KEYS */;
INSERT INTO `tbl_historia` VALUES (2,2017,'skamdksamdksamkdm'),(3,2015,'sd,ad,asdsadas'),(4,2018,'sadasdasdssadasda');
/*!40000 ALTER TABLE `tbl_historia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_imagem`
--

DROP TABLE IF EXISTS `tbl_imagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_imagem` (
  `id_imagem` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`id_imagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_imagem`
--

LOCK TABLES `tbl_imagem` WRITE;
/*!40000 ALTER TABLE `tbl_imagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_imagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ingrediente`
--

DROP TABLE IF EXISTS `tbl_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ingrediente` (
  `id_igrediente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `codigo_de_ barra` varchar(45) NOT NULL,
  PRIMARY KEY (`id_igrediente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ingrediente`
--

LOCK TABLES `tbl_ingrediente` WRITE;
/*!40000 ALTER TABLE `tbl_ingrediente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ingrediente_estoque`
--

DROP TABLE IF EXISTS `tbl_ingrediente_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ingrediente_estoque` (
  `id_ingrediente` int(11) NOT NULL,
  `id_estoque` int(11) NOT NULL,
  KEY `fk_ingrediente_estoque_idx` (`id_ingrediente`),
  KEY `fk_estoque_ingrediente_idx` (`id_estoque`),
  CONSTRAINT `fk_estoque_ingrediente` FOREIGN KEY (`id_estoque`) REFERENCES `tbl_estoque` (`id_estoque`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingrediente_estoque` FOREIGN KEY (`id_ingrediente`) REFERENCES `tbl_ingrediente` (`id_igrediente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ingrediente_estoque`
--

LOCK TABLES `tbl_ingrediente_estoque` WRITE;
/*!40000 ALTER TABLE `tbl_ingrediente_estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ingrediente_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ingrediente_produto`
--

DROP TABLE IF EXISTS `tbl_ingrediente_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ingrediente_produto` (
  `id_ingrediente` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  KEY `fk_ingrediente_produto_idx` (`id_ingrediente`),
  KEY `fk_produto_ingrediente_idx` (`id_produto`),
  CONSTRAINT `fk_ingrediente_produto` FOREIGN KEY (`id_ingrediente`) REFERENCES `tbl_ingrediente` (`id_igrediente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_ingrediente` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ingrediente_produto`
--

LOCK TABLES `tbl_ingrediente_produto` WRITE;
/*!40000 ALTER TABLE `tbl_ingrediente_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ingrediente_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_institucional`
--

DROP TABLE IF EXISTS `tbl_institucional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_institucional` (
  `id_instituciaonal` int(11) NOT NULL AUTO_INCREMENT,
  `missao` text NOT NULL,
  `visao` text NOT NULL,
  `valores` text NOT NULL,
  `fundadores` text NOT NULL,
  PRIMARY KEY (`id_instituciaonal`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_institucional`
--

LOCK TABLES `tbl_institucional` WRITE;
/*!40000 ALTER TABLE `tbl_institucional` DISABLE KEYS */;
INSERT INTO `tbl_institucional` VALUES (1,'A nossa missão é ser a maior SteakHouse até 2020','visao','valores','fundadores');
/*!40000 ALTER TABLE `tbl_institucional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_menu_home`
--

DROP TABLE IF EXISTS `tbl_menu_home`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_menu_home` (
  `id_menu_home` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_menu_home`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_menu_home`
--

LOCK TABLES `tbl_menu_home` WRITE;
/*!40000 ALTER TABLE `tbl_menu_home` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_menu_home` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_menu_img`
--

DROP TABLE IF EXISTS `tbl_menu_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_menu_img` (
  `id_menu_home` int(11) NOT NULL,
  `id_img` int(11) NOT NULL,
  KEY `fk_menu_img_idx` (`id_menu_home`),
  KEY `fk_img_idx` (`id_img`),
  CONSTRAINT `fk_img` FOREIGN KEY (`id_img`) REFERENCES `tbl_imagem` (`id_imagem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_img` FOREIGN KEY (`id_menu_home`) REFERENCES `tbl_menu_home` (`id_menu_home`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_menu_img`
--

LOCK TABLES `tbl_menu_img` WRITE;
/*!40000 ALTER TABLE `tbl_menu_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_menu_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mesa`
--

DROP TABLE IF EXISTS `tbl_mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_mesa` (
  `id_mesa` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `lugares` int(11) NOT NULL,
  `id_restaurante` int(11) NOT NULL,
  PRIMARY KEY (`id_mesa`),
  KEY `fk_restaurante_mesa_idx` (`id_restaurante`),
  CONSTRAINT `fk_restaurante_mesa` FOREIGN KEY (`id_restaurante`) REFERENCES `tbl_restaurante` (`id_restaurante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mesa`
--

LOCK TABLES `tbl_mesa` WRITE;
/*!40000 ALTER TABLE `tbl_mesa` DISABLE KEYS */;
INSERT INTO `tbl_mesa` VALUES (1,1,4,10),(2,2,6,10),(3,3,8,11);
/*!40000 ALTER TABLE `tbl_mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_motivo_login`
--

DROP TABLE IF EXISTS `tbl_motivo_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_motivo_login` (
  `id_motivo` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `descricao` text NOT NULL,
  `id_img` int(11) NOT NULL,
  PRIMARY KEY (`id_motivo`),
  KEY `fk_img_login_idx` (`id_img`),
  CONSTRAINT `fk_img_login` FOREIGN KEY (`id_img`) REFERENCES `tbl_imagem` (`id_imagem`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_motivo_login`
--

LOCK TABLES `tbl_motivo_login` WRITE;
/*!40000 ALTER TABLE `tbl_motivo_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_motivo_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nota_fiscal`
--

DROP TABLE IF EXISTS `tbl_nota_fiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_nota_fiscal` (
  `id_nota_fiscal` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(45) NOT NULL,
  `emissao` datetime NOT NULL,
  PRIMARY KEY (`id_nota_fiscal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nota_fiscal`
--

LOCK TABLES `tbl_nota_fiscal` WRITE;
/*!40000 ALTER TABLE `tbl_nota_fiscal` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_nota_fiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ocorrencia`
--

DROP TABLE IF EXISTS `tbl_ocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ocorrencia` (
  `id_ocorrencia` int(11) NOT NULL AUTO_INCREMENT,
  `ocorrencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_ocorrencia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ocorrencia`
--

LOCK TABLES `tbl_ocorrencia` WRITE;
/*!40000 ALTER TABLE `tbl_ocorrencia` DISABLE KEYS */;
INSERT INTO `tbl_ocorrencia` VALUES (1,'Sugestão'),(2,'Critica'),(3,'Denuncia'),(4,'Elogio');
/*!40000 ALTER TABLE `tbl_ocorrencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pedido`
--

DROP TABLE IF EXISTS `tbl_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_mesa` int(11) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_cliente_pedido_idx` (`id_cliente`),
  KEY `fk_mesa_pedido_idx` (`id_mesa`),
  CONSTRAINT `fk_cliente_pedido` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mesa_pedido` FOREIGN KEY (`id_mesa`) REFERENCES `tbl_mesa` (`id_mesa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pedido`
--

LOCK TABLES `tbl_pedido` WRITE;
/*!40000 ALTER TABLE `tbl_pedido` DISABLE KEYS */;
INSERT INTO `tbl_pedido` VALUES (1,'2017-10-05',1,2),(2,'2017-10-08',3,1),(3,'2017-10-10',2,3);
/*!40000 ALTER TABLE `tbl_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pedido_nota`
--

DROP TABLE IF EXISTS `tbl_pedido_nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_pedido_nota` (
  `id_pedido` int(11) NOT NULL,
  `id_nota` int(11) NOT NULL,
  KEY `fk_pedido_nota_idx` (`id_pedido`),
  KEY `fk_nota_pedido_idx` (`id_nota`),
  CONSTRAINT `fk_nota_pedido` FOREIGN KEY (`id_nota`) REFERENCES `tbl_nota_fiscal` (`id_nota_fiscal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_nota` FOREIGN KEY (`id_pedido`) REFERENCES `tbl_pedido` (`id_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pedido_nota`
--

LOCK TABLES `tbl_pedido_nota` WRITE;
/*!40000 ALTER TABLE `tbl_pedido_nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pedido_nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pedido_produto`
--

DROP TABLE IF EXISTS `tbl_pedido_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_pedido_produto` (
  `id_pedido` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  KEY `fk_produto_pedido_idx` (`id_produto`),
  KEY `fk_pedido_produto` (`id_pedido`),
  CONSTRAINT `fk_pedido_produto` FOREIGN KEY (`id_pedido`) REFERENCES `tbl_pedido` (`id_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_pedido` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pedido_produto`
--

LOCK TABLES `tbl_pedido_produto` WRITE;
/*!40000 ALTER TABLE `tbl_pedido_produto` DISABLE KEYS */;
INSERT INTO `tbl_pedido_produto` VALUES (1,2),(2,1),(3,2),(1,1);
/*!40000 ALTER TABLE `tbl_pedido_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_periodo`
--

DROP TABLE IF EXISTS `tbl_periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_periodo` (
  `id_periodo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `horario` varchar(45) NOT NULL,
  PRIMARY KEY (`id_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_periodo`
--

LOCK TABLES `tbl_periodo` WRITE;
/*!40000 ALTER TABLE `tbl_periodo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_produto`
--

DROP TABLE IF EXISTS `tbl_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `preco` double NOT NULL,
  `descricao` text,
  `tipo_produto` int(11) NOT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `fk_tipo_produto_idx` (`tipo_produto`),
  CONSTRAINT `fk_tipo_produto` FOREIGN KEY (`tipo_produto`) REFERENCES `tbl_tipo_produto` (`id_tipo_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_produto`
--

LOCK TABLES `tbl_produto` WRITE;
/*!40000 ALTER TABLE `tbl_produto` DISABLE KEYS */;
INSERT INTO `tbl_produto` VALUES (1,'picanha',30,'Carne',1),(2,'suco',5,'Suco de morango',4),(3,'Arroz',2,'Arroz',3);
/*!40000 ALTER TABLE `tbl_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_produto_img`
--

DROP TABLE IF EXISTS `tbl_produto_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_produto_img` (
  `id_produto` int(11) NOT NULL,
  `id_img` int(11) NOT NULL,
  KEY `fk_produto_img_idx` (`id_produto`),
  KEY `fk_img_produto_idx` (`id_img`),
  CONSTRAINT `fk_img_produto` FOREIGN KEY (`id_img`) REFERENCES `tbl_imagem` (`id_imagem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_img` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_produto_img`
--

LOCK TABLES `tbl_produto_img` WRITE;
/*!40000 ALTER TABLE `tbl_produto_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_produto_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_produto_restaurante`
--

DROP TABLE IF EXISTS `tbl_produto_restaurante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_produto_restaurante` (
  `id_produto` int(11) NOT NULL,
  `id_restaurante` int(11) NOT NULL,
  KEY `fk_produto_restaurante_idx` (`id_produto`),
  KEY `fk_restuarante_produto_idx` (`id_restaurante`),
  CONSTRAINT `fk_produto_restaurante` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_restuarante_produto` FOREIGN KEY (`id_restaurante`) REFERENCES `tbl_restaurante` (`id_restaurante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_produto_restaurante`
--

LOCK TABLES `tbl_produto_restaurante` WRITE;
/*!40000 ALTER TABLE `tbl_produto_restaurante` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_produto_restaurante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_produto_tipo_prato`
--

DROP TABLE IF EXISTS `tbl_produto_tipo_prato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_produto_tipo_prato` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_prato` int(11) NOT NULL,
  KEY `fk_tipo_prato_produto_idx` (`id_tipo_prato`),
  KEY `fk_produto_tipo_prato` (`id_produto`),
  CONSTRAINT `fk_produto_tipo_prato` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo_prato_produto` FOREIGN KEY (`id_tipo_prato`) REFERENCES `tbl_tipo_prato` (`id_tipo_prato`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_produto_tipo_prato`
--

LOCK TABLES `tbl_produto_tipo_prato` WRITE;
/*!40000 ALTER TABLE `tbl_produto_tipo_prato` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_produto_tipo_prato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_rede`
--

DROP TABLE IF EXISTS `tbl_rede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_rede` (
  `id_rede` int(11) NOT NULL AUTO_INCREMENT,
  `nome_rede` varchar(50) DEFAULT NULL,
  `link` varchar(150) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `hexadecimal` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id_rede`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_rede`
--

LOCK TABLES `tbl_rede` WRITE;
/*!40000 ALTER TABLE `tbl_rede` DISABLE KEYS */;
INSERT INTO `tbl_rede` VALUES (1,'Facebook','https://www.facebook.com','daa9e6de037d3240af08fcd84715940f.png','#3b5998'),(2,'Instagram','https://www.facebook.com','adf1a56eb982be796172fa3364aa68b6.png','#3b5998'),(5,'Twitter','https://www.facebook.com','1062ea708e0f80b6560ae42dafbfee95.png',NULL);
/*!40000 ALTER TABLE `tbl_rede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reserva`
--

DROP TABLE IF EXISTS `tbl_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_reserva` (
  `id_reserva` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reserva`
--

LOCK TABLES `tbl_reserva` WRITE;
/*!40000 ALTER TABLE `tbl_reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reserva_funcionario`
--

DROP TABLE IF EXISTS `tbl_reserva_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_reserva_funcionario` (
  `id_reserva` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  KEY `fk_funcionario_reserva_idx` (`id_funcionario`),
  KEY `fk_reserva_funcionario` (`id_reserva`),
  CONSTRAINT `fk_funcionario_reserva` FOREIGN KEY (`id_funcionario`) REFERENCES `tbl_funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_funcionario` FOREIGN KEY (`id_reserva`) REFERENCES `tbl_reservas` (`id_reserva`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reserva_funcionario`
--

LOCK TABLES `tbl_reserva_funcionario` WRITE;
/*!40000 ALTER TABLE `tbl_reserva_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reserva_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reserva_mesa`
--

DROP TABLE IF EXISTS `tbl_reserva_mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_reserva_mesa` (
  `id_reserva` int(11) NOT NULL,
  `id_mesa` int(11) NOT NULL,
  KEY `fk_reserva_mesa_idx` (`id_reserva`),
  KEY `fk_mesa_reserva_idx` (`id_mesa`),
  CONSTRAINT `fk_mesa_reserva` FOREIGN KEY (`id_mesa`) REFERENCES `tbl_mesa` (`id_mesa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_mesa` FOREIGN KEY (`id_reserva`) REFERENCES `tbl_reservas` (`id_reserva`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reserva_mesa`
--

LOCK TABLES `tbl_reserva_mesa` WRITE;
/*!40000 ALTER TABLE `tbl_reserva_mesa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reserva_mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reservas`
--

DROP TABLE IF EXISTS `tbl_reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_reservas` (
  `id_reserva` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_periodo` int(11) NOT NULL,
  `data` date NOT NULL,
  `validacao` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `fk_cliente_reserva_idx` (`id_cliente`),
  KEY `fk_periodo_reserva_idx` (`id_periodo`),
  CONSTRAINT `fk_cliente_reserva` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_periodo_reserva` FOREIGN KEY (`id_periodo`) REFERENCES `tbl_periodo` (`id_periodo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reservas`
--

LOCK TABLES `tbl_reservas` WRITE;
/*!40000 ALTER TABLE `tbl_reservas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_restaurante`
--

DROP TABLE IF EXISTS `tbl_restaurante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_restaurante` (
  `id_restaurante` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `tipo_restaurante` int(11) NOT NULL,
  `telefone` varchar(10) NOT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_restaurante`),
  KEY `tipo_restaurantr_idx` (`tipo_restaurante`),
  CONSTRAINT `tipo_restaurantr` FOREIGN KEY (`tipo_restaurante`) REFERENCES `tipo_restaurante` (`id_tipo_restaurante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_restaurante`
--

LOCK TABLES `tbl_restaurante` WRITE;
/*!40000 ALTER TABLE `tbl_restaurante` DISABLE KEYS */;
INSERT INTO `tbl_restaurante` VALUES (10,'The Rib\'s Steakhouse - São Paulo',1,'40028922','0780989089','789'),(11,'The Rib\'s Steakhouse - Carapucuíba',2,'42028396','088654','876'),(12,'The Rib\'s Steakhouse - Barueri',2,'41813264','09875544','543');
/*!40000 ALTER TABLE `tbl_restaurante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_restaurante_endereco`
--

DROP TABLE IF EXISTS `tbl_restaurante_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_restaurante_endereco` (
  `id_restaurante` int(11) NOT NULL,
  `id_endereco` int(11) NOT NULL,
  KEY `fk_restaurante_endereco_idx` (`id_restaurante`),
  KEY `fk_endereco_restaurante_idx` (`id_endereco`),
  CONSTRAINT `fk_endereco_restaurante` FOREIGN KEY (`id_endereco`) REFERENCES `tbl_endereco` (`id_endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_restaurante_endereco` FOREIGN KEY (`id_restaurante`) REFERENCES `tbl_restaurante` (`id_restaurante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_restaurante_endereco`
--

LOCK TABLES `tbl_restaurante_endereco` WRITE;
/*!40000 ALTER TABLE `tbl_restaurante_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_restaurante_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_restaurante_img`
--

DROP TABLE IF EXISTS `tbl_restaurante_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_restaurante_img` (
  `id_restaurante` int(11) NOT NULL,
  `id_img` int(11) NOT NULL,
  KEY `id_retaurante_img_idx` (`id_restaurante`),
  KEY `id_img_restaurante_idx` (`id_img`),
  CONSTRAINT `id_img_restaurante` FOREIGN KEY (`id_img`) REFERENCES `tbl_imagem` (`id_imagem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_retaurante_img` FOREIGN KEY (`id_restaurante`) REFERENCES `tbl_restaurante` (`id_restaurante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_restaurante_img`
--

LOCK TABLES `tbl_restaurante_img` WRITE;
/*!40000 ALTER TABLE `tbl_restaurante_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_restaurante_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_setor`
--

DROP TABLE IF EXISTS `tbl_setor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_setor` (
  `id_setor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_setor`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_setor`
--

LOCK TABLES `tbl_setor` WRITE;
/*!40000 ALTER TABLE `tbl_setor` DISABLE KEYS */;
INSERT INTO `tbl_setor` VALUES (19,'Recursos Humanos'),(20,'Administração'),(21,'Financeiro'),(22,'Marketing'),(23,'atendimento');
/*!40000 ALTER TABLE `tbl_setor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_slider`
--

DROP TABLE IF EXISTS `tbl_slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_slider` (
  `id_slider` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_slider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_slider`
--

LOCK TABLES `tbl_slider` WRITE;
/*!40000 ALTER TABLE `tbl_slider` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_slider_img`
--

DROP TABLE IF EXISTS `tbl_slider_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_slider_img` (
  `id_slider` int(11) NOT NULL,
  `id_img` int(11) NOT NULL,
  KEY `id_slider_imagem_idx` (`id_slider`),
  KEY `id_imagem_slider_idx` (`id_img`),
  CONSTRAINT `id_imagem_slider` FOREIGN KEY (`id_img`) REFERENCES `tbl_imagem` (`id_imagem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_slider_imagem` FOREIGN KEY (`id_slider`) REFERENCES `tbl_slider` (`id_slider`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_slider_img`
--

LOCK TABLES `tbl_slider_img` WRITE;
/*!40000 ALTER TABLE `tbl_slider_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_slider_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sobre`
--

DROP TABLE IF EXISTS `tbl_sobre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sobre` (
  `id_sobre` int(11) NOT NULL AUTO_INCREMENT,
  `img_1` varchar(100) NOT NULL,
  `img_2` varchar(100) NOT NULL,
  `img_3` varchar(100) NOT NULL,
  `img_4` varchar(100) NOT NULL,
  `img_5` varchar(100) NOT NULL,
  `img_6` varchar(100) NOT NULL,
  `img_7` varchar(100) NOT NULL,
  PRIMARY KEY (`id_sobre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sobre`
--

LOCK TABLES `tbl_sobre` WRITE;
/*!40000 ALTER TABLE `tbl_sobre` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sobre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_prato`
--

DROP TABLE IF EXISTS `tbl_tipo_prato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipo_prato` (
  `id_tipo_prato` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_prato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_prato`
--

LOCK TABLES `tbl_tipo_prato` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_prato` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tipo_prato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_produto`
--

DROP TABLE IF EXISTS `tbl_tipo_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipo_produto` (
  `id_tipo_produto` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_produto`
--

LOCK TABLES `tbl_tipo_produto` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_produto` DISABLE KEYS */;
INSERT INTO `tbl_tipo_produto` VALUES (1,'Carne'),(2,'Vergetal'),(3,'grãos'),(4,'bebidas');
/*!40000 ALTER TABLE `tbl_tipo_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_restaurante`
--

DROP TABLE IF EXISTS `tipo_restaurante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_restaurante` (
  `id_tipo_restaurante` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_restaurante`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_restaurante`
--

LOCK TABLES `tipo_restaurante` WRITE;
/*!40000 ALTER TABLE `tipo_restaurante` DISABLE KEYS */;
INSERT INTO `tipo_restaurante` VALUES (1,'Sede'),(2,'Filial');
/*!40000 ALTER TABLE `tipo_restaurante` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-11 16:55:40
