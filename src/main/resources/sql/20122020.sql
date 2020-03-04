CREATE DATABASE  IF NOT EXISTS `shopdmin` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `shopdmin`;
-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: shopdmin
-- ------------------------------------------------------
-- Server version	5.6.46

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
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('00000000000001','jhipster','config/liquibase/changelog/00000000000000_initial_schema.xml','2020-02-07 19:48:24',1,'EXECUTED','8:c5bfc567913b118109a43e981cd02883','createTable tableName=jhi_user; createTable tableName=jhi_authority; createTable tableName=jhi_user_authority; addPrimaryKey tableName=jhi_user_authority; addForeignKeyConstraint baseTableName=jhi_user_authority, constraintName=fk_authority_name, ...','',NULL,'3.6.3',NULL,NULL,'1079702358'),('20200207125957-1','jhipster','config/liquibase/changelog/20200207125957_added_entity_Category.xml','2020-02-07 20:18:19',2,'EXECUTED','8:0a14bb28b2cf40ee8eb63f50e8f717aa','createTable tableName=category','',NULL,'3.6.3',NULL,NULL,'1081499493'),('20200207125957-1-relations','jhipster','config/liquibase/changelog/20200207125957_added_entity_Category.xml','2020-02-07 20:18:19',3,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.6.3',NULL,NULL,'1081499493'),('20200207125957-1-data','jhipster','config/liquibase/changelog/20200207125957_added_entity_Category.xml','2020-02-07 20:18:19',4,'EXECUTED','8:bea4d96091d0cae66f36a3a2dfb5a2c1','loadData tableName=category','',NULL,'3.6.3','faker',NULL,'1081499493'),('20200207125958-1','jhipster','config/liquibase/changelog/20200207125958_added_entity_Product.xml','2020-02-07 20:18:19',5,'EXECUTED','8:be62f4b9a2a216dd502a5a36b8f44a90','createTable tableName=product','',NULL,'3.6.3',NULL,NULL,'1081499493'),('20200207125958-1-relations','jhipster','config/liquibase/changelog/20200207125958_added_entity_Product.xml','2020-02-07 20:18:19',6,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.6.3',NULL,NULL,'1081499493'),('20200207125958-1-data','jhipster','config/liquibase/changelog/20200207125958_added_entity_Product.xml','2020-02-07 20:18:19',7,'EXECUTED','8:485077809758ec927928cb8dcff481ab','loadData tableName=product','',NULL,'3.6.3','faker',NULL,'1081499493'),('20200207125958-2','jhipster','config/liquibase/changelog/20200207125958_added_entity_constraints_Product.xml','2020-02-07 20:18:19',8,'EXECUTED','8:e9ca5e103d0f32b1300a9ffdc438fdcb','addForeignKeyConstraint baseTableName=product, constraintName=fk_product_category_id, referencedTableName=category','',NULL,'3.6.3',NULL,NULL,'1081499493');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '','2020-02-13 22:50:14','2402:800:6318:f677:fdbe:97c8:a560:28ee%en0 (2402:800:6318:f677:fdbe:97c8:a560:28ee%en0)');
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_category_file_id` (`file_id`),
  CONSTRAINT `fk_category_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'mobile Fish',1,'Home Loan Account Table Computer','Trace'),(2,'Savings Account alarm',NULL,'Tasty Metal Bacon','red Chips Soap'),(3,'Home Loan Account',NULL,'web-readiness','Namibia'),(4,'Steel zero administration',NULL,'Multi-channelled Licensed','grey Cambridgeshire'),(5,'Canyon HDD',NULL,'Table Small Frozen Sausages Planner','envisioneer Music Public-key'),(7,'copy convergence',NULL,'Mayotte','Industrial'),(8,'connect Markets Chief',NULL,'capacitor archive','sky blue Tasty Plastic Pizza'),(9,'compress South Georgia and the South Sandwich Islands',NULL,'compelling mission-critical','bifurcated scalable'),(11,'THUỐC LÁ',NULL,NULL,'ACTIVE'),(12,'BÁNH KẸO',NULL,'s','sdsds'),(13,'DẦU ĂN',47,'/api/file/downloadFile/47','s'),(15,'GIA VỊ',49,'/api/file/downloadFile/49','s');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `storage` text COLLATE utf8_unicode_ci,
  `status` bit(1) DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (1,'abc.png','hhh/gg.ff',_binary '',NULL,NULL,NULL,NULL),(47,'download.jpeg','/Users/Dev/myHome/vuetifyshop/tmpImg',_binary '','admin','2020-02-17 08:13:23','admin','2020-02-17 08:13:23'),(49,'abc.jpg','/Users/Dev/myHome/vuetifyshop/tmpImg',_binary '','admin','2020-02-19 09:21:15','admin','2020-02-19 09:21:15');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_authority`
--

DROP TABLE IF EXISTS `jhi_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jhi_authority` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_authority`
--

