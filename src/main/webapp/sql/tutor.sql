/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.14 : Database - tutor_web
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
  `studentId` int(11) NOT NULL COMMENT '发起人id',
  `teacherId` int(11) NOT NULL COMMENT '申请人id',
  `permission` int(11) NOT NULL COMMENT '申请状态(成功1、失败2、审核中0、已完成3)',
  `type` varchar(5) NOT NULL COMMENT '订单还是预约',
  `createTime` datetime NOT NULL COMMENT '订单申请创建时间',
  PRIMARY KEY (`id`),
  KEY `requireId` (`requireId`),
  KEY `teacherId` (`teacherId`),
  CONSTRAINT `apply_ibfk_1` FOREIGN KEY (`requireId`) REFERENCES `requirement` (`id`),
  CONSTRAINT `apply_ibfk_3` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `apply` */

insert  into `apply`(`id`,`requireId`,`studentId`,`teacherId`,`permission`,`type`,`createTime`) values (11,13,11,4,2,'订单','2018-01-30 19:54:46'),(12,10,11,4,2,'订单','2018-01-30 19:54:57'),(13,10,11,4,3,'订单','2018-01-30 19:56:05'),(14,13,11,4,2,'订单','2018-01-30 20:03:36'),(15,14,11,4,3,'预约','2018-01-30 20:13:40');

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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

/*Data for the table `login` */

insert  into `login`(`id`,`userName`,`passWord`,`userType`) values (12,'905991632','20190219','学生'),(13,'3362996718',',./;\'\\','教师'),(15,'15626463411','20190219','学生'),(20,'999999','20190219','学生'),(21,'905991633','20190219','教师'),(22,'905991630','20190219','学生'),(23,'905991634','20190219','学生'),(24,'905991635','20190219','学生'),(25,'15626463410','20190219','教师'),(26,'15626463412','20190219','教师'),(27,'15626463413','20190219','教师'),(28,'15626463414','20190219','教师'),(29,'15626463415','20190219','教师'),(30,'15626463416','20190219','教师'),(31,'15626463417','20190219','教师'),(32,'15626463418','20190219','教师'),(33,'15626463421','20190219','教师'),(34,'15626463422','20190219','教师'),(35,'15626463423','20190219','教师'),(36,'15626463424','20190219','教师'),(37,'15626463425','20190219','教师'),(38,'15626463426','20190219','教师'),(39,'15626463427','20190219','教师'),(40,'15626463428','20190219','教师'),(41,'15626463429','20190219','教师'),(42,'15626463420','20190219','教师'),(43,'905991601','20190219','学生'),(44,'905991602','20190219','学生'),(45,'905991603','20190219','学生'),(46,'905991604','20190219','学生'),(47,'905991605','20190219','学生'),(48,'905991606','20190219','学生'),(49,'905991607','20190219','学生'),(50,'905991608','20190219','学生'),(51,'905991609','20190219','学生'),(52,'905991610','20190219','学生'),(53,'905991611','20190219','学生'),(54,'905991612','20190219','学生'),(55,'905991613','20190219','学生'),(56,'905991614','20190219','学生'),(57,'905991615','20190219','学生'),(58,'905991616','20190219','学生'),(59,'905991617','20190219','学生'),(60,'905991618','20190219','学生'),(61,'905991619','20190219','学生'),(62,'905991620','20190219','学生');

/*Table structure for table `requirement` */

DROP TABLE IF EXISTS `requirement`;

