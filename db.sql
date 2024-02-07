-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: socialmedia
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL,
  `email` varchar(65) DEFAULT NULL,
  `password` varchar(65) DEFAULT NULL,
  `creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `activity_log_id` int NOT NULL AUTO_INCREMENT,
  `fk_profile_id` int NOT NULL,
  `fk_notification_id` int NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `activity_type` varchar(45) DEFAULT NULL,
  `activity_text` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`activity_log_id`),
  KEY `fk_activity_log_profile1_idx` (`fk_profile_id`),
  KEY `fk_activity_log_notification1_idx` (`fk_notification_id`),
  CONSTRAINT `fk_activity_log_notification1` FOREIGN KEY (`fk_notification_id`) REFERENCES `notification` (`notification_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_activity_log_profile1` FOREIGN KEY (`fk_profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_id` int NOT NULL,
  `fk_post_id` int NOT NULL,
  `fk_commenter_profile_id` int NOT NULL,
  `comment_content` varchar(200) DEFAULT NULL,
  `comment_date` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_comment_user_post1_idx` (`fk_post_id`),
  KEY `fk_comment_profile1_idx` (`fk_commenter_profile_id`),
  CONSTRAINT `fk_comment_profile1` FOREIGN KEY (`fk_commenter_profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_user_post1` FOREIGN KEY (`fk_post_id`) REFERENCES `user_post` (`user_post_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connection`
--

DROP TABLE IF EXISTS `connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connection` (
  `connection_id` int NOT NULL AUTO_INCREMENT,
  `fk_request_profile_id` int NOT NULL,
  `fk_accept_profile_id` int NOT NULL,
  PRIMARY KEY (`connection_id`),
  KEY `fk_connection_profile2_idx` (`fk_accept_profile_id`),
  KEY `fk_connection_profile1` (`fk_request_profile_id`),
  CONSTRAINT `fk_connection_profile1` FOREIGN KEY (`fk_request_profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_connection_profile2` FOREIGN KEY (`fk_accept_profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_participant`
--

DROP TABLE IF EXISTS `event_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_participant` (
  `event_participant_id` int NOT NULL,
  `fk_user_event_id` int NOT NULL,
  `fk_user_profile_id` int NOT NULL,
  PRIMARY KEY (`event_participant_id`),
  KEY `fk_event_participant_user_event1_idx` (`fk_user_event_id`),
  KEY `fk_event_participant_profile1_idx` (`fk_user_profile_id`),
  CONSTRAINT `fk_event_participant_profile1` FOREIGN KEY (`fk_user_profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_event_participant_user_event1` FOREIGN KEY (`fk_user_event_id`) REFERENCES `user_event` (`user_event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `group_id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(45) DEFAULT NULL,
  `group_desription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_message`
--

DROP TABLE IF EXISTS `group_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_message` (
  `group_message_id` int NOT NULL AUTO_INCREMENT,
  `fk_membership_id` int NOT NULL,
  `group_message_content` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`group_message_id`),
  KEY `fk_group_message_membership1_idx` (`fk_membership_id`),
  CONSTRAINT `fk_group_message_membership1` FOREIGN KEY (`fk_membership_id`) REFERENCES `membership` (`membership_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership` (
  `membership_id` int NOT NULL AUTO_INCREMENT,
  `fk_group_id` int NOT NULL,
  `fk_profile_id` int NOT NULL,
  PRIMARY KEY (`membership_id`),
  KEY `fk_membership_profile1_idx` (`fk_profile_id`),
  KEY `fk_membership_group1` (`fk_group_id`),
  CONSTRAINT `fk_membership_group1` FOREIGN KEY (`fk_group_id`) REFERENCES `group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_membership_profile1` FOREIGN KEY (`fk_profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `fk_profile_id` int NOT NULL,
  `notification_type` varchar(45) DEFAULT NULL,
  `notification_content` varchar(200) DEFAULT NULL,
  `notification_date` datetime DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `fk_notification_profile1_idx` (`fk_profile_id`),
  CONSTRAINT `fk_notification_profile1` FOREIGN KEY (`fk_profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `post_like`
--

DROP TABLE IF EXISTS `post_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_like` (
  `post_like_id` int NOT NULL AUTO_INCREMENT,
  `fk_profile_id` int NOT NULL,
  `fk_user_post_id` int NOT NULL,
  `like_date` datetime DEFAULT NULL,
  PRIMARY KEY (`post_like_id`),
  KEY `fk_post_like_profile1_idx` (`fk_profile_id`),
  KEY `fk_post_like_user_post1_idx` (`fk_user_post_id`),
  CONSTRAINT `fk_post_like_profile1` FOREIGN KEY (`fk_profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_post_like_user_post1` FOREIGN KEY (`fk_user_post_id`) REFERENCES `user_post` (`user_post_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `private_message`
--

DROP TABLE IF EXISTS `private_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `private_message` (
  `private_message_id` int NOT NULL AUTO_INCREMENT,
  `fk_sender_profile_id` int NOT NULL,
  `fk_recipient_profile_id` int NOT NULL,
  `private_message_content` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`private_message_id`),
  KEY `fk_private_message_profile1_idx` (`fk_sender_profile_id`),
  KEY `fk_private_message_profile2_idx` (`fk_recipient_profile_id`),
  CONSTRAINT `fk_private_message_profile1` FOREIGN KEY (`fk_sender_profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_private_message_profile2` FOREIGN KEY (`fk_recipient_profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `profile_id` int NOT NULL AUTO_INCREMENT,
  `fk_account_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `bio` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`profile_id`),
  KEY `fk_profile_account_idx` (`fk_account_id`),
  CONSTRAINT `fk_profile_account` FOREIGN KEY (`fk_account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_event`
--

DROP TABLE IF EXISTS `user_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_event` (
  `user_event_id` int NOT NULL AUTO_INCREMENT,
  `fk_profile_id` int NOT NULL,
  `event_name` varchar(45) DEFAULT NULL,
  `event_description` varchar(200) DEFAULT NULL,
  `event_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_event_id`),
  KEY `fk_user_event_profile1_idx` (`fk_profile_id`),
  CONSTRAINT `fk_user_event_profile1` FOREIGN KEY (`fk_profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_post`
--

DROP TABLE IF EXISTS `user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_post` (
  `user_post_id` int NOT NULL AUTO_INCREMENT,
  `fk_profile_id` int NOT NULL,
  `post_type` varchar(45) DEFAULT NULL,
  `post_content` varchar(200) DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_post_id`),
  KEY `fk_user_post_profile1_idx` (`fk_profile_id`),
  CONSTRAINT `fk_user_post_profile1` FOREIGN KEY (`fk_profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-07 23:52:31
