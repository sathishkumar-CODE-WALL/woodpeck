-- MySQL dump 10.11
--
-- Host: localhost    Database: moviesdb
-- ------------------------------------------------------
-- Server version	5.0.41-community-nt

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
-- Table structure for table `edm_batch_file_info`
--

DROP TABLE IF EXISTS `edm_batch_file_info`;
CREATE TABLE `edm_batch_file_info` (
  `merchant_acc_no` varchar(50) default NULL,
  `file_name` varchar(100) default NULL,
  `file_type` int(11) default NULL,
  `file_status` int(11) default NULL,
  `date` date default NULL,
  `id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `edm_batch_file_info`
--

LOCK TABLES `edm_batch_file_info` WRITE;
/*!40000 ALTER TABLE `edm_batch_file_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `edm_batch_file_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `mid` int(11) NOT NULL auto_increment,
  `movie_name` varchar(45) NOT NULL,
  `lang` varchar(45) NOT NULL,
  `display_name` varchar(45) NOT NULL,
  `movie_icon` blob,
  `genre` varchar(45) NOT NULL,
  `casting` varchar(45) NOT NULL,
  `director` varchar(45) NOT NULL,
  `mdirector` varchar(45) NOT NULL,
  `overall_rating` double default NULL,
  PRIMARY KEY  (`mid`),
  UNIQUE KEY `mid_UNIQUE` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (3,'MANGATHA','TAMIL','MANGATHAA','','ACTION','AJITH','VP','YUVAN',5),(13,'Veeram new','TAMIL','VEERAM II','','ACTION','AJITH','CT','YUVAN',4.3),(16,'Asal new','TAMIL','ASAL','','ACTION','AJITH','CT','YUVAN',4.3),(19,'Asal new','TAMIL','ASAL','','ACTION','AJITH','CT','YUVAN',4.3),(20,'Asal new','TAMIL','ASAL','','ACTION','AJITH','CT','YUVAN',4.3),(21,'Asal new','TAMIL','ASAL','','ACTION','AJITH','CT','YUVAN',4.3),(23,'mugavarinew','TAMIL','mugavari','','ACTION','AJITH','CT','YUVAN',2.3),(24,'mugavarinew','TAMIL','mugavari','','ACTION','AJITH','CT','YUVAN',2.3),(25,'vedhalaam','TAMIL','vedhalaam','','ACTION','AJITH','SS','anirudh',2.3),(26,'theri','TAMIL','theri','','ACTION','VIJAY','SS','anirudh',2.3),(27,'Theri','TAMIL','Theri','','ACTION','VIJAY','CT','GV',1.3),(28,'Thala52','TAMIL','vedhalaam','','ACTION','AJITH','SS','anirudh',2.3);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `name` varchar(20) NOT NULL default '',
  `mobileno` varchar(20) default NULL,
  `prizeMoney` int(11) default NULL,
  `createddate` datetime default NULL,
  `id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('manpandian','9790898694',20,'2016-02-09 23:20:56',11),('prad','9789471874',0,'2016-02-10 09:21:55',23),('shrvenkataraman','9751645546',20,'2016-02-10 10:12:40',24),('asarvade','9994220084',20,'2016-02-10 10:14:23',25),('kapsharma','9677257028',30,'2016-02-10 10:37:37',26),('aiyyanar','9043202494',0,'2016-02-10 10:39:41',27),('sraavikanti','8939473928',0,'2016-02-10 10:45:48',29),('prashverma','9685596435',50,'2016-02-10 10:47:14',30),('kekt','7373757633',20,'2016-02-10 10:48:23',31),('semoorthy','9003202514',0,'2016-02-10 10:50:52',32),('vijbalakrishnan','8939219367',20,'2016-02-10 10:54:13',33),('vkhanna','9003288880',20,'2016-02-10 10:55:07',34),('kmarri','8056129007',30,'2016-02-10 10:56:09',35),('viponnusamy','9003444271',0,'2016-02-10 11:03:20',36),('nsattanathan','8675266780',30,'2016-02-10 11:08:39',37),('suramasamy','8840893456',30,'2016-02-10 11:10:31',38),('nidixit','9381253294',0,'2016-02-10 11:11:26',39),('skasturi','9052050887',30,'2016-02-10 11:12:13',40),('dvijayaraghavan','9841003516',0,'2016-02-10 11:13:07',41),('jbooraga','8608095659',0,'2016-02-10 11:13:49',42),('pmopidevi','9176689917',30,'2016-02-10 11:23:33',43),('niragam','8939068818',20,'2016-02-10 11:24:25',44),('vivthangathurai','9840476030',30,'2016-02-10 11:28:07',45),('vrajalingam','9940220526',50,'2016-02-10 11:29:42',46),('pvaradharaja','9940268432',0,'2016-02-10 11:30:23',47),('rnukala','9003162177',20,'2016-02-10 11:30:55',48),('krkj','9840100098',50,'2016-02-10 11:31:38',49),('ssarangan','9865350780',20,'2016-02-10 11:34:58',50),('srirakumar','8939689066',0,'2016-02-10 11:36:53',51),('rdevanathan','9841822935',30,'2016-02-10 11:38:50',52),('jmuthiyalu','8220488802',0,'2016-02-10 11:41:23',53),('parc','8939500145',0,'2016-02-10 11:42:21',54),('sujeethkumar','9840865333',0,'2016-02-10 11:43:10',55),('kavelayutham','9940227629',20,'2016-02-10 11:44:11',56),('dsama','7200558944',50,'2016-02-10 11:47:15',57),('mkrishnamoorthi','9791863649',20,'2016-02-10 11:48:17',58),('lkrishnamoorthy','9445128146',0,'2016-02-10 11:48:55',59),('senrajendran','9171634611',30,'2016-02-10 12:00:26',60),('athanaraj','9677610372',0,'2016-02-10 12:03:47',61),('pvijayk','9947367828',30,'2016-02-10 12:12:21',62),('prashgupta','8056124523',0,'2016-02-10 12:18:23',63),('spanguluri','9010600034',0,'2016-02-10 12:19:43',64),('ponsubramanian','9171316759',0,'2016-02-10 12:20:38',65),('lavk','9884145085',0,'2016-02-10 12:22:42',66),('vkalimuthu','9159 408058',20,'2016-02-10 12:25:57',67),('seagarwal','9790205798',50,'2016-02-10 12:26:31',68),('samohandoss','9944480741',20,'2016-02-10 12:27:07',69),('nsingla','9994635178',0,'2016-02-10 12:27:39',70),('smayakrishnan','9789407916',0,'2016-02-10 12:30:00',71),('dhkhandelwal','9597445237',0,'2016-02-10 12:35:26',72),('sidhar','9003137062',0,'2016-02-10 12:36:13',73),('eelanseran','9840018499',0,'2016-02-10 12:44:32',74),('kate','9443787465',20,'2016-02-10 12:45:13',75),('vakumar','9600649781',0,'2016-02-10 12:46:05',76),('bhmani','9486725398',0,'2016-02-10 12:46:57',77),('rselvarajan','9962325666',0,'2016-02-10 12:47:32',78),('bjayapragass','9962411150',0,'2016-02-10 12:48:07',79),('rboopalan','99994555056',50,'2016-02-10 12:48:43',80),('pchattopadhyay','7401132532',20,'2016-02-10 12:49:24',81),('spramanik','9159870099',20,'2016-02-10 12:50:16',82),('pharsh','7091667779',0,'2016-02-10 12:52:34',83),('hgarlapati','9848428245',50,'2016-02-10 12:53:27',84),('steja','7708608493',0,'2016-02-10 12:54:10',85),('rajanagarajan','9176849479',20,'2016-02-10 12:55:09',86),('prkhandelwal','8870518571',0,'2016-02-10 12:56:45',87),('srsrinivasan','9444016575',20,'2016-02-10 12:59:02',88),('povijayan','9791497888',20,'2016-02-10 13:10:19',89),('tchandramohan','9952048248',20,'2016-02-10 13:11:15',90),('msekaran','9962717542',30,'2016-02-10 13:12:28',91),('skubendhiran','9150758319',0,'2016-02-10 13:13:34',92),('anannataraja','9886390565',30,'2016-02-10 13:14:17',93),('kashaik','9282104318',20,'2016-02-10 13:15:32',94),('andevendran','9790821778',20,'2016-02-10 13:16:29',95),('knallathambi','9976916900',0,'2016-02-10 13:17:58',96),('dvinothkumar','9176637377',20,'2016-02-10 13:18:32',97),('aelangovan','9894489092',0,'2016-02-10 13:19:19',98),('rajk','8220096530',0,'2016-02-10 13:20:42',99),('moazharuddin','8682089707',50,'2016-02-10 13:21:40',100),('adevendran','9790413777',0,'2016-02-10 13:23:10',101),('srkanakasai','9789471874',20,'2016-02-10 13:24:53',102),('mchinnaannamalai','8056192180',20,'2016-02-10 13:26:05',103),('njayanth','7299303850',0,'2016-02-10 13:32:57',104),('pabdulrahiman','9940584104',20,'2016-02-10 13:41:45',105),('schakravarthy','9840611631',50,'2016-02-10 13:42:40',106),('skalaiselvan','7358579305',20,'2016-02-10 13:50:06',107),('khushah','7200184728',0,'2016-02-10 13:54:42',108),('akotha','9884316864',50,'2016-02-10 13:56:14',109),('lvelu','9884200059',50,'2016-02-10 14:35:40',110),('varumugam','9003140206',20,'2016-02-10 14:40:44',111),('sasnatarajan','9626513236',50,'2016-02-10 14:41:42',112),('nsivalingam','9884366549',0,'2016-02-10 14:42:22',113),('pganapathirao','9962283087',20,'2016-02-10 14:43:10',114),('lvairamani','9894327337',0,'2016-02-10 14:44:47',115),('pshekhar','8608809411',20,'2016-02-10 14:47:01',116),('sivj','9841738833',20,'2016-02-10 14:47:43',117),('sganeriwal','9087508581',0,'2016-02-10 14:48:50',118),('musinha','8695485448',20,'2016-02-10 14:49:26',119),('aarajagopalan','9943900174',20,'2016-02-10 14:50:31',120),('mumuniyasamy','9952598045',20,'2016-02-10 14:51:53',121),('svenkatakrishnan','9176967812',20,'2016-02-10 14:52:59',122),('sanantharaman','9940336759',50,'2016-02-10 14:54:06',123),('rsaminathan','9688344566',0,'2016-02-10 14:55:15',124),('praramachandran','9840656113',30,'2016-02-10 14:55:56',125),('kamuniyandi','9600888706',0,'2016-02-10 14:56:48',126),('spinninti','8124310039',50,'2016-02-10 15:07:06',127),('schakkravarthyra','9566132240',30,'2016-02-10 15:10:08',128);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating` (
  `rid` int(11) NOT NULL auto_increment,
  `mid` int(11) NOT NULL,
  `uid` int(11) default NULL,
  `acting` int(11) default '1',
  `direction` int(11) default '1',
  `story` int(11) default '1',
  `screenplay` int(11) default '1',
  `music` int(11) default '1',
  `comments` varchar(45) default NULL,
  PRIMARY KEY  (`rid`),
  UNIQUE KEY `rid_UNIQUE` (`rid`),
  KEY `FK_MID_idx` (`mid`),
  CONSTRAINT `FK_MID` FOREIGN KEY (`mid`) REFERENCES `movie` (`mid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (2,23,0,1,3,5,0,4,'good movie'),(3,23,0,3,3,1,0,4,'ok movie'),(4,23,0,4,4,5,0,4,'not bad movie'),(5,24,0,1,3,5,0,4,'good movie'),(6,24,0,3,3,1,0,4,'ok movie'),(7,24,0,4,4,5,0,4,'not bad movie'),(8,25,0,1,3,5,0,4,'good movie'),(9,25,0,3,3,1,0,4,'very good movie'),(10,25,0,4,4,5,0,4,'not bad movie'),(11,26,0,1,1,5,0,4,'badmovie'),(12,26,0,3,1,1,0,4,'very good movie'),(13,26,0,4,1,5,0,4,'not bad movie'),(14,27,0,1,3,5,0,4,'bad movie'),(15,27,0,3,3,1,0,4,'not ok movie'),(16,27,0,4,4,5,0,4,'not good movie'),(17,28,0,1,3,5,0,4,'good movie'),(18,28,0,3,3,1,0,4,'very good movie'),(19,28,0,4,4,5,0,4,'not bad movie');
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `email_id` varchar(45) NOT NULL,
  PRIMARY KEY  (`uid`,`email_id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`),
  UNIQUE KEY `email_id_UNIQUE` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2017-03-13  9:55:55
