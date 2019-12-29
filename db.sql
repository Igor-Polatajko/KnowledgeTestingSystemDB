CREATE DATABASE  IF NOT EXISTS `knowledgetestingsystemdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `knowledgetestingsystemdb`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: knowledgetestingsystemdb
-- ------------------------------------------------------
-- Server version 8.0.18

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
  `submitted_time` timestamp(6) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `submitted_time` timestamp(6) NOT NULL,
  PRIMARY KEY (`result_id`),
  KEY `student_id_idx` (`student_id`),
  KEY `question_id_idx` (`question_id`),
  CONSTRAINT `question_id0` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `student_id1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `studentscourses`
--

DROP TABLE IF EXISTS `studentscourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studentscourses` (
  `student_id` int(32) NOT NULL,
  `course_id` int(32) NOT NULL,
  `completed_date` timestamp(6) DEFAULT NULL,
  KEY `student_id_idx` (`student_id`),
  KEY `course_id_idx` (`course_id`),
  CONSTRAINT `course_id0` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  CONSTRAINT `student_id0` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `max_attempts_allowed` INT NULL DEFAULT 3,
  PRIMARY KEY (`students_test_id`),
  KEY `student_id_idx` (`student_id`),
  KEY `test_id_idx` (`test_id`),
  CONSTRAINT `student_id3` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `test_id1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `question_id` int(32) NOT NULL,
  `submitted_time` timestamp(6) NOT NULL,
  PRIMARY KEY (`result_id`),
  KEY `student_id_idx` (`student_id`),
  KEY `answer_id_idx` (`answer_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `answer_id` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`answer_id`),
  CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `studenttestanswers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `submitted_time` timestamp(6) NOT NULL,
  PRIMARY KEY (`student_true_false_answer_id`),
  KEY `student_id_idx` (`student_id`),
  KEY `question_id_idx` (`question_id`),
  CONSTRAINT `question_id3` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `student_id4` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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

-- -----------------------------------------------------
-- Table `knowledgetestingsystemdb`.`TestAttemps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `knowledgetestingsystemdb`.`TestAttempts` (
  `test_attempt_id` INT(32) NOT NULL AUTO_INCREMENT,
  `students_test_id` INT(32) NOT NULL,
  `submitted_time` TIMESTAMP(6) NOT NULL,
  PRIMARY KEY (`test_attempt_id`),
  INDEX `students_test_id_idx` (`students_test_id` ASC) VISIBLE,
  CONSTRAINT `students_test_id`
    FOREIGN KEY (`students_test_id`)
    REFERENCES `knowledgetestingsystemdb`.`StudentsTests` (`students_test_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `knowledgetestingsystemdb`.`StudentsGroups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KnowledgeTestingSystemDb`.`StudentsGroups` (
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


/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-19  2:33:47
