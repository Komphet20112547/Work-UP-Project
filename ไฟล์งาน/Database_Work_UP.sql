-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for work up
CREATE DATABASE IF NOT EXISTS `work up` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `work up`;

-- Dumping structure for table work up.bookmarks
CREATE TABLE IF NOT EXISTS `bookmarks` (
  `bookmark_ID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`bookmark_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table work up.bookmarks: ~0 rows (approximately)
INSERT INTO `bookmarks` (`bookmark_ID`) VALUES
	(1),
	(2),
	(3);

-- Dumping structure for table work up.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `category_ID` int NOT NULL AUTO_INCREMENT,
  `is_full_time` tinyint(1) DEFAULT '0',
  `is_part_time` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`category_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table work up.categories: ~0 rows (approximately)
INSERT INTO `categories` (`category_ID`, `is_full_time`, `is_part_time`) VALUES
	(1, 1, 0),
	(2, 0, 1);

-- Dumping structure for table work up.entrepreneurs
CREATE TABLE IF NOT EXISTS `entrepreneurs` (
  `entrepreneur_ID` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gmail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entrepreneur_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table work up.entrepreneurs: ~0 rows (approximately)
INSERT INTO `entrepreneurs` (`entrepreneur_ID`, `fullname`, `phone_number`, `address`, `sex`, `age`, `gmail`) VALUES
	(1, 'สุรชัย ทำธุรกิจ', '0811111111', '101/2 ถ.สีลม', 'ชาย', 45, 'surachai@biz.com'),
	(2, 'นวลจันทร์ มีไอเดีย', '0922222222', '15 ถ.เจริญกรุง', 'หญิง', 30, 'nuanjun@idea.com');

-- Dumping structure for table work up.entrepreneur_submits
CREATE TABLE IF NOT EXISTS `entrepreneur_submits` (
  `entrepreneur_ID` int NOT NULL,
  `submit_ID` int NOT NULL,
  PRIMARY KEY (`entrepreneur_ID`,`submit_ID`),
  KEY `submit_ID` (`submit_ID`),
  CONSTRAINT `entrepreneur_submits_ibfk_1` FOREIGN KEY (`entrepreneur_ID`) REFERENCES `entrepreneurs` (`entrepreneur_ID`) ON DELETE CASCADE,
  CONSTRAINT `entrepreneur_submits_ibfk_2` FOREIGN KEY (`submit_ID`) REFERENCES `submits` (`submit_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table work up.entrepreneur_submits: ~0 rows (approximately)

-- Dumping structure for table work up.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `post_ID` int NOT NULL AUTO_INCREMENT,
  `post_detail` text,
  `picture` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `entrepreneur_ID` int DEFAULT NULL,
  `category_ID` int DEFAULT NULL,
  PRIMARY KEY (`post_ID`),
  KEY `entrepreneur_ID` (`entrepreneur_ID`),
  KEY `category_ID` (`category_ID`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`entrepreneur_ID`) REFERENCES `entrepreneurs` (`entrepreneur_ID`) ON DELETE CASCADE,
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`category_ID`) REFERENCES `categories` (`category_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table work up.posts: ~0 rows (approximately)
INSERT INTO `posts` (`post_ID`, `post_detail`, `picture`, `video`, `entrepreneur_ID`, `category_ID`) VALUES
	(1, 'รับสมัครโปรแกรมเมอร์ประจำ', 'programmer_ad.jpg', NULL, 1, 1),
	(2, 'รับสมัครดีไซเนอร์พาร์ทไทม์', 'designer_ad.jpg', NULL, 2, 2);

-- Dumping structure for table work up.post_bookmarks
CREATE TABLE IF NOT EXISTS `post_bookmarks` (
  `bookmark_ID` int NOT NULL,
  `post_ID` int NOT NULL,
  PRIMARY KEY (`bookmark_ID`,`post_ID`),
  KEY `post_ID` (`post_ID`),
  CONSTRAINT `post_bookmarks_ibfk_1` FOREIGN KEY (`bookmark_ID`) REFERENCES `bookmarks` (`bookmark_ID`) ON DELETE CASCADE,
  CONSTRAINT `post_bookmarks_ibfk_2` FOREIGN KEY (`post_ID`) REFERENCES `posts` (`post_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table work up.post_bookmarks: ~0 rows (approximately)
INSERT INTO `post_bookmarks` (`bookmark_ID`, `post_ID`) VALUES
	(1, 1),
	(2, 2);

-- Dumping structure for table work up.post_submits
CREATE TABLE IF NOT EXISTS `post_submits` (
  `submit_ID` int NOT NULL,
  `post_ID` int NOT NULL,
  PRIMARY KEY (`submit_ID`,`post_ID`),
  KEY `post_ID` (`post_ID`),
  CONSTRAINT `post_submits_ibfk_1` FOREIGN KEY (`submit_ID`) REFERENCES `submits` (`submit_ID`) ON DELETE CASCADE,
  CONSTRAINT `post_submits_ibfk_2` FOREIGN KEY (`post_ID`) REFERENCES `posts` (`post_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table work up.post_submits: ~0 rows (approximately)
INSERT INTO `post_submits` (`submit_ID`, `post_ID`) VALUES
	(1, 1),
	(2, 2);

-- Dumping structure for table work up.submits
CREATE TABLE IF NOT EXISTS `submits` (
  `submit_ID` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `talent` varchar(255) DEFAULT NULL,
  `gmail` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `congenital_disease` varchar(255) DEFAULT NULL,
  `ability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`submit_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table work up.submits: ~0 rows (approximately)
INSERT INTO `submits` (`submit_ID`, `full_name`, `address`, `talent`, `gmail`, `phone_number`, `weight`, `height`, `sex`, `age`, `congenital_disease`, `ability`) VALUES
	(1, 'วีระชัย เก่งงาน', '25/3 ซ.พัฒนาการ', 'โปรแกรมเมอร์', 'veerachai@example.com', '0933333333', 75.50, 175.00, 'ชาย', 28, 'ไม่มี', 'เขียนภาษา Python ได้คล่อง'),
	(2, 'ลลิตา ดีไซน์', '405 ถ.สุขุมวิท', 'นักออกแบบกราฟิก', 'lalita@example.com', '0944444444', 58.00, 160.00, 'หญิง', 25, 'แพ้อากาศ', 'ใช้ Adobe Photoshop ได้ดี');

-- Dumping structure for table work up.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_ID` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `talent` varchar(255) DEFAULT NULL,
  `gmail` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `congenital_disease` varchar(255) DEFAULT NULL,
  `ability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table work up.users: ~0 rows (approximately)
INSERT INTO `users` (`user_ID`, `full_name`, `address`, `talent`, `gmail`, `phone_number`, `weight`, `height`, `sex`, `age`, `congenital_disease`, `ability`) VALUES
	(1, 'วีระชัย เก่งงาน', '25/3 ซ.พัฒนาการ', 'โปรแกรมเมอร์', 'veerachai@example.com', '0933333333', 75.50, 175.00, 'ชาย', 28, 'ไม่มี', 'เขียนภาษา Python ได้คล่อง'),
	(2, 'ลลิตา ดีไซน์', '405 ถ.สุขุมวิท', 'นักออกแบบกราฟิก', 'lalita@example.com', '0944444444', 58.00, 160.00, 'หญิง', 25, 'แพ้อากาศ', 'ใช้ Adobe Photoshop ได้ดี'),
	(3, 'สมศักดิ์ แกร่ง', '125 ถ.พระราม 3', 'นักกีฬา', 'somsak@example.com', '0955555555', 85.00, 185.00, 'ชาย', 32, 'หอบหืด', 'วิ่งมาราธอนได้'),
	(4, 'มานะ ขยัน', '77 ซ.อารีย์', 'นักการตลาด', 'mana@example.com', '0966666666', 68.00, 170.00, 'ชาย', 29, 'ไม่มี', 'วางแผนแคมเปญโฆษณา'),
	(5, 'สุดารัตน์ มืออาชีพ', '85/9 ถ.เพชรบุรี', 'นักบัญชี', 'sudarat@example.com', '0977777777', 62.50, 163.00, 'หญิง', 35, 'ความดันต่ำ', 'จัดทำงบการเงิน'),
	(6, 'อรุณี มีศิลป์', '10 ซ.ทองหล่อ', 'ศิลปิน', 'arunee@example.com', '0988888888', 55.00, 168.00, 'หญิง', 27, 'ไม่มี', 'วาดภาพสีน้ำได้สวย'),
	(7, 'ณัฐพล ช่างฝีมือ', '112 ถ.ลาดพร้าว', 'ช่างไม้', 'nattapon@example.com', '0999999999', 80.00, 180.00, 'ชาย', 40, 'ภูมิแพ้ฝุ่น', 'สร้างเฟอร์นิเจอร์');

-- Dumping structure for table work up.user_bookmarks
CREATE TABLE IF NOT EXISTS `user_bookmarks` (
  `bookmark_ID` int NOT NULL,
  `user_ID` int NOT NULL,
  PRIMARY KEY (`bookmark_ID`,`user_ID`),
  KEY `user_ID` (`user_ID`),
  CONSTRAINT `user_bookmarks_ibfk_1` FOREIGN KEY (`bookmark_ID`) REFERENCES `bookmarks` (`bookmark_ID`) ON DELETE CASCADE,
  CONSTRAINT `user_bookmarks_ibfk_2` FOREIGN KEY (`user_ID`) REFERENCES `users` (`user_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table work up.user_bookmarks: ~0 rows (approximately)
INSERT INTO `user_bookmarks` (`bookmark_ID`, `user_ID`) VALUES
	(1, 1),
	(2, 2);

-- Dumping structure for table work up.user_submits
CREATE TABLE IF NOT EXISTS `user_submits` (
  `submit_ID` int NOT NULL,
  `user_ID` int NOT NULL,
  PRIMARY KEY (`submit_ID`,`user_ID`),
  KEY `user_ID` (`user_ID`),
  CONSTRAINT `user_submits_ibfk_1` FOREIGN KEY (`submit_ID`) REFERENCES `submits` (`submit_ID`) ON DELETE CASCADE,
  CONSTRAINT `user_submits_ibfk_2` FOREIGN KEY (`user_ID`) REFERENCES `users` (`user_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table work up.user_submits: ~0 rows (approximately)
INSERT INTO `user_submits` (`submit_ID`, `user_ID`) VALUES
	(1, 1),
	(2, 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
