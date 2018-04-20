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
-- Table structure for table `bbs`
--

DROP TABLE IF EXISTS `bbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbs` (
  `studentid` varchar(50) NOT NULL,
  `studentname` varchar(45) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `createtime` varchar(45) NOT NULL,
  `detail` varchar(1500) DEFAULT NULL,
  `good` int(11) DEFAULT '0',
  PRIMARY KEY (`studentid`,`createtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbs`
--

LOCK TABLES `bbs` WRITE;
/*!40000 ALTER TABLE `bbs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bbs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `topicstudentid` varchar(30) NOT NULL,
  `createtime` varchar(45) NOT NULL,
  `commentstudentid` varchar(45) NOT NULL,
  `commenttime` varchar(45) NOT NULL,
  `studentname` varchar(45) DEFAULT NULL,
  `comment` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`topicstudentid`,`createtime`,`commentstudentid`,`commenttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursetable`
--

DROP TABLE IF EXISTS `coursetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursetable` (
  `studentid` varchar(20) NOT NULL,
  `classNo` int(11) NOT NULL,
  `mon` varchar(100) DEFAULT '',
  `tue` varchar(100) DEFAULT '',
  `wed` varchar(100) DEFAULT '',
  `thu` varchar(100) DEFAULT '',
  `fri` varchar(100) DEFAULT '',
  `sat` varchar(100) DEFAULT '',
  `sun` varchar(100) DEFAULT '',
  PRIMARY KEY (`studentid`,`classNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursetable`
--

LOCK TABLES `coursetable` WRITE;
/*!40000 ALTER TABLE `coursetable` DISABLE KEYS */;
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
  `examname` varchar(45) DEFAULT NULL,
  `examtime` varchar(45) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `examplace` varchar(45) DEFAULT NULL,
  `createtime` varchar(45) NOT NULL,
  PRIMARY KEY (`createtime`,`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examschedule`
--

LOCK TABLES `examschedule` WRITE;
/*!40000 ALTER TABLE `examschedule` DISABLE KEYS */;
INSERT INTO `examschedule` VALUES ('12345','JLPT N2','2018-07-01','日语二级考试','大连理工大学外国语学院','2018-03-27-22-22-31'),('12345','CET 6','2018-06-28','大学英语六级考试','学汇楼','2018-03-27-22-22-40');
/*!40000 ALTER TABLE `examschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good`
--

DROP TABLE IF EXISTS `good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `good` (
  `topicstudentid` varchar(45) NOT NULL,
  `createtime` varchar(45) NOT NULL,
  `goodstudentid` varchar(45) NOT NULL,
  PRIMARY KEY (`topicstudentid`,`createtime`,`goodstudentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good`
--

LOCK TABLES `good` WRITE;
/*!40000 ALTER TABLE `good` DISABLE KEYS */;
/*!40000 ALTER TABLE `good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memo`
--

DROP TABLE IF EXISTS `memo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memo` (
  `studentid` varchar(30) NOT NULL,
  `createtime` varchar(45) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `detail` varchar(1000) DEFAULT NULL,
  `home` int(2) DEFAULT NULL COMMENT '首页推送 1:是 0:否',
  PRIMARY KEY (`studentid`,`createtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memo`
--

LOCK TABLES `memo` WRITE;
/*!40000 ALTER TABLE `memo` DISABLE KEYS */;
INSERT INTO `memo` VALUES ('12345','2018-03-29-16-10-25','完成数据结构笔记','今天学习第六章的知识          \n---------------------------------------\n完成关于B树的笔记               \n---------------------------------------\n复习链表结点的删除和添加\n--------------------------------------\n完成课后练习',1),('12345','2018-04-05-14-48-22','社团招新','计算机学社招新开始\n\n周三下午去大学生活动中心进行商讨招新相关事宜',1),('qq200258','2018-04-19-20-42-08','自习','1',1);
/*!40000 ALTER TABLE `memo` ENABLE KEYS */;
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
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `identity` int(11) DEFAULT NULL,
  `introduction` varchar(300) DEFAULT '这家伙很懒,什么也没留下',
  `isphonesecret` tinyint(1) DEFAULT '1',
  `ismailsecret` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1：学生\n2：教职工';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('12345','1','测试','男','信息科学技术学院','软件工程',2016,55,'13012345678','12345@qq.com',1,'这个人很懒，什么也没留下',1,0);
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

-- Dump completed on 2018-04-19 20:47:23
