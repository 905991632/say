/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.7.3-m13 : Database - tutor_web
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tutor_web` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tutor_web`;

/*Table structure for table `apply` */

DROP TABLE IF EXISTS `apply`;

CREATE TABLE `apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `requireId` int(11) NOT NULL COMMENT '需求id',
  `teacherId` int(11) NOT NULL COMMENT '申请人id',
  `permission` int(11) NOT NULL COMMENT '申请状态(成功、失败、审核中)',
  `type` varchar(5) NOT NULL COMMENT '订单还是预约',
  `createTime` datetime NOT NULL COMMENT '订单申请创建时间',
  PRIMARY KEY (`id`),
  KEY `requireId` (`requireId`),
  KEY `teacherId` (`teacherId`),
  CONSTRAINT `apply_ibfk_1` FOREIGN KEY (`requireId`) REFERENCES `requirement` (`id`),
  CONSTRAINT `apply_ibfk_3` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `apply` */

/*Table structure for table `appraisal` */

DROP TABLE IF EXISTS `appraisal`;

CREATE TABLE `appraisal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applyid` int(11) NOT NULL,
  `stucontent` varchar(200) DEFAULT NULL,
  `stuscore` int(11) DEFAULT NULL,
  `stutime` datetime DEFAULT NULL,
  `teacontent` varchar(200) DEFAULT NULL,
  `teascore` int(11) DEFAULT NULL,
  `teatime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `applyid` (`applyid`),
  CONSTRAINT `appraisal_ibfk_1` FOREIGN KEY (`applyid`) REFERENCES `apply` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `appraisal` */

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `title` varchar(20) NOT NULL COMMENT '文章标题',
  `content` varchar(200) NOT NULL COMMENT '文章内容',
  `picture` varchar(200) DEFAULT NULL COMMENT '文章图片',
  `createTime` datetime NOT NULL COMMENT '文章创建时间',
  `commentAmount` int(11) DEFAULT NULL COMMENT '评论数量',
  `collectAmount` int(11) DEFAULT NULL COMMENT '收藏数量',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `login` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `article` */

/*Table structure for table `collectarticle` */

DROP TABLE IF EXISTS `collectarticle`;

