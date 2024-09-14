-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: lms
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `activityid` int NOT NULL AUTO_INCREMENT,
  `pageid` int NOT NULL,
  `context_id` int NOT NULL,
  `restricted_access` text,
  `available_from` datetime DEFAULT NULL,
  `available_until` datetime DEFAULT NULL,
  `completion_criteria` text,
  `group_mode` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`activityid`),
  KEY `fk_context` (`context_id`),
  KEY `fk_page` (`pageid`),
  CONSTRAINT `fk_context` FOREIGN KEY (`context_id`) REFERENCES `context` (`context_id`),
  CONSTRAINT `fk_page` FOREIGN KEY (`pageid`) REFERENCES `pages` (`pageid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,1,8,NULL,'2024-09-14 00:00:00','2024-09-14 00:00:00','Begins','0','2024-09-13 10:37:10'),(2,2,11,NULL,'2024-09-16 00:00:00','2024-09-16 00:00:00','none','0','2024-09-13 11:02:05');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth` (
  `auth_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`auth_id`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_auth_role` (`role_id`),
  KEY `fk_auth_user` (`user_id`),
  CONSTRAINT `fk_auth_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
INSERT INTO `auth` VALUES (1,'admin@gmail.com','$2b$10$F7Ac.LDsx6GbQhvryIr8quW5CccTGeH6yZYxvkkW0a1Mq5FEyGIkC',1,'2024-09-13 10:14:55',1),(2,'instructor@gmail.com','$2b$10$PxOARSkDCy49tcxJJE7xCuikJ6JGqg6svGvidWPeQ7zsbySsIpDuy',2,'2024-09-13 10:15:47',2),(3,'siva.v@kggeniuslabs.com','$2b$10$vyhzY0qTvENpKZ0262n87.R8sBu9C/uZIpxmTLPb9RAOmSYnp/M5G',4,'2024-09-13 10:16:21',3);
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `context`
--

DROP TABLE IF EXISTS `context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `context` (
  `context_id` int NOT NULL AUTO_INCREMENT,
  `contextlevel` int DEFAULT NULL,
  `instanceid` int DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `depth` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`context_id`),
  KEY `fk_contextlevel` (`contextlevel`),
  CONSTRAINT `fk_contextlevel` FOREIGN KEY (`contextlevel`) REFERENCES `context_level_description` (`contextlevel`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `context`
--

LOCK TABLES `context` WRITE;
/*!40000 ALTER TABLE `context` DISABLE KEYS */;
INSERT INTO `context` VALUES (1,2,1,NULL,NULL,'2024-09-13 10:14:55'),(2,2,2,NULL,NULL,'2024-09-13 10:15:47'),(3,2,3,NULL,NULL,'2024-09-13 10:16:21'),(4,3,1,'1/1',NULL,'2024-09-13 10:19:12'),(5,5,1,'1/1','0/1','2024-09-13 10:19:54'),(6,5,2,'1/1','0/2','2024-09-13 10:20:42'),(7,4,1,'1/1','1','2024-09-13 10:34:05'),(8,6,1,'1/1','2','2024-09-13 10:37:10'),(9,4,1,'1/1','3','2024-09-13 10:38:15'),(10,4,2,'1/1','1','2024-09-13 11:00:06'),(11,6,2,'1/1','2','2024-09-13 11:02:05'),(12,4,2,'1/1','3','2024-09-13 11:02:47'),(13,5,3,'1/1','0/3','2024-09-13 11:48:16'),(14,5,4,'1/1','0/4','2024-09-13 11:48:37'),(15,5,5,'1/1','0/5','2024-09-13 11:48:57'),(16,5,6,'1/1','0/6','2024-09-13 11:49:16'),(17,5,7,'1/1','0/7','2024-09-13 11:49:31'),(18,5,8,'1/1','0/8','2024-09-13 11:49:51'),(19,5,9,'1/1','0/9','2024-09-13 11:50:13'),(20,5,10,'1/1','0/10','2024-09-13 11:50:29'),(21,5,11,'1/1','0/10','2024-09-13 11:51:14'),(22,5,12,'1/1','0/10','2024-09-13 11:51:31'),(23,5,13,'1/1','0/10','2024-09-13 11:51:58'),(24,5,14,'1/1','0/10','2024-09-13 11:52:16'),(25,5,15,'1/1','0/10','2024-09-13 11:52:35'),(26,5,16,'1/1','0/10','2024-09-13 11:52:54'),(27,5,17,'1/1','0/10','2024-09-14 12:45:33'),(28,5,18,'1/1','0/10','2024-09-14 12:45:51');
/*!40000 ALTER TABLE `context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `context_level_description`
--

DROP TABLE IF EXISTS `context_level_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `context_level_description` (
  `contextlevel` int NOT NULL AUTO_INCREMENT,
  `contextlevel_desc` varchar(255) NOT NULL,
  PRIMARY KEY (`contextlevel`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `context_level_description`
--

LOCK TABLES `context_level_description` WRITE;
/*!40000 ALTER TABLE `context_level_description` DISABLE KEYS */;
INSERT INTO `context_level_description` VALUES (1,'student'),(2,'user'),(3,'course'),(4,'quiz'),(5,'module'),(6,'course_content');
/*!40000 ALTER TABLE `context_level_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_category`
--

DROP TABLE IF EXISTS `course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_category` (
  `course_category_id` int NOT NULL AUTO_INCREMENT,
  `course_category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`course_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_category`
--

LOCK TABLES `course_category` WRITE;
/*!40000 ALTER TABLE `course_category` DISABLE KEYS */;
INSERT INTO `course_category` VALUES (1,'Medical');
/*!40000 ALTER TABLE `course_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_difficulty_level`
--

DROP TABLE IF EXISTS `course_difficulty_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_difficulty_level` (
  `difficulty_level_id` int NOT NULL AUTO_INCREMENT,
  `difficulty_level_name` varchar(255) NOT NULL,
  PRIMARY KEY (`difficulty_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_difficulty_level`
--

LOCK TABLES `course_difficulty_level` WRITE;
/*!40000 ALTER TABLE `course_difficulty_level` DISABLE KEYS */;
INSERT INTO `course_difficulty_level` VALUES (1,'Easy'),(2,'Medium'),(3,'Hard');
/*!40000 ALTER TABLE `course_difficulty_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `courseid` int NOT NULL AUTO_INCREMENT,
  `coursename` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `course_short_name` varchar(255) DEFAULT NULL,
  `course_category_id` int DEFAULT NULL,
  `course_start_date` date DEFAULT NULL,
  `course_end_date` date DEFAULT NULL,
  `course_image` varchar(255) DEFAULT 'default_image.jpg',
  `course_desc` text,
  `course_creator_id` int DEFAULT NULL,
  `difficulty_level_id` int DEFAULT NULL,
  PRIMARY KEY (`courseid`),
  KEY `fk_course_category` (`course_category_id`),
  KEY `fk_difficulty_level` (`difficulty_level_id`),
  CONSTRAINT `fk_course_category` FOREIGN KEY (`course_category_id`) REFERENCES `course_category` (`course_category_id`),
  CONSTRAINT `fk_difficulty_level` FOREIGN KEY (`difficulty_level_id`) REFERENCES `course_difficulty_level` (`difficulty_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'My Spine Coach','2024-09-13 10:19:12','spine coach',1,'2024-09-13','2024-09-14','\\uploads\\courseImage-1726222752651-543762383.jpg','Spine related problems and solutions provide this course',NULL,NULL);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'B.Sc Computer Science'),(2,'B.Sc Information Technology');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `moduleid` int NOT NULL AUTO_INCREMENT,
  `modulename` varchar(255) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `courseid` int DEFAULT NULL,
  `module_image` varchar(255) DEFAULT NULL,
  `module_enable` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`moduleid`),
  UNIQUE KEY `moduleid` (`moduleid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'Who am I?',NULL,'2024-09-13 10:19:54',1,'\\uploads\\moduleImage-1726222794663-315607545.jpg',1),(2,'Who Suffers?',NULL,'2024-09-13 10:20:42',1,'\\uploads\\moduleImage-1726222842878-873137357.jpg',1),(3,'How may people are suffering?',NULL,'2024-09-13 11:48:16',1,'\\uploads\\moduleImage-1726228096311-231692994.jpg',1),(4,'The Dangerous Red Flag Diagnoses',NULL,'2024-09-13 11:48:37',1,'\\uploads\\moduleImage-1726228117443-724215670.jpg',1),(5,'The Global Costs of Back Pain',NULL,'2024-09-13 11:48:57',1,'\\uploads\\moduleImage-1726228137605-252065153.jpg',1),(6,'All About Your Spine',NULL,'2024-09-13 11:49:16',1,'\\uploads\\moduleImage-1726228156526-834240815.jpg',1),(7,'Chain of Links - Motion of Your Spine',NULL,'2024-09-13 11:49:31',1,'\\uploads\\moduleImage-1726228171923-820710811.jpg',1),(8,'Pillar of Strength - Muscles of Your Spine',NULL,'2024-09-13 11:49:51',1,'\\uploads\\moduleImage-1726228191236-921550980.jpg',1),(9,'Wear of Your Backbone - Degeneration of the Spine',NULL,'2024-09-13 11:50:13',1,'\\uploads\\moduleImage-1726228213061-809637423.jpg',1),(10,'Framework of Life - Your Super Amazing Nerves',NULL,'2024-09-13 11:50:29',1,'\\uploads\\moduleImage-1726228229320-210416325.jpg',1),(11,'Nature\'s Reset Button - Your Fountain of Youth',NULL,'2024-09-13 11:51:14',1,'\\uploads\\moduleImage-1726228274701-975980045.jpg',1),(12,'Re-Generational NOT De-Generational!',NULL,'2024-09-13 11:51:31',1,'\\uploads\\moduleImage-1726228291716-974146749.jpg',1),(13,'10 Foundational Causes of Back Pain',NULL,'2024-09-13 11:51:58',1,'\\uploads\\moduleImage-1726228318060-351095003.jpg',1),(14,'The 6 Steps of Proper Posture and the 6 Steps of Poor Posture',NULL,'2024-09-13 11:52:16',1,'\\uploads\\moduleImage-1726228336860-506348149.jpg',1),(15,'Posture and Balance: “Skier’s Poise” with Aspen Supercoach Ned Ryan',NULL,'2024-09-13 11:52:35',1,'\\uploads\\moduleImage-1726228355810-112492176.jpg',1),(16,'Backbone of Confidence - Help Is on the Way!',NULL,'2024-09-13 11:52:54',1,'\\uploads\\moduleImage-1726228374449-186264241.jpg',1),(17,'The Crane’s Precision - Lifting, Handling, and Delivery',NULL,'2024-09-14 12:45:33',1,'\\uploads\\moduleImage-1726317933109-914540929.jpg',1),(18,'A Conversation with Negong Grandmaster James Ran',NULL,'2024-09-14 12:45:51',1,'\\uploads\\moduleImage-1726317951324-850748313.jpg',1);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `pageid` int NOT NULL AUTO_INCREMENT,
  `courseid` int NOT NULL,
  `moduleid` int NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text,
  `page_content` mediumtext NOT NULL,
  `context_id` int DEFAULT NULL,
  `activity_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pageid`),
  KEY `courseid` (`courseid`),
  KEY `pages_ibfk_2_idx` (`moduleid`),
  KEY `moduleid_idx` (`moduleid`),
  KEY `fk_pages_context` (`context_id`),
  CONSTRAINT `fk_pages_context` FOREIGN KEY (`context_id`) REFERENCES `context` (`context_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,1,1,'2024-09-13 10:37:10','Who am I','<p>https://player.vimeo.com/video/984701898</p>',8,'Who am I?'),(2,1,2,'2024-09-13 11:02:05','Who Suffers','<p>https://player.vimeo.com/video/984701898</p>',11,'Who Suffers?');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz` (
  `quiz_id` int NOT NULL AUTO_INCREMENT,
  `courseid` int DEFAULT NULL,
  `moduleid` int DEFAULT NULL,
  `max_no_of_questions` int DEFAULT NULL,
  `question_ids` json DEFAULT NULL,
  `context_id` int DEFAULT NULL,
  `type_of_section` int DEFAULT NULL,
  `max_no_of_attempts` int DEFAULT NULL,
  `max_score` decimal(10,2) DEFAULT NULL,
  `max_grade` decimal(10,2) DEFAULT NULL,
  `pass_grade` decimal(10,2) DEFAULT NULL,
  `min_grade` decimal(10,2) DEFAULT NULL,
  `difficulty_level` varchar(50) DEFAULT NULL,
  `quiz_name` varchar(255) DEFAULT NULL,
  `quiz_type_id` int DEFAULT NULL,
  PRIMARY KEY (`quiz_id`),
  KEY `fk_quiz_context` (`context_id`),
  KEY `fk_quiz_course` (`courseid`),
  KEY `fk_quiz_module` (`moduleid`),
  KEY `fk_quiz_type` (`quiz_type_id`),
  CONSTRAINT `fk_quiz_context` FOREIGN KEY (`context_id`) REFERENCES `context` (`context_id`),
  CONSTRAINT `fk_quiz_course` FOREIGN KEY (`courseid`) REFERENCES `courses` (`courseid`),
  CONSTRAINT `fk_quiz_module` FOREIGN KEY (`moduleid`) REFERENCES `modules` (`moduleid`),
  CONSTRAINT `fk_quiz_type` FOREIGN KEY (`quiz_type_id`) REFERENCES `quiz_type` (`quiz_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (1,1,1,3,'[1, 2, 3]',7,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(2,1,1,3,'[1, 2, 3]',9,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(3,1,2,5,'[4, 5, 6, 7, 8]',10,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(4,1,2,5,'[4, 5, 6, 7, 8]',12,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2);
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_attempt`
--

DROP TABLE IF EXISTS `quiz_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_attempt` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `result` json NOT NULL,
  `attempt_count` int NOT NULL DEFAULT '0',
  `assessment_type` varchar(50) NOT NULL,
  `attempt_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `score` int DEFAULT NULL,
  `moduleid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_attempt`
--

LOCK TABLES `quiz_attempt` WRITE;
/*!40000 ALTER TABLE `quiz_attempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_text`
--

DROP TABLE IF EXISTS `quiz_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_text` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `option` json NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `correct_answer` varchar(255) DEFAULT NULL,
  `moduleid` int DEFAULT NULL,
  `courseid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_quiztext_course` (`courseid`),
  KEY `fk_quiztext_module` (`moduleid`),
  CONSTRAINT `fk_quiztext_course` FOREIGN KEY (`courseid`) REFERENCES `courses` (`courseid`),
  CONSTRAINT `fk_quiztext_module` FOREIGN KEY (`moduleid`) REFERENCES `modules` (`moduleid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_text`
--

LOCK TABLES `quiz_text` WRITE;
/*!40000 ALTER TABLE `quiz_text` DISABLE KEYS */;
INSERT INTO `quiz_text` VALUES (1,'<p><br></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><strong style=\"font-weight:normal;\" id=\"docs-internal-guid-b8455d5a-7fff-8ece-f165-2f82f15ee175\"><span style=\"font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">In the study \"Assessment of Stresses in the Cervical Spine Caused by Posture and Position of the Head,\" which statement accurately reflects the findings regarding neck forces as the head tilts forward?</span></strong></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><strong style=\"font-weight:normal;\" id=\"docs-internal-guid-b8455d5a-7fff-8ece-f165-2f82f15ee175\"><span style=\"font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\"><span style=\"border:none;display:inline-block;overflow:hidden;width:602px;height:308px;\"><img src=\"https://lh7-rt.googleusercontent.com/docsz/AD_4nXcFSaB7tEFeABRcrclCXoJR1v6O91jgwgilAiRYkrwoVrr25cf17qbvqRemEH81Kd63bB4isCnESEp9pX6d56_FUI44XSexx0DzH_dfsn5M56ye8Nm7XTFp1x2pSVuv1ncb7KLWg79CxtMixEwBR5i_0wdT?key=0M8vRj0vZ5XCvi3mJzuAAg\" width=\"602\" height=\"308\" style=\"margin-left:0px;margin-top:0px;\"></span></span></strong></p><p><strong style=\"font-weight:normal;\" id=\"docs-internal-guid-b8455d5a-7fff-8ece-f165-2f82f15ee175\"><br></strong></p><p><br></p>','[{\"option\": \"27 pounds of force at a 15-degree tilt\", \"feedback\": \"\"}, {\"option\": \"40 pounds at 30 degrees tilt\", \"feedback\": \"\"}, {\"option\": \"49 pounds at 45 degrees tilt\", \"feedback\": \"\"}, {\"option\": \"60 pounds at a 60-degree tilt\", \"feedback\": \"\"}, {\"option\": \"All the above statements are correct\", \"feedback\": \"\"}]','2024-09-13 10:22:31','All the above statements are correct',1,1),(2,'<p><strong style=\"font-weight:normal;\" id=\"docs-internal-guid-15c88bf4-7fff-3b05-66aa-5134ec7e9879\"><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\"><span style=\"border:none;display:inline-block;overflow:hidden;width:602px;height:240px;\"><img src=\"https://lh7-rt.googleusercontent.com/docsz/AD_4nXcN1PBd_Vyrg2FNCp6RB8GFcEAkBu768DpYBDmtWkEfbceEa7UCjN9cM52UXYnrJk5YO_SpoW88m06mUWCqD1xonSu45my1i6B7bR8kW38D4xyt8AA09Y0BNkyFVNL5rXW0bzgr3boSTXnT3_eOGIy0-jhQ?key=0M8vRj0vZ5XCvi3mJzuAAg\" width=\"602\" height=\"240\" style=\"margin-left:0px;margin-top:0px;\"></span></span></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">Which types of doctors are qualified to evaluate back pain?</span></p></strong><br class=\"Apple-interchange-newline\"><br></p>','[{\"option\": \"Orthopedic Surgeon\", \"feedback\": \"\"}, {\"option\": \"Neurosurgeon \", \"feedback\": \"\"}, {\"option\": \"Physical Medicine and Rehabilitation Specialist \", \"feedback\": \"\"}, {\"option\": \"Chiropractor\", \"feedback\": \"\"}, {\"option\": \"Emergency Room Physician \", \"feedback\": \"\"}, {\"option\": \"Osteopathic Physician\", \"feedback\": \"\"}, {\"option\": \"Family Practitioner \", \"feedback\": \"\"}, {\"option\": \"Internal Medicine Doctor \", \"feedback\": \"\"}, {\"option\": \"Neurologist \", \"feedback\": \"\"}, {\"option\": \"All of the above\", \"feedback\": \"\"}]','2024-09-13 10:26:02','All of the above',1,1),(3,'<p><br></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><strong style=\"font-weight:normal;\" id=\"docs-internal-guid-cc3d64ad-7fff-3620-d231-d91a62a171ab\"><span style=\"font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\"><span style=\"border:none;display:inline-block;overflow:hidden;width:580px;height:387px;\"><img src=\"https://lh7-rt.googleusercontent.com/docsz/AD_4nXcAjZtszz08wYT1gMuWDTpeUFWypTLA-OnDYX3ZBoNJgjgohRonF9l_V2oH39I8ZspzKQ2jsa6a7oGGiA_rNU94vypf-4MS3Z573qEhZuhWWL7w7gfUof93PZ8-5YRqspq4wc18WhXM5cpvrgytEvTCBLI?key=0M8vRj0vZ5XCvi3mJzuAAg\" width=\"580\" height=\"387\" style=\"margin-left:0px;margin-top:0px;\"></span></span></strong></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><strong style=\"font-weight:normal;\" id=\"docs-internal-guid-cc3d64ad-7fff-3620-d231-d91a62a171ab\"><span style=\"font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">In what ways can the practice of meditation contribute to relieving back pain?</span></strong></p><br class=\"Apple-interchange-newline\"><br><p><br></p>','[{\"option\": \"Meditation reduces muscle tension and stress, which are common contributors to back pain.\", \"feedback\": \"\"}, {\"option\": \"By improving posture awareness, meditation can lead to better spinal alignment.\", \"feedback\": \"\"}, {\"option\": \"Meditation enhances pain tolerance, making back pain more manageable.\", \"feedback\": \"\"}, {\"option\": \"Regular meditation increases blood flow to back muscles, aiding in healing and pain relief. \", \"feedback\": \"\"}, {\"option\": \"All of the above are ways meditation can help relieve back pain.\", \"feedback\": \"\"}]','2024-09-13 10:33:32','All of the above are ways meditation can help relieve back pain.',1,1),(4,'<p>When a person sits 8 hours a day at work, how many hours are they sitting per year?</p>','[{\"option\": \"1000 Hrs\", \"feedback\": \"\"}, {\"option\": \"2000 Hrs\", \"feedback\": \"\"}, {\"option\": \"3000 Hrs\", \"feedback\": \"\"}, {\"option\": \"4000 Hrs\", \"feedback\": \"\"}]','2024-09-13 10:41:11','3000',2,1),(5,'<p>What is the number of people who do have or will have significant back pain or neck pain at some point in their lives?</p>','[{\"option\": \"1/5\", \"feedback\": \"\"}, {\"option\": \"2/5\", \"feedback\": \"\"}, {\"option\": \"3/5\", \"feedback\": \"\"}, {\"option\": \"4/5\", \"feedback\": \"\"}, {\"option\": \"5/5\", \"feedback\": \"\"}]','2024-09-13 10:41:56','1/5',2,1),(6,'<p>Which of the following professions or conditions are associated with a higher risk of spine injury?</p>','[{\"option\": \"Older adults \", \"feedback\": \"\"}, {\"option\": \"People with sedentary lifestyles \", \"feedback\": \"\"}, {\"option\": \"Individuals who sit for prolonged periods without movement \", \"feedback\": \"\"}, {\"option\": \"Architects \", \"feedback\": \"\"}, {\"option\": \"Dentists, doctors, and nurses\", \"feedback\": \"\"}, {\"option\": \"Barbers and hairstylists \", \"feedback\": \"\"}, {\"option\": \"Individuals who engage in frequent heavy lifting \", \"feedback\": \"\"}, {\"option\": \"Construction workers\", \"feedback\": \"\"}, {\"option\": \"Manual laborers\", \"feedback\": \"\"}, {\"option\": \"Smokers \", \"feedback\": \"\"}, {\"option\": \"All of the above\", \"feedback\": \"\"}]','2024-09-13 10:44:40','All of the above',2,1),(7,'<p><strong style=\"font-weight:normal;\" id=\"docs-internal-guid-f87ad8ba-7fff-4c35-9d55-3fdb130775c9\"><br><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\"><span style=\"border:none;display:inline-block;overflow:hidden;width:602px;height:401px;\"><img src=\"https://lh7-rt.googleusercontent.com/docsz/AD_4nXd1kKVPZka0DD7x3TqyJThwwcwWqg-5dS-INS6KlynJiWVrGe3IiVx3a4Sjsb8gXcilUCpZsmyCu3dWgrO2agjag6c3W_c7qt3JRwJuOZL5yVab4t_kWh86huo8FL53RbKB7IiVcmJQXlLdPS1B5eK9zqPZ?key=0M8vRj0vZ5XCvi3mJzuAAg\" width=\"602\" height=\"401\" style=\"margin-left:0px;margin-top:0px;\"></span></span></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">How many pounds can a lifter carry in a year, if the lifter carries 1,000 pounds per day?</span></p></strong><br class=\"Apple-interchange-newline\"><br></p>','[{\"option\": \"250,000 pounds\", \"feedback\": \"\"}, {\"option\": \"500,000 pounds\", \"feedback\": \"\"}, {\"option\": \"750,000 pounds\", \"feedback\": \"\"}, {\"option\": \"1,000,000 pounds\", \"feedback\": \"\"}]','2024-09-13 10:58:07','500,000 pounds',2,1),(8,'<p><strong style=\"font-weight:normal;\" id=\"docs-internal-guid-f73fdcd3-7fff-1757-929e-4d669cd58228\"><br><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\"><span style=\"border:none;display:inline-block;overflow:hidden;width:602px;height:501px;\"><img src=\"https://lh7-rt.googleusercontent.com/docsz/AD_4nXc6hFNeQR8W_imyIqQ2nCb96pO-WauwhGsG4c8gu_FVhUnVcZAbDdVEKcdv8wzEGX3sBgs-YXH-tDgNxyMuefknP7GWySGVbZ2yCECbjtGVVOPzu0C2LahcWGKUDCVVO91RA4XhAf0ckI-HbnMSZkiNLxWL?key=0M8vRj0vZ5XCvi3mJzuAAg\" width=\"602\" height=\"501\" style=\"margin-left:0px;margin-top:0px;\"></span></span></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">How does cigarette smoking, or vaping damage the spine?</span></p></strong><br class=\"Apple-interchange-newline\"><br></p>','[{\"option\": \"Arterial constriction leading to less blood flow to the spine\", \"feedback\": \"\"}, {\"option\": \"Nicotine poisoning of the spine\", \"feedback\": \"\"}, {\"option\": \"Bone weakening called osteoporosis\", \"feedback\": \"\"}, {\"option\": \"Microfractures of the spine\", \"feedback\": \"\"}, {\"option\": \"All the above\", \"feedback\": \"\"}]','2024-09-13 10:59:33','All the above',2,1);
/*!40000 ALTER TABLE `quiz_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_type`
--

DROP TABLE IF EXISTS `quiz_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_type` (
  `quiz_type_id` int NOT NULL AUTO_INCREMENT,
  `quiz_type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`quiz_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_type`
--

LOCK TABLES `quiz_type` WRITE;
/*!40000 ALTER TABLE `quiz_type` DISABLE KEYS */;
INSERT INTO `quiz_type` VALUES (1,'Pre-Assessment'),(2,'Post-Assessment');
/*!40000 ALTER TABLE `quiz_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'instructor'),(4,'student'),(3,'teacher');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phoneno` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int NOT NULL,
  `emp_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_staff_role_id` (`role_id`),
  CONSTRAINT `fk_staff_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `student_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phoneno` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role_id` int NOT NULL,
  `dept_id` int DEFAULT NULL,
  `dept_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email` (`email`),
  KEY `role_id` (`role_id`),
  KEY `fk_student_department` (`dept_id`),
  CONSTRAINT `fk_student_department` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (5,'Shivani','shivani.m@kggeniuslabs.com','123456','8608053258',NULL,3,NULL,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_of_section`
--

DROP TABLE IF EXISTS `type_of_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_of_section` (
  `type_of_section_id` int NOT NULL AUTO_INCREMENT,
  `type_of_section` varchar(50) NOT NULL,
  PRIMARY KEY (`type_of_section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_section`
--

LOCK TABLES `type_of_section` WRITE;
/*!40000 ALTER TABLE `type_of_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_of_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `context_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_no` (`phone_no`),
  KEY `fk_user_context` (`context_id`),
  CONSTRAINT `fk_user_context` FOREIGN KEY (`context_id`) REFERENCES `context` (`context_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin@gmail.com','8608053255','$2b$10$F7Ac.LDsx6GbQhvryIr8quW5CccTGeH6yZYxvkkW0a1Mq5FEyGIkC','2024-09-13 10:14:55','admin admin',NULL,1),(2,'instructor@gmail.com','8608053256','$2b$10$PxOARSkDCy49tcxJJE7xCuikJ6JGqg6svGvidWPeQ7zsbySsIpDuy','2024-09-13 10:15:47','Instructor Instructor',NULL,2),(3,'siva.v@kggeniuslabs.com','8608053257','$2b$10$vyhzY0qTvENpKZ0262n87.R8sBu9C/uZIpxmTLPb9RAOmSYnp/M5G','2024-09-13 10:16:21','siva  velayutham',NULL,3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-14 18:26:23
