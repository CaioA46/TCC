-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: db_theribs
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
  `data` date NOT NULL,
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
INSERT INTO `tbl_avaliacao` VALUES (1,5,'Ótimo',1,'2017-08-01'),(2,4,'Bom',2,'2017-09-12'),(3,5,'Muito bom',3,'2017-10-10');
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
INSERT INTO `tbl_cliente` VALUES (1,'Llala','(11) 4202-8396','(11) 95118-1978','bruno27@uol.com','44417658862','bcd127','504','','06390070'),(2,'haghagshdgahsgh','(11) 4202-8396','(11) 95118-1978','bruno@uol.com','444.176.588-62','123456','125',NULL,'06390070'),(3,'diego','42028396','11992965490','bubu-diego@hotmail.com','444.176.588-62','152115','1117',NULL,'06390070');
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
INSERT INTO `tbl_cor` VALUES (1,'rgb(156,4,4)');
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
  `id_img` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_evento_imagem`
--

LOCK TABLES `tbl_evento_imagem` WRITE;
/*!40000 ALTER TABLE `tbl_evento_imagem` DISABLE KEYS */;
INSERT INTO `tbl_evento_imagem` VALUES (1,6),(2,7),(3,7),(4,8),(5,9),(5,32),(6,32);
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
INSERT INTO `tbl_evento_restaurante` VALUES (1,10),(2,11),(3,10),(4,12),(5,11),(6,12);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventos`
--

LOCK TABLES `tbl_eventos` WRITE;
/*!40000 ALTER TABLE `tbl_eventos` DISABLE KEYS */;
INSERT INTO `tbl_eventos` VALUES (1,'Teste','Larissa la la la teste teste','2017-10-09 00:00:00'),(2,'Evento 2','Teste teste teste','2017-10-12 00:00:00'),(3,'Evento 3','Teste teste teste','2017-11-15 00:00:00'),(4,'Evento 4','Teste teste teste','2017-11-16 00:00:00'),(5,'Evento 5','Teste teste teste','2017-12-20 00:00:00'),(6,'Evento 6','Teste teste teste','2017-12-21 00:00:00');
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
  `id_galeria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_galeria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_galeria`
--