LOCK TABLES `jhi_authority` WRITE;
/*!40000 ALTER TABLE `jhi_authority` DISABLE KEYS */;
INSERT INTO `jhi_authority` VALUES ('ROLE_ADMIN'),('ROLE_USER');
/*!40000 ALTER TABLE `jhi_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_persistent_audit_event`
--

DROP TABLE IF EXISTS `jhi_persistent_audit_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jhi_persistent_audit_event` (
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principal` varchar(50) NOT NULL,
  `event_date` timestamp NULL DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `idx_persistent_audit_event` (`principal`,`event_date`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_persistent_audit_event`
--

LOCK TABLES `jhi_persistent_audit_event` WRITE;
/*!40000 ALTER TABLE `jhi_persistent_audit_event` DISABLE KEYS */;
INSERT INTO `jhi_persistent_audit_event` VALUES (1,'admin','2020-02-07 05:50:49','AUTHENTICATION_SUCCESS'),(2,'admin','2020-02-07 06:03:00','AUTHENTICATION_SUCCESS'),(3,'admin','2020-02-07 06:10:49','AUTHENTICATION_SUCCESS'),(4,'admin','2020-02-07 06:18:40','AUTHENTICATION_SUCCESS'),(5,'admin','2020-02-07 07:09:17','AUTHENTICATION_SUCCESS'),(6,'admin','2020-02-07 07:43:52','AUTHENTICATION_SUCCESS'),(7,'admin','2020-02-07 07:57:00','AUTHENTICATION_SUCCESS'),(8,'admin','2020-02-07 10:27:57','AUTHENTICATION_SUCCESS'),(9,'admin','2020-02-08 06:43:41','AUTHENTICATION_SUCCESS'),(10,'admin','2020-02-08 06:47:45','AUTHENTICATION_SUCCESS'),(11,'admin','2020-02-08 06:48:06','AUTHENTICATION_SUCCESS'),(12,'admin','2020-02-08 06:49:06','AUTHENTICATION_SUCCESS'),(13,'admin','2020-02-08 06:58:37','AUTHENTICATION_SUCCESS'),(14,'admin','2020-02-08 07:06:15','AUTHENTICATION_SUCCESS'),(15,'admin','2020-02-08 07:10:00','AUTHENTICATION_SUCCESS'),(16,'admin','2020-02-08 07:12:21','AUTHENTICATION_SUCCESS'),(17,'admin','2020-02-08 07:12:54','AUTHENTICATION_SUCCESS'),(18,'admin','2020-02-08 07:44:34','AUTHENTICATION_SUCCESS'),(19,'admin','2020-02-08 09:24:09','AUTHENTICATION_SUCCESS'),(20,'admin','2020-02-09 01:10:54','AUTHENTICATION_SUCCESS'),(21,'admin','2020-02-09 08:05:45','AUTHENTICATION_SUCCESS'),(22,'admin','2020-02-10 07:38:52','AUTHENTICATION_SUCCESS'),(23,'admin','2020-02-10 07:47:19','AUTHENTICATION_SUCCESS'),(24,'admin','2020-02-10 07:53:11','AUTHENTICATION_SUCCESS'),(25,'admin','2020-02-11 08:55:47','AUTHENTICATION_SUCCESS'),(26,'admin','2020-02-13 08:56:31','AUTHENTICATION_SUCCESS'),(27,'admin','2020-02-15 00:41:32','AUTHENTICATION_SUCCESS'),(28,'admin','2020-02-15 00:45:28','AUTHENTICATION_SUCCESS'),(29,'admin','2020-02-15 00:50:11','AUTHENTICATION_SUCCESS'),(30,'admin','2020-02-15 04:43:08','AUTHENTICATION_SUCCESS'),(31,'admin','2020-02-15 06:05:45','AUTHENTICATION_SUCCESS'),(32,'admin','2020-02-15 06:20:50','AUTHENTICATION_SUCCESS'),(33,'admin','2020-02-15 07:22:17','AUTHENTICATION_SUCCESS'),(34,'admin','2020-02-17 07:00:18','AUTHENTICATION_SUCCESS'),(35,'admin','2020-02-17 08:10:36','AUTHENTICATION_SUCCESS'),(36,'admin','2020-02-18 08:48:11','AUTHENTICATION_SUCCESS'),(37,'admin','2020-02-18 09:08:35','AUTHENTICATION_SUCCESS'),(38,'admin','2020-02-18 09:13:41','AUTHENTICATION_SUCCESS'),(39,'admin','2020-02-19 08:16:26','AUTHENTICATION_SUCCESS'),(40,'admin','2020-02-19 09:08:34','AUTHENTICATION_SUCCESS'),(41,'admin','2020-02-20 07:33:42','AUTHENTICATION_SUCCESS'),(42,'admin','2020-02-20 08:28:21','AUTHENTICATION_SUCCESS'),(43,'admin','2020-02-26 06:06:12','AUTHENTICATION_SUCCESS'),(44,'admin','2020-02-26 06:12:07','AUTHENTICATION_FAILURE'),(45,'admin','2020-02-26 06:12:09','AUTHENTICATION_SUCCESS'),(46,'admin','2020-02-26 06:16:38','AUTHENTICATION_SUCCESS'),(47,'admin','2020-02-26 08:19:57','AUTHENTICATION_SUCCESS');
/*!40000 ALTER TABLE `jhi_persistent_audit_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_persistent_audit_evt_data`
--

DROP TABLE IF EXISTS `jhi_persistent_audit_evt_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jhi_persistent_audit_evt_data` (
  `event_id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`,`name`),
  KEY `idx_persistent_audit_evt_data` (`event_id`),
  CONSTRAINT `fk_evt_pers_audit_evt_data` FOREIGN KEY (`event_id`) REFERENCES `jhi_persistent_audit_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_persistent_audit_evt_data`
--

LOCK TABLES `jhi_persistent_audit_evt_data` WRITE;
/*!40000 ALTER TABLE `jhi_persistent_audit_evt_data` DISABLE KEYS */;
INSERT INTO `jhi_persistent_audit_evt_data` VALUES (44,'message','Bad credentials'),(44,'type','org.springframework.security.authentication.BadCredentialsException');
/*!40000 ALTER TABLE `jhi_persistent_audit_evt_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_user`
--

DROP TABLE IF EXISTS `jhi_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jhi_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `image_url` varchar(256) DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `lang_key` varchar(10) DEFAULT NULL,
  `activation_key` varchar(20) DEFAULT NULL,
  `reset_key` varchar(20) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NULL,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_user_login` (`login`),
  UNIQUE KEY `ux_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_user`
--

LOCK TABLES `jhi_user` WRITE;
/*!40000 ALTER TABLE `jhi_user` DISABLE KEYS */;
INSERT INTO `jhi_user` VALUES (1,'system','$2a$10$mE.qmcV0mFU5NcKh73TZx.z4ueI/.bDWbj0T1BYyqP481kGGarKLG','System','System','system@localhost','',_binary '','en',NULL,NULL,'system',NULL,NULL,'system',NULL),(2,'anonymoususer','$2a$10$j8S5d7Sr7.8VTOYNviDPOeWX8KcYILUVJBsYV83Y5NtECayypx9lO','Anonymous','User','anonymous@localhost','',_binary '','en',NULL,NULL,'system',NULL,NULL,'system',NULL),(3,'admin','$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC','Administrator','Administrator','admin@localhost','',_binary '','en',NULL,NULL,'system',NULL,NULL,'system',NULL),(4,'user','$2a$10$VEjxo0jq2YG9Rbk2HmX9S.k1uZBGYUHdUcid3g/vfiEl7lwWgOH/K','User','User','user@localhost','',_binary '','en',NULL,NULL,'system',NULL,NULL,'system',NULL);
/*!40000 ALTER TABLE `jhi_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_user_authority`
--

DROP TABLE IF EXISTS `jhi_user_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jhi_user_authority` (
  `user_id` bigint(20) NOT NULL,
  `authority_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`,`authority_name`),
  KEY `fk_authority_name` (`authority_name`),
  CONSTRAINT `fk_authority_name` FOREIGN KEY (`authority_name`) REFERENCES `jhi_authority` (`name`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_user_authority`
--

LOCK TABLES `jhi_user_authority` WRITE;
/*!40000 ALTER TABLE `jhi_user_authority` DISABLE KEYS */;
INSERT INTO `jhi_user_authority` VALUES (1,'ROLE_ADMIN'),(3,'ROLE_ADMIN'),(1,'ROLE_USER'),(3,'ROLE_USER'),(4,'ROLE_USER');
/*!40000 ALTER TABLE `jhi_user_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `descriptions` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category_id` (`category_id`),
  CONSTRAINT `fk_product_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'monitor 1080p Checking Account','world-class Frozen IB','Highway Ergonomic',37081,'Lempira',66592,'New York tangible Mississippi',NULL),(2,'Frozen bus','hard drive Robust Networked','Poland',42754,'Grocery',10789,'Outdoors',NULL),(3,'Harbor Montana','Corporate Phased relationships','white Brand Money Market Account',69478,'JSON',62435,'modular Refined Squares',NULL),(4,'maroon','EXE projection Fresh','support Gorgeous',22793,'synergies copying',86073,'Games',NULL),(5,'Iraq Bedfordshire','Concrete 24/7 Directives','sky blue',55810,'facilitate Tasty Concrete Chips Exclusive',69630,'card Plastic',NULL),(6,'Computers Personal Loan Account Berkshire','Home','Investor Public-key',14489,'Berkshire Designer',24205,'Bulgarian Lev navigate',NULL),(7,'Re-contextualized','web-enabled invoice withdrawal','bypassing optical',15071,'Bedfordshire',69581,'HDD',NULL),(8,'Algerian Dinar','firewall','Future-proofed deposit Sausages',69093,'synthesize Creative',13752,'bricks-and-clicks Concrete Global',NULL),(9,'Fiji Dollar Profound Bacon','Macao Equatorial Guinea Vision-oriented','Agent',55829,'THX pink even-keeled',70035,'programming SCSI drive',NULL),(10,'invoice Unbranded Cheese','New Zealand Dollar Alabama transform','invoice Home Gloves',54873,'Cayman Islands Dollar invoice',22426,'driver',NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-27 21:37:28
