CREATE DATABASE  IF NOT EXISTS `stuhelp` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `stuhelp`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: stuhelp
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `coursetable`
--

DROP TABLE IF EXISTS `coursetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursetable` (
  `studentid` varchar(20) NOT NULL,
  `classNo` int(11) NOT NULL,
  `mon` varchar(100) DEFAULT NULL,
  `tue` varchar(100) DEFAULT NULL,
  `wed` varchar(100) DEFAULT NULL,
  `thu` varchar(100) DEFAULT NULL,
  `fri` varchar(100) DEFAULT NULL,
  `sat` varchar(100) DEFAULT NULL,
  `sun` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`studentid`,`classNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursetable`
--

LOCK TABLES `coursetable` WRITE;
/*!40000 ALTER TABLE `coursetable` DISABLE KEYS */;
INSERT INTO `coursetable` VALUES ('12345',1,'日语精读(4)_04\r\n刘倩  1-18周\r\n尚德楼123（多媒体','软件工程导论_02\r\n冶红  1-9周\r\n四海楼602（多媒体）','数据库原理_04\r\n曹志英  1-18周\r\n四海楼604（多媒体）','编译原理_02\r\n黄健  2-18双周\r\n百川楼401(多媒体)','','',''),('12345',2,'日语视听(3)_02\r\n李文平  1-18周\r\n学汇楼611','互联网软件基础_03\r\n李辉  1-18周\r\n四海楼401（多媒体','日语精读(4)_04\r\n刘倩  1-18周\r\n尚德楼123（多媒体）','软件工程导论_02\r\n冶红  1-9周\r\n四海楼602（多媒体）','日语精读(4)_04\r\n刘倩  1-18周\r\n尚德楼115（多媒体）','',''),('12345',3,'','编译原理_02\r\n黄健  1-18周\r\n百川楼401(多媒体)','','日语视听(3)_02\r\n李文平  1-18周\r\n学汇楼613','算法设计与分析_03\r\n陈飞  1-18周\r\n四海楼405（多媒体）','',''),('12345',4,'毛泽东思想和中国特色社会主义理论体系概论_05\r\n姜海龙  1-18周\r\n知行楼101（多媒体）','体育(4)_122\r\n郭玉良  1-19周\r\n操场东山外专公寓前轮滑场','','','数据库原理_04\r\n曹志英  1-18周\r\n四海楼604（多媒体）','',''),('12345',5,'','','','毛泽东思想和中国特色社会主义理论体系概论_05\r\n姜海龙  1-18周\r\n知行楼101（多媒体）','','','');
/*!40000 ALTER TABLE `coursetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examschedule`
--

DROP TABLE IF EXISTS `examschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examschedule` (
  `studentid` varchar(20) NOT NULL,
  `examname` varchar(45) NOT NULL,
  `examtime` varchar(45) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `examplace` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`studentid`,`examname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examschedule`
--

LOCK TABLES `examschedule` WRITE;
/*!40000 ALTER TABLE `examschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `examschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `collage` varchar(45) DEFAULT NULL COMMENT '所在学院',
  `major` varchar(45) DEFAULT NULL COMMENT '专业',
  `grade` int(11) DEFAULT NULL COMMENT '年级',
  `classno` int(11) DEFAULT NULL COMMENT '班级',
  `identity` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1：学生\n2：教职工';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('12345','1','测试学生','男','信息科学技术学院','软件工程',2016,4,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'stuhelp'
--

--
-- Dumping routines for database 'stuhelp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-18 22:36:59
