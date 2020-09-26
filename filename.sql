-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: bagisto
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int(10) unsigned DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int(10) unsigned DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'only for customer_addresses',
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_customer_id_foreign` (`customer_id`),
  KEY `addresses_cart_id_foreign` (`cart_id`),
  KEY `addresses_order_id_foreign` (`order_id`),
  CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'cart_billing',NULL,8,NULL,'محمد','الريسي',NULL,'ىلااانر','liwa',NULL,'657','liwa','لوى','OM','mohammed.alrisi11@outlook.com','97759659',NULL,0,NULL,'2020-09-25 14:21:53','2020-09-25 14:21:53'),(2,'cart_shipping',NULL,8,NULL,'محمد','الريسي',NULL,'ىلااانر','liwa',NULL,'657','liwa','لوى','OM','mohammed.alrisi11@outlook.com','97759659',NULL,0,NULL,'2020-09-25 14:21:53','2020-09-25 14:21:53');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_password_resets`
--

DROP TABLE IF EXISTS `admin_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_password_resets`
--

LOCK TABLES `admin_password_resets` WRITE;
/*!40000 ALTER TABLE `admin_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(10) unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Example','admin@example.com','$2y$10$BVcqQ2JCdlAf6SGWAc9RpO9y737KDj1IoDxt9U1AZpCRZqgpbi8Xu','ez7uIAsi399chFuwvDNYMWDRJBYWuiiTVl4wM6T8F3CSuKuJ71VYna7fIxVMSoVTxKckriUIrgtLWH3N',1,1,NULL,'2020-09-23 01:38:17','2020-09-23 01:38:17');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_families`
--

DROP TABLE IF EXISTS `attribute_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_families` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_families`
--

LOCK TABLES `attribute_families` WRITE;
/*!40000 ALTER TABLE `attribute_families` DISABLE KEYS */;
INSERT INTO `attribute_families` VALUES (1,'default','Default',0,1);
/*!40000 ALTER TABLE `attribute_families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_group_mappings`
--

DROP TABLE IF EXISTS `attribute_group_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_group_mappings` (
  `attribute_id` int(10) unsigned NOT NULL,
  `attribute_group_id` int(10) unsigned NOT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`),
  CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_group_mappings`
--

LOCK TABLES `attribute_group_mappings` WRITE;
/*!40000 ALTER TABLE `attribute_group_mappings` DISABLE KEYS */;
INSERT INTO `attribute_group_mappings` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,2,1),(10,2,2),(11,4,1),(12,4,2),(13,4,3),(14,4,4),(15,4,5),(16,3,1),(17,3,2),(18,3,3),(20,5,2),(22,5,4),(23,1,10),(24,1,11),(25,1,12),(26,1,9);
/*!40000 ALTER TABLE `attribute_group_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_groups`
--

DROP TABLE IF EXISTS `attribute_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `attribute_family_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`),
  CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_groups`
--

LOCK TABLES `attribute_groups` WRITE;
/*!40000 ALTER TABLE `attribute_groups` DISABLE KEYS */;
INSERT INTO `attribute_groups` VALUES (1,'General',1,0,1),(2,'Description',2,0,1),(3,'Meta Description',3,0,1),(4,'Price',4,0,1),(5,'Shipping',5,0,1);
/*!40000 ALTER TABLE `attribute_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_option_translations`
--

DROP TABLE IF EXISTS `attribute_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_option_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `attribute_option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_option_translations_attribute_option_id_locale_unique` (`attribute_option_id`,`locale`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_option_translations`
--

LOCK TABLES `attribute_option_translations` WRITE;
/*!40000 ALTER TABLE `attribute_option_translations` DISABLE KEYS */;
INSERT INTO `attribute_option_translations` VALUES (1,'en','Red',1),(2,'en','Green',2),(3,'en','Yellow',3),(4,'en','Black',4),(5,'en','White',5),(6,'en','36',6),(7,'en','37',7),(8,'en','38',8),(9,'en','39',9),(10,'ar','',6),(11,'ar','',7),(12,'ar','',8),(13,'ar','',9),(14,'en','40',10),(15,'ar','',10),(16,'en','41',11),(17,'ar','',11),(18,'ar','',1),(19,'ar','',2),(20,'ar','',3),(21,'ar','',4),(22,'ar','',5),(23,'en','brown',12),(24,'ar','',12),(25,'en','blue',13),(26,'ar','',13),(27,'en','beige',14),(28,'ar','',14),(29,'en','gold',15),(30,'ar','',15),(31,'en','selver',16),(32,'ar','',16),(33,'en','pink',17),(34,'ar','',17),(35,'en','wine',18),(36,'ar','عنابي',18),(37,'en','grey',19),(38,'ar','',19);
/*!40000 ALTER TABLE `attribute_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_options`
--

DROP TABLE IF EXISTS `attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `swatch_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_options`
--

LOCK TABLES `attribute_options` WRITE;
/*!40000 ALTER TABLE `attribute_options` DISABLE KEYS */;
INSERT INTO `attribute_options` VALUES (1,'Red',1,23,NULL),(2,'Green',2,23,NULL),(3,'Yellow',3,23,NULL),(4,'Black',4,23,NULL),(5,'White',5,23,NULL),(6,'36',5,24,NULL),(7,'37',5,24,NULL),(8,'38',5,24,NULL),(9,'39',5,24,NULL),(10,'40',5,24,NULL),(11,'41',5,24,NULL),(12,'brown',6,23,NULL),(13,'blue ',7,23,NULL),(14,'beige ',8,23,NULL),(15,'gold',9,23,NULL),(16,'selver',10,23,NULL),(17,'pink',11,23,NULL),(18,'wine',12,23,NULL),(19,'grey',13,23,NULL);
/*!40000 ALTER TABLE `attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_translations`
--

DROP TABLE IF EXISTS `attribute_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `attribute_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_translations`
--

LOCK TABLES `attribute_translations` WRITE;
/*!40000 ALTER TABLE `attribute_translations` DISABLE KEYS */;
INSERT INTO `attribute_translations` VALUES (1,'en','SKU',1),(2,'en','Name',2),(3,'en','URL Key',3),(4,'en','Tax Category',4),(5,'en','New',5),(6,'en','Featured',6),(7,'en','Visible Individually',7),(8,'en','Status',8),(9,'en','Short Description',9),(10,'en','Description',10),(11,'en','Price',11),(12,'en','Cost',12),(13,'en','Special Price',13),(14,'en','Special Price From',14),(15,'en','Special Price To',15),(16,'en','Meta Description',16),(17,'en','Meta Keywords',17),(18,'en','Meta Description',18),(20,'en','Height',20),(22,'en','Weight',22),(23,'en','Color',23),(24,'en','Size',24),(25,'en','Brand',25),(26,'en','Allow Guest Checkout',26),(27,'ar','',24),(28,'ar','',22),(29,'ar','',23);
/*!40000 ALTER TABLE `attribute_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_locale` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_channel` tinyint(1) NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `swatch_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_in_flat` tinyint(1) NOT NULL DEFAULT '1',
  `is_comparable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'sku','SKU','text',NULL,1,1,1,0,0,0,0,0,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,0),(2,'name','Name','text',NULL,2,1,0,1,1,0,0,0,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,1),(3,'url_key','URL Key','text',NULL,3,1,1,0,0,0,0,0,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,0),(4,'tax_category_id','Tax Category','select',NULL,4,0,0,0,1,0,0,0,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,0),(5,'new','New','boolean',NULL,5,0,0,0,0,0,0,0,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,0),(6,'featured','Featured','boolean',NULL,6,0,0,0,0,0,0,0,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,0),(7,'visible_individually','Visible Individually','boolean',NULL,7,1,0,0,0,0,0,0,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,0),(8,'status','Status','boolean',NULL,8,1,0,0,0,0,0,0,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,0),(9,'short_description','Short Description','textarea',NULL,9,1,0,1,1,0,0,0,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,0),(10,'description','Description','textarea',NULL,10,1,0,1,1,0,0,0,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,1),(11,'price','Price','price','decimal',11,1,0,0,0,1,0,0,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,1),(12,'cost','Cost','price','decimal',12,0,0,0,1,0,0,1,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,0),(13,'special_price','Special Price','price','decimal',13,0,0,0,0,0,0,0,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,0),(14,'special_price_from','Special Price From','date',NULL,14,0,0,0,1,0,0,0,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,0),(15,'special_price_to','Special Price To','date',NULL,15,0,0,0,1,0,0,0,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,0),(16,'meta_title','Meta Title','textarea',NULL,16,0,0,1,1,0,0,0,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,0),(17,'meta_keywords','Meta Keywords','textarea',NULL,17,0,0,1,1,0,0,0,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,0),(18,'meta_description','Meta Description','textarea',NULL,18,0,0,1,1,0,0,1,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,0),(20,'height','Height','text','decimal',20,0,0,0,0,0,0,1,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,0),(22,'weight','Weight','text','decimal',22,0,0,0,0,0,0,0,0,'2020-09-23 01:38:17','2020-09-24 00:29:52',NULL,1,0),(23,'color','Color','select','',23,1,0,0,0,1,1,1,0,'2020-09-23 01:38:17','2020-09-24 13:07:13',NULL,1,0),(24,'size','Size','select','',24,0,0,0,0,1,1,1,0,'2020-09-23 01:38:17','2020-09-24 00:27:02',NULL,1,0),(25,'brand','Brand','select',NULL,25,0,0,0,0,1,0,0,1,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,0),(26,'guest_checkout','Guest Checkout','boolean',NULL,8,1,0,0,0,0,0,0,0,'2020-09-23 01:38:17','2020-09-23 01:38:17',NULL,1,0);
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_appointment_slots`
--

DROP TABLE IF EXISTS `booking_product_appointment_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_product_appointment_slots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `duration` int(11) DEFAULT NULL,
  `break_time` int(11) DEFAULT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_appointment_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_appointment_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_appointment_slots`
--

LOCK TABLES `booking_product_appointment_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_appointment_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_appointment_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_default_slots`
--

DROP TABLE IF EXISTS `booking_product_default_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_product_default_slots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `booking_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `break_time` int(11) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_default_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_default_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_default_slots`
--

LOCK TABLES `booking_product_default_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_default_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_default_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_event_ticket_translations`
--

DROP TABLE IF EXISTS `booking_product_event_ticket_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_product_event_ticket_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `booking_product_event_ticket_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `booking_product_event_ticket_translations_locale_unique` (`booking_product_event_ticket_id`,`locale`),
  CONSTRAINT `booking_product_event_ticket_translations_locale_foreign` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_event_ticket_translations`
--

LOCK TABLES `booking_product_event_ticket_translations` WRITE;
/*!40000 ALTER TABLE `booking_product_event_ticket_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_event_ticket_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_event_tickets`
--

DROP TABLE IF EXISTS `booking_product_event_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_product_event_tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,4) DEFAULT '0.0000',
  `qty` int(11) DEFAULT '0',
  `booking_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_event_tickets_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_event_tickets_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_event_tickets`
--

LOCK TABLES `booking_product_event_tickets` WRITE;
/*!40000 ALTER TABLE `booking_product_event_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_event_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_rental_slots`
--

DROP TABLE IF EXISTS `booking_product_rental_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_product_rental_slots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `renting_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `daily_price` decimal(12,4) DEFAULT '0.0000',
  `hourly_price` decimal(12,4) DEFAULT '0.0000',
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_rental_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_rental_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_rental_slots`
--

LOCK TABLES `booking_product_rental_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_rental_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_rental_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_table_slots`
--

DROP TABLE IF EXISTS `booking_product_table_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_product_table_slots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `price_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_limit` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL,
  `break_time` int(11) NOT NULL,
  `prevent_scheduling_before` int(11) NOT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_table_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_table_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_table_slots`
--

LOCK TABLES `booking_product_table_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_table_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_table_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_products`
--

DROP TABLE IF EXISTS `booking_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) DEFAULT '0',
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_location` tinyint(1) NOT NULL DEFAULT '0',
  `available_every_week` tinyint(1) DEFAULT NULL,
  `available_from` datetime DEFAULT NULL,
  `available_to` datetime DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_products_product_id_foreign` (`product_id`),
  CONSTRAINT `booking_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_products`
--

LOCK TABLES `booking_products` WRITE;
/*!40000 ALTER TABLE `booking_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) DEFAULT '0',
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `booking_product_event_ticket_id` int(10) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_order_id_foreign` (`order_id`),
  KEY `bookings_product_id_foreign` (`product_id`),
  CONSTRAINT `bookings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `items_count` int(11) DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `tax_total` decimal(12,4) DEFAULT '0.0000',
  `base_tax_total` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `checkout_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `conversion_time` datetime DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_customer_id_foreign` (`customer_id`),
  KEY `cart_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'USD','USD','OMR','OMR',9.0000,9.0000,9.0000,9.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2020-09-23 01:51:55','2020-09-23 01:51:55',''),(2,NULL,NULL,NULL,NULL,NULL,0,1,2.0000,NULL,'OMR','OMR','OMR','OMR',18.0000,18.0000,18.0000,18.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2020-09-23 12:26:57','2020-09-23 12:27:13',''),(4,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,'OMR','OMR','OMR','OMR',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2020-09-24 00:59:13','2020-09-24 00:59:13',NULL),(5,NULL,NULL,NULL,NULL,NULL,0,1,2.0000,NULL,'OMR','OMR','OMR','OMR',12.0000,12.0000,12.0000,12.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2020-09-24 12:39:32','2020-09-24 12:39:47',''),(6,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'OMR','OMR','OMR','OMR',6.0000,6.0000,6.0000,6.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2020-09-24 13:48:21','2020-09-24 13:48:22',''),(7,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'OMR','OMR','OMR','OMR',6.0000,6.0000,6.0000,6.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2020-09-24 16:09:55','2020-09-24 16:09:55',''),(8,'mohammed.alrisi11@outlook.com','محمد','الريسي','free_free',NULL,0,1,1.0000,NULL,'OMR','OMR','OMR','OMR',5.0000,5.0000,5.0000,5.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2020-09-25 14:12:06','2020-09-25 14:22:31',''),(9,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'OMR','OMR','OMR','OMR',5.0000,5.0000,5.0000,5.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,1,NULL,NULL,1,'2020-09-26 14:34:32','2020-09-26 14:34:32','');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item_inventories`
--

DROP TABLE IF EXISTS `cart_item_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_item_inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(10) unsigned NOT NULL DEFAULT '0',
  `inventory_source_id` int(10) unsigned DEFAULT NULL,
  `cart_item_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item_inventories`
--

LOCK TABLES `cart_item_inventories` WRITE;
/*!40000 ALTER TABLE `cart_item_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `additional` json DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `cart_id` int(10) unsigned NOT NULL,
  `tax_category_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `custom_price` decimal(12,4) DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_product_id_foreign` (`product_id`),
  KEY `cart_items_cart_id_foreign` (`cart_id`),
  KEY `cart_items_tax_category_id_foreign` (`tax_category_id`),
  KEY `cart_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (6,1,'1','configurable',NULL,NULL,0.0000,0.0000,0.0000,6.0000,6.0000,6.0000,6.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,'{\"_token\": \"QEc665ANWrU0A3QmP1olS99gjsUaQnwfnXJsvzRs\", \"quantity\": \"1\", \"attributes\": {\"size\": {\"option_id\": 10, \"option_label\": \"40\", \"attribute_name\": \"Size\"}, \"color\": {\"option_id\": 15, \"option_label\": \"gold\", \"attribute_name\": \"Color\"}}, \"is_buy_now\": \"0\", \"product_id\": \"226\", \"super_attribute\": {\"23\": \"15\", \"24\": \"10\"}, \"selected_configurable_option\": \"237\"}',NULL,226,6,NULL,'2020-09-24 13:48:21','2020-09-24 13:48:21',NULL,''),(7,0,'1-variant-15-10','simple','',NULL,0.0000,0.0000,0.0000,1.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,'{\"parent_id\": 226, \"product_id\": 237}',6,237,6,NULL,'2020-09-24 13:48:21','2020-09-24 13:48:21',NULL,NULL),(8,1,'1','configurable',NULL,NULL,0.0000,0.0000,0.0000,6.0000,6.0000,6.0000,6.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,'{\"_token\": \"big2z3ZmSpGxcVq3LgvWliZWgBtDjsG1rigwrUZG\", \"quantity\": \"1\", \"attributes\": {\"size\": {\"option_id\": 8, \"option_label\": \"38\", \"attribute_name\": \"Size\"}, \"color\": {\"option_id\": 4, \"option_label\": \"Black\", \"attribute_name\": \"Color\"}}, \"is_buy_now\": \"0\", \"product_id\": \"226\", \"super_attribute\": {\"23\": \"4\", \"24\": \"8\"}, \"selected_configurable_option\": \"230\"}',NULL,226,7,NULL,'2020-09-24 16:09:55','2020-09-24 16:09:55',NULL,''),(9,0,'1-variant-4-8','simple','',NULL,0.0000,0.0000,0.0000,1.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,'{\"parent_id\": 226, \"product_id\": 230}',8,230,7,NULL,'2020-09-24 16:09:55','2020-09-24 16:09:55',NULL,NULL),(10,1,'4','configurable',NULL,NULL,0.0000,0.0000,0.0000,5.0000,5.0000,5.0000,5.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,'{\"_token\": \"c2vKbcV8YdIEcl5XTIntmH0cjr5bzuH2mAcP9GIn\", \"quantity\": \"1\", \"attributes\": {\"size\": {\"option_id\": 8, \"option_label\": \"38\", \"attribute_name\": \"Size\"}, \"color\": {\"option_id\": 4, \"option_label\": \"Black\", \"attribute_name\": \"Color\"}}, \"is_buy_now\": \"0\", \"product_id\": \"274\", \"super_attribute\": {\"23\": \"4\", \"24\": \"8\"}, \"selected_configurable_option\": \"279\"}',NULL,274,8,NULL,'2020-09-25 14:12:06','2020-09-25 14:22:31',NULL,''),(11,0,'4-variant-4-8','simple','',NULL,0.0000,0.0000,0.0000,1.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,'{\"parent_id\": 274, \"product_id\": 279}',10,279,8,NULL,'2020-09-25 14:12:06','2020-09-25 14:12:06',NULL,NULL),(12,1,'3','configurable',NULL,NULL,0.0000,0.0000,0.0000,5.0000,5.0000,5.0000,5.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,'{\"_token\": \"27B7zFg4fH4N8ZMyqZrfVp5U6B0f5IQVGY0y3MFp\", \"quantity\": \"1\", \"attributes\": {\"size\": {\"option_id\": 6, \"option_label\": \"36\", \"attribute_name\": \"Size\"}, \"color\": {\"option_id\": 4, \"option_label\": \"Black\", \"attribute_name\": \"Color\"}}, \"is_buy_now\": \"0\", \"product_id\": \"255\", \"super_attribute\": {\"23\": \"4\", \"24\": \"6\"}, \"selected_configurable_option\": \"256\"}',NULL,255,9,NULL,'2020-09-26 14:34:32','2020-09-26 14:34:32',NULL,''),(13,0,'3-variant-4-6','simple','',NULL,0.0000,0.0000,0.0000,1.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,'{\"parent_id\": 255, \"product_id\": 256}',12,256,9,NULL,'2020-09-26 14:34:32','2020-09-26 14:34:32',NULL,NULL);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_payment`
--

DROP TABLE IF EXISTS `cart_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_payment_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_payment`
--

LOCK TABLES `cart_payment` WRITE;
/*!40000 ALTER TABLE `cart_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_channels`
--

DROP TABLE IF EXISTS `cart_rule_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rule_channels` (
  `cart_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`channel_id`),
  KEY `cart_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_channels`
--

LOCK TABLES `cart_rule_channels` WRITE;
/*!40000 ALTER TABLE `cart_rule_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_coupon_usage`
--

DROP TABLE IF EXISTS `cart_rule_coupon_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rule_coupon_usage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `times_used` int(11) NOT NULL DEFAULT '0',
  `cart_rule_coupon_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_coupon_usage`
--

LOCK TABLES `cart_rule_coupon_usage` WRITE;
/*!40000 ALTER TABLE `cart_rule_coupon_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_coupon_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_coupons`
--

DROP TABLE IF EXISTS `cart_rule_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rule_coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usage_limit` int(10) unsigned NOT NULL DEFAULT '0',
  `usage_per_customer` int(10) unsigned NOT NULL DEFAULT '0',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`),
  CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_coupons`
--

LOCK TABLES `cart_rule_coupons` WRITE;
/*!40000 ALTER TABLE `cart_rule_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_customer_groups`
--

DROP TABLE IF EXISTS `cart_rule_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rule_customer_groups` (
  `cart_rule_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_customer_groups`
--

LOCK TABLES `cart_rule_customer_groups` WRITE;
/*!40000 ALTER TABLE `cart_rule_customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_customers`
--

DROP TABLE IF EXISTS `cart_rule_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rule_customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `times_used` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cart_rule_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  KEY `cart_rule_customers_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_customers`
--

LOCK TABLES `cart_rule_customers` WRITE;
/*!40000 ALTER TABLE `cart_rule_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_translations`
--

DROP TABLE IF EXISTS `cart_rule_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rule_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `cart_rule_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`),
  CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_translations`
--

LOCK TABLES `cart_rule_translations` WRITE;
/*!40000 ALTER TABLE `cart_rule_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rules`
--

DROP TABLE IF EXISTS `cart_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `coupon_type` int(11) NOT NULL DEFAULT '1',
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT '0',
  `usage_per_customer` int(11) NOT NULL DEFAULT '0',
  `uses_per_coupon` int(11) NOT NULL DEFAULT '0',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_quantity` int(11) NOT NULL DEFAULT '1',
  `discount_step` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rules`
--

LOCK TABLES `cart_rules` WRITE;
/*!40000 ALTER TABLE `cart_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_shipping_rates`
--

DROP TABLE IF EXISTS `cart_shipping_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_shipping_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carrier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT '0',
  `base_price` double DEFAULT '0',
  `cart_address_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `cart_shipping_rates_cart_address_id_foreign` (`cart_address_id`),
  CONSTRAINT `cart_shipping_rates_cart_address_id_foreign` FOREIGN KEY (`cart_address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_shipping_rates`
--

LOCK TABLES `cart_shipping_rates` WRITE;
/*!40000 ALTER TABLE `cart_shipping_rates` DISABLE KEYS */;
INSERT INTO `cart_shipping_rates` VALUES (1,'flatrate','Flat Rate','flatrate_flatrate','Flat Rate','Flat Rate Shipping',10,10,2,'2020-09-25 14:21:53','2020-09-25 14:22:28',0.0000,0.0000),(2,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,2,'2020-09-25 14:21:53','2020-09-25 14:22:31',0.0000,0.0000);
/*!40000 ALTER TABLE `cart_shipping_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_channels`
--

DROP TABLE IF EXISTS `catalog_rule_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_rule_channels` (
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_channels`
--

LOCK TABLES `catalog_rule_channels` WRITE;
/*!40000 ALTER TABLE `catalog_rule_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_customer_groups`
--

DROP TABLE IF EXISTS `catalog_rule_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_rule_customer_groups` (
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_customer_groups`
--

LOCK TABLES `catalog_rule_customer_groups` WRITE;
/*!40000 ALTER TABLE `catalog_rule_customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_product_prices`
--

DROP TABLE IF EXISTS `catalog_rule_product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_rule_product_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_product_prices`
--

LOCK TABLES `catalog_rule_product_prices` WRITE;
/*!40000 ALTER TABLE `catalog_rule_product_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_products`
--

DROP TABLE IF EXISTS `catalog_rule_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_rule_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_products_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_products`
--

LOCK TABLES `catalog_rule_products` WRITE;
/*!40000 ALTER TABLE `catalog_rule_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rules`
--

DROP TABLE IF EXISTS `catalog_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rules`
--

LOCK TABLES `catalog_rules` WRITE;
/*!40000 ALTER TABLE `catalog_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `_lft` int(10) unsigned NOT NULL DEFAULT '0',
  `_rgt` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `display_mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'products_and_description',
  `category_icon_path` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,NULL,1,1,16,NULL,'2020-09-23 01:38:16','2020-09-23 01:38:16','products_and_description',NULL),(2,1,NULL,1,14,15,1,'2020-09-23 01:46:30','2020-09-23 01:46:30','products_only',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`bagisto`@`localhost`*/ /*!50003 TRIGGER trig_categories_insert
            AFTER INSERT ON categories
            FOR EACH ROW
            BEGIN
                            DECLARE urlPath VARCHAR(255);
            DECLARE localeCode VARCHAR(255);
            DECLARE done INT;
            DECLARE curs CURSOR FOR (SELECT category_translations.locale
                    FROM category_translations
                    WHERE category_id = NEW.id);
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;


            IF EXISTS (
                SELECT *
                FROM category_translations
                WHERE category_id = NEW.id
            )
            THEN

                OPEN curs;

            	SET done = 0;
                REPEAT
                	FETCH curs INTO localeCode;

                    SELECT get_url_path_of_category(NEW.id, localeCode) INTO urlPath;

                    IF NEW.parent_id IS NULL
                    THEN
                        SET urlPath = '';
                    END IF;

                    UPDATE category_translations
                    SET url_path = urlPath
                    WHERE
                        category_translations.category_id = NEW.id
                        AND category_translations.locale = localeCode;

                UNTIL done END REPEAT;

                CLOSE curs;

            END IF;
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`bagisto`@`localhost`*/ /*!50003 TRIGGER trig_categories_update
            AFTER UPDATE ON categories
            FOR EACH ROW
            BEGIN
                            DECLARE urlPath VARCHAR(255);
            DECLARE localeCode VARCHAR(255);
            DECLARE done INT;
            DECLARE curs CURSOR FOR (SELECT category_translations.locale
                    FROM category_translations
                    WHERE category_id = NEW.id);
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;


            IF EXISTS (
                SELECT *
                FROM category_translations
                WHERE category_id = NEW.id
            )
            THEN

                OPEN curs;

            	SET done = 0;
                REPEAT
                	FETCH curs INTO localeCode;

                    SELECT get_url_path_of_category(NEW.id, localeCode) INTO urlPath;

                    IF NEW.parent_id IS NULL
                    THEN
                        SET urlPath = '';
                    END IF;

                    UPDATE category_translations
                    SET url_path = urlPath
                    WHERE
                        category_translations.category_id = NEW.id
                        AND category_translations.locale = localeCode;

                UNTIL done END REPEAT;

                CLOSE curs;

            END IF;
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `category_filterable_attributes`
--

DROP TABLE IF EXISTS `category_filterable_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_filterable_attributes` (
  `category_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_filterable_attributes`
--

LOCK TABLES `category_filterable_attributes` WRITE;
/*!40000 ALTER TABLE `category_filterable_attributes` DISABLE KEYS */;
INSERT INTO `category_filterable_attributes` VALUES (2,11),(2,23),(2,24),(2,25);
/*!40000 ALTER TABLE `category_filterable_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_translations`
--

DROP TABLE IF EXISTS `category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `category_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale_id` int(10) unsigned DEFAULT NULL,
  `url_path` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'maintained by database triggers',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  KEY `category_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translations`
--

LOCK TABLES `category_translations` WRITE;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
INSERT INTO `category_translations` VALUES (1,'Root','root','Root','','','',1,'en',NULL,''),(2,'Perfume','perfume','','','','',2,'en',1,'perfume'),(3,'Perfume','perfume','','','','',2,'ar',4,'perfume');
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`bagisto`@`localhost`*/ /*!50003 TRIGGER trig_category_translations_insert
            BEFORE INSERT ON category_translations
            FOR EACH ROW
            BEGIN
                            DECLARE parentUrlPath varchar(255);
            DECLARE urlPath varchar(255);

            IF NOT EXISTS (
                SELECT id
                FROM categories
                WHERE
                    id = NEW.category_id
                    AND parent_id IS NULL
            )
            THEN

                SELECT
                    GROUP_CONCAT(parent_translations.slug SEPARATOR '/') INTO parentUrlPath
                FROM
                    categories AS node,
                    categories AS parent
                    JOIN category_translations AS parent_translations ON parent.id = parent_translations.category_id
                WHERE
                    node._lft >= parent._lft
                    AND node._rgt <= parent._rgt
                    AND node.id = (SELECT parent_id FROM categories WHERE id = NEW.category_id)
                    AND node.parent_id IS NOT NULL
                    AND parent.parent_id IS NOT NULL
                    AND parent_translations.locale = NEW.locale
                GROUP BY
                    node.id;

                IF parentUrlPath IS NULL
                THEN
                    SET urlPath = NEW.slug;
                ELSE
                    SET urlPath = concat(parentUrlPath, '/', NEW.slug);
                END IF;

                SET NEW.url_path = urlPath;

            END IF;
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`bagisto`@`localhost`*/ /*!50003 TRIGGER trig_category_translations_update
            BEFORE UPDATE ON category_translations
            FOR EACH ROW
            BEGIN
                            DECLARE parentUrlPath varchar(255);
            DECLARE urlPath varchar(255);

            IF NOT EXISTS (
                SELECT id
                FROM categories
                WHERE
                    id = NEW.category_id
                    AND parent_id IS NULL
            )
            THEN

                SELECT
                    GROUP_CONCAT(parent_translations.slug SEPARATOR '/') INTO parentUrlPath
                FROM
                    categories AS node,
                    categories AS parent
                    JOIN category_translations AS parent_translations ON parent.id = parent_translations.category_id
                WHERE
                    node._lft >= parent._lft
                    AND node._rgt <= parent._rgt
                    AND node.id = (SELECT parent_id FROM categories WHERE id = NEW.category_id)
                    AND node.parent_id IS NOT NULL
                    AND parent.parent_id IS NOT NULL
                    AND parent_translations.locale = NEW.locale
                GROUP BY
                    node.id;

                IF parentUrlPath IS NULL
                THEN
                    SET urlPath = NEW.slug;
                ELSE
                    SET urlPath = concat(parentUrlPath, '/', NEW.slug);
                END IF;

                SET NEW.url_path = urlPath;

            END IF;
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `channel_currencies`
--

DROP TABLE IF EXISTS `channel_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_currencies` (
  `channel_id` int(10) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`currency_id`),
  KEY `channel_currencies_currency_id_foreign` (`currency_id`),
  CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_currencies`
--

LOCK TABLES `channel_currencies` WRITE;
/*!40000 ALTER TABLE `channel_currencies` DISABLE KEYS */;
INSERT INTO `channel_currencies` VALUES (1,3);
/*!40000 ALTER TABLE `channel_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_inventory_sources`
--

DROP TABLE IF EXISTS `channel_inventory_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_inventory_sources` (
  `channel_id` int(10) unsigned NOT NULL,
  `inventory_source_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `channel_inventory_sources_channel_id_inventory_source_id_unique` (`channel_id`,`inventory_source_id`),
  KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_inventory_sources`
--

LOCK TABLES `channel_inventory_sources` WRITE;
/*!40000 ALTER TABLE `channel_inventory_sources` DISABLE KEYS */;
INSERT INTO `channel_inventory_sources` VALUES (1,1);
/*!40000 ALTER TABLE `channel_inventory_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_locales`
--

DROP TABLE IF EXISTS `channel_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_locales` (
  `channel_id` int(10) unsigned NOT NULL,
  `locale_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`locale_id`),
  KEY `channel_locales_locale_id_foreign` (`locale_id`),
  CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_locales`
--

LOCK TABLES `channel_locales` WRITE;
/*!40000 ALTER TABLE `channel_locales` DISABLE KEYS */;
INSERT INTO `channel_locales` VALUES (1,1),(1,4);
/*!40000 ALTER TABLE `channel_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_page_content` text COLLATE utf8mb4_unicode_ci,
  `footer_content` text COLLATE utf8mb4_unicode_ci,
  `default_locale_id` int(10) unsigned NOT NULL,
  `base_currency_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `root_category_id` int(10) unsigned DEFAULT NULL,
  `home_seo` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  KEY `channels_base_currency_id_foreign` (`base_currency_id`),
  KEY `channels_root_category_id_foreign` (`root_category_id`),
  CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES (1,'default','Default','',NULL,'velocity','',NULL,NULL,'<p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p>\r\n<div class=\"banner-container\">\r\n<div class=\"left-banner\"><img src=\"https://s3-ap-southeast-1.amazonaws.com/cdn.uvdesk.com/website/1/201902045c581f9494b8a1.png\" /></div>\r\n<div class=\"right-banner\"><img src=\"https://s3-ap-southeast-1.amazonaws.com/cdn.uvdesk.com/website/1/201902045c581fb045cf02.png\" /> <img src=\"https://s3-ap-southeast-1.amazonaws.com/cdn.uvdesk.com/website/1/201902045c581fc352d803.png\" /></div>\r\n</div>','<div class=\"list-container\"><span class=\"list-heading\">Quick Links</span>\r\n<ul class=\"list-group\">\r\n<li><a href=\"@php echo route(\'shop.cms.page\', \'about-us\') @endphp\">About Us</a></li>\r\n<li><a href=\"@php echo route(\'shop.cms.page\', \'return-policy\') @endphp\">Return Policy</a></li>\r\n<li><a href=\"@php echo route(\'shop.cms.page\', \'refund-policy\') @endphp\">Refund Policy</a></li>\r\n<li><a href=\"@php echo route(\'shop.cms.page\', \'terms-conditions\') @endphp\">Terms and conditions</a></li>\r\n<li><a href=\"@php echo route(\'shop.cms.page\', \'terms-of-use\') @endphp\">Terms of Use</a></li>\r\n<li><a href=\"@php echo route(\'shop.cms.page\', \'contact-us\') @endphp\">Contact Us</a></li>\r\n</ul>\r\n</div>\r\n<div class=\"list-container\"><span class=\"list-heading\">Connect With Us</span>\r\n<ul class=\"list-group\">\r\n<li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\r\n<li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\r\n<li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\r\n<li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\r\n<li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\r\n</ul>\r\n</div>',4,3,NULL,'2020-09-23 01:54:40',1,'{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}');
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_channels`
--

DROP TABLE IF EXISTS `cms_page_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_channels` (
  `cms_page_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  KEY `cms_page_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_channels`
--

LOCK TABLES `cms_page_channels` WRITE;
/*!40000 ALTER TABLE `cms_page_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_page_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_translations`
--

DROP TABLE IF EXISTS `cms_page_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_content` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_page_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`),
  CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_translations`
--

LOCK TABLES `cms_page_translations` WRITE;
/*!40000 ALTER TABLE `cms_page_translations` DISABLE KEYS */;
INSERT INTO `cms_page_translations` VALUES (1,'About Us','about-us','<div class=\"static-container\"><div class=\"mb-5\">About us page content</div></div>','about us','','aboutus','en',1),(2,'Return Policy','return-policy','<div class=\"static-container\"><div class=\"mb-5\">Return policy page content</div></div>','return policy','','return, policy','en',2),(3,'Refund Policy','refund-policy','<div class=\"static-container\"><div class=\"mb-5\">Refund policy page content</div></div>','Refund policy','','refund, policy','en',3),(4,'Terms & Conditions','terms-conditions','<div class=\"static-container\"><div class=\"mb-5\">Terms & conditions page content</div></div>','Terms & Conditions','','term, conditions','en',4),(5,'Terms of use','terms-of-use','<div class=\"static-container\"><div class=\"mb-5\">Terms of use page content</div></div>','Terms of use','','term, use','en',5),(6,'Contact Us','contact-us','<div class=\"static-container\"><div class=\"mb-5\">Contact us page content</div></div>','Contact Us','','contact, us','en',6);
/*!40000 ALTER TABLE `cms_page_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pages`
--

DROP TABLE IF EXISTS `cms_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `layout` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pages`
--

LOCK TABLES `cms_pages` WRITE;
/*!40000 ALTER TABLE `cms_pages` DISABLE KEYS */;
INSERT INTO `cms_pages` VALUES (1,NULL,'2020-09-23 01:38:17','2020-09-23 01:38:17'),(2,NULL,'2020-09-23 01:38:17','2020-09-23 01:38:17'),(3,NULL,'2020-09-23 01:38:17','2020-09-23 01:38:17'),(4,NULL,'2020-09-23 01:38:17','2020-09-23 01:38:17'),(5,NULL,'2020-09-23 01:38:17','2020-09-23 01:38:17'),(6,NULL,'2020-09-23 01:38:17','2020-09-23 01:38:17');
/*!40000 ALTER TABLE `cms_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_config`
--

DROP TABLE IF EXISTS `core_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_config_channel_id_foreign` (`channel_code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_config`
--

LOCK TABLES `core_config` WRITE;
/*!40000 ALTER TABLE `core_config` DISABLE KEYS */;
INSERT INTO `core_config` VALUES (1,'catalog.products.guest-checkout.allow-guest-checkout','1',NULL,NULL,'2020-09-23 01:38:17','2020-09-23 01:38:17'),(2,'emails.general.notifications.emails.general.notifications.verification','1',NULL,NULL,'2020-09-23 01:38:17','2020-09-23 01:38:17'),(3,'emails.general.notifications.emails.general.notifications.registration','1',NULL,NULL,'2020-09-23 01:38:17','2020-09-23 01:38:17'),(4,'emails.general.notifications.emails.general.notifications.customer','1',NULL,NULL,'2020-09-23 01:38:17','2020-09-23 01:38:17'),(5,'emails.general.notifications.emails.general.notifications.new-order','1',NULL,NULL,'2020-09-23 01:38:17','2020-09-23 01:38:17'),(6,'emails.general.notifications.emails.general.notifications.new-admin','1',NULL,NULL,'2020-09-23 01:38:17','2020-09-23 01:38:17'),(7,'emails.general.notifications.emails.general.notifications.new-invoice','1',NULL,NULL,'2020-09-23 01:38:17','2020-09-23 01:38:17'),(8,'emails.general.notifications.emails.general.notifications.new-refund','1',NULL,NULL,'2020-09-23 01:38:17','2020-09-23 01:38:17'),(9,'emails.general.notifications.emails.general.notifications.new-shipment','1',NULL,NULL,'2020-09-23 01:38:17','2020-09-23 01:38:17'),(10,'emails.general.notifications.emails.general.notifications.new-inventory-source','1',NULL,NULL,'2020-09-23 01:38:17','2020-09-23 01:38:17'),(11,'emails.general.notifications.emails.general.notifications.cancel-order','1',NULL,NULL,'2020-09-23 01:38:17','2020-09-23 01:38:17');
/*!40000 ALTER TABLE `core_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AF','Afghanistan'),(2,'AX','Åland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua & Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AC','Ascension Island'),(15,'AU','Australia'),(16,'AT','Austria'),(17,'AZ','Azerbaijan'),(18,'BS','Bahamas'),(19,'BH','Bahrain'),(20,'BD','Bangladesh'),(21,'BB','Barbados'),(22,'BY','Belarus'),(23,'BE','Belgium'),(24,'BZ','Belize'),(25,'BJ','Benin'),(26,'BM','Bermuda'),(27,'BT','Bhutan'),(28,'BO','Bolivia'),(29,'BA','Bosnia & Herzegovina'),(30,'BW','Botswana'),(31,'BR','Brazil'),(32,'IO','British Indian Ocean Territory'),(33,'VG','British Virgin Islands'),(34,'BN','Brunei'),(35,'BG','Bulgaria'),(36,'BF','Burkina Faso'),(37,'BI','Burundi'),(38,'KH','Cambodia'),(39,'CM','Cameroon'),(40,'CA','Canada'),(41,'IC','Canary Islands'),(42,'CV','Cape Verde'),(43,'BQ','Caribbean Netherlands'),(44,'KY','Cayman Islands'),(45,'CF','Central African Republic'),(46,'EA','Ceuta & Melilla'),(47,'TD','Chad'),(48,'CL','Chile'),(49,'CN','China'),(50,'CX','Christmas Island'),(51,'CC','Cocos (Keeling) Islands'),(52,'CO','Colombia'),(53,'KM','Comoros'),(54,'CG','Congo - Brazzaville'),(55,'CD','Congo - Kinshasa'),(56,'CK','Cook Islands'),(57,'CR','Costa Rica'),(58,'CI','Côte d’Ivoire'),(59,'HR','Croatia'),(60,'CU','Cuba'),(61,'CW','Curaçao'),(62,'CY','Cyprus'),(63,'CZ','Czechia'),(64,'DK','Denmark'),(65,'DG','Diego Garcia'),(66,'DJ','Djibouti'),(67,'DM','Dominica'),(68,'DO','Dominican Republic'),(69,'EC','Ecuador'),(70,'EG','Egypt'),(71,'SV','El Salvador'),(72,'GQ','Equatorial Guinea'),(73,'ER','Eritrea'),(74,'EE','Estonia'),(75,'ET','Ethiopia'),(76,'EZ','Eurozone'),(77,'FK','Falkland Islands'),(78,'FO','Faroe Islands'),(79,'FJ','Fiji'),(80,'FI','Finland'),(81,'FR','France'),(82,'GF','French Guiana'),(83,'PF','French Polynesia'),(84,'TF','French Southern Territories'),(85,'GA','Gabon'),(86,'GM','Gambia'),(87,'GE','Georgia'),(88,'DE','Germany'),(89,'GH','Ghana'),(90,'GI','Gibraltar'),(91,'GR','Greece'),(92,'GL','Greenland'),(93,'GD','Grenada'),(94,'GP','Guadeloupe'),(95,'GU','Guam'),(96,'GT','Guatemala'),(97,'GG','Guernsey'),(98,'GN','Guinea'),(99,'GW','Guinea-Bissau'),(100,'GY','Guyana'),(101,'HT','Haiti'),(102,'HN','Honduras'),(103,'HK','Hong Kong SAR China'),(104,'HU','Hungary'),(105,'IS','Iceland'),(106,'IN','India'),(107,'ID','Indonesia'),(108,'IR','Iran'),(109,'IQ','Iraq'),(110,'IE','Ireland'),(111,'IM','Isle of Man'),(112,'IL','Israel'),(113,'IT','Italy'),(114,'JM','Jamaica'),(115,'JP','Japan'),(116,'JE','Jersey'),(117,'JO','Jordan'),(118,'KZ','Kazakhstan'),(119,'KE','Kenya'),(120,'KI','Kiribati'),(121,'XK','Kosovo'),(122,'KW','Kuwait'),(123,'KG','Kyrgyzstan'),(124,'LA','Laos'),(125,'LV','Latvia'),(126,'LB','Lebanon'),(127,'LS','Lesotho'),(128,'LR','Liberia'),(129,'LY','Libya'),(130,'LI','Liechtenstein'),(131,'LT','Lithuania'),(132,'LU','Luxembourg'),(133,'MO','Macau SAR China'),(134,'MK','Macedonia'),(135,'MG','Madagascar'),(136,'MW','Malawi'),(137,'MY','Malaysia'),(138,'MV','Maldives'),(139,'ML','Mali'),(140,'MT','Malta'),(141,'MH','Marshall Islands'),(142,'MQ','Martinique'),(143,'MR','Mauritania'),(144,'MU','Mauritius'),(145,'YT','Mayotte'),(146,'MX','Mexico'),(147,'FM','Micronesia'),(148,'MD','Moldova'),(149,'MC','Monaco'),(150,'MN','Mongolia'),(151,'ME','Montenegro'),(152,'MS','Montserrat'),(153,'MA','Morocco'),(154,'MZ','Mozambique'),(155,'MM','Myanmar (Burma)'),(156,'NA','Namibia'),(157,'NR','Nauru'),(158,'NP','Nepal'),(159,'NL','Netherlands'),(160,'NC','New Caledonia'),(161,'NZ','New Zealand'),(162,'NI','Nicaragua'),(163,'NE','Niger'),(164,'NG','Nigeria'),(165,'NU','Niue'),(166,'NF','Norfolk Island'),(167,'KP','North Korea'),(168,'MP','Northern Mariana Islands'),(169,'NO','Norway'),(170,'OM','Oman'),(171,'PK','Pakistan'),(172,'PW','Palau'),(173,'PS','Palestinian Territories'),(174,'PA','Panama'),(175,'PG','Papua New Guinea'),(176,'PY','Paraguay'),(177,'PE','Peru'),(178,'PH','Philippines'),(179,'PN','Pitcairn Islands'),(180,'PL','Poland'),(181,'PT','Portugal'),(182,'PR','Puerto Rico'),(183,'QA','Qatar'),(184,'RE','Réunion'),(185,'RO','Romania'),(186,'RU','Russia'),(187,'RW','Rwanda'),(188,'WS','Samoa'),(189,'SM','San Marino'),(190,'ST','São Tomé & Príncipe'),(191,'SA','Saudi Arabia'),(192,'SN','Senegal'),(193,'RS','Serbia'),(194,'SC','Seychelles'),(195,'SL','Sierra Leone'),(196,'SG','Singapore'),(197,'SX','Sint Maarten'),(198,'SK','Slovakia'),(199,'SI','Slovenia'),(200,'SB','Solomon Islands'),(201,'SO','Somalia'),(202,'ZA','South Africa'),(203,'GS','South Georgia & South Sandwich Islands'),(204,'KR','South Korea'),(205,'SS','South Sudan'),(206,'ES','Spain'),(207,'LK','Sri Lanka'),(208,'BL','St. Barthélemy'),(209,'SH','St. Helena'),(210,'KN','St. Kitts & Nevis'),(211,'LC','St. Lucia'),(212,'MF','St. Martin'),(213,'PM','St. Pierre & Miquelon'),(214,'VC','St. Vincent & Grenadines'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard & Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TL','Timor-Leste'),(227,'TG','Togo'),(228,'TK','Tokelau'),(229,'TO','Tonga'),(230,'TT','Trinidad & Tobago'),(231,'TA','Tristan da Cunha'),(232,'TN','Tunisia'),(233,'TR','Turkey'),(234,'TM','Turkmenistan'),(235,'TC','Turks & Caicos Islands'),(236,'TV','Tuvalu'),(237,'UM','U.S. Outlying Islands'),(238,'VI','U.S. Virgin Islands'),(239,'UG','Uganda'),(240,'UA','Ukraine'),(241,'AE','United Arab Emirates'),(242,'GB','United Kingdom'),(243,'UN','United Nations'),(244,'US','United States'),(245,'UY','Uruguay'),(246,'UZ','Uzbekistan'),(247,'VU','Vanuatu'),(248,'VA','Vatican City'),(249,'VE','Venezuela'),(250,'VN','Vietnam'),(251,'WF','Wallis & Futuna'),(252,'EH','Western Sahara'),(253,'YE','Yemen'),(254,'ZM','Zambia'),(255,'ZW','Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_state_translations`
--

DROP TABLE IF EXISTS `country_state_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_state_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_name` text COLLATE utf8mb4_unicode_ci,
  `country_state_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_state_translations_country_state_id_foreign` (`country_state_id`),
  CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1705 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_state_translations`
--

LOCK TABLES `country_state_translations` WRITE;
/*!40000 ALTER TABLE `country_state_translations` DISABLE KEYS */;
INSERT INTO `country_state_translations` VALUES (1,'ar','ألاباما',1),(2,'ar','ألاسكا',2),(3,'ar','ساموا الأمريكية',3),(4,'ar','أريزونا',4),(5,'ar','أركنساس',5),(6,'ar','القوات المسلحة أفريقيا',6),(7,'ar','القوات المسلحة الأمريكية',7),(8,'ar','القوات المسلحة الكندية',8),(9,'ar','القوات المسلحة أوروبا',9),(10,'ar','القوات المسلحة الشرق الأوسط',10),(11,'ar','القوات المسلحة في المحيط الهادئ',11),(12,'ar','كاليفورنيا',12),(13,'ar','كولورادو',13),(14,'ar','كونيتيكت',14),(15,'ar','ديلاوير',15),(16,'ar','مقاطعة كولومبيا',16),(17,'ar','ولايات ميكرونيزيا الموحدة',17),(18,'ar','فلوريدا',18),(19,'ar','جورجيا',19),(20,'ar','غوام',20),(21,'ar','هاواي',21),(22,'ar','ايداهو',22),(23,'ar','إلينوي',23),(24,'ar','إنديانا',24),(25,'ar','أيوا',25),(26,'ar','كانساس',26),(27,'ar','كنتاكي',27),(28,'ar','لويزيانا',28),(29,'ar','مين',29),(30,'ar','جزر مارشال',30),(31,'ar','ماريلاند',31),(32,'ar','ماساتشوستس',32),(33,'ar','ميشيغان',33),(34,'ar','مينيسوتا',34),(35,'ar','ميسيسيبي',35),(36,'ar','ميسوري',36),(37,'ar','مونتانا',37),(38,'ar','نبراسكا',38),(39,'ar','نيفادا',39),(40,'ar','نيو هامبشاير',40),(41,'ar','نيو جيرسي',41),(42,'ar','المكسيك جديدة',42),(43,'ar','نيويورك',43),(44,'ar','شمال كارولينا',44),(45,'ar','شمال داكوتا',45),(46,'ar','جزر مريانا الشمالية',46),(47,'ar','أوهايو',47),(48,'ar','أوكلاهوما',48),(49,'ar','ولاية أوريغون',49),(50,'ar','بالاو',50),(51,'ar','بنسلفانيا',51),(52,'ar','بورتوريكو',52),(53,'ar','جزيرة رود',53),(54,'ar','كارولينا الجنوبية',54),(55,'ar','جنوب داكوتا',55),(56,'ar','تينيسي',56),(57,'ar','تكساس',57),(58,'ar','يوتا',58),(59,'ar','فيرمونت',59),(60,'ar','جزر فيرجن',60),(61,'ar','فرجينيا',61),(62,'ar','واشنطن',62),(63,'ar','فرجينيا الغربية',63),(64,'ar','ولاية ويسكونسن',64),(65,'ar','وايومنغ',65),(66,'ar','ألبرتا',66),(67,'ar','كولومبيا البريطانية',67),(68,'ar','مانيتوبا',68),(69,'ar','نيوفاوندلاند ولابرادور',69),(70,'ar','برونزيك جديد',70),(71,'ar','مقاطعة نفوفا سكوشيا',71),(72,'ar','الاقاليم الشمالية الغربية',72),(73,'ar','نونافوت',73),(74,'ar','أونتاريو',74),(75,'ar','جزيرة الأمير ادوارد',75),(76,'ar','كيبيك',76),(77,'ar','ساسكاتشوان',77),(78,'ar','إقليم يوكون',78),(79,'ar','Niedersachsen',79),(80,'ar','بادن فورتمبيرغ',80),(81,'ar','بايرن ميونيخ',81),(82,'ar','برلين',82),(83,'ar','براندنبورغ',83),(84,'ar','بريمن',84),(85,'ar','هامبورغ',85),(86,'ar','هيسن',86),(87,'ar','مكلنبورغ-فوربومرن',87),(88,'ar','نوردراين فيستفالن',88),(89,'ar','راينلاند-بفالز',89),(90,'ar','سارلاند',90),(91,'ar','ساكسن',91),(92,'ar','سكسونيا أنهالت',92),(93,'ar','شليسفيغ هولشتاين',93),(94,'ar','تورنغن',94),(95,'ar','فيينا',95),(96,'ar','النمسا السفلى',96),(97,'ar','النمسا العليا',97),(98,'ar','سالزبورغ',98),(99,'ar','Каринтия',99),(100,'ar','STEIERMARK',100),(101,'ar','تيرول',101),(102,'ar','بورغنلاند',102),(103,'ar','فورارلبرغ',103),(104,'ar','أرجاو',104),(105,'ar','Appenzell Innerrhoden',105),(106,'ar','أبنزل أوسيرهودن',106),(107,'ar','برن',107),(108,'ar','كانتون ريف بازل',108),(109,'ar','بازل شتات',109),(110,'ar','فرايبورغ',110),(111,'ar','Genf',111),(112,'ar','جلاروس',112),(113,'ar','غراوبوندن',113),(114,'ar','العصر الجوارسي أو الجوري',114),(115,'ar','لوزيرن',115),(116,'ar','في Neuenburg',116),(117,'ar','نيدوالدن',117),(118,'ar','أوبوالدن',118),(119,'ar','سانت غالن',119),(120,'ar','شافهاوزن',120),(121,'ar','سولوتورن',121),(122,'ar','شفيتس',122),(123,'ar','ثورجو',123),(124,'ar','تيتشينو',124),(125,'ar','أوري',125),(126,'ar','وادت',126),(127,'ar','اليس',127),(128,'ar','زوغ',128),(129,'ar','زيورخ',129),(130,'ar','Corunha',130),(131,'ar','ألافا',131),(132,'ar','الباسيتي',132),(133,'ar','اليكانتي',133),(134,'ar','الميريا',134),(135,'ar','أستورياس',135),(136,'ar','أفيلا',136),(137,'ar','بطليوس',137),(138,'ar','البليار',138),(139,'ar','برشلونة',139),(140,'ar','برغش',140),(141,'ar','كاسيريس',141),(142,'ar','كاديز',142),(143,'ar','كانتابريا',143),(144,'ar','كاستيلون',144),(145,'ar','سبتة',145),(146,'ar','سيوداد ريال',146),(147,'ar','قرطبة',147),(148,'ar','كوينكا',148),(149,'ar','جيرونا',149),(150,'ar','غرناطة',150),(151,'ar','غوادالاخارا',151),(152,'ar','بجويبوزكوا',152),(153,'ar','هويلفا',153),(154,'ar','هويسكا',154),(155,'ar','خاين',155),(156,'ar','لاريوخا',156),(157,'ar','لاس بالماس',157),(158,'ar','ليون',158),(159,'ar','يدا',159),(160,'ar','لوغو',160),(161,'ar','مدريد',161),(162,'ar','ملقة',162),(163,'ar','مليلية',163),(164,'ar','مورسيا',164),(165,'ar','نافارا',165),(166,'ar','أورينس',166),(167,'ar','بلنسية',167),(168,'ar','بونتيفيدرا',168),(169,'ar','سالامانكا',169),(170,'ar','سانتا كروز دي تينيريفي',170),(171,'ar','سيغوفيا',171),(172,'ar','اشبيلية',172),(173,'ar','سوريا',173),(174,'ar','تاراغونا',174),(175,'ar','تيرويل',175),(176,'ar','توليدو',176),(177,'ar','فالنسيا',177),(178,'ar','بلد الوليد',178),(179,'ar','فيزكايا',179),(180,'ar','زامورا',180),(181,'ar','سرقسطة',181),(182,'ar','عين',182),(183,'ar','أيسن',183),(184,'ar','اليي',184),(185,'ar','ألب البروفنس العليا',185),(186,'ar','أوتس ألب',186),(187,'ar','ألب ماريتيم',187),(188,'ar','ARDECHE',188),(189,'ar','Ardennes',189),(190,'ar','آردن',190),(191,'ar','أوب',191),(192,'ar','اود',192),(193,'ar','أفيرون',193),(194,'ar','بوكاس دو رون',194),(195,'ar','كالفادوس',195),(196,'ar','كانتال',196),(197,'ar','شارانت',197),(198,'ar','سيين إت مارن',198),(199,'ar','شير',199),(200,'ar','كوريز',200),(201,'ar','سود كورس-دو-',201),(202,'ar','هوت كورس',202),(203,'ar','كوستا دوركوريز',203),(204,'ar','كوتس دورمور',204),(205,'ar','كروز',205),(206,'ar','دوردوني',206),(207,'ar','دوبس',207),(208,'ar','DrômeFinistère',208),(209,'ar','أور',209),(210,'ar','أور ولوار',210),(211,'ar','فينيستير',211),(212,'ar','جارد',212),(213,'ar','هوت غارون',213),(214,'ar','الخيام',214),(215,'ar','جيروند',215),(216,'ar','هيرولت',216),(217,'ar','إيل وفيلان',217),(218,'ar','إندر',218),(219,'ar','أندر ولوار',219),(220,'ar','إيسر',220),(221,'ar','العصر الجوارسي أو الجوري',221),(222,'ar','اندز',222),(223,'ar','لوار وشير',223),(224,'ar','لوار',224),(225,'ar','هوت-لوار',225),(226,'ar','وار أتلانتيك',226),(227,'ar','لورا',227),(228,'ar','كثيرا',228),(229,'ar','الكثير غارون',229),(230,'ar','لوزر',230),(231,'ar','مين-إي-لوار',231),(232,'ar','المانش',232),(233,'ar','مارن',233),(234,'ar','هوت مارن',234),(235,'ar','مايين',235),(236,'ar','مورت وموزيل',236),(237,'ar','ميوز',237),(238,'ar','موربيهان',238),(239,'ar','موسيل',239),(240,'ar','نيفر',240),(241,'ar','نورد',241),(242,'ar','إيل دو فرانس',242),(243,'ar','أورن',243),(244,'ar','با-دو-كاليه',244),(245,'ar','بوي دي دوم',245),(246,'ar','البرانيس ​​الأطلسية',246),(247,'ar','أوتس-بيرينيهs',247),(248,'ar','بيرينيه-أورينتال',248),(249,'ar','بس رين',249),(250,'ar','أوت رين',250),(251,'ar','رون [3]',251),(252,'ar','هوت-سون',252),(253,'ar','سون ولوار',253),(254,'ar','سارت',254),(255,'ar','سافوا',255),(256,'ar','هاوت سافوي',256),(257,'ar','باريس',257),(258,'ar','سين البحرية',258),(259,'ar','سيين إت مارن',259),(260,'ar','إيفلين',260),(261,'ar','دوكس سفرس',261),(262,'ar','السوم',262),(263,'ar','تارن',263),(264,'ar','تارن وغارون',264),(265,'ar','فار',265),(266,'ar','فوكلوز',266),(267,'ar','تارن',267),(268,'ar','فيين',268),(269,'ar','هوت فيين',269),(270,'ar','الفوج',270),(271,'ar','يون',271),(272,'ar','تيريتوير-دي-بلفور',272),(273,'ar','إيسون',273),(274,'ar','هوت دو سين',274),(275,'ar','سين سان دوني',275),(276,'ar','فال دو مارن',276),(277,'ar','فال دواز',277),(278,'ar','ألبا',278),(279,'ar','اراد',279),(280,'ar','ARGES',280),(281,'ar','باكاو',281),(282,'ar','بيهور',282),(283,'ar','بيستريتا ناسود',283),(284,'ar','بوتوساني',284),(285,'ar','براشوف',285),(286,'ar','برايلا',286),(287,'ar','بوخارست',287),(288,'ar','بوزاو',288),(289,'ar','كاراس سيفيرين',289),(290,'ar','كالاراسي',290),(291,'ar','كلوج',291),(292,'ar','كونستانتا',292),(293,'ar','كوفاسنا',293),(294,'ar','دامبوفيتا',294),(295,'ar','دولج',295),(296,'ar','جالاتي',296),(297,'ar','Giurgiu',297),(298,'ar','غيورغيو',298),(299,'ar','هارغيتا',299),(300,'ar','هونيدوارا',300),(301,'ar','ايالوميتا',301),(302,'ar','ياشي',302),(303,'ar','إيلفوف',303),(304,'ar','مارامريس',304),(305,'ar','MEHEDINTI',305),(306,'ar','موريس',306),(307,'ar','نيامتس',307),(308,'ar','أولت',308),(309,'ar','براهوفا',309),(310,'ar','ساتو ماري',310),(311,'ar','سالاج',311),(312,'ar','سيبيو',312),(313,'ar','سوسيفا',313),(314,'ar','تيليورمان',314),(315,'ar','تيم هو',315),(316,'ar','تولسيا',316),(317,'ar','فاسلوي',317),(318,'ar','فالسيا',318),(319,'ar','فرانتشا',319),(320,'ar','Lappi',320),(321,'ar','Pohjois-Pohjanmaa',321),(322,'ar','كاينو',322),(323,'ar','Pohjois-كارجالا',323),(324,'ar','Pohjois-سافو',324),(325,'ar','Etelä-سافو',325),(326,'ar','Etelä-Pohjanmaa',326),(327,'ar','Pohjanmaa',327),(328,'ar','بيركنما',328),(329,'ar','ساتا كونتا',329),(330,'ar','كسكي-Pohjanmaa',330),(331,'ar','كسكي-سومي',331),(332,'ar','Varsinais-سومي',332),(333,'ar','Etelä-كارجالا',333),(334,'ar','Päijät-Häme',334),(335,'ar','كانتا-HAME',335),(336,'ar','أوسيما',336),(337,'ar','أوسيما',337),(338,'ar','كومنلاكسو',338),(339,'ar','Ahvenanmaa',339),(340,'ar','Harjumaa',340),(341,'ar','هيوما',341),(342,'ar','المؤسسة الدولية للتنمية فيروما',342),(343,'ar','جوغفما',343),(344,'ar','يارفا',344),(345,'ar','انيما',345),(346,'ar','اني فيريوما',346),(347,'ar','بولفاما',347),(348,'ar','بارنوما',348),(349,'ar','Raplamaa',349),(350,'ar','Saaremaa',350),(351,'ar','Tartumaa',351),(352,'ar','Valgamaa',352),(353,'ar','Viljandimaa',353),(354,'ar','روايات Salacgr novvas',354),(355,'ar','داوجافبيلس',355),(356,'ar','يلغافا',356),(357,'ar','يكاب',357),(358,'ar','يورمال',358),(359,'ar','يابايا',359),(360,'ar','ليباج أبريس',360),(361,'ar','ريزكن',361),(362,'ar','ريغا',362),(363,'ar','مقاطعة ريغا',363),(364,'ar','فالميرا',364),(365,'ar','فنتسبيلز',365),(366,'ar','روايات Aglonas',366),(367,'ar','Aizkraukles novads',367),(368,'ar','Aizkraukles novads',368),(369,'ar','Aknīstes novads',369),(370,'ar','Alojas novads',370),(371,'ar','روايات Alsungas',371),(372,'ar','ألكسنس أبريز',372),(373,'ar','روايات أماتاس',373),(374,'ar','قرود الروايات',374),(375,'ar','روايات أوسيس',375),(376,'ar','بابيت الروايات',376),(377,'ar','Baldones الروايات',377),(378,'ar','بالتينافاس الروايات',378),(379,'ar','روايات بالفو',379),(380,'ar','Bauskas الروايات',380),(381,'ar','Beverīnas novads',381),(382,'ar','Novads Brocēnu',382),(383,'ar','Novads Burtnieku',383),(384,'ar','Carnikavas novads',384),(385,'ar','Cesvaines novads',385),(386,'ar','Ciblas novads',386),(387,'ar','تسو أبريس',387),(388,'ar','Dagdas novads',388),(389,'ar','Daugavpils novads',389),(390,'ar','روايات دوبيليس',390),(391,'ar','ديربيس الروايات',391),(392,'ar','ديربيس الروايات',392),(393,'ar','يشرك الروايات',393),(394,'ar','Garkalnes novads',394),(395,'ar','Grobiņas novads',395),(396,'ar','غولبينيس الروايات',396),(397,'ar','إيكافاس روايات',397),(398,'ar','Ikškiles novads',398),(399,'ar','Ilūkstes novads',399),(400,'ar','روايات Inčukalna',400),(401,'ar','Jaunjelgavas novads',401),(402,'ar','Jaunpiebalgas novads',402),(403,'ar','روايات Jaunpiebalgas',403),(404,'ar','Jelgavas novads',404),(405,'ar','جيكابيلس أبريز',405),(406,'ar','روايات كاندافاس',406),(407,'ar','Kokneses الروايات',407),(408,'ar','Krimuldas novads',408),(409,'ar','Krustpils الروايات',409),(410,'ar','Krāslavas Apriņķis',410),(411,'ar','كولدوغاس أبريز',411),(412,'ar','Kārsavas novads',412),(413,'ar','روايات ييلفاريس',413),(414,'ar','ليمباو أبريز',414),(415,'ar','روايات لباناس',415),(416,'ar','روايات لودزاس',416),(417,'ar','مقاطعة ليجاتني',417),(418,'ar','مقاطعة ليفاني',418),(419,'ar','مادونا روايات',419),(420,'ar','Mazsalacas novads',420),(421,'ar','روايات مالبلز',421),(422,'ar','Mārupes novads',422),(423,'ar','نوفاو نوكشنو',423),(424,'ar','روايات نيريتاس',424),(425,'ar','روايات نيكاس',425),(426,'ar','أغنام الروايات',426),(427,'ar','أولينيس الروايات',427),(428,'ar','روايات Ozolnieku',428),(429,'ar','بريسيو أبرييس',429),(430,'ar','Priekules الروايات',430),(431,'ar','كوندادو دي بريكوي',431),(432,'ar','Pärgaujas novads',432),(433,'ar','روايات بافيلوستاس',433),(434,'ar','بلافيناس مقاطعة',434),(435,'ar','روناس روايات',435),(436,'ar','Riebiņu novads',436),(437,'ar','روجاس روايات',437),(438,'ar','Novads روباو',438),(439,'ar','روكافاس روايات',439),(440,'ar','روغاجو روايات',440),(441,'ar','رندلس الروايات',441),(442,'ar','Radzeknes novads',442),(443,'ar','Rūjienas novads',443),(444,'ar','بلدية سالاسغريفا',444),(445,'ar','روايات سالاس',445),(446,'ar','Salaspils novads',446),(447,'ar','روايات سالدوس',447),(448,'ar','Novuls Saulkrastu',448),(449,'ar','سيغولداس روايات',449),(450,'ar','Skrundas novads',450),(451,'ar','مقاطعة Skrīveri',451),(452,'ar','يبتسم الروايات',452),(453,'ar','روايات Stopiņu',453),(454,'ar','روايات Stren novu',454),(455,'ar','سجاس روايات',455),(456,'ar','روايات تالسو',456),(457,'ar','توكوما الروايات',457),(458,'ar','Tērvetes novads',458),(459,'ar','Vaiņodes novads',459),(460,'ar','فالكاس الروايات',460),(461,'ar','فالميراس الروايات',461),(462,'ar','مقاطعة فاكلاني',462),(463,'ar','Vecpiebalgas novads',463),(464,'ar','روايات Vecumnieku',464),(465,'ar','فنتسبيلس الروايات',465),(466,'ar','Viesītes Novads',466),(467,'ar','Viļakas novads',467),(468,'ar','روايات فيناو',468),(469,'ar','Vārkavas novads',469),(470,'ar','روايات زيلوبس',470),(471,'ar','مقاطعة أدازي',471),(472,'ar','مقاطعة Erglu',472),(473,'ar','مقاطعة كيغمس',473),(474,'ar','مقاطعة كيكافا',474),(475,'ar','Alytaus Apskritis',475),(476,'ar','كاونو ابكريتيس',476),(477,'ar','Klaipėdos apskritis',477),(478,'ar','Marijampol\'s apskritis',478),(479,'ar','Panevėžio apskritis',479),(480,'ar','uliaulių apskritis',480),(481,'ar','Taurag\'s apskritis',481),(482,'ar','Telšių apskritis',482),(483,'ar','Utenos apskritis',483),(484,'ar','فيلنياوس ابكريتيس',484),(485,'ar','فدان',485),(486,'ar','ألاغواس',486),(487,'ar','أمابا',487),(488,'ar','أمازوناس',488),(489,'ar','باهيا',489),(490,'ar','سيارا',490),(491,'ar','إسبيريتو سانتو',491),(492,'ar','غوياس',492),(493,'ar','مارانهاو',493),(494,'ar','ماتو جروسو',494),(495,'ar','ماتو جروسو دو سول',495),(496,'ar','ميناس جريس',496),(497,'ar','بارا',497),(498,'ar','بارايبا',498),(499,'ar','بارانا',499),(500,'ar','بيرنامبوكو',500),(501,'ar','بياوي',501),(502,'ar','ريو دي جانيرو',502),(503,'ar','ريو غراندي دو نورتي',503),(504,'ar','ريو غراندي دو سول',504),(505,'ar','روندونيا',505),(506,'ar','رورايما',506),(507,'ar','سانتا كاتارينا',507),(508,'ar','ساو باولو',508),(509,'ar','سيرغيبي',509),(510,'ar','توكانتينز',510),(511,'ar','وفي مقاطعة الاتحادية',511),(512,'ar','Zagrebačka زوبانيا',512),(513,'ar','Krapinsko-zagorska زوبانيا',513),(514,'ar','Sisačko-moslavačka زوبانيا',514),(515,'ar','كارلوفيتش شوبانيا',515),(516,'ar','فارادينسكا زوبانيجا',516),(517,'ar','Koprivničko-križevačka زوبانيجا',517),(518,'ar','بيلوفارسكو-بيلوجورسكا',518),(519,'ar','بريمورسكو غورانسكا سوبانيا',519),(520,'ar','ليكو سينيسكا زوبانيا',520),(521,'ar','Virovitičko-podravska زوبانيا',521),(522,'ar','Požeško-slavonska županija',522),(523,'ar','Brodsko-posavska županija',523),(524,'ar','زادارسكا زوبانيجا',524),(525,'ar','Osječko-baranjska županija',525),(526,'ar','شيبنسكو-كنينسكا سوبانيا',526),(527,'ar','Virovitičko-podravska زوبانيا',527),(528,'ar','Splitsko-dalmatinska زوبانيا',528),(529,'ar','Istarska زوبانيا',529),(530,'ar','Dubrovačko-neretvanska زوبانيا',530),(531,'ar','Međimurska زوبانيا',531),(532,'ar','غراد زغرب',532),(533,'ar','جزر أندامان ونيكوبار',533),(534,'ar','ولاية اندرا براديش',534),(535,'ar','اروناتشال براديش',535),(536,'ar','أسام',536),(537,'ar','بيهار',537),(538,'ar','شانديغار',538),(539,'ar','تشهاتيسجاره',539),(540,'ar','دادرا ونجار هافيلي',540),(541,'ar','دامان وديو',541),(542,'ar','دلهي',542),(543,'ar','غوا',543),(544,'ar','غوجارات',544),(545,'ar','هاريانا',545),(546,'ar','هيماشال براديش',546),(547,'ar','جامو وكشمير',547),(548,'ar','جهارخاند',548),(549,'ar','كارناتاكا',549),(550,'ar','ولاية كيرالا',550),(551,'ar','اكشادويب',551),(552,'ar','ماديا براديش',552),(553,'ar','ماهاراشترا',553),(554,'ar','مانيبور',554),(555,'ar','ميغالايا',555),(556,'ar','ميزورام',556),(557,'ar','ناجالاند',557),(558,'ar','أوديشا',558),(559,'ar','بودوتشيري',559),(560,'ar','البنجاب',560),(561,'ar','راجستان',561),(562,'ar','سيكيم',562),(563,'ar','تاميل نادو',563),(564,'ar','تيلانجانا',564),(565,'ar','تريبورا',565),(566,'ar','ولاية اوتار براديش',566),(567,'ar','أوتارانتشال',567),(568,'ar','البنغال الغربية',568),(569,'fa','آلاباما',1),(570,'fa','آلاسکا',2),(571,'fa','ساموآ آمریکایی',3),(572,'fa','آریزونا',4),(573,'fa','آرکانزاس',5),(574,'fa','نیروهای مسلح آفریقا',6),(575,'fa','Armed Forces America',7),(576,'fa','نیروهای مسلح کانادا',8),(577,'fa','نیروهای مسلح اروپا',9),(578,'fa','نیروهای مسلح خاورمیانه',10),(579,'fa','نیروهای مسلح اقیانوس آرام',11),(580,'fa','کالیفرنیا',12),(581,'fa','کلرادو',13),(582,'fa','کانکتیکات',14),(583,'fa','دلاور',15),(584,'fa','منطقه کلمبیا',16),(585,'fa','ایالات فدرال میکرونزی',17),(586,'fa','فلوریدا',18),(587,'fa','جورجیا',19),(588,'fa','گوام',20),(589,'fa','هاوایی',21),(590,'fa','آیداهو',22),(591,'fa','ایلینویز',23),(592,'fa','ایندیانا',24),(593,'fa','آیووا',25),(594,'fa','کانزاس',26),(595,'fa','کنتاکی',27),(596,'fa','لوئیزیانا',28),(597,'fa','ماین',29),(598,'fa','مای',30),(599,'fa','مریلند',31),(600,'fa',' ',32),(601,'fa','میشیگان',33),(602,'fa','مینه سوتا',34),(603,'fa','می سی سی پی',35),(604,'fa','میسوری',36),(605,'fa','مونتانا',37),(606,'fa','نبراسکا',38),(607,'fa','نواد',39),(608,'fa','نیوهمپشایر',40),(609,'fa','نیوجرسی',41),(610,'fa','نیومکزیکو',42),(611,'fa','نیویورک',43),(612,'fa','کارولینای شمالی',44),(613,'fa','داکوتای شمالی',45),(614,'fa','جزایر ماریانای شمالی',46),(615,'fa','اوهایو',47),(616,'fa','اوکلاهما',48),(617,'fa','اورگان',49),(618,'fa','پالائو',50),(619,'fa','پنسیلوانیا',51),(620,'fa','پورتوریکو',52),(621,'fa','رود آیلند',53),(622,'fa','کارولینای جنوبی',54),(623,'fa','داکوتای جنوبی',55),(624,'fa','تنسی',56),(625,'fa','تگزاس',57),(626,'fa','یوتا',58),(627,'fa','ورمونت',59),(628,'fa','جزایر ویرجین',60),(629,'fa','ویرجینیا',61),(630,'fa','واشنگتن',62),(631,'fa','ویرجینیای غربی',63),(632,'fa','ویسکانسین',64),(633,'fa','وایومینگ',65),(634,'fa','آلبرتا',66),(635,'fa','بریتیش کلمبیا',67),(636,'fa','مانیتوبا',68),(637,'fa','نیوفاندلند و لابرادور',69),(638,'fa','نیوبرانزویک',70),(639,'fa','نوا اسکوشیا',71),(640,'fa','سرزمینهای شمال غربی',72),(641,'fa','نوناووت',73),(642,'fa','انتاریو',74),(643,'fa','جزیره پرنس ادوارد',75),(644,'fa','کبک',76),(645,'fa','ساسکاتچوان',77),(646,'fa','قلمرو یوکان',78),(647,'fa','نیدرزاکسن',79),(648,'fa','بادن-وورتمبرگ',80),(649,'fa','بایرن',81),(650,'fa','برلین',82),(651,'fa','براندنبورگ',83),(652,'fa','برمن',84),(653,'fa','هامبور',85),(654,'fa','هسن',86),(655,'fa','مکلنبورگ-وورپومرن',87),(656,'fa','نوردراین-وستفالن',88),(657,'fa','راینلاند-پلاتینات',89),(658,'fa','سارلند',90),(659,'fa','ساچسن',91),(660,'fa','ساچسن-آنهالت',92),(661,'fa','شلسویگ-هولشتاین',93),(662,'fa','تورینگی',94),(663,'fa','وین',95),(664,'fa','اتریش پایین',96),(665,'fa','اتریش فوقانی',97),(666,'fa','سالزبورگ',98),(667,'fa','کارنتا',99),(668,'fa','Steiermar',100),(669,'fa','تیرول',101),(670,'fa','بورگنلن',102),(671,'fa','Vorarlber',103),(672,'fa','آرگ',104),(673,'fa','',105),(674,'fa','اپنزلسرهودن',106),(675,'fa','بر',107),(676,'fa','بازل-لندشفت',108),(677,'fa','بازل استاد',109),(678,'fa','فرایبورگ',110),(679,'fa','گنف',111),(680,'fa','گلاروس',112),(681,'fa','Graubünde',113),(682,'fa','ژورا',114),(683,'fa','لوزرن',115),(684,'fa','نوینبور',116),(685,'fa','نیدالد',117),(686,'fa','اوبولدن',118),(687,'fa','سنت گالن',119),(688,'fa','شافهاوز',120),(689,'fa','سولوتور',121),(690,'fa','شووی',122),(691,'fa','تورگاو',123),(692,'fa','تسسی',124),(693,'fa','اوری',125),(694,'fa','وادت',126),(695,'fa','والی',127),(696,'fa','ز',128),(697,'fa','زوریخ',129),(698,'fa','کورونا',130),(699,'fa','آلاوا',131),(700,'fa','آلبوم',132),(701,'fa','آلیکانت',133),(702,'fa','آلمریا',134),(703,'fa','آستوریا',135),(704,'fa','آویلا',136),(705,'fa','باداژوز',137),(706,'fa','ضرب و شتم',138),(707,'fa','بارسلون',139),(708,'fa','بورگو',140),(709,'fa','کاسر',141),(710,'fa','کادی',142),(711,'fa','کانتابریا',143),(712,'fa','کاستلون',144),(713,'fa','سوت',145),(714,'fa','سیوداد واقعی',146),(715,'fa','کوردوب',147),(716,'fa','Cuenc',148),(717,'fa','جیرون',149),(718,'fa','گراناد',150),(719,'fa','گوادالاجار',151),(720,'fa','Guipuzcoa',152),(721,'fa','هولوا',153),(722,'fa','هوسک',154),(723,'fa','جی',155),(724,'fa','لا ریوجا',156),(725,'fa','لاس پالماس',157),(726,'fa','لئو',158),(727,'fa','Lleid',159),(728,'fa','لوگ',160),(729,'fa','مادری',161),(730,'fa','مالاگ',162),(731,'fa','ملیلی',163),(732,'fa','مورسیا',164),(733,'fa','ناوار',165),(734,'fa','اورنس',166),(735,'fa','پالنسی',167),(736,'fa','پونتوودر',168),(737,'fa','سالامانک',169),(738,'fa','سانتا کروز د تنریفه',170),(739,'fa','سوگویا',171),(740,'fa','سوی',172),(741,'fa','سوریا',173),(742,'fa','تاراگونا',174),(743,'fa','ترئو',175),(744,'fa','تولدو',176),(745,'fa','والنسیا',177),(746,'fa','والادولی',178),(747,'fa','ویزکایا',179),(748,'fa','زامور',180),(749,'fa','ساراگوز',181),(750,'fa','عی',182),(751,'fa','آیز',183),(752,'fa','آلی',184),(753,'fa','آلپ-دو-هاوت-پرووانس',185),(754,'fa','هاوتس آلپ',186),(755,'fa','Alpes-Maritime',187),(756,'fa','اردچه',188),(757,'fa','آرد',189),(758,'fa','محاصر',190),(759,'fa','آبه',191),(760,'fa','Aud',192),(761,'fa','آویرون',193),(762,'fa','BOCAS DO Rhône',194),(763,'fa','نوعی عرق',195),(764,'fa','کانتینال',196),(765,'fa','چارنت',197),(766,'fa','چارنت-دریایی',198),(767,'fa','چ',199),(768,'fa','کور',200),(769,'fa','کرس دو ساد',201),(770,'fa','هاوت کورس',202),(771,'fa','کوستا دورکرز',203),(772,'fa','تخت دارمور',204),(773,'fa','درهم',205),(774,'fa','دوردگن',206),(775,'fa','دوب',207),(776,'fa','تعریف اول',208),(777,'fa','یور',209),(778,'fa','Eure-et-Loi',210),(779,'fa','فمینیست',211),(780,'fa','باغ',212),(781,'fa','اوت-گارون',213),(782,'fa','گر',214),(783,'fa','جیروند',215),(784,'fa','هیر',216),(785,'fa','هشدار داده می شود',217),(786,'fa','ایندور',218),(787,'fa','Indre-et-Loir',219),(788,'fa','ایزر',220),(789,'fa','یور',221),(790,'fa','لندز',222),(791,'fa','Loir-et-Che',223),(792,'fa','وام گرفتن',224),(793,'fa','Haute-Loir',225),(794,'fa','Loire-Atlantiqu',226),(795,'fa','لیرت',227),(796,'fa','لوط',228),(797,'fa','لوت و گارون',229),(798,'fa','لوزر',230),(799,'fa','ماین et-Loire',231),(800,'fa','مانچ',232),(801,'fa','مارن',233),(802,'fa','هاوت-مارن',234),(803,'fa','مایین',235),(804,'fa','مورته-et-Moselle',236),(805,'fa','مسخره کردن',237),(806,'fa','موربیان',238),(807,'fa','موزل',239),(808,'fa','Nièvr',240),(809,'fa','نورد',241),(810,'fa','اوی',242),(811,'fa','ارن',243),(812,'fa','پاس-کاله',244),(813,'fa','Puy-de-Dôm',245),(814,'fa','Pyrénées-Atlantiques',246),(815,'fa','Hautes-Pyrénée',247),(816,'fa','Pyrénées-Orientales',248),(817,'fa','بس راین',249),(818,'fa','هاوت-رین',250),(819,'fa','رو',251),(820,'fa','Haute-Saône',252),(821,'fa','Saône-et-Loire',253),(822,'fa','سارته',254),(823,'fa','ساووی',255),(824,'fa','هاو-ساووی',256),(825,'fa','پاری',257),(826,'fa','Seine-Maritime',258),(827,'fa','Seine-et-Marn',259),(828,'fa','ایولینز',260),(829,'fa','Deux-Sèvres',261),(830,'fa','سمی',262),(831,'fa','ضعف',263),(832,'fa','Tarn-et-Garonne',264),(833,'fa','وار',265),(834,'fa','ووکلوز',266),(835,'fa','وندیه',267),(836,'fa','وین',268),(837,'fa','هاوت-وین',269),(838,'fa','رأی دادن',270),(839,'fa','یون',271),(840,'fa','سرزمین-دو-بلفورت',272),(841,'fa','اسون',273),(842,'fa','هاوتز دی سی',274),(843,'fa','Seine-Saint-Deni',275),(844,'fa','والد مارن',276),(845,'fa','Val-d\'Ois',277),(846,'fa','آلبا',278),(847,'fa','آرا',279),(848,'fa','Argeș',280),(849,'fa','باکو',281),(850,'fa','بیهور',282),(851,'fa','بیستریا-نسوود',283),(852,'fa','بوتانی',284),(853,'fa','برازوف',285),(854,'fa','Brăila',286),(855,'fa','București',287),(856,'fa','بوز',288),(857,'fa','کارا- Severin',289),(858,'fa','کالیراسی',290),(859,'fa','كلوژ',291),(860,'fa','کنستانس',292),(861,'fa','کواسنا',293),(862,'fa','Dâmbovița',294),(863,'fa','دال',295),(864,'fa','گالشی',296),(865,'fa','جورجیو',297),(866,'fa','گور',298),(867,'fa','هارگیتا',299),(868,'fa','هوندهار',300),(869,'fa','ایالومیشا',301),(870,'fa','Iași',302),(871,'fa','Ilfo',303),(872,'fa','Maramureș',304),(873,'fa','Mehedinți',305),(874,'fa','Mureș',306),(875,'fa','Neamț',307),(876,'fa','اولت',308),(877,'fa','پرهوا',309),(878,'fa','ستو ماره',310),(879,'fa','سلاج',311),(880,'fa','سیبیو',312),(881,'fa','سوساو',313),(882,'fa','تلورمان',314),(883,'fa','تیمیچ',315),(884,'fa','تولسا',316),(885,'fa','واسلوئی',317),(886,'fa','Vâlcea',318),(887,'fa','ورانسا',319),(888,'fa','لاپی',320),(889,'fa','Pohjois-Pohjanmaa',321),(890,'fa','کائینو',322),(891,'fa','Pohjois-Karjala',323),(892,'fa','Pohjois-Savo',324),(893,'fa','اتل-ساوو',325),(894,'fa','کسکی-پوهانما',326),(895,'fa','Pohjanmaa',327),(896,'fa','پیرکانما',328),(897,'fa','ساتاکونتا',329),(898,'fa','کسکی-پوهانما',330),(899,'fa','کسکی-سوومی',331),(900,'fa','Varsinais-Suomi',332),(901,'fa','اتلی کرجالا',333),(902,'fa','Päijät-HAM',334),(903,'fa','کانتا-هوم',335),(904,'fa','یوسیما',336),(905,'fa','اوسیم',337),(906,'fa','کیمنلاکو',338),(907,'fa','آونوانما',339),(908,'fa','هارژوم',340),(909,'fa','سلا',341),(910,'fa','آیدا-ویروما',342),(911,'fa','Jõgevamaa',343),(912,'fa','جوروماا',344),(913,'fa','لونما',345),(914,'fa','لون-ویروما',346),(915,'fa','پالوماا',347),(916,'fa','پورنوما',348),(917,'fa','Raplama',349),(918,'fa','ساارما',350),(919,'fa','تارتوما',351),(920,'fa','والگام',352),(921,'fa','ویلجاندیم',353),(922,'fa','Võrumaa',354),(923,'fa','داگاوپیل',355),(924,'fa','جلگاو',356),(925,'fa','جکابیل',357),(926,'fa','جرمل',358),(927,'fa','لیپجا',359),(928,'fa','شهرستان لیپاج',360),(929,'fa','روژن',361),(930,'fa','راگ',362),(931,'fa','شهرستان ریگ',363),(932,'fa','والمییرا',364),(933,'fa','Ventspils',365),(934,'fa','آگلوناس نوادا',366),(935,'fa','تازه کاران آیزکرایکلس',367),(936,'fa','تازه واردان',368),(937,'fa','شهرستا',369),(938,'fa','نوازندگان آلوجاس',370),(939,'fa','تازه های آلسونگاس',371),(940,'fa','شهرستان آلوکس',372),(941,'fa','تازه کاران آماتاس',373),(942,'fa','میمون های تازه',374),(943,'fa','نوادا را آویز می کند',375),(944,'fa','شهرستان بابی',376),(945,'fa','Baldones novad',377),(946,'fa','نوین های بالتیناوا',378),(947,'fa','Balvu novad',379),(948,'fa','نوازندگان باسکاس',380),(949,'fa','شهرستان بورین',381),(950,'fa','شهرستان بروچن',382),(951,'fa','بوردنیکو نوآوران',383),(952,'fa','تازه کارنیکاوا',384),(953,'fa','نوازان سزوینس',385),(954,'fa','نوادگان Cibla',386),(955,'fa','شهرستان Cesis',387),(956,'fa','تازه های داگدا',388),(957,'fa','داوگاوپیلز نوادا',389),(958,'fa','دابل نوادی',390),(959,'fa','تازه کارهای دنداگاس',391),(960,'fa','نوباد دوربس',392),(961,'fa','مشغول تازه کارها است',393),(962,'fa','گرکالنس نواد',394),(963,'fa','یا شهرستان گروبی',395),(964,'fa','تازه های گلبنس',396),(965,'fa','Iecavas novads',397),(966,'fa','شهرستان ایسکل',398),(967,'fa','ایالت ایلکست',399),(968,'fa','کنددو د اینچوکالن',400),(969,'fa','نوجواد Jaunjelgavas',401),(970,'fa','تازه های Jaunpiebalgas',402),(971,'fa','شهرستان جونپیلس',403),(972,'fa','شهرستان جگلو',404),(973,'fa','شهرستان جکابیل',405),(974,'fa','شهرستان کنداوا',406),(975,'fa','شهرستان کوکنز',407),(976,'fa','شهرستان کریمولد',408),(977,'fa','شهرستان کرستپیل',409),(978,'fa','شهرستان کراسلاو',410),(979,'fa','کاندادو د کلدیگا',411),(980,'fa','کاندادو د کارساوا',412),(981,'fa','شهرستان لیولوارد',413),(982,'fa','شهرستان لیمباشی',414),(983,'fa','ای ولسوالی لوبون',415),(984,'fa','شهرستان لودزا',416),(985,'fa','شهرستان لیگات',417),(986,'fa','شهرستان لیوانی',418),(987,'fa','شهرستان مادونا',419),(988,'fa','شهرستان مازسال',420),(989,'fa','شهرستان مالپیلس',421),(990,'fa','شهرستان Mārupe',422),(991,'fa','ا کنددو د نوکشنی',423),(992,'fa','کاملاً یک شهرستان',424),(993,'fa','شهرستان نیکا',425),(994,'fa','شهرستان اوگر',426),(995,'fa','شهرستان اولین',427),(996,'fa','شهرستان اوزولنیکی',428),(997,'fa','شهرستان پرلیلی',429),(998,'fa','شهرستان Priekule',430),(999,'fa','Condado de Priekuļi',431),(1000,'fa','شهرستان در حال حرکت',432),(1001,'fa','شهرستان پاویلوستا',433),(1002,'fa','شهرستان Plavinas',4),(1003,'fa','شهرستان راونا',435),(1004,'fa','شهرستان ریبیشی',436),(1005,'fa','شهرستان روجا',437),(1006,'fa','شهرستان روپازی',438),(1007,'fa','شهرستان روساوا',439),(1008,'fa','شهرستان روگی',440),(1009,'fa','شهرستان راندل',441),(1010,'fa','شهرستان ریزکن',442),(1011,'fa','شهرستان روژینا',443),(1012,'fa','شهرداری Salacgriva',444),(1013,'fa','منطقه جزیره',445),(1014,'fa','شهرستان Salaspils',446),(1015,'fa','شهرستان سالدوس',447),(1016,'fa','شهرستان ساولکرستی',448),(1017,'fa','شهرستان سیگولدا',449),(1018,'fa','شهرستان Skrunda',450),(1019,'fa','شهرستان Skrīveri',451),(1020,'fa','شهرستان Smiltene',452),(1021,'fa','شهرستان ایستینی',453),(1022,'fa','شهرستان استرنشی',454),(1023,'fa','منطقه کاشت',455),(1024,'fa','شهرستان تالسی',456),(1025,'fa','توکومس',457),(1026,'fa','شهرستان تورت',458),(1027,'fa','یا شهرستان وایودود',459),(1028,'fa','شهرستان والکا',460),(1029,'fa','شهرستان Valmiera',461),(1030,'fa','شهرستان وارکانی',462),(1031,'fa','شهرستان Vecpiebalga',463),(1032,'fa','شهرستان وکومنیکی',464),(1033,'fa','شهرستان ونتسپیل',465),(1034,'fa','کنددو د بازدید',466),(1035,'fa','شهرستان ویلاکا',467),(1036,'fa','شهرستان ویلانی',468),(1037,'fa','شهرستان واركاوا',469),(1038,'fa','شهرستان زیلوپ',470),(1039,'fa','شهرستان آدازی',471),(1040,'fa','شهرستان ارگلو',472),(1041,'fa','شهرستان کگومس',473),(1042,'fa','شهرستان ککاوا',474),(1043,'fa','شهرستان Alytus',475),(1044,'fa','شهرستان Kaunas',476),(1045,'fa','شهرستان کلایپدا',477),(1046,'fa','شهرستان ماریجامپولی',478),(1047,'fa','شهرستان پانویسیز',479),(1048,'fa','شهرستان سیاولیا',480),(1049,'fa','شهرستان تاجیج',481),(1050,'fa','شهرستان تلشیا',482),(1051,'fa','شهرستان اوتنا',483),(1052,'fa','شهرستان ویلنیوس',484),(1053,'fa','جریب',485),(1054,'fa','حالت',486),(1055,'fa','آمپá',487),(1056,'fa','آمازون',488),(1057,'fa','باهی',489),(1058,'fa','سارا',490),(1059,'fa','روح القدس',491),(1060,'fa','برو',492),(1061,'fa','مارانهائ',493),(1062,'fa','ماتو گروسو',494),(1063,'fa','Mato Grosso do Sul',495),(1064,'fa','ایالت میناس گرایس',496),(1065,'fa','پار',497),(1066,'fa','حالت',498),(1067,'fa','پارانا',499),(1068,'fa','حال',500),(1069,'fa','پیازو',501),(1070,'fa','ریو دوژانیرو',502),(1071,'fa','ریو گراند دو نورته',503),(1072,'fa','ریو گراند دو سول',504),(1073,'fa','Rondôni',505),(1074,'fa','Roraim',506),(1075,'fa','سانتا کاتارینا',507),(1076,'fa','پ',508),(1077,'fa','Sergip',509),(1078,'fa','توکانتین',510),(1079,'fa','منطقه فدرال',511),(1080,'fa','شهرستان زاگرب',512),(1081,'fa','Condado de Krapina-Zagorj',513),(1082,'fa','شهرستان سیساک-موسلاوینا',514),(1083,'fa','شهرستان کارلوواک',515),(1084,'fa','شهرداری واراžدین',516),(1085,'fa','Condo de Koprivnica-Križevci',517),(1086,'fa','محل سکونت د بیلوار-بلوگورا',518),(1087,'fa','Condado de Primorje-Gorski kotar',519),(1088,'fa','شهرستان لیکا-سنج',520),(1089,'fa','Condado de Virovitica-Podravina',521),(1090,'fa','شهرستان پوژگا-اسلاونیا',522),(1091,'fa','Condado de Brod-Posavina',523),(1092,'fa','شهرستان زجر',524),(1093,'fa','Condado de Osijek-Baranja',525),(1094,'fa','Condo de Sibenik-Knin',526),(1095,'fa','Condado de Vukovar-Srijem',527),(1096,'fa','شهرستان اسپلیت-Dalmatia',528),(1097,'fa','شهرستان ایستیا',529),(1098,'fa','Condado de Dubrovnik-Neretva',530),(1099,'fa','شهرستان Međimurje',531),(1100,'fa','شهر زاگرب',532),(1101,'fa','جزایر آندامان و نیکوبار',533),(1102,'fa','آندرا پرادش',534),(1103,'fa','آروناچال پرادش',535),(1104,'fa','آسام',536),(1105,'fa','Biha',537),(1106,'fa','چاندیگار',538),(1107,'fa','چاتیسگار',539),(1108,'fa','دادرا و نگار هاولی',540),(1109,'fa','دامان و دیو',541),(1110,'fa','دهلی',542),(1111,'fa','گوا',543),(1112,'fa','گجرات',544),(1113,'fa','هاریانا',545),(1114,'fa','هیماچال پرادش',546),(1115,'fa','جامو و کشمیر',547),(1116,'fa','جهخند',548),(1117,'fa','کارناتاکا',549),(1118,'fa','کرال',550),(1119,'fa','لاکشادوپ',551),(1120,'fa','مادیا پرادش',552),(1121,'fa','ماهاراشترا',553),(1122,'fa','مانی پور',554),(1123,'fa','مگالایا',555),(1124,'fa','مزورام',556),(1125,'fa','ناگلند',557),(1126,'fa','ادیشا',558),(1127,'fa','میناکاری',559),(1128,'fa','پنجا',560),(1129,'fa','راجستان',561),(1130,'fa','سیکیم',562),(1131,'fa','تامیل نادو',563),(1132,'fa','تلنگانا',564),(1133,'fa','تریپورا',565),(1134,'fa','اوتار پرادش',566),(1135,'fa','اوتاراکند',567),(1136,'fa','بنگال غرب',568),(1137,'pt_BR','Alabama',1),(1138,'pt_BR','Alaska',2),(1139,'pt_BR','Samoa Americana',3),(1140,'pt_BR','Arizona',4),(1141,'pt_BR','Arkansas',5),(1142,'pt_BR','Forças Armadas da África',6),(1143,'pt_BR','Forças Armadas das Américas',7),(1144,'pt_BR','Forças Armadas do Canadá',8),(1145,'pt_BR','Forças Armadas da Europa',9),(1146,'pt_BR','Forças Armadas do Oriente Médio',10),(1147,'pt_BR','Forças Armadas do Pacífico',11),(1148,'pt_BR','California',12),(1149,'pt_BR','Colorado',13),(1150,'pt_BR','Connecticut',14),(1151,'pt_BR','Delaware',15),(1152,'pt_BR','Distrito de Columbia',16),(1153,'pt_BR','Estados Federados da Micronésia',17),(1154,'pt_BR','Florida',18),(1155,'pt_BR','Geórgia',19),(1156,'pt_BR','Guam',20),(1157,'pt_BR','Havaí',21),(1158,'pt_BR','Idaho',22),(1159,'pt_BR','Illinois',23),(1160,'pt_BR','Indiana',24),(1161,'pt_BR','Iowa',25),(1162,'pt_BR','Kansas',26),(1163,'pt_BR','Kentucky',27),(1164,'pt_BR','Louisiana',28),(1165,'pt_BR','Maine',29),(1166,'pt_BR','Ilhas Marshall',30),(1167,'pt_BR','Maryland',31),(1168,'pt_BR','Massachusetts',32),(1169,'pt_BR','Michigan',33),(1170,'pt_BR','Minnesota',34),(1171,'pt_BR','Mississippi',35),(1172,'pt_BR','Missouri',36),(1173,'pt_BR','Montana',37),(1174,'pt_BR','Nebraska',38),(1175,'pt_BR','Nevada',39),(1176,'pt_BR','New Hampshire',40),(1177,'pt_BR','Nova Jersey',41),(1178,'pt_BR','Novo México',42),(1179,'pt_BR','Nova York',43),(1180,'pt_BR','Carolina do Norte',44),(1181,'pt_BR','Dakota do Norte',45),(1182,'pt_BR','Ilhas Marianas do Norte',46),(1183,'pt_BR','Ohio',47),(1184,'pt_BR','Oklahoma',48),(1185,'pt_BR','Oregon',4),(1186,'pt_BR','Palau',50),(1187,'pt_BR','Pensilvânia',51),(1188,'pt_BR','Porto Rico',52),(1189,'pt_BR','Rhode Island',53),(1190,'pt_BR','Carolina do Sul',54),(1191,'pt_BR','Dakota do Sul',55),(1192,'pt_BR','Tennessee',56),(1193,'pt_BR','Texas',57),(1194,'pt_BR','Utah',58),(1195,'pt_BR','Vermont',59),(1196,'pt_BR','Ilhas Virgens',60),(1197,'pt_BR','Virginia',61),(1198,'pt_BR','Washington',62),(1199,'pt_BR','West Virginia',63),(1200,'pt_BR','Wisconsin',64),(1201,'pt_BR','Wyoming',65),(1202,'pt_BR','Alberta',66),(1203,'pt_BR','Colúmbia Britânica',67),(1204,'pt_BR','Manitoba',68),(1205,'pt_BR','Terra Nova e Labrador',69),(1206,'pt_BR','New Brunswick',70),(1207,'pt_BR','Nova Escócia',7),(1208,'pt_BR','Territórios do Noroeste',72),(1209,'pt_BR','Nunavut',73),(1210,'pt_BR','Ontario',74),(1211,'pt_BR','Ilha do Príncipe Eduardo',75),(1212,'pt_BR','Quebec',76),(1213,'pt_BR','Saskatchewan',77),(1214,'pt_BR','Território yukon',78),(1215,'pt_BR','Niedersachsen',79),(1216,'pt_BR','Baden-Wurttemberg',80),(1217,'pt_BR','Bayern',81),(1218,'pt_BR','Berlim',82),(1219,'pt_BR','Brandenburg',83),(1220,'pt_BR','Bremen',84),(1221,'pt_BR','Hamburgo',85),(1222,'pt_BR','Hessen',86),(1223,'pt_BR','Mecklenburg-Vorpommern',87),(1224,'pt_BR','Nordrhein-Westfalen',88),(1225,'pt_BR','Renânia-Palatinado',8),(1226,'pt_BR','Sarre',90),(1227,'pt_BR','Sachsen',91),(1228,'pt_BR','Sachsen-Anhalt',92),(1229,'pt_BR','Schleswig-Holstein',93),(1230,'pt_BR','Turíngia',94),(1231,'pt_BR','Viena',95),(1232,'pt_BR','Baixa Áustria',96),(1233,'pt_BR','Oberösterreich',97),(1234,'pt_BR','Salzburg',98),(1235,'pt_BR','Caríntia',99),(1236,'pt_BR','Steiermark',100),(1237,'pt_BR','Tirol',101),(1238,'pt_BR','Burgenland',102),(1239,'pt_BR','Vorarlberg',103),(1240,'pt_BR','Aargau',104),(1241,'pt_BR','Appenzell Innerrhoden',105),(1242,'pt_BR','Appenzell Ausserrhoden',106),(1243,'pt_BR','Bern',107),(1244,'pt_BR','Basel-Landschaft',108),(1245,'pt_BR','Basel-Stadt',109),(1246,'pt_BR','Freiburg',110),(1247,'pt_BR','Genf',111),(1248,'pt_BR','Glarus',112),(1249,'pt_BR','Grisons',113),(1250,'pt_BR','Jura',114),(1251,'pt_BR','Luzern',115),(1252,'pt_BR','Neuenburg',116),(1253,'pt_BR','Nidwalden',117),(1254,'pt_BR','Obwalden',118),(1255,'pt_BR','St. Gallen',119),(1256,'pt_BR','Schaffhausen',120),(1257,'pt_BR','Solothurn',121),(1258,'pt_BR','Schwyz',122),(1259,'pt_BR','Thurgau',123),(1260,'pt_BR','Tessin',124),(1261,'pt_BR','Uri',125),(1262,'pt_BR','Waadt',126),(1263,'pt_BR','Wallis',127),(1264,'pt_BR','Zug',128),(1265,'pt_BR','Zurique',129),(1266,'pt_BR','Corunha',130),(1267,'pt_BR','Álava',131),(1268,'pt_BR','Albacete',132),(1269,'pt_BR','Alicante',133),(1270,'pt_BR','Almeria',134),(1271,'pt_BR','Astúrias',135),(1272,'pt_BR','Avila',136),(1273,'pt_BR','Badajoz',137),(1274,'pt_BR','Baleares',138),(1275,'pt_BR','Barcelona',139),(1276,'pt_BR','Burgos',140),(1277,'pt_BR','Caceres',141),(1278,'pt_BR','Cadiz',142),(1279,'pt_BR','Cantábria',143),(1280,'pt_BR','Castellon',144),(1281,'pt_BR','Ceuta',145),(1282,'pt_BR','Ciudad Real',146),(1283,'pt_BR','Cordoba',147),(1284,'pt_BR','Cuenca',148),(1285,'pt_BR','Girona',149),(1286,'pt_BR','Granada',150),(1287,'pt_BR','Guadalajara',151),(1288,'pt_BR','Guipuzcoa',152),(1289,'pt_BR','Huelva',153),(1290,'pt_BR','Huesca',154),(1291,'pt_BR','Jaen',155),(1292,'pt_BR','La Rioja',156),(1293,'pt_BR','Las Palmas',157),(1294,'pt_BR','Leon',158),(1295,'pt_BR','Lleida',159),(1296,'pt_BR','Lugo',160),(1297,'pt_BR','Madri',161),(1298,'pt_BR','Málaga',162),(1299,'pt_BR','Melilla',163),(1300,'pt_BR','Murcia',164),(1301,'pt_BR','Navarra',165),(1302,'pt_BR','Ourense',166),(1303,'pt_BR','Palencia',167),(1304,'pt_BR','Pontevedra',168),(1305,'pt_BR','Salamanca',169),(1306,'pt_BR','Santa Cruz de Tenerife',170),(1307,'pt_BR','Segovia',171),(1308,'pt_BR','Sevilla',172),(1309,'pt_BR','Soria',173),(1310,'pt_BR','Tarragona',174),(1311,'pt_BR','Teruel',175),(1312,'pt_BR','Toledo',176),(1313,'pt_BR','Valencia',177),(1314,'pt_BR','Valladolid',178),(1315,'pt_BR','Vizcaya',179),(1316,'pt_BR','Zamora',180),(1317,'pt_BR','Zaragoza',181),(1318,'pt_BR','Ain',182),(1319,'pt_BR','Aisne',183),(1320,'pt_BR','Allier',184),(1321,'pt_BR','Alpes da Alta Provença',185),(1322,'pt_BR','Altos Alpes',186),(1323,'pt_BR','Alpes-Maritimes',187),(1324,'pt_BR','Ardèche',188),(1325,'pt_BR','Ardennes',189),(1326,'pt_BR','Ariege',190),(1327,'pt_BR','Aube',191),(1328,'pt_BR','Aude',192),(1329,'pt_BR','Aveyron',193),(1330,'pt_BR','BOCAS DO Rhône',194),(1331,'pt_BR','Calvados',195),(1332,'pt_BR','Cantal',196),(1333,'pt_BR','Charente',197),(1334,'pt_BR','Charente-Maritime',198),(1335,'pt_BR','Cher',199),(1336,'pt_BR','Corrèze',200),(1337,'pt_BR','Corse-du-Sud',201),(1338,'pt_BR','Alta Córsega',202),(1339,'pt_BR','Costa d\'OrCorrèze',203),(1340,'pt_BR','Cotes d\'Armor',204),(1341,'pt_BR','Creuse',205),(1342,'pt_BR','Dordogne',206),(1343,'pt_BR','Doubs',207),(1344,'pt_BR','DrômeFinistère',208),(1345,'pt_BR','Eure',209),(1346,'pt_BR','Eure-et-Loir',210),(1347,'pt_BR','Finistère',211),(1348,'pt_BR','Gard',212),(1349,'pt_BR','Haute-Garonne',213),(1350,'pt_BR','Gers',214),(1351,'pt_BR','Gironde',215),(1352,'pt_BR','Hérault',216),(1353,'pt_BR','Ille-et-Vilaine',217),(1354,'pt_BR','Indre',218),(1355,'pt_BR','Indre-et-Loire',219),(1356,'pt_BR','Isère',220),(1357,'pt_BR','Jura',221),(1358,'pt_BR','Landes',222),(1359,'pt_BR','Loir-et-Cher',223),(1360,'pt_BR','Loire',224),(1361,'pt_BR','Haute-Loire',22),(1362,'pt_BR','Loire-Atlantique',226),(1363,'pt_BR','Loiret',227),(1364,'pt_BR','Lot',228),(1365,'pt_BR','Lot e Garona',229),(1366,'pt_BR','Lozère',230),(1367,'pt_BR','Maine-et-Loire',231),(1368,'pt_BR','Manche',232),(1369,'pt_BR','Marne',233),(1370,'pt_BR','Haute-Marne',234),(1371,'pt_BR','Mayenne',235),(1372,'pt_BR','Meurthe-et-Moselle',236),(1373,'pt_BR','Meuse',237),(1374,'pt_BR','Morbihan',238),(1375,'pt_BR','Moselle',239),(1376,'pt_BR','Nièvre',240),(1377,'pt_BR','Nord',241),(1378,'pt_BR','Oise',242),(1379,'pt_BR','Orne',243),(1380,'pt_BR','Pas-de-Calais',244),(1381,'pt_BR','Puy-de-Dôme',24),(1382,'pt_BR','Pirineus Atlânticos',246),(1383,'pt_BR','Hautes-Pyrénées',247),(1384,'pt_BR','Pirineus Orientais',248),(1385,'pt_BR','Bas-Rhin',249),(1386,'pt_BR','Alto Reno',250),(1387,'pt_BR','Rhône',251),(1388,'pt_BR','Haute-Saône',252),(1389,'pt_BR','Saône-et-Loire',253),(1390,'pt_BR','Sarthe',25),(1391,'pt_BR','Savoie',255),(1392,'pt_BR','Alta Sabóia',256),(1393,'pt_BR','Paris',257),(1394,'pt_BR','Seine-Maritime',258),(1395,'pt_BR','Seine-et-Marne',259),(1396,'pt_BR','Yvelines',260),(1397,'pt_BR','Deux-Sèvres',261),(1398,'pt_BR','Somme',262),(1399,'pt_BR','Tarn',263),(1400,'pt_BR','Tarn-et-Garonne',264),(1401,'pt_BR','Var',265),(1402,'pt_BR','Vaucluse',266),(1403,'pt_BR','Compradora',267),(1404,'pt_BR','Vienne',268),(1405,'pt_BR','Haute-Vienne',269),(1406,'pt_BR','Vosges',270),(1407,'pt_BR','Yonne',271),(1408,'pt_BR','Território de Belfort',272),(1409,'pt_BR','Essonne',273),(1410,'pt_BR','Altos do Sena',274),(1411,'pt_BR','Seine-Saint-Denis',275),(1412,'pt_BR','Val-de-Marne',276),(1413,'pt_BR','Val-d\'Oise',277),(1414,'pt_BR','Alba',278),(1415,'pt_BR','Arad',279),(1416,'pt_BR','Arges',280),(1417,'pt_BR','Bacau',281),(1418,'pt_BR','Bihor',282),(1419,'pt_BR','Bistrita-Nasaud',283),(1420,'pt_BR','Botosani',284),(1421,'pt_BR','Brașov',285),(1422,'pt_BR','Braila',286),(1423,'pt_BR','Bucareste',287),(1424,'pt_BR','Buzau',288),(1425,'pt_BR','Caras-Severin',289),(1426,'pt_BR','Călărași',290),(1427,'pt_BR','Cluj',291),(1428,'pt_BR','Constanta',292),(1429,'pt_BR','Covasna',29),(1430,'pt_BR','Dambovita',294),(1431,'pt_BR','Dolj',295),(1432,'pt_BR','Galati',296),(1433,'pt_BR','Giurgiu',297),(1434,'pt_BR','Gorj',298),(1435,'pt_BR','Harghita',299),(1436,'pt_BR','Hunedoara',300),(1437,'pt_BR','Ialomita',301),(1438,'pt_BR','Iasi',302),(1439,'pt_BR','Ilfov',303),(1440,'pt_BR','Maramures',304),(1441,'pt_BR','Maramures',305),(1442,'pt_BR','Mures',306),(1443,'pt_BR','alemão',307),(1444,'pt_BR','Olt',308),(1445,'pt_BR','Prahova',309),(1446,'pt_BR','Satu-Mare',310),(1447,'pt_BR','Salaj',311),(1448,'pt_BR','Sibiu',312),(1449,'pt_BR','Suceava',313),(1450,'pt_BR','Teleorman',314),(1451,'pt_BR','Timis',315),(1452,'pt_BR','Tulcea',316),(1453,'pt_BR','Vaslui',317),(1454,'pt_BR','dale',318),(1455,'pt_BR','Vrancea',319),(1456,'pt_BR','Lappi',320),(1457,'pt_BR','Pohjois-Pohjanmaa',321),(1458,'pt_BR','Kainuu',322),(1459,'pt_BR','Pohjois-Karjala',323),(1460,'pt_BR','Pohjois-Savo',324),(1461,'pt_BR','Sul Savo',325),(1462,'pt_BR','Ostrobothnia do sul',326),(1463,'pt_BR','Pohjanmaa',327),(1464,'pt_BR','Pirkanmaa',328),(1465,'pt_BR','Satakunta',329),(1466,'pt_BR','Keski-Pohjanmaa',330),(1467,'pt_BR','Keski-Suomi',331),(1468,'pt_BR','Varsinais-Suomi',332),(1469,'pt_BR','Carélia do Sul',333),(1470,'pt_BR','Päijät-Häme',334),(1471,'pt_BR','Kanta-Häme',335),(1472,'pt_BR','Uusimaa',336),(1473,'pt_BR','Uusimaa',337),(1474,'pt_BR','Kymenlaakso',338),(1475,'pt_BR','Ahvenanmaa',339),(1476,'pt_BR','Harjumaa',340),(1477,'pt_BR','Hiiumaa',341),(1478,'pt_BR','Ida-Virumaa',342),(1479,'pt_BR','Condado de Jõgeva',343),(1480,'pt_BR','Condado de Järva',344),(1481,'pt_BR','Läänemaa',345),(1482,'pt_BR','Condado de Lääne-Viru',346),(1483,'pt_BR','Condado de Põlva',347),(1484,'pt_BR','Condado de Pärnu',348),(1485,'pt_BR','Raplamaa',349),(1486,'pt_BR','Saaremaa',350),(1487,'pt_BR','Tartumaa',351),(1488,'pt_BR','Valgamaa',352),(1489,'pt_BR','Viljandimaa',353),(1490,'pt_BR','Võrumaa',354),(1491,'pt_BR','Daugavpils',355),(1492,'pt_BR','Jelgava',356),(1493,'pt_BR','Jekabpils',357),(1494,'pt_BR','Jurmala',358),(1495,'pt_BR','Liepaja',359),(1496,'pt_BR','Liepaja County',360),(1497,'pt_BR','Rezekne',361),(1498,'pt_BR','Riga',362),(1499,'pt_BR','Condado de Riga',363),(1500,'pt_BR','Valmiera',364),(1501,'pt_BR','Ventspils',365),(1502,'pt_BR','Aglonas novads',366),(1503,'pt_BR','Aizkraukles novads',367),(1504,'pt_BR','Aizputes novads',368),(1505,'pt_BR','Condado de Akniste',369),(1506,'pt_BR','Alojas novads',370),(1507,'pt_BR','Alsungas novads',371),(1508,'pt_BR','Aluksne County',372),(1509,'pt_BR','Amatas novads',373),(1510,'pt_BR','Macacos novads',374),(1511,'pt_BR','Auces novads',375),(1512,'pt_BR','Babītes novads',376),(1513,'pt_BR','Baldones novads',377),(1514,'pt_BR','Baltinavas novads',378),(1515,'pt_BR','Balvu novads',379),(1516,'pt_BR','Bauskas novads',380),(1517,'pt_BR','Condado de Beverina',381),(1518,'pt_BR','Condado de Broceni',382),(1519,'pt_BR','Burtnieku novads',383),(1520,'pt_BR','Carnikavas novads',384),(1521,'pt_BR','Cesvaines novads',385),(1522,'pt_BR','Ciblas novads',386),(1523,'pt_BR','Cesis county',387),(1524,'pt_BR','Dagdas novads',388),(1525,'pt_BR','Daugavpils novads',389),(1526,'pt_BR','Dobeles novads',390),(1527,'pt_BR','Dundagas novads',391),(1528,'pt_BR','Durbes novads',392),(1529,'pt_BR','Engad novads',393),(1530,'pt_BR','Garkalnes novads',394),(1531,'pt_BR','O condado de Grobiņa',395),(1532,'pt_BR','Gulbenes novads',396),(1533,'pt_BR','Iecavas novads',397),(1534,'pt_BR','Ikskile county',398),(1535,'pt_BR','Ilūkste county',399),(1536,'pt_BR','Condado de Inčukalns',400),(1537,'pt_BR','Jaunjelgavas novads',401),(1538,'pt_BR','Jaunpiebalgas novads',402),(1539,'pt_BR','Jaunpils novads',403),(1540,'pt_BR','Jelgavas novads',404),(1541,'pt_BR','Jekabpils county',405),(1542,'pt_BR','Kandavas novads',406),(1543,'pt_BR','Kokneses novads',407),(1544,'pt_BR','Krimuldas novads',408),(1545,'pt_BR','Krustpils novads',409),(1546,'pt_BR','Condado de Kraslava',410),(1547,'pt_BR','Condado de Kuldīga',411),(1548,'pt_BR','Condado de Kārsava',412),(1549,'pt_BR','Condado de Lielvarde',413),(1550,'pt_BR','Condado de Limbaži',414),(1551,'pt_BR','O distrito de Lubāna',415),(1552,'pt_BR','Ludzas novads',416),(1553,'pt_BR','Ligatne county',417),(1554,'pt_BR','Livani county',418),(1555,'pt_BR','Madonas novads',419),(1556,'pt_BR','Mazsalacas novads',420),(1557,'pt_BR','Mālpils county',421),(1558,'pt_BR','Mārupe county',422),(1559,'pt_BR','O condado de Naukšēni',423),(1560,'pt_BR','Neretas novads',424),(1561,'pt_BR','Nīca county',425),(1562,'pt_BR','Ogres novads',426),(1563,'pt_BR','Olaines novads',427),(1564,'pt_BR','Ozolnieku novads',428),(1565,'pt_BR','Preiļi county',429),(1566,'pt_BR','Priekules novads',430),(1567,'pt_BR','Condado de Priekuļi',431),(1568,'pt_BR','Moving county',432),(1569,'pt_BR','Condado de Pavilosta',433),(1570,'pt_BR','Condado de Plavinas',434),(1571,'pt_BR','Raunas novads',435),(1572,'pt_BR','Condado de Riebiņi',436),(1573,'pt_BR','Rojas novads',437),(1574,'pt_BR','Ropazi county',438),(1575,'pt_BR','Rucavas novads',439),(1576,'pt_BR','Rugāji county',440),(1577,'pt_BR','Rundāle county',441),(1578,'pt_BR','Rezekne county',442),(1579,'pt_BR','Rūjiena county',443),(1580,'pt_BR','O município de Salacgriva',444),(1581,'pt_BR','Salas novads',445),(1582,'pt_BR','Salaspils novads',446),(1583,'pt_BR','Saldus novads',447),(1584,'pt_BR','Saulkrastu novads',448),(1585,'pt_BR','Siguldas novads',449),(1586,'pt_BR','Skrundas novads',450),(1587,'pt_BR','Skrīveri county',451),(1588,'pt_BR','Smiltenes novads',452),(1589,'pt_BR','Condado de Stopini',453),(1590,'pt_BR','Condado de Strenči',454),(1591,'pt_BR','Região de semeadura',455),(1592,'pt_BR','Talsu novads',456),(1593,'pt_BR','Tukuma novads',457),(1594,'pt_BR','Condado de Tērvete',458),(1595,'pt_BR','O condado de Vaiņode',459),(1596,'pt_BR','Valkas novads',460),(1597,'pt_BR','Valmieras novads',461),(1598,'pt_BR','Varaklani county',462),(1599,'pt_BR','Vecpiebalgas novads',463),(1600,'pt_BR','Vecumnieku novads',464),(1601,'pt_BR','Ventspils novads',465),(1602,'pt_BR','Condado de Viesite',466),(1603,'pt_BR','Condado de Vilaka',467),(1604,'pt_BR','Vilani county',468),(1605,'pt_BR','Condado de Varkava',469),(1606,'pt_BR','Zilupes novads',470),(1607,'pt_BR','Adazi county',471),(1608,'pt_BR','Erglu county',472),(1609,'pt_BR','Kegums county',473),(1610,'pt_BR','Kekava county',474),(1611,'pt_BR','Alytaus Apskritis',475),(1612,'pt_BR','Kauno Apskritis',476),(1613,'pt_BR','Condado de Klaipeda',477),(1614,'pt_BR','Marijampolė county',478),(1615,'pt_BR','Panevezys county',479),(1616,'pt_BR','Siauliai county',480),(1617,'pt_BR','Taurage county',481),(1618,'pt_BR','Telšiai county',482),(1619,'pt_BR','Utenos Apskritis',483),(1620,'pt_BR','Vilniaus Apskritis',484),(1621,'pt_BR','Acre',485),(1622,'pt_BR','Alagoas',486),(1623,'pt_BR','Amapá',487),(1624,'pt_BR','Amazonas',488),(1625,'pt_BR','Bahia',489),(1626,'pt_BR','Ceará',490),(1627,'pt_BR','Espírito Santo',491),(1628,'pt_BR','Goiás',492),(1629,'pt_BR','Maranhão',493),(1630,'pt_BR','Mato Grosso',494),(1631,'pt_BR','Mato Grosso do Sul',495),(1632,'pt_BR','Minas Gerais',496),(1633,'pt_BR','Pará',497),(1634,'pt_BR','Paraíba',498),(1635,'pt_BR','Paraná',499),(1636,'pt_BR','Pernambuco',500),(1637,'pt_BR','Piauí',501),(1638,'pt_BR','Rio de Janeiro',502),(1639,'pt_BR','Rio Grande do Norte',503),(1640,'pt_BR','Rio Grande do Sul',504),(1641,'pt_BR','Rondônia',505),(1642,'pt_BR','Roraima',506),(1643,'pt_BR','Santa Catarina',507),(1644,'pt_BR','São Paulo',508),(1645,'pt_BR','Sergipe',509),(1646,'pt_BR','Tocantins',510),(1647,'pt_BR','Distrito Federal',511),(1648,'pt_BR','Condado de Zagreb',512),(1649,'pt_BR','Condado de Krapina-Zagorje',513),(1650,'pt_BR','Condado de Sisak-Moslavina',514),(1651,'pt_BR','Condado de Karlovac',515),(1652,'pt_BR','Concelho de Varaždin',516),(1653,'pt_BR','Condado de Koprivnica-Križevci',517),(1654,'pt_BR','Condado de Bjelovar-Bilogora',518),(1655,'pt_BR','Condado de Primorje-Gorski kotar',519),(1656,'pt_BR','Condado de Lika-Senj',520),(1657,'pt_BR','Condado de Virovitica-Podravina',521),(1658,'pt_BR','Condado de Požega-Slavonia',522),(1659,'pt_BR','Condado de Brod-Posavina',523),(1660,'pt_BR','Condado de Zadar',524),(1661,'pt_BR','Condado de Osijek-Baranja',525),(1662,'pt_BR','Condado de Šibenik-Knin',526),(1663,'pt_BR','Condado de Vukovar-Srijem',527),(1664,'pt_BR','Condado de Split-Dalmácia',528),(1665,'pt_BR','Condado de Ístria',529),(1666,'pt_BR','Condado de Dubrovnik-Neretva',530),(1667,'pt_BR','Međimurska županija',531),(1668,'pt_BR','Grad Zagreb',532),(1669,'pt_BR','Ilhas Andaman e Nicobar',533),(1670,'pt_BR','Andhra Pradesh',534),(1671,'pt_BR','Arunachal Pradesh',535),(1672,'pt_BR','Assam',536),(1673,'pt_BR','Bihar',537),(1674,'pt_BR','Chandigarh',538),(1675,'pt_BR','Chhattisgarh',539),(1676,'pt_BR','Dadra e Nagar Haveli',540),(1677,'pt_BR','Daman e Diu',541),(1678,'pt_BR','Delhi',542),(1679,'pt_BR','Goa',543),(1680,'pt_BR','Gujarat',544),(1681,'pt_BR','Haryana',545),(1682,'pt_BR','Himachal Pradesh',546),(1683,'pt_BR','Jammu e Caxemira',547),(1684,'pt_BR','Jharkhand',548),(1685,'pt_BR','Karnataka',549),(1686,'pt_BR','Kerala',550),(1687,'pt_BR','Lakshadweep',551),(1688,'pt_BR','Madhya Pradesh',552),(1689,'pt_BR','Maharashtra',553),(1690,'pt_BR','Manipur',554),(1691,'pt_BR','Meghalaya',555),(1692,'pt_BR','Mizoram',556),(1693,'pt_BR','Nagaland',557),(1694,'pt_BR','Odisha',558),(1695,'pt_BR','Puducherry',559),(1696,'pt_BR','Punjab',560),(1697,'pt_BR','Rajasthan',561),(1698,'pt_BR','Sikkim',562),(1699,'pt_BR','Tamil Nadu',563),(1700,'pt_BR','Telangana',564),(1701,'pt_BR','Tripura',565),(1702,'pt_BR','Uttar Pradesh',566),(1703,'pt_BR','Uttarakhand',567),(1704,'pt_BR','Bengala Ocidental',568);
/*!40000 ALTER TABLE `country_state_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_states`
--

DROP TABLE IF EXISTS `country_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_states_country_id_foreign` (`country_id`),
  CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_states`
--

LOCK TABLES `country_states` WRITE;
/*!40000 ALTER TABLE `country_states` DISABLE KEYS */;
INSERT INTO `country_states` VALUES (1,'US','AL','Alabama',244),(2,'US','AK','Alaska',244),(3,'US','AS','American Samoa',244),(4,'US','AZ','Arizona',244),(5,'US','AR','Arkansas',244),(6,'US','AE','Armed Forces Africa',244),(7,'US','AA','Armed Forces Americas',244),(8,'US','AE','Armed Forces Canada',244),(9,'US','AE','Armed Forces Europe',244),(10,'US','AE','Armed Forces Middle East',244),(11,'US','AP','Armed Forces Pacific',244),(12,'US','CA','California',244),(13,'US','CO','Colorado',244),(14,'US','CT','Connecticut',244),(15,'US','DE','Delaware',244),(16,'US','DC','District of Columbia',244),(17,'US','FM','Federated States Of Micronesia',244),(18,'US','FL','Florida',244),(19,'US','GA','Georgia',244),(20,'US','GU','Guam',244),(21,'US','HI','Hawaii',244),(22,'US','ID','Idaho',244),(23,'US','IL','Illinois',244),(24,'US','IN','Indiana',244),(25,'US','IA','Iowa',244),(26,'US','KS','Kansas',244),(27,'US','KY','Kentucky',244),(28,'US','LA','Louisiana',244),(29,'US','ME','Maine',244),(30,'US','MH','Marshall Islands',244),(31,'US','MD','Maryland',244),(32,'US','MA','Massachusetts',244),(33,'US','MI','Michigan',244),(34,'US','MN','Minnesota',244),(35,'US','MS','Mississippi',244),(36,'US','MO','Missouri',244),(37,'US','MT','Montana',244),(38,'US','NE','Nebraska',244),(39,'US','NV','Nevada',244),(40,'US','NH','New Hampshire',244),(41,'US','NJ','New Jersey',244),(42,'US','NM','New Mexico',244),(43,'US','NY','New York',244),(44,'US','NC','North Carolina',244),(45,'US','ND','North Dakota',244),(46,'US','MP','Northern Mariana Islands',244),(47,'US','OH','Ohio',244),(48,'US','OK','Oklahoma',244),(49,'US','OR','Oregon',244),(50,'US','PW','Palau',244),(51,'US','PA','Pennsylvania',244),(52,'US','PR','Puerto Rico',244),(53,'US','RI','Rhode Island',244),(54,'US','SC','South Carolina',244),(55,'US','SD','South Dakota',244),(56,'US','TN','Tennessee',244),(57,'US','TX','Texas',244),(58,'US','UT','Utah',244),(59,'US','VT','Vermont',244),(60,'US','VI','Virgin Islands',244),(61,'US','VA','Virginia',244),(62,'US','WA','Washington',244),(63,'US','WV','West Virginia',244),(64,'US','WI','Wisconsin',244),(65,'US','WY','Wyoming',244),(66,'CA','AB','Alberta',40),(67,'CA','BC','British Columbia',40),(68,'CA','MB','Manitoba',40),(69,'CA','NL','Newfoundland and Labrador',40),(70,'CA','NB','New Brunswick',40),(71,'CA','NS','Nova Scotia',40),(72,'CA','NT','Northwest Territories',40),(73,'CA','NU','Nunavut',40),(74,'CA','ON','Ontario',40),(75,'CA','PE','Prince Edward Island',40),(76,'CA','QC','Quebec',40),(77,'CA','SK','Saskatchewan',40),(78,'CA','YT','Yukon Territory',40),(79,'DE','NDS','Niedersachsen',88),(80,'DE','BAW','Baden-Württemberg',88),(81,'DE','BAY','Bayern',88),(82,'DE','BER','Berlin',88),(83,'DE','BRG','Brandenburg',88),(84,'DE','BRE','Bremen',88),(85,'DE','HAM','Hamburg',88),(86,'DE','HES','Hessen',88),(87,'DE','MEC','Mecklenburg-Vorpommern',88),(88,'DE','NRW','Nordrhein-Westfalen',88),(89,'DE','RHE','Rheinland-Pfalz',88),(90,'DE','SAR','Saarland',88),(91,'DE','SAS','Sachsen',88),(92,'DE','SAC','Sachsen-Anhalt',88),(93,'DE','SCN','Schleswig-Holstein',88),(94,'DE','THE','Thüringen',88),(95,'AT','WI','Wien',16),(96,'AT','NO','Niederösterreich',16),(97,'AT','OO','Oberösterreich',16),(98,'AT','SB','Salzburg',16),(99,'AT','KN','Kärnten',16),(100,'AT','ST','Steiermark',16),(101,'AT','TI','Tirol',16),(102,'AT','BL','Burgenland',16),(103,'AT','VB','Vorarlberg',16),(104,'CH','AG','Aargau',220),(105,'CH','AI','Appenzell Innerrhoden',220),(106,'CH','AR','Appenzell Ausserrhoden',220),(107,'CH','BE','Bern',220),(108,'CH','BL','Basel-Landschaft',220),(109,'CH','BS','Basel-Stadt',220),(110,'CH','FR','Freiburg',220),(111,'CH','GE','Genf',220),(112,'CH','GL','Glarus',220),(113,'CH','GR','Graubünden',220),(114,'CH','JU','Jura',220),(115,'CH','LU','Luzern',220),(116,'CH','NE','Neuenburg',220),(117,'CH','NW','Nidwalden',220),(118,'CH','OW','Obwalden',220),(119,'CH','SG','St. Gallen',220),(120,'CH','SH','Schaffhausen',220),(121,'CH','SO','Solothurn',220),(122,'CH','SZ','Schwyz',220),(123,'CH','TG','Thurgau',220),(124,'CH','TI','Tessin',220),(125,'CH','UR','Uri',220),(126,'CH','VD','Waadt',220),(127,'CH','VS','Wallis',220),(128,'CH','ZG','Zug',220),(129,'CH','ZH','Zürich',220),(130,'ES','A Coruсa','A Coruña',206),(131,'ES','Alava','Alava',206),(132,'ES','Albacete','Albacete',206),(133,'ES','Alicante','Alicante',206),(134,'ES','Almeria','Almeria',206),(135,'ES','Asturias','Asturias',206),(136,'ES','Avila','Avila',206),(137,'ES','Badajoz','Badajoz',206),(138,'ES','Baleares','Baleares',206),(139,'ES','Barcelona','Barcelona',206),(140,'ES','Burgos','Burgos',206),(141,'ES','Caceres','Caceres',206),(142,'ES','Cadiz','Cadiz',206),(143,'ES','Cantabria','Cantabria',206),(144,'ES','Castellon','Castellon',206),(145,'ES','Ceuta','Ceuta',206),(146,'ES','Ciudad Real','Ciudad Real',206),(147,'ES','Cordoba','Cordoba',206),(148,'ES','Cuenca','Cuenca',206),(149,'ES','Girona','Girona',206),(150,'ES','Granada','Granada',206),(151,'ES','Guadalajara','Guadalajara',206),(152,'ES','Guipuzcoa','Guipuzcoa',206),(153,'ES','Huelva','Huelva',206),(154,'ES','Huesca','Huesca',206),(155,'ES','Jaen','Jaen',206),(156,'ES','La Rioja','La Rioja',206),(157,'ES','Las Palmas','Las Palmas',206),(158,'ES','Leon','Leon',206),(159,'ES','Lleida','Lleida',206),(160,'ES','Lugo','Lugo',206),(161,'ES','Madrid','Madrid',206),(162,'ES','Malaga','Malaga',206),(163,'ES','Melilla','Melilla',206),(164,'ES','Murcia','Murcia',206),(165,'ES','Navarra','Navarra',206),(166,'ES','Ourense','Ourense',206),(167,'ES','Palencia','Palencia',206),(168,'ES','Pontevedra','Pontevedra',206),(169,'ES','Salamanca','Salamanca',206),(170,'ES','Santa Cruz de Tenerife','Santa Cruz de Tenerife',206),(171,'ES','Segovia','Segovia',206),(172,'ES','Sevilla','Sevilla',206),(173,'ES','Soria','Soria',206),(174,'ES','Tarragona','Tarragona',206),(175,'ES','Teruel','Teruel',206),(176,'ES','Toledo','Toledo',206),(177,'ES','Valencia','Valencia',206),(178,'ES','Valladolid','Valladolid',206),(179,'ES','Vizcaya','Vizcaya',206),(180,'ES','Zamora','Zamora',206),(181,'ES','Zaragoza','Zaragoza',206),(182,'FR','1','Ain',81),(183,'FR','2','Aisne',81),(184,'FR','3','Allier',81),(185,'FR','4','Alpes-de-Haute-Provence',81),(186,'FR','5','Hautes-Alpes',81),(187,'FR','6','Alpes-Maritimes',81),(188,'FR','7','Ardèche',81),(189,'FR','8','Ardennes',81),(190,'FR','9','Ariège',81),(191,'FR','10','Aube',81),(192,'FR','11','Aude',81),(193,'FR','12','Aveyron',81),(194,'FR','13','Bouches-du-Rhône',81),(195,'FR','14','Calvados',81),(196,'FR','15','Cantal',81),(197,'FR','16','Charente',81),(198,'FR','17','Charente-Maritime',81),(199,'FR','18','Cher',81),(200,'FR','19','Corrèze',81),(201,'FR','2A','Corse-du-Sud',81),(202,'FR','2B','Haute-Corse',81),(203,'FR','21','Côte-d\'Or',81),(204,'FR','22','Côtes-d\'Armor',81),(205,'FR','23','Creuse',81),(206,'FR','24','Dordogne',81),(207,'FR','25','Doubs',81),(208,'FR','26','Drôme',81),(209,'FR','27','Eure',81),(210,'FR','28','Eure-et-Loir',81),(211,'FR','29','Finistère',81),(212,'FR','30','Gard',81),(213,'FR','31','Haute-Garonne',81),(214,'FR','32','Gers',81),(215,'FR','33','Gironde',81),(216,'FR','34','Hérault',81),(217,'FR','35','Ille-et-Vilaine',81),(218,'FR','36','Indre',81),(219,'FR','37','Indre-et-Loire',81),(220,'FR','38','Isère',81),(221,'FR','39','Jura',81),(222,'FR','40','Landes',81),(223,'FR','41','Loir-et-Cher',81),(224,'FR','42','Loire',81),(225,'FR','43','Haute-Loire',81),(226,'FR','44','Loire-Atlantique',81),(227,'FR','45','Loiret',81),(228,'FR','46','Lot',81),(229,'FR','47','Lot-et-Garonne',81),(230,'FR','48','Lozère',81),(231,'FR','49','Maine-et-Loire',81),(232,'FR','50','Manche',81),(233,'FR','51','Marne',81),(234,'FR','52','Haute-Marne',81),(235,'FR','53','Mayenne',81),(236,'FR','54','Meurthe-et-Moselle',81),(237,'FR','55','Meuse',81),(238,'FR','56','Morbihan',81),(239,'FR','57','Moselle',81),(240,'FR','58','Nièvre',81),(241,'FR','59','Nord',81),(242,'FR','60','Oise',81),(243,'FR','61','Orne',81),(244,'FR','62','Pas-de-Calais',81),(245,'FR','63','Puy-de-Dôme',81),(246,'FR','64','Pyrénées-Atlantiques',81),(247,'FR','65','Hautes-Pyrénées',81),(248,'FR','66','Pyrénées-Orientales',81),(249,'FR','67','Bas-Rhin',81),(250,'FR','68','Haut-Rhin',81),(251,'FR','69','Rhône',81),(252,'FR','70','Haute-Saône',81),(253,'FR','71','Saône-et-Loire',81),(254,'FR','72','Sarthe',81),(255,'FR','73','Savoie',81),(256,'FR','74','Haute-Savoie',81),(257,'FR','75','Paris',81),(258,'FR','76','Seine-Maritime',81),(259,'FR','77','Seine-et-Marne',81),(260,'FR','78','Yvelines',81),(261,'FR','79','Deux-Sèvres',81),(262,'FR','80','Somme',81),(263,'FR','81','Tarn',81),(264,'FR','82','Tarn-et-Garonne',81),(265,'FR','83','Var',81),(266,'FR','84','Vaucluse',81),(267,'FR','85','Vendée',81),(268,'FR','86','Vienne',81),(269,'FR','87','Haute-Vienne',81),(270,'FR','88','Vosges',81),(271,'FR','89','Yonne',81),(272,'FR','90','Territoire-de-Belfort',81),(273,'FR','91','Essonne',81),(274,'FR','92','Hauts-de-Seine',81),(275,'FR','93','Seine-Saint-Denis',81),(276,'FR','94','Val-de-Marne',81),(277,'FR','95','Val-d\'Oise',81),(278,'RO','AB','Alba',185),(279,'RO','AR','Arad',185),(280,'RO','AG','Argeş',185),(281,'RO','BC','Bacău',185),(282,'RO','BH','Bihor',185),(283,'RO','BN','Bistriţa-Năsăud',185),(284,'RO','BT','Botoşani',185),(285,'RO','BV','Braşov',185),(286,'RO','BR','Brăila',185),(287,'RO','B','Bucureşti',185),(288,'RO','BZ','Buzău',185),(289,'RO','CS','Caraş-Severin',185),(290,'RO','CL','Călăraşi',185),(291,'RO','CJ','Cluj',185),(292,'RO','CT','Constanţa',185),(293,'RO','CV','Covasna',185),(294,'RO','DB','Dâmboviţa',185),(295,'RO','DJ','Dolj',185),(296,'RO','GL','Galaţi',185),(297,'RO','GR','Giurgiu',185),(298,'RO','GJ','Gorj',185),(299,'RO','HR','Harghita',185),(300,'RO','HD','Hunedoara',185),(301,'RO','IL','Ialomiţa',185),(302,'RO','IS','Iaşi',185),(303,'RO','IF','Ilfov',185),(304,'RO','MM','Maramureş',185),(305,'RO','MH','Mehedinţi',185),(306,'RO','MS','Mureş',185),(307,'RO','NT','Neamţ',185),(308,'RO','OT','Olt',185),(309,'RO','PH','Prahova',185),(310,'RO','SM','Satu-Mare',185),(311,'RO','SJ','Sălaj',185),(312,'RO','SB','Sibiu',185),(313,'RO','SV','Suceava',185),(314,'RO','TR','Teleorman',185),(315,'RO','TM','Timiş',185),(316,'RO','TL','Tulcea',185),(317,'RO','VS','Vaslui',185),(318,'RO','VL','Vâlcea',185),(319,'RO','VN','Vrancea',185),(320,'FI','Lappi','Lappi',80),(321,'FI','Pohjois-Pohjanmaa','Pohjois-Pohjanmaa',80),(322,'FI','Kainuu','Kainuu',80),(323,'FI','Pohjois-Karjala','Pohjois-Karjala',80),(324,'FI','Pohjois-Savo','Pohjois-Savo',80),(325,'FI','Etelä-Savo','Etelä-Savo',80),(326,'FI','Etelä-Pohjanmaa','Etelä-Pohjanmaa',80),(327,'FI','Pohjanmaa','Pohjanmaa',80),(328,'FI','Pirkanmaa','Pirkanmaa',80),(329,'FI','Satakunta','Satakunta',80),(330,'FI','Keski-Pohjanmaa','Keski-Pohjanmaa',80),(331,'FI','Keski-Suomi','Keski-Suomi',80),(332,'FI','Varsinais-Suomi','Varsinais-Suomi',80),(333,'FI','Etelä-Karjala','Etelä-Karjala',80),(334,'FI','Päijät-Häme','Päijät-Häme',80),(335,'FI','Kanta-Häme','Kanta-Häme',80),(336,'FI','Uusimaa','Uusimaa',80),(337,'FI','Itä-Uusimaa','Itä-Uusimaa',80),(338,'FI','Kymenlaakso','Kymenlaakso',80),(339,'FI','Ahvenanmaa','Ahvenanmaa',80),(340,'EE','EE-37','Harjumaa',74),(341,'EE','EE-39','Hiiumaa',74),(342,'EE','EE-44','Ida-Virumaa',74),(343,'EE','EE-49','Jõgevamaa',74),(344,'EE','EE-51','Järvamaa',74),(345,'EE','EE-57','Läänemaa',74),(346,'EE','EE-59','Lääne-Virumaa',74),(347,'EE','EE-65','Põlvamaa',74),(348,'EE','EE-67','Pärnumaa',74),(349,'EE','EE-70','Raplamaa',74),(350,'EE','EE-74','Saaremaa',74),(351,'EE','EE-78','Tartumaa',74),(352,'EE','EE-82','Valgamaa',74),(353,'EE','EE-84','Viljandimaa',74),(354,'EE','EE-86','Võrumaa',74),(355,'LV','LV-DGV','Daugavpils',125),(356,'LV','LV-JEL','Jelgava',125),(357,'LV','Jēkabpils','Jēkabpils',125),(358,'LV','LV-JUR','Jūrmala',125),(359,'LV','LV-LPX','Liepāja',125),(360,'LV','LV-LE','Liepājas novads',125),(361,'LV','LV-REZ','Rēzekne',125),(362,'LV','LV-RIX','Rīga',125),(363,'LV','LV-RI','Rīgas novads',125),(364,'LV','Valmiera','Valmiera',125),(365,'LV','LV-VEN','Ventspils',125),(366,'LV','Aglonas novads','Aglonas novads',125),(367,'LV','LV-AI','Aizkraukles novads',125),(368,'LV','Aizputes novads','Aizputes novads',125),(369,'LV','Aknīstes novads','Aknīstes novads',125),(370,'LV','Alojas novads','Alojas novads',125),(371,'LV','Alsungas novads','Alsungas novads',125),(372,'LV','LV-AL','Alūksnes novads',125),(373,'LV','Amatas novads','Amatas novads',125),(374,'LV','Apes novads','Apes novads',125),(375,'LV','Auces novads','Auces novads',125),(376,'LV','Babītes novads','Babītes novads',125),(377,'LV','Baldones novads','Baldones novads',125),(378,'LV','Baltinavas novads','Baltinavas novads',125),(379,'LV','LV-BL','Balvu novads',125),(380,'LV','LV-BU','Bauskas novads',125),(381,'LV','Beverīnas novads','Beverīnas novads',125),(382,'LV','Brocēnu novads','Brocēnu novads',125),(383,'LV','Burtnieku novads','Burtnieku novads',125),(384,'LV','Carnikavas novads','Carnikavas novads',125),(385,'LV','Cesvaines novads','Cesvaines novads',125),(386,'LV','Ciblas novads','Ciblas novads',125),(387,'LV','LV-CE','Cēsu novads',125),(388,'LV','Dagdas novads','Dagdas novads',125),(389,'LV','LV-DA','Daugavpils novads',125),(390,'LV','LV-DO','Dobeles novads',125),(391,'LV','Dundagas novads','Dundagas novads',125),(392,'LV','Durbes novads','Durbes novads',125),(393,'LV','Engures novads','Engures novads',125),(394,'LV','Garkalnes novads','Garkalnes novads',125),(395,'LV','Grobiņas novads','Grobiņas novads',125),(396,'LV','LV-GU','Gulbenes novads',125),(397,'LV','Iecavas novads','Iecavas novads',125),(398,'LV','Ikšķiles novads','Ikšķiles novads',125),(399,'LV','Ilūkstes novads','Ilūkstes novads',125),(400,'LV','Inčukalna novads','Inčukalna novads',125),(401,'LV','Jaunjelgavas novads','Jaunjelgavas novads',125),(402,'LV','Jaunpiebalgas novads','Jaunpiebalgas novads',125),(403,'LV','Jaunpils novads','Jaunpils novads',125),(404,'LV','LV-JL','Jelgavas novads',125),(405,'LV','LV-JK','Jēkabpils novads',125),(406,'LV','Kandavas novads','Kandavas novads',125),(407,'LV','Kokneses novads','Kokneses novads',125),(408,'LV','Krimuldas novads','Krimuldas novads',125),(409,'LV','Krustpils novads','Krustpils novads',125),(410,'LV','LV-KR','Krāslavas novads',125),(411,'LV','LV-KU','Kuldīgas novads',125),(412,'LV','Kārsavas novads','Kārsavas novads',125),(413,'LV','Lielvārdes novads','Lielvārdes novads',125),(414,'LV','LV-LM','Limbažu novads',125),(415,'LV','Lubānas novads','Lubānas novads',125),(416,'LV','LV-LU','Ludzas novads',125),(417,'LV','Līgatnes novads','Līgatnes novads',125),(418,'LV','Līvānu novads','Līvānu novads',125),(419,'LV','LV-MA','Madonas novads',125),(420,'LV','Mazsalacas novads','Mazsalacas novads',125),(421,'LV','Mālpils novads','Mālpils novads',125),(422,'LV','Mārupes novads','Mārupes novads',125),(423,'LV','Naukšēnu novads','Naukšēnu novads',125),(424,'LV','Neretas novads','Neretas novads',125),(425,'LV','Nīcas novads','Nīcas novads',125),(426,'LV','LV-OG','Ogres novads',125),(427,'LV','Olaines novads','Olaines novads',125),(428,'LV','Ozolnieku novads','Ozolnieku novads',125),(429,'LV','LV-PR','Preiļu novads',125),(430,'LV','Priekules novads','Priekules novads',125),(431,'LV','Priekuļu novads','Priekuļu novads',125),(432,'LV','Pārgaujas novads','Pārgaujas novads',125),(433,'LV','Pāvilostas novads','Pāvilostas novads',125),(434,'LV','Pļaviņu novads','Pļaviņu novads',125),(435,'LV','Raunas novads','Raunas novads',125),(436,'LV','Riebiņu novads','Riebiņu novads',125),(437,'LV','Rojas novads','Rojas novads',125),(438,'LV','Ropažu novads','Ropažu novads',125),(439,'LV','Rucavas novads','Rucavas novads',125),(440,'LV','Rugāju novads','Rugāju novads',125),(441,'LV','Rundāles novads','Rundāles novads',125),(442,'LV','LV-RE','Rēzeknes novads',125),(443,'LV','Rūjienas novads','Rūjienas novads',125),(444,'LV','Salacgrīvas novads','Salacgrīvas novads',125),(445,'LV','Salas novads','Salas novads',125),(446,'LV','Salaspils novads','Salaspils novads',125),(447,'LV','LV-SA','Saldus novads',125),(448,'LV','Saulkrastu novads','Saulkrastu novads',125),(449,'LV','Siguldas novads','Siguldas novads',125),(450,'LV','Skrundas novads','Skrundas novads',125),(451,'LV','Skrīveru novads','Skrīveru novads',125),(452,'LV','Smiltenes novads','Smiltenes novads',125),(453,'LV','Stopiņu novads','Stopiņu novads',125),(454,'LV','Strenču novads','Strenču novads',125),(455,'LV','Sējas novads','Sējas novads',125),(456,'LV','LV-TA','Talsu novads',125),(457,'LV','LV-TU','Tukuma novads',125),(458,'LV','Tērvetes novads','Tērvetes novads',125),(459,'LV','Vaiņodes novads','Vaiņodes novads',125),(460,'LV','LV-VK','Valkas novads',125),(461,'LV','LV-VM','Valmieras novads',125),(462,'LV','Varakļānu novads','Varakļānu novads',125),(463,'LV','Vecpiebalgas novads','Vecpiebalgas novads',125),(464,'LV','Vecumnieku novads','Vecumnieku novads',125),(465,'LV','LV-VE','Ventspils novads',125),(466,'LV','Viesītes novads','Viesītes novads',125),(467,'LV','Viļakas novads','Viļakas novads',125),(468,'LV','Viļānu novads','Viļānu novads',125),(469,'LV','Vārkavas novads','Vārkavas novads',125),(470,'LV','Zilupes novads','Zilupes novads',125),(471,'LV','Ādažu novads','Ādažu novads',125),(472,'LV','Ērgļu novads','Ērgļu novads',125),(473,'LV','Ķeguma novads','Ķeguma novads',125),(474,'LV','Ķekavas novads','Ķekavas novads',125),(475,'LT','LT-AL','Alytaus Apskritis',131),(476,'LT','LT-KU','Kauno Apskritis',131),(477,'LT','LT-KL','Klaipėdos Apskritis',131),(478,'LT','LT-MR','Marijampolės Apskritis',131),(479,'LT','LT-PN','Panevėžio Apskritis',131),(480,'LT','LT-SA','Šiaulių Apskritis',131),(481,'LT','LT-TA','Tauragės Apskritis',131),(482,'LT','LT-TE','Telšių Apskritis',131),(483,'LT','LT-UT','Utenos Apskritis',131),(484,'LT','LT-VL','Vilniaus Apskritis',131),(485,'BR','AC','Acre',31),(486,'BR','AL','Alagoas',31),(487,'BR','AP','Amapá',31),(488,'BR','AM','Amazonas',31),(489,'BR','BA','Bahia',31),(490,'BR','CE','Ceará',31),(491,'BR','ES','Espírito Santo',31),(492,'BR','GO','Goiás',31),(493,'BR','MA','Maranhão',31),(494,'BR','MT','Mato Grosso',31),(495,'BR','MS','Mato Grosso do Sul',31),(496,'BR','MG','Minas Gerais',31),(497,'BR','PA','Pará',31),(498,'BR','PB','Paraíba',31),(499,'BR','PR','Paraná',31),(500,'BR','PE','Pernambuco',31),(501,'BR','PI','Piauí',31),(502,'BR','RJ','Rio de Janeiro',31),(503,'BR','RN','Rio Grande do Norte',31),(504,'BR','RS','Rio Grande do Sul',31),(505,'BR','RO','Rondônia',31),(506,'BR','RR','Roraima',31),(507,'BR','SC','Santa Catarina',31),(508,'BR','SP','São Paulo',31),(509,'BR','SE','Sergipe',31),(510,'BR','TO','Tocantins',31),(511,'BR','DF','Distrito Federal',31),(512,'HR','HR-01','Zagrebačka županija',59),(513,'HR','HR-02','Krapinsko-zagorska županija',59),(514,'HR','HR-03','Sisačko-moslavačka županija',59),(515,'HR','HR-04','Karlovačka županija',59),(516,'HR','HR-05','Varaždinska županija',59),(517,'HR','HR-06','Koprivničko-križevačka županija',59),(518,'HR','HR-07','Bjelovarsko-bilogorska županija',59),(519,'HR','HR-08','Primorsko-goranska županija',59),(520,'HR','HR-09','Ličko-senjska županija',59),(521,'HR','HR-10','Virovitičko-podravska županija',59),(522,'HR','HR-11','Požeško-slavonska županija',59),(523,'HR','HR-12','Brodsko-posavska županija',59),(524,'HR','HR-13','Zadarska županija',59),(525,'HR','HR-14','Osječko-baranjska županija',59),(526,'HR','HR-15','Šibensko-kninska županija',59),(527,'HR','HR-16','Vukovarsko-srijemska županija',59),(528,'HR','HR-17','Splitsko-dalmatinska županija',59),(529,'HR','HR-18','Istarska županija',59),(530,'HR','HR-19','Dubrovačko-neretvanska županija',59),(531,'HR','HR-20','Međimurska županija',59),(532,'HR','HR-21','Grad Zagreb',59),(533,'IN','AN','Andaman and Nicobar Islands',106),(534,'IN','AP','Andhra Pradesh',106),(535,'IN','AR','Arunachal Pradesh',106),(536,'IN','AS','Assam',106),(537,'IN','BR','Bihar',106),(538,'IN','CH','Chandigarh',106),(539,'IN','CT','Chhattisgarh',106),(540,'IN','DN','Dadra and Nagar Haveli',106),(541,'IN','DD','Daman and Diu',106),(542,'IN','DL','Delhi',106),(543,'IN','GA','Goa',106),(544,'IN','GJ','Gujarat',106),(545,'IN','HR','Haryana',106),(546,'IN','HP','Himachal Pradesh',106),(547,'IN','JK','Jammu and Kashmir',106),(548,'IN','JH','Jharkhand',106),(549,'IN','KA','Karnataka',106),(550,'IN','KL','Kerala',106),(551,'IN','LD','Lakshadweep',106),(552,'IN','MP','Madhya Pradesh',106),(553,'IN','MH','Maharashtra',106),(554,'IN','MN','Manipur',106),(555,'IN','ML','Meghalaya',106),(556,'IN','MZ','Mizoram',106),(557,'IN','NL','Nagaland',106),(558,'IN','OR','Odisha',106),(559,'IN','PY','Puducherry',106),(560,'IN','PB','Punjab',106),(561,'IN','RJ','Rajasthan',106),(562,'IN','SK','Sikkim',106),(563,'IN','TN','Tamil Nadu',106),(564,'IN','TG','Telangana',106),(565,'IN','TR','Tripura',106),(566,'IN','UP','Uttar Pradesh',106),(567,'IN','UT','Uttarakhand',106),(568,'IN','WB','West Bengal',106);
/*!40000 ALTER TABLE `country_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_translations`
--

DROP TABLE IF EXISTS `country_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `country_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_translations_country_id_foreign` (`country_id`),
  CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=766 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_translations`
--

LOCK TABLES `country_translations` WRITE;
/*!40000 ALTER TABLE `country_translations` DISABLE KEYS */;
INSERT INTO `country_translations` VALUES (1,'ar','أفغانستان',1),(2,'ar','جزر آلاند',2),(3,'ar','ألبانيا',3),(4,'ar','الجزائر',4),(5,'ar','ساموا الأمريكية',5),(6,'ar','أندورا',6),(7,'ar','أنغولا',7),(8,'ar','أنغيلا',8),(9,'ar','القارة القطبية الجنوبية',9),(10,'ar','أنتيغوا وبربودا',10),(11,'ar','الأرجنتين',11),(12,'ar','أرمينيا',12),(13,'ar','أروبا',13),(14,'ar','جزيرة الصعود',14),(15,'ar','أستراليا',15),(16,'ar','النمسا',16),(17,'ar','أذربيجان',17),(18,'ar','الباهاما',18),(19,'ar','البحرين',19),(20,'ar','بنغلاديش',20),(21,'ar','بربادوس',21),(22,'ar','روسيا البيضاء',22),(23,'ar','بلجيكا',23),(24,'ar','بليز',24),(25,'ar','بنين',25),(26,'ar','برمودا',26),(27,'ar','بوتان',27),(28,'ar','بوليفيا',28),(29,'ar','البوسنة والهرسك',29),(30,'ar','بوتسوانا',30),(31,'ar','البرازيل',31),(32,'ar','إقليم المحيط البريطاني الهندي',32),(33,'ar','جزر فيرجن البريطانية',33),(34,'ar','بروناي',34),(35,'ar','بلغاريا',35),(36,'ar','بوركينا فاسو',36),(37,'ar','بوروندي',37),(38,'ar','كمبوديا',38),(39,'ar','الكاميرون',39),(40,'ar','كندا',40),(41,'ar','جزر الكناري',41),(42,'ar','الرأس الأخضر',42),(43,'ar','الكاريبي هولندا',43),(44,'ar','جزر كايمان',44),(45,'ar','جمهورية افريقيا الوسطى',45),(46,'ar','سبتة ومليلية',46),(47,'ar','تشاد',47),(48,'ar','تشيلي',48),(49,'ar','الصين',49),(50,'ar','جزيرة الكريسماس',50),(51,'ar','جزر كوكوس (كيلينغ)',51),(52,'ar','كولومبيا',52),(53,'ar','جزر القمر',53),(54,'ar','الكونغو - برازافيل',54),(55,'ar','الكونغو - كينشاسا',55),(56,'ar','جزر كوك',56),(57,'ar','كوستاريكا',57),(58,'ar','ساحل العاج',58),(59,'ar','كرواتيا',59),(60,'ar','كوبا',60),(61,'ar','كوراساو',61),(62,'ar','قبرص',62),(63,'ar','التشيك',63),(64,'ar','الدنمارك',64),(65,'ar','دييغو غارسيا',65),(66,'ar','جيبوتي',66),(67,'ar','دومينيكا',67),(68,'ar','جمهورية الدومنيكان',68),(69,'ar','الإكوادور',69),(70,'ar','مصر',70),(71,'ar','السلفادور',71),(72,'ar','غينيا الإستوائية',72),(73,'ar','إريتريا',73),(74,'ar','استونيا',74),(75,'ar','أثيوبيا',75),(76,'ar','منطقة اليورو',76),(77,'ar','جزر فوكلاند',77),(78,'ar','جزر فاروس',78),(79,'ar','فيجي',79),(80,'ar','فنلندا',80),(81,'ar','فرنسا',81),(82,'ar','غيانا الفرنسية',82),(83,'ar','بولينيزيا الفرنسية',83),(84,'ar','المناطق الجنوبية لفرنسا',84),(85,'ar','الغابون',85),(86,'ar','غامبيا',86),(87,'ar','جورجيا',87),(88,'ar','ألمانيا',88),(89,'ar','غانا',89),(90,'ar','جبل طارق',90),(91,'ar','اليونان',91),(92,'ar','الأرض الخضراء',92),(93,'ar','غرينادا',93),(94,'ar','جوادلوب',94),(95,'ar','غوام',95),(96,'ar','غواتيمالا',96),(97,'ar','غيرنسي',97),(98,'ar','غينيا',98),(99,'ar','غينيا بيساو',99),(100,'ar','غيانا',100),(101,'ar','هايتي',101),(102,'ar','هندوراس',102),(103,'ar','هونج كونج SAR الصين',103),(104,'ar','هنغاريا',104),(105,'ar','أيسلندا',105),(106,'ar','الهند',106),(107,'ar','إندونيسيا',107),(108,'ar','إيران',108),(109,'ar','العراق',109),(110,'ar','أيرلندا',110),(111,'ar','جزيرة آيل أوف مان',111),(112,'ar','إسرائيل',112),(113,'ar','إيطاليا',113),(114,'ar','جامايكا',114),(115,'ar','اليابان',115),(116,'ar','جيرسي',116),(117,'ar','الأردن',117),(118,'ar','كازاخستان',118),(119,'ar','كينيا',119),(120,'ar','كيريباس',120),(121,'ar','كوسوفو',121),(122,'ar','الكويت',122),(123,'ar','قرغيزستان',123),(124,'ar','لاوس',124),(125,'ar','لاتفيا',125),(126,'ar','لبنان',126),(127,'ar','ليسوتو',127),(128,'ar','ليبيريا',128),(129,'ar','ليبيا',129),(130,'ar','ليختنشتاين',130),(131,'ar','ليتوانيا',131),(132,'ar','لوكسمبورغ',132),(133,'ar','ماكاو SAR الصين',133),(134,'ar','مقدونيا',134),(135,'ar','مدغشقر',135),(136,'ar','مالاوي',136),(137,'ar','ماليزيا',137),(138,'ar','جزر المالديف',138),(139,'ar','مالي',139),(140,'ar','مالطا',140),(141,'ar','جزر مارشال',141),(142,'ar','مارتينيك',142),(143,'ar','موريتانيا',143),(144,'ar','موريشيوس',144),(145,'ar','ضائع',145),(146,'ar','المكسيك',146),(147,'ar','ميكرونيزيا',147),(148,'ar','مولدوفا',148),(149,'ar','موناكو',149),(150,'ar','منغوليا',150),(151,'ar','الجبل الأسود',151),(152,'ar','مونتسيرات',152),(153,'ar','المغرب',153),(154,'ar','موزمبيق',154),(155,'ar','ميانمار (بورما)',155),(156,'ar','ناميبيا',156),(157,'ar','ناورو',157),(158,'ar','نيبال',158),(159,'ar','نيبال',159),(160,'ar','كاليدونيا الجديدة',160),(161,'ar','نيوزيلاندا',161),(162,'ar','نيكاراغوا',162),(163,'ar','النيجر',163),(164,'ar','نيجيريا',164),(165,'ar','نيوي',165),(166,'ar','جزيرة نورفولك',166),(167,'ar','كوريا الشماليه',167),(168,'ar','جزر مريانا الشمالية',168),(169,'ar','النرويج',169),(170,'ar','سلطنة عمان',170),(171,'ar','باكستان',171),(172,'ar','بالاو',172),(173,'ar','الاراضي الفلسطينية',173),(174,'ar','بناما',174),(175,'ar','بابوا غينيا الجديدة',175),(176,'ar','باراغواي',176),(177,'ar','بيرو',177),(178,'ar','الفلبين',178),(179,'ar','جزر بيتكيرن',179),(180,'ar','بولندا',180),(181,'ar','البرتغال',181),(182,'ar','بورتوريكو',182),(183,'ar','دولة قطر',183),(184,'ar','جمع شمل',184),(185,'ar','رومانيا',185),(186,'ar','روسيا',186),(187,'ar','رواندا',187),(188,'ar','ساموا',188),(189,'ar','سان مارينو',189),(190,'ar','سانت كيتس ونيفيس',190),(191,'ar','المملكة العربية السعودية',191),(192,'ar','السنغال',192),(193,'ar','صربيا',193),(194,'ar','سيشيل',194),(195,'ar','سيراليون',195),(196,'ar','سنغافورة',196),(197,'ar','سينت مارتن',197),(198,'ar','سلوفاكيا',198),(199,'ar','سلوفينيا',199),(200,'ar','جزر سليمان',200),(201,'ar','الصومال',201),(202,'ar','جنوب أفريقيا',202),(203,'ar','جورجيا الجنوبية وجزر ساندويتش الجنوبية',203),(204,'ar','كوريا الجنوبية',204),(205,'ar','جنوب السودان',205),(206,'ar','إسبانيا',206),(207,'ar','سيريلانكا',207),(208,'ar','سانت بارتيليمي',208),(209,'ar','سانت هيلانة',209),(210,'ar','سانت كيتس ونيفيس',210),(211,'ar','شارع لوسيا',211),(212,'ar','سانت مارتن',212),(213,'ar','سانت بيير وميكلون',213),(214,'ar','سانت فنسنت وجزر غرينادين',214),(215,'ar','السودان',215),(216,'ar','سورينام',216),(217,'ar','سفالبارد وجان ماين',217),(218,'ar','سوازيلاند',218),(219,'ar','السويد',219),(220,'ar','سويسرا',220),(221,'ar','سوريا',221),(222,'ar','تايوان',222),(223,'ar','طاجيكستان',223),(224,'ar','تنزانيا',224),(225,'ar','تايلاند',225),(226,'ar','تيمور',226),(227,'ar','توجو',227),(228,'ar','توكيلاو',228),(229,'ar','تونغا',229),(230,'ar','ترينيداد وتوباغو',230),(231,'ar','تريستان دا كونها',231),(232,'ar','تونس',232),(233,'ar','ديك رومي',233),(234,'ar','تركمانستان',234),(235,'ar','جزر تركس وكايكوس',235),(236,'ar','توفالو',236),(237,'ar','جزر الولايات المتحدة البعيدة',237),(238,'ar','جزر فيرجن الأمريكية',238),(239,'ar','أوغندا',239),(240,'ar','أوكرانيا',240),(241,'ar','الإمارات العربية المتحدة',241),(242,'ar','المملكة المتحدة',242),(243,'ar','الأمم المتحدة',243),(244,'ar','الولايات المتحدة الأمريكية',244),(245,'ar','أوروغواي',245),(246,'ar','أوزبكستان',246),(247,'ar','فانواتو',247),(248,'ar','مدينة الفاتيكان',248),(249,'ar','فنزويلا',249),(250,'ar','فيتنام',250),(251,'ar','واليس وفوتونا',251),(252,'ar','الصحراء الغربية',252),(253,'ar','اليمن',253),(254,'ar','زامبيا',254),(255,'ar','زيمبابوي',255),(256,'fa','افغانستان',1),(257,'fa','جزایر الند',2),(258,'fa','آلبانی',3),(259,'fa','الجزایر',4),(260,'fa','ساموآ آمریکایی',5),(261,'fa','آندورا',6),(262,'fa','آنگولا',7),(263,'fa','آنگولا',8),(264,'fa','جنوبگان',9),(265,'fa','آنتیگوا و باربودا',10),(266,'fa','آرژانتین',11),(267,'fa','ارمنستان',12),(268,'fa','آروبا',13),(269,'fa','جزیره صعود',14),(270,'fa','استرالیا',15),(271,'fa','اتریش',16),(272,'fa','آذربایجان',17),(273,'fa','باهاما',18),(274,'fa','بحرین',19),(275,'fa','بنگلادش',20),(276,'fa','باربادوس',21),(277,'fa','بلاروس',22),(278,'fa','بلژیک',23),(279,'fa','بلژیک',24),(280,'fa','بنین',25),(281,'fa','برمودا',26),(282,'fa','بوتان',27),(283,'fa','بولیوی',28),(284,'fa','بوسنی و هرزگوین',29),(285,'fa','بوتسوانا',30),(286,'fa','برزیل',31),(287,'fa','قلمرو اقیانوس هند انگلیس',32),(288,'fa','جزایر ویرجین انگلیس',33),(289,'fa','برونئی',34),(290,'fa','بلغارستان',35),(291,'fa','بورکینا فاسو',36),(292,'fa','بوروندی',37),(293,'fa','کامبوج',38),(294,'fa','کامرون',39),(295,'fa','کانادا',40),(296,'fa','جزایر قناری',41),(297,'fa','کیپ ورد',42),(298,'fa','کارائیب هلند',43),(299,'fa','Cayman Islands',44),(300,'fa','جمهوری آفریقای مرکزی',45),(301,'fa','سوتا و ملیلا',46),(302,'fa','چاد',47),(303,'fa','شیلی',48),(304,'fa','چین',49),(305,'fa','جزیره کریسمس',50),(306,'fa','جزایر کوکو (Keeling)',51),(307,'fa','کلمبیا',52),(308,'fa','کومور',53),(309,'fa','کنگو - برزاویل',54),(310,'fa','کنگو - کینشاسا',55),(311,'fa','جزایر کوک',56),(312,'fa','کاستاریکا',57),(313,'fa','ساحل عاج',58),(314,'fa','کرواسی',59),(315,'fa','کوبا',60),(316,'fa','کوراسائو',61),(317,'fa','قبرس',62),(318,'fa','چک',63),(319,'fa','دانمارک',64),(320,'fa','دیگو گارسیا',65),(321,'fa','جیبوتی',66),(322,'fa','دومینیکا',67),(323,'fa','جمهوری دومینیکن',68),(324,'fa','اکوادور',69),(325,'fa','مصر',70),(326,'fa','السالوادور',71),(327,'fa','گینه استوایی',72),(328,'fa','اریتره',73),(329,'fa','استونی',74),(330,'fa','اتیوپی',75),(331,'fa','منطقه یورو',76),(332,'fa','جزایر فالکلند',77),(333,'fa','جزایر فارو',78),(334,'fa','فیجی',79),(335,'fa','فنلاند',80),(336,'fa','فرانسه',81),(337,'fa','گویان فرانسه',82),(338,'fa','پلی‌نزی فرانسه',83),(339,'fa','سرزمین های جنوبی فرانسه',84),(340,'fa','گابن',85),(341,'fa','گامبیا',86),(342,'fa','جورجیا',87),(343,'fa','آلمان',88),(344,'fa','غنا',89),(345,'fa','جبل الطارق',90),(346,'fa','یونان',91),(347,'fa','گرینلند',92),(348,'fa','گرنادا',93),(349,'fa','گوادلوپ',94),(350,'fa','گوام',95),(351,'fa','گواتمالا',96),(352,'fa','گورنسی',97),(353,'fa','گینه',98),(354,'fa','گینه بیسائو',99),(355,'fa','گویان',100),(356,'fa','هائیتی',101),(357,'fa','هندوراس',102),(358,'fa','هنگ کنگ SAR چین',103),(359,'fa','مجارستان',104),(360,'fa','ایسلند',105),(361,'fa','هند',106),(362,'fa','اندونزی',107),(363,'fa','ایران',108),(364,'fa','عراق',109),(365,'fa','ایرلند',110),(366,'fa','جزیره من',111),(367,'fa','اسرائيل',112),(368,'fa','ایتالیا',113),(369,'fa','جامائیکا',114),(370,'fa','ژاپن',115),(371,'fa','پیراهن ورزشی',116),(372,'fa','اردن',117),(373,'fa','قزاقستان',118),(374,'fa','کنیا',119),(375,'fa','کیریباتی',120),(376,'fa','کوزوو',121),(377,'fa','کویت',122),(378,'fa','قرقیزستان',123),(379,'fa','لائوس',124),(380,'fa','لتونی',125),(381,'fa','لبنان',126),(382,'fa','لسوتو',127),(383,'fa','لیبریا',128),(384,'fa','لیبی',129),(385,'fa','لیختن اشتاین',130),(386,'fa','لیتوانی',131),(387,'fa','لوکزامبورگ',132),(388,'fa','ماکائو SAR چین',133),(389,'fa','مقدونیه',134),(390,'fa','ماداگاسکار',135),(391,'fa','مالاوی',136),(392,'fa','مالزی',137),(393,'fa','مالدیو',138),(394,'fa','مالی',139),(395,'fa','مالت',140),(396,'fa','جزایر مارشال',141),(397,'fa','مارتینیک',142),(398,'fa','موریتانی',143),(399,'fa','موریس',144),(400,'fa','گمشده',145),(401,'fa','مکزیک',146),(402,'fa','میکرونزی',147),(403,'fa','مولداوی',148),(404,'fa','موناکو',149),(405,'fa','مغولستان',150),(406,'fa','مونته نگرو',151),(407,'fa','مونتسرات',152),(408,'fa','مراکش',153),(409,'fa','موزامبیک',154),(410,'fa','میانمار (برمه)',155),(411,'fa','ناميبيا',156),(412,'fa','نائورو',157),(413,'fa','نپال',158),(414,'fa','هلند',159),(415,'fa','کالدونیای جدید',160),(416,'fa','نیوزلند',161),(417,'fa','نیکاراگوئه',162),(418,'fa','نیجر',163),(419,'fa','نیجریه',164),(420,'fa','نیو',165),(421,'fa','جزیره نورفولک',166),(422,'fa','کره شمالی',167),(423,'fa','جزایر ماریانای شمالی',168),(424,'fa','نروژ',169),(425,'fa','عمان',170),(426,'fa','پاکستان',171),(427,'fa','پالائو',172),(428,'fa','سرزمین های فلسطینی',173),(429,'fa','پاناما',174),(430,'fa','پاپوا گینه نو',175),(431,'fa','پاراگوئه',176),(432,'fa','پرو',177),(433,'fa','فیلیپین',178),(434,'fa','جزایر پیکریرن',179),(435,'fa','لهستان',180),(436,'fa','کشور پرتغال',181),(437,'fa','پورتوریکو',182),(438,'fa','قطر',183),(439,'fa','تجدید دیدار',184),(440,'fa','رومانی',185),(441,'fa','روسیه',186),(442,'fa','رواندا',187),(443,'fa','ساموآ',188),(444,'fa','سان مارینو',189),(445,'fa','سنت کیتس و نوویس',190),(446,'fa','عربستان سعودی',191),(447,'fa','سنگال',192),(448,'fa','صربستان',193),(449,'fa','سیشل',194),(450,'fa','سیرالئون',195),(451,'fa','سنگاپور',196),(452,'fa','سینت ماارتن',197),(453,'fa','اسلواکی',198),(454,'fa','اسلوونی',199),(455,'fa','جزایر سلیمان',200),(456,'fa','سومالی',201),(457,'fa','آفریقای جنوبی',202),(458,'fa','جزایر جورجیا جنوبی و جزایر ساندویچ جنوبی',203),(459,'fa','کره جنوبی',204),(460,'fa','سودان جنوبی',205),(461,'fa','اسپانیا',206),(462,'fa','سری لانکا',207),(463,'fa','سنت بارتلی',208),(464,'fa','سنت هلنا',209),(465,'fa','سنت کیتز و نوویس',210),(466,'fa','سنت لوسیا',211),(467,'fa','سنت مارتین',212),(468,'fa','سنت پیر و میکلون',213),(469,'fa','سنت وینسنت و گرنادینها',214),(470,'fa','سودان',215),(471,'fa','سورینام',216),(472,'fa','اسوالبارد و جان ماین',217),(473,'fa','سوازیلند',218),(474,'fa','سوئد',219),(475,'fa','سوئیس',220),(476,'fa','سوریه',221),(477,'fa','تایوان',222),(478,'fa','تاجیکستان',223),(479,'fa','تانزانیا',224),(480,'fa','تایلند',225),(481,'fa','تیمور-لست',226),(482,'fa','رفتن',227),(483,'fa','توکلو',228),(484,'fa','تونگا',229),(485,'fa','ترینیداد و توباگو',230),(486,'fa','تریستان دا کانونا',231),(487,'fa','تونس',232),(488,'fa','بوقلمون',233),(489,'fa','ترکمنستان',234),(490,'fa','جزایر تورکس و کایکوس',235),(491,'fa','تووالو',236),(492,'fa','جزایر دور افتاده ایالات متحده آمریکا',237),(493,'fa','جزایر ویرجین ایالات متحده',238),(494,'fa','اوگاندا',239),(495,'fa','اوکراین',240),(496,'fa','امارات متحده عربی',241),(497,'fa','انگلستان',242),(498,'fa','سازمان ملل',243),(499,'fa','ایالات متحده',244),(500,'fa','اروگوئه',245),(501,'fa','ازبکستان',246),(502,'fa','وانواتو',247),(503,'fa','شهر واتیکان',248),(504,'fa','ونزوئلا',249),(505,'fa','ویتنام',250),(506,'fa','والیس و فوتونا',251),(507,'fa','صحرای غربی',252),(508,'fa','یمن',253),(509,'fa','زامبیا',254),(510,'fa','زیمبابوه',255),(511,'pt_BR','Afeganistão',1),(512,'pt_BR','Ilhas Åland',2),(513,'pt_BR','Albânia',3),(514,'pt_BR','Argélia',4),(515,'pt_BR','Samoa Americana',5),(516,'pt_BR','Andorra',6),(517,'pt_BR','Angola',7),(518,'pt_BR','Angola',8),(519,'pt_BR','Antártico',9),(520,'pt_BR','Antígua e Barbuda',10),(521,'pt_BR','Argentina',11),(522,'pt_BR','Armênia',12),(523,'pt_BR','Aruba',13),(524,'pt_BR','Ilha de escalada',14),(525,'pt_BR','Austrália',15),(526,'pt_BR','Áustria',16),(527,'pt_BR','Azerbaijão',17),(528,'pt_BR','Bahamas',18),(529,'pt_BR','Bahrain',19),(530,'pt_BR','Bangladesh',20),(531,'pt_BR','Barbados',21),(532,'pt_BR','Bielorrússia',22),(533,'pt_BR','Bélgica',23),(534,'pt_BR','Bélgica',24),(535,'pt_BR','Benin',25),(536,'pt_BR','Bermuda',26),(537,'pt_BR','Butão',27),(538,'pt_BR','Bolívia',28),(539,'pt_BR','Bósnia e Herzegovina',29),(540,'pt_BR','Botsuana',30),(541,'pt_BR','Brasil',31),(542,'pt_BR','Território Britânico do Oceano Índico',32),(543,'pt_BR','Ilhas Virgens Britânicas',33),(544,'pt_BR','Brunei',34),(545,'pt_BR','Bulgária',35),(546,'pt_BR','Burkina Faso',36),(547,'pt_BR','Burundi',37),(548,'pt_BR','Camboja',38),(549,'pt_BR','Camarões',39),(550,'pt_BR','Canadá',40),(551,'pt_BR','Ilhas Canárias',41),(552,'pt_BR','Cabo Verde',42),(553,'pt_BR','Holanda do Caribe',43),(554,'pt_BR','Ilhas Cayman',44),(555,'pt_BR','República Centro-Africana',45),(556,'pt_BR','Ceuta e Melilla',46),(557,'pt_BR','Chade',47),(558,'pt_BR','Chile',48),(559,'pt_BR','China',49),(560,'pt_BR','Ilha Christmas',50),(561,'pt_BR','Ilhas Cocos (Keeling)',51),(562,'pt_BR','Colômbia',52),(563,'pt_BR','Comores',53),(564,'pt_BR','Congo - Brazzaville',54),(565,'pt_BR','Congo - Kinshasa',55),(566,'pt_BR','Ilhas Cook',56),(567,'pt_BR','Costa Rica',57),(568,'pt_BR','Costa do Marfim',58),(569,'pt_BR','Croácia',59),(570,'pt_BR','Cuba',60),(571,'pt_BR','Curaçao',61),(572,'pt_BR','Chipre',62),(573,'pt_BR','Czechia',63),(574,'pt_BR','Dinamarca',64),(575,'pt_BR','Diego Garcia',65),(576,'pt_BR','Djibuti',66),(577,'pt_BR','Dominica',67),(578,'pt_BR','República Dominicana',68),(579,'pt_BR','Equador',69),(580,'pt_BR','Egito',70),(581,'pt_BR','El Salvador',71),(582,'pt_BR','Guiné Equatorial',72),(583,'pt_BR','Eritreia',73),(584,'pt_BR','Estônia',74),(585,'pt_BR','Etiópia',75),(586,'pt_BR','Zona Euro',76),(587,'pt_BR','Ilhas Malvinas',77),(588,'pt_BR','Ilhas Faroe',78),(589,'pt_BR','Fiji',79),(590,'pt_BR','Finlândia',80),(591,'pt_BR','França',81),(592,'pt_BR','Guiana Francesa',82),(593,'pt_BR','Polinésia Francesa',83),(594,'pt_BR','Territórios Franceses do Sul',84),(595,'pt_BR','Gabão',85),(596,'pt_BR','Gâmbia',86),(597,'pt_BR','Geórgia',87),(598,'pt_BR','Alemanha',88),(599,'pt_BR','Gana',89),(600,'pt_BR','Gibraltar',90),(601,'pt_BR','Grécia',91),(602,'pt_BR','Gronelândia',92),(603,'pt_BR','Granada',93),(604,'pt_BR','Guadalupe',94),(605,'pt_BR','Guam',95),(606,'pt_BR','Guatemala',96),(607,'pt_BR','Guernsey',97),(608,'pt_BR','Guiné',98),(609,'pt_BR','Guiné-Bissau',99),(610,'pt_BR','Guiana',100),(611,'pt_BR','Haiti',101),(612,'pt_BR','Honduras',102),(613,'pt_BR','Região Administrativa Especial de Hong Kong, China',103),(614,'pt_BR','Hungria',104),(615,'pt_BR','Islândia',105),(616,'pt_BR','Índia',106),(617,'pt_BR','Indonésia',107),(618,'pt_BR','Irã',108),(619,'pt_BR','Iraque',109),(620,'pt_BR','Irlanda',110),(621,'pt_BR','Ilha de Man',111),(622,'pt_BR','Israel',112),(623,'pt_BR','Itália',113),(624,'pt_BR','Jamaica',114),(625,'pt_BR','Japão',115),(626,'pt_BR','Jersey',116),(627,'pt_BR','Jordânia',117),(628,'pt_BR','Cazaquistão',118),(629,'pt_BR','Quênia',119),(630,'pt_BR','Quiribati',120),(631,'pt_BR','Kosovo',121),(632,'pt_BR','Kuwait',122),(633,'pt_BR','Quirguistão',123),(634,'pt_BR','Laos',124),(635,'pt_BR','Letônia',125),(636,'pt_BR','Líbano',126),(637,'pt_BR','Lesoto',127),(638,'pt_BR','Libéria',128),(639,'pt_BR','Líbia',129),(640,'pt_BR','Liechtenstein',130),(641,'pt_BR','Lituânia',131),(642,'pt_BR','Luxemburgo',132),(643,'pt_BR','Macau SAR China',133),(644,'pt_BR','Macedônia',134),(645,'pt_BR','Madagascar',135),(646,'pt_BR','Malawi',136),(647,'pt_BR','Malásia',137),(648,'pt_BR','Maldivas',138),(649,'pt_BR','Mali',139),(650,'pt_BR','Malta',140),(651,'pt_BR','Ilhas Marshall',141),(652,'pt_BR','Martinica',142),(653,'pt_BR','Mauritânia',143),(654,'pt_BR','Maurício',144),(655,'pt_BR','Maiote',145),(656,'pt_BR','México',146),(657,'pt_BR','Micronésia',147),(658,'pt_BR','Moldávia',148),(659,'pt_BR','Mônaco',149),(660,'pt_BR','Mongólia',150),(661,'pt_BR','Montenegro',151),(662,'pt_BR','Montserrat',152),(663,'pt_BR','Marrocos',153),(664,'pt_BR','Moçambique',154),(665,'pt_BR','Mianmar (Birmânia)',155),(666,'pt_BR','Namíbia',156),(667,'pt_BR','Nauru',157),(668,'pt_BR','Nepal',158),(669,'pt_BR','Holanda',159),(670,'pt_BR','Nova Caledônia',160),(671,'pt_BR','Nova Zelândia',161),(672,'pt_BR','Nicarágua',162),(673,'pt_BR','Níger',163),(674,'pt_BR','Nigéria',164),(675,'pt_BR','Niue',165),(676,'pt_BR','Ilha Norfolk',166),(677,'pt_BR','Coréia do Norte',167),(678,'pt_BR','Ilhas Marianas do Norte',168),(679,'pt_BR','Noruega',169),(680,'pt_BR','Omã',170),(681,'pt_BR','Paquistão',171),(682,'pt_BR','Palau',172),(683,'pt_BR','Territórios Palestinos',173),(684,'pt_BR','Panamá',174),(685,'pt_BR','Papua Nova Guiné',175),(686,'pt_BR','Paraguai',176),(687,'pt_BR','Peru',177),(688,'pt_BR','Filipinas',178),(689,'pt_BR','Ilhas Pitcairn',179),(690,'pt_BR','Polônia',180),(691,'pt_BR','Portugal',181),(692,'pt_BR','Porto Rico',182),(693,'pt_BR','Catar',183),(694,'pt_BR','Reunião',184),(695,'pt_BR','Romênia',185),(696,'pt_BR','Rússia',186),(697,'pt_BR','Ruanda',187),(698,'pt_BR','Samoa',188),(699,'pt_BR','São Marinho',189),(700,'pt_BR','São Cristóvão e Nevis',190),(701,'pt_BR','Arábia Saudita',191),(702,'pt_BR','Senegal',192),(703,'pt_BR','Sérvia',193),(704,'pt_BR','Seychelles',194),(705,'pt_BR','Serra Leoa',195),(706,'pt_BR','Cingapura',196),(707,'pt_BR','São Martinho',197),(708,'pt_BR','Eslováquia',198),(709,'pt_BR','Eslovênia',199),(710,'pt_BR','Ilhas Salomão',200),(711,'pt_BR','Somália',201),(712,'pt_BR','África do Sul',202),(713,'pt_BR','Ilhas Geórgia do Sul e Sandwich do Sul',203),(714,'pt_BR','Coréia do Sul',204),(715,'pt_BR','Sudão do Sul',205),(716,'pt_BR','Espanha',206),(717,'pt_BR','Sri Lanka',207),(718,'pt_BR','São Bartolomeu',208),(719,'pt_BR','Santa Helena',209),(720,'pt_BR','São Cristóvão e Nevis',210),(721,'pt_BR','Santa Lúcia',211),(722,'pt_BR','São Martinho',212),(723,'pt_BR','São Pedro e Miquelon',213),(724,'pt_BR','São Vicente e Granadinas',214),(725,'pt_BR','Sudão',215),(726,'pt_BR','Suriname',216),(727,'pt_BR','Svalbard e Jan Mayen',217),(728,'pt_BR','Suazilândia',218),(729,'pt_BR','Suécia',219),(730,'pt_BR','Suíça',220),(731,'pt_BR','Síria',221),(732,'pt_BR','Taiwan',222),(733,'pt_BR','Tajiquistão',223),(734,'pt_BR','Tanzânia',224),(735,'pt_BR','Tailândia',225),(736,'pt_BR','Timor-Leste',226),(737,'pt_BR','Togo',227),(738,'pt_BR','Tokelau',228),(739,'pt_BR','Tonga',229),(740,'pt_BR','Trinidad e Tobago',230),(741,'pt_BR','Tristan da Cunha',231),(742,'pt_BR','Tunísia',232),(743,'pt_BR','Turquia',233),(744,'pt_BR','Turquemenistão',234),(745,'pt_BR','Ilhas Turks e Caicos',235),(746,'pt_BR','Tuvalu',236),(747,'pt_BR','Ilhas periféricas dos EUA',237),(748,'pt_BR','Ilhas Virgens dos EUA',238),(749,'pt_BR','Uganda',239),(750,'pt_BR','Ucrânia',240),(751,'pt_BR','Emirados Árabes Unidos',241),(752,'pt_BR','Reino Unido',242),(753,'pt_BR','Nações Unidas',243),(754,'pt_BR','Estados Unidos',244),(755,'pt_BR','Uruguai',245),(756,'pt_BR','Uzbequistão',246),(757,'pt_BR','Vanuatu',247),(758,'pt_BR','Cidade do Vaticano',248),(759,'pt_BR','Venezuela',249),(760,'pt_BR','Vietnã',250),(761,'pt_BR','Wallis e Futuna',251),(762,'pt_BR','Saara Ocidental',252),(763,'pt_BR','Iêmen',253),(764,'pt_BR','Zâmbia',254),(765,'pt_BR','Zimbábue',255);
/*!40000 ALTER TABLE `country_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (3,'OMR','العملة العمانية','2020-09-23 01:43:36','2020-09-23 01:43:36','ريال عماني');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_exchange_rates`
--

DROP TABLE IF EXISTS `currency_exchange_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_exchange_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`),
  CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_exchange_rates`
--

LOCK TABLES `currency_exchange_rates` WRITE;
/*!40000 ALTER TABLE `currency_exchange_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_exchange_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_groups`
--

DROP TABLE IF EXISTS `customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_groups_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_groups`
--

LOCK TABLES `customer_groups` WRITE;
/*!40000 ALTER TABLE `customer_groups` DISABLE KEYS */;
INSERT INTO `customer_groups` VALUES (1,'Guest',0,NULL,NULL,'guest'),(2,'General',0,NULL,NULL,'general'),(3,'Wholesale',0,NULL,NULL,'wholesale');
/*!40000 ALTER TABLE `customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_password_resets`
--

DROP TABLE IF EXISTS `customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `customer_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_password_resets`
--

LOCK TABLES `customer_password_resets` WRITE;
/*!40000 ALTER TABLE `customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int(10) unsigned DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  UNIQUE KEY `customers_api_token_unique` (`api_token`),
  KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_purchased`
--

DROP TABLE IF EXISTS `downloadable_link_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_purchased` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_bought` int(11) NOT NULL DEFAULT '0',
  `download_used` int(11) NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `order_item_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`),
  CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_purchased`
--

LOCK TABLES `downloadable_link_purchased` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_sources`
--

DROP TABLE IF EXISTS `inventory_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_sources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_sources_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_sources`
--

LOCK TABLES `inventory_sources` WRITE;
/*!40000 ALTER TABLE `inventory_sources` DISABLE KEYS */;
INSERT INTO `inventory_sources` VALUES (1,'default','Default',NULL,'Detroit Warehouse','warehouse@example.com','1234567899',NULL,'US','MI','Detroit','12th Street','48127',0,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `inventory_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `invoice_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_items`
--

LOCK TABLES `invoice_items` WRITE;
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `order_id` int(10) unsigned DEFAULT NULL,
  `order_address_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_order_id_foreign` (`order_id`),
  KEY `invoices_order_address_id_foreign` (`order_address_id`),
  CONSTRAINT `invoices_order_address_id_foreign` FOREIGN KEY (`order_address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `locale_image` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales`
--

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
INSERT INTO `locales` VALUES (1,'en','English',NULL,NULL,'ltr',NULL),(4,'ar','العربية','2020-09-23 01:42:35','2020-09-23 01:42:35','rtl',NULL);
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_admin_password_resets_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2018_06_12_111907_create_admins_table',1),(5,'2018_06_13_055341_create_roles_table',1),(6,'2018_07_05_130148_create_attributes_table',1),(7,'2018_07_05_132854_create_attribute_translations_table',1),(8,'2018_07_05_135150_create_attribute_families_table',1),(9,'2018_07_05_135152_create_attribute_groups_table',1),(10,'2018_07_05_140832_create_attribute_options_table',1),(11,'2018_07_05_140856_create_attribute_option_translations_table',1),(12,'2018_07_05_142820_create_categories_table',1),(13,'2018_07_10_055143_create_locales_table',1),(14,'2018_07_20_054426_create_countries_table',1),(15,'2018_07_20_054502_create_currencies_table',1),(16,'2018_07_20_054542_create_currency_exchange_rates_table',1),(17,'2018_07_20_064849_create_channels_table',1),(18,'2018_07_21_142836_create_category_translations_table',1),(19,'2018_07_23_110040_create_inventory_sources_table',1),(20,'2018_07_24_082635_create_customer_groups_table',1),(21,'2018_07_24_082930_create_customers_table',1),(22,'2018_07_24_083025_create_customer_addresses_table',1),(23,'2018_07_27_065727_create_products_table',1),(24,'2018_07_27_070011_create_product_attribute_values_table',1),(25,'2018_07_27_092623_create_product_reviews_table',1),(26,'2018_07_27_113941_create_product_images_table',1),(27,'2018_07_27_113956_create_product_inventories_table',1),(28,'2018_08_03_114203_create_sliders_table',1),(29,'2018_08_30_064755_create_tax_categories_table',1),(30,'2018_08_30_065042_create_tax_rates_table',1),(31,'2018_08_30_065840_create_tax_mappings_table',1),(32,'2018_09_05_150444_create_cart_table',1),(33,'2018_09_05_150915_create_cart_items_table',1),(34,'2018_09_11_064045_customer_password_resets',1),(35,'2018_09_19_092845_create_cart_address',1),(36,'2018_09_19_093453_create_cart_payment',1),(37,'2018_09_19_093508_create_cart_shipping_rates_table',1),(38,'2018_09_20_060658_create_core_config_table',1),(39,'2018_09_27_113154_create_orders_table',1),(40,'2018_09_27_113207_create_order_items_table',1),(41,'2018_09_27_113405_create_order_address_table',1),(42,'2018_09_27_115022_create_shipments_table',1),(43,'2018_09_27_115029_create_shipment_items_table',1),(44,'2018_09_27_115135_create_invoices_table',1),(45,'2018_09_27_115144_create_invoice_items_table',1),(46,'2018_10_01_095504_create_order_payment_table',1),(47,'2018_10_03_025230_create_wishlist_table',1),(48,'2018_10_12_101803_create_country_translations_table',1),(49,'2018_10_12_101913_create_country_states_table',1),(50,'2018_10_12_101923_create_country_state_translations_table',1),(51,'2018_11_15_153257_alter_order_table',1),(52,'2018_11_15_163729_alter_invoice_table',1),(53,'2018_11_16_173504_create_subscribers_list_table',1),(54,'2018_11_17_165758_add_is_verified_column_in_customers_table',1),(55,'2018_11_21_144411_create_cart_item_inventories_table',1),(56,'2018_11_26_110500_change_gender_column_in_customers_table',1),(57,'2018_11_27_174449_change_content_column_in_sliders_table',1),(58,'2018_12_05_132625_drop_foreign_key_core_config_table',1),(59,'2018_12_05_132629_alter_core_config_table',1),(60,'2018_12_06_185202_create_product_flat_table',1),(61,'2018_12_21_101307_alter_channels_table',1),(62,'2018_12_24_123812_create_channel_inventory_sources_table',1),(63,'2018_12_24_184402_alter_shipments_table',1),(64,'2018_12_26_165327_create_product_ordered_inventories_table',1),(65,'2018_12_31_161114_alter_channels_category_table',1),(66,'2019_01_11_122452_add_vendor_id_column_in_product_inventories_table',1),(67,'2019_01_25_124522_add_updated_at_column_in_product_flat_table',1),(68,'2019_01_29_123053_add_min_price_and_max_price_column_in_product_flat_table',1),(69,'2019_01_31_164117_update_value_column_type_to_text_in_core_config_table',1),(70,'2019_02_21_145238_alter_product_reviews_table',1),(71,'2019_02_21_152709_add_swatch_type_column_in_attributes_table',1),(72,'2019_02_21_153035_alter_customer_id_in_product_reviews_table',1),(73,'2019_02_21_153851_add_swatch_value_columns_in_attribute_options_table',1),(74,'2019_03_15_123337_add_display_mode_column_in_categories_table',1),(75,'2019_03_28_103658_add_notes_column_in_customers_table',1),(76,'2019_04_24_155820_alter_product_flat_table',1),(77,'2019_05_13_024320_remove_tables',1),(78,'2019_05_13_024321_create_cart_rules_table',1),(79,'2019_05_13_024322_create_cart_rule_channels_table',1),(80,'2019_05_13_024323_create_cart_rule_customer_groups_table',1),(81,'2019_05_13_024324_create_cart_rule_translations_table',1),(82,'2019_05_13_024325_create_cart_rule_customers_table',1),(83,'2019_05_13_024326_create_cart_rule_coupons_table',1),(84,'2019_05_13_024327_create_cart_rule_coupon_usage_table',1),(85,'2019_05_22_165833_update_zipcode_column_type_to_varchar_in_cart_address_table',1),(86,'2019_05_23_113407_add_remaining_column_in_product_flat_table',1),(87,'2019_05_23_155520_add_discount_columns_in_invoice_items_table',1),(88,'2019_05_23_184029_rename_discount_columns_in_cart_table',1),(89,'2019_06_04_114009_add_phone_column_in_customers_table',1),(90,'2019_06_06_195905_update_custom_price_to_nullable_in_cart_items',1),(91,'2019_06_15_183412_add_code_column_in_customer_groups_table',1),(92,'2019_06_17_180258_create_product_downloadable_samples_table',1),(93,'2019_06_17_180314_create_product_downloadable_sample_translations_table',1),(94,'2019_06_17_180325_create_product_downloadable_links_table',1),(95,'2019_06_17_180346_create_product_downloadable_link_translations_table',1),(96,'2019_06_19_162817_remove_unique_in_phone_column_in_customers_table',1),(97,'2019_06_21_130512_update_weight_column_deafult_value_in_cart_items_table',1),(98,'2019_06_21_202249_create_downloadable_link_purchased_table',1),(99,'2019_07_02_180307_create_booking_products_table',1),(100,'2019_07_05_114157_add_symbol_column_in_currencies_table',1),(101,'2019_07_05_154415_create_booking_product_default_slots_table',1),(102,'2019_07_05_154429_create_booking_product_appointment_slots_table',1),(103,'2019_07_05_154440_create_booking_product_event_tickets_table',1),(104,'2019_07_05_154451_create_booking_product_rental_slots_table',1),(105,'2019_07_05_154502_create_booking_product_table_slots_table',1),(106,'2019_07_11_151210_add_locale_id_in_category_translations',1),(107,'2019_07_23_033128_alter_locales_table',1),(108,'2019_07_23_174708_create_velocity_contents_table',1),(109,'2019_07_23_175212_create_velocity_contents_translations_table',1),(110,'2019_07_29_142734_add_use_in_flat_column_in_attributes_table',1),(111,'2019_07_30_153530_create_cms_pages_table',1),(112,'2019_07_31_143339_create_category_filterable_attributes_table',1),(113,'2019_08_02_105320_create_product_grouped_products_table',1),(114,'2019_08_12_184925_add_additional_cloumn_in_wishlist_table',1),(115,'2019_08_20_170510_create_product_bundle_options_table',1),(116,'2019_08_20_170520_create_product_bundle_option_translations_table',1),(117,'2019_08_20_170528_create_product_bundle_option_products_table',1),(118,'2019_08_21_123707_add_seo_column_in_channels_table',1),(119,'2019_09_11_184511_create_refunds_table',1),(120,'2019_09_11_184519_create_refund_items_table',1),(121,'2019_09_26_163950_remove_channel_id_from_customers_table',1),(122,'2019_10_03_105451_change_rate_column_in_currency_exchange_rates_table',1),(123,'2019_10_21_105136_order_brands',1),(124,'2019_10_24_173358_change_postcode_column_type_in_order_address_table',1),(125,'2019_10_24_173437_change_postcode_column_type_in_cart_address_table',1),(126,'2019_10_24_173507_change_postcode_column_type_in_customer_addresses_table',1),(127,'2019_11_21_194541_add_column_url_path_to_category_translations',1),(128,'2019_11_21_194608_add_stored_function_to_get_url_path_of_category',1),(129,'2019_11_21_194627_add_trigger_to_category_translations',1),(130,'2019_11_21_194648_add_url_path_to_existing_category_translations',1),(131,'2019_11_21_194703_add_trigger_to_categories',1),(132,'2019_11_25_171136_add_applied_cart_rule_ids_column_in_cart_table',1),(133,'2019_11_25_171208_add_applied_cart_rule_ids_column_in_cart_items_table',1),(134,'2019_11_30_124437_add_applied_cart_rule_ids_column_in_orders_table',1),(135,'2019_11_30_165644_add_discount_columns_in_cart_shipping_rates_table',1),(136,'2019_12_03_175253_create_remove_catalog_rule_tables',1),(137,'2019_12_03_184613_create_catalog_rules_table',1),(138,'2019_12_03_184651_create_catalog_rule_channels_table',1),(139,'2019_12_03_184732_create_catalog_rule_customer_groups_table',1),(140,'2019_12_06_101110_create_catalog_rule_products_table',1),(141,'2019_12_06_110507_create_catalog_rule_product_prices_table',1),(142,'2019_12_30_155256_create_velocity_meta_data',1),(143,'2020_01_02_201029_add_api_token_columns',1),(144,'2020_01_06_173505_alter_trigger_category_translations',1),(145,'2020_01_06_173524_alter_stored_function_url_path_category',1),(146,'2020_01_06_195305_alter_trigger_on_categories',1),(147,'2020_01_09_154851_add_shipping_discount_columns_in_orders_table',1),(148,'2020_01_09_202815_add_inventory_source_name_column_in_shipments_table',1),(149,'2020_01_10_122226_update_velocity_meta_data',1),(150,'2020_01_10_151902_customer_address_improvements',1),(151,'2020_01_13_131431_alter_float_value_column_type_in_product_attribute_values_table',1),(152,'2020_01_13_155803_add_velocity_locale_icon',1),(153,'2020_01_13_192149_add_category_velocity_meta_data',1),(154,'2020_01_14_191854_create_cms_page_translations_table',1),(155,'2020_01_14_192206_remove_columns_from_cms_pages_table',1),(156,'2020_01_15_130209_create_cms_page_channels_table',1),(157,'2020_01_15_145637_add_product_policy',1),(158,'2020_01_15_152121_add_banner_link',1),(159,'2020_01_28_102422_add_new_column_and_rename_name_column_in_customer_addresses_table',1),(160,'2020_01_29_124748_alter_name_column_in_country_state_translations_table',1),(161,'2020_02_18_165639_create_bookings_table',1),(162,'2020_02_21_121201_create_booking_product_event_ticket_translations_table',1),(163,'2020_02_24_190025_add_is_comparable_column_in_attributes_table',1),(164,'2020_02_25_181902_propagate_company_name',1),(165,'2020_02_26_163908_change_column_type_in_cart_rules_table',1),(166,'2020_02_28_105104_fix_order_columns',1),(167,'2020_02_28_111958_create_customer_compare_products_table',1),(168,'2020_03_23_201431_alter_booking_products_table',1),(169,'2020_04_13_224524_add_locale_in_sliders_table',1),(170,'2020_04_16_130351_remove_channel_from_tax_category',1),(171,'2020_04_16_185147_add_table_addresses',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_brands`
--

DROP TABLE IF EXISTS `order_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `brand` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_brands_order_id_foreign` (`order_id`),
  KEY `order_brands_order_item_id_foreign` (`order_item_id`),
  KEY `order_brands_product_id_foreign` (`product_id`),
  KEY `order_brands_brand_foreign` (`brand`),
  CONSTRAINT `order_brands_brand_foreign` FOREIGN KEY (`brand`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_brands_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_brands_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_brands_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_brands`
--

LOCK TABLES `order_brands` WRITE;
/*!40000 ALTER TABLE `order_brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `total_weight` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` int(11) DEFAULT '0',
  `qty_shipped` int(11) DEFAULT '0',
  `qty_invoiced` int(11) DEFAULT '0',
  `qty_canceled` int(11) DEFAULT '0',
  `qty_refunded` int(11) DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_payment`
--

DROP TABLE IF EXISTS `order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_payment_order_id_foreign` (`order_id`),
  CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_payment`
--

LOCK TABLES `order_payment` WRITE;
/*!40000 ALTER TABLE `order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_vat_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `total_item_count` int(11) DEFAULT NULL,
  `total_qty_ordered` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `customer_id` int(10) unsigned DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int(10) unsigned DEFAULT NULL,
  `channel_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  KEY `orders_channel_id_foreign` (`channel_id`),
  CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute_values`
--

DROP TABLE IF EXISTS `product_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_attribute_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_value` text COLLATE utf8mb4_unicode_ci,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` json DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  KEY `product_attribute_values_product_id_foreign` (`product_id`),
  KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4290 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_values`
--

LOCK TABLES `product_attribute_values` WRITE;
/*!40000 ALTER TABLE `product_attribute_values` DISABLE KEYS */;
INSERT INTO `product_attribute_values` VALUES (1840,NULL,NULL,'1-variant-4-6',NULL,NULL,NULL,NULL,NULL,NULL,227,1),(1841,'en','default','1836-102',NULL,NULL,NULL,NULL,NULL,NULL,227,2),(1842,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,227,2),(1843,NULL,NULL,NULL,NULL,NULL,6.0000,NULL,NULL,NULL,227,11),(1844,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,227,22),(1845,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,227,8),(1846,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,227,23),(1847,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,227,24),(1848,NULL,NULL,'1-variant-15-6',NULL,NULL,NULL,NULL,NULL,NULL,228,1),(1849,'en','default','1836-102',NULL,NULL,NULL,NULL,NULL,NULL,228,2),(1850,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,228,2),(1851,NULL,NULL,NULL,NULL,NULL,6.0000,NULL,NULL,NULL,228,11),(1852,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,228,22),(1853,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,228,8),(1854,NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,228,23),(1855,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,228,24),(1856,NULL,NULL,'1-variant-4-7',NULL,NULL,NULL,NULL,NULL,NULL,229,1),(1857,'en','default','1836-102',NULL,NULL,NULL,NULL,NULL,NULL,229,2),(1858,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,229,2),(1859,NULL,NULL,NULL,NULL,NULL,6.0000,NULL,NULL,NULL,229,11),(1860,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,229,22),(1861,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,229,8),(1862,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,229,23),(1863,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,229,24),(1864,NULL,NULL,'1-variant-4-8',NULL,NULL,NULL,NULL,NULL,NULL,230,1),(1865,'en','default','1836-102',NULL,NULL,NULL,NULL,NULL,NULL,230,2),(1866,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,230,2),(1867,NULL,NULL,NULL,NULL,NULL,6.0000,NULL,NULL,NULL,230,11),(1868,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,230,22),(1869,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,230,8),(1870,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,230,23),(1871,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,230,24),(1872,NULL,NULL,'1-variant-4-9',NULL,NULL,NULL,NULL,NULL,NULL,231,1),(1873,'en','default','1836-102',NULL,NULL,NULL,NULL,NULL,NULL,231,2),(1874,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,231,2),(1875,NULL,NULL,NULL,NULL,NULL,6.0000,NULL,NULL,NULL,231,11),(1876,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,231,22),(1877,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,231,8),(1878,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,231,23),(1879,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,231,24),(1880,NULL,NULL,'1-variant-4-10',NULL,NULL,NULL,NULL,NULL,NULL,232,1),(1881,'en','default','1836-102',NULL,NULL,NULL,NULL,NULL,NULL,232,2),(1882,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,232,2),(1883,NULL,NULL,NULL,NULL,NULL,6.0000,NULL,NULL,NULL,232,11),(1884,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,232,22),(1885,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,232,8),(1886,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,232,23),(1887,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,232,24),(1888,NULL,NULL,'1-variant-4-11',NULL,NULL,NULL,NULL,NULL,NULL,233,1),(1889,'en','default','1836-102',NULL,NULL,NULL,NULL,NULL,NULL,233,2),(1890,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,233,2),(1891,NULL,NULL,NULL,NULL,NULL,6.0000,NULL,NULL,NULL,233,11),(1892,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,233,22),(1893,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,233,8),(1894,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,233,23),(1895,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,233,24),(1896,NULL,NULL,'1-variant-15-7',NULL,NULL,NULL,NULL,NULL,NULL,234,1),(1897,'en','default','1836-102',NULL,NULL,NULL,NULL,NULL,NULL,234,2),(1898,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,234,2),(1899,NULL,NULL,NULL,NULL,NULL,6.0000,NULL,NULL,NULL,234,11),(1900,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,234,22),(1901,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,234,8),(1902,NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,234,23),(1903,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,234,24),(1904,NULL,NULL,'1-variant-15-8',NULL,NULL,NULL,NULL,NULL,NULL,235,1),(1905,'en','default','1836-102',NULL,NULL,NULL,NULL,NULL,NULL,235,2),(1906,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,235,2),(1907,NULL,NULL,NULL,NULL,NULL,6.0000,NULL,NULL,NULL,235,11),(1908,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,235,22),(1909,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,235,8),(1910,NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,235,23),(1911,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,235,24),(1912,NULL,NULL,'1-variant-15-9',NULL,NULL,NULL,NULL,NULL,NULL,236,1),(1913,'en','default','1836-102',NULL,NULL,NULL,NULL,NULL,NULL,236,2),(1914,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,236,2),(1915,NULL,NULL,NULL,NULL,NULL,6.0000,NULL,NULL,NULL,236,11),(1916,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,236,22),(1917,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,236,8),(1918,NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,236,23),(1919,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,236,24),(1920,NULL,NULL,'1-variant-15-10',NULL,NULL,NULL,NULL,NULL,NULL,237,1),(1921,'en','default','1836-102',NULL,NULL,NULL,NULL,NULL,NULL,237,2),(1922,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,237,2),(1923,NULL,NULL,NULL,NULL,NULL,6.0000,NULL,NULL,NULL,237,11),(1924,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,237,22),(1925,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,237,8),(1926,NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,237,23),(1927,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,237,24),(1928,NULL,NULL,'1-variant-15-11',NULL,NULL,NULL,NULL,NULL,NULL,238,1),(1929,'en','default','1836-102',NULL,NULL,NULL,NULL,NULL,NULL,238,2),(1930,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,238,2),(1931,NULL,NULL,NULL,NULL,NULL,6.0000,NULL,NULL,NULL,238,11),(1932,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,238,22),(1933,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,238,8),(1934,NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,238,23),(1935,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,238,24),(1936,'en','default','<p>كعب مربع تقليد شكل ماركة كالورينا هريرا&nbsp;</p>',NULL,NULL,NULL,NULL,NULL,NULL,226,9),(1937,'en','default','<p>كعب مربع تقليد ماركة كالورينا هريرا</p>',NULL,NULL,NULL,NULL,NULL,NULL,226,10),(1938,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,226,1),(1939,'en','default','1836-102',NULL,NULL,NULL,NULL,NULL,NULL,226,2),(1940,NULL,NULL,'1836-102',NULL,NULL,NULL,NULL,NULL,NULL,226,3),(1941,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,226,4),(1942,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,226,5),(1943,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,226,6),(1944,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,226,7),(1945,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,226,8),(1946,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,226,26),(1947,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,226,16),(1948,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,226,17),(1949,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,226,18),(1950,NULL,NULL,'2-variant-4-7',NULL,NULL,NULL,NULL,NULL,NULL,240,1),(1951,'en','default','18387',NULL,NULL,NULL,NULL,NULL,NULL,240,2),(1952,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,240,2),(1953,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,240,11),(1954,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,240,22),(1955,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,240,8),(1956,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,240,23),(1957,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,240,24),(1958,NULL,NULL,'2-variant-15-7',NULL,NULL,NULL,NULL,NULL,NULL,241,1),(1959,'en','default','18387',NULL,NULL,NULL,NULL,NULL,NULL,241,2),(1960,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,241,2),(1961,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,241,11),(1962,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,241,22),(1963,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,241,8),(1964,NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,241,23),(1965,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,241,24),(1966,NULL,NULL,'2-variant-17-7',NULL,NULL,NULL,NULL,NULL,NULL,242,1),(1967,'en','default','18387',NULL,NULL,NULL,NULL,NULL,NULL,242,2),(1968,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,242,2),(1969,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,242,11),(1970,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,242,22),(1971,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,242,8),(1972,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,242,23),(1973,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,242,24),(1974,NULL,NULL,'2-variant-4-8',NULL,NULL,NULL,NULL,NULL,NULL,243,1),(1975,'en','default','18387',NULL,NULL,NULL,NULL,NULL,NULL,243,2),(1976,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,243,2),(1977,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,243,11),(1978,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,243,22),(1979,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,243,8),(1980,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,243,23),(1981,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,243,24),(1982,NULL,NULL,'2-variant-4-9',NULL,NULL,NULL,NULL,NULL,NULL,244,1),(1983,'en','default','18387',NULL,NULL,NULL,NULL,NULL,NULL,244,2),(1984,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,244,2),(1985,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,244,11),(1986,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,244,22),(1987,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,244,8),(1988,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,244,23),(1989,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,244,24),(1990,NULL,NULL,'2-variant-4-10',NULL,NULL,NULL,NULL,NULL,NULL,245,1),(1991,'en','default','18387',NULL,NULL,NULL,NULL,NULL,NULL,245,2),(1992,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,245,2),(1993,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,245,11),(1994,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,245,22),(1995,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,245,8),(1996,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,245,23),(1997,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,245,24),(1998,NULL,NULL,'2-variant-4-11',NULL,NULL,NULL,NULL,NULL,NULL,246,1),(1999,'en','default','18387',NULL,NULL,NULL,NULL,NULL,NULL,246,2),(2000,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,246,2),(2001,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,246,11),(2002,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,246,22),(2003,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,246,8),(2004,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,246,23),(2005,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,246,24),(2006,NULL,NULL,'2-variant-15-8',NULL,NULL,NULL,NULL,NULL,NULL,247,1),(2007,'en','default','18387',NULL,NULL,NULL,NULL,NULL,NULL,247,2),(2008,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,247,2),(2009,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,247,11),(2010,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,247,22),(2011,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,247,8),(2012,NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,247,23),(2013,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,247,24),(2014,NULL,NULL,'2-variant-15-9',NULL,NULL,NULL,NULL,NULL,NULL,248,1),(2015,'en','default','18387',NULL,NULL,NULL,NULL,NULL,NULL,248,2),(2016,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,248,2),(2017,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,248,11),(2018,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,248,22),(2019,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,248,8),(2020,NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,248,23),(2021,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,248,24),(2022,NULL,NULL,'2-variant-15-10',NULL,NULL,NULL,NULL,NULL,NULL,249,1),(2023,'en','default','18387',NULL,NULL,NULL,NULL,NULL,NULL,249,2),(2024,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,249,2),(2025,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,249,11),(2026,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,249,22),(2027,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,249,8),(2028,NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,249,23),(2029,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,249,24),(2030,NULL,NULL,'2-variant-15-11',NULL,NULL,NULL,NULL,NULL,NULL,250,1),(2031,'en','default','18387',NULL,NULL,NULL,NULL,NULL,NULL,250,2),(2032,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,250,2),(2033,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,250,11),(2034,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,250,22),(2035,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,250,8),(2036,NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,250,23),(2037,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,250,24),(2038,NULL,NULL,'2-variant-17-8',NULL,NULL,NULL,NULL,NULL,NULL,251,1),(2039,'en','default','18387',NULL,NULL,NULL,NULL,NULL,NULL,251,2),(2040,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,251,2),(2041,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,251,11),(2042,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,251,22),(2043,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,251,8),(2044,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,251,23),(2045,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,251,24),(2046,NULL,NULL,'2-variant-17-9',NULL,NULL,NULL,NULL,NULL,NULL,252,1),(2047,'en','default','18387',NULL,NULL,NULL,NULL,NULL,NULL,252,2),(2048,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,252,2),(2049,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,252,11),(2050,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,252,22),(2051,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,252,8),(2052,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,252,23),(2053,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,252,24),(2054,NULL,NULL,'2-variant-17-10',NULL,NULL,NULL,NULL,NULL,NULL,253,1),(2055,'en','default','18387',NULL,NULL,NULL,NULL,NULL,NULL,253,2),(2056,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,253,2),(2057,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,253,11),(2058,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,253,22),(2059,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,253,8),(2060,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,253,23),(2061,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,253,24),(2062,NULL,NULL,'2-variant-17-11',NULL,NULL,NULL,NULL,NULL,NULL,254,1),(2063,'en','default','18387',NULL,NULL,NULL,NULL,NULL,NULL,254,2),(2064,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,254,2),(2065,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,254,11),(2066,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,254,22),(2067,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,254,8),(2068,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,254,23),(2069,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,254,24),(2070,'en','default','<p>كعب لماعي مرصع بالفص&nbsp;</p>',NULL,NULL,NULL,NULL,NULL,NULL,239,9),(2071,'en','default','<p>كعب لماعي مرصع بالفص</p>',NULL,NULL,NULL,NULL,NULL,NULL,239,10),(2072,NULL,NULL,'2',NULL,NULL,NULL,NULL,NULL,NULL,239,1),(2073,'en','default','18387',NULL,NULL,NULL,NULL,NULL,NULL,239,2),(2074,NULL,NULL,'18387',NULL,NULL,NULL,NULL,NULL,NULL,239,3),(2075,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,239,4),(2076,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,239,5),(2077,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,239,6),(2078,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,239,7),(2079,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,239,8),(2080,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,239,26),(2081,'en','default','كعب لماعي مرصع بالفص',NULL,NULL,NULL,NULL,NULL,NULL,239,16),(2082,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,239,17),(2083,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,239,18),(2084,NULL,NULL,'3-variant-4-6',NULL,NULL,NULL,NULL,NULL,NULL,256,1),(2085,'en','default','TL-42',NULL,NULL,NULL,NULL,NULL,NULL,256,2),(2086,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,256,2),(2087,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,256,11),(2088,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,256,22),(2089,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,256,8),(2090,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,256,23),(2091,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,256,24),(2092,NULL,NULL,'3-variant-5-6',NULL,NULL,NULL,NULL,NULL,NULL,257,1),(2093,'en','default','TL-42',NULL,NULL,NULL,NULL,NULL,NULL,257,2),(2094,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,257,2),(2095,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,257,11),(2096,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,257,22),(2097,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,257,8),(2098,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,257,23),(2099,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,257,24),(2100,NULL,NULL,'3-variant-18-6',NULL,NULL,NULL,NULL,NULL,NULL,258,1),(2101,'en','default','TL-42',NULL,NULL,NULL,NULL,NULL,NULL,258,2),(2102,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,258,2),(2103,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,258,11),(2104,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,258,22),(2105,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,258,8),(2106,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,258,23),(2107,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,258,24),(2108,NULL,NULL,'3-variant-4-7',NULL,NULL,NULL,NULL,NULL,NULL,259,1),(2109,'en','default','TL-42',NULL,NULL,NULL,NULL,NULL,NULL,259,2),(2110,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,259,2),(2111,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,259,11),(2112,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,259,22),(2113,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,259,8),(2114,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,259,23),(2115,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,259,24),(2116,NULL,NULL,'3-variant-4-8',NULL,NULL,NULL,NULL,NULL,NULL,260,1),(2117,'en','default','TL-42',NULL,NULL,NULL,NULL,NULL,NULL,260,2),(2118,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,260,2),(2119,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,260,11),(2120,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,260,22),(2121,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,260,8),(2122,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,260,23),(2123,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,260,24),(2124,NULL,NULL,'3-variant-4-9',NULL,NULL,NULL,NULL,NULL,NULL,261,1),(2125,'en','default','TL-42',NULL,NULL,NULL,NULL,NULL,NULL,261,2),(2126,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,261,2),(2127,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,261,11),(2128,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,261,22),(2129,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,261,8),(2130,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,261,23),(2131,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,261,24),(2132,NULL,NULL,'3-variant-4-10',NULL,NULL,NULL,NULL,NULL,NULL,262,1),(2133,'en','default','TL-42',NULL,NULL,NULL,NULL,NULL,NULL,262,2),(2134,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,262,2),(2135,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,262,11),(2136,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,262,22),(2137,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,262,8),(2138,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,262,23),(2139,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,262,24),(2140,NULL,NULL,'3-variant-4-11',NULL,NULL,NULL,NULL,NULL,NULL,263,1),(2141,'en','default','TL-42',NULL,NULL,NULL,NULL,NULL,NULL,263,2),(2142,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,263,2),(2143,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,263,11),(2144,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,263,22),(2145,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,263,8),(2146,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,263,23),(2147,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,263,24),(2148,NULL,NULL,'3-variant-5-7',NULL,NULL,NULL,NULL,NULL,NULL,264,1),(2149,'en','default','TL-42',NULL,NULL,NULL,NULL,NULL,NULL,264,2),(2150,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,264,2),(2151,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,264,11),(2152,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,264,22),(2153,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,264,8),(2154,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,264,23),(2155,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,264,24),(2156,NULL,NULL,'3-variant-5-8',NULL,NULL,NULL,NULL,NULL,NULL,265,1),(2157,'en','default','TL-42',NULL,NULL,NULL,NULL,NULL,NULL,265,2),(2158,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,265,2),(2159,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,265,11),(2160,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,265,22),(2161,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,265,8),(2162,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,265,23),(2163,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,265,24),(2164,NULL,NULL,'3-variant-5-9',NULL,NULL,NULL,NULL,NULL,NULL,266,1),(2165,'en','default','TL-42',NULL,NULL,NULL,NULL,NULL,NULL,266,2),(2166,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,266,2),(2167,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,266,11),(2168,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,266,22),(2169,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,266,8),(2170,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,266,23),(2171,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,266,24),(2172,NULL,NULL,'3-variant-5-10',NULL,NULL,NULL,NULL,NULL,NULL,267,1),(2173,'en','default','TL-42',NULL,NULL,NULL,NULL,NULL,NULL,267,2),(2174,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,267,2),(2175,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,267,11),(2176,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,267,22),(2177,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,267,8),(2178,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,267,23),(2179,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,267,24),(2180,NULL,NULL,'3-variant-5-11',NULL,NULL,NULL,NULL,NULL,NULL,268,1),(2181,'en','default','TL-42',NULL,NULL,NULL,NULL,NULL,NULL,268,2),(2182,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,268,2),(2183,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,268,11),(2184,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,268,22),(2185,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,268,8),(2186,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,268,23),(2187,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,268,24),(2188,NULL,NULL,'3-variant-18-7',NULL,NULL,NULL,NULL,NULL,NULL,269,1),(2189,'en','default','TL-42',NULL,NULL,NULL,NULL,NULL,NULL,269,2),(2190,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,269,2),(2191,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,269,11),(2192,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,269,22),(2193,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,269,8),(2194,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,269,23),(2195,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,269,24),(2196,NULL,NULL,'3-variant-18-8',NULL,NULL,NULL,NULL,NULL,NULL,270,1),(2197,'en','default','TL-42',NULL,NULL,NULL,NULL,NULL,NULL,270,2),(2198,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,270,2),(2199,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,270,11),(2200,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,270,22),(2201,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,270,8),(2202,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,270,23),(2203,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,270,24),(2204,NULL,NULL,'3-variant-18-9',NULL,NULL,NULL,NULL,NULL,NULL,271,1),(2205,'en','default','TL-42',NULL,NULL,NULL,NULL,NULL,NULL,271,2),(2206,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,271,2),(2207,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,271,11),(2208,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,271,22),(2209,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,271,8),(2210,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,271,23),(2211,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,271,24),(2212,NULL,NULL,'3-variant-18-10',NULL,NULL,NULL,NULL,NULL,NULL,272,1),(2213,'en','default','TL-42',NULL,NULL,NULL,NULL,NULL,NULL,272,2),(2214,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,272,2),(2215,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,272,11),(2216,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,272,22),(2217,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,272,8),(2218,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,272,23),(2219,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,272,24),(2220,NULL,NULL,'3-variant-18-11',NULL,NULL,NULL,NULL,NULL,NULL,273,1),(2221,'en','default','TL-42',NULL,NULL,NULL,NULL,NULL,NULL,273,2),(2222,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,273,2),(2223,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,273,11),(2224,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,273,22),(2225,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,273,8),(2226,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,273,23),(2227,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,273,24),(2228,'en','default','<p>كعب مربع انيق</p>',NULL,NULL,NULL,NULL,NULL,NULL,255,9),(2229,'en','default','<p>كعب مربع انيق</p>',NULL,NULL,NULL,NULL,NULL,NULL,255,10),(2230,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,255,1),(2231,'en','default','TL-42',NULL,NULL,NULL,NULL,NULL,NULL,255,2),(2232,NULL,NULL,'tl-42',NULL,NULL,NULL,NULL,NULL,NULL,255,3),(2233,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,255,4),(2234,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,255,5),(2235,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,255,6),(2236,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,255,7),(2237,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,255,8),(2238,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,255,26),(2239,'en','default','كعب مربع انيق',NULL,NULL,NULL,NULL,NULL,NULL,255,16),(2240,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,255,17),(2241,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,255,18),(2242,NULL,NULL,'4-variant-4-7',NULL,NULL,NULL,NULL,NULL,NULL,275,1),(2243,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,275,2),(2244,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,275,2),(2245,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,275,11),(2246,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,275,22),(2247,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,275,8),(2248,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,275,23),(2249,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,275,24),(2250,NULL,NULL,'4-variant-15-7',NULL,NULL,NULL,NULL,NULL,NULL,276,1),(2251,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,276,2),(2252,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,276,2),(2253,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,276,11),(2254,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,276,22),(2255,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,276,8),(2256,NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,276,23),(2257,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,276,24),(2258,NULL,NULL,'4-variant-16-7',NULL,NULL,NULL,NULL,NULL,NULL,277,1),(2259,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,277,2),(2260,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,277,2),(2261,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,277,11),(2262,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,277,22),(2263,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,277,8),(2264,NULL,NULL,NULL,NULL,16,NULL,NULL,NULL,NULL,277,23),(2265,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,277,24),(2266,NULL,NULL,'4-variant-17-7',NULL,NULL,NULL,NULL,NULL,NULL,278,1),(2267,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,278,2),(2268,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,278,2),(2269,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,278,11),(2270,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,278,22),(2271,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,278,8),(2272,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,278,23),(2273,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,278,24),(2274,NULL,NULL,'4-variant-4-8',NULL,NULL,NULL,NULL,NULL,NULL,279,1),(2275,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,279,2),(2276,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,279,2),(2277,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,279,11),(2278,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,279,22),(2279,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,279,8),(2280,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,279,23),(2281,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,279,24),(2282,NULL,NULL,'4-variant-4-9',NULL,NULL,NULL,NULL,NULL,NULL,280,1),(2283,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,280,2),(2284,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,280,2),(2285,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,280,11),(2286,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,280,22),(2287,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,280,8),(2288,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,280,23),(2289,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,280,24),(2290,NULL,NULL,'4-variant-4-10',NULL,NULL,NULL,NULL,NULL,NULL,281,1),(2291,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,281,2),(2292,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,281,2),(2293,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,281,11),(2294,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,281,22),(2295,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,281,8),(2296,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,281,23),(2297,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,281,24),(2298,NULL,NULL,'4-variant-4-11',NULL,NULL,NULL,NULL,NULL,NULL,282,1),(2299,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,282,2),(2300,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,282,2),(2301,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,282,11),(2302,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,282,22),(2303,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,282,8),(2304,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,282,23),(2305,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,282,24),(2306,NULL,NULL,'4-variant-15-8',NULL,NULL,NULL,NULL,NULL,NULL,283,1),(2307,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,283,2),(2308,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,283,2),(2309,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,283,11),(2310,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,283,22),(2311,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,283,8),(2312,NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,283,23),(2313,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,283,24),(2314,NULL,NULL,'4-variant-15-9',NULL,NULL,NULL,NULL,NULL,NULL,284,1),(2315,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,284,2),(2316,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,284,2),(2317,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,284,11),(2318,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,284,22),(2319,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,284,8),(2320,NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,284,23),(2321,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,284,24),(2322,NULL,NULL,'4-variant-15-10',NULL,NULL,NULL,NULL,NULL,NULL,285,1),(2323,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,285,2),(2324,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,285,2),(2325,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,285,11),(2326,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,285,22),(2327,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,285,8),(2328,NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,285,23),(2329,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,285,24),(2330,NULL,NULL,'4-variant-15-11',NULL,NULL,NULL,NULL,NULL,NULL,286,1),(2331,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,286,2),(2332,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,286,2),(2333,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,286,11),(2334,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,286,22),(2335,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,286,8),(2336,NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,286,23),(2337,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,286,24),(2338,NULL,NULL,'4-variant-16-8',NULL,NULL,NULL,NULL,NULL,NULL,287,1),(2339,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,287,2),(2340,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,287,2),(2341,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,287,11),(2342,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,287,22),(2343,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,287,8),(2344,NULL,NULL,NULL,NULL,16,NULL,NULL,NULL,NULL,287,23),(2345,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,287,24),(2346,NULL,NULL,'4-variant-16-9',NULL,NULL,NULL,NULL,NULL,NULL,288,1),(2347,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,288,2),(2348,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,288,2),(2349,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,288,11),(2350,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,288,22),(2351,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,288,8),(2352,NULL,NULL,NULL,NULL,16,NULL,NULL,NULL,NULL,288,23),(2353,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,288,24),(2354,NULL,NULL,'4-variant-16-10',NULL,NULL,NULL,NULL,NULL,NULL,289,1),(2355,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,289,2),(2356,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,289,2),(2357,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,289,11),(2358,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,289,22),(2359,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,289,8),(2360,NULL,NULL,NULL,NULL,16,NULL,NULL,NULL,NULL,289,23),(2361,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,289,24),(2362,NULL,NULL,'4-variant-16-11',NULL,NULL,NULL,NULL,NULL,NULL,290,1),(2363,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,290,2),(2364,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,290,2),(2365,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,290,11),(2366,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,290,22),(2367,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,290,8),(2368,NULL,NULL,NULL,NULL,16,NULL,NULL,NULL,NULL,290,23),(2369,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,290,24),(2370,NULL,NULL,'4-variant-17-8',NULL,NULL,NULL,NULL,NULL,NULL,291,1),(2371,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,291,2),(2372,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,291,2),(2373,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,291,11),(2374,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,291,22),(2375,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,291,8),(2376,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,291,23),(2377,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,291,24),(2378,NULL,NULL,'4-variant-17-9',NULL,NULL,NULL,NULL,NULL,NULL,292,1),(2379,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,292,2),(2380,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,292,2),(2381,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,292,11),(2382,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,292,22),(2383,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,292,8),(2384,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,292,23),(2385,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,292,24),(2386,NULL,NULL,'4-variant-17-10',NULL,NULL,NULL,NULL,NULL,NULL,293,1),(2387,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,293,2),(2388,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,293,2),(2389,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,293,11),(2390,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,293,22),(2391,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,293,8),(2392,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,293,23),(2393,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,293,24),(2394,NULL,NULL,'4-variant-17-11',NULL,NULL,NULL,NULL,NULL,NULL,294,1),(2395,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,294,2),(2396,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,294,2),(2397,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,294,11),(2398,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,294,22),(2399,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,294,8),(2400,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,294,23),(2401,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,294,24),(2402,'en','default','<p>كعب مفتوح مرصع بالفص والشفاف</p>',NULL,NULL,NULL,NULL,NULL,NULL,274,9),(2403,'en','default','<p>كعب مفتوح مرصع بالفص والشفاف</p>',NULL,NULL,NULL,NULL,NULL,NULL,274,10),(2404,NULL,NULL,'4',NULL,NULL,NULL,NULL,NULL,NULL,274,1),(2405,'en','default','18386',NULL,NULL,NULL,NULL,NULL,NULL,274,2),(2406,NULL,NULL,'18386',NULL,NULL,NULL,NULL,NULL,NULL,274,3),(2407,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,274,4),(2408,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,274,5),(2409,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,274,6),(2410,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,274,7),(2411,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,274,8),(2412,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,274,26),(2413,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,274,16),(2414,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,274,17),(2415,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,274,18),(2416,NULL,NULL,'5-variant-3-6',NULL,NULL,NULL,NULL,NULL,NULL,296,1),(2417,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,296,2),(2418,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,296,2),(2419,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,296,11),(2420,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,296,22),(2421,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,296,8),(2422,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,296,23),(2423,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,296,24),(2424,NULL,NULL,'5-variant-5-6',NULL,NULL,NULL,NULL,NULL,NULL,297,1),(2425,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,297,2),(2426,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,297,2),(2427,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,297,11),(2428,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,297,22),(2429,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,297,8),(2430,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,297,23),(2431,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,297,24),(2432,NULL,NULL,'5-variant-13-6',NULL,NULL,NULL,NULL,NULL,NULL,298,1),(2433,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,298,2),(2434,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,298,2),(2435,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,298,11),(2436,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,298,22),(2437,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,298,8),(2438,NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,NULL,298,23),(2439,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,298,24),(2440,NULL,NULL,'5-variant-14-6',NULL,NULL,NULL,NULL,NULL,NULL,299,1),(2441,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,299,2),(2442,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,299,2),(2443,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,299,11),(2444,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,299,22),(2445,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,299,8),(2446,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,299,23),(2447,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,299,24),(2448,NULL,NULL,'5-variant-18-6',NULL,NULL,NULL,NULL,NULL,NULL,300,1),(2449,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,300,2),(2450,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,300,2),(2451,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,300,11),(2452,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,300,22),(2453,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,300,8),(2454,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,300,23),(2455,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,300,24),(2456,NULL,NULL,'5-variant-3-7',NULL,NULL,NULL,NULL,NULL,NULL,301,1),(2457,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,301,2),(2458,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,301,2),(2459,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,301,11),(2460,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,301,22),(2461,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,301,8),(2462,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,301,23),(2463,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,301,24),(2464,NULL,NULL,'5-variant-3-8',NULL,NULL,NULL,NULL,NULL,NULL,302,1),(2465,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,302,2),(2466,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,302,2),(2467,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,302,11),(2468,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,302,22),(2469,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,302,8),(2470,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,302,23),(2471,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,302,24),(2472,NULL,NULL,'5-variant-3-9',NULL,NULL,NULL,NULL,NULL,NULL,303,1),(2473,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,303,2),(2474,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,303,2),(2475,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,303,11),(2476,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,303,22),(2477,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,303,8),(2478,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,303,23),(2479,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,303,24),(2480,NULL,NULL,'5-variant-3-10',NULL,NULL,NULL,NULL,NULL,NULL,304,1),(2481,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,304,2),(2482,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,304,2),(2483,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,304,11),(2484,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,304,22),(2485,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,304,8),(2486,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,304,23),(2487,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,304,24),(2488,NULL,NULL,'5-variant-3-11',NULL,NULL,NULL,NULL,NULL,NULL,305,1),(2489,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,305,2),(2490,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,305,2),(2491,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,305,11),(2492,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,305,22),(2493,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,305,8),(2494,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,305,23),(2495,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,305,24),(2496,NULL,NULL,'5-variant-5-7',NULL,NULL,NULL,NULL,NULL,NULL,306,1),(2497,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,306,2),(2498,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,306,2),(2499,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,306,11),(2500,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,306,22),(2501,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,306,8),(2502,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,306,23),(2503,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,306,24),(2504,NULL,NULL,'5-variant-5-8',NULL,NULL,NULL,NULL,NULL,NULL,307,1),(2505,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,307,2),(2506,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,307,2),(2507,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,307,11),(2508,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,307,22),(2509,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,307,8),(2510,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,307,23),(2511,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,307,24),(2512,NULL,NULL,'5-variant-5-9',NULL,NULL,NULL,NULL,NULL,NULL,308,1),(2513,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,308,2),(2514,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,308,2),(2515,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,308,11),(2516,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,308,22),(2517,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,308,8),(2518,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,308,23),(2519,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,308,24),(2520,NULL,NULL,'5-variant-5-10',NULL,NULL,NULL,NULL,NULL,NULL,309,1),(2521,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,309,2),(2522,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,309,2),(2523,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,309,11),(2524,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,309,22),(2525,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,309,8),(2526,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,309,23),(2527,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,309,24),(2528,NULL,NULL,'5-variant-5-11',NULL,NULL,NULL,NULL,NULL,NULL,310,1),(2529,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,310,2),(2530,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,310,2),(2531,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,310,11),(2532,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,310,22),(2533,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,310,8),(2534,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,310,23),(2535,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,310,24),(2536,NULL,NULL,'5-variant-13-7',NULL,NULL,NULL,NULL,NULL,NULL,311,1),(2537,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,311,2),(2538,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,311,2),(2539,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,311,11),(2540,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,311,22),(2541,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,311,8),(2542,NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,NULL,311,23),(2543,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,311,24),(2544,NULL,NULL,'5-variant-13-8',NULL,NULL,NULL,NULL,NULL,NULL,312,1),(2545,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,312,2),(2546,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,312,2),(2547,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,312,11),(2548,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,312,22),(2549,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,312,8),(2550,NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,NULL,312,23),(2551,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,312,24),(2552,NULL,NULL,'5-variant-13-9',NULL,NULL,NULL,NULL,NULL,NULL,313,1),(2553,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,313,2),(2554,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,313,2),(2555,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,313,11),(2556,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,313,22),(2557,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,313,8),(2558,NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,NULL,313,23),(2559,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,313,24),(2560,NULL,NULL,'5-variant-13-10',NULL,NULL,NULL,NULL,NULL,NULL,314,1),(2561,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,314,2),(2562,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,314,2),(2563,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,314,11),(2564,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,314,22),(2565,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,314,8),(2566,NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,NULL,314,23),(2567,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,314,24),(2568,NULL,NULL,'5-variant-13-11',NULL,NULL,NULL,NULL,NULL,NULL,315,1),(2569,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,315,2),(2570,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,315,2),(2571,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,315,11),(2572,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,315,22),(2573,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,315,8),(2574,NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,NULL,315,23),(2575,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,315,24),(2576,NULL,NULL,'5-variant-14-7',NULL,NULL,NULL,NULL,NULL,NULL,316,1),(2577,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,316,2),(2578,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,316,2),(2579,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,316,11),(2580,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,316,22),(2581,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,316,8),(2582,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,316,23),(2583,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,316,24),(2584,NULL,NULL,'5-variant-14-8',NULL,NULL,NULL,NULL,NULL,NULL,317,1),(2585,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,317,2),(2586,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,317,2),(2587,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,317,11),(2588,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,317,22),(2589,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,317,8),(2590,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,317,23),(2591,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,317,24),(2592,NULL,NULL,'5-variant-14-9',NULL,NULL,NULL,NULL,NULL,NULL,318,1),(2593,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,318,2),(2594,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,318,2),(2595,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,318,11),(2596,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,318,22),(2597,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,318,8),(2598,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,318,23),(2599,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,318,24),(2600,NULL,NULL,'5-variant-14-10',NULL,NULL,NULL,NULL,NULL,NULL,319,1),(2601,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,319,2),(2602,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,319,2),(2603,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,319,11),(2604,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,319,22),(2605,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,319,8),(2606,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,319,23),(2607,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,319,24),(2608,NULL,NULL,'5-variant-14-11',NULL,NULL,NULL,NULL,NULL,NULL,320,1),(2609,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,320,2),(2610,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,320,2),(2611,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,320,11),(2612,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,320,22),(2613,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,320,8),(2614,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,320,23),(2615,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,320,24),(2616,NULL,NULL,'5-variant-18-7',NULL,NULL,NULL,NULL,NULL,NULL,321,1),(2617,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,321,2),(2618,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,321,2),(2619,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,321,11),(2620,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,321,22),(2621,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,321,8),(2622,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,321,23),(2623,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,321,24),(2624,NULL,NULL,'5-variant-18-8',NULL,NULL,NULL,NULL,NULL,NULL,322,1),(2625,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,322,2),(2626,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,322,2),(2627,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,322,11),(2628,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,322,22),(2629,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,322,8),(2630,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,322,23),(2631,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,322,24),(2632,NULL,NULL,'5-variant-18-9',NULL,NULL,NULL,NULL,NULL,NULL,323,1),(2633,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,323,2),(2634,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,323,2),(2635,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,323,11),(2636,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,323,22),(2637,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,323,8),(2638,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,323,23),(2639,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,323,24),(2640,NULL,NULL,'5-variant-18-10',NULL,NULL,NULL,NULL,NULL,NULL,324,1),(2641,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,324,2),(2642,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,324,2),(2643,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,324,11),(2644,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,324,22),(2645,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,324,8),(2646,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,324,23),(2647,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,324,24),(2648,NULL,NULL,'5-variant-18-11',NULL,NULL,NULL,NULL,NULL,NULL,325,1),(2649,'en','default','ch',NULL,NULL,NULL,NULL,NULL,NULL,325,2),(2650,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,325,2),(2651,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,325,11),(2652,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,325,22),(2653,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,325,8),(2654,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,325,23),(2655,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,325,24),(2656,'en','default','<p>فلات تقليد لشكل ماركة كالورينا هريرا</p>',NULL,NULL,NULL,NULL,NULL,NULL,295,9),(2657,'en','default','<p>فلات تلقيد شكل ماركة كالورينا هريرا</p>',NULL,NULL,NULL,NULL,NULL,NULL,295,10),(2658,NULL,NULL,'5',NULL,NULL,NULL,NULL,NULL,NULL,295,1),(2659,'en','default','ch ',NULL,NULL,NULL,NULL,NULL,NULL,295,2),(2660,NULL,NULL,'ch-',NULL,NULL,NULL,NULL,NULL,NULL,295,3),(2661,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,295,4),(2662,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,295,5),(2663,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,295,6),(2664,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,295,7),(2665,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,295,8),(2666,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,295,26),(2667,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,295,16),(2668,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,295,17),(2669,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,295,18),(2670,'en','default','<p>jjggjgjh</p>',NULL,NULL,NULL,NULL,NULL,NULL,325,9),(2671,'en','default','<p>jhjhhjhj</p>',NULL,NULL,NULL,NULL,NULL,NULL,325,10),(2672,NULL,NULL,'5-variant-18-11',NULL,NULL,NULL,NULL,NULL,NULL,325,3),(2673,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,325,4),(2674,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,325,5),(2675,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,325,6),(2676,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,325,7),(2677,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,325,26),(2678,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,325,16),(2679,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,325,17),(2680,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,325,18),(2681,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,325,12),(2682,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,325,13),(2683,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,325,14),(2684,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,325,15),(2685,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,325,20),(2686,NULL,NULL,'6-variant-4-6',NULL,NULL,NULL,NULL,NULL,NULL,327,1),(2687,'en','default','1177-9',NULL,NULL,NULL,NULL,NULL,NULL,327,2),(2688,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,327,2),(2689,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,327,11),(2690,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,327,22),(2691,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,327,8),(2692,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,327,23),(2693,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,327,24),(2694,NULL,NULL,'6-variant-14-6',NULL,NULL,NULL,NULL,NULL,NULL,328,1),(2695,'en','default','1177-9',NULL,NULL,NULL,NULL,NULL,NULL,328,2),(2696,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,328,2),(2697,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,328,11),(2698,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,328,22),(2699,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,328,8),(2700,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,328,23),(2701,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,328,24),(2702,NULL,NULL,'6-variant-17-6',NULL,NULL,NULL,NULL,NULL,NULL,329,1),(2703,'en','default','1177-9',NULL,NULL,NULL,NULL,NULL,NULL,329,2),(2704,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,329,2),(2705,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,329,11),(2706,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,329,22),(2707,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,329,8),(2708,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,329,23),(2709,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,329,24),(2710,NULL,NULL,'6-variant-4-7',NULL,NULL,NULL,NULL,NULL,NULL,330,1),(2711,'en','default','1177-9',NULL,NULL,NULL,NULL,NULL,NULL,330,2),(2712,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,330,2),(2713,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,330,11),(2714,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,330,22),(2715,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,330,8),(2716,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,330,23),(2717,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,330,24),(2718,NULL,NULL,'6-variant-4-8',NULL,NULL,NULL,NULL,NULL,NULL,331,1),(2719,'en','default','1177-9',NULL,NULL,NULL,NULL,NULL,NULL,331,2),(2720,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,331,2),(2721,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,331,11),(2722,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,331,22),(2723,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,331,8),(2724,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,331,23),(2725,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,331,24),(2726,NULL,NULL,'6-variant-4-9',NULL,NULL,NULL,NULL,NULL,NULL,332,1),(2727,'en','default','1177-9',NULL,NULL,NULL,NULL,NULL,NULL,332,2),(2728,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,332,2),(2729,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,332,11),(2730,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,332,22),(2731,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,332,8),(2732,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,332,23),(2733,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,332,24),(2734,NULL,NULL,'6-variant-4-10',NULL,NULL,NULL,NULL,NULL,NULL,333,1),(2735,'en','default','1177-9',NULL,NULL,NULL,NULL,NULL,NULL,333,2),(2736,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,333,2),(2737,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,333,11),(2738,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,333,22),(2739,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,333,8),(2740,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,333,23),(2741,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,333,24),(2742,NULL,NULL,'6-variant-14-7',NULL,NULL,NULL,NULL,NULL,NULL,334,1),(2743,'en','default','1177-9',NULL,NULL,NULL,NULL,NULL,NULL,334,2),(2744,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,334,2),(2745,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,334,11),(2746,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,334,22),(2747,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,334,8),(2748,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,334,23),(2749,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,334,24),(2750,NULL,NULL,'6-variant-14-8',NULL,NULL,NULL,NULL,NULL,NULL,335,1),(2751,'en','default','1177-9',NULL,NULL,NULL,NULL,NULL,NULL,335,2),(2752,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,335,2),(2753,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,335,11),(2754,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,335,22),(2755,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,335,8),(2756,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,335,23),(2757,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,335,24),(2758,NULL,NULL,'6-variant-14-9',NULL,NULL,NULL,NULL,NULL,NULL,336,1),(2759,'en','default','1177-9',NULL,NULL,NULL,NULL,NULL,NULL,336,2),(2760,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,336,2),(2761,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,336,11),(2762,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,336,22),(2763,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,336,8),(2764,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,336,23),(2765,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,336,24),(2766,NULL,NULL,'6-variant-14-10',NULL,NULL,NULL,NULL,NULL,NULL,337,1),(2767,'en','default','1177-9',NULL,NULL,NULL,NULL,NULL,NULL,337,2),(2768,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,337,2),(2769,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,337,11),(2770,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,337,22),(2771,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,337,8),(2772,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,337,23),(2773,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,337,24),(2774,NULL,NULL,'6-variant-17-7',NULL,NULL,NULL,NULL,NULL,NULL,338,1),(2775,'en','default','1177-9',NULL,NULL,NULL,NULL,NULL,NULL,338,2),(2776,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,338,2),(2777,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,338,11),(2778,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,338,22),(2779,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,338,8),(2780,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,338,23),(2781,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,338,24),(2782,NULL,NULL,'6-variant-17-8',NULL,NULL,NULL,NULL,NULL,NULL,339,1),(2783,'en','default','1177-9',NULL,NULL,NULL,NULL,NULL,NULL,339,2),(2784,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,339,2),(2785,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,339,11),(2786,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,339,22),(2787,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,339,8),(2788,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,339,23),(2789,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,339,24),(2790,NULL,NULL,'6-variant-17-9',NULL,NULL,NULL,NULL,NULL,NULL,340,1),(2791,'en','default','1177-9',NULL,NULL,NULL,NULL,NULL,NULL,340,2),(2792,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,340,2),(2793,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,340,11),(2794,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,340,22),(2795,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,340,8),(2796,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,340,23),(2797,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,340,24),(2798,NULL,NULL,'6-variant-17-10',NULL,NULL,NULL,NULL,NULL,NULL,341,1),(2799,'en','default','1177-9',NULL,NULL,NULL,NULL,NULL,NULL,341,2),(2800,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,341,2),(2801,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,341,11),(2802,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,341,22),(2803,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,341,8),(2804,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,341,23),(2805,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,341,24),(2806,'en','default','<p>فلات شفاف</p>',NULL,NULL,NULL,NULL,NULL,NULL,326,9),(2807,'en','default','<p>فلات شفاف</p>',NULL,NULL,NULL,NULL,NULL,NULL,326,10),(2808,NULL,NULL,'6',NULL,NULL,NULL,NULL,NULL,NULL,326,1),(2809,'en','default','1177-9',NULL,NULL,NULL,NULL,NULL,NULL,326,2),(2810,NULL,NULL,'1177-9',NULL,NULL,NULL,NULL,NULL,NULL,326,3),(2811,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,326,4),(2812,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,326,5),(2813,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,326,6),(2814,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,326,7),(2815,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,326,8),(2816,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,326,26),(2817,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,326,16),(2818,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,326,17),(2819,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,326,18),(2916,NULL,NULL,'9-variant-4-6',NULL,NULL,NULL,NULL,NULL,NULL,357,1),(2917,'en','default','1177',NULL,NULL,NULL,NULL,NULL,NULL,357,2),(2918,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,357,2),(2919,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,357,11),(2920,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,357,22),(2921,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,357,8),(2922,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,357,23),(2923,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,357,24),(2924,NULL,NULL,'9-variant-16-6',NULL,NULL,NULL,NULL,NULL,NULL,358,1),(2925,'en','default','1177',NULL,NULL,NULL,NULL,NULL,NULL,358,2),(2926,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,358,2),(2927,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,358,11),(2928,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,358,22),(2929,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,358,8),(2930,NULL,NULL,NULL,NULL,16,NULL,NULL,NULL,NULL,358,23),(2931,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,358,24),(2932,NULL,NULL,'9-variant-19-6',NULL,NULL,NULL,NULL,NULL,NULL,359,1),(2933,'en','default','1177',NULL,NULL,NULL,NULL,NULL,NULL,359,2),(2934,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,359,2),(2935,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,359,11),(2936,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,359,22),(2937,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,359,8),(2938,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,359,23),(2939,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,359,24),(2940,NULL,NULL,'9-variant-4-7',NULL,NULL,NULL,NULL,NULL,NULL,360,1),(2941,'en','default','1177',NULL,NULL,NULL,NULL,NULL,NULL,360,2),(2942,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,360,2),(2943,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,360,11),(2944,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,360,22),(2945,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,360,8),(2946,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,360,23),(2947,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,360,24),(2948,NULL,NULL,'9-variant-4-8',NULL,NULL,NULL,NULL,NULL,NULL,361,1),(2949,'en','default','1177',NULL,NULL,NULL,NULL,NULL,NULL,361,2),(2950,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,361,2),(2951,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,361,11),(2952,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,361,22),(2953,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,361,8),(2954,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,361,23),(2955,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,361,24),(2956,NULL,NULL,'9-variant-4-9',NULL,NULL,NULL,NULL,NULL,NULL,362,1),(2957,'en','default','1177',NULL,NULL,NULL,NULL,NULL,NULL,362,2),(2958,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,362,2),(2959,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,362,11),(2960,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,362,22),(2961,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,362,8),(2962,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,362,23),(2963,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,362,24),(2964,NULL,NULL,'9-variant-4-10',NULL,NULL,NULL,NULL,NULL,NULL,363,1),(2965,'en','default','1177',NULL,NULL,NULL,NULL,NULL,NULL,363,2),(2966,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,363,2),(2967,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,363,11),(2968,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,363,22),(2969,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,363,8),(2970,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,363,23),(2971,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,363,24),(2972,NULL,NULL,'9-variant-4-11',NULL,NULL,NULL,NULL,NULL,NULL,364,1),(2973,'en','default','1177',NULL,NULL,NULL,NULL,NULL,NULL,364,2),(2974,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,364,2),(2975,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,364,11),(2976,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,364,22),(2977,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,364,8),(2978,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,364,23),(2979,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,364,24),(2980,NULL,NULL,'9-variant-16-7',NULL,NULL,NULL,NULL,NULL,NULL,365,1),(2981,'en','default','1177',NULL,NULL,NULL,NULL,NULL,NULL,365,2),(2982,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,365,2),(2983,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,365,11),(2984,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,365,22),(2985,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,365,8),(2986,NULL,NULL,NULL,NULL,16,NULL,NULL,NULL,NULL,365,23),(2987,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,365,24),(2988,NULL,NULL,'9-variant-16-8',NULL,NULL,NULL,NULL,NULL,NULL,366,1),(2989,'en','default','1177',NULL,NULL,NULL,NULL,NULL,NULL,366,2),(2990,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,366,2),(2991,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,366,11),(2992,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,366,22),(2993,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,366,8),(2994,NULL,NULL,NULL,NULL,16,NULL,NULL,NULL,NULL,366,23),(2995,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,366,24),(2996,NULL,NULL,'9-variant-16-9',NULL,NULL,NULL,NULL,NULL,NULL,367,1),(2997,'en','default','1177',NULL,NULL,NULL,NULL,NULL,NULL,367,2),(2998,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,367,2),(2999,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,367,11),(3000,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,367,22),(3001,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,367,8),(3002,NULL,NULL,NULL,NULL,16,NULL,NULL,NULL,NULL,367,23),(3003,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,367,24),(3004,NULL,NULL,'9-variant-16-10',NULL,NULL,NULL,NULL,NULL,NULL,368,1),(3005,'en','default','1177',NULL,NULL,NULL,NULL,NULL,NULL,368,2),(3006,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,368,2),(3007,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,368,11),(3008,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,368,22),(3009,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,368,8),(3010,NULL,NULL,NULL,NULL,16,NULL,NULL,NULL,NULL,368,23),(3011,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,368,24),(3012,NULL,NULL,'9-variant-16-11',NULL,NULL,NULL,NULL,NULL,NULL,369,1),(3013,'en','default','1177',NULL,NULL,NULL,NULL,NULL,NULL,369,2),(3014,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,369,2),(3015,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,369,11),(3016,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,369,22),(3017,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,369,8),(3018,NULL,NULL,NULL,NULL,16,NULL,NULL,NULL,NULL,369,23),(3019,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,369,24),(3020,NULL,NULL,'9-variant-19-7',NULL,NULL,NULL,NULL,NULL,NULL,370,1),(3021,'en','default','1177',NULL,NULL,NULL,NULL,NULL,NULL,370,2),(3022,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,370,2),(3023,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,370,11),(3024,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,370,22),(3025,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,370,8),(3026,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,370,23),(3027,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,370,24),(3028,NULL,NULL,'9-variant-19-8',NULL,NULL,NULL,NULL,NULL,NULL,371,1),(3029,'en','default','1177',NULL,NULL,NULL,NULL,NULL,NULL,371,2),(3030,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,371,2),(3031,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,371,11),(3032,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,371,22),(3033,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,371,8),(3034,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,371,23),(3035,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,371,24),(3036,NULL,NULL,'9-variant-19-9',NULL,NULL,NULL,NULL,NULL,NULL,372,1),(3037,'en','default','1177',NULL,NULL,NULL,NULL,NULL,NULL,372,2),(3038,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,372,2),(3039,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,372,11),(3040,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,372,22),(3041,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,372,8),(3042,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,372,23),(3043,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,372,24),(3044,NULL,NULL,'9-variant-19-10',NULL,NULL,NULL,NULL,NULL,NULL,373,1),(3045,'en','default','1177',NULL,NULL,NULL,NULL,NULL,NULL,373,2),(3046,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,373,2),(3047,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,373,11),(3048,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,373,22),(3049,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,373,8),(3050,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,373,23),(3051,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,373,24),(3052,NULL,NULL,'9-variant-19-11',NULL,NULL,NULL,NULL,NULL,NULL,374,1),(3053,'en','default','1177',NULL,NULL,NULL,NULL,NULL,NULL,374,2),(3054,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,374,2),(3055,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,374,11),(3056,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,374,22),(3057,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,374,8),(3058,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,374,23),(3059,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,374,24),(3060,'en','default','<p>فلات شبك</p>',NULL,NULL,NULL,NULL,NULL,NULL,356,9),(3061,'en','default','<p>فلات شبك</p>',NULL,NULL,NULL,NULL,NULL,NULL,356,10),(3062,NULL,NULL,'9',NULL,NULL,NULL,NULL,NULL,NULL,356,1),(3063,'en','default','1177',NULL,NULL,NULL,NULL,NULL,NULL,356,2),(3064,NULL,NULL,'1177',NULL,NULL,NULL,NULL,NULL,NULL,356,3),(3065,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,356,4),(3066,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,356,5),(3067,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,356,6),(3068,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,356,7),(3069,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,356,8),(3070,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,356,26),(3071,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,356,16),(3072,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,356,17),(3073,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,356,18),(3074,NULL,NULL,'10-variant-4-6',NULL,NULL,NULL,NULL,NULL,NULL,376,1),(3075,'en','default','TL-23',NULL,NULL,NULL,NULL,NULL,NULL,376,2),(3076,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,376,2),(3077,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,376,11),(3078,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,376,22),(3079,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,376,8),(3080,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,376,23),(3081,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,376,24),(3082,NULL,NULL,'10-variant-5-6',NULL,NULL,NULL,NULL,NULL,NULL,377,1),(3083,'en','default','TL-23',NULL,NULL,NULL,NULL,NULL,NULL,377,2),(3084,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,377,2),(3085,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,377,11),(3086,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,377,22),(3087,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,377,8),(3088,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,377,23),(3089,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,377,24),(3090,NULL,NULL,'10-variant-12-6',NULL,NULL,NULL,NULL,NULL,NULL,378,1),(3091,'en','default','TL-23',NULL,NULL,NULL,NULL,NULL,NULL,378,2),(3092,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,378,2),(3093,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,378,11),(3094,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,378,22),(3095,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,378,8),(3096,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,378,23),(3097,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,378,24),(3098,NULL,NULL,'10-variant-4-7',NULL,NULL,NULL,NULL,NULL,NULL,379,1),(3099,'en','default','TL-23',NULL,NULL,NULL,NULL,NULL,NULL,379,2),(3100,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,379,2),(3101,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,379,11),(3102,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,379,22),(3103,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,379,8),(3104,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,379,23),(3105,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,379,24),(3106,NULL,NULL,'10-variant-4-8',NULL,NULL,NULL,NULL,NULL,NULL,380,1),(3107,'en','default','TL-23',NULL,NULL,NULL,NULL,NULL,NULL,380,2),(3108,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,380,2),(3109,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,380,11),(3110,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,380,22),(3111,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,380,8),(3112,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,380,23),(3113,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,380,24),(3114,NULL,NULL,'10-variant-4-9',NULL,NULL,NULL,NULL,NULL,NULL,381,1),(3115,'en','default','TL-23',NULL,NULL,NULL,NULL,NULL,NULL,381,2),(3116,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,381,2),(3117,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,381,11),(3118,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,381,22),(3119,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,381,8),(3120,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,381,23),(3121,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,381,24),(3122,NULL,NULL,'10-variant-4-10',NULL,NULL,NULL,NULL,NULL,NULL,382,1),(3123,'en','default','TL-23',NULL,NULL,NULL,NULL,NULL,NULL,382,2),(3124,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,382,2),(3125,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,382,11),(3126,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,382,22),(3127,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,382,8),(3128,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,382,23),(3129,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,382,24),(3130,NULL,NULL,'10-variant-4-11',NULL,NULL,NULL,NULL,NULL,NULL,383,1),(3131,'en','default','TL-23',NULL,NULL,NULL,NULL,NULL,NULL,383,2),(3132,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,383,2),(3133,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,383,11),(3134,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,383,22),(3135,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,383,8),(3136,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,383,23),(3137,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,383,24),(3138,NULL,NULL,'10-variant-5-7',NULL,NULL,NULL,NULL,NULL,NULL,384,1),(3139,'en','default','TL-23',NULL,NULL,NULL,NULL,NULL,NULL,384,2),(3140,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,384,2),(3141,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,384,11),(3142,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,384,22),(3143,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,384,8),(3144,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,384,23),(3145,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,384,24),(3146,NULL,NULL,'10-variant-5-8',NULL,NULL,NULL,NULL,NULL,NULL,385,1),(3147,'en','default','TL-23',NULL,NULL,NULL,NULL,NULL,NULL,385,2),(3148,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,385,2),(3149,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,385,11),(3150,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,385,22),(3151,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,385,8),(3152,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,385,23),(3153,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,385,24),(3154,NULL,NULL,'10-variant-5-9',NULL,NULL,NULL,NULL,NULL,NULL,386,1),(3155,'en','default','TL-23',NULL,NULL,NULL,NULL,NULL,NULL,386,2),(3156,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,386,2),(3157,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,386,11),(3158,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,386,22),(3159,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,386,8),(3160,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,386,23),(3161,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,386,24),(3162,NULL,NULL,'10-variant-5-10',NULL,NULL,NULL,NULL,NULL,NULL,387,1),(3163,'en','default','TL-23',NULL,NULL,NULL,NULL,NULL,NULL,387,2),(3164,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,387,2),(3165,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,387,11),(3166,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,387,22),(3167,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,387,8),(3168,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,387,23),(3169,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,387,24),(3170,NULL,NULL,'10-variant-5-11',NULL,NULL,NULL,NULL,NULL,NULL,388,1),(3171,'en','default','TL-23',NULL,NULL,NULL,NULL,NULL,NULL,388,2),(3172,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,388,2),(3173,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,388,11),(3174,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,388,22),(3175,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,388,8),(3176,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,388,23),(3177,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,388,24),(3178,NULL,NULL,'10-variant-12-7',NULL,NULL,NULL,NULL,NULL,NULL,389,1),(3179,'en','default','TL-23',NULL,NULL,NULL,NULL,NULL,NULL,389,2),(3180,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,389,2),(3181,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,389,11),(3182,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,389,22),(3183,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,389,8),(3184,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,389,23),(3185,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,389,24),(3186,NULL,NULL,'10-variant-12-8',NULL,NULL,NULL,NULL,NULL,NULL,390,1),(3187,'en','default','TL-23',NULL,NULL,NULL,NULL,NULL,NULL,390,2),(3188,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,390,2),(3189,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,390,11),(3190,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,390,22),(3191,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,390,8),(3192,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,390,23),(3193,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,390,24),(3194,NULL,NULL,'10-variant-12-9',NULL,NULL,NULL,NULL,NULL,NULL,391,1),(3195,'en','default','TL-23',NULL,NULL,NULL,NULL,NULL,NULL,391,2),(3196,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,391,2),(3197,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,391,11),(3198,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,391,22),(3199,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,391,8),(3200,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,391,23),(3201,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,391,24),(3202,NULL,NULL,'10-variant-12-10',NULL,NULL,NULL,NULL,NULL,NULL,392,1),(3203,'en','default','TL-23',NULL,NULL,NULL,NULL,NULL,NULL,392,2),(3204,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,392,2),(3205,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,392,11),(3206,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,392,22),(3207,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,392,8),(3208,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,392,23),(3209,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,392,24),(3210,NULL,NULL,'10-variant-12-11',NULL,NULL,NULL,NULL,NULL,NULL,393,1),(3211,'en','default','TL-23',NULL,NULL,NULL,NULL,NULL,NULL,393,2),(3212,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,393,2),(3213,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,393,11),(3214,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,393,22),(3215,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,393,8),(3216,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,393,23),(3217,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,393,24),(3218,'en','default','<p>كعب ستايل زارا</p>',NULL,NULL,NULL,NULL,NULL,NULL,375,9),(3219,'en','default','<p>كعب ستايل زارا</p>',NULL,NULL,NULL,NULL,NULL,NULL,375,10),(3220,NULL,NULL,'10',NULL,NULL,NULL,NULL,NULL,NULL,375,1),(3221,'en','default','TL-23',NULL,NULL,NULL,NULL,NULL,NULL,375,2),(3222,NULL,NULL,'tl-23',NULL,NULL,NULL,NULL,NULL,NULL,375,3),(3223,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,375,4),(3224,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,375,5),(3225,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,375,6),(3226,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,375,7),(3227,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,375,8),(3228,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,375,26),(3229,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,375,16),(3230,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,375,17),(3231,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,375,18),(3232,NULL,NULL,'11-variant-2-6',NULL,NULL,NULL,NULL,NULL,NULL,395,1),(3233,'en','default','TL-22',NULL,NULL,NULL,NULL,NULL,NULL,395,2),(3234,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,395,2),(3235,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,395,11),(3236,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,395,22),(3237,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,395,8),(3238,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,395,23),(3239,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,395,24),(3240,NULL,NULL,'11-variant-3-6',NULL,NULL,NULL,NULL,NULL,NULL,396,1),(3241,'en','default','TL-22',NULL,NULL,NULL,NULL,NULL,NULL,396,2),(3242,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,396,2),(3243,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,396,11),(3244,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,396,22),(3245,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,396,8),(3246,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,396,23),(3247,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,396,24),(3248,NULL,NULL,'11-variant-2-7',NULL,NULL,NULL,NULL,NULL,NULL,397,1),(3249,'en','default','TL-22',NULL,NULL,NULL,NULL,NULL,NULL,397,2),(3250,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,397,2),(3251,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,397,11),(3252,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,397,22),(3253,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,397,8),(3254,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,397,23),(3255,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,397,24),(3256,NULL,NULL,'11-variant-2-8',NULL,NULL,NULL,NULL,NULL,NULL,398,1),(3257,'en','default','TL-22',NULL,NULL,NULL,NULL,NULL,NULL,398,2),(3258,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,398,2),(3259,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,398,11),(3260,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,398,22),(3261,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,398,8),(3262,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,398,23),(3263,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,398,24),(3264,NULL,NULL,'11-variant-2-9',NULL,NULL,NULL,NULL,NULL,NULL,399,1),(3265,'en','default','TL-22',NULL,NULL,NULL,NULL,NULL,NULL,399,2),(3266,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,399,2),(3267,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,399,11),(3268,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,399,22),(3269,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,399,8),(3270,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,399,23),(3271,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,399,24),(3272,NULL,NULL,'11-variant-2-10',NULL,NULL,NULL,NULL,NULL,NULL,400,1),(3273,'en','default','TL-22',NULL,NULL,NULL,NULL,NULL,NULL,400,2),(3274,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,400,2),(3275,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,400,11),(3276,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,400,22),(3277,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,400,8),(3278,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,400,23),(3279,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,400,24),(3280,NULL,NULL,'11-variant-2-11',NULL,NULL,NULL,NULL,NULL,NULL,401,1),(3281,'en','default','TL-22',NULL,NULL,NULL,NULL,NULL,NULL,401,2),(3282,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,401,2),(3283,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,401,11),(3284,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,401,22),(3285,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,401,8),(3286,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,401,23),(3287,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,401,24),(3288,NULL,NULL,'11-variant-3-7',NULL,NULL,NULL,NULL,NULL,NULL,402,1),(3289,'en','default','TL-22',NULL,NULL,NULL,NULL,NULL,NULL,402,2),(3290,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,402,2),(3291,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,402,11),(3292,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,402,22),(3293,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,402,8),(3294,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,402,23),(3295,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,402,24),(3296,NULL,NULL,'11-variant-3-8',NULL,NULL,NULL,NULL,NULL,NULL,403,1),(3297,'en','default','TL-22',NULL,NULL,NULL,NULL,NULL,NULL,403,2),(3298,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,403,2),(3299,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,403,11),(3300,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,403,22),(3301,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,403,8),(3302,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,403,23),(3303,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,403,24),(3304,NULL,NULL,'11-variant-3-9',NULL,NULL,NULL,NULL,NULL,NULL,404,1),(3305,'en','default','TL-22',NULL,NULL,NULL,NULL,NULL,NULL,404,2),(3306,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,404,2),(3307,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,404,11),(3308,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,404,22),(3309,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,404,8),(3310,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,404,23),(3311,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,404,24),(3312,NULL,NULL,'11-variant-3-10',NULL,NULL,NULL,NULL,NULL,NULL,405,1),(3313,'en','default','TL-22',NULL,NULL,NULL,NULL,NULL,NULL,405,2),(3314,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,405,2),(3315,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,405,11),(3316,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,405,22),(3317,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,405,8),(3318,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,405,23),(3319,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,405,24),(3320,NULL,NULL,'11-variant-3-11',NULL,NULL,NULL,NULL,NULL,NULL,406,1),(3321,'en','default','TL-22',NULL,NULL,NULL,NULL,NULL,NULL,406,2),(3322,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,406,2),(3323,NULL,NULL,NULL,NULL,NULL,3.5000,NULL,NULL,NULL,406,11),(3324,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,406,22),(3325,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,406,8),(3326,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,406,23),(3327,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,406,24),(3328,'en','default','<p>فلات صيفي</p>',NULL,NULL,NULL,NULL,NULL,NULL,394,9),(3329,'en','default','<p>فلات صيفي</p>',NULL,NULL,NULL,NULL,NULL,NULL,394,10),(3330,NULL,NULL,'11',NULL,NULL,NULL,NULL,NULL,NULL,394,1),(3331,'en','default','TL-22',NULL,NULL,NULL,NULL,NULL,NULL,394,2),(3332,NULL,NULL,'tl-22',NULL,NULL,NULL,NULL,NULL,NULL,394,3),(3333,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,394,4),(3334,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,394,5),(3335,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,394,6),(3336,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,394,7),(3337,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,394,8),(3338,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,394,26),(3339,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,394,16),(3340,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,394,17),(3341,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,394,18),(3342,NULL,NULL,'12-variant-3-6',NULL,NULL,NULL,NULL,NULL,NULL,408,1),(3343,'en','default','SY148',NULL,NULL,NULL,NULL,NULL,NULL,408,2),(3344,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,408,2),(3345,NULL,NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,408,11),(3346,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,408,22),(3347,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,408,8),(3348,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,408,23),(3349,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,408,24),(3350,NULL,NULL,'12-variant-4-6',NULL,NULL,NULL,NULL,NULL,NULL,409,1),(3351,'en','default','SY148',NULL,NULL,NULL,NULL,NULL,NULL,409,2),(3352,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,409,2),(3353,NULL,NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,409,11),(3354,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,409,22),(3355,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,409,8),(3356,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,409,23),(3357,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,409,24),(3358,NULL,NULL,'12-variant-18-6',NULL,NULL,NULL,NULL,NULL,NULL,410,1),(3359,'en','default','SY148',NULL,NULL,NULL,NULL,NULL,NULL,410,2),(3360,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,410,2),(3361,NULL,NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,410,11),(3362,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,410,22),(3363,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,410,8),(3364,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,410,23),(3365,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,410,24),(3366,NULL,NULL,'12-variant-3-7',NULL,NULL,NULL,NULL,NULL,NULL,411,1),(3367,'en','default','SY148',NULL,NULL,NULL,NULL,NULL,NULL,411,2),(3368,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,411,2),(3369,NULL,NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,411,11),(3370,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,411,22),(3371,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,411,8),(3372,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,411,23),(3373,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,411,24),(3374,NULL,NULL,'12-variant-3-8',NULL,NULL,NULL,NULL,NULL,NULL,412,1),(3375,'en','default','SY148',NULL,NULL,NULL,NULL,NULL,NULL,412,2),(3376,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,412,2),(3377,NULL,NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,412,11),(3378,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,412,22),(3379,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,412,8),(3380,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,412,23),(3381,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,412,24),(3382,NULL,NULL,'12-variant-3-9',NULL,NULL,NULL,NULL,NULL,NULL,413,1),(3383,'en','default','SY148',NULL,NULL,NULL,NULL,NULL,NULL,413,2),(3384,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,413,2),(3385,NULL,NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,413,11),(3386,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,413,22),(3387,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,413,8),(3388,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,413,23),(3389,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,413,24),(3390,NULL,NULL,'12-variant-3-10',NULL,NULL,NULL,NULL,NULL,NULL,414,1),(3391,'en','default','SY148',NULL,NULL,NULL,NULL,NULL,NULL,414,2),(3392,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,414,2),(3393,NULL,NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,414,11),(3394,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,414,22),(3395,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,414,8),(3396,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,414,23),(3397,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,414,24),(3398,NULL,NULL,'12-variant-3-11',NULL,NULL,NULL,NULL,NULL,NULL,415,1),(3399,'en','default','SY148',NULL,NULL,NULL,NULL,NULL,NULL,415,2),(3400,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,415,2),(3401,NULL,NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,415,11),(3402,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,415,22),(3403,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,415,8),(3404,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,415,23),(3405,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,415,24),(3406,NULL,NULL,'12-variant-4-7',NULL,NULL,NULL,NULL,NULL,NULL,416,1),(3407,'en','default','SY148',NULL,NULL,NULL,NULL,NULL,NULL,416,2),(3408,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,416,2),(3409,NULL,NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,416,11),(3410,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,416,22),(3411,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,416,8),(3412,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,416,23),(3413,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,416,24),(3414,NULL,NULL,'12-variant-4-8',NULL,NULL,NULL,NULL,NULL,NULL,417,1),(3415,'en','default','SY148',NULL,NULL,NULL,NULL,NULL,NULL,417,2),(3416,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,417,2),(3417,NULL,NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,417,11),(3418,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,417,22),(3419,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,417,8),(3420,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,417,23),(3421,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,417,24),(3422,NULL,NULL,'12-variant-4-9',NULL,NULL,NULL,NULL,NULL,NULL,418,1),(3423,'en','default','SY148',NULL,NULL,NULL,NULL,NULL,NULL,418,2),(3424,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,418,2),(3425,NULL,NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,418,11),(3426,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,418,22),(3427,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,418,8),(3428,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,418,23),(3429,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,418,24),(3430,NULL,NULL,'12-variant-4-10',NULL,NULL,NULL,NULL,NULL,NULL,419,1),(3431,'en','default','SY148',NULL,NULL,NULL,NULL,NULL,NULL,419,2),(3432,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,419,2),(3433,NULL,NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,419,11),(3434,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,419,22),(3435,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,419,8),(3436,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,419,23),(3437,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,419,24),(3438,NULL,NULL,'12-variant-4-11',NULL,NULL,NULL,NULL,NULL,NULL,420,1),(3439,'en','default','SY148',NULL,NULL,NULL,NULL,NULL,NULL,420,2),(3440,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,420,2),(3441,NULL,NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,420,11),(3442,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,420,22),(3443,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,420,8),(3444,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,420,23),(3445,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,420,24),(3446,NULL,NULL,'12-variant-18-7',NULL,NULL,NULL,NULL,NULL,NULL,421,1),(3447,'en','default','SY148',NULL,NULL,NULL,NULL,NULL,NULL,421,2),(3448,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,421,2),(3449,NULL,NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,421,11),(3450,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,421,22),(3451,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,421,8),(3452,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,421,23),(3453,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,421,24),(3454,NULL,NULL,'12-variant-18-8',NULL,NULL,NULL,NULL,NULL,NULL,422,1),(3455,'en','default','SY148',NULL,NULL,NULL,NULL,NULL,NULL,422,2),(3456,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,422,2),(3457,NULL,NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,422,11),(3458,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,422,22),(3459,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,422,8),(3460,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,422,23),(3461,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,422,24),(3462,NULL,NULL,'12-variant-18-9',NULL,NULL,NULL,NULL,NULL,NULL,423,1),(3463,'en','default','SY148',NULL,NULL,NULL,NULL,NULL,NULL,423,2),(3464,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,423,2),(3465,NULL,NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,423,11),(3466,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,423,22),(3467,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,423,8),(3468,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,423,23),(3469,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,423,24),(3470,NULL,NULL,'12-variant-18-10',NULL,NULL,NULL,NULL,NULL,NULL,424,1),(3471,'en','default','SY148',NULL,NULL,NULL,NULL,NULL,NULL,424,2),(3472,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,424,2),(3473,NULL,NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,424,11),(3474,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,424,22),(3475,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,424,8),(3476,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,424,23),(3477,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,424,24),(3478,NULL,NULL,'12-variant-18-11',NULL,NULL,NULL,NULL,NULL,NULL,425,1),(3479,'en','default','SY148',NULL,NULL,NULL,NULL,NULL,NULL,425,2),(3480,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,425,2),(3481,NULL,NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,425,11),(3482,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,425,22),(3483,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,425,8),(3484,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,425,23),(3485,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,425,24),(3486,'en','default','<p>فلات خفيف</p>',NULL,NULL,NULL,NULL,NULL,NULL,407,9),(3487,'en','default','<p>فلات خفيف</p>',NULL,NULL,NULL,NULL,NULL,NULL,407,10),(3488,NULL,NULL,'12',NULL,NULL,NULL,NULL,NULL,NULL,407,1),(3489,'en','default','SY148',NULL,NULL,NULL,NULL,NULL,NULL,407,2),(3490,NULL,NULL,'sy148',NULL,NULL,NULL,NULL,NULL,NULL,407,3),(3491,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,407,4),(3492,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,407,5),(3493,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,407,6),(3494,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,407,7),(3495,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,407,8),(3496,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,407,26),(3497,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,407,16),(3498,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,407,17),(3499,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,407,18),(3500,NULL,NULL,'13-variant-3-6',NULL,NULL,NULL,NULL,NULL,NULL,427,1),(3501,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,427,2),(3502,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,427,2),(3503,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,427,11),(3504,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,427,22),(3505,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,427,8),(3506,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,427,23),(3507,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,427,24),(3508,NULL,NULL,'13-variant-4-6',NULL,NULL,NULL,NULL,NULL,NULL,428,1),(3509,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,428,2),(3510,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,428,2),(3511,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,428,11),(3512,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,428,22),(3513,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,428,8),(3514,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,428,23),(3515,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,428,24),(3516,NULL,NULL,'13-variant-5-6',NULL,NULL,NULL,NULL,NULL,NULL,429,1),(3517,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,429,2),(3518,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,429,2),(3519,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,429,11),(3520,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,429,22),(3521,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,429,8),(3522,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,429,23),(3523,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,429,24),(3524,NULL,NULL,'13-variant-13-6',NULL,NULL,NULL,NULL,NULL,NULL,430,1),(3525,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,430,2),(3526,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,430,2),(3527,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,430,11),(3528,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,430,22),(3529,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,430,8),(3530,NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,NULL,430,23),(3531,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,430,24),(3532,NULL,NULL,'13-variant-14-6',NULL,NULL,NULL,NULL,NULL,NULL,431,1),(3533,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,431,2),(3534,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,431,2),(3535,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,431,11),(3536,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,431,22),(3537,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,431,8),(3538,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,431,23),(3539,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,431,24),(3540,NULL,NULL,'13-variant-3-7',NULL,NULL,NULL,NULL,NULL,NULL,432,1),(3541,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,432,2),(3542,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,432,2),(3543,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,432,11),(3544,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,432,22),(3545,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,432,8),(3546,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,432,23),(3547,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,432,24),(3548,NULL,NULL,'13-variant-3-8',NULL,NULL,NULL,NULL,NULL,NULL,433,1),(3549,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,433,2),(3550,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,433,2),(3551,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,433,11),(3552,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,433,22),(3553,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,433,8),(3554,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,433,23),(3555,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,433,24),(3556,NULL,NULL,'13-variant-3-9',NULL,NULL,NULL,NULL,NULL,NULL,434,1),(3557,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,434,2),(3558,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,434,2),(3559,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,434,11),(3560,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,434,22),(3561,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,434,8),(3562,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,434,23),(3563,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,434,24),(3564,NULL,NULL,'13-variant-3-10',NULL,NULL,NULL,NULL,NULL,NULL,435,1),(3565,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,435,2),(3566,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,435,2),(3567,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,435,11),(3568,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,435,22),(3569,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,435,8),(3570,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,435,23),(3571,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,435,24),(3572,NULL,NULL,'13-variant-3-11',NULL,NULL,NULL,NULL,NULL,NULL,436,1),(3573,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,436,2),(3574,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,436,2),(3575,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,436,11),(3576,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,436,22),(3577,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,436,8),(3578,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,436,23),(3579,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,436,24),(3580,NULL,NULL,'13-variant-4-7',NULL,NULL,NULL,NULL,NULL,NULL,437,1),(3581,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,437,2),(3582,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,437,2),(3583,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,437,11),(3584,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,437,22),(3585,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,437,8),(3586,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,437,23),(3587,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,437,24),(3588,NULL,NULL,'13-variant-4-8',NULL,NULL,NULL,NULL,NULL,NULL,438,1),(3589,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,438,2),(3590,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,438,2),(3591,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,438,11),(3592,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,438,22),(3593,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,438,8),(3594,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,438,23),(3595,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,438,24),(3596,NULL,NULL,'13-variant-4-9',NULL,NULL,NULL,NULL,NULL,NULL,439,1),(3597,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,439,2),(3598,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,439,2),(3599,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,439,11),(3600,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,439,22),(3601,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,439,8),(3602,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,439,23),(3603,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,439,24),(3604,NULL,NULL,'13-variant-4-10',NULL,NULL,NULL,NULL,NULL,NULL,440,1),(3605,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,440,2),(3606,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,440,2),(3607,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,440,11),(3608,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,440,22),(3609,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,440,8),(3610,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,440,23),(3611,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,440,24),(3612,NULL,NULL,'13-variant-4-11',NULL,NULL,NULL,NULL,NULL,NULL,441,1),(3613,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,441,2),(3614,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,441,2),(3615,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,441,11),(3616,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,441,22),(3617,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,441,8),(3618,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,441,23),(3619,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,441,24),(3620,NULL,NULL,'13-variant-5-7',NULL,NULL,NULL,NULL,NULL,NULL,442,1),(3621,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,442,2),(3622,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,442,2),(3623,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,442,11),(3624,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,442,22),(3625,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,442,8),(3626,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,442,23),(3627,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,442,24),(3628,NULL,NULL,'13-variant-5-8',NULL,NULL,NULL,NULL,NULL,NULL,443,1),(3629,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,443,2),(3630,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,443,2),(3631,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,443,11),(3632,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,443,22),(3633,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,443,8),(3634,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,443,23),(3635,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,443,24),(3636,NULL,NULL,'13-variant-5-9',NULL,NULL,NULL,NULL,NULL,NULL,444,1),(3637,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,444,2),(3638,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,444,2),(3639,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,444,11),(3640,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,444,22),(3641,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,444,8),(3642,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,444,23),(3643,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,444,24),(3644,NULL,NULL,'13-variant-5-10',NULL,NULL,NULL,NULL,NULL,NULL,445,1),(3645,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,445,2),(3646,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,445,2),(3647,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,445,11),(3648,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,445,22),(3649,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,445,8),(3650,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,445,23),(3651,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,445,24),(3652,NULL,NULL,'13-variant-5-11',NULL,NULL,NULL,NULL,NULL,NULL,446,1),(3653,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,446,2),(3654,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,446,2),(3655,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,446,11),(3656,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,446,22),(3657,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,446,8),(3658,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,446,23),(3659,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,446,24),(3660,NULL,NULL,'13-variant-13-7',NULL,NULL,NULL,NULL,NULL,NULL,447,1),(3661,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,447,2),(3662,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,447,2),(3663,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,447,11),(3664,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,447,22),(3665,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,447,8),(3666,NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,NULL,447,23),(3667,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,447,24),(3668,NULL,NULL,'13-variant-13-8',NULL,NULL,NULL,NULL,NULL,NULL,448,1),(3669,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,448,2),(3670,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,448,2),(3671,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,448,11),(3672,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,448,22),(3673,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,448,8),(3674,NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,NULL,448,23),(3675,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,448,24),(3676,NULL,NULL,'13-variant-13-9',NULL,NULL,NULL,NULL,NULL,NULL,449,1),(3677,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,449,2),(3678,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,449,2),(3679,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,449,11),(3680,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,449,22),(3681,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,449,8),(3682,NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,NULL,449,23),(3683,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,449,24),(3684,NULL,NULL,'13-variant-13-10',NULL,NULL,NULL,NULL,NULL,NULL,450,1),(3685,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,450,2),(3686,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,450,2),(3687,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,450,11),(3688,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,450,22),(3689,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,450,8),(3690,NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,NULL,450,23),(3691,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,450,24),(3692,NULL,NULL,'13-variant-13-11',NULL,NULL,NULL,NULL,NULL,NULL,451,1),(3693,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,451,2),(3694,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,451,2),(3695,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,451,11),(3696,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,451,22),(3697,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,451,8),(3698,NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,NULL,451,23),(3699,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,451,24),(3700,NULL,NULL,'13-variant-14-7',NULL,NULL,NULL,NULL,NULL,NULL,452,1),(3701,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,452,2),(3702,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,452,2),(3703,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,452,11),(3704,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,452,22),(3705,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,452,8),(3706,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,452,23),(3707,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,452,24),(3708,NULL,NULL,'13-variant-14-8',NULL,NULL,NULL,NULL,NULL,NULL,453,1),(3709,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,453,2),(3710,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,453,2),(3711,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,453,11),(3712,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,453,22),(3713,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,453,8),(3714,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,453,23),(3715,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,453,24),(3716,NULL,NULL,'13-variant-14-9',NULL,NULL,NULL,NULL,NULL,NULL,454,1),(3717,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,454,2),(3718,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,454,2),(3719,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,454,11),(3720,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,454,22),(3721,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,454,8),(3722,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,454,23),(3723,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,454,24),(3724,NULL,NULL,'13-variant-14-10',NULL,NULL,NULL,NULL,NULL,NULL,455,1),(3725,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,455,2),(3726,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,455,2),(3727,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,455,11),(3728,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,455,22),(3729,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,455,8),(3730,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,455,23),(3731,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,455,24),(3732,NULL,NULL,'13-variant-14-11',NULL,NULL,NULL,NULL,NULL,NULL,456,1),(3733,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,456,2),(3734,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,456,2),(3735,NULL,NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,456,11),(3736,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,456,22),(3737,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,456,8),(3738,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,456,23),(3739,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,456,24),(3740,'en','default','<p>كعب صغير</p>',NULL,NULL,NULL,NULL,NULL,NULL,426,9),(3741,'en','default','<p>كعب صغير</p>',NULL,NULL,NULL,NULL,NULL,NULL,426,10),(3742,NULL,NULL,'13',NULL,NULL,NULL,NULL,NULL,NULL,426,1),(3743,'en','default','PP-576',NULL,NULL,NULL,NULL,NULL,NULL,426,2),(3744,NULL,NULL,'pp-576',NULL,NULL,NULL,NULL,NULL,NULL,426,3),(3745,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,426,4),(3746,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,426,5),(3747,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,426,6),(3748,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,426,7),(3749,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,426,8),(3750,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,426,26),(3751,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,426,16),(3752,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,426,17),(3753,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,426,18),(3754,NULL,NULL,'14-variant-1-6',NULL,NULL,NULL,NULL,NULL,NULL,458,1),(3755,'en','default','988-2',NULL,NULL,NULL,NULL,NULL,NULL,458,2),(3756,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,458,2),(3757,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,458,11),(3758,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,458,22),(3759,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,458,8),(3760,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,458,23),(3761,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,458,24),(3762,NULL,NULL,'14-variant-4-6',NULL,NULL,NULL,NULL,NULL,NULL,459,1),(3763,'en','default','988-2',NULL,NULL,NULL,NULL,NULL,NULL,459,2),(3764,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,459,2),(3765,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,459,11),(3766,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,459,22),(3767,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,459,8),(3768,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,459,23),(3769,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,459,24),(3770,NULL,NULL,'14-variant-5-6',NULL,NULL,NULL,NULL,NULL,NULL,460,1),(3771,'en','default','988-2',NULL,NULL,NULL,NULL,NULL,NULL,460,2),(3772,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,460,2),(3773,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,460,11),(3774,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,460,22),(3775,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,460,8),(3776,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,460,23),(3777,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,460,24),(3778,NULL,NULL,'14-variant-1-7',NULL,NULL,NULL,NULL,NULL,NULL,461,1),(3779,'en','default','988-2',NULL,NULL,NULL,NULL,NULL,NULL,461,2),(3780,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,461,2),(3781,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,461,11),(3782,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,461,22),(3783,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,461,8),(3784,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,461,23),(3785,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,461,24),(3786,NULL,NULL,'14-variant-1-8',NULL,NULL,NULL,NULL,NULL,NULL,462,1),(3787,'en','default','988-2',NULL,NULL,NULL,NULL,NULL,NULL,462,2),(3788,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,462,2),(3789,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,462,11),(3790,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,462,22),(3791,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,462,8),(3792,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,462,23),(3793,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,462,24),(3794,NULL,NULL,'14-variant-1-9',NULL,NULL,NULL,NULL,NULL,NULL,463,1),(3795,'en','default','988-2',NULL,NULL,NULL,NULL,NULL,NULL,463,2),(3796,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,463,2),(3797,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,463,11),(3798,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,463,22),(3799,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,463,8),(3800,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,463,23),(3801,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,463,24),(3802,NULL,NULL,'14-variant-1-10',NULL,NULL,NULL,NULL,NULL,NULL,464,1),(3803,'en','default','988-2',NULL,NULL,NULL,NULL,NULL,NULL,464,2),(3804,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,464,2),(3805,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,464,11),(3806,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,464,22),(3807,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,464,8),(3808,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,464,23),(3809,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,464,24),(3810,NULL,NULL,'14-variant-4-7',NULL,NULL,NULL,NULL,NULL,NULL,465,1),(3811,'en','default','988-2',NULL,NULL,NULL,NULL,NULL,NULL,465,2),(3812,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,465,2),(3813,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,465,11),(3814,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,465,22),(3815,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,465,8),(3816,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,465,23),(3817,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,465,24),(3818,NULL,NULL,'14-variant-4-8',NULL,NULL,NULL,NULL,NULL,NULL,466,1),(3819,'en','default','988-2',NULL,NULL,NULL,NULL,NULL,NULL,466,2),(3820,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,466,2),(3821,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,466,11),(3822,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,466,22),(3823,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,466,8),(3824,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,466,23),(3825,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,466,24),(3826,NULL,NULL,'14-variant-4-9',NULL,NULL,NULL,NULL,NULL,NULL,467,1),(3827,'en','default','988-2',NULL,NULL,NULL,NULL,NULL,NULL,467,2),(3828,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,467,2),(3829,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,467,11),(3830,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,467,22),(3831,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,467,8),(3832,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,467,23),(3833,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,467,24),(3834,NULL,NULL,'14-variant-4-10',NULL,NULL,NULL,NULL,NULL,NULL,468,1),(3835,'en','default','988-2',NULL,NULL,NULL,NULL,NULL,NULL,468,2),(3836,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,468,2),(3837,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,468,11),(3838,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,468,22),(3839,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,468,8),(3840,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,468,23),(3841,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,468,24),(3842,NULL,NULL,'14-variant-5-7',NULL,NULL,NULL,NULL,NULL,NULL,469,1),(3843,'en','default','988-2',NULL,NULL,NULL,NULL,NULL,NULL,469,2),(3844,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,469,2),(3845,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,469,11),(3846,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,469,22),(3847,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,469,8),(3848,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,469,23),(3849,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,469,24),(3850,NULL,NULL,'14-variant-5-8',NULL,NULL,NULL,NULL,NULL,NULL,470,1),(3851,'en','default','988-2',NULL,NULL,NULL,NULL,NULL,NULL,470,2),(3852,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,470,2),(3853,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,470,11),(3854,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,470,22),(3855,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,470,8),(3856,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,470,23),(3857,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,470,24),(3858,NULL,NULL,'14-variant-5-9',NULL,NULL,NULL,NULL,NULL,NULL,471,1),(3859,'en','default','988-2',NULL,NULL,NULL,NULL,NULL,NULL,471,2),(3860,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,471,2),(3861,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,471,11),(3862,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,471,22),(3863,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,471,8),(3864,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,471,23),(3865,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,471,24),(3866,NULL,NULL,'14-variant-5-10',NULL,NULL,NULL,NULL,NULL,NULL,472,1),(3867,'en','default','988-2',NULL,NULL,NULL,NULL,NULL,NULL,472,2),(3868,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,472,2),(3869,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,472,11),(3870,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,472,22),(3871,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,472,8),(3872,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,472,23),(3873,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,472,24),(3874,'en','default','<p>فلات الهبة</p>',NULL,NULL,NULL,NULL,NULL,NULL,457,9),(3875,'en','default','<p>فلات الهبة</p>',NULL,NULL,NULL,NULL,NULL,NULL,457,10),(3876,NULL,NULL,'14',NULL,NULL,NULL,NULL,NULL,NULL,457,1),(3877,'en','default','988-2',NULL,NULL,NULL,NULL,NULL,NULL,457,2),(3878,NULL,NULL,'988-2',NULL,NULL,NULL,NULL,NULL,NULL,457,3),(3879,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,457,4),(3880,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,457,5),(3881,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,457,6),(3882,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,457,7),(3883,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,457,8),(3884,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,457,26),(3885,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,457,16),(3886,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,457,17),(3887,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,457,18),(3888,NULL,NULL,'15-variant-1-6',NULL,NULL,NULL,NULL,NULL,NULL,474,1),(3889,'en','default','988-1',NULL,NULL,NULL,NULL,NULL,NULL,474,2),(3890,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,474,2),(3891,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,474,11),(3892,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,474,22),(3893,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,474,8),(3894,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,474,23),(3895,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,474,24),(3896,NULL,NULL,'15-variant-4-6',NULL,NULL,NULL,NULL,NULL,NULL,475,1),(3897,'en','default','988-1',NULL,NULL,NULL,NULL,NULL,NULL,475,2),(3898,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,475,2),(3899,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,475,11),(3900,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,475,22),(3901,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,475,8),(3902,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,475,23),(3903,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,475,24),(3904,NULL,NULL,'15-variant-5-6',NULL,NULL,NULL,NULL,NULL,NULL,476,1),(3905,'en','default','988-1',NULL,NULL,NULL,NULL,NULL,NULL,476,2),(3906,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,476,2),(3907,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,476,11),(3908,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,476,22),(3909,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,476,8),(3910,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,476,23),(3911,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,476,24),(3912,NULL,NULL,'15-variant-1-7',NULL,NULL,NULL,NULL,NULL,NULL,477,1),(3913,'en','default','988-1',NULL,NULL,NULL,NULL,NULL,NULL,477,2),(3914,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,477,2),(3915,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,477,11),(3916,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,477,22),(3917,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,477,8),(3918,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,477,23),(3919,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,477,24),(3920,NULL,NULL,'15-variant-1-8',NULL,NULL,NULL,NULL,NULL,NULL,478,1),(3921,'en','default','988-1',NULL,NULL,NULL,NULL,NULL,NULL,478,2),(3922,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,478,2),(3923,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,478,11),(3924,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,478,22),(3925,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,478,8),(3926,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,478,23),(3927,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,478,24),(3928,NULL,NULL,'15-variant-1-9',NULL,NULL,NULL,NULL,NULL,NULL,479,1),(3929,'en','default','988-1',NULL,NULL,NULL,NULL,NULL,NULL,479,2),(3930,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,479,2),(3931,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,479,11),(3932,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,479,22),(3933,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,479,8),(3934,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,479,23),(3935,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,479,24),(3936,NULL,NULL,'15-variant-1-10',NULL,NULL,NULL,NULL,NULL,NULL,480,1),(3937,'en','default','988-1',NULL,NULL,NULL,NULL,NULL,NULL,480,2),(3938,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,480,2),(3939,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,480,11),(3940,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,480,22),(3941,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,480,8),(3942,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,480,23),(3943,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,480,24),(3944,NULL,NULL,'15-variant-4-7',NULL,NULL,NULL,NULL,NULL,NULL,481,1),(3945,'en','default','988-1',NULL,NULL,NULL,NULL,NULL,NULL,481,2),(3946,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,481,2),(3947,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,481,11),(3948,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,481,22),(3949,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,481,8),(3950,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,481,23),(3951,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,481,24),(3952,NULL,NULL,'15-variant-4-8',NULL,NULL,NULL,NULL,NULL,NULL,482,1),(3953,'en','default','988-1',NULL,NULL,NULL,NULL,NULL,NULL,482,2),(3954,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,482,2),(3955,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,482,11),(3956,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,482,22),(3957,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,482,8),(3958,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,482,23),(3959,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,482,24),(3960,NULL,NULL,'15-variant-4-9',NULL,NULL,NULL,NULL,NULL,NULL,483,1),(3961,'en','default','988-1',NULL,NULL,NULL,NULL,NULL,NULL,483,2),(3962,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,483,2),(3963,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,483,11),(3964,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,483,22),(3965,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,483,8),(3966,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,483,23),(3967,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,483,24),(3968,NULL,NULL,'15-variant-4-10',NULL,NULL,NULL,NULL,NULL,NULL,484,1),(3969,'en','default','988-1',NULL,NULL,NULL,NULL,NULL,NULL,484,2),(3970,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,484,2),(3971,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,484,11),(3972,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,484,22),(3973,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,484,8),(3974,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,484,23),(3975,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,484,24),(3976,NULL,NULL,'15-variant-5-7',NULL,NULL,NULL,NULL,NULL,NULL,485,1),(3977,'en','default','988-1',NULL,NULL,NULL,NULL,NULL,NULL,485,2),(3978,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,485,2),(3979,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,485,11),(3980,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,485,22),(3981,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,485,8),(3982,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,485,23),(3983,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,485,24),(3984,NULL,NULL,'15-variant-5-8',NULL,NULL,NULL,NULL,NULL,NULL,486,1),(3985,'en','default','988-1',NULL,NULL,NULL,NULL,NULL,NULL,486,2),(3986,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,486,2),(3987,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,486,11),(3988,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,486,22),(3989,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,486,8),(3990,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,486,23),(3991,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,486,24),(3992,NULL,NULL,'15-variant-5-9',NULL,NULL,NULL,NULL,NULL,NULL,487,1),(3993,'en','default','988-1',NULL,NULL,NULL,NULL,NULL,NULL,487,2),(3994,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,487,2),(3995,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,487,11),(3996,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,487,22),(3997,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,487,8),(3998,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,487,23),(3999,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,487,24),(4000,NULL,NULL,'15-variant-5-10',NULL,NULL,NULL,NULL,NULL,NULL,488,1),(4001,'en','default','988-1',NULL,NULL,NULL,NULL,NULL,NULL,488,2),(4002,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,488,2),(4003,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,488,11),(4004,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,488,22),(4005,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,488,8),(4006,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,488,23),(4007,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,488,24),(4008,'en','default','<p>فلا الهبه</p>',NULL,NULL,NULL,NULL,NULL,NULL,473,9),(4009,'en','default','<p>فلات الهبه</p>',NULL,NULL,NULL,NULL,NULL,NULL,473,10),(4010,NULL,NULL,'15',NULL,NULL,NULL,NULL,NULL,NULL,473,1),(4011,'en','default','988-1',NULL,NULL,NULL,NULL,NULL,NULL,473,2),(4012,NULL,NULL,'988-1',NULL,NULL,NULL,NULL,NULL,NULL,473,3),(4013,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,473,4),(4014,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,473,5),(4015,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,473,6),(4016,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,473,7),(4017,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,473,8),(4018,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,473,26),(4019,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,473,16),(4020,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,473,17),(4021,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,473,18),(4022,NULL,NULL,'16-variant-1-6',NULL,NULL,NULL,NULL,NULL,NULL,490,1),(4023,'en','default','986-1',NULL,NULL,NULL,NULL,NULL,NULL,490,2),(4024,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,490,2),(4025,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,490,11),(4026,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,490,22),(4027,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,490,8),(4028,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,490,23),(4029,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,490,24),(4030,NULL,NULL,'16-variant-4-6',NULL,NULL,NULL,NULL,NULL,NULL,491,1),(4031,'en','default','986-1',NULL,NULL,NULL,NULL,NULL,NULL,491,2),(4032,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,491,2),(4033,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,491,11),(4034,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,491,22),(4035,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,491,8),(4036,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,491,23),(4037,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,491,24),(4038,NULL,NULL,'16-variant-5-6',NULL,NULL,NULL,NULL,NULL,NULL,492,1),(4039,'en','default','986-1',NULL,NULL,NULL,NULL,NULL,NULL,492,2),(4040,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,492,2),(4041,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,492,11),(4042,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,492,22),(4043,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,492,8),(4044,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,492,23),(4045,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,492,24),(4046,NULL,NULL,'16-variant-1-7',NULL,NULL,NULL,NULL,NULL,NULL,493,1),(4047,'en','default','986-1',NULL,NULL,NULL,NULL,NULL,NULL,493,2),(4048,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,493,2),(4049,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,493,11),(4050,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,493,22),(4051,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,493,8),(4052,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,493,23),(4053,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,493,24),(4054,NULL,NULL,'16-variant-1-8',NULL,NULL,NULL,NULL,NULL,NULL,494,1),(4055,'en','default','986-1',NULL,NULL,NULL,NULL,NULL,NULL,494,2),(4056,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,494,2),(4057,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,494,11),(4058,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,494,22),(4059,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,494,8),(4060,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,494,23),(4061,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,494,24),(4062,NULL,NULL,'16-variant-1-9',NULL,NULL,NULL,NULL,NULL,NULL,495,1),(4063,'en','default','986-1',NULL,NULL,NULL,NULL,NULL,NULL,495,2),(4064,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,495,2),(4065,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,495,11),(4066,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,495,22),(4067,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,495,8),(4068,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,495,23),(4069,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,495,24),(4070,NULL,NULL,'16-variant-1-10',NULL,NULL,NULL,NULL,NULL,NULL,496,1),(4071,'en','default','986-1',NULL,NULL,NULL,NULL,NULL,NULL,496,2),(4072,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,496,2),(4073,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,496,11),(4074,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,496,22),(4075,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,496,8),(4076,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,496,23),(4077,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,496,24),(4078,NULL,NULL,'16-variant-4-7',NULL,NULL,NULL,NULL,NULL,NULL,497,1),(4079,'en','default','986-1',NULL,NULL,NULL,NULL,NULL,NULL,497,2),(4080,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,497,2),(4081,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,497,11),(4082,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,497,22),(4083,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,497,8),(4084,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,497,23),(4085,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,497,24),(4086,NULL,NULL,'16-variant-4-8',NULL,NULL,NULL,NULL,NULL,NULL,498,1),(4087,'en','default','986-1',NULL,NULL,NULL,NULL,NULL,NULL,498,2),(4088,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,498,2),(4089,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,498,11),(4090,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,498,22),(4091,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,498,8),(4092,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,498,23),(4093,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,498,24),(4094,NULL,NULL,'16-variant-4-9',NULL,NULL,NULL,NULL,NULL,NULL,499,1),(4095,'en','default','986-1',NULL,NULL,NULL,NULL,NULL,NULL,499,2),(4096,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,499,2),(4097,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,499,11),(4098,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,499,22),(4099,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,499,8),(4100,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,499,23),(4101,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,499,24),(4102,NULL,NULL,'16-variant-4-10',NULL,NULL,NULL,NULL,NULL,NULL,500,1),(4103,'en','default','986-1',NULL,NULL,NULL,NULL,NULL,NULL,500,2),(4104,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,500,2),(4105,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,500,11),(4106,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,500,22),(4107,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,500,8),(4108,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,500,23),(4109,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,500,24),(4110,NULL,NULL,'16-variant-5-7',NULL,NULL,NULL,NULL,NULL,NULL,501,1),(4111,'en','default','986-1',NULL,NULL,NULL,NULL,NULL,NULL,501,2),(4112,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,501,2),(4113,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,501,11),(4114,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,501,22),(4115,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,501,8),(4116,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,501,23),(4117,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,501,24),(4118,NULL,NULL,'16-variant-5-8',NULL,NULL,NULL,NULL,NULL,NULL,502,1),(4119,'en','default','986-1',NULL,NULL,NULL,NULL,NULL,NULL,502,2),(4120,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,502,2),(4121,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,502,11),(4122,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,502,22),(4123,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,502,8),(4124,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,502,23),(4125,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,502,24),(4126,NULL,NULL,'16-variant-5-9',NULL,NULL,NULL,NULL,NULL,NULL,503,1),(4127,'en','default','986-1',NULL,NULL,NULL,NULL,NULL,NULL,503,2),(4128,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,503,2),(4129,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,503,11),(4130,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,503,22),(4131,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,503,8),(4132,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,503,23),(4133,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,503,24),(4134,NULL,NULL,'16-variant-5-10',NULL,NULL,NULL,NULL,NULL,NULL,504,1),(4135,'en','default','986-1',NULL,NULL,NULL,NULL,NULL,NULL,504,2),(4136,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,504,2),(4137,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,504,11),(4138,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,504,22),(4139,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,504,8),(4140,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,504,23),(4141,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,504,24),(4142,'en','default','<p>فلات الهبة</p>',NULL,NULL,NULL,NULL,NULL,NULL,489,9),(4143,'en','default','<p>فلات الهبة</p>',NULL,NULL,NULL,NULL,NULL,NULL,489,10),(4144,NULL,NULL,'16',NULL,NULL,NULL,NULL,NULL,NULL,489,1),(4145,'en','default','986-1',NULL,NULL,NULL,NULL,NULL,NULL,489,2),(4146,NULL,NULL,'986-1',NULL,NULL,NULL,NULL,NULL,NULL,489,3),(4147,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,489,4),(4148,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,489,5),(4149,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,489,6),(4150,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,489,7),(4151,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,489,8),(4152,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,489,26),(4153,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,489,16),(4154,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,489,17),(4155,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,489,18),(4156,NULL,NULL,'17-variant-1-6',NULL,NULL,NULL,NULL,NULL,NULL,506,1),(4157,'en','default','988-5',NULL,NULL,NULL,NULL,NULL,NULL,506,2),(4158,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,506,2),(4159,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,506,11),(4160,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,506,22),(4161,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,506,8),(4162,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,506,23),(4163,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,506,24),(4164,NULL,NULL,'17-variant-4-6',NULL,NULL,NULL,NULL,NULL,NULL,507,1),(4165,'en','default','988-5',NULL,NULL,NULL,NULL,NULL,NULL,507,2),(4166,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,507,2),(4167,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,507,11),(4168,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,507,22),(4169,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,507,8),(4170,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,507,23),(4171,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,507,24),(4172,NULL,NULL,'17-variant-5-6',NULL,NULL,NULL,NULL,NULL,NULL,508,1),(4173,'en','default','988-5',NULL,NULL,NULL,NULL,NULL,NULL,508,2),(4174,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,508,2),(4175,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,508,11),(4176,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,508,22),(4177,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,508,8),(4178,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,508,23),(4179,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,508,24),(4180,NULL,NULL,'17-variant-1-7',NULL,NULL,NULL,NULL,NULL,NULL,509,1),(4181,'en','default','988-5',NULL,NULL,NULL,NULL,NULL,NULL,509,2),(4182,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,509,2),(4183,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,509,11),(4184,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,509,22),(4185,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,509,8),(4186,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,509,23),(4187,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,509,24),(4188,NULL,NULL,'17-variant-1-8',NULL,NULL,NULL,NULL,NULL,NULL,510,1),(4189,'en','default','988-5',NULL,NULL,NULL,NULL,NULL,NULL,510,2),(4190,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,510,2),(4191,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,510,11),(4192,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,510,22),(4193,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,510,8),(4194,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,510,23),(4195,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,510,24),(4196,NULL,NULL,'17-variant-1-9',NULL,NULL,NULL,NULL,NULL,NULL,511,1),(4197,'en','default','988-5',NULL,NULL,NULL,NULL,NULL,NULL,511,2),(4198,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,511,2),(4199,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,511,11),(4200,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,511,22),(4201,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,511,8),(4202,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,511,23),(4203,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,511,24),(4204,NULL,NULL,'17-variant-1-10',NULL,NULL,NULL,NULL,NULL,NULL,512,1),(4205,'en','default','988-5',NULL,NULL,NULL,NULL,NULL,NULL,512,2),(4206,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,512,2),(4207,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,512,11),(4208,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,512,22),(4209,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,512,8),(4210,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,512,23),(4211,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,512,24),(4212,NULL,NULL,'17-variant-4-7',NULL,NULL,NULL,NULL,NULL,NULL,513,1),(4213,'en','default','988-5',NULL,NULL,NULL,NULL,NULL,NULL,513,2),(4214,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,513,2),(4215,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,513,11),(4216,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,513,22),(4217,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,513,8),(4218,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,513,23),(4219,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,513,24),(4220,NULL,NULL,'17-variant-4-8',NULL,NULL,NULL,NULL,NULL,NULL,514,1),(4221,'en','default','988-5',NULL,NULL,NULL,NULL,NULL,NULL,514,2),(4222,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,514,2),(4223,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,514,11),(4224,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,514,22),(4225,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,514,8),(4226,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,514,23),(4227,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,514,24),(4228,NULL,NULL,'17-variant-4-9',NULL,NULL,NULL,NULL,NULL,NULL,515,1),(4229,'en','default','988-5',NULL,NULL,NULL,NULL,NULL,NULL,515,2),(4230,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,515,2),(4231,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,515,11),(4232,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,515,22),(4233,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,515,8),(4234,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,515,23),(4235,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,515,24),(4236,NULL,NULL,'17-variant-4-10',NULL,NULL,NULL,NULL,NULL,NULL,516,1),(4237,'en','default','988-5',NULL,NULL,NULL,NULL,NULL,NULL,516,2),(4238,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,516,2),(4239,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,516,11),(4240,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,516,22),(4241,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,516,8),(4242,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,516,23),(4243,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,516,24),(4244,NULL,NULL,'17-variant-5-7',NULL,NULL,NULL,NULL,NULL,NULL,517,1),(4245,'en','default','988-5',NULL,NULL,NULL,NULL,NULL,NULL,517,2),(4246,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,517,2),(4247,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,517,11),(4248,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,517,22),(4249,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,517,8),(4250,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,517,23),(4251,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,517,24),(4252,NULL,NULL,'17-variant-5-8',NULL,NULL,NULL,NULL,NULL,NULL,518,1),(4253,'en','default','988-5',NULL,NULL,NULL,NULL,NULL,NULL,518,2),(4254,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,518,2),(4255,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,518,11),(4256,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,518,22),(4257,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,518,8),(4258,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,518,23),(4259,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,518,24),(4260,NULL,NULL,'17-variant-5-9',NULL,NULL,NULL,NULL,NULL,NULL,519,1),(4261,'en','default','988-5',NULL,NULL,NULL,NULL,NULL,NULL,519,2),(4262,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,519,2),(4263,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,519,11),(4264,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,519,22),(4265,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,519,8),(4266,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,519,23),(4267,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,519,24),(4268,NULL,NULL,'17-variant-5-10',NULL,NULL,NULL,NULL,NULL,NULL,520,1),(4269,'en','default','988-5',NULL,NULL,NULL,NULL,NULL,NULL,520,2),(4270,'ar','default','',NULL,NULL,NULL,NULL,NULL,NULL,520,2),(4271,NULL,NULL,NULL,NULL,NULL,4.0000,NULL,NULL,NULL,520,11),(4272,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,520,22),(4273,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,520,8),(4274,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,520,23),(4275,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,520,24),(4276,'en','default','<p>فلات الهبة</p>',NULL,NULL,NULL,NULL,NULL,NULL,505,9),(4277,'en','default','<p>فلات الهبة</p>',NULL,NULL,NULL,NULL,NULL,NULL,505,10),(4278,NULL,NULL,'17',NULL,NULL,NULL,NULL,NULL,NULL,505,1),(4279,'en','default','988-5',NULL,NULL,NULL,NULL,NULL,NULL,505,2),(4280,NULL,NULL,'988-5',NULL,NULL,NULL,NULL,NULL,NULL,505,3),(4281,NULL,'default',NULL,NULL,0,NULL,NULL,NULL,NULL,505,4),(4282,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,505,5),(4283,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,505,6),(4284,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,505,7),(4285,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,505,8),(4286,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,505,26),(4287,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,505,16),(4288,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,505,17),(4289,'en','default','',NULL,NULL,NULL,NULL,NULL,NULL,505,18);
/*!40000 ALTER TABLE `product_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_option_products`
--

DROP TABLE IF EXISTS `product_bundle_option_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_bundle_option_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `product_bundle_option_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_bundle_option_products_product_bundle_option_id_foreign` (`product_bundle_option_id`),
  KEY `product_bundle_option_products_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_option_products_product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_option_products`
--

LOCK TABLES `product_bundle_option_products` WRITE;
/*!40000 ALTER TABLE `product_bundle_option_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_option_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_option_translations`
--

DROP TABLE IF EXISTS `product_bundle_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_bundle_option_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `product_bundle_option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`),
  CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_option_translations`
--

LOCK TABLES `product_bundle_option_translations` WRITE;
/*!40000 ALTER TABLE `product_bundle_option_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_options`
--

DROP TABLE IF EXISTS `product_bundle_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_bundle_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_bundle_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_options`
--

LOCK TABLES `product_bundle_options` WRITE;
/*!40000 ALTER TABLE `product_bundle_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categories` (
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  KEY `product_categories_product_id_foreign` (`product_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (226,1),(239,1),(255,1),(274,1);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_cross_sells`
--

DROP TABLE IF EXISTS `product_cross_sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_cross_sells` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  KEY `product_cross_sells_parent_id_foreign` (`parent_id`),
  KEY `product_cross_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_cross_sells`
--

LOCK TABLES `product_cross_sells` WRITE;
/*!40000 ALTER TABLE `product_cross_sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_cross_sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_link_translations`
--

DROP TABLE IF EXISTS `product_downloadable_link_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_downloadable_link_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `product_downloadable_link_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`),
  CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_link_translations`
--

LOCK TABLES `product_downloadable_link_translations` WRITE;
/*!40000 ALTER TABLE `product_downloadable_link_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_link_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_links`
--

DROP TABLE IF EXISTS `product_downloadable_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_downloadable_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sample_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloads` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_links_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_links`
--

LOCK TABLES `product_downloadable_links` WRITE;
/*!40000 ALTER TABLE `product_downloadable_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_sample_translations`
--

DROP TABLE IF EXISTS `product_downloadable_sample_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_downloadable_sample_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `product_downloadable_sample_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`),
  CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_sample_translations`
--

LOCK TABLES `product_downloadable_sample_translations` WRITE;
/*!40000 ALTER TABLE `product_downloadable_sample_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_sample_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_samples`
--

DROP TABLE IF EXISTS `product_downloadable_samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_downloadable_samples` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_samples_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_samples`
--

LOCK TABLES `product_downloadable_samples` WRITE;
/*!40000 ALTER TABLE `product_downloadable_samples` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_samples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_flat`
--

DROP TABLE IF EXISTS `product_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_flat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `url_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `cost` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `color` int(11) DEFAULT NULL,
  `color_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `size_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `height` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  KEY `product_flat_parent_id_foreign` (`parent_id`),
  CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1041 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_flat`
--

LOCK TABLES `product_flat` WRITE;
/*!40000 ALTER TABLE `product_flat` DISABLE KEYS */;
INSERT INTO `product_flat` VALUES (43,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-23 02:07:53','en','default',22,'2020-09-23 02:07:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-23 02:07:53','ar','default',22,'2020-09-23 02:07:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-23 23:59:26','en','default',23,'2020-09-23 23:59:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-23 23:59:26','ar','default',23,'2020-09-23 23:59:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-24 00:22:16','en','default',25,'2020-09-24 00:22:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-24 00:22:16','ar','default',25,'2020-09-24 00:22:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-24 00:45:50','en','default',27,'2020-09-24 00:45:50',NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL),(54,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-24 00:45:50','ar','default',27,'2020-09-24 00:45:50',NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL),(115,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-24 12:02:08','en','default',58,'2020-09-24 12:02:08',NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL),(116,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-24 12:02:08','ar','default',58,'2020-09-24 12:02:08',NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL),(205,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-24 13:09:48','en','default',103,'2020-09-24 13:09:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(206,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-24 13:09:48','ar','default',103,'2020-09-24 13:09:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(207,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-24 13:13:33','en','default',104,'2020-09-24 13:13:33',NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL),(208,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-24 13:13:33','ar','default',104,'2020-09-24 13:13:33',NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL),(329,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-24 13:27:24','en','default',165,'2020-09-24 13:27:24',NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL),(330,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-24 13:27:24','ar','default',165,'2020-09-24 13:27:24',NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL),(451,'1','1836-102','<p>كعب مربع تقليد ماركة كالورينا هريرا</p>','1836-102',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-24 13:37:26','en','default',226,'2020-09-24 13:37:26',NULL,1,0.0000,0.0000,'<p>كعب مربع تقليد شكل ماركة كالورينا هريرا&nbsp;</p>','','','',NULL),(452,'1',NULL,NULL,'1836-102',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-24 13:37:26','ar','default',226,'2020-09-24 13:37:26',NULL,1,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL),(453,'1-variant-4-6','1836-102',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',6,'36','2020-09-24 13:37:26','en','default',227,'2020-09-24 13:37:26',451,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(454,'1-variant-4-6','',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,4,'',6,'','2020-09-24 13:37:26','ar','default',227,'2020-09-24 13:37:26',452,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(455,'1-variant-15-6','1836-102',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,15,'gold',6,'36','2020-09-24 13:37:26','en','default',228,'2020-09-24 13:37:26',451,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(456,'1-variant-15-6','',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,15,'',6,'','2020-09-24 13:37:26','ar','default',228,'2020-09-24 13:37:26',452,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(457,'1-variant-4-7','1836-102',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',7,'37','2020-09-24 13:37:26','en','default',229,'2020-09-24 13:37:26',451,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(458,'1-variant-4-7','',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,4,'',7,'','2020-09-24 13:37:26','ar','default',229,'2020-09-24 13:37:26',452,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(459,'1-variant-4-8','1836-102',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',8,'38','2020-09-24 13:37:26','en','default',230,'2020-09-24 13:37:26',451,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(460,'1-variant-4-8','',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,4,'',8,'','2020-09-24 13:37:26','ar','default',230,'2020-09-24 13:37:26',452,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(461,'1-variant-4-9','1836-102',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',9,'39','2020-09-24 13:37:26','en','default',231,'2020-09-24 13:37:26',451,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(462,'1-variant-4-9','',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,4,'',9,'','2020-09-24 13:37:26','ar','default',231,'2020-09-24 13:37:26',452,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(463,'1-variant-4-10','1836-102',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',10,'40','2020-09-24 13:37:26','en','default',232,'2020-09-24 13:37:26',451,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(464,'1-variant-4-10','',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,4,'',10,'','2020-09-24 13:37:26','ar','default',232,'2020-09-24 13:37:26',452,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(465,'1-variant-4-11','1836-102',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',11,'41','2020-09-24 13:37:26','en','default',233,'2020-09-24 13:37:26',451,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(466,'1-variant-4-11','',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,4,'',11,'','2020-09-24 13:37:26','ar','default',233,'2020-09-24 13:37:26',452,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(467,'1-variant-15-7','1836-102',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,15,'gold',7,'37','2020-09-24 13:37:26','en','default',234,'2020-09-24 13:37:26',451,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(468,'1-variant-15-7','',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,15,'',7,'','2020-09-24 13:37:26','ar','default',234,'2020-09-24 13:37:26',452,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(469,'1-variant-15-8','1836-102',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,15,'gold',8,'38','2020-09-24 13:37:26','en','default',235,'2020-09-24 13:37:26',451,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(470,'1-variant-15-8','',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,15,'',8,'','2020-09-24 13:37:26','ar','default',235,'2020-09-24 13:37:26',452,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(471,'1-variant-15-9','1836-102',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,15,'gold',9,'39','2020-09-24 13:37:26','en','default',236,'2020-09-24 13:37:26',451,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(472,'1-variant-15-9','',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,15,'',9,'','2020-09-24 13:37:26','ar','default',236,'2020-09-24 13:37:26',452,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(473,'1-variant-15-10','1836-102',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,15,'gold',10,'40','2020-09-24 13:37:26','en','default',237,'2020-09-24 13:37:26',451,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(474,'1-variant-15-10','',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,15,'',10,'','2020-09-24 13:37:26','ar','default',237,'2020-09-24 13:37:26',452,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(475,'1-variant-15-11','1836-102',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,15,'gold',11,'41','2020-09-24 13:37:26','en','default',238,'2020-09-24 13:37:26',451,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(476,'1-variant-15-11','',NULL,NULL,NULL,NULL,1,NULL,6.0000,NULL,NULL,NULL,NULL,0.0000,15,'',11,'','2020-09-24 13:37:26','ar','default',238,'2020-09-24 13:37:26',452,NULL,6.0000,6.0000,NULL,NULL,NULL,NULL,NULL),(477,'2','18387','<p>كعب لماعي مرصع بالفص</p>','18387',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-24 13:56:41','en','default',239,'2020-09-24 13:56:41',NULL,1,0.0000,0.0000,'<p>كعب لماعي مرصع بالفص&nbsp;</p>','كعب لماعي مرصع بالفص','','',NULL),(478,'2',NULL,NULL,'18387',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-24 13:56:41','ar','default',239,'2020-09-24 13:56:41',NULL,1,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL),(479,'2-variant-4-7','18387',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',7,'37','2020-09-24 13:56:41','en','default',240,'2020-09-24 13:56:41',477,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(480,'2-variant-4-7','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',7,'','2020-09-24 13:56:41','ar','default',240,'2020-09-24 13:56:41',478,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(481,'2-variant-15-7','18387',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'gold',7,'37','2020-09-24 13:56:41','en','default',241,'2020-09-24 13:56:41',477,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(482,'2-variant-15-7','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'',7,'','2020-09-24 13:56:41','ar','default',241,'2020-09-24 13:56:41',478,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(483,'2-variant-17-7','18387',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'pink',7,'37','2020-09-24 13:56:41','en','default',242,'2020-09-24 13:56:41',477,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(484,'2-variant-17-7','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'',7,'','2020-09-24 13:56:41','ar','default',242,'2020-09-24 13:56:41',478,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(485,'2-variant-4-8','18387',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',8,'38','2020-09-24 13:56:41','en','default',243,'2020-09-24 13:56:41',477,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(486,'2-variant-4-8','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',8,'','2020-09-24 13:56:41','ar','default',243,'2020-09-24 13:56:41',478,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(487,'2-variant-4-9','18387',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',9,'39','2020-09-24 13:56:41','en','default',244,'2020-09-24 13:56:41',477,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(488,'2-variant-4-9','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',9,'','2020-09-24 13:56:41','ar','default',244,'2020-09-24 13:56:41',478,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(489,'2-variant-4-10','18387',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',10,'40','2020-09-24 13:56:41','en','default',245,'2020-09-24 13:56:41',477,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(490,'2-variant-4-10','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',10,'','2020-09-24 13:56:41','ar','default',245,'2020-09-24 13:56:41',478,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(491,'2-variant-4-11','18387',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',11,'41','2020-09-24 13:56:41','en','default',246,'2020-09-24 13:56:41',477,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(492,'2-variant-4-11','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',11,'','2020-09-24 13:56:41','ar','default',246,'2020-09-24 13:56:41',478,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(493,'2-variant-15-8','18387',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'gold',8,'38','2020-09-24 13:56:41','en','default',247,'2020-09-24 13:56:41',477,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(494,'2-variant-15-8','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'',8,'','2020-09-24 13:56:41','ar','default',247,'2020-09-24 13:56:41',478,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(495,'2-variant-15-9','18387',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'gold',9,'39','2020-09-24 13:56:41','en','default',248,'2020-09-24 13:56:41',477,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(496,'2-variant-15-9','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'',9,'','2020-09-24 13:56:41','ar','default',248,'2020-09-24 13:56:41',478,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(497,'2-variant-15-10','18387',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'gold',10,'40','2020-09-24 13:56:41','en','default',249,'2020-09-24 13:56:41',477,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(498,'2-variant-15-10','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'',10,'','2020-09-24 13:56:41','ar','default',249,'2020-09-24 13:56:41',478,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(499,'2-variant-15-11','18387',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'gold',11,'41','2020-09-24 13:56:41','en','default',250,'2020-09-24 13:56:41',477,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(500,'2-variant-15-11','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'',11,'','2020-09-24 13:56:41','ar','default',250,'2020-09-24 13:56:41',478,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(501,'2-variant-17-8','18387',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'pink',8,'38','2020-09-24 13:56:41','en','default',251,'2020-09-24 13:56:41',477,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(502,'2-variant-17-8','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'',8,'','2020-09-24 13:56:41','ar','default',251,'2020-09-24 13:56:41',478,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(503,'2-variant-17-9','18387',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'pink',9,'39','2020-09-24 13:56:41','en','default',252,'2020-09-24 13:56:41',477,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(504,'2-variant-17-9','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'',9,'','2020-09-24 13:56:41','ar','default',252,'2020-09-24 13:56:41',478,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(505,'2-variant-17-10','18387',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'pink',10,'40','2020-09-24 13:56:41','en','default',253,'2020-09-24 13:56:41',477,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(506,'2-variant-17-10','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'',10,'','2020-09-24 13:56:41','ar','default',253,'2020-09-24 13:56:41',478,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(507,'2-variant-17-11','18387',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'pink',11,'41','2020-09-24 13:56:41','en','default',254,'2020-09-24 13:56:41',477,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(508,'2-variant-17-11','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'',11,'','2020-09-24 13:56:41','ar','default',254,'2020-09-24 13:56:41',478,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(509,'3','TL-42','<p>كعب مربع انيق</p>','tl-42',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-24 16:25:58','en','default',255,'2020-09-24 16:25:58',NULL,1,0.0000,0.0000,'<p>كعب مربع انيق</p>','كعب مربع انيق','','',NULL),(510,'3',NULL,NULL,'tl-42',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-24 16:25:58','ar','default',255,'2020-09-24 16:25:58',NULL,1,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL),(511,'3-variant-4-6','TL-42',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',6,'36','2020-09-24 16:25:58','en','default',256,'2020-09-24 16:25:58',509,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(512,'3-variant-4-6','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',6,'','2020-09-24 16:25:58','ar','default',256,'2020-09-24 16:25:58',510,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(513,'3-variant-5-6','TL-42',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',6,'36','2020-09-24 16:25:58','en','default',257,'2020-09-24 16:25:58',509,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(514,'3-variant-5-6','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'',6,'','2020-09-24 16:25:58','ar','default',257,'2020-09-24 16:25:58',510,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(515,'3-variant-18-6','TL-42',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,18,'wine',6,'36','2020-09-24 16:25:58','en','default',258,'2020-09-24 16:25:58',509,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(516,'3-variant-18-6','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,18,'عنابي',6,'','2020-09-24 16:25:58','ar','default',258,'2020-09-24 16:25:58',510,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(517,'3-variant-4-7','TL-42',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',7,'37','2020-09-24 16:25:58','en','default',259,'2020-09-24 16:25:58',509,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(518,'3-variant-4-7','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',7,'','2020-09-24 16:25:58','ar','default',259,'2020-09-24 16:25:58',510,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(519,'3-variant-4-8','TL-42',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',8,'38','2020-09-24 16:25:58','en','default',260,'2020-09-24 16:25:58',509,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(520,'3-variant-4-8','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',8,'','2020-09-24 16:25:58','ar','default',260,'2020-09-24 16:25:58',510,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(521,'3-variant-4-9','TL-42',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',9,'39','2020-09-24 16:25:58','en','default',261,'2020-09-24 16:25:58',509,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(522,'3-variant-4-9','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',9,'','2020-09-24 16:25:58','ar','default',261,'2020-09-24 16:25:58',510,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(523,'3-variant-4-10','TL-42',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',10,'40','2020-09-24 16:25:58','en','default',262,'2020-09-24 16:25:58',509,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(524,'3-variant-4-10','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',10,'','2020-09-24 16:25:58','ar','default',262,'2020-09-24 16:25:58',510,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(525,'3-variant-4-11','TL-42',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',11,'41','2020-09-24 16:25:59','en','default',263,'2020-09-24 16:25:59',509,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(526,'3-variant-4-11','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',11,'','2020-09-24 16:25:59','ar','default',263,'2020-09-24 16:25:59',510,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(527,'3-variant-5-7','TL-42',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',7,'37','2020-09-24 16:25:59','en','default',264,'2020-09-24 16:25:59',509,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(528,'3-variant-5-7','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'',7,'','2020-09-24 16:25:59','ar','default',264,'2020-09-24 16:25:59',510,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(529,'3-variant-5-8','TL-42',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',8,'38','2020-09-24 16:25:59','en','default',265,'2020-09-24 16:25:59',509,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(530,'3-variant-5-8','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'',8,'','2020-09-24 16:25:59','ar','default',265,'2020-09-24 16:25:59',510,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(531,'3-variant-5-9','TL-42',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',9,'39','2020-09-24 16:25:59','en','default',266,'2020-09-24 16:25:59',509,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(532,'3-variant-5-9','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'',9,'','2020-09-24 16:25:59','ar','default',266,'2020-09-24 16:25:59',510,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(533,'3-variant-5-10','TL-42',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',10,'40','2020-09-24 16:25:59','en','default',267,'2020-09-24 16:25:59',509,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(534,'3-variant-5-10','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'',10,'','2020-09-24 16:25:59','ar','default',267,'2020-09-24 16:25:59',510,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(535,'3-variant-5-11','TL-42',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',11,'41','2020-09-24 16:25:59','en','default',268,'2020-09-24 16:25:59',509,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(536,'3-variant-5-11','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'',11,'','2020-09-24 16:25:59','ar','default',268,'2020-09-24 16:25:59',510,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(537,'3-variant-18-7','TL-42',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,18,'wine',7,'37','2020-09-24 16:25:59','en','default',269,'2020-09-24 16:25:59',509,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(538,'3-variant-18-7','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,18,'عنابي',7,'','2020-09-24 16:25:59','ar','default',269,'2020-09-24 16:25:59',510,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(539,'3-variant-18-8','TL-42',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,18,'wine',8,'38','2020-09-24 16:25:59','en','default',270,'2020-09-24 16:25:59',509,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(540,'3-variant-18-8','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,18,'عنابي',8,'','2020-09-24 16:25:59','ar','default',270,'2020-09-24 16:25:59',510,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(541,'3-variant-18-9','TL-42',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,18,'wine',9,'39','2020-09-24 16:25:59','en','default',271,'2020-09-24 16:25:59',509,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(542,'3-variant-18-9','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,18,'عنابي',9,'','2020-09-24 16:25:59','ar','default',271,'2020-09-24 16:25:59',510,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(543,'3-variant-18-10','TL-42',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,18,'wine',10,'40','2020-09-24 16:25:59','en','default',272,'2020-09-24 16:25:59',509,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(544,'3-variant-18-10','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,18,'عنابي',10,'','2020-09-24 16:25:59','ar','default',272,'2020-09-24 16:25:59',510,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(545,'3-variant-18-11','TL-42',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,18,'wine',11,'41','2020-09-24 16:25:59','en','default',273,'2020-09-24 16:25:59',509,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(546,'3-variant-18-11','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,18,'عنابي',11,'','2020-09-24 16:25:59','ar','default',273,'2020-09-24 16:25:59',510,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(547,'4','18386','<p>كعب مفتوح مرصع بالفص والشفاف</p>','18386',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-25 13:25:44','en','default',274,'2020-09-25 13:25:44',NULL,1,0.0000,0.0000,'<p>كعب مفتوح مرصع بالفص والشفاف</p>','','','',NULL),(548,'4',NULL,NULL,'18386',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-25 13:25:44','ar','default',274,'2020-09-25 13:25:44',NULL,1,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL),(549,'4-variant-4-7','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',7,'37','2020-09-25 13:25:44','en','default',275,'2020-09-25 13:25:44',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(550,'4-variant-4-7','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',7,'','2020-09-25 13:25:44','ar','default',275,'2020-09-25 13:25:44',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(551,'4-variant-15-7','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'gold',7,'37','2020-09-25 13:25:44','en','default',276,'2020-09-25 13:25:44',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(552,'4-variant-15-7','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'',7,'','2020-09-25 13:25:44','ar','default',276,'2020-09-25 13:25:44',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(553,'4-variant-16-7','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,16,'selver',7,'37','2020-09-25 13:25:44','en','default',277,'2020-09-25 13:25:44',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(554,'4-variant-16-7','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,16,'',7,'','2020-09-25 13:25:44','ar','default',277,'2020-09-25 13:25:44',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(555,'4-variant-17-7','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'pink',7,'37','2020-09-25 13:25:45','en','default',278,'2020-09-25 13:25:45',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(556,'4-variant-17-7','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'',7,'','2020-09-25 13:25:45','ar','default',278,'2020-09-25 13:25:45',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(557,'4-variant-4-8','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',8,'38','2020-09-25 13:25:45','en','default',279,'2020-09-25 13:25:45',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(558,'4-variant-4-8','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',8,'','2020-09-25 13:25:45','ar','default',279,'2020-09-25 13:25:45',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(559,'4-variant-4-9','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',9,'39','2020-09-25 13:25:45','en','default',280,'2020-09-25 13:25:45',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(560,'4-variant-4-9','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',9,'','2020-09-25 13:25:45','ar','default',280,'2020-09-25 13:25:45',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(561,'4-variant-4-10','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',10,'40','2020-09-25 13:25:45','en','default',281,'2020-09-25 13:25:45',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(562,'4-variant-4-10','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',10,'','2020-09-25 13:25:45','ar','default',281,'2020-09-25 13:25:45',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(563,'4-variant-4-11','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',11,'41','2020-09-25 13:25:45','en','default',282,'2020-09-25 13:25:45',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(564,'4-variant-4-11','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',11,'','2020-09-25 13:25:45','ar','default',282,'2020-09-25 13:25:45',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(565,'4-variant-15-8','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'gold',8,'38','2020-09-25 13:25:45','en','default',283,'2020-09-25 13:25:45',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(566,'4-variant-15-8','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'',8,'','2020-09-25 13:25:45','ar','default',283,'2020-09-25 13:25:45',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(567,'4-variant-15-9','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'gold',9,'39','2020-09-25 13:25:45','en','default',284,'2020-09-25 13:25:45',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(568,'4-variant-15-9','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'',9,'','2020-09-25 13:25:45','ar','default',284,'2020-09-25 13:25:45',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(569,'4-variant-15-10','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'gold',10,'40','2020-09-25 13:25:45','en','default',285,'2020-09-25 13:25:45',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(570,'4-variant-15-10','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'',10,'','2020-09-25 13:25:45','ar','default',285,'2020-09-25 13:25:45',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(571,'4-variant-15-11','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'gold',11,'41','2020-09-25 13:25:45','en','default',286,'2020-09-25 13:25:45',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(572,'4-variant-15-11','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,15,'',11,'','2020-09-25 13:25:45','ar','default',286,'2020-09-25 13:25:45',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(573,'4-variant-16-8','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,16,'selver',8,'38','2020-09-25 13:25:45','en','default',287,'2020-09-25 13:25:45',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(574,'4-variant-16-8','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,16,'',8,'','2020-09-25 13:25:45','ar','default',287,'2020-09-25 13:25:45',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(575,'4-variant-16-9','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,16,'selver',9,'39','2020-09-25 13:25:45','en','default',288,'2020-09-25 13:25:45',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(576,'4-variant-16-9','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,16,'',9,'','2020-09-25 13:25:45','ar','default',288,'2020-09-25 13:25:45',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(577,'4-variant-16-10','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,16,'selver',10,'40','2020-09-25 13:25:45','en','default',289,'2020-09-25 13:25:45',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(578,'4-variant-16-10','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,16,'',10,'','2020-09-25 13:25:45','ar','default',289,'2020-09-25 13:25:45',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(579,'4-variant-16-11','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,16,'selver',11,'41','2020-09-25 13:25:45','en','default',290,'2020-09-25 13:25:45',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(580,'4-variant-16-11','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,16,'',11,'','2020-09-25 13:25:45','ar','default',290,'2020-09-25 13:25:45',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(581,'4-variant-17-8','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'pink',8,'38','2020-09-25 13:25:45','en','default',291,'2020-09-25 13:25:45',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(582,'4-variant-17-8','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'',8,'','2020-09-25 13:25:45','ar','default',291,'2020-09-25 13:25:45',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(583,'4-variant-17-9','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'pink',9,'39','2020-09-25 13:25:45','en','default',292,'2020-09-25 13:25:45',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(584,'4-variant-17-9','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'',9,'','2020-09-25 13:25:45','ar','default',292,'2020-09-25 13:25:45',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(585,'4-variant-17-10','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'pink',10,'40','2020-09-25 13:25:45','en','default',293,'2020-09-25 13:25:45',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(586,'4-variant-17-10','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'',10,'','2020-09-25 13:25:45','ar','default',293,'2020-09-25 13:25:45',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(587,'4-variant-17-11','18386',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'pink',11,'41','2020-09-25 13:25:45','en','default',294,'2020-09-25 13:25:45',547,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(588,'4-variant-17-11','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,17,'',11,'','2020-09-25 13:25:45','ar','default',294,'2020-09-25 13:25:45',548,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(589,'5','ch ','<p>فلات تلقيد شكل ماركة كالورينا هريرا</p>','ch-',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-25 14:40:54','en','default',295,'2020-09-25 14:40:54',NULL,1,0.0000,0.0000,'<p>فلات تقليد لشكل ماركة كالورينا هريرا</p>','','','',NULL),(590,'5',NULL,NULL,'ch-',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-25 14:40:54','ar','default',295,'2020-09-25 14:40:54',NULL,1,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL),(591,'5-variant-3-6','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',6,'36','2020-09-25 14:40:54','en','default',296,'2020-09-25 14:40:54',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(592,'5-variant-3-6','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'',6,'','2020-09-25 14:40:54','ar','default',296,'2020-09-25 14:40:54',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(593,'5-variant-5-6','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,5,'White',6,'36','2020-09-25 14:40:54','en','default',297,'2020-09-25 14:40:54',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(594,'5-variant-5-6','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,5,'',6,'','2020-09-25 14:40:54','ar','default',297,'2020-09-25 14:40:54',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(595,'5-variant-13-6','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,13,'blue',6,'36','2020-09-25 14:40:54','en','default',298,'2020-09-25 14:40:54',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(596,'5-variant-13-6','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,13,'',6,'','2020-09-25 14:40:54','ar','default',298,'2020-09-25 14:40:54',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(597,'5-variant-14-6','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'beige',6,'36','2020-09-25 14:40:54','en','default',299,'2020-09-25 14:40:54',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(598,'5-variant-14-6','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'',6,'','2020-09-25 14:40:54','ar','default',299,'2020-09-25 14:40:54',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(599,'5-variant-18-6','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,18,'wine',6,'36','2020-09-25 14:40:54','en','default',300,'2020-09-25 14:40:54',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(600,'5-variant-18-6','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,18,'عنابي',6,'','2020-09-25 14:40:54','ar','default',300,'2020-09-25 14:40:54',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(601,'5-variant-3-7','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',7,'37','2020-09-25 14:40:54','en','default',301,'2020-09-25 14:40:54',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(602,'5-variant-3-7','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'',7,'','2020-09-25 14:40:54','ar','default',301,'2020-09-25 14:40:54',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(603,'5-variant-3-8','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',8,'38','2020-09-25 14:40:54','en','default',302,'2020-09-25 14:40:54',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(604,'5-variant-3-8','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'',8,'','2020-09-25 14:40:54','ar','default',302,'2020-09-25 14:40:54',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(605,'5-variant-3-9','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',9,'39','2020-09-25 14:40:54','en','default',303,'2020-09-25 14:40:54',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(606,'5-variant-3-9','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'',9,'','2020-09-25 14:40:54','ar','default',303,'2020-09-25 14:40:54',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(607,'5-variant-3-10','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',10,'40','2020-09-25 14:40:54','en','default',304,'2020-09-25 14:40:54',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(608,'5-variant-3-10','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'',10,'','2020-09-25 14:40:54','ar','default',304,'2020-09-25 14:40:54',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(609,'5-variant-3-11','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',11,'41','2020-09-25 14:40:55','en','default',305,'2020-09-25 14:40:55',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(610,'5-variant-3-11','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'',11,'','2020-09-25 14:40:55','ar','default',305,'2020-09-25 14:40:55',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(611,'5-variant-5-7','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,5,'White',7,'37','2020-09-25 14:40:55','en','default',306,'2020-09-25 14:40:55',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(612,'5-variant-5-7','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,5,'',7,'','2020-09-25 14:40:55','ar','default',306,'2020-09-25 14:40:55',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(613,'5-variant-5-8','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,5,'White',8,'38','2020-09-25 14:40:55','en','default',307,'2020-09-25 14:40:55',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(614,'5-variant-5-8','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,5,'',8,'','2020-09-25 14:40:55','ar','default',307,'2020-09-25 14:40:55',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(615,'5-variant-5-9','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,5,'White',9,'39','2020-09-25 14:40:55','en','default',308,'2020-09-25 14:40:55',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(616,'5-variant-5-9','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,5,'',9,'','2020-09-25 14:40:55','ar','default',308,'2020-09-25 14:40:55',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(617,'5-variant-5-10','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,5,'White',10,'40','2020-09-25 14:40:55','en','default',309,'2020-09-25 14:40:55',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(618,'5-variant-5-10','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,5,'',10,'','2020-09-25 14:40:55','ar','default',309,'2020-09-25 14:40:55',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(619,'5-variant-5-11','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,5,'White',11,'41','2020-09-25 14:40:55','en','default',310,'2020-09-25 14:40:55',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(620,'5-variant-5-11','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,5,'',11,'','2020-09-25 14:40:55','ar','default',310,'2020-09-25 14:40:55',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(621,'5-variant-13-7','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,13,'blue',7,'37','2020-09-25 14:40:55','en','default',311,'2020-09-25 14:40:55',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(622,'5-variant-13-7','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,13,'',7,'','2020-09-25 14:40:55','ar','default',311,'2020-09-25 14:40:55',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(623,'5-variant-13-8','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,13,'blue',8,'38','2020-09-25 14:40:55','en','default',312,'2020-09-25 14:40:55',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(624,'5-variant-13-8','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,13,'',8,'','2020-09-25 14:40:55','ar','default',312,'2020-09-25 14:40:55',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(625,'5-variant-13-9','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,13,'blue',9,'39','2020-09-25 14:40:55','en','default',313,'2020-09-25 14:40:55',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(626,'5-variant-13-9','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,13,'',9,'','2020-09-25 14:40:55','ar','default',313,'2020-09-25 14:40:55',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(627,'5-variant-13-10','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,13,'blue',10,'40','2020-09-25 14:40:55','en','default',314,'2020-09-25 14:40:55',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(628,'5-variant-13-10','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,13,'',10,'','2020-09-25 14:40:55','ar','default',314,'2020-09-25 14:40:55',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(629,'5-variant-13-11','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,13,'blue',11,'41','2020-09-25 14:40:55','en','default',315,'2020-09-25 14:40:55',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(630,'5-variant-13-11','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,13,'',11,'','2020-09-25 14:40:55','ar','default',315,'2020-09-25 14:40:55',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(631,'5-variant-14-7','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'beige',7,'37','2020-09-25 14:40:55','en','default',316,'2020-09-25 14:40:55',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(632,'5-variant-14-7','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'',7,'','2020-09-25 14:40:55','ar','default',316,'2020-09-25 14:40:55',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(633,'5-variant-14-8','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'beige',8,'38','2020-09-25 14:40:55','en','default',317,'2020-09-25 14:40:55',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(634,'5-variant-14-8','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'',8,'','2020-09-25 14:40:55','ar','default',317,'2020-09-25 14:40:55',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(635,'5-variant-14-9','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'beige',9,'39','2020-09-25 14:40:55','en','default',318,'2020-09-25 14:40:55',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(636,'5-variant-14-9','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'',9,'','2020-09-25 14:40:55','ar','default',318,'2020-09-25 14:40:55',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(637,'5-variant-14-10','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'beige',10,'40','2020-09-25 14:40:55','en','default',319,'2020-09-25 14:40:55',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(638,'5-variant-14-10','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'',10,'','2020-09-25 14:40:55','ar','default',319,'2020-09-25 14:40:55',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(639,'5-variant-14-11','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'beige',11,'41','2020-09-25 14:40:55','en','default',320,'2020-09-25 14:40:55',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(640,'5-variant-14-11','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'',11,'','2020-09-25 14:40:55','ar','default',320,'2020-09-25 14:40:55',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(641,'5-variant-18-7','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,18,'wine',7,'37','2020-09-25 14:40:55','en','default',321,'2020-09-25 14:40:55',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(642,'5-variant-18-7','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,18,'عنابي',7,'','2020-09-25 14:40:55','ar','default',321,'2020-09-25 14:40:55',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(643,'5-variant-18-8','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,18,'wine',8,'38','2020-09-25 14:40:55','en','default',322,'2020-09-25 14:40:55',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(644,'5-variant-18-8','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,18,'عنابي',8,'','2020-09-25 14:40:55','ar','default',322,'2020-09-25 14:40:55',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(645,'5-variant-18-9','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,18,'wine',9,'39','2020-09-25 14:40:56','en','default',323,'2020-09-25 14:40:56',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(646,'5-variant-18-9','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,18,'عنابي',9,'','2020-09-25 14:40:56','ar','default',323,'2020-09-25 14:40:56',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(647,'5-variant-18-10','ch',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,18,'wine',10,'40','2020-09-25 14:40:56','en','default',324,'2020-09-25 14:40:56',589,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(648,'5-variant-18-10','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,18,'عنابي',10,'','2020-09-25 14:40:56','ar','default',324,'2020-09-25 14:40:56',590,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(649,'5-variant-18-11','ch','<p>jhjhhjhj</p>','5-variant-18-11',0,0,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,18,'wine',11,'41','2020-09-25 14:40:56','en','default',325,'2020-09-25 14:40:56',589,0,3.5000,3.5000,'<p>jjggjgjh</p>','','','',0.0000),(650,'5-variant-18-11','',NULL,'5-variant-18-11',0,0,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,18,'عنابي',11,'','2020-09-25 14:40:56','ar','default',325,'2020-09-25 14:40:56',590,0,3.5000,3.5000,NULL,NULL,NULL,NULL,0.0000),(651,'6','1177-9','<p>فلات شفاف</p>','1177-9',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 13:22:06','en','default',326,'2020-09-26 13:22:06',NULL,1,0.0000,0.0000,'<p>فلات شفاف</p>','','','',NULL),(652,'6',NULL,NULL,'1177-9',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 13:22:06','ar','default',326,'2020-09-26 13:22:06',NULL,1,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL),(653,'6-variant-4-6','1177-9',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'Black',6,'36','2020-09-26 13:22:06','en','default',327,'2020-09-26 13:22:06',651,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(654,'6-variant-4-6','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'',6,'','2020-09-26 13:22:06','ar','default',327,'2020-09-26 13:22:06',652,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(655,'6-variant-14-6','1177-9',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'beige',6,'36','2020-09-26 13:22:06','en','default',328,'2020-09-26 13:22:06',651,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(656,'6-variant-14-6','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'',6,'','2020-09-26 13:22:06','ar','default',328,'2020-09-26 13:22:06',652,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(657,'6-variant-17-6','1177-9',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,17,'pink',6,'36','2020-09-26 13:22:06','en','default',329,'2020-09-26 13:22:06',651,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(658,'6-variant-17-6','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,17,'',6,'','2020-09-26 13:22:06','ar','default',329,'2020-09-26 13:22:06',652,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(659,'6-variant-4-7','1177-9',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'Black',7,'37','2020-09-26 13:22:06','en','default',330,'2020-09-26 13:22:06',651,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(660,'6-variant-4-7','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'',7,'','2020-09-26 13:22:06','ar','default',330,'2020-09-26 13:22:06',652,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(661,'6-variant-4-8','1177-9',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'Black',8,'38','2020-09-26 13:22:06','en','default',331,'2020-09-26 13:22:06',651,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(662,'6-variant-4-8','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'',8,'','2020-09-26 13:22:06','ar','default',331,'2020-09-26 13:22:06',652,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(663,'6-variant-4-9','1177-9',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'Black',9,'39','2020-09-26 13:22:06','en','default',332,'2020-09-26 13:22:06',651,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(664,'6-variant-4-9','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'',9,'','2020-09-26 13:22:06','ar','default',332,'2020-09-26 13:22:06',652,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(665,'6-variant-4-10','1177-9',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'Black',10,'40','2020-09-26 13:22:06','en','default',333,'2020-09-26 13:22:06',651,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(666,'6-variant-4-10','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'',10,'','2020-09-26 13:22:06','ar','default',333,'2020-09-26 13:22:06',652,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(667,'6-variant-14-7','1177-9',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'beige',7,'37','2020-09-26 13:22:06','en','default',334,'2020-09-26 13:22:06',651,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(668,'6-variant-14-7','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'',7,'','2020-09-26 13:22:06','ar','default',334,'2020-09-26 13:22:06',652,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(669,'6-variant-14-8','1177-9',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'beige',8,'38','2020-09-26 13:22:06','en','default',335,'2020-09-26 13:22:06',651,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(670,'6-variant-14-8','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'',8,'','2020-09-26 13:22:06','ar','default',335,'2020-09-26 13:22:06',652,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(671,'6-variant-14-9','1177-9',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'beige',9,'39','2020-09-26 13:22:06','en','default',336,'2020-09-26 13:22:06',651,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(672,'6-variant-14-9','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'',9,'','2020-09-26 13:22:06','ar','default',336,'2020-09-26 13:22:06',652,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(673,'6-variant-14-10','1177-9',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'beige',10,'40','2020-09-26 13:22:06','en','default',337,'2020-09-26 13:22:06',651,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(674,'6-variant-14-10','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,14,'',10,'','2020-09-26 13:22:06','ar','default',337,'2020-09-26 13:22:06',652,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(675,'6-variant-17-7','1177-9',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,17,'pink',7,'37','2020-09-26 13:22:06','en','default',338,'2020-09-26 13:22:06',651,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(676,'6-variant-17-7','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,17,'',7,'','2020-09-26 13:22:06','ar','default',338,'2020-09-26 13:22:06',652,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(677,'6-variant-17-8','1177-9',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,17,'pink',8,'38','2020-09-26 13:22:06','en','default',339,'2020-09-26 13:22:06',651,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(678,'6-variant-17-8','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,17,'',8,'','2020-09-26 13:22:06','ar','default',339,'2020-09-26 13:22:06',652,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(679,'6-variant-17-9','1177-9',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,17,'pink',9,'39','2020-09-26 13:22:06','en','default',340,'2020-09-26 13:22:06',651,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(680,'6-variant-17-9','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,17,'',9,'','2020-09-26 13:22:06','ar','default',340,'2020-09-26 13:22:06',652,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(681,'6-variant-17-10','1177-9',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,17,'pink',10,'40','2020-09-26 13:22:06','en','default',341,'2020-09-26 13:22:06',651,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(682,'6-variant-17-10','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,17,'',10,'','2020-09-26 13:22:06','ar','default',341,'2020-09-26 13:22:06',652,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(683,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 13:34:07','en','default',342,'2020-09-26 13:34:07',NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL),(684,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 13:34:07','ar','default',342,'2020-09-26 13:34:07',NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL),(709,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 14:03:18','en','default',355,'2020-09-26 14:03:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(710,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 14:03:18','ar','default',355,'2020-09-26 14:03:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(711,'9','1177','<p>فلات شبك</p>','1177',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 14:05:27','en','default',356,'2020-09-26 14:05:27',NULL,1,3.5000,3.5000,'<p>فلات شبك</p>','','','',NULL),(712,'9',NULL,NULL,'1177',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 14:05:27','ar','default',356,'2020-09-26 14:05:27',NULL,1,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(713,'9-variant-4-6','1177',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'Black',6,'36','2020-09-26 14:05:27','en','default',357,'2020-09-26 14:05:27',711,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(714,'9-variant-4-6','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'',6,'','2020-09-26 14:05:27','ar','default',357,'2020-09-26 14:05:27',712,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(715,'9-variant-16-6','1177',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,16,'selver',6,'36','2020-09-26 14:05:27','en','default',358,'2020-09-26 14:05:27',711,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(716,'9-variant-16-6','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,16,'',6,'','2020-09-26 14:05:27','ar','default',358,'2020-09-26 14:05:27',712,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(717,'9-variant-19-6','1177',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,19,'grey',6,'36','2020-09-26 14:05:27','en','default',359,'2020-09-26 14:05:27',711,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(718,'9-variant-19-6','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,19,'',6,'','2020-09-26 14:05:27','ar','default',359,'2020-09-26 14:05:27',712,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(719,'9-variant-4-7','1177',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'Black',7,'37','2020-09-26 14:05:27','en','default',360,'2020-09-26 14:05:27',711,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(720,'9-variant-4-7','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'',7,'','2020-09-26 14:05:27','ar','default',360,'2020-09-26 14:05:27',712,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(721,'9-variant-4-8','1177',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'Black',8,'38','2020-09-26 14:05:28','en','default',361,'2020-09-26 14:05:28',711,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(722,'9-variant-4-8','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'',8,'','2020-09-26 14:05:28','ar','default',361,'2020-09-26 14:05:28',712,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(723,'9-variant-4-9','1177',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'Black',9,'39','2020-09-26 14:05:28','en','default',362,'2020-09-26 14:05:28',711,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(724,'9-variant-4-9','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'',9,'','2020-09-26 14:05:28','ar','default',362,'2020-09-26 14:05:28',712,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(725,'9-variant-4-10','1177',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'Black',10,'40','2020-09-26 14:05:28','en','default',363,'2020-09-26 14:05:28',711,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(726,'9-variant-4-10','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'',10,'','2020-09-26 14:05:28','ar','default',363,'2020-09-26 14:05:28',712,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(727,'9-variant-4-11','1177',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'Black',11,'41','2020-09-26 14:05:28','en','default',364,'2020-09-26 14:05:28',711,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(728,'9-variant-4-11','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,4,'',11,'','2020-09-26 14:05:28','ar','default',364,'2020-09-26 14:05:28',712,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(729,'9-variant-16-7','1177',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,16,'selver',7,'37','2020-09-26 14:05:28','en','default',365,'2020-09-26 14:05:28',711,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(730,'9-variant-16-7','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,16,'',7,'','2020-09-26 14:05:28','ar','default',365,'2020-09-26 14:05:28',712,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(731,'9-variant-16-8','1177',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,16,'selver',8,'38','2020-09-26 14:05:28','en','default',366,'2020-09-26 14:05:28',711,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(732,'9-variant-16-8','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,16,'',8,'','2020-09-26 14:05:28','ar','default',366,'2020-09-26 14:05:28',712,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(733,'9-variant-16-9','1177',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,16,'selver',9,'39','2020-09-26 14:05:28','en','default',367,'2020-09-26 14:05:28',711,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(734,'9-variant-16-9','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,16,'',9,'','2020-09-26 14:05:28','ar','default',367,'2020-09-26 14:05:28',712,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(735,'9-variant-16-10','1177',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,16,'selver',10,'40','2020-09-26 14:05:28','en','default',368,'2020-09-26 14:05:28',711,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(736,'9-variant-16-10','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,16,'',10,'','2020-09-26 14:05:28','ar','default',368,'2020-09-26 14:05:28',712,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(737,'9-variant-16-11','1177',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,16,'selver',11,'41','2020-09-26 14:05:28','en','default',369,'2020-09-26 14:05:28',711,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(738,'9-variant-16-11','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,16,'',11,'','2020-09-26 14:05:28','ar','default',369,'2020-09-26 14:05:28',712,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(739,'9-variant-19-7','1177',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,19,'grey',7,'37','2020-09-26 14:05:28','en','default',370,'2020-09-26 14:05:28',711,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(740,'9-variant-19-7','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,19,'',7,'','2020-09-26 14:05:28','ar','default',370,'2020-09-26 14:05:28',712,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(741,'9-variant-19-8','1177',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,19,'grey',8,'38','2020-09-26 14:05:28','en','default',371,'2020-09-26 14:05:28',711,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(742,'9-variant-19-8','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,19,'',8,'','2020-09-26 14:05:28','ar','default',371,'2020-09-26 14:05:28',712,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(743,'9-variant-19-9','1177',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,19,'grey',9,'39','2020-09-26 14:05:28','en','default',372,'2020-09-26 14:05:28',711,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(744,'9-variant-19-9','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,19,'',9,'','2020-09-26 14:05:28','ar','default',372,'2020-09-26 14:05:28',712,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(745,'9-variant-19-10','1177',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,19,'grey',10,'40','2020-09-26 14:05:28','en','default',373,'2020-09-26 14:05:28',711,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(746,'9-variant-19-10','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,19,'',10,'','2020-09-26 14:05:28','ar','default',373,'2020-09-26 14:05:28',712,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(747,'9-variant-19-11','1177',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,19,'grey',11,'41','2020-09-26 14:05:28','en','default',374,'2020-09-26 14:05:28',711,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(748,'9-variant-19-11','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,19,'',11,'','2020-09-26 14:05:28','ar','default',374,'2020-09-26 14:05:28',712,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(749,'10','TL-23','<p>كعب ستايل زارا</p>','tl-23',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 14:20:14','en','default',375,'2020-09-26 14:20:14',NULL,1,0.0000,0.0000,'<p>كعب ستايل زارا</p>','','','',NULL),(750,'10',NULL,NULL,'tl-23',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 14:20:14','ar','default',375,'2020-09-26 14:20:14',NULL,1,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL),(751,'10-variant-4-6','TL-23',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',6,'36','2020-09-26 14:20:14','en','default',376,'2020-09-26 14:20:14',749,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(752,'10-variant-4-6','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',6,'','2020-09-26 14:20:14','ar','default',376,'2020-09-26 14:20:14',750,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(753,'10-variant-5-6','TL-23',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',6,'36','2020-09-26 14:20:14','en','default',377,'2020-09-26 14:20:14',749,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(754,'10-variant-5-6','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'',6,'','2020-09-26 14:20:14','ar','default',377,'2020-09-26 14:20:14',750,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(755,'10-variant-12-6','TL-23',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,12,'brown',6,'36','2020-09-26 14:20:14','en','default',378,'2020-09-26 14:20:14',749,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(756,'10-variant-12-6','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,12,'',6,'','2020-09-26 14:20:14','ar','default',378,'2020-09-26 14:20:14',750,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(757,'10-variant-4-7','TL-23',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',7,'37','2020-09-26 14:20:14','en','default',379,'2020-09-26 14:20:14',749,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(758,'10-variant-4-7','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',7,'','2020-09-26 14:20:14','ar','default',379,'2020-09-26 14:20:14',750,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(759,'10-variant-4-8','TL-23',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',8,'38','2020-09-26 14:20:14','en','default',380,'2020-09-26 14:20:14',749,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(760,'10-variant-4-8','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',8,'','2020-09-26 14:20:14','ar','default',380,'2020-09-26 14:20:14',750,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(761,'10-variant-4-9','TL-23',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',9,'39','2020-09-26 14:20:14','en','default',381,'2020-09-26 14:20:14',749,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(762,'10-variant-4-9','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',9,'','2020-09-26 14:20:14','ar','default',381,'2020-09-26 14:20:14',750,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(763,'10-variant-4-10','TL-23',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',10,'40','2020-09-26 14:20:14','en','default',382,'2020-09-26 14:20:14',749,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(764,'10-variant-4-10','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',10,'','2020-09-26 14:20:14','ar','default',382,'2020-09-26 14:20:14',750,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(765,'10-variant-4-11','TL-23',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',11,'41','2020-09-26 14:20:14','en','default',383,'2020-09-26 14:20:14',749,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(766,'10-variant-4-11','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',11,'','2020-09-26 14:20:14','ar','default',383,'2020-09-26 14:20:14',750,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(767,'10-variant-5-7','TL-23',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',7,'37','2020-09-26 14:20:14','en','default',384,'2020-09-26 14:20:14',749,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(768,'10-variant-5-7','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'',7,'','2020-09-26 14:20:14','ar','default',384,'2020-09-26 14:20:14',750,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(769,'10-variant-5-8','TL-23',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',8,'38','2020-09-26 14:20:14','en','default',385,'2020-09-26 14:20:14',749,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(770,'10-variant-5-8','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'',8,'','2020-09-26 14:20:14','ar','default',385,'2020-09-26 14:20:14',750,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(771,'10-variant-5-9','TL-23',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',9,'39','2020-09-26 14:20:15','en','default',386,'2020-09-26 14:20:15',749,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(772,'10-variant-5-9','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'',9,'','2020-09-26 14:20:15','ar','default',386,'2020-09-26 14:20:15',750,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(773,'10-variant-5-10','TL-23',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',10,'40','2020-09-26 14:20:15','en','default',387,'2020-09-26 14:20:15',749,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(774,'10-variant-5-10','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'',10,'','2020-09-26 14:20:15','ar','default',387,'2020-09-26 14:20:15',750,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(775,'10-variant-5-11','TL-23',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',11,'41','2020-09-26 14:20:15','en','default',388,'2020-09-26 14:20:15',749,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(776,'10-variant-5-11','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'',11,'','2020-09-26 14:20:15','ar','default',388,'2020-09-26 14:20:15',750,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(777,'10-variant-12-7','TL-23',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,12,'brown',7,'37','2020-09-26 14:20:15','en','default',389,'2020-09-26 14:20:15',749,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(778,'10-variant-12-7','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,12,'',7,'','2020-09-26 14:20:15','ar','default',389,'2020-09-26 14:20:15',750,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(779,'10-variant-12-8','TL-23',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,12,'brown',8,'38','2020-09-26 14:20:15','en','default',390,'2020-09-26 14:20:15',749,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(780,'10-variant-12-8','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,12,'',8,'','2020-09-26 14:20:15','ar','default',390,'2020-09-26 14:20:15',750,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(781,'10-variant-12-9','TL-23',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,12,'brown',9,'39','2020-09-26 14:20:15','en','default',391,'2020-09-26 14:20:15',749,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(782,'10-variant-12-9','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,12,'',9,'','2020-09-26 14:20:15','ar','default',391,'2020-09-26 14:20:15',750,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(783,'10-variant-12-10','TL-23',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,12,'brown',10,'40','2020-09-26 14:20:15','en','default',392,'2020-09-26 14:20:15',749,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(784,'10-variant-12-10','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,12,'',10,'','2020-09-26 14:20:15','ar','default',392,'2020-09-26 14:20:15',750,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(785,'10-variant-12-11','TL-23',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,12,'brown',11,'41','2020-09-26 14:20:15','en','default',393,'2020-09-26 14:20:15',749,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(786,'10-variant-12-11','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,12,'',11,'','2020-09-26 14:20:15','ar','default',393,'2020-09-26 14:20:15',750,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(787,'11','TL-22','<p>فلات صيفي</p>','tl-22',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 14:42:25','en','default',394,'2020-09-26 14:42:25',NULL,1,0.0000,0.0000,'<p>فلات صيفي</p>','','','',NULL),(788,'11',NULL,NULL,'tl-22',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 14:42:25','ar','default',394,'2020-09-26 14:42:25',NULL,1,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL),(789,'11-variant-2-6','TL-22',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,2,'Green',6,'36','2020-09-26 14:42:25','en','default',395,'2020-09-26 14:42:25',787,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(790,'11-variant-2-6','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,2,'',6,'','2020-09-26 14:42:25','ar','default',395,'2020-09-26 14:42:25',788,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(791,'11-variant-3-6','TL-22',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',6,'36','2020-09-26 14:42:25','en','default',396,'2020-09-26 14:42:25',787,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(792,'11-variant-3-6','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'',6,'','2020-09-26 14:42:25','ar','default',396,'2020-09-26 14:42:25',788,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(793,'11-variant-2-7','TL-22',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,2,'Green',7,'37','2020-09-26 14:42:25','en','default',397,'2020-09-26 14:42:25',787,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(794,'11-variant-2-7','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,2,'',7,'','2020-09-26 14:42:25','ar','default',397,'2020-09-26 14:42:25',788,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(795,'11-variant-2-8','TL-22',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,2,'Green',8,'38','2020-09-26 14:42:25','en','default',398,'2020-09-26 14:42:25',787,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(796,'11-variant-2-8','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,2,'',8,'','2020-09-26 14:42:25','ar','default',398,'2020-09-26 14:42:25',788,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(797,'11-variant-2-9','TL-22',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,2,'Green',9,'39','2020-09-26 14:42:25','en','default',399,'2020-09-26 14:42:25',787,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(798,'11-variant-2-9','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,2,'',9,'','2020-09-26 14:42:25','ar','default',399,'2020-09-26 14:42:25',788,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(799,'11-variant-2-10','TL-22',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,2,'Green',10,'40','2020-09-26 14:42:25','en','default',400,'2020-09-26 14:42:25',787,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(800,'11-variant-2-10','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,2,'',10,'','2020-09-26 14:42:25','ar','default',400,'2020-09-26 14:42:25',788,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(801,'11-variant-2-11','TL-22',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,2,'Green',11,'41','2020-09-26 14:42:25','en','default',401,'2020-09-26 14:42:25',787,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(802,'11-variant-2-11','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,2,'',11,'','2020-09-26 14:42:25','ar','default',401,'2020-09-26 14:42:25',788,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(803,'11-variant-3-7','TL-22',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',7,'37','2020-09-26 14:42:25','en','default',402,'2020-09-26 14:42:25',787,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(804,'11-variant-3-7','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'',7,'','2020-09-26 14:42:25','ar','default',402,'2020-09-26 14:42:25',788,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(805,'11-variant-3-8','TL-22',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',8,'38','2020-09-26 14:42:25','en','default',403,'2020-09-26 14:42:25',787,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(806,'11-variant-3-8','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'',8,'','2020-09-26 14:42:25','ar','default',403,'2020-09-26 14:42:25',788,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(807,'11-variant-3-9','TL-22',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',9,'39','2020-09-26 14:42:25','en','default',404,'2020-09-26 14:42:25',787,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(808,'11-variant-3-9','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'',9,'','2020-09-26 14:42:25','ar','default',404,'2020-09-26 14:42:25',788,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(809,'11-variant-3-10','TL-22',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',10,'40','2020-09-26 14:42:25','en','default',405,'2020-09-26 14:42:25',787,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(810,'11-variant-3-10','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'',10,'','2020-09-26 14:42:25','ar','default',405,'2020-09-26 14:42:25',788,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(811,'11-variant-3-11','TL-22',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',11,'41','2020-09-26 14:42:25','en','default',406,'2020-09-26 14:42:25',787,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(812,'11-variant-3-11','',NULL,NULL,NULL,NULL,1,NULL,3.5000,NULL,NULL,NULL,NULL,0.0000,3,'',11,'','2020-09-26 14:42:25','ar','default',406,'2020-09-26 14:42:25',788,NULL,3.5000,3.5000,NULL,NULL,NULL,NULL,NULL),(813,'12','SY148','<p>فلات خفيف</p>','sy148',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 16:19:02','en','default',407,'2020-09-26 16:19:02',NULL,1,0.0000,0.0000,'<p>فلات خفيف</p>','','','',NULL),(814,'12',NULL,NULL,'sy148',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 16:19:02','ar','default',407,'2020-09-26 16:19:02',NULL,1,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL),(815,'12-variant-3-6','SY148',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',6,'36','2020-09-26 16:19:02','en','default',408,'2020-09-26 16:19:02',813,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(816,'12-variant-3-6','',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,3,'',6,'','2020-09-26 16:19:02','ar','default',408,'2020-09-26 16:19:02',814,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(817,'12-variant-4-6','SY148',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',6,'36','2020-09-26 16:19:02','en','default',409,'2020-09-26 16:19:02',813,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(818,'12-variant-4-6','',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,4,'',6,'','2020-09-26 16:19:02','ar','default',409,'2020-09-26 16:19:02',814,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(819,'12-variant-18-6','SY148',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,18,'wine',6,'36','2020-09-26 16:19:03','en','default',410,'2020-09-26 16:19:03',813,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(820,'12-variant-18-6','',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,18,'عنابي',6,'','2020-09-26 16:19:03','ar','default',410,'2020-09-26 16:19:03',814,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(821,'12-variant-3-7','SY148',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',7,'37','2020-09-26 16:19:03','en','default',411,'2020-09-26 16:19:03',813,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(822,'12-variant-3-7','',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,3,'',7,'','2020-09-26 16:19:03','ar','default',411,'2020-09-26 16:19:03',814,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(823,'12-variant-3-8','SY148',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',8,'38','2020-09-26 16:19:03','en','default',412,'2020-09-26 16:19:03',813,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(824,'12-variant-3-8','',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,3,'',8,'','2020-09-26 16:19:03','ar','default',412,'2020-09-26 16:19:03',814,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(825,'12-variant-3-9','SY148',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',9,'39','2020-09-26 16:19:03','en','default',413,'2020-09-26 16:19:03',813,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(826,'12-variant-3-9','',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,3,'',9,'','2020-09-26 16:19:03','ar','default',413,'2020-09-26 16:19:03',814,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(827,'12-variant-3-10','SY148',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',10,'40','2020-09-26 16:19:03','en','default',414,'2020-09-26 16:19:03',813,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(828,'12-variant-3-10','',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,3,'',10,'','2020-09-26 16:19:03','ar','default',414,'2020-09-26 16:19:03',814,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(829,'12-variant-3-11','SY148',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',11,'41','2020-09-26 16:19:03','en','default',415,'2020-09-26 16:19:03',813,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(830,'12-variant-3-11','',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,3,'',11,'','2020-09-26 16:19:03','ar','default',415,'2020-09-26 16:19:03',814,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(831,'12-variant-4-7','SY148',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',7,'37','2020-09-26 16:19:03','en','default',416,'2020-09-26 16:19:03',813,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(832,'12-variant-4-7','',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,4,'',7,'','2020-09-26 16:19:03','ar','default',416,'2020-09-26 16:19:03',814,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(833,'12-variant-4-8','SY148',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',8,'38','2020-09-26 16:19:03','en','default',417,'2020-09-26 16:19:03',813,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(834,'12-variant-4-8','',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,4,'',8,'','2020-09-26 16:19:03','ar','default',417,'2020-09-26 16:19:03',814,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(835,'12-variant-4-9','SY148',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',9,'39','2020-09-26 16:19:03','en','default',418,'2020-09-26 16:19:03',813,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(836,'12-variant-4-9','',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,4,'',9,'','2020-09-26 16:19:03','ar','default',418,'2020-09-26 16:19:03',814,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(837,'12-variant-4-10','SY148',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',10,'40','2020-09-26 16:19:03','en','default',419,'2020-09-26 16:19:03',813,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(838,'12-variant-4-10','',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,4,'',10,'','2020-09-26 16:19:03','ar','default',419,'2020-09-26 16:19:03',814,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(839,'12-variant-4-11','SY148',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',11,'41','2020-09-26 16:19:03','en','default',420,'2020-09-26 16:19:03',813,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(840,'12-variant-4-11','',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,4,'',11,'','2020-09-26 16:19:03','ar','default',420,'2020-09-26 16:19:03',814,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(841,'12-variant-18-7','SY148',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,18,'wine',7,'37','2020-09-26 16:19:03','en','default',421,'2020-09-26 16:19:03',813,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(842,'12-variant-18-7','',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,18,'عنابي',7,'','2020-09-26 16:19:03','ar','default',421,'2020-09-26 16:19:03',814,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(843,'12-variant-18-8','SY148',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,18,'wine',8,'38','2020-09-26 16:19:03','en','default',422,'2020-09-26 16:19:03',813,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(844,'12-variant-18-8','',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,18,'عنابي',8,'','2020-09-26 16:19:03','ar','default',422,'2020-09-26 16:19:03',814,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(845,'12-variant-18-9','SY148',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,18,'wine',9,'39','2020-09-26 16:19:03','en','default',423,'2020-09-26 16:19:03',813,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(846,'12-variant-18-9','',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,18,'عنابي',9,'','2020-09-26 16:19:03','ar','default',423,'2020-09-26 16:19:03',814,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(847,'12-variant-18-10','SY148',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,18,'wine',10,'40','2020-09-26 16:19:03','en','default',424,'2020-09-26 16:19:03',813,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(848,'12-variant-18-10','',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,18,'عنابي',10,'','2020-09-26 16:19:03','ar','default',424,'2020-09-26 16:19:03',814,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(849,'12-variant-18-11','SY148',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,18,'wine',11,'41','2020-09-26 16:19:03','en','default',425,'2020-09-26 16:19:03',813,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(850,'12-variant-18-11','',NULL,NULL,NULL,NULL,1,NULL,3.0000,NULL,NULL,NULL,NULL,0.0000,18,'عنابي',11,'','2020-09-26 16:19:03','ar','default',425,'2020-09-26 16:19:03',814,NULL,3.0000,3.0000,NULL,NULL,NULL,NULL,NULL),(851,'13','PP-576','<p>كعب صغير</p>','pp-576',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 16:31:47','en','default',426,'2020-09-26 16:31:47',NULL,1,0.0000,0.0000,'<p>كعب صغير</p>','','','',NULL),(852,'13',NULL,NULL,'pp-576',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 16:31:47','ar','default',426,'2020-09-26 16:31:47',NULL,1,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL),(853,'13-variant-3-6','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',6,'36','2020-09-26 16:31:47','en','default',427,'2020-09-26 16:31:47',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(854,'13-variant-3-6','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,3,'',6,'','2020-09-26 16:31:47','ar','default',427,'2020-09-26 16:31:47',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(855,'13-variant-4-6','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',6,'36','2020-09-26 16:31:47','en','default',428,'2020-09-26 16:31:47',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(856,'13-variant-4-6','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',6,'','2020-09-26 16:31:47','ar','default',428,'2020-09-26 16:31:47',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(857,'13-variant-5-6','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',6,'36','2020-09-26 16:31:47','en','default',429,'2020-09-26 16:31:47',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(858,'13-variant-5-6','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'',6,'','2020-09-26 16:31:47','ar','default',429,'2020-09-26 16:31:47',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(859,'13-variant-13-6','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,13,'blue',6,'36','2020-09-26 16:31:47','en','default',430,'2020-09-26 16:31:47',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(860,'13-variant-13-6','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,13,'',6,'','2020-09-26 16:31:47','ar','default',430,'2020-09-26 16:31:47',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(861,'13-variant-14-6','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,14,'beige',6,'36','2020-09-26 16:31:47','en','default',431,'2020-09-26 16:31:47',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(862,'13-variant-14-6','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,14,'',6,'','2020-09-26 16:31:47','ar','default',431,'2020-09-26 16:31:47',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(863,'13-variant-3-7','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',7,'37','2020-09-26 16:31:47','en','default',432,'2020-09-26 16:31:47',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(864,'13-variant-3-7','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,3,'',7,'','2020-09-26 16:31:47','ar','default',432,'2020-09-26 16:31:47',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(865,'13-variant-3-8','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',8,'38','2020-09-26 16:31:47','en','default',433,'2020-09-26 16:31:47',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(866,'13-variant-3-8','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,3,'',8,'','2020-09-26 16:31:47','ar','default',433,'2020-09-26 16:31:47',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(867,'13-variant-3-9','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',9,'39','2020-09-26 16:31:47','en','default',434,'2020-09-26 16:31:47',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(868,'13-variant-3-9','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,3,'',9,'','2020-09-26 16:31:47','ar','default',434,'2020-09-26 16:31:47',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(869,'13-variant-3-10','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',10,'40','2020-09-26 16:31:47','en','default',435,'2020-09-26 16:31:47',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(870,'13-variant-3-10','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,3,'',10,'','2020-09-26 16:31:47','ar','default',435,'2020-09-26 16:31:47',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(871,'13-variant-3-11','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,3,'Yellow',11,'41','2020-09-26 16:31:47','en','default',436,'2020-09-26 16:31:47',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(872,'13-variant-3-11','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,3,'',11,'','2020-09-26 16:31:47','ar','default',436,'2020-09-26 16:31:47',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(873,'13-variant-4-7','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',7,'37','2020-09-26 16:31:47','en','default',437,'2020-09-26 16:31:47',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(874,'13-variant-4-7','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',7,'','2020-09-26 16:31:47','ar','default',437,'2020-09-26 16:31:47',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(875,'13-variant-4-8','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',8,'38','2020-09-26 16:31:47','en','default',438,'2020-09-26 16:31:47',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(876,'13-variant-4-8','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',8,'','2020-09-26 16:31:47','ar','default',438,'2020-09-26 16:31:47',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(877,'13-variant-4-9','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',9,'39','2020-09-26 16:31:48','en','default',439,'2020-09-26 16:31:48',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(878,'13-variant-4-9','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',9,'','2020-09-26 16:31:48','ar','default',439,'2020-09-26 16:31:48',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(879,'13-variant-4-10','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',10,'40','2020-09-26 16:31:48','en','default',440,'2020-09-26 16:31:48',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(880,'13-variant-4-10','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',10,'','2020-09-26 16:31:48','ar','default',440,'2020-09-26 16:31:48',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(881,'13-variant-4-11','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',11,'41','2020-09-26 16:31:48','en','default',441,'2020-09-26 16:31:48',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(882,'13-variant-4-11','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,4,'',11,'','2020-09-26 16:31:48','ar','default',441,'2020-09-26 16:31:48',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(883,'13-variant-5-7','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',7,'37','2020-09-26 16:31:48','en','default',442,'2020-09-26 16:31:48',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(884,'13-variant-5-7','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'',7,'','2020-09-26 16:31:48','ar','default',442,'2020-09-26 16:31:48',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(885,'13-variant-5-8','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',8,'38','2020-09-26 16:31:48','en','default',443,'2020-09-26 16:31:48',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(886,'13-variant-5-8','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'',8,'','2020-09-26 16:31:48','ar','default',443,'2020-09-26 16:31:48',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(887,'13-variant-5-9','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',9,'39','2020-09-26 16:31:48','en','default',444,'2020-09-26 16:31:48',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(888,'13-variant-5-9','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'',9,'','2020-09-26 16:31:48','ar','default',444,'2020-09-26 16:31:48',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(889,'13-variant-5-10','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',10,'40','2020-09-26 16:31:48','en','default',445,'2020-09-26 16:31:48',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(890,'13-variant-5-10','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'',10,'','2020-09-26 16:31:48','ar','default',445,'2020-09-26 16:31:48',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(891,'13-variant-5-11','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',11,'41','2020-09-26 16:31:48','en','default',446,'2020-09-26 16:31:48',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(892,'13-variant-5-11','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,5,'',11,'','2020-09-26 16:31:48','ar','default',446,'2020-09-26 16:31:48',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(893,'13-variant-13-7','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,13,'blue',7,'37','2020-09-26 16:31:48','en','default',447,'2020-09-26 16:31:48',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(894,'13-variant-13-7','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,13,'',7,'','2020-09-26 16:31:48','ar','default',447,'2020-09-26 16:31:48',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(895,'13-variant-13-8','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,13,'blue',8,'38','2020-09-26 16:31:48','en','default',448,'2020-09-26 16:31:48',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(896,'13-variant-13-8','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,13,'',8,'','2020-09-26 16:31:48','ar','default',448,'2020-09-26 16:31:48',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(897,'13-variant-13-9','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,13,'blue',9,'39','2020-09-26 16:31:48','en','default',449,'2020-09-26 16:31:48',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(898,'13-variant-13-9','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,13,'',9,'','2020-09-26 16:31:48','ar','default',449,'2020-09-26 16:31:48',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(899,'13-variant-13-10','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,13,'blue',10,'40','2020-09-26 16:31:48','en','default',450,'2020-09-26 16:31:48',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(900,'13-variant-13-10','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,13,'',10,'','2020-09-26 16:31:48','ar','default',450,'2020-09-26 16:31:48',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(901,'13-variant-13-11','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,13,'blue',11,'41','2020-09-26 16:31:48','en','default',451,'2020-09-26 16:31:48',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(902,'13-variant-13-11','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,13,'',11,'','2020-09-26 16:31:48','ar','default',451,'2020-09-26 16:31:48',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(903,'13-variant-14-7','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,14,'beige',7,'37','2020-09-26 16:31:48','en','default',452,'2020-09-26 16:31:48',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(904,'13-variant-14-7','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,14,'',7,'','2020-09-26 16:31:48','ar','default',452,'2020-09-26 16:31:48',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(905,'13-variant-14-8','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,14,'beige',8,'38','2020-09-26 16:31:48','en','default',453,'2020-09-26 16:31:48',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(906,'13-variant-14-8','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,14,'',8,'','2020-09-26 16:31:48','ar','default',453,'2020-09-26 16:31:48',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(907,'13-variant-14-9','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,14,'beige',9,'39','2020-09-26 16:31:48','en','default',454,'2020-09-26 16:31:48',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(908,'13-variant-14-9','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,14,'',9,'','2020-09-26 16:31:48','ar','default',454,'2020-09-26 16:31:48',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(909,'13-variant-14-10','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,14,'beige',10,'40','2020-09-26 16:31:48','en','default',455,'2020-09-26 16:31:48',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(910,'13-variant-14-10','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,14,'',10,'','2020-09-26 16:31:48','ar','default',455,'2020-09-26 16:31:48',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(911,'13-variant-14-11','PP-576',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,14,'beige',11,'41','2020-09-26 16:31:48','en','default',456,'2020-09-26 16:31:48',851,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(912,'13-variant-14-11','',NULL,NULL,NULL,NULL,1,NULL,5.0000,NULL,NULL,NULL,NULL,0.0000,14,'',11,'','2020-09-26 16:31:48','ar','default',456,'2020-09-26 16:31:48',852,NULL,5.0000,5.0000,NULL,NULL,NULL,NULL,NULL),(913,'14','988-2','<p>فلات الهبة</p>','988-2',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 16:55:21','en','default',457,'2020-09-26 16:55:21',NULL,1,0.0000,0.0000,'<p>فلات الهبة</p>','','','',NULL),(914,'14',NULL,NULL,'988-2',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 16:55:21','ar','default',457,'2020-09-26 16:55:21',NULL,1,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL),(915,'14-variant-1-6','988-2',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',6,'36','2020-09-26 16:55:21','en','default',458,'2020-09-26 16:55:21',913,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(916,'14-variant-1-6','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',6,'','2020-09-26 16:55:21','ar','default',458,'2020-09-26 16:55:21',914,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(917,'14-variant-4-6','988-2',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',6,'36','2020-09-26 16:55:21','en','default',459,'2020-09-26 16:55:21',913,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(918,'14-variant-4-6','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',6,'','2020-09-26 16:55:21','ar','default',459,'2020-09-26 16:55:21',914,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(919,'14-variant-5-6','988-2',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',6,'36','2020-09-26 16:55:21','en','default',460,'2020-09-26 16:55:21',913,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(920,'14-variant-5-6','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',6,'','2020-09-26 16:55:21','ar','default',460,'2020-09-26 16:55:21',914,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(921,'14-variant-1-7','988-2',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',7,'37','2020-09-26 16:55:21','en','default',461,'2020-09-26 16:55:21',913,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(922,'14-variant-1-7','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',7,'','2020-09-26 16:55:21','ar','default',461,'2020-09-26 16:55:21',914,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(923,'14-variant-1-8','988-2',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',8,'38','2020-09-26 16:55:21','en','default',462,'2020-09-26 16:55:21',913,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(924,'14-variant-1-8','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',8,'','2020-09-26 16:55:21','ar','default',462,'2020-09-26 16:55:21',914,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(925,'14-variant-1-9','988-2',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',9,'39','2020-09-26 16:55:21','en','default',463,'2020-09-26 16:55:21',913,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(926,'14-variant-1-9','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',9,'','2020-09-26 16:55:21','ar','default',463,'2020-09-26 16:55:21',914,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(927,'14-variant-1-10','988-2',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',10,'40','2020-09-26 16:55:21','en','default',464,'2020-09-26 16:55:21',913,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(928,'14-variant-1-10','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',10,'','2020-09-26 16:55:21','ar','default',464,'2020-09-26 16:55:21',914,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(929,'14-variant-4-7','988-2',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',7,'37','2020-09-26 16:55:21','en','default',465,'2020-09-26 16:55:21',913,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(930,'14-variant-4-7','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',7,'','2020-09-26 16:55:21','ar','default',465,'2020-09-26 16:55:21',914,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(931,'14-variant-4-8','988-2',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',8,'38','2020-09-26 16:55:21','en','default',466,'2020-09-26 16:55:21',913,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(932,'14-variant-4-8','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',8,'','2020-09-26 16:55:21','ar','default',466,'2020-09-26 16:55:21',914,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(933,'14-variant-4-9','988-2',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',9,'39','2020-09-26 16:55:22','en','default',467,'2020-09-26 16:55:22',913,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(934,'14-variant-4-9','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',9,'','2020-09-26 16:55:22','ar','default',467,'2020-09-26 16:55:22',914,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(935,'14-variant-4-10','988-2',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',10,'40','2020-09-26 16:55:22','en','default',468,'2020-09-26 16:55:22',913,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(936,'14-variant-4-10','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',10,'','2020-09-26 16:55:22','ar','default',468,'2020-09-26 16:55:22',914,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(937,'14-variant-5-7','988-2',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',7,'37','2020-09-26 16:55:22','en','default',469,'2020-09-26 16:55:22',913,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(938,'14-variant-5-7','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',7,'','2020-09-26 16:55:22','ar','default',469,'2020-09-26 16:55:22',914,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(939,'14-variant-5-8','988-2',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',8,'38','2020-09-26 16:55:22','en','default',470,'2020-09-26 16:55:22',913,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(940,'14-variant-5-8','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',8,'','2020-09-26 16:55:22','ar','default',470,'2020-09-26 16:55:22',914,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(941,'14-variant-5-9','988-2',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',9,'39','2020-09-26 16:55:22','en','default',471,'2020-09-26 16:55:22',913,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(942,'14-variant-5-9','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',9,'','2020-09-26 16:55:22','ar','default',471,'2020-09-26 16:55:22',914,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(943,'14-variant-5-10','988-2',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',10,'40','2020-09-26 16:55:22','en','default',472,'2020-09-26 16:55:22',913,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(944,'14-variant-5-10','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',10,'','2020-09-26 16:55:22','ar','default',472,'2020-09-26 16:55:22',914,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(945,'15','988-1','<p>فلات الهبه</p>','988-1',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 17:10:44','en','default',473,'2020-09-26 17:10:44',NULL,1,0.0000,0.0000,'<p>فلا الهبه</p>','','','',NULL),(946,'15',NULL,NULL,'988-1',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 17:10:44','ar','default',473,'2020-09-26 17:10:44',NULL,1,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL),(947,'15-variant-1-6','988-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',6,'36','2020-09-26 17:10:44','en','default',474,'2020-09-26 17:10:44',945,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(948,'15-variant-1-6','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',6,'','2020-09-26 17:10:44','ar','default',474,'2020-09-26 17:10:44',946,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(949,'15-variant-4-6','988-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',6,'36','2020-09-26 17:10:44','en','default',475,'2020-09-26 17:10:44',945,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(950,'15-variant-4-6','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',6,'','2020-09-26 17:10:44','ar','default',475,'2020-09-26 17:10:44',946,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(951,'15-variant-5-6','988-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',6,'36','2020-09-26 17:10:44','en','default',476,'2020-09-26 17:10:44',945,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(952,'15-variant-5-6','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',6,'','2020-09-26 17:10:44','ar','default',476,'2020-09-26 17:10:44',946,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(953,'15-variant-1-7','988-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',7,'37','2020-09-26 17:10:44','en','default',477,'2020-09-26 17:10:44',945,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(954,'15-variant-1-7','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',7,'','2020-09-26 17:10:44','ar','default',477,'2020-09-26 17:10:44',946,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(955,'15-variant-1-8','988-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',8,'38','2020-09-26 17:10:44','en','default',478,'2020-09-26 17:10:44',945,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(956,'15-variant-1-8','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',8,'','2020-09-26 17:10:44','ar','default',478,'2020-09-26 17:10:44',946,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(957,'15-variant-1-9','988-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',9,'39','2020-09-26 17:10:44','en','default',479,'2020-09-26 17:10:44',945,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(958,'15-variant-1-9','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',9,'','2020-09-26 17:10:44','ar','default',479,'2020-09-26 17:10:44',946,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(959,'15-variant-1-10','988-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',10,'40','2020-09-26 17:10:45','en','default',480,'2020-09-26 17:10:45',945,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(960,'15-variant-1-10','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',10,'','2020-09-26 17:10:45','ar','default',480,'2020-09-26 17:10:45',946,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(961,'15-variant-4-7','988-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',7,'37','2020-09-26 17:10:45','en','default',481,'2020-09-26 17:10:45',945,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(962,'15-variant-4-7','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',7,'','2020-09-26 17:10:45','ar','default',481,'2020-09-26 17:10:45',946,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(963,'15-variant-4-8','988-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',8,'38','2020-09-26 17:10:45','en','default',482,'2020-09-26 17:10:45',945,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(964,'15-variant-4-8','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',8,'','2020-09-26 17:10:45','ar','default',482,'2020-09-26 17:10:45',946,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(965,'15-variant-4-9','988-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',9,'39','2020-09-26 17:10:45','en','default',483,'2020-09-26 17:10:45',945,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(966,'15-variant-4-9','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',9,'','2020-09-26 17:10:45','ar','default',483,'2020-09-26 17:10:45',946,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(967,'15-variant-4-10','988-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',10,'40','2020-09-26 17:10:45','en','default',484,'2020-09-26 17:10:45',945,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(968,'15-variant-4-10','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',10,'','2020-09-26 17:10:45','ar','default',484,'2020-09-26 17:10:45',946,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(969,'15-variant-5-7','988-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',7,'37','2020-09-26 17:10:45','en','default',485,'2020-09-26 17:10:45',945,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(970,'15-variant-5-7','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',7,'','2020-09-26 17:10:45','ar','default',485,'2020-09-26 17:10:45',946,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(971,'15-variant-5-8','988-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',8,'38','2020-09-26 17:10:45','en','default',486,'2020-09-26 17:10:45',945,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(972,'15-variant-5-8','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',8,'','2020-09-26 17:10:45','ar','default',486,'2020-09-26 17:10:45',946,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(973,'15-variant-5-9','988-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',9,'39','2020-09-26 17:10:45','en','default',487,'2020-09-26 17:10:45',945,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(974,'15-variant-5-9','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',9,'','2020-09-26 17:10:45','ar','default',487,'2020-09-26 17:10:45',946,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(975,'15-variant-5-10','988-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',10,'40','2020-09-26 17:10:45','en','default',488,'2020-09-26 17:10:45',945,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(976,'15-variant-5-10','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',10,'','2020-09-26 17:10:45','ar','default',488,'2020-09-26 17:10:45',946,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(977,'16','986-1','<p>فلات الهبة</p>','986-1',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 17:26:52','en','default',489,'2020-09-26 17:26:52',NULL,1,0.0000,0.0000,'<p>فلات الهبة</p>','','','',NULL),(978,'16',NULL,NULL,'986-1',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 17:26:52','ar','default',489,'2020-09-26 17:26:52',NULL,1,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL),(979,'16-variant-1-6','986-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',6,'36','2020-09-26 17:26:52','en','default',490,'2020-09-26 17:26:52',977,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(980,'16-variant-1-6','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',6,'','2020-09-26 17:26:52','ar','default',490,'2020-09-26 17:26:52',978,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(981,'16-variant-4-6','986-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',6,'36','2020-09-26 17:26:52','en','default',491,'2020-09-26 17:26:52',977,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(982,'16-variant-4-6','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',6,'','2020-09-26 17:26:52','ar','default',491,'2020-09-26 17:26:52',978,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(983,'16-variant-5-6','986-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',6,'36','2020-09-26 17:26:52','en','default',492,'2020-09-26 17:26:52',977,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(984,'16-variant-5-6','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',6,'','2020-09-26 17:26:52','ar','default',492,'2020-09-26 17:26:52',978,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(985,'16-variant-1-7','986-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',7,'37','2020-09-26 17:26:52','en','default',493,'2020-09-26 17:26:52',977,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(986,'16-variant-1-7','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',7,'','2020-09-26 17:26:52','ar','default',493,'2020-09-26 17:26:52',978,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(987,'16-variant-1-8','986-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',8,'38','2020-09-26 17:26:52','en','default',494,'2020-09-26 17:26:52',977,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(988,'16-variant-1-8','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',8,'','2020-09-26 17:26:52','ar','default',494,'2020-09-26 17:26:52',978,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(989,'16-variant-1-9','986-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',9,'39','2020-09-26 17:26:52','en','default',495,'2020-09-26 17:26:52',977,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(990,'16-variant-1-9','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',9,'','2020-09-26 17:26:52','ar','default',495,'2020-09-26 17:26:52',978,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(991,'16-variant-1-10','986-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',10,'40','2020-09-26 17:26:52','en','default',496,'2020-09-26 17:26:52',977,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(992,'16-variant-1-10','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',10,'','2020-09-26 17:26:52','ar','default',496,'2020-09-26 17:26:52',978,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(993,'16-variant-4-7','986-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',7,'37','2020-09-26 17:26:52','en','default',497,'2020-09-26 17:26:52',977,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(994,'16-variant-4-7','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',7,'','2020-09-26 17:26:52','ar','default',497,'2020-09-26 17:26:52',978,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(995,'16-variant-4-8','986-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',8,'38','2020-09-26 17:26:52','en','default',498,'2020-09-26 17:26:52',977,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(996,'16-variant-4-8','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',8,'','2020-09-26 17:26:52','ar','default',498,'2020-09-26 17:26:52',978,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(997,'16-variant-4-9','986-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',9,'39','2020-09-26 17:26:52','en','default',499,'2020-09-26 17:26:52',977,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(998,'16-variant-4-9','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',9,'','2020-09-26 17:26:52','ar','default',499,'2020-09-26 17:26:52',978,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(999,'16-variant-4-10','986-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',10,'40','2020-09-26 17:26:52','en','default',500,'2020-09-26 17:26:52',977,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1000,'16-variant-4-10','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',10,'','2020-09-26 17:26:52','ar','default',500,'2020-09-26 17:26:52',978,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1001,'16-variant-5-7','986-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',7,'37','2020-09-26 17:26:52','en','default',501,'2020-09-26 17:26:52',977,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1002,'16-variant-5-7','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',7,'','2020-09-26 17:26:52','ar','default',501,'2020-09-26 17:26:52',978,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1003,'16-variant-5-8','986-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',8,'38','2020-09-26 17:26:53','en','default',502,'2020-09-26 17:26:53',977,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1004,'16-variant-5-8','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',8,'','2020-09-26 17:26:53','ar','default',502,'2020-09-26 17:26:53',978,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1005,'16-variant-5-9','986-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',9,'39','2020-09-26 17:26:53','en','default',503,'2020-09-26 17:26:53',977,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1006,'16-variant-5-9','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',9,'','2020-09-26 17:26:53','ar','default',503,'2020-09-26 17:26:53',978,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1007,'16-variant-5-10','986-1',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',10,'40','2020-09-26 17:26:53','en','default',504,'2020-09-26 17:26:53',977,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1008,'16-variant-5-10','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',10,'','2020-09-26 17:26:53','ar','default',504,'2020-09-26 17:26:53',978,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1009,'17','988-5','<p>فلات الهبة</p>','988-5',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 17:40:50','en','default',505,'2020-09-26 17:40:50',NULL,1,0.0000,0.0000,'<p>فلات الهبة</p>','','','',NULL),(1010,'17',NULL,NULL,'988-5',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-26 17:40:50','ar','default',505,'2020-09-26 17:40:50',NULL,1,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL),(1011,'17-variant-1-6','988-5',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',6,'36','2020-09-26 17:40:50','en','default',506,'2020-09-26 17:40:50',1009,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1012,'17-variant-1-6','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',6,'','2020-09-26 17:40:50','ar','default',506,'2020-09-26 17:40:50',1010,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1013,'17-variant-4-6','988-5',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',6,'36','2020-09-26 17:40:50','en','default',507,'2020-09-26 17:40:50',1009,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1014,'17-variant-4-6','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',6,'','2020-09-26 17:40:50','ar','default',507,'2020-09-26 17:40:50',1010,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1015,'17-variant-5-6','988-5',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',6,'36','2020-09-26 17:40:50','en','default',508,'2020-09-26 17:40:50',1009,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1016,'17-variant-5-6','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',6,'','2020-09-26 17:40:50','ar','default',508,'2020-09-26 17:40:50',1010,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1017,'17-variant-1-7','988-5',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',7,'37','2020-09-26 17:40:50','en','default',509,'2020-09-26 17:40:50',1009,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1018,'17-variant-1-7','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',7,'','2020-09-26 17:40:50','ar','default',509,'2020-09-26 17:40:50',1010,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1019,'17-variant-1-8','988-5',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',8,'38','2020-09-26 17:40:50','en','default',510,'2020-09-26 17:40:50',1009,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1020,'17-variant-1-8','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',8,'','2020-09-26 17:40:50','ar','default',510,'2020-09-26 17:40:50',1010,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1021,'17-variant-1-9','988-5',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',9,'39','2020-09-26 17:40:50','en','default',511,'2020-09-26 17:40:50',1009,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1022,'17-variant-1-9','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',9,'','2020-09-26 17:40:50','ar','default',511,'2020-09-26 17:40:50',1010,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1023,'17-variant-1-10','988-5',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'Red',10,'40','2020-09-26 17:40:50','en','default',512,'2020-09-26 17:40:50',1009,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1024,'17-variant-1-10','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,1,'',10,'','2020-09-26 17:40:50','ar','default',512,'2020-09-26 17:40:50',1010,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1025,'17-variant-4-7','988-5',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',7,'37','2020-09-26 17:40:50','en','default',513,'2020-09-26 17:40:50',1009,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1026,'17-variant-4-7','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',7,'','2020-09-26 17:40:50','ar','default',513,'2020-09-26 17:40:50',1010,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1027,'17-variant-4-8','988-5',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',8,'38','2020-09-26 17:40:51','en','default',514,'2020-09-26 17:40:51',1009,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1028,'17-variant-4-8','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',8,'','2020-09-26 17:40:51','ar','default',514,'2020-09-26 17:40:51',1010,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1029,'17-variant-4-9','988-5',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',9,'39','2020-09-26 17:40:51','en','default',515,'2020-09-26 17:40:51',1009,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1030,'17-variant-4-9','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',9,'','2020-09-26 17:40:51','ar','default',515,'2020-09-26 17:40:51',1010,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1031,'17-variant-4-10','988-5',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'Black',10,'40','2020-09-26 17:40:51','en','default',516,'2020-09-26 17:40:51',1009,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1032,'17-variant-4-10','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,4,'',10,'','2020-09-26 17:40:51','ar','default',516,'2020-09-26 17:40:51',1010,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1033,'17-variant-5-7','988-5',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',7,'37','2020-09-26 17:40:51','en','default',517,'2020-09-26 17:40:51',1009,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1034,'17-variant-5-7','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',7,'','2020-09-26 17:40:51','ar','default',517,'2020-09-26 17:40:51',1010,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1035,'17-variant-5-8','988-5',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',8,'38','2020-09-26 17:40:51','en','default',518,'2020-09-26 17:40:51',1009,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1036,'17-variant-5-8','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',8,'','2020-09-26 17:40:51','ar','default',518,'2020-09-26 17:40:51',1010,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1037,'17-variant-5-9','988-5',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',9,'39','2020-09-26 17:40:51','en','default',519,'2020-09-26 17:40:51',1009,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1038,'17-variant-5-9','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',9,'','2020-09-26 17:40:51','ar','default',519,'2020-09-26 17:40:51',1010,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1039,'17-variant-5-10','988-5',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'White',10,'40','2020-09-26 17:40:51','en','default',520,'2020-09-26 17:40:51',1009,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL),(1040,'17-variant-5-10','',NULL,NULL,NULL,NULL,1,NULL,4.0000,NULL,NULL,NULL,NULL,0.0000,5,'',10,'','2020-09-26 17:40:51','ar','default',520,'2020-09-26 17:40:51',1010,NULL,4.0000,4.0000,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `product_flat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_grouped_products`
--

DROP TABLE IF EXISTS `product_grouped_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_grouped_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `associated_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_grouped_products_product_id_foreign` (`product_id`),
  KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`),
  CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_grouped_products`
--

LOCK TABLES `product_grouped_products` WRITE;
/*!40000 ALTER TABLE `product_grouped_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_grouped_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (3,NULL,'product/226/sOsMvrhnMitbp7DrGgdlia06RJCVQHZvM41mWhSh.jpeg',226),(4,NULL,'product/226/fFp81CwXIdgas6yg4eAnX3fZqEZWhbJDERaogGQB.jpeg',226),(5,NULL,'product/239/Opk6EJlQNxzhnjh9X6rL3i8vbQnX8g1XjHDaNHHK.jpeg',239),(6,NULL,'product/239/1lGwzlPCT9elhO56JdOmj5NbXzFEMhYgdfFkXCMW.jpeg',239),(7,NULL,'product/239/Jd9K9zNzdudwJjnvvWYlEtcSDK5FpTs5u0kV8z5u.jpeg',239),(8,NULL,'product/255/2Sp6A1uMlBeiJb425S8vVuPEqNEtvDsIN3Ce4Z88.jpeg',255),(9,NULL,'product/255/sQr55iR0ZxtfHZEOI2turzGjh2jHDbXpyOJXLqRb.jpeg',255),(10,NULL,'product/274/FGJNqfsoCPGG9hTLzaRBVxFFRB28RzzRq4Z8X5iN.jpeg',274),(11,NULL,'product/274/UVyr1dCQuE7uP4pwqaUO0NVlapFWcpOPXhyWswbH.jpeg',274),(12,NULL,'product/274/rnI1sXRq41lhBDr40DqSrOPqg1c9AAz7rxeovEqK.jpeg',274),(13,NULL,'product/274/PDWxUBtGAHkkJJhlPcBxnKWTXJPoQzl1g91hrQzt.jpeg',274),(14,NULL,'product/295/V3OqAVStWoacI3uMTByqqcfC6wc2QYf4WMPtbDln.jpeg',295),(15,NULL,'product/295/NlXh2lE6ymoGcAHZY4JZvib69AWkIDdJQ4Esc6b0.jpeg',295),(16,NULL,'product/295/xGhhuZMsgELmJmCpxSyLBOkx9cnIuPCit901MsDu.jpeg',295),(17,NULL,'product/295/PBHz70vpXaCGNfxD8PGuLSSGyqiZbHfZVqRRBR4n.jpeg',295),(18,NULL,'product/295/38EBdbT8ve9lrJ2JZatfJQNkrlyTFbx6Kfe59xpL.jpeg',295),(19,NULL,'product/326/3XmlDZuCxAKMH0sHpvqzaTYu57dVyuq9mBYdA75m.jpeg',326),(20,NULL,'product/326/nshu7sEUDy6PM8bSOy4C2Y6UP5AvEAwJH1K4jbtE.jpeg',326),(21,NULL,'product/326/nHH7r2KVFUZIxotPS48MUwHlBQ3Vzmn12mXgZ6la.jpeg',326),(22,NULL,'product/356/4htihHSkB4lrhPdJZMkJtCdo7E4qi2vF3XYnRln6.jpeg',356),(23,NULL,'product/356/iCwMkkzh1riiHISqB5n9hnTiaHCUyPtABKidpiTd.jpeg',356),(24,NULL,'product/356/SAfVVHTDifh8BtLyAMNTevxfpacqVJz70jNuRr11.jpeg',356),(25,NULL,'product/375/h7ayM7pvG8Mpy4Ha1Xg0HOcCU5cbsLz3ZMmuLbFR.jpeg',375),(26,NULL,'product/394/blidj9LbGFf9bXkA4uck7hi52GlQszahV0zA4klE.jpeg',394),(27,NULL,'product/394/WWMT4Ke4pPxnWBbbAWch3LmUpIexOHpDJEeftaVR.jpeg',394),(28,NULL,'product/407/eVoMSWd1SGhPOJqwHCtO3D2LddUDXMQVA4Q5ZS4x.jpeg',407),(29,NULL,'product/407/3JbGHwRrnMsOZCbIif7Gl8SRZMyI7jFst3qdcwqT.jpeg',407),(30,NULL,'product/407/CW1EIh37NAxhNYePCImey4kpqwYz8uuKlm0Jyiyh.jpeg',407),(31,NULL,'product/426/xy5zTxNOo0AQSZ2NFFCKYQ27RWqMnQMEnab6IpfY.jpeg',426),(32,NULL,'product/457/3lNPkvQl7hhhb87cfOOW0YFeaNZauirbrto6rsQu.jpeg',457),(33,NULL,'product/473/IY4rWBxO2RqZxkVZx18UVfsMjf3jFsm7YoDhLIGi.jpeg',473),(34,NULL,'product/489/xcCWAmIc3kRFAAcTpg5Lo9OH2PMhdaCgPyscdxv4.jpeg',489),(35,NULL,'product/505/R5hNkw6H3ePlndCjzeAh7PDHgO9JSOxqP4yfe2pw.jpeg',505);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventories`
--

DROP TABLE IF EXISTS `product_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `inventory_source_id` int(10) unsigned NOT NULL,
  `vendor_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventories`
--

LOCK TABLES `product_inventories` WRITE;
/*!40000 ALTER TABLE `product_inventories` DISABLE KEYS */;
INSERT INTO `product_inventories` VALUES (18,2,227,1,0),(19,3,228,1,0),(20,2,229,1,0),(21,4,230,1,0),(22,5,231,1,0),(23,3,232,1,0),(24,5,233,1,0),(25,3,234,1,0),(26,2,235,1,0),(27,2,236,1,0),(28,2,237,1,0),(29,3,238,1,0),(30,0,240,1,0),(31,0,241,1,0),(32,0,242,1,0),(33,0,243,1,0),(34,0,244,1,0),(35,0,245,1,0),(36,0,246,1,0),(37,0,247,1,0),(38,0,248,1,0),(39,0,249,1,0),(40,0,250,1,0),(41,0,251,1,0),(42,0,252,1,0),(43,0,253,1,0),(44,0,254,1,0),(45,2,256,1,0),(46,0,257,1,0),(47,0,258,1,0),(48,0,259,1,0),(49,0,260,1,0),(50,0,261,1,0),(51,0,262,1,0),(52,0,263,1,0),(53,0,264,1,0),(54,0,265,1,0),(55,0,266,1,0),(56,0,267,1,0),(57,0,268,1,0),(58,0,269,1,0),(59,0,270,1,0),(60,0,271,1,0),(61,0,272,1,0),(62,0,273,1,0),(63,2,275,1,0),(64,2,276,1,0),(65,2,277,1,0),(66,2,278,1,0),(67,2,279,1,0),(68,2,280,1,0),(69,2,281,1,0),(70,2,282,1,0),(71,2,283,1,0),(72,2,284,1,0),(73,2,285,1,0),(74,2,286,1,0),(75,2,287,1,0),(76,2,288,1,0),(77,2,289,1,0),(78,2,290,1,0),(79,2,291,1,0),(80,2,292,1,0),(81,2,293,1,0),(82,2,294,1,0),(83,3,296,1,0),(84,3,297,1,0),(85,3,298,1,0),(86,3,299,1,0),(87,3,300,1,0),(88,3,301,1,0),(89,3,302,1,0),(90,3,303,1,0),(91,3,304,1,0),(92,3,305,1,0),(93,3,306,1,0),(94,3,307,1,0),(95,3,308,1,0),(96,3,309,1,0),(97,3,310,1,0),(98,3,311,1,0),(99,3,312,1,0),(100,3,313,1,0),(101,3,314,1,0),(102,3,315,1,0),(103,3,316,1,0),(104,3,317,1,0),(105,3,318,1,0),(106,3,319,1,0),(107,3,320,1,0),(108,3,321,1,0),(109,3,322,1,0),(110,3,323,1,0),(111,3,324,1,0),(112,9,325,1,0),(113,3,327,1,0),(114,3,328,1,0),(115,3,329,1,0),(116,3,330,1,0),(117,3,331,1,0),(118,3,332,1,0),(119,3,333,1,0),(120,3,334,1,0),(121,3,335,1,0),(122,3,336,1,0),(123,3,337,1,0),(124,3,338,1,0),(125,3,339,1,0),(126,3,340,1,0),(127,3,341,1,0),(128,3,357,1,0),(129,3,358,1,0),(130,3,359,1,0),(131,3,360,1,0),(132,3,361,1,0),(133,3,362,1,0),(134,3,363,1,0),(135,3,364,1,0),(136,3,365,1,0),(137,3,366,1,0),(138,3,367,1,0),(139,3,368,1,0),(140,3,369,1,0),(141,3,370,1,0),(142,3,371,1,0),(143,3,372,1,0),(144,3,373,1,0),(145,3,374,1,0),(146,1,376,1,0),(147,1,377,1,0),(148,1,378,1,0),(149,1,379,1,0),(150,1,380,1,0),(151,1,381,1,0),(152,1,382,1,0),(153,1,383,1,0),(154,1,384,1,0),(155,1,385,1,0),(156,1,386,1,0),(157,1,387,1,0),(158,1,388,1,0),(159,1,389,1,0),(160,1,390,1,0),(161,1,391,1,0),(162,1,392,1,0),(163,1,393,1,0),(164,2,395,1,0),(165,2,396,1,0),(166,2,397,1,0),(167,2,398,1,0),(168,2,399,1,0),(169,2,400,1,0),(170,2,401,1,0),(171,2,402,1,0),(172,2,403,1,0),(173,2,404,1,0),(174,2,405,1,0),(175,2,406,1,0),(176,2,408,1,0),(177,2,409,1,0),(178,2,410,1,0),(179,2,411,1,0),(180,2,412,1,0),(181,2,413,1,0),(182,2,414,1,0),(183,2,415,1,0),(184,2,416,1,0),(185,2,417,1,0),(186,2,418,1,0),(187,2,419,1,0),(188,2,420,1,0),(189,2,421,1,0),(190,2,422,1,0),(191,2,423,1,0),(192,2,424,1,0),(193,2,425,1,0),(194,3,427,1,0),(195,3,428,1,0),(196,3,429,1,0),(197,3,430,1,0),(198,3,431,1,0),(199,3,432,1,0),(200,3,433,1,0),(201,3,434,1,0),(202,3,435,1,0),(203,3,436,1,0),(204,3,437,1,0),(205,3,438,1,0),(206,3,439,1,0),(207,3,440,1,0),(208,3,441,1,0),(209,3,442,1,0),(210,3,443,1,0),(211,3,444,1,0),(212,3,445,1,0),(213,3,446,1,0),(214,3,447,1,0),(215,3,448,1,0),(216,3,449,1,0),(217,3,450,1,0),(218,3,451,1,0),(219,3,452,1,0),(220,3,453,1,0),(221,3,454,1,0),(222,3,455,1,0),(223,3,456,1,0),(224,4,458,1,0),(225,4,459,1,0),(226,4,460,1,0),(227,4,461,1,0),(228,4,462,1,0),(229,4,463,1,0),(230,4,464,1,0),(231,4,465,1,0),(232,4,466,1,0),(233,4,467,1,0),(234,4,468,1,0),(235,4,469,1,0),(236,4,470,1,0),(237,4,471,1,0),(238,4,472,1,0),(239,2,474,1,0),(240,2,475,1,0),(241,2,476,1,0),(242,2,477,1,0),(243,2,478,1,0),(244,2,479,1,0),(245,2,480,1,0),(246,2,481,1,0),(247,2,482,1,0),(248,2,483,1,0),(249,2,484,1,0),(250,2,485,1,0),(251,2,486,1,0),(252,2,487,1,0),(253,2,488,1,0),(254,2,490,1,0),(255,2,491,1,0),(256,2,492,1,0),(257,2,493,1,0),(258,2,494,1,0),(259,2,495,1,0),(260,2,496,1,0),(261,2,497,1,0),(262,2,498,1,0),(263,2,499,1,0),(264,2,500,1,0),(265,2,501,1,0),(266,2,502,1,0),(267,2,503,1,0),(268,2,504,1,0),(269,2,506,1,0),(270,2,507,1,0),(271,2,508,1,0),(272,2,509,1,0),(273,2,510,1,0),(274,2,511,1,0),(275,2,512,1,0),(276,2,513,1,0),(277,2,514,1,0),(278,2,515,1,0),(279,2,516,1,0),(280,2,517,1,0),(281,2,518,1,0),(282,2,519,1,0),(283,2,520,1,0);
/*!40000 ALTER TABLE `product_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_ordered_inventories`
--

DROP TABLE IF EXISTS `product_ordered_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_ordered_inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_ordered_inventories`
--

LOCK TABLES `product_ordered_inventories` WRITE;
/*!40000 ALTER TABLE `product_ordered_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_ordered_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_relations`
--

DROP TABLE IF EXISTS `product_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_relations` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  KEY `product_relations_parent_id_foreign` (`parent_id`),
  KEY `product_relations_child_id_foreign` (`child_id`),
  CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_relations`
--

LOCK TABLES `product_relations` WRITE;
/*!40000 ALTER TABLE `product_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  KEY `product_reviews_customer_id_foreign` (`customer_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_super_attributes`
--

DROP TABLE IF EXISTS `product_super_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_super_attributes` (
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  KEY `product_super_attributes_product_id_foreign` (`product_id`),
  KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_super_attributes`
--

LOCK TABLES `product_super_attributes` WRITE;
/*!40000 ALTER TABLE `product_super_attributes` DISABLE KEYS */;
INSERT INTO `product_super_attributes` VALUES (27,23),(27,24),(58,23),(58,24),(104,23),(104,24),(165,23),(165,24),(226,23),(226,24),(239,23),(239,24),(255,23),(255,24),(274,23),(274,24),(295,23),(295,24),(326,23),(326,24),(342,23),(342,24),(356,23),(356,24),(375,23),(375,24),(394,23),(394,24),(407,23),(407,24),(426,23),(426,24),(457,23),(457,24),(473,23),(473,24),(489,23),(489,24),(505,23),(505,24);
/*!40000 ALTER TABLE `product_super_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_up_sells`
--

DROP TABLE IF EXISTS `product_up_sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_up_sells` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  KEY `product_up_sells_parent_id_foreign` (`parent_id`),
  KEY `product_up_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_up_sells`
--

LOCK TABLES `product_up_sells` WRITE;
/*!40000 ALTER TABLE `product_up_sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_up_sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `attribute_family_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `products_parent_id_foreign` (`parent_id`),
  CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`),
  CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (22,'784-black','simple','2020-09-23 02:07:53','2020-09-23 02:07:53',NULL,1),(23,'0001','simple','2020-09-23 23:59:26','2020-09-23 23:59:26',NULL,1),(25,'0002','simple','2020-09-24 00:22:16','2020-09-24 00:22:16',NULL,1),(27,'0004','configurable','2020-09-24 00:45:50','2020-09-24 00:45:50',NULL,1),(58,'0005','configurable','2020-09-24 12:02:08','2020-09-24 12:02:08',NULL,1),(103,'001','simple','2020-09-24 13:09:48','2020-09-24 13:09:48',NULL,1),(104,'002','configurable','2020-09-24 13:13:33','2020-09-24 13:13:33',NULL,1),(165,'003','configurable','2020-09-24 13:27:24','2020-09-24 13:27:24',NULL,1),(226,'1','configurable','2020-09-24 13:37:26','2020-09-24 13:37:26',NULL,1),(227,'1-variant-4-6','simple','2020-09-24 13:37:26','2020-09-24 13:37:26',226,1),(228,'1-variant-15-6','simple','2020-09-24 13:37:26','2020-09-24 13:37:26',226,1),(229,'1-variant-4-7','simple','2020-09-24 13:37:26','2020-09-24 13:37:26',226,1),(230,'1-variant-4-8','simple','2020-09-24 13:37:26','2020-09-24 13:37:26',226,1),(231,'1-variant-4-9','simple','2020-09-24 13:37:26','2020-09-24 13:37:26',226,1),(232,'1-variant-4-10','simple','2020-09-24 13:37:26','2020-09-24 13:37:26',226,1),(233,'1-variant-4-11','simple','2020-09-24 13:37:26','2020-09-24 13:37:26',226,1),(234,'1-variant-15-7','simple','2020-09-24 13:37:26','2020-09-24 13:37:26',226,1),(235,'1-variant-15-8','simple','2020-09-24 13:37:26','2020-09-24 13:37:26',226,1),(236,'1-variant-15-9','simple','2020-09-24 13:37:26','2020-09-24 13:37:26',226,1),(237,'1-variant-15-10','simple','2020-09-24 13:37:26','2020-09-24 13:37:26',226,1),(238,'1-variant-15-11','simple','2020-09-24 13:37:26','2020-09-24 13:37:26',226,1),(239,'2','configurable','2020-09-24 13:56:41','2020-09-24 13:56:41',NULL,1),(240,'2-variant-4-7','simple','2020-09-24 13:56:41','2020-09-24 13:56:41',239,1),(241,'2-variant-15-7','simple','2020-09-24 13:56:41','2020-09-24 13:56:41',239,1),(242,'2-variant-17-7','simple','2020-09-24 13:56:41','2020-09-24 13:56:41',239,1),(243,'2-variant-4-8','simple','2020-09-24 13:56:41','2020-09-24 13:56:41',239,1),(244,'2-variant-4-9','simple','2020-09-24 13:56:41','2020-09-24 13:56:41',239,1),(245,'2-variant-4-10','simple','2020-09-24 13:56:41','2020-09-24 13:56:41',239,1),(246,'2-variant-4-11','simple','2020-09-24 13:56:41','2020-09-24 13:56:41',239,1),(247,'2-variant-15-8','simple','2020-09-24 13:56:41','2020-09-24 13:56:41',239,1),(248,'2-variant-15-9','simple','2020-09-24 13:56:41','2020-09-24 13:56:41',239,1),(249,'2-variant-15-10','simple','2020-09-24 13:56:41','2020-09-24 13:56:41',239,1),(250,'2-variant-15-11','simple','2020-09-24 13:56:41','2020-09-24 13:56:41',239,1),(251,'2-variant-17-8','simple','2020-09-24 13:56:41','2020-09-24 13:56:41',239,1),(252,'2-variant-17-9','simple','2020-09-24 13:56:41','2020-09-24 13:56:41',239,1),(253,'2-variant-17-10','simple','2020-09-24 13:56:41','2020-09-24 13:56:41',239,1),(254,'2-variant-17-11','simple','2020-09-24 13:56:41','2020-09-24 13:56:41',239,1),(255,'3','configurable','2020-09-24 16:25:58','2020-09-24 16:25:58',NULL,1),(256,'3-variant-4-6','simple','2020-09-24 16:25:58','2020-09-24 16:25:58',255,1),(257,'3-variant-5-6','simple','2020-09-24 16:25:58','2020-09-24 16:25:58',255,1),(258,'3-variant-18-6','simple','2020-09-24 16:25:58','2020-09-24 16:25:58',255,1),(259,'3-variant-4-7','simple','2020-09-24 16:25:58','2020-09-24 16:25:58',255,1),(260,'3-variant-4-8','simple','2020-09-24 16:25:58','2020-09-24 16:25:58',255,1),(261,'3-variant-4-9','simple','2020-09-24 16:25:58','2020-09-24 16:25:58',255,1),(262,'3-variant-4-10','simple','2020-09-24 16:25:58','2020-09-24 16:25:58',255,1),(263,'3-variant-4-11','simple','2020-09-24 16:25:59','2020-09-24 16:25:59',255,1),(264,'3-variant-5-7','simple','2020-09-24 16:25:59','2020-09-24 16:25:59',255,1),(265,'3-variant-5-8','simple','2020-09-24 16:25:59','2020-09-24 16:25:59',255,1),(266,'3-variant-5-9','simple','2020-09-24 16:25:59','2020-09-24 16:25:59',255,1),(267,'3-variant-5-10','simple','2020-09-24 16:25:59','2020-09-24 16:25:59',255,1),(268,'3-variant-5-11','simple','2020-09-24 16:25:59','2020-09-24 16:25:59',255,1),(269,'3-variant-18-7','simple','2020-09-24 16:25:59','2020-09-24 16:25:59',255,1),(270,'3-variant-18-8','simple','2020-09-24 16:25:59','2020-09-24 16:25:59',255,1),(271,'3-variant-18-9','simple','2020-09-24 16:25:59','2020-09-24 16:25:59',255,1),(272,'3-variant-18-10','simple','2020-09-24 16:25:59','2020-09-24 16:25:59',255,1),(273,'3-variant-18-11','simple','2020-09-24 16:25:59','2020-09-24 16:25:59',255,1),(274,'4','configurable','2020-09-25 13:25:44','2020-09-25 13:25:44',NULL,1),(275,'4-variant-4-7','simple','2020-09-25 13:25:44','2020-09-25 13:25:44',274,1),(276,'4-variant-15-7','simple','2020-09-25 13:25:44','2020-09-25 13:25:44',274,1),(277,'4-variant-16-7','simple','2020-09-25 13:25:44','2020-09-25 13:25:44',274,1),(278,'4-variant-17-7','simple','2020-09-25 13:25:45','2020-09-25 13:25:45',274,1),(279,'4-variant-4-8','simple','2020-09-25 13:25:45','2020-09-25 13:25:45',274,1),(280,'4-variant-4-9','simple','2020-09-25 13:25:45','2020-09-25 13:25:45',274,1),(281,'4-variant-4-10','simple','2020-09-25 13:25:45','2020-09-25 13:25:45',274,1),(282,'4-variant-4-11','simple','2020-09-25 13:25:45','2020-09-25 13:25:45',274,1),(283,'4-variant-15-8','simple','2020-09-25 13:25:45','2020-09-25 13:25:45',274,1),(284,'4-variant-15-9','simple','2020-09-25 13:25:45','2020-09-25 13:25:45',274,1),(285,'4-variant-15-10','simple','2020-09-25 13:25:45','2020-09-25 13:25:45',274,1),(286,'4-variant-15-11','simple','2020-09-25 13:25:45','2020-09-25 13:25:45',274,1),(287,'4-variant-16-8','simple','2020-09-25 13:25:45','2020-09-25 13:25:45',274,1),(288,'4-variant-16-9','simple','2020-09-25 13:25:45','2020-09-25 13:25:45',274,1),(289,'4-variant-16-10','simple','2020-09-25 13:25:45','2020-09-25 13:25:45',274,1),(290,'4-variant-16-11','simple','2020-09-25 13:25:45','2020-09-25 13:25:45',274,1),(291,'4-variant-17-8','simple','2020-09-25 13:25:45','2020-09-25 13:25:45',274,1),(292,'4-variant-17-9','simple','2020-09-25 13:25:45','2020-09-25 13:25:45',274,1),(293,'4-variant-17-10','simple','2020-09-25 13:25:45','2020-09-25 13:25:45',274,1),(294,'4-variant-17-11','simple','2020-09-25 13:25:45','2020-09-25 13:25:45',274,1),(295,'5','configurable','2020-09-25 14:40:54','2020-09-25 14:40:54',NULL,1),(296,'5-variant-3-6','simple','2020-09-25 14:40:54','2020-09-25 14:40:54',295,1),(297,'5-variant-5-6','simple','2020-09-25 14:40:54','2020-09-25 14:40:54',295,1),(298,'5-variant-13-6','simple','2020-09-25 14:40:54','2020-09-25 14:40:54',295,1),(299,'5-variant-14-6','simple','2020-09-25 14:40:54','2020-09-25 14:40:54',295,1),(300,'5-variant-18-6','simple','2020-09-25 14:40:54','2020-09-25 14:40:54',295,1),(301,'5-variant-3-7','simple','2020-09-25 14:40:54','2020-09-25 14:40:54',295,1),(302,'5-variant-3-8','simple','2020-09-25 14:40:54','2020-09-25 14:40:54',295,1),(303,'5-variant-3-9','simple','2020-09-25 14:40:54','2020-09-25 14:40:54',295,1),(304,'5-variant-3-10','simple','2020-09-25 14:40:54','2020-09-25 14:40:54',295,1),(305,'5-variant-3-11','simple','2020-09-25 14:40:55','2020-09-25 14:40:55',295,1),(306,'5-variant-5-7','simple','2020-09-25 14:40:55','2020-09-25 14:40:55',295,1),(307,'5-variant-5-8','simple','2020-09-25 14:40:55','2020-09-25 14:40:55',295,1),(308,'5-variant-5-9','simple','2020-09-25 14:40:55','2020-09-25 14:40:55',295,1),(309,'5-variant-5-10','simple','2020-09-25 14:40:55','2020-09-25 14:40:55',295,1),(310,'5-variant-5-11','simple','2020-09-25 14:40:55','2020-09-25 14:40:55',295,1),(311,'5-variant-13-7','simple','2020-09-25 14:40:55','2020-09-25 14:40:55',295,1),(312,'5-variant-13-8','simple','2020-09-25 14:40:55','2020-09-25 14:40:55',295,1),(313,'5-variant-13-9','simple','2020-09-25 14:40:55','2020-09-25 14:40:55',295,1),(314,'5-variant-13-10','simple','2020-09-25 14:40:55','2020-09-25 14:40:55',295,1),(315,'5-variant-13-11','simple','2020-09-25 14:40:55','2020-09-25 14:40:55',295,1),(316,'5-variant-14-7','simple','2020-09-25 14:40:55','2020-09-25 14:40:55',295,1),(317,'5-variant-14-8','simple','2020-09-25 14:40:55','2020-09-25 14:40:55',295,1),(318,'5-variant-14-9','simple','2020-09-25 14:40:55','2020-09-25 14:40:55',295,1),(319,'5-variant-14-10','simple','2020-09-25 14:40:55','2020-09-25 14:40:55',295,1),(320,'5-variant-14-11','simple','2020-09-25 14:40:55','2020-09-25 14:40:55',295,1),(321,'5-variant-18-7','simple','2020-09-25 14:40:55','2020-09-25 14:40:55',295,1),(322,'5-variant-18-8','simple','2020-09-25 14:40:55','2020-09-25 14:40:55',295,1),(323,'5-variant-18-9','simple','2020-09-25 14:40:56','2020-09-25 14:40:56',295,1),(324,'5-variant-18-10','simple','2020-09-25 14:40:56','2020-09-25 14:40:56',295,1),(325,'5-variant-18-11','simple','2020-09-25 14:40:56','2020-09-25 14:40:56',295,1),(326,'6','configurable','2020-09-26 13:22:06','2020-09-26 13:22:06',NULL,1),(327,'6-variant-4-6','simple','2020-09-26 13:22:06','2020-09-26 13:22:06',326,1),(328,'6-variant-14-6','simple','2020-09-26 13:22:06','2020-09-26 13:22:06',326,1),(329,'6-variant-17-6','simple','2020-09-26 13:22:06','2020-09-26 13:22:06',326,1),(330,'6-variant-4-7','simple','2020-09-26 13:22:06','2020-09-26 13:22:06',326,1),(331,'6-variant-4-8','simple','2020-09-26 13:22:06','2020-09-26 13:22:06',326,1),(332,'6-variant-4-9','simple','2020-09-26 13:22:06','2020-09-26 13:22:06',326,1),(333,'6-variant-4-10','simple','2020-09-26 13:22:06','2020-09-26 13:22:06',326,1),(334,'6-variant-14-7','simple','2020-09-26 13:22:06','2020-09-26 13:22:06',326,1),(335,'6-variant-14-8','simple','2020-09-26 13:22:06','2020-09-26 13:22:06',326,1),(336,'6-variant-14-9','simple','2020-09-26 13:22:06','2020-09-26 13:22:06',326,1),(337,'6-variant-14-10','simple','2020-09-26 13:22:06','2020-09-26 13:22:06',326,1),(338,'6-variant-17-7','simple','2020-09-26 13:22:06','2020-09-26 13:22:06',326,1),(339,'6-variant-17-8','simple','2020-09-26 13:22:06','2020-09-26 13:22:06',326,1),(340,'6-variant-17-9','simple','2020-09-26 13:22:06','2020-09-26 13:22:06',326,1),(341,'6-variant-17-10','simple','2020-09-26 13:22:06','2020-09-26 13:22:06',326,1),(342,'7','configurable','2020-09-26 13:34:07','2020-09-26 13:34:07',NULL,1),(355,'8','simple','2020-09-26 14:03:18','2020-09-26 14:03:18',NULL,1),(356,'9','configurable','2020-09-26 14:05:27','2020-09-26 14:05:27',NULL,1),(357,'9-variant-4-6','simple','2020-09-26 14:05:27','2020-09-26 14:05:27',356,1),(358,'9-variant-16-6','simple','2020-09-26 14:05:27','2020-09-26 14:05:27',356,1),(359,'9-variant-19-6','simple','2020-09-26 14:05:27','2020-09-26 14:05:27',356,1),(360,'9-variant-4-7','simple','2020-09-26 14:05:27','2020-09-26 14:05:27',356,1),(361,'9-variant-4-8','simple','2020-09-26 14:05:28','2020-09-26 14:05:28',356,1),(362,'9-variant-4-9','simple','2020-09-26 14:05:28','2020-09-26 14:05:28',356,1),(363,'9-variant-4-10','simple','2020-09-26 14:05:28','2020-09-26 14:05:28',356,1),(364,'9-variant-4-11','simple','2020-09-26 14:05:28','2020-09-26 14:05:28',356,1),(365,'9-variant-16-7','simple','2020-09-26 14:05:28','2020-09-26 14:05:28',356,1),(366,'9-variant-16-8','simple','2020-09-26 14:05:28','2020-09-26 14:05:28',356,1),(367,'9-variant-16-9','simple','2020-09-26 14:05:28','2020-09-26 14:05:28',356,1),(368,'9-variant-16-10','simple','2020-09-26 14:05:28','2020-09-26 14:05:28',356,1),(369,'9-variant-16-11','simple','2020-09-26 14:05:28','2020-09-26 14:05:28',356,1),(370,'9-variant-19-7','simple','2020-09-26 14:05:28','2020-09-26 14:05:28',356,1),(371,'9-variant-19-8','simple','2020-09-26 14:05:28','2020-09-26 14:05:28',356,1),(372,'9-variant-19-9','simple','2020-09-26 14:05:28','2020-09-26 14:05:28',356,1),(373,'9-variant-19-10','simple','2020-09-26 14:05:28','2020-09-26 14:05:28',356,1),(374,'9-variant-19-11','simple','2020-09-26 14:05:28','2020-09-26 14:05:28',356,1),(375,'10','configurable','2020-09-26 14:20:14','2020-09-26 14:20:14',NULL,1),(376,'10-variant-4-6','simple','2020-09-26 14:20:14','2020-09-26 14:20:14',375,1),(377,'10-variant-5-6','simple','2020-09-26 14:20:14','2020-09-26 14:20:14',375,1),(378,'10-variant-12-6','simple','2020-09-26 14:20:14','2020-09-26 14:20:14',375,1),(379,'10-variant-4-7','simple','2020-09-26 14:20:14','2020-09-26 14:20:14',375,1),(380,'10-variant-4-8','simple','2020-09-26 14:20:14','2020-09-26 14:20:14',375,1),(381,'10-variant-4-9','simple','2020-09-26 14:20:14','2020-09-26 14:20:14',375,1),(382,'10-variant-4-10','simple','2020-09-26 14:20:14','2020-09-26 14:20:14',375,1),(383,'10-variant-4-11','simple','2020-09-26 14:20:14','2020-09-26 14:20:14',375,1),(384,'10-variant-5-7','simple','2020-09-26 14:20:14','2020-09-26 14:20:14',375,1),(385,'10-variant-5-8','simple','2020-09-26 14:20:14','2020-09-26 14:20:14',375,1),(386,'10-variant-5-9','simple','2020-09-26 14:20:15','2020-09-26 14:20:15',375,1),(387,'10-variant-5-10','simple','2020-09-26 14:20:15','2020-09-26 14:20:15',375,1),(388,'10-variant-5-11','simple','2020-09-26 14:20:15','2020-09-26 14:20:15',375,1),(389,'10-variant-12-7','simple','2020-09-26 14:20:15','2020-09-26 14:20:15',375,1),(390,'10-variant-12-8','simple','2020-09-26 14:20:15','2020-09-26 14:20:15',375,1),(391,'10-variant-12-9','simple','2020-09-26 14:20:15','2020-09-26 14:20:15',375,1),(392,'10-variant-12-10','simple','2020-09-26 14:20:15','2020-09-26 14:20:15',375,1),(393,'10-variant-12-11','simple','2020-09-26 14:20:15','2020-09-26 14:20:15',375,1),(394,'11','configurable','2020-09-26 14:42:25','2020-09-26 14:42:25',NULL,1),(395,'11-variant-2-6','simple','2020-09-26 14:42:25','2020-09-26 14:42:25',394,1),(396,'11-variant-3-6','simple','2020-09-26 14:42:25','2020-09-26 14:42:25',394,1),(397,'11-variant-2-7','simple','2020-09-26 14:42:25','2020-09-26 14:42:25',394,1),(398,'11-variant-2-8','simple','2020-09-26 14:42:25','2020-09-26 14:42:25',394,1),(399,'11-variant-2-9','simple','2020-09-26 14:42:25','2020-09-26 14:42:25',394,1),(400,'11-variant-2-10','simple','2020-09-26 14:42:25','2020-09-26 14:42:25',394,1),(401,'11-variant-2-11','simple','2020-09-26 14:42:25','2020-09-26 14:42:25',394,1),(402,'11-variant-3-7','simple','2020-09-26 14:42:25','2020-09-26 14:42:25',394,1),(403,'11-variant-3-8','simple','2020-09-26 14:42:25','2020-09-26 14:42:25',394,1),(404,'11-variant-3-9','simple','2020-09-26 14:42:25','2020-09-26 14:42:25',394,1),(405,'11-variant-3-10','simple','2020-09-26 14:42:25','2020-09-26 14:42:25',394,1),(406,'11-variant-3-11','simple','2020-09-26 14:42:25','2020-09-26 14:42:25',394,1),(407,'12','configurable','2020-09-26 16:19:02','2020-09-26 16:19:02',NULL,1),(408,'12-variant-3-6','simple','2020-09-26 16:19:02','2020-09-26 16:19:02',407,1),(409,'12-variant-4-6','simple','2020-09-26 16:19:02','2020-09-26 16:19:02',407,1),(410,'12-variant-18-6','simple','2020-09-26 16:19:03','2020-09-26 16:19:03',407,1),(411,'12-variant-3-7','simple','2020-09-26 16:19:03','2020-09-26 16:19:03',407,1),(412,'12-variant-3-8','simple','2020-09-26 16:19:03','2020-09-26 16:19:03',407,1),(413,'12-variant-3-9','simple','2020-09-26 16:19:03','2020-09-26 16:19:03',407,1),(414,'12-variant-3-10','simple','2020-09-26 16:19:03','2020-09-26 16:19:03',407,1),(415,'12-variant-3-11','simple','2020-09-26 16:19:03','2020-09-26 16:19:03',407,1),(416,'12-variant-4-7','simple','2020-09-26 16:19:03','2020-09-26 16:19:03',407,1),(417,'12-variant-4-8','simple','2020-09-26 16:19:03','2020-09-26 16:19:03',407,1),(418,'12-variant-4-9','simple','2020-09-26 16:19:03','2020-09-26 16:19:03',407,1),(419,'12-variant-4-10','simple','2020-09-26 16:19:03','2020-09-26 16:19:03',407,1),(420,'12-variant-4-11','simple','2020-09-26 16:19:03','2020-09-26 16:19:03',407,1),(421,'12-variant-18-7','simple','2020-09-26 16:19:03','2020-09-26 16:19:03',407,1),(422,'12-variant-18-8','simple','2020-09-26 16:19:03','2020-09-26 16:19:03',407,1),(423,'12-variant-18-9','simple','2020-09-26 16:19:03','2020-09-26 16:19:03',407,1),(424,'12-variant-18-10','simple','2020-09-26 16:19:03','2020-09-26 16:19:03',407,1),(425,'12-variant-18-11','simple','2020-09-26 16:19:03','2020-09-26 16:19:03',407,1),(426,'13','configurable','2020-09-26 16:31:47','2020-09-26 16:31:47',NULL,1),(427,'13-variant-3-6','simple','2020-09-26 16:31:47','2020-09-26 16:31:47',426,1),(428,'13-variant-4-6','simple','2020-09-26 16:31:47','2020-09-26 16:31:47',426,1),(429,'13-variant-5-6','simple','2020-09-26 16:31:47','2020-09-26 16:31:47',426,1),(430,'13-variant-13-6','simple','2020-09-26 16:31:47','2020-09-26 16:31:47',426,1),(431,'13-variant-14-6','simple','2020-09-26 16:31:47','2020-09-26 16:31:47',426,1),(432,'13-variant-3-7','simple','2020-09-26 16:31:47','2020-09-26 16:31:47',426,1),(433,'13-variant-3-8','simple','2020-09-26 16:31:47','2020-09-26 16:31:47',426,1),(434,'13-variant-3-9','simple','2020-09-26 16:31:47','2020-09-26 16:31:47',426,1),(435,'13-variant-3-10','simple','2020-09-26 16:31:47','2020-09-26 16:31:47',426,1),(436,'13-variant-3-11','simple','2020-09-26 16:31:47','2020-09-26 16:31:47',426,1),(437,'13-variant-4-7','simple','2020-09-26 16:31:47','2020-09-26 16:31:47',426,1),(438,'13-variant-4-8','simple','2020-09-26 16:31:47','2020-09-26 16:31:47',426,1),(439,'13-variant-4-9','simple','2020-09-26 16:31:48','2020-09-26 16:31:48',426,1),(440,'13-variant-4-10','simple','2020-09-26 16:31:48','2020-09-26 16:31:48',426,1),(441,'13-variant-4-11','simple','2020-09-26 16:31:48','2020-09-26 16:31:48',426,1),(442,'13-variant-5-7','simple','2020-09-26 16:31:48','2020-09-26 16:31:48',426,1),(443,'13-variant-5-8','simple','2020-09-26 16:31:48','2020-09-26 16:31:48',426,1),(444,'13-variant-5-9','simple','2020-09-26 16:31:48','2020-09-26 16:31:48',426,1),(445,'13-variant-5-10','simple','2020-09-26 16:31:48','2020-09-26 16:31:48',426,1),(446,'13-variant-5-11','simple','2020-09-26 16:31:48','2020-09-26 16:31:48',426,1),(447,'13-variant-13-7','simple','2020-09-26 16:31:48','2020-09-26 16:31:48',426,1),(448,'13-variant-13-8','simple','2020-09-26 16:31:48','2020-09-26 16:31:48',426,1),(449,'13-variant-13-9','simple','2020-09-26 16:31:48','2020-09-26 16:31:48',426,1),(450,'13-variant-13-10','simple','2020-09-26 16:31:48','2020-09-26 16:31:48',426,1),(451,'13-variant-13-11','simple','2020-09-26 16:31:48','2020-09-26 16:31:48',426,1),(452,'13-variant-14-7','simple','2020-09-26 16:31:48','2020-09-26 16:31:48',426,1),(453,'13-variant-14-8','simple','2020-09-26 16:31:48','2020-09-26 16:31:48',426,1),(454,'13-variant-14-9','simple','2020-09-26 16:31:48','2020-09-26 16:31:48',426,1),(455,'13-variant-14-10','simple','2020-09-26 16:31:48','2020-09-26 16:31:48',426,1),(456,'13-variant-14-11','simple','2020-09-26 16:31:48','2020-09-26 16:31:48',426,1),(457,'14','configurable','2020-09-26 16:55:21','2020-09-26 16:55:21',NULL,1),(458,'14-variant-1-6','simple','2020-09-26 16:55:21','2020-09-26 16:55:21',457,1),(459,'14-variant-4-6','simple','2020-09-26 16:55:21','2020-09-26 16:55:21',457,1),(460,'14-variant-5-6','simple','2020-09-26 16:55:21','2020-09-26 16:55:21',457,1),(461,'14-variant-1-7','simple','2020-09-26 16:55:21','2020-09-26 16:55:21',457,1),(462,'14-variant-1-8','simple','2020-09-26 16:55:21','2020-09-26 16:55:21',457,1),(463,'14-variant-1-9','simple','2020-09-26 16:55:21','2020-09-26 16:55:21',457,1),(464,'14-variant-1-10','simple','2020-09-26 16:55:21','2020-09-26 16:55:21',457,1),(465,'14-variant-4-7','simple','2020-09-26 16:55:21','2020-09-26 16:55:21',457,1),(466,'14-variant-4-8','simple','2020-09-26 16:55:21','2020-09-26 16:55:21',457,1),(467,'14-variant-4-9','simple','2020-09-26 16:55:22','2020-09-26 16:55:22',457,1),(468,'14-variant-4-10','simple','2020-09-26 16:55:22','2020-09-26 16:55:22',457,1),(469,'14-variant-5-7','simple','2020-09-26 16:55:22','2020-09-26 16:55:22',457,1),(470,'14-variant-5-8','simple','2020-09-26 16:55:22','2020-09-26 16:55:22',457,1),(471,'14-variant-5-9','simple','2020-09-26 16:55:22','2020-09-26 16:55:22',457,1),(472,'14-variant-5-10','simple','2020-09-26 16:55:22','2020-09-26 16:55:22',457,1),(473,'15','configurable','2020-09-26 17:10:44','2020-09-26 17:10:44',NULL,1),(474,'15-variant-1-6','simple','2020-09-26 17:10:44','2020-09-26 17:10:44',473,1),(475,'15-variant-4-6','simple','2020-09-26 17:10:44','2020-09-26 17:10:44',473,1),(476,'15-variant-5-6','simple','2020-09-26 17:10:44','2020-09-26 17:10:44',473,1),(477,'15-variant-1-7','simple','2020-09-26 17:10:44','2020-09-26 17:10:44',473,1),(478,'15-variant-1-8','simple','2020-09-26 17:10:44','2020-09-26 17:10:44',473,1),(479,'15-variant-1-9','simple','2020-09-26 17:10:44','2020-09-26 17:10:44',473,1),(480,'15-variant-1-10','simple','2020-09-26 17:10:45','2020-09-26 17:10:45',473,1),(481,'15-variant-4-7','simple','2020-09-26 17:10:45','2020-09-26 17:10:45',473,1),(482,'15-variant-4-8','simple','2020-09-26 17:10:45','2020-09-26 17:10:45',473,1),(483,'15-variant-4-9','simple','2020-09-26 17:10:45','2020-09-26 17:10:45',473,1),(484,'15-variant-4-10','simple','2020-09-26 17:10:45','2020-09-26 17:10:45',473,1),(485,'15-variant-5-7','simple','2020-09-26 17:10:45','2020-09-26 17:10:45',473,1),(486,'15-variant-5-8','simple','2020-09-26 17:10:45','2020-09-26 17:10:45',473,1),(487,'15-variant-5-9','simple','2020-09-26 17:10:45','2020-09-26 17:10:45',473,1),(488,'15-variant-5-10','simple','2020-09-26 17:10:45','2020-09-26 17:10:45',473,1),(489,'16','configurable','2020-09-26 17:26:52','2020-09-26 17:26:52',NULL,1),(490,'16-variant-1-6','simple','2020-09-26 17:26:52','2020-09-26 17:26:52',489,1),(491,'16-variant-4-6','simple','2020-09-26 17:26:52','2020-09-26 17:26:52',489,1),(492,'16-variant-5-6','simple','2020-09-26 17:26:52','2020-09-26 17:26:52',489,1),(493,'16-variant-1-7','simple','2020-09-26 17:26:52','2020-09-26 17:26:52',489,1),(494,'16-variant-1-8','simple','2020-09-26 17:26:52','2020-09-26 17:26:52',489,1),(495,'16-variant-1-9','simple','2020-09-26 17:26:52','2020-09-26 17:26:52',489,1),(496,'16-variant-1-10','simple','2020-09-26 17:26:52','2020-09-26 17:26:52',489,1),(497,'16-variant-4-7','simple','2020-09-26 17:26:52','2020-09-26 17:26:52',489,1),(498,'16-variant-4-8','simple','2020-09-26 17:26:52','2020-09-26 17:26:52',489,1),(499,'16-variant-4-9','simple','2020-09-26 17:26:52','2020-09-26 17:26:52',489,1),(500,'16-variant-4-10','simple','2020-09-26 17:26:52','2020-09-26 17:26:52',489,1),(501,'16-variant-5-7','simple','2020-09-26 17:26:52','2020-09-26 17:26:52',489,1),(502,'16-variant-5-8','simple','2020-09-26 17:26:53','2020-09-26 17:26:53',489,1),(503,'16-variant-5-9','simple','2020-09-26 17:26:53','2020-09-26 17:26:53',489,1),(504,'16-variant-5-10','simple','2020-09-26 17:26:53','2020-09-26 17:26:53',489,1),(505,'17','configurable','2020-09-26 17:40:50','2020-09-26 17:40:50',NULL,1),(506,'17-variant-1-6','simple','2020-09-26 17:40:50','2020-09-26 17:40:50',505,1),(507,'17-variant-4-6','simple','2020-09-26 17:40:50','2020-09-26 17:40:50',505,1),(508,'17-variant-5-6','simple','2020-09-26 17:40:50','2020-09-26 17:40:50',505,1),(509,'17-variant-1-7','simple','2020-09-26 17:40:50','2020-09-26 17:40:50',505,1),(510,'17-variant-1-8','simple','2020-09-26 17:40:50','2020-09-26 17:40:50',505,1),(511,'17-variant-1-9','simple','2020-09-26 17:40:50','2020-09-26 17:40:50',505,1),(512,'17-variant-1-10','simple','2020-09-26 17:40:50','2020-09-26 17:40:50',505,1),(513,'17-variant-4-7','simple','2020-09-26 17:40:50','2020-09-26 17:40:50',505,1),(514,'17-variant-4-8','simple','2020-09-26 17:40:51','2020-09-26 17:40:51',505,1),(515,'17-variant-4-9','simple','2020-09-26 17:40:51','2020-09-26 17:40:51',505,1),(516,'17-variant-4-10','simple','2020-09-26 17:40:51','2020-09-26 17:40:51',505,1),(517,'17-variant-5-7','simple','2020-09-26 17:40:51','2020-09-26 17:40:51',505,1),(518,'17-variant-5-8','simple','2020-09-26 17:40:51','2020-09-26 17:40:51',505,1),(519,'17-variant-5-9','simple','2020-09-26 17:40:51','2020-09-26 17:40:51',505,1),(520,'17-variant-5-10','simple','2020-09-26 17:40:51','2020-09-26 17:40:51',505,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_items`
--

DROP TABLE IF EXISTS `refund_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `refund_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  KEY `refund_items_refund_id_foreign` (`refund_id`),
  KEY `refund_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_items`
--

LOCK TABLES `refund_items` WRITE;
/*!40000 ALTER TABLE `refund_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refunds`
--

DROP TABLE IF EXISTS `refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refunds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `order_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refunds_order_id_foreign` (`order_id`),
  CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunds`
--

LOCK TABLES `refunds` WRITE;
/*!40000 ALTER TABLE `refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator','Administrator rolem','all',NULL,NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment_items`
--

DROP TABLE IF EXISTS `shipment_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipment_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `base_price` decimal(12,4) DEFAULT '0.0000',
  `total` decimal(12,4) DEFAULT '0.0000',
  `base_total` decimal(12,4) DEFAULT '0.0000',
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `shipment_id` int(10) unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipment_items_shipment_id_foreign` (`shipment_id`),
  CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment_items`
--

LOCK TABLES `shipment_items` WRITE;
/*!40000 ALTER TABLE `shipment_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `carrier_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track_number` text COLLATE utf8mb4_unicode_ci,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `customer_id` int(10) unsigned DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `order_address_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `inventory_source_id` int(10) unsigned DEFAULT NULL,
  `inventory_source_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_order_id_foreign` (`order_id`),
  KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`),
  KEY `shipments_order_address_id_foreign` (`order_address_id`),
  CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shipments_order_address_id_foreign` FOREIGN KEY (`order_address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slider_path` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sliders_channel_id_foreign` (`channel_id`),
  CONSTRAINT `sliders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers_list`
--

DROP TABLE IF EXISTS `subscribers_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribers_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribers_list_channel_id_foreign` (`channel_id`),
  CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers_list`
--

LOCK TABLES `subscribers_list` WRITE;
/*!40000 ALTER TABLE `subscribers_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribers_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_categories`
--

DROP TABLE IF EXISTS `tax_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_categories_code_unique` (`code`),
  UNIQUE KEY `tax_categories_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_categories`
--

LOCK TABLES `tax_categories` WRITE;
/*!40000 ALTER TABLE `tax_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_categories_tax_rates`
--

DROP TABLE IF EXISTS `tax_categories_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_categories_tax_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_category_id` int(10) unsigned NOT NULL,
  `tax_rate_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`),
  CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_categories_tax_rates`
--

LOCK TABLES `tax_categories_tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_categories_tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_categories_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT '0',
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rates_identifier_unique` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `velocity_contents`
--

DROP TABLE IF EXISTS `velocity_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `velocity_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `velocity_contents`
--

LOCK TABLES `velocity_contents` WRITE;
/*!40000 ALTER TABLE `velocity_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `velocity_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `velocity_contents_translations`
--

DROP TABLE IF EXISTS `velocity_contents_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `velocity_contents_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_heading` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_link` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_target` tinyint(1) NOT NULL DEFAULT '0',
  `catalog_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `products` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `velocity_contents_translations_content_id_foreign` (`content_id`),
  CONSTRAINT `velocity_contents_translations_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `velocity_contents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `velocity_contents_translations`
--

LOCK TABLES `velocity_contents_translations` WRITE;
/*!40000 ALTER TABLE `velocity_contents_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `velocity_contents_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `velocity_customer_compare_products`
--

DROP TABLE IF EXISTS `velocity_customer_compare_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `velocity_customer_compare_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_flat_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `velocity_customer_compare_products_product_flat_id_foreign` (`product_flat_id`),
  KEY `velocity_customer_compare_products_customer_id_foreign` (`customer_id`),
  CONSTRAINT `velocity_customer_compare_products_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `velocity_customer_compare_products_product_flat_id_foreign` FOREIGN KEY (`product_flat_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `velocity_customer_compare_products`
--

LOCK TABLES `velocity_customer_compare_products` WRITE;
/*!40000 ALTER TABLE `velocity_customer_compare_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `velocity_customer_compare_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `velocity_meta_data`
--

DROP TABLE IF EXISTS `velocity_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `velocity_meta_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `home_page_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_left_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_middle_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slider` tinyint(1) NOT NULL DEFAULT '0',
  `advertisement` json DEFAULT NULL,
  `sidebar_category_count` int(11) NOT NULL DEFAULT '9',
  `featured_product_count` int(11) NOT NULL DEFAULT '10',
  `new_products_count` int(11) NOT NULL DEFAULT '10',
  `subscription_bar_content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_view_images` json DEFAULT NULL,
  `product_policy` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `velocity_meta_data`
--

LOCK TABLES `velocity_meta_data` WRITE;
/*!40000 ALTER TABLE `velocity_meta_data` DISABLE KEYS */;
INSERT INTO `velocity_meta_data` VALUES (1,'<p>@include(\'shop::home.advertisements.advertisement-four\')@include(\'shop::home.featured-products\') @include(\'shop::home.product-policy\') @include(\'shop::home.advertisements.advertisement-three\') @include(\'shop::home.new-products\') @include(\'shop::home.advertisements.advertisement-two\')</p>','<p>We love to craft softwares and solve the real world problems with the binaries. We are highly committed to our goals. We invest our resources to create world class easy to use softwares and applications for the enterprise business with the top notch, on the edge technology expertise.</p>','<div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"https://webkul.com/about-us/company-profile/\">About Us</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\">Customer Service</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\">What&rsquo;s New</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\">Contact Us </a></li></ul></div><div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"https://webkul.com/about-us/company-profile/\"> Order and Returns </a></li><li><a href=\"https://webkul.com/about-us/company-profile/\"> Payment Policy </a></li><li><a href=\"https://webkul.com/about-us/company-profile/\"> Shipping Policy</a></li><li><a href=\"https://webkul.com/about-us/company-profile/\"> Privacy and Cookies Policy </a></li></ul></div>',1,NULL,9,10,10,'<div class=\"social-icons col-lg-6\"><a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-facebook\" title=\"facebook\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-twitter\" title=\"twitter\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-linked-in\" title=\"linkedin\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-pintrest\" title=\"Pinterest\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-youtube\" title=\"Youtube\"></i> </a> <a href=\"https://webkul.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-instagram\" title=\"instagram\"></i></a></div>',NULL,NULL,NULL,'<div class=\"row col-12 remove-padding-margin\"><div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-van-ship fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Free Shipping on Order $20 or More</span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Replace &amp; Return Available </span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Exchange and EMI Available </span></div></div></div></div></div>');
/*!40000 ALTER TABLE `velocity_meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `item_options` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `additional` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_channel_id_foreign` (`channel_id`),
  KEY `wishlist_product_id_foreign` (`product_id`),
  KEY `wishlist_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-26 15:36:44
