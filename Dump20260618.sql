CREATE DATABASE  IF NOT EXISTS `monitoramento_ferramental_industrial` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `monitoramento_ferramental_industrial`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: monitoramento_ferramental_industrial
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `tb_ferramenta`
--

DROP TABLE IF EXISTS `tb_ferramenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_ferramenta` (
  `id_ferramenta` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `horas_uso` int(11) NOT NULL DEFAULT 0,
  `vida_util_maxima` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  `id_galpao` bigint(20) DEFAULT NULL,
  `id_usuario_responsavel` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_ferramenta`),
  KEY `id_galpao` (`id_galpao`),
  KEY `id_usuario_responsavel` (`id_usuario_responsavel`),
  CONSTRAINT `tb_ferramenta_ibfk_1` FOREIGN KEY (`id_galpao`) REFERENCES `tb_galpao` (`id_galpao`),
  CONSTRAINT `tb_ferramenta_ibfk_2` FOREIGN KEY (`id_usuario_responsavel`) REFERENCES `tb_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ferramenta`
--

LOCK TABLES `tb_ferramenta` WRITE;
/*!40000 ALTER TABLE `tb_ferramenta` DISABLE KEYS */;
INSERT INTO `tb_ferramenta` VALUES (1,'Torno Mecânico Horizontal Nardini',1200,5000,'Em funcionamento',1,7),(2,'Fresadora Ferramenteira ISO 40',4100,4500,'Em funcionamento',1,5),(3,'Retificadora Cilíndrica de Precisão',350,3000,'Em funcionamento',1,2),(4,'Furadeira de Bancada Industrial Heavy Duty',2100,2500,'Parada',1,2),(5,'Parafusadeira Pneumática Industrial Shulz',850,1500,'Em funcionamento',2,3),(6,'Pistola de Rebite Hidropneumática',1420,2000,'Em funcionamento',2,3),(7,'Torquímetro de Estalo Digital Snap-On',980,1000,'Em funcionamento',2,3),(8,'Prensa Hidráulica de Bancada 15T',100,4000,'Em funcionamento',2,3),(9,'Prensa Excêntrica de Engrenagem 100T',4500,6000,'Parada',3,6),(10,'Guilhotina Hidráulica para Chapas',2900,5000,'Em funcionamento',3,6),(11,'Dobradeira de Chapas CNC Newton',1200,4000,'Em funcionamento',3,6),(12,'Conjunto de Matrizes de Corte Progressivo',800,1200,'Em funcionamento',3,6),(13,'Inversora de Solda TIG Industrial Lincoln',1850,3000,'Em funcionamento',4,4),(14,'Máquina de Corte a Plasma CNC',2200,2500,'Em funcionamento',4,4),(15,'Calandra Hidráulica para Tubos e Chapas',950,3500,'Parada',4,4),(16,'Esmerilhadeira Angular Heavy Duty Bosch',450,800,'Em funcionamento',4,4),(17,'Centro de Usinagem CNC ROMI D800',800,8000,'Em funcionamento',5,5),(18,'Estação de Retrabalho BGA Digital',1150,1200,'Em funcionamento',5,5),(19,'Osciloscópio Digital Keysight 4 Canais',300,5000,'Em funcionamento',5,5),(20,'Gerador de Funções Arbitrárias Tektronix',150,4000,'Em funcionamento',5,5),(21,'Morsa de Bancada Articulada Nº 6',500,10000,'Em funcionamento',1,2),(22,'Soprador Térmico Industrial Dewalt',750,800,'Parada',5,5),(23,'Politriz Angular Industrial Makita',600,1500,'Em funcionamento',2,3),(24,'Multímetro Automotivo Fluke True-RMS',1100,3000,'Em funcionamento',5,5);
/*!40000 ALTER TABLE `tb_ferramenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_galpao`
--

DROP TABLE IF EXISTS `tb_galpao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_galpao` (
  `id_galpao` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `ativo` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_galpao`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_galpao`
--

LOCK TABLES `tb_galpao` WRITE;
/*!40000 ALTER TABLE `tb_galpao` DISABLE KEYS */;
INSERT INTO `tb_galpao` VALUES (1,'Galpão A - Usinagem de Precisão',1),(2,'Galpão B - Linha de Montagem Final',1),(3,'Galpão C - Estamparia e Metalurgia',1),(4,'Galpão D - Caldeiraria e Soldagem Industrial',1),(5,'Galpão E - Laboratório de Eletrônica e CNC',1),(6,'Galpão Antigo F - Desativado para Reformas',0);
/*!40000 ALTER TABLE `tb_galpao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ordem_servico`
--

DROP TABLE IF EXISTS `tb_ordem_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_ordem_servico` (
  `id_ordem_servico` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_ferramenta` bigint(20) DEFAULT NULL,
  `id_usuario_tecnico` bigint(20) DEFAULT NULL,
  `descricao` text NOT NULL,
  `data_abertura` datetime NOT NULL,
  `data_fechamento` datetime DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id_ordem_servico`),
  KEY `id_ferramenta` (`id_ferramenta`),
  KEY `id_usuario_tecnico` (`id_usuario_tecnico`),
  CONSTRAINT `tb_ordem_servico_ibfk_1` FOREIGN KEY (`id_ferramenta`) REFERENCES `tb_ferramenta` (`id_ferramenta`),
  CONSTRAINT `tb_ordem_servico_ibfk_2` FOREIGN KEY (`id_usuario_tecnico`) REFERENCES `tb_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ordem_servico`
--

LOCK TABLES `tb_ordem_servico` WRITE;
/*!40000 ALTER TABLE `tb_ordem_servico` DISABLE KEYS */;
INSERT INTO `tb_ordem_servico` VALUES (1,1,11,'Troca dos rolamentos do eixo árvore principal e lubrificação geral.','2026-01-10 08:00:00','2026-01-11 16:30:00','Encerrada'),(2,5,8,'Substituição das palhetas rotativas do motor pneumático.','2026-02-14 13:15:00','2026-02-14 15:00:00','Encerrada'),(3,10,9,'Afiação das facas superiores da guilhotina e sangria do óleo hidráulico.','2026-03-01 09:00:00','2026-03-02 11:45:00','Encerrada'),(4,13,10,'Reparo na placa de potência inversora após pico de tensão na rede.','2026-03-15 14:00:00','2026-03-16 10:20:00','Encerrada'),(5,17,12,'Calibração dos eixos X, Y e Z e atualização do firmware do painel CNC.','2026-04-05 07:30:00','2026-04-05 12:00:00','Encerrada'),(6,2,11,'Ajuste na folga do carro transversal da fresadora.','2026-05-12 10:00:00','2026-05-12 14:30:00','Encerrada'),(7,14,12,'Substituição do bico consumível da tocha de plasma e teste de pressão do ar.','2026-05-20 08:10:00','2026-05-20 09:40:00','Encerrada'),(8,4,11,'Motor elétrico superaquecendo em alta rotação. Necessário rebobinamento.','2026-06-17 08:00:00',NULL,'Aberta'),(9,9,9,'Vazamento massivo de fluido hidráulico no pistão central da prensa excêntrica.','2026-06-18 07:45:00',NULL,'Aberta'),(10,15,8,'Empenamento no rolo compressor inferior da calandra. Encaminhado para retífica externa.','2026-06-18 10:30:00',NULL,'Aberta'),(11,22,10,'Resistência interna do soprador queimada. Aguardando peça de reposição do fornecedor.','2026-06-18 11:15:00',NULL,'Aberta');
/*!40000 ALTER TABLE `tb_ordem_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuario` (
  `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `perfil` varchar(20) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (1,'admin.master','admin123','ADMIN'),(2,'carlos.operador','senha123','OPERADOR'),(3,'ana.montagem','senha123','OPERADOR'),(4,'joao.corte','senha123','OPERADOR'),(5,'marcos.usinagem','senha123','OPERADOR'),(6,'julia.prensa','senha123','OPERADOR'),(7,'lucas.torno','senha123','OPERADOR'),(8,'roberto.tecnico','tec123','TECNICO'),(9,'marisa.manutencao','tec123','TECNICO'),(10,'felipe.eletronica','tec123','TECNICO'),(11,'andre.mecanica','tec123','TECNICO'),(12,'bruna.automacao','tec123','TECNICO');
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-18 16:39:07
