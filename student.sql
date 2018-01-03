/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.28 : Database - student_manager
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`student_manager` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `student_manager`;

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '学号',
  `NAME` varchar(20) DEFAULT NULL COMMENT '姓名',
  `SEX` varchar(6) DEFAULT NULL COMMENT '性别',
  `DATETIME` date DEFAULT NULL COMMENT '出生日期',
  `PHONE` bigint(20) DEFAULT NULL COMMENT '电话',
  `CLASS` varchar(20) DEFAULT NULL COMMENT '班级',
  `CHINESE` bigint(20) DEFAULT NULL COMMENT '语文',
  `MATHS` bigint(20) DEFAULT NULL COMMENT '数学',
  `ENGLISH` bigint(20) DEFAULT NULL COMMENT '英语',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`ID`,`NAME`,`SEX`,`DATETIME`,`PHONE`,`CLASS`,`CHINESE`,`MATHS`,`ENGLISH`) values (1,'zhang','男','1990-08-18',18866666666,'金现代一班',89,90,68),(2,'赵月','男','2017-11-21',13562156523,'金现代一班',68,89,95),(3,'韩梅','女','2009-07-06',13258528525,'金现代二班',79,56,68),(9,'刘娜','女','1996-06-07',15669855889,'金现代三班',75,83,96),(15,'徐丙鹏','男','1996-07-16',18866830353,'金现代三班',66,77,99);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
