/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.1.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: world_travel
-- ------------------------------------------------------
-- Server version	12.1.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_orders_FK` (`order_id`),
  CONSTRAINT `customers_orders_FK` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `customers` VALUES
(1,'Andrew','Maximov','regular',NULL,'maximove81@gmail.com','+79267889700','12345678');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 3,
  `price` decimal(10,0) DEFAULT NULL,
  `location` longtext DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `hotels` VALUES
(1,'Beauty SPA',4,100,'France',NULL),
(2,'Forest wonder',4,150,'Canada','Best place in forest!'),
(3,'Miami beach',5,200,'USA',NULL),
(4,'Hainahn luxury',5,200,'China',NULL),
(5,'Las Vegas Manson',10,2000,'Las Vegas',NULL),
(6,'Las Vegas Manson',9,2000,'Las Vegas',NULL),
(7,'Bali bungaloes',6,200,'Bali','Fresh air, friendly iguanas'),
(8,'Moscow Never Sleep',7,800,'Moscow','Can be entered any time');
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `managers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `managers_tours_FK` FOREIGN KEY (`id`) REFERENCES `tours` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `managers` VALUES
(2,'Ann','Ivanova','annivanova@mail.ru','89112223333');
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) NOT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `order_date` datetime NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,0) DEFAULT NULL,
  `payment_status` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `orders_tours_FK` (`tour_id`),
  KEY `orders_managers_FK` (`manager_id`),
  KEY `orders_customers_FK` (`customer_id`),
  CONSTRAINT `orders_customers_FK` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `orders_managers_FK` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`id`),
  CONSTRAINT `orders_tours_FK` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `orders` VALUES
(1,1,2,'2025-12-10 18:13:48',1,NULL,0),
(2,2,NULL,'2025-12-12 19:35:07',1,NULL,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `tours`
--

DROP TABLE IF EXISTS `tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `hotels_id` int(11) DEFAULT NULL,
  `transport_id` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tours_Transfer_FK` (`transfer_id`),
  KEY `tours_Hotels_FK` (`hotels_id`),
  KEY `tours_transportations_FK` (`transport_id`),
  CONSTRAINT `tours_Hotels_FK` FOREIGN KEY (`hotels_id`) REFERENCES `hotels` (`id`),
  CONSTRAINT `tours_Transfer_FK` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`),
  CONSTRAINT `tours_transportations_FK` FOREIGN KEY (`transport_id`) REFERENCES `transportations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tours`
--

LOCK TABLES `tours` WRITE;
/*!40000 ALTER TABLE `tours` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `tours` VALUES
(1,'Miami',7,3,1,NULL),
(2,'Thailand',5,NULL,2,NULL),
(3,'France',4,1,3,NULL),
(4,'China Hainahn island',5,4,4,NULL),
(5,'Prague',NULL,NULL,NULL,NULL),
(8,'London',4,NULL,5,NULL),
(12,'Quebek',9,2,6,'New tour to explore nature'),
(13,'Las Vegas',10,NULL,7,'Casino treasure'),
(14,'Las Vegas',10,5,7,'Treasure hunt');
/*!40000 ALTER TABLE `tours` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers`
--

LOCK TABLES `transfers` WRITE;
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `transfers` VALUES
(4,'bus',10),
(5,'boat',5),
(6,'minibus',7),
(7,'helicopter',50),
(8,'taxi',20),
(9,'dog slaighs',100),
(10,'luxury car',500);
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `transportations`
--

DROP TABLE IF EXISTS `transportations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_location` varchar(100) NOT NULL,
  `to_location` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportations`
--

LOCK TABLES `transportations` WRITE;
/*!40000 ALTER TABLE `transportations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `transportations` VALUES
(1,'Moscow','USA','avia',1000,'2026-12-09 16:42:11','2026-12-10 21:43:13','USA Airlines'),
(2,'Moscow','Thailand','avia',500,'2025-12-11 18:44:29','2025-12-12 20:44:42','Turkish Airlines'),
(3,'N.Novgorod','France','avia',800,'2026-02-24 16:45:24','2026-02-08 16:45:35','Turkish Airlines'),
(4,'Moscow','China','avia',1200,'2026-03-12 15:26:36','2026-03-12 20:27:00','China Airlines'),
(5,'Ufa','London','avia',2000,'2026-03-20 00:00:00','2026-03-20 00:00:00','GB Airlines'),
(6,'London','Quebek','avia',500,'2026-03-20 00:00:00','2026-03-20 00:00:00','Canada Flights'),
(7,'Anywhere','Las Vegas','avia',2000,'2026-03-20 00:00:00','2026-03-20 00:00:00','Las Vegas private line');
/*!40000 ALTER TABLE `transportations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'world_travel'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-12-15 17:48:48