CREATE TABLE `collectarticle` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏表id',
  `userId` int(11) NOT NULL COMMENT '收藏者id',
  `articleId` int(11) NOT NULL COMMENT '文章id',
  `createTime` datetime NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `userid` (`userId`),
  KEY `articleid` (`articleId`),
  CONSTRAINT `collectarticle_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `login` (`id`),
  CONSTRAINT `collectarticle_ibfk_2` FOREIGN KEY (`articleId`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `collectarticle` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论表id',
  `userId` int(11) NOT NULL COMMENT '评论用户id',
  `articleId` int(11) NOT NULL COMMENT '评论文章id',
  `content` varchar(200) NOT NULL COMMENT '评论内容',
  `createTime` datetime NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`),
  KEY `userid` (`userId`),
  KEY `articleid` (`articleId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `login` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`articleId`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `userName` varchar(16) NOT NULL COMMENT '账号',
  `passWord` varchar(16) NOT NULL COMMENT '密码',
  `userType` varchar(5) NOT NULL COMMENT '用户类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `login` */

insert  into `login`(`id`,`userName`,`passWord`,`userType`) values (12,'905991632','20190219','学生'),(13,'3362996718','20190219','教师'),(15,'15626463411','20190219','学生'),(16,'905991631','123456','学生'),(17,'905991633','123456','学生'),(18,'905991634','123456','学生'),(19,'905991635','123456','学生'),(20,'905991636','123456','学生'),(21,'905991637','123456','学生'),(22,'905991638','123456','学生');

/*Table structure for table `requirement` */

DROP TABLE IF EXISTS `requirement`;

CREATE TABLE `requirement` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '需求订单',
  `permission` int(11) NOT NULL COMMENT '订单可见、不可见',
  `studentId` int(11) NOT NULL COMMENT '订单发起人',
  `course` varchar(50) NOT NULL COMMENT '授课课程',
  `sex` varchar(5) NOT NULL COMMENT '性别要求',
  `area` varchar(50) NOT NULL COMMENT '授课地址',
  `price` varchar(100) NOT NULL COMMENT '薪酬',
  `detail` varchar(200) DEFAULT NULL COMMENT '具体要求',
  `createTime` datetime NOT NULL COMMENT '创单时间',
  PRIMARY KEY (`id`),
  KEY `studentid` (`studentId`),
  CONSTRAINT `requirement_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `requirement` */

/*Table structure for table `stuappraisal` */

DROP TABLE IF EXISTS `stuappraisal`;

CREATE TABLE `stuappraisal` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价表id',
  `applyId` int(11) NOT NULL COMMENT '订单id',
  `content` varchar(200) DEFAULT NULL COMMENT '评价内容',
  `score` int(11) DEFAULT NULL COMMENT '评价分数',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `permission` int(11) NOT NULL COMMENT '评价状态(0未评价,1已评价)',
  PRIMARY KEY (`id`),
  KEY `applyId` (`applyId`),
  CONSTRAINT `stuappraisal_ibfk_1` FOREIGN KEY (`applyId`) REFERENCES `apply` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `stuappraisal` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `photo` varchar(200) NOT NULL COMMENT '头像',
  `name` varchar(15) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(1) DEFAULT NULL COMMENT '性别',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号',
  `address` varchar(200) DEFAULT NULL COMMENT '省市',
  `area` varchar(200) DEFAULT NULL COMMENT '区',
  `loginTime` datetime NOT NULL COMMENT '最近登录时间',
  `loginId` int(11) NOT NULL COMMENT '登录id',
  PRIMARY KEY (`id`),
  KEY `loginId` (`loginId`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`loginId`) REFERENCES `login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`id`,`photo`,`name`,`sex`,`age`,`mobile`,`address`,`area`,`loginTime`,`loginId`) values (5,'/images/photo/student.jpg','陈晓佳','男',22,'15626463411','广东,中山',NULL,'2018-01-11 13:05:06',12),(6,'/images/photo/student.jpg','陈晓佳','男',22,'15626463411','广东,中山',NULL,'2018-01-11 14:38:27',15),(7,'/images/photo/student.jpg','陈晓佳','女',22,'15626463411','广东,中山',NULL,'2018-01-14 17:43:46',16),(8,'/images/photo/student.jpg','陈晓佳','男',21,'15626463411','广东,中山',NULL,'2018-01-14 17:44:45',17),(9,'/images/photo/student.jpg','陈晓佳','女',21,'15626463411','广东,中山',NULL,'2018-01-14 17:45:09',18),(10,'/images/photo/student.jpg','骆婉婷','男',22,'15626463411','广东,中山',NULL,'2018-01-14 17:46:03',19),(11,'/images/photo/student.jpg','骆婉婷','女',22,'15626463411','广东,中山',NULL,'2018-01-14 17:46:30',20),(12,'/images/photo/student.jpg','骆婉婷','男',21,'15626463411','广东,中山',NULL,'2018-01-14 17:46:48',21),(13,'/images/photo/student.jpg','骆婉婷','女',21,'15626463411','广东,中山',NULL,'2018-01-14 17:47:19',22);

/*Table structure for table `teaappraisal` */

DROP TABLE IF EXISTS `teaappraisal`;

CREATE TABLE `teaappraisal` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价表id',
  `applyId` int(11) NOT NULL COMMENT '申请单id',
  `content` varchar(200) DEFAULT NULL COMMENT '评价内容',
  `score` int(11) DEFAULT NULL COMMENT '评价分数',
  `createtime` datetime DEFAULT NULL COMMENT '评价时间',
  `permission` int(11) NOT NULL COMMENT '评价状态(0未评价,1已评价)',
  PRIMARY KEY (`id`),
  KEY `applyId` (`applyId`),
  CONSTRAINT `teaappraisal_ibfk_1` FOREIGN KEY (`applyId`) REFERENCES `apply` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teaappraisal` */

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id，连接login表',
  `permission` int(11) NOT NULL COMMENT '0,1,2审核、通过、不通过',
  `photo` varchar(200) NOT NULL COMMENT '头像',
  `idcard` varchar(200) DEFAULT NULL COMMENT '身份证图片',
  `name` varchar(15) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(1) DEFAULT NULL COMMENT '性别',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号',
  `courses` varchar(200) DEFAULT NULL COMMENT '辅导课程(多个)',
  `address` varchar(200) DEFAULT NULL COMMENT '辅导省市',
  `area` varchar(200) DEFAULT NULL COMMENT '辅导区域',
  `price` varchar(50) DEFAULT NULL COMMENT '薪资要求',
  `loginTime` datetime NOT NULL COMMENT '最近登录时间',
  `loginId` int(11) NOT NULL COMMENT '登录id',
  PRIMARY KEY (`id`),
  KEY `loginId` (`loginId`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`loginId`) REFERENCES `login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`permission`,`photo`,`idcard`,`name`,`sex`,`age`,`mobile`,`courses`,`address`,`area`,`price`,`loginTime`,`loginId`) values (2,0,'/images/photo/teacher.jpg',NULL,'陈晓佳','女',23,'15626463411',NULL,'广东,中山',NULL,NULL,'2018-01-11 13:07:38',13);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