LOCK TABLES `tbl_galeria` WRITE;
/*!40000 ALTER TABLE `tbl_galeria` DISABLE KEYS */;
INSERT INTO `tbl_galeria` VALUES (1,'galeria 1'),(2,'galeria 2'),(3,'galeria 3'),(4,'galeria 4'),(5,'galeria 5');
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
  KEY `fk_img_galeria_idx` (`id_img`),
  KEY `fk_galeria_img_idx` (`id_galeria`),
  CONSTRAINT `fk_galeria_img` FOREIGN KEY (`id_galeria`) REFERENCES `tbl_galeria` (`id_galeria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_img_galeria` FOREIGN KEY (`id_img`) REFERENCES `tbl_imagem` (`id_imagem`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_galeria_img`
--

LOCK TABLES `tbl_galeria_img` WRITE;
/*!40000 ALTER TABLE `tbl_galeria_img` DISABLE KEYS */;
INSERT INTO `tbl_galeria_img` VALUES (1,1),(1,2),(1,3),(2,4),(2,5),(2,6),(2,7),(3,8),(3,9),(4,10),(4,11),(4,12),(5,13),(5,14),(5,15),(5,16),(5,17);
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
  `id_imagem` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`id_imagem`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_imagem`
--

LOCK TABLES `tbl_imagem` WRITE;
/*!40000 ALTER TABLE `tbl_imagem` DISABLE KEYS */;
INSERT INTO `tbl_imagem` VALUES (1,'../fotos/88982e0720c20b5c58cc8887680f099b.png'),(2,'../fotos/22d00d9164fc22f4eca2978fb6718107.PNG'),(3,'../fotos/c609cbe3fcc9d34bc9774dfe0a584777.png'),(4,'111'),(5,'../fotos/c4887839c89846cbeb7e096c791c78dd.PNG'),(6,'imagens/1.png'),(7,'imagens/img1.jpg'),(8,'imagens/img2.jpg'),(9,'111'),(10,'111'),(11,'1111'),(12,'222'),(13,'../fotos/cf5180367099abbe9d8caae45b3cf4c1.PNG'),(14,'../fotos/cb512aa085f7df724cf8ea618111be78.png'),(15,'../fotos/b455f2d43562ae2f6c8d01378edbb15a.PNG'),(16,'../fotos/5ff6b9fa3c38b390f1fabbb2f98d7c19.png'),(17,'../fotos/50e087f6bda5e1ca52e364034fa44274.png'),(18,'11'),(19,'34'),(20,'../fotos/56ec354732e9837b1181c457ee52f236.jpg'),(21,'356'),(22,'654'),(23,'../fotos/1a9468a0b845ebcdcdd29386e893f689.jpg'),(24,'../fotos/d82b32f04fd611b0d9d46fe2f2f948b8.jpg'),(25,'../fotos/c7d6bf09faad4c87e641d436b79d5ee0.jpg'),(26,'456'),(27,'../fotos/7ef2a16920b2f7872c9967dae473a702.jpg'),(28,'../fotos/affef78e18c663ba27a419e0ed1357ea.jpg'),(29,'../fotos/02324f125c5b7be5e75aab391896ad43.jpg'),(30,'645'),(31,'645'),(32,'imagens/larii.jpg'),(33,'../fotos/664c7d9202b6ea9613a05f49022ddc4c.jpg'),(34,'imagens/download.jpg'),(35,'../fotos/7c2109b90a0ab5c7ea66ab601791c237.jpg');
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
  PRIMARY KEY (`id_igrediente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ingrediente`
--

LOCK TABLES `tbl_ingrediente` WRITE;
/*!40000 ALTER TABLE `tbl_ingrediente` DISABLE KEYS */;
INSERT INTO `tbl_ingrediente` VALUES (1,'Arroz'),(2,'Feijão'),(3,'Picanha'),(4,'Maminha'),(5,'Alface'),(6,'Tomate'),(7,'Farofa');
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
  `id_img` int(11) NOT NULL
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
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_motivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_motivo_login`
--

LOCK TABLES `tbl_motivo_login` WRITE;
/*!40000 ALTER TABLE `tbl_motivo_login` DISABLE KEYS */;
INSERT INTO `tbl_motivo_login` VALUES (1,'Teste 1','Descricao tralala',6,1),(2,'Teste 2','lalalala',7,1),(3,'Teste 3','cupcake',8,0),(4,'Teste','LAlalala',32,1),(5,'asa','sdaasdas',34,0);
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
  `id_garcom` int(11) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_cliente_pedido_idx` (`id_cliente`),
  KEY `fk_mesa_pedido_idx` (`id_mesa`),
  KEY `fk_garcom_pedido_idx` (`id_garcom`),
  CONSTRAINT `fk_cliente_pedido` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mesa_pedido` FOREIGN KEY (`id_mesa`) REFERENCES `tbl_mesa` (`id_mesa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pedido`
--

LOCK TABLES `tbl_pedido` WRITE;
/*!40000 ALTER TABLE `tbl_pedido` DISABLE KEYS */;
INSERT INTO `tbl_pedido` VALUES (1,'2017-10-05',1,2,2),(2,'2017-10-08',3,1,2),(3,'2017-10-10',2,3,3);
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
INSERT INTO `tbl_produto` VALUES (1,'Picanha ao forno',30,'Carne',1),(2,'suco',5,'Suco de morango',4),(3,'Arroz',2,'Arroz',3);
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
  `id_img` int(11) NOT NULL
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
-- Table structure for table `tbl_produto_ingrediente`
--

DROP TABLE IF EXISTS `tbl_produto_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_produto_ingrediente` (
  `qtde` float NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  KEY `fk_produto_ingrediente_idx` (`id_produto`),
  KEY `fk_ingrediente_produto_idx` (`id_ingrediente`),
  CONSTRAINT `fk_ingrediente_produto` FOREIGN KEY (`id_ingrediente`) REFERENCES `tbl_ingrediente` (`id_igrediente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_ingrediente` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_produto_ingrediente`
--

LOCK TABLES `tbl_produto_ingrediente` WRITE;
/*!40000 ALTER TABLE `tbl_produto_ingrediente` DISABLE KEYS */;
INSERT INTO `tbl_produto_ingrediente` VALUES (1,1,3),(1,1,1),(1,1,2);
/*!40000 ALTER TABLE `tbl_produto_ingrediente` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
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
  `id_img` int(11) NOT NULL
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_slider`
--

LOCK TABLES `tbl_slider` WRITE;
/*!40000 ALTER TABLE `tbl_slider` DISABLE KEYS */;
INSERT INTO `tbl_slider` VALUES (1,'Galeria'),(2,'Sobre');
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
  KEY `fk_img_slider_idx` (`id_img`),
  KEY `fk_slider_img_idx` (`id_slider`),
  CONSTRAINT `fk_img_slider` FOREIGN KEY (`id_img`) REFERENCES `tbl_imagem` (`id_imagem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_slider_img` FOREIGN KEY (`id_slider`) REFERENCES `tbl_slider` (`id_slider`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_slider_img`
--

LOCK TABLES `tbl_slider_img` WRITE;
/*!40000 ALTER TABLE `tbl_slider_img` DISABLE KEYS */;
INSERT INTO `tbl_slider_img` VALUES (1,27),(1,24),(1,23),(1,25),(1,28),(1,29),(2,19),(2,21),(2,22),(2,23),(2,24),(1,20),(2,31),(1,35);
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
  `imagem` text NOT NULL,
  PRIMARY KEY (`id_tipo_prato`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_prato`
--

LOCK TABLES `tbl_tipo_prato` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_prato` DISABLE KEYS */;
INSERT INTO `tbl_tipo_prato` VALUES (22,'Carne','../fotos/2b23c22c91c2c08ef6a73a6dc517f68c.png');
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

--
-- Temporary view structure for view `vw_eventos`
--

DROP TABLE IF EXISTS `vw_eventos`;
/*!50001 DROP VIEW IF EXISTS `vw_eventos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_eventos` AS SELECT 
 1 AS `id_evento`,
 1 AS `nome`,
 1 AS `sobre`,
 1 AS `data`,
 1 AS `imagem`,
 1 AS `restaurante`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_eventos`
--

/*!50001 DROP VIEW IF EXISTS `vw_eventos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`10.107.134.29` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_eventos` AS select `e`.`id_evento` AS `id_evento`,`e`.`nome` AS `nome`,`e`.`sobre` AS `sobre`,`e`.`data` AS `data`,`img`.`url` AS `imagem`,`r`.`Nome` AS `restaurante` from ((((`tbl_eventos` `e` join `tbl_evento_imagem` `ei` on((`e`.`id_evento` = `ei`.`id_evento`))) join `tbl_imagem` `img` on((`ei`.`id_img` = `img`.`id_imagem`))) join `tbl_evento_restaurante` `er` on((`e`.`id_evento` = `er`.`id_evento`))) join `tbl_restaurante` `r` on((`er`.`id_restaurante` = `r`.`id_restaurante`))) group by `e`.`id_evento` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-18 16:55:40
