-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hotel
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `Username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `displayname` varchar(45) DEFAULT NULL,
  `PhoneNumber` int DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `rate` varchar(45) DEFAULT NULL,
  `ratecomment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('amr123','bGAHu23hgl','amrabdelhady99@gmail.com','amrx300',1113761670,21,'helwan','1','1'),('amrx300','1RGhOs7OrX','amrabdelhady99@gmail.com','3amora',1113761670,21,'helwan','5','gamd fash'),('sasaelgamd','BtcXbYQlrS','amrabdelhady99@gmail.com','sasa',1113761670,21,'helwan','67890','sfdgfhgjkll;');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelinfo`
--

DROP TABLE IF EXISTS `hotelinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotelinfo` (
  `name` varchar(45) NOT NULL,
  `location` varchar(45) DEFAULT NULL,
  `priceofwholeroom` int DEFAULT NULL,
  `priceofadult` int DEFAULT NULL,
  `priceofchild` int DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `map` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelinfo`
--

LOCK TABLES `hotelinfo` WRITE;
/*!40000 ALTER TABLE `hotelinfo` DISABLE KEYS */;
INSERT INTO `hotelinfo` VALUES ('alexhotel1','Alexandria',1000,100,50,5,'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d13650.891843225956!2d29.900287!3d31.200694!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x1bde4eb824b5bff3!2sLe%20Metropole%20Paradise%20Inn%20Group!5e0!3m2!1sen!2seg!4v1609454843937!5m2!1sen!2seg'),('alexhotel2','Alexandria',1500,200,100,5,'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d13650.720230128458!2d29.9006096!3d31.2018833!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xced3f8305b54d402!2sSemiramis%20Hotel!5e0!3m2!1sen!2seg!4v1609454662816!5m2!1sen!2seg'),('cairohotel1','cairo',1000,100,50,5,'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3452.813758486626!2d31.272169814594317!3d30.070872524279654!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14583f9b4c148db1%3A0xcb7eb6f508691d6c!2sCairo%20Paradise%20Hotel!5e0!3m2!1sen!2seg!4v1609455201746!5m2!1sen!2seg'),('cairohotel2','cairo',1500,200,100,5,'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d13813.17532063239!2d31.2250811!3d30.057111!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xd01a820fea961b3e!2sCairo%20Marriott%20Hotel%20%26%20Omar%20Khayyam%20Casino!5e0!3m2!1sen!2seg!4v1609455275970!5m2!1sen!2seg'),('gizahotel1','giza',1000,100,50,5,'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d13821.172785351459!2d31.1762474!3d29.9997365!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xcc64293cc14097ef!2sBarcelo%20Cairo%20Pyramids!5e0!3m2!1sen!2seg!4v1609455416325!5m2!1sen!2seg'),('gizahotel2','giza',1500,200,100,5,'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3456.1576919607833!2d31.1388923!3d29.9748978!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xbe2cf2309d6ca1a2!2sPyramids%20View%20Inn!5e0!3m2!1sen!2seg!4v1609455458474!5m2!1sen!2seg'),('Hurghadahotel1','Hurghada',1000,100,50,5,'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14199.385307698802!2d33.8247173!3d27.1611249!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x6c0c82b597202ad4!2sContinental%20Hotel%20Hurghada!5e0!3m2!1sen!2seg!4v1609455721575!5m2!1sen!2seg'),('Hurghadahotel2','Hurghada',1500,200,100,5,'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14168.982928448042!2d33.6738541!3d27.3992622!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x1b6b59d8ec852e9f!2sThe%20Three%20Corners%20Rihana%20Resort!5e0!3m2!1sen!2seg!4v1609455758656!5m2!1sen!2seg'),('Sharm El sheikhhotel1','Sharm El sheikh',1000,100,50,5,'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14102.442420279014!2d34.3404473!3d27.9139205!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x9b7fa058a25aeac8!2sM%C3%B6venpick%20Resort%20Sharm%20el%20Sheikh!5e0!3m2!1sen!2seg!4v1609455585316!5m2!1sen!2seg'),('Sharm El sheikhhotel2','Sharm El sheikh',1500,200,100,5,'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14098.704693782141!2d34.383418!3d27.942571!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xfb6f898c7ad7ab6c!2sSUNRISE%20Arabian%20Beach%20Resort%20-Grand%20Select-!5e0!3m2!1sen!2seg!4v1609455637964!5m2!1sen!2seg');
/*!40000 ALTER TABLE `hotelinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate` (
  `rateID` int NOT NULL AUTO_INCREMENT,
  `stars` int DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `Username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rateID`),
  KEY `Username_idx` (`Username`),
  KEY `name_idx` (`name`),
  CONSTRAINT `name` FOREIGN KEY (`name`) REFERENCES `hotelinfo` (`name`),
  CONSTRAINT `Username` FOREIGN KEY (`Username`) REFERENCES `client` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
INSERT INTO `rate` VALUES (6,5,'hotel ebn mara','cairohotel2','sasaelgamd'),(7,5,'hotel ebn mara','cairohotel1','sasaelgamd'),(8,5,'hotel ebn mara','alexhotel2','sasaelgamd'),(9,5,'hotel ebn mara','alexhotel1','sasaelgamd'),(10,5,'hotel ebn mara','gizahotel2','sasaelgamd'),(11,5,'hotel ebn mara','gizahotel1','sasaelgamd'),(12,5,'hotel ebn mara','Hurghadahotel1','sasaelgamd'),(13,5,'hotel ebn mara','Hurghadahotel2','sasaelgamd'),(14,5,'hotel ebn mara','Sharm El sheikhhotel1','sasaelgamd'),(15,5,'hotel ebn mara','Sharm El sheikhhotel2','sasaelgamd');
/*!40000 ALTER TABLE `rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `roomID` int NOT NULL AUTO_INCREMENT,
  `roomtype` varchar(225) DEFAULT NULL,
  `available` varchar(45) DEFAULT NULL,
  `roomfacilities` varchar(500) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `view` varchar(225) DEFAULT NULL,
  `smoking` varchar(45) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `parking` varchar(225) DEFAULT NULL,
  `bedtype` varchar(225) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`roomID`),
  KEY `name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'Standard Room with Garden View ','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','hurghadahotel1','Garden view','​No smoking','24 m²','Free private parking is possible on site (reservation is not needed).','1 king bed',0),(2,'Standard Room with Pool View','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','hurghadahotel1','Pool view','​No smoking','24 m²','Free private parking is possible on site (reservation is not needed).','2 twin beds',1000),(3,'Family Room with Garden View','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','hurghadahotel1','Garden view','No smoking','30 m²','Free private parking is possible on site (reservation is not needed).','2 twin beds',2000),(4,'Double Room with Shared Bathroom','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','hurghadahotel2','City view','No smoking','16 m²','No parking available.','1 queen bed',0),(5,'Deluxe Double or Twin Room with City View','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','hurghadahotel2','City view','No smoking','12 m²','No parking available.','1 twin bed  and 1 queen bed',1000),(6,'Deluxe Double Room (2 Adults + 1 Child)','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','hurghadahotel2','City view','No smoking','12 m²','No parking available.','1 twin bed  and 1 queen bed ',2000),(7,'Standard Room with Sea View','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','alexhotel1','Garden view and Pool view','No smoking','32 m²','Private parking is possible on site (reservation is not needed) and charges apply.','2 twin beds ',0),(8,'Junior Suite','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','alexhotel1','View','No smoking','50 m²','Private parking is possible on site (reservation is not needed) and charges apply.','1 king bed ',1000),(9,'Premium Suite','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','alexhotel1','View','No smoking','50 m²','Private parking is possible on site (reservation is not needed) and charges apply.','1 king bed ',2000),(10,'Standard Double Room','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','alexhotel2','City view','No smoking','25 m²','No parking available.','1 king bed ',0),(11,'Deluxe Double room with sea side view','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','alexhotel2','View','No smoking','30 m²','No parking available.','1 full bed',1000),(12,'Superior Room with Direct Sea view','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','alexhotel2','Ocean view','No smoking','35 m²','No parking available.','1 king bed',2000),(13,'Superior Room','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','sharm elsheikhhotel1','View','No smoking','32 m²','Free private parking is possible on site (reservation is needed).','1 queen bed',0),(14,'Deluxe Room','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','sharm elsheikhhotel1','View','No smoking','36 m²','Free private parking is possible on site (reservation is needed).','2 twin beds and 1 full bed ',1000),(15,'Premium Room','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','sharm elsheikhhotel1','view','No smoking','36 m²','Free private parking is possible on site (reservation is needed).','1 queen bed and 1 king bed',2000),(16,'Deluxe Room with partial sea view','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','sharm elsheikhhotel2','Ocean view','No smoking','51 m²','Free private parking is possible on site (reservation is not needed).','2 twin bed',0),(17,'Family Suite','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','sharm elsheikhhotel2','Pool view','No smoking','53 m²','Free private parking is possible on site (reservation is not needed).','1 king bed  and 1 sofa bed ',1000),(18,'Executive Suite with Sea View','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','sharm elsheikhhotel2','Ocean view and Pool view and Garden view','No smoking','63 m²','Free private parking is possible on site (reservation is not needed).','1 king bed ',2000),(30,'Double Room ','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','cairohotel1','City view','No smoking','20 m²','Free public parking is possible on site (reservation is needed).','1 full bed',0),(31,'Deluxe Double or Twin Room with City View','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','cairohotel1','City view','No smoking','15 m²','Free public parking is possible on site (reservation is needed).','2 twin bed',1000),(32,'Superior Double or Twin Room with City View','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','cairohotel1','City view','No smoking','25 m²','Free public parking is possible on site (reservation is needed).','2 twin beds  and 1 queen bed ',2000),(33,'Standard Limited View, Guest room, 1 King, 1st or 2nd Floor, Balcony','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','cairohotel2','City view','No smoking','32 m²','Private parking is possible on site (reservation is needed) and charges apply.','1 king bed ',0),(34,'Deluxe Room, 1 King, Balcony','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','cairohotel2','City view','No smoking','32 m²','Private parking is possible on site (reservation is needed) and charges apply.','1 king bed ',1000),(35,'Deluxe Room, 2 Double, Balcony','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','cairohotel2','City view','No smoking','32 m²','Private parking is possible on site (reservation is needed) and charges apply.','2 full beds ',2000),(36,'Double Room','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','gizahotel1','Pyramids view','No smoking','20 m²','Free public parking is possible on site (reservation is needed).','2 full beds',0),(37,'Deluxe Double or Twin Room with City View','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','gizahotel1','City view','No smoking','15 m²','Free public parking is possible on site (reservation is needed).','2 twin beds ',1000),(38,'Superior Double or Twin Room with City View','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','gizahotel1','City view','No smoking','25 m²','Free public parking is possible on site (reservation is needed).','2 twin beds  and 1 queen bed ',2000),(39,'Superior Room - King Bed','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','gizahotel2','Landmark view and River view and City view and Garden view and Pool view','No smoking','42 m²','Private parking is possible on site (reservation is not needed) and charges may apply.','1 queen bed ',0),(40,'Deluxe Room - King Bed','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','gizahotel2','Landmark view and City view Garden view','No smoking','54 m²','Private parking is possible on site (reservation is not needed) and charges may apply.','1 king bed ',1000),(41,'Deluxe Room - 2 Twin Beds','1','Linens-Wardrobe or closet-Minibar-Air conditioning-Safe-Tile/Marble floor-Electric kettle-Desk-TV-Telephone-Satellite channels-Flat screen TV-Balcony-Wake up service','gizahotel2','Landmark view and River view and City view and Garden view and Pool view','No smoking','54 m²','Private parking is possible on site (reservation is not needed) and charges may apply.','2 twin beds',2000);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hotel'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-07  1:02:23
