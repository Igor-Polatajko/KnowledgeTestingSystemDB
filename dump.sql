CREATE DATABASE  IF NOT EXISTS `knowledgetestingsystemdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `knowledgetestingsystemdb`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: knowledgetestingsystemdb
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `answers` (
  `answer_id` int(32) NOT NULL AUTO_INCREMENT,
  `question_id` int(32) NOT NULL,
  `answer_content` text,
  `is_right` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`answer_id`),
  KEY `question_id_idx` (`question_id`),
  CONSTRAINT `question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (51,1,'Cache',1),(52,1,'Hard drive',1),(53,2,'Structured Query Language',0),(54,3,'Create Read Update Delete',0),(55,4,'one-to-one',1),(56,4,'multiple-to-zero',0),(57,4,'parent-to-child',0),(58,4,'one-to-many',1),(59,4,'container-to-data',0),(60,4,'many-to-many',1),(61,5,'127.0.0.1',0),(62,6,'JSON Database Comunication',0),(63,6,'Java Database Conectivity',1),(64,6,'JavaDatabase Comunication',0),(65,7,'Java Management Extention',0),(66,8,'@RestController',0),(67,8,'Presentation',0),(68,8,'@Sevice',0),(69,8,'Business logic',0),(70,8,'@Repository',0),(71,8,'Data access',0),(72,9,'TRUE',0),(73,10,'TRUE',0),(74,11,'Remote Procedure Call',0),(75,12,'Distributed event streaming platform',1),(76,12,'Message queue',0),(77,12,'Database',0),(78,13,'DDL',0),(79,13,'DML',1),(80,13,'DCL',1),(81,13,'DQL',0),(82,14,'INSERT',0),(83,14,'UPDATE',0),(84,14,'COMMIT',0),(85,14,'ROLL BACK',0),(86,14,'CREATE',0),(87,14,'ALTER',0);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectquestionsanswers`
--

DROP TABLE IF EXISTS `connectquestionsanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `connectquestionsanswers` (
  `connect_question_answer_id` int(32) NOT NULL AUTO_INCREMENT,
  `answer_id` int(32) NOT NULL,
  `correct_pair_answer_id` int(32) NOT NULL,
  `question_id` int(32) NOT NULL,
  PRIMARY KEY (`connect_question_answer_id`),
  UNIQUE KEY `answer_id_UNIQUE` (`answer_id`),
  UNIQUE KEY `correct_pair_answer_id_UNIQUE` (`correct_pair_answer_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `answer_id0` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`answer_id`),
  CONSTRAINT `connectquestionsanswers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `correct_pair_answer_id` FOREIGN KEY (`correct_pair_answer_id`) REFERENCES `answers` (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectquestionsanswers`
--

LOCK TABLES `connectquestionsanswers` WRITE;
/*!40000 ALTER TABLE `connectquestionsanswers` DISABLE KEYS */;
INSERT INTO `connectquestionsanswers` VALUES (1,66,67,8),(2,68,69,8),(3,70,71,8),(4,82,83,14),(5,84,85,14),(6,86,87,14);
/*!40000 ALTER TABLE `connectquestionsanswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses` (
  `course_id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (5,'DB basics','Some essential skills, that will help you in future development'),(6,'Java advanced','Course that will be helpful for junior and middle devs, who want to improve their Java skills'),(7,'Java for web','You will learn basic Java frameworks fo web development (Spring, Dropwizard)'),(8,'Advanced Java for web','Proffesional tools for web. (Redis, Apache Kafka, gRPC, HTTP/2, WebSockets)');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `groups` (
  `group_id` int(32) NOT NULL AUTO_INCREMENT,
  `moderator_id` int(32) DEFAULT NULL,
  `group_name` varchar(45) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `moderator_id_idx` (`moderator_id`),
  CONSTRAINT `moderator_id` FOREIGN KEY (`moderator_id`) REFERENCES `moderators` (`moderator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (4,NULL,'developers'),(5,NULL,'lifetime-learners');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moderators`
--

DROP TABLE IF EXISTS `moderators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `moderators` (
  `moderator_id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  PRIMARY KEY (`moderator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderators`
--

LOCK TABLES `moderators` WRITE;
/*!40000 ALTER TABLE `moderators` DISABLE KEYS */;
INSERT INTO `moderators` VALUES (2,'Vasiliy','Popovich');
/*!40000 ALTER TABLE `moderators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `questions` (
  `question_id` int(32) NOT NULL AUTO_INCREMENT,
  `test_id` int(32) NOT NULL,
  `content` mediumtext NOT NULL,
  `question_type` varchar(45) NOT NULL COMMENT 'only ''TRUE_FALSE'', ''TEST'', ''OPEN'', ''CONNECT'' are valid values',
  PRIMARY KEY (`question_id`),
  KEY `test_id_idx` (`test_id`),
  CONSTRAINT `test_id` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`),
  CONSTRAINT `question_type` CHECK ((`question_type` in (_utf8mb4'TRUE_FALSE',_utf8mb4'TEST',_utf8mb4'OPEN',_utf8mb4'CONNECT')))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'Where databases store data?','TEST'),(2,2,'What SQL stands for?','OPEN'),(3,2,'What CRUD stands for?','OPEN'),(4,3,'Check existing relations types','TEST'),(5,4,'Enter \"localhost\" IP address (e.g. 100.0.0.0)','OPEN'),(6,5,'What JDBC stands for?','TEST'),(7,6,'What JMX stands for?','OPEN'),(8,7,'Connect annotations to appropriate layers of application','CONNECT'),(9,8,'Can layered architecture have more or less than 3 tiers?','TRUE_FALSE'),(10,9,'Do DropWizard always use Jetty as embedded server?','TRUE_FALSE'),(11,10,'What RPC stands for?','OPEN'),(12,11,'What is Kafka','TEST'),(13,2,'INSERT command belongs to','TEST'),(14,2,'Connect commands of one type','CONNECT');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentconnectquestionsanswers`
--

DROP TABLE IF EXISTS `studentconnectquestionsanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studentconnectquestionsanswers` (
  `student_connect_questions_answer_id` int(32) NOT NULL AUTO_INCREMENT,
  `student_id` int(32) NOT NULL,
  `answer_id` int(32) NOT NULL,
  `pair_answer_id` int(32) NOT NULL,
  `submitted_time` timestamp(6) NULL DEFAULT NULL,
  `question_id` int(32) NOT NULL,
  PRIMARY KEY (`student_connect_questions_answer_id`),
  UNIQUE KEY `pair_answer_id_UNIQUE` (`pair_answer_id`),
  UNIQUE KEY `answer_id_UNIQUE` (`answer_id`),
  KEY `student_id_idx` (`student_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `answer_id1` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`answer_id`),
  CONSTRAINT `pair_answer_id` FOREIGN KEY (`pair_answer_id`) REFERENCES `answers` (`answer_id`),
  CONSTRAINT `student_id2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `studentconnectquestionsanswers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentconnectquestionsanswers`
--

LOCK TABLES `studentconnectquestionsanswers` WRITE;
/*!40000 ALTER TABLE `studentconnectquestionsanswers` DISABLE KEYS */;
INSERT INTO `studentconnectquestionsanswers` VALUES (1,12,66,67,'2019-12-16 18:27:34.000000',8),(2,12,68,71,'2019-12-16 18:27:34.000000',8),(3,12,70,69,'2019-12-16 18:27:34.000000',8),(4,8,82,83,'2019-12-19 00:58:33.000000',14),(5,8,84,87,'2019-12-19 00:58:33.000000',14),(7,8,86,85,'2019-12-19 01:01:53.000000',14);
/*!40000 ALTER TABLE `studentconnectquestionsanswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentopenquestionanswers`
--

DROP TABLE IF EXISTS `studentopenquestionanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studentopenquestionanswers` (
  `result_id` int(32) NOT NULL AUTO_INCREMENT,
  `question_id` int(32) NOT NULL,
  `student_id` int(32) NOT NULL,
  `answer` mediumtext NOT NULL,
  `submitted_time` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  KEY `student_id_idx` (`student_id`),
  KEY `question_id_idx` (`question_id`),
  CONSTRAINT `question_id0` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `student_id1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentopenquestionanswers`
--

LOCK TABLES `studentopenquestionanswers` WRITE;
/*!40000 ALTER TABLE `studentopenquestionanswers` DISABLE KEYS */;
INSERT INTO `studentopenquestionanswers` VALUES (1,2,3,'Structured Query Language','2019-12-16 07:05:13.000000'),(2,3,3,'Create Update Read Delete','2019-12-16 07:05:13.000000');
/*!40000 ALTER TABLE `studentopenquestionanswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `students` (
  `student_id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Ihor','Polataiko'),(2,'Ed','Miller'),(3,'John','Brain'),(4,'Martin','Fowler'),(5,'Mary','Williams'),(6,'Kate','Devis'),(7,'Ann','Anderson'),(8,'Antony','Joshua'),(9,'Kate','Sierra'),(10,'Alan','Brown'),(11,'Alice','Liddell'),(12,'Dale','Smith');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentscourses`
--

DROP TABLE IF EXISTS `studentscourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studentscourses` (
  `student_id` int(32) NOT NULL,
  `course_id` int(32) NOT NULL,
  `completed_date` timestamp(6) NULL DEFAULT NULL,
  KEY `student_id_idx` (`student_id`),
  KEY `course_id_idx` (`course_id`),
  CONSTRAINT `course_id0` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  CONSTRAINT `student_id0` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentscourses`
--

LOCK TABLES `studentscourses` WRITE;
/*!40000 ALTER TABLE `studentscourses` DISABLE KEYS */;
INSERT INTO `studentscourses` VALUES (1,8,NULL),(3,5,NULL),(6,6,NULL),(12,7,NULL),(2,8,NULL),(2,5,NULL),(4,7,NULL),(5,7,NULL),(5,8,NULL),(6,7,NULL),(7,7,NULL),(8,5,NULL),(8,8,NULL),(11,7,NULL),(12,8,NULL),(8,6,NULL);
/*!40000 ALTER TABLE `studentscourses` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `StudentsCourses_AFTER_INSERT` AFTER INSERT ON `studentscourses` FOR EACH ROW BEGIN
  INSERT INTO StudentsTests(student_id, test_id) (SELECT NEW.student_id, test_id FROM Tests WHERE course_id = NEW.course_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `StudentsCourses_AFTER_DELETE` AFTER DELETE ON `studentscourses` FOR EACH ROW BEGIN
  DELETE FROM StudentsTests WHERE test_id IN (SELECT test_id FROM Tests AS t WHERE t.course_id = OLD.course_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `studentstests`
--

DROP TABLE IF EXISTS `studentstests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studentstests` (
  `students_test_id` int(32) NOT NULL AUTO_INCREMENT,
  `student_id` int(32) NOT NULL,
  `test_id` int(32) NOT NULL,
  `max_attempts_allowed` int(11) DEFAULT '3',
  PRIMARY KEY (`students_test_id`),
  KEY `student_id_idx` (`student_id`),
  KEY `test_id_idx` (`test_id`),
  CONSTRAINT `student_id3` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `test_id1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentstests`
--

LOCK TABLES `studentstests` WRITE;
/*!40000 ALTER TABLE `studentstests` DISABLE KEYS */;
INSERT INTO `studentstests` VALUES (1,1,10,3),(2,1,11,3),(4,3,1,3),(5,3,2,3),(6,3,3,3),(7,6,4,3),(8,6,5,3),(9,6,6,3),(10,12,7,3),(11,12,8,3),(12,12,9,3),(14,1,8,3),(15,2,10,3),(16,2,11,3),(18,2,1,3),(19,2,2,3),(20,2,3,3),(21,4,7,3),(22,4,8,3),(23,4,9,3),(24,5,7,3),(25,5,8,3),(26,5,9,3),(27,5,10,3),(28,5,11,3),(30,6,7,3),(31,6,8,3),(32,6,9,3),(33,7,7,3),(34,7,8,3),(35,7,9,3),(36,8,1,3),(37,8,2,3),(38,8,3,3),(39,8,10,3),(40,8,11,3),(42,11,7,3),(43,11,8,3),(44,11,9,3),(45,12,10,3),(46,12,11,3),(48,8,4,3),(49,8,5,3),(50,8,6,3);
/*!40000 ALTER TABLE `studentstests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studenttestanswers`
--

DROP TABLE IF EXISTS `studenttestanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studenttestanswers` (
  `result_id` int(32) NOT NULL AUTO_INCREMENT,
  `student_id` int(32) NOT NULL,
  `answer_id` int(32) NOT NULL,
  `submitted_time` timestamp(6) NULL DEFAULT NULL,
  `question_id` int(32) NOT NULL,
  PRIMARY KEY (`result_id`),
  KEY `student_id_idx` (`student_id`),
  KEY `answer_id_idx` (`answer_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `answer_id` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`answer_id`),
  CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `studenttestanswers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studenttestanswers`
--

LOCK TABLES `studenttestanswers` WRITE;
/*!40000 ALTER TABLE `studenttestanswers` DISABLE KEYS */;
INSERT INTO `studenttestanswers` VALUES (1,3,51,'2019-12-16 18:59:48.000000',1),(2,8,81,'2019-12-18 23:27:44.000000',13),(3,8,79,'2019-12-19 19:37:38.000000',13);
/*!40000 ALTER TABLE `studenttestanswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studenttruefalseanswers`
--

DROP TABLE IF EXISTS `studenttruefalseanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studenttruefalseanswers` (
  `student_true_false_answer_id` int(32) NOT NULL AUTO_INCREMENT,
  `student_id` int(32) NOT NULL,
  `question_id` int(32) NOT NULL,
  `answer` tinyint(4) NOT NULL,
  `submitted_time` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`student_true_false_answer_id`),
  KEY `student_id_idx` (`student_id`),
  KEY `question_id_idx` (`question_id`),
  CONSTRAINT `question_id3` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `student_id4` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studenttruefalseanswers`
--

LOCK TABLES `studenttruefalseanswers` WRITE;
/*!40000 ALTER TABLE `studenttruefalseanswers` DISABLE KEYS */;
INSERT INTO `studenttruefalseanswers` VALUES (1,1,9,1,'2019-12-16 19:37:38.000000'),(6,5,10,1,'2019-12-19 14:27:51.000000'),(7,5,10,0,'2019-12-20 14:28:43.000000'),(8,5,10,0,'2019-12-18 14:28:54.000000');
/*!40000 ALTER TABLE `studenttruefalseanswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testattempts`
--

DROP TABLE IF EXISTS `testattempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `testattempts` (
  `test_attempt_id` int(32) NOT NULL AUTO_INCREMENT,
  `students_test_id` int(32) NOT NULL,
  `submitted_time` timestamp(6) NOT NULL,
  PRIMARY KEY (`test_attempt_id`),
  KEY `students_test_id_idx` (`students_test_id`),
  CONSTRAINT `students_test_id` FOREIGN KEY (`students_test_id`) REFERENCES `studentstests` (`students_test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testattempts`
--

LOCK TABLES `testattempts` WRITE;
/*!40000 ALTER TABLE `testattempts` DISABLE KEYS */;
INSERT INTO `testattempts` VALUES (1,37,'2019-12-19 18:53:29.000000');
/*!40000 ALTER TABLE `testattempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tests` (
  `test_id` int(32) NOT NULL AUTO_INCREMENT,
  `course_id` int(32) NOT NULL,
  `topic_title` varchar(255) NOT NULL,
  PRIMARY KEY (`test_id`),
  KEY `course_id_idx` (`course_id`),
  CONSTRAINT `course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,5,'What is db?'),(2,5,'Query language'),(3,5,'Relations'),(4,6,'Connection to sockets'),(5,6,'Connection to DB'),(6,6,'JMX tools'),(7,7,'Spring MVC essentials'),(8,7,'Web architecture'),(9,7,'DropWizard'),(10,8,'gRPC, HTTP/2'),(11,8,'Apache Kafka');
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

-- -----------------------------------------------------
-- Table structure for table `StudentsGroups`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `StudentsGroups`;
CREATE TABLE `StudentsGroups` (
  `students_groups_id` INT(32) NOT NULL,
  `student_id` INT(32) NOT NULL,
  `group_id` INT(32) NOT NULL,
  PRIMARY KEY (`students_groups_id`),
  INDEX `student_id_idx` (`student_id` ASC) VISIBLE,
  INDEX `group_id_idx` (`group_id` ASC) VISIBLE,
  CONSTRAINT `student_id5`
    FOREIGN KEY (`student_id`)
    REFERENCES `KnowledgeTestingSystemDb`.`Students` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `KnowledgeTestingSystemDb`.`Groups` (`group_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DELIMITER ;;
 CREATE TRIGGER `StudentsCourses_AFTER_INSERT` AFTER INSERT ON `studentscourses` FOR EACH ROW BEGIN
  INSERT INTO StudentsTests(student_id, test_id) (SELECT NEW.student_id, test_id FROM Tests WHERE course_id = NEW.course_id);
END ;;
DELIMITER ;

DELIMITER ;;
CREATE TRIGGER `StudentsCourses_AFTER_DELETE` AFTER DELETE ON `studentscourses` FOR EACH ROW BEGIN
  DELETE FROM StudentsTests WHERE test_id IN (SELECT test_id FROM Tests AS t WHERE t.course_id = OLD.course_id);
END ;;
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-19 23:24:31