CREATE TABLE `requirement` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '需求订单',
  `permission` int(11) NOT NULL COMMENT '订单可见、不可见',
  `studentId` int(11) NOT NULL COMMENT '订单发起人',
  `course` varchar(50) NOT NULL COMMENT '授课课程',
  `sex` varchar(5) NOT NULL COMMENT '性别要求',
  `address` varchar(50) NOT NULL,
  `area` varchar(50) NOT NULL COMMENT '授课地址',
  `price` varchar(100) NOT NULL COMMENT '薪酬',
  `detail` varchar(200) DEFAULT NULL COMMENT '具体要求',
  `createTime` datetime NOT NULL COMMENT '创单时间',
  PRIMARY KEY (`id`),
  KEY `studentid` (`studentId`),
  CONSTRAINT `requirement_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `requirement` */

insert  into `requirement`(`id`,`permission`,`studentId`,`course`,`sex`,`address`,`area`,`price`,`detail`,`createTime`) values (1,0,5,'一年级数学','男女','广东,广州','从化','100元/小时','需要一个耐心细心的老师','2018-01-16 14:50:21'),(2,0,5,'六年级语文','男女','广东,广州','花都区','1000元/星期','其他的面谈','2018-01-18 10:03:10'),(3,0,5,'初一语文','男女','广东,广州','番禺区','1000元/星期','电联','2018-01-18 10:08:47'),(4,0,5,'高三政治','男女','广东,广州','荔湾区','1000元/星期','无','2018-01-18 10:10:45'),(5,0,5,'五年级语文','男','广东,广州','芳村区','1000元/星期','ytou','2018-01-18 10:21:36'),(6,0,5,'二年级英语','女','广东,广州','东山区','1000元/星期','1','2018-01-18 10:36:31'),(7,0,5,'一年级英语','男女','广东,广州','白云区','1000元/星期','1','2018-01-18 10:39:20'),(9,0,5,'三年级语文','男女','广东,广州','荔湾区','1000元/星期','1','2018-01-18 10:40:48'),(10,1,11,'五年级语文','男女','广东,中山','横栏镇','100元/小时','只要有进步，钱不是问题','2018-01-24 19:00:32'),(11,0,11,'高二历史','男女','广东,中山','古镇镇','150/小时','有钱任性','2018-01-24 20:57:36'),(12,0,11,'高三政治','男女','广东,中山','坦洲镇','1000元/星期','有钱任性','2018-01-29 12:45:00'),(13,0,11,'一年级语文','男女','广东,中山','石岐街道','1000元/星期','1','2018-01-29 13:13:34'),(14,1,11,'高三政治','男女','广东,中山','坦洲镇','100元/小时','听说你政治教的不错哟','2018-01-30 20:13:40');

/*Table structure for table `stuappraisal` */

DROP TABLE IF EXISTS `stuappraisal`;

CREATE TABLE `stuappraisal` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '(老师评价学生)评价表id',
  `applyId` int(11) NOT NULL COMMENT '申请表id',
  `studentid` int(11) NOT NULL COMMENT '学生id',
  `teacherid` int(11) NOT NULL COMMENT '教师id',
  `content` varchar(200) DEFAULT NULL COMMENT '评价内容',
  `score` int(11) DEFAULT NULL COMMENT '评价分数',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `permission` int(11) NOT NULL COMMENT '评价状态(0未评价,1已评价)',
  PRIMARY KEY (`id`),
  KEY `applyId` (`applyId`),
  CONSTRAINT `stuappraisal_ibfk_1` FOREIGN KEY (`applyId`) REFERENCES `apply` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `stuappraisal` */

insert  into `stuappraisal`(`id`,`applyId`,`studentid`,`teacherid`,`content`,`score`,`createTime`,`permission`) values (6,13,11,4,'学生很好学',4,'2018-01-30 20:00:57',1),(7,15,11,4,'学生十分好学啊',5,'2018-01-30 20:26:25',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`id`,`photo`,`name`,`sex`,`age`,`mobile`,`address`,`area`,`loginTime`,`loginId`) values (5,'images/student/photo/student.jpg','陈晓佳','男',22,'15626463411','广东,广州',NULL,'2018-01-24 18:25:21',12),(6,'images/student/photo/student.jpg','陈晓佳','男',22,'15626463411','广东,中山',NULL,'2018-01-11 14:38:27',15),(7,'images/student/photo/student.jpg','陈晓佳','男',22,'15626463411','广东,中山',NULL,'2018-01-17 09:49:21',20),(8,'images/student/photo/student.jpg','陈晓佳','男',22,'15626463411','广东,中山',NULL,'2018-01-24 18:45:00',22),(9,'images/student/photo/student.jpg','陈晓佳','男',22,'15626463411','广东,中山',NULL,'2018-01-17 12:02:10',23),(10,'images/student/photo/student.jpg','陈晓佳','男',22,'15626463411','广东,中山',NULL,'2018-01-17 12:31:48',24),(11,'images/student/photo/f9fef3c1-1bc8-4124-98af-012891e64b87.jpg','学生1','男',1,'15626463411','广东,中山','横栏镇','2018-02-01 20:11:25',43),(12,'images/student/photo/student.jpg','学生2','女',2,'15626463411','广东,中山',NULL,'2018-01-24 20:00:59',44),(13,'images/student/photo/student.jpg','学生3','男',3,'15626463411','广东,中山',NULL,'2018-01-23 14:45:45',45),(14,'images/student/photo/student.jpg','学生4','女',4,'15626463411','广东,中山',NULL,'2018-01-23 14:57:47',46),(15,'images/student/photo/student.jpg','学生5','女',5,'15626463411','广东,中山',NULL,'2018-01-23 14:58:24',47),(16,'images/student/photo/student.jpg','学生6','女',6,'15626463411','广东,中山',NULL,'2018-01-23 15:04:10',48),(17,'images/student/photo/student.jpg','学生7','男',7,'15626463411','广东,中山',NULL,'2018-01-23 15:04:33',49),(18,'images/student/photo/student.jpg','学生8','女',8,'15626463411','广东,中山',NULL,'2018-01-23 15:05:00',50),(19,'images/student/photo/student.jpg','学生9','男',9,'15626463411','广东,中山',NULL,'2018-01-27 21:36:43',51),(20,'images/student/photo/student.jpg','学生10','女',10,'15626463411','广东,中山',NULL,'2018-01-23 15:06:10',52),(21,'images/student/photo/student.jpg','学生11','男',11,'15626463411','广东,中山',NULL,'2018-01-23 15:07:12',53),(22,'images/student/photo/student.jpg','学生12','女',12,'15626463411','广东,中山',NULL,'2018-01-23 15:07:48',54),(23,'images/student/photo/student.jpg','学生13','男',13,'15626463411','广东,中山',NULL,'2018-01-23 15:08:17',55),(24,'images/student/photo/student.jpg','学生14','女',14,'15626463411','广东,中山',NULL,'2018-01-23 15:09:38',56),(25,'images/student/photo/student.jpg','学生15','男',15,'15626463411','广东,中山',NULL,'2018-01-23 15:09:55',57),(26,'images/student/photo/student.jpg','学生16','女',16,'15626463411','广东,中山',NULL,'2018-01-23 15:10:22',58),(27,'images/student/photo/student.jpg','学生17','男',17,'15626463411','广东,中山',NULL,'2018-01-23 15:10:49',59),(28,'images/student/photo/student.jpg','学生18','女',18,'15626463411','广东,中山',NULL,'2018-01-23 15:12:21',60),(29,'images/student/photo/student.jpg','学生19','男',19,'15626463411','广东,中山',NULL,'2018-01-23 15:12:45',61),(30,'images/student/photo/student.jpg','学生20','女',20,'15626463411','广东,中山',NULL,'2018-01-23 15:13:06',62);

/*Table structure for table `teaappraisal` */

DROP TABLE IF EXISTS `teaappraisal`;

CREATE TABLE `teaappraisal` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '(学生评价老师)评价表id',
  `applyId` int(11) NOT NULL COMMENT '申请单id',
  `teacherid` int(11) NOT NULL COMMENT '老师id',
  `studentid` int(11) NOT NULL COMMENT '学生id',
  `content` varchar(200) DEFAULT NULL COMMENT '评价内容',
  `score` int(11) DEFAULT NULL COMMENT '评价分数',
  `createtime` datetime DEFAULT NULL COMMENT '评价时间',
  `permission` int(11) NOT NULL COMMENT '评价状态(0未评价,1已评价)',
  PRIMARY KEY (`id`),
  KEY `applyId` (`applyId`),
  CONSTRAINT `teaappraisal_ibfk_1` FOREIGN KEY (`applyId`) REFERENCES `apply` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `teaappraisal` */

insert  into `teaappraisal`(`id`,`applyId`,`teacherid`,`studentid`,`content`,`score`,`createtime`,`permission`) values (6,13,4,11,'教师教得还行',3,'2018-01-30 20:01:33',1),(7,15,4,11,'这老师教得相当的不错',5,'2018-01-30 20:25:46',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`permission`,`photo`,`idcard`,`name`,`sex`,`age`,`mobile`,`courses`,`address`,`area`,`price`,`loginTime`,`loginId`) values (2,0,'images/teacher/photo/teacher.jpg',NULL,'教师1','女',23,'15626463411',NULL,'广东,广州',NULL,NULL,'2018-01-24 18:43:14',13),(3,0,'images/teacher/photo/teacher.jpg',NULL,'教师2','男',22,'15626463411',NULL,'广东,广州',NULL,NULL,'2018-01-17 09:49:51',21),(4,0,'images/teacher/photo/teacher.jpg',NULL,'教师3','男',11,'15626463411',NULL,'广东,中山',NULL,NULL,'2018-01-30 19:54:25',25),(5,0,'images/teacher/photo/teacher.jpg','images/d6be80fa-51e1-4a6c-9a5f-df1dea0feed4.jpg','教师4','女',4,'15626463411','二年级语文,二年级数学,二年级英语,三年级语文,三年级数学','广东,中山','西区街道,南区街道,五桂山街道,火炬开发区,黄圃镇','100元/小时','2018-01-29 20:22:23',26),(6,0,'images/teacher/photo/teacher.jpg','images/7db6166f-99e4-460e-83b8-0b32435ac25f.jpg','教师5','男',5,'15626463411','一年级英语,二年级语文,二年级数学,二年级英语,三年级语文','广东,中山','五桂山街道,火炬开发区,黄圃镇','100元/小时','2018-01-29 13:16:30',27),(7,0,'images/teacher/photo/teacher.jpg','images/cc8508a0-dc57-441a-b382-23d1ebea8f83.jpg','教师6','女',6,'15626463411','二年级数学,二年级英语,三年级语文,三年级数学,三年级英语','广东,中山','南区街道,五桂山街道,火炬开发区,黄圃镇,南头镇','100元/小时','2018-01-30 18:58:21',28),(8,0,'images/teacher/photo/teacher.jpg','images/d131939c-d937-4a5b-b6e9-df5deebc285d.jpg','教师7','女',7,'15626463411','五年级数学,五年级英语,六年级语文,六年级数学,六年级英语','广东,中山','东区街道,西区街道,南区街道,五桂山街道,神湾镇','100元/小时','2018-01-24 18:01:30',29),(9,0,'images/teacher/photo/teacher.jpg','images/b6a3ca23-997d-43bb-b14d-574ff52d1b0a.jpg','教师8','男',8,'15626463411','二年级英语,三年级语文,三年级数学,三年级英语,四年级语文','广东,中山','东区街道,西区街道,南区街道,五桂山街道,火炬开发区','100元/小时','2018-01-29 19:46:09',30),(10,0,'images/teacher/photo/teacher.jpg',NULL,'教师9','女',19,'15626463411',NULL,'广东,中山',NULL,NULL,'2018-01-23 13:41:33',31),(11,0,'images/teacher/photo/teacher.jpg',NULL,'教师10','女',31,'15626463411',NULL,'广东,中山',NULL,NULL,'2018-01-23 13:42:17',32),(12,0,'images/teacher/photo/teacher.jpg',NULL,'教师11','男',11,'15626463411',NULL,'广东,中山',NULL,NULL,'2018-01-23 13:43:26',33),(13,0,'images/teacher/photo/teacher.jpg',NULL,'教师12','女',35,'15626463411',NULL,'广东,中山',NULL,NULL,'2018-01-23 13:53:40',34),(14,0,'images/teacher/photo/teacher.jpg',NULL,'教师13','男',13,'15626463411',NULL,'广东,中山',NULL,NULL,'2018-01-23 13:54:21',35),(15,0,'images/teacher/photo/teacher.jpg',NULL,'教师14','女',24,'15626463411',NULL,'广东,中山',NULL,NULL,'2018-01-23 13:55:09',36),(16,0,'images/teacher/photo/teacher.jpg',NULL,'教师15','男',25,'15626463411',NULL,'广东,中山',NULL,NULL,'2018-01-23 14:31:05',37),(17,0,'images/teacher/photo/teacher.jpg',NULL,'教师16','女',26,'15626463411',NULL,'广东,中山',NULL,NULL,'2018-01-23 14:31:47',38),(18,0,'images/teacher/photo/teacher.jpg',NULL,'教师17','男',27,'15626463411',NULL,'广东,中山',NULL,NULL,'2018-01-23 14:32:23',39),(19,0,'images/teacher/photo/teacher.jpg',NULL,'教师18','女',28,'15626463411',NULL,'广东,中山',NULL,NULL,'2018-01-29 21:08:06',40),(20,0,'images/teacher/photo/teacher.jpg',NULL,'教师19','男',29,'15626463411',NULL,'广东,中山',NULL,NULL,'2018-01-23 14:34:26',41),(21,0,'images/teacher/photo/teacher.jpg',NULL,'教师20','女',20,'15626463411',NULL,'广东,中山',NULL,NULL,'2018-01-23 14:41:18',42);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
