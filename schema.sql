# Sequel Pro dump
# Version 2210
# http://code.google.com/p/sequel-pro
#
# Host: 127.0.0.1 (MySQL 5.1.44-log)
# Database: caketrek_default
# Generation Time: 2013-01-28 14:42:28 +0000
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table badges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `badges`;

CREATE TABLE `badges` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(100) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `badges` WRITE;
/*!40000 ALTER TABLE `badges` DISABLE KEYS */;
INSERT INTO `badges` (`id`,`name`,`label`,`description`,`created`,`modified`)
VALUES
	(1,'rookie','Rookie','Premiers pas',NULL,NULL),
	(2,'first_blood','First Blood','Première Journey qui a été annulée',NULL,NULL),
	(3,'natural_born_leader','Natural Born Leader','A organisé plus de 10 journeys',NULL,NULL),
	(4,'walker','Walker','A participé à au moins 5 journeys',NULL,NULL);

/*!40000 ALTER TABLE `badges` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table badges_objects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `badges_objects`;

CREATE TABLE `badges_objects` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `badge_id` int(11) unsigned DEFAULT NULL,
  `object_id` int(11) unsigned DEFAULT NULL,
  `object` char(30) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

LOCK TABLES `badges_objects` WRITE;
/*!40000 ALTER TABLE `badges_objects` DISABLE KEYS */;
INSERT INTO `badges_objects` (`id`,`badge_id`,`object_id`,`object`,`created`)
VALUES
	(21,3,2,'Tourist','2013-01-28 13:58:57'),
	(20,2,2,'Tourist','2013-01-28 13:58:57'),
	(29,4,1,'Tourist','2013-01-28 15:02:14'),
	(28,1,1,'Tourist','2013-01-28 15:02:14'),
	(26,1,1,'Guide','2013-01-28 15:01:34'),
	(27,7,2,'Zone','2013-01-28 15:01:50');

/*!40000 ALTER TABLE `badges_objects` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table badges_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `badges_users`;

CREATE TABLE `badges_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `badge_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

LOCK TABLES `badges_users` WRITE;
/*!40000 ALTER TABLE `badges_users` DISABLE KEYS */;
INSERT INTO `badges_users` (`id`,`badge_id`,`user_id`)
VALUES
	(1,1,1),
	(2,3,1),
	(3,3,2),
	(4,1,4),
	(5,2,1);

/*!40000 ALTER TABLE `badges_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table guides
# ------------------------------------------------------------

DROP TABLE IF EXISTS `guides`;

CREATE TABLE `guides` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `slogan` varchar(200) DEFAULT NULL,
  `description` text,
  `tourist_id` int(11) DEFAULT NULL,
  `validated` tinyint(3) unsigned DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `guides` WRITE;
/*!40000 ALTER TABLE `guides` DISABLE KEYS */;
INSERT INTO `guides` (`id`,`slogan`,`description`,`tourist_id`,`validated`,`created`,`modified`)
VALUES
	(1,'il aime la montagne','',2,1,'2013-01-27 16:31:08','2013-01-27 16:31:26');

/*!40000 ALTER TABLE `guides` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table journeys
# ------------------------------------------------------------

DROP TABLE IF EXISTS `journeys`;

CREATE TABLE `journeys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tourist_id` int(11) unsigned DEFAULT NULL,
  `guide_id` int(11) unsigned DEFAULT NULL,
  `track_id` int(11) unsigned DEFAULT NULL,
  `zone_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `about` text,
  `body` text,
  `public` tinyint(3) unsigned DEFAULT '0',
  `crew` tinyint(4) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table medias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `medias`;

CREATE TABLE `medias` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ref` varchar(60) DEFAULT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ref` (`ref`),
  KEY `ref_id` (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

LOCK TABLES `medias` WRITE;
/*!40000 ALTER TABLE `medias` DISABLE KEYS */;
INSERT INTO `medias` (`id`,`ref`,`ref_id`,`file`,`position`)
VALUES
	(1,'Tourist',1,'/uploads/2013/01/llv01.jpg',0),
	(2,'Tourist',2,'/uploads/2013/01/llv02.JPG',0),
	(3,'Tourist',1,'/profile/2013/1/1/1.jpg',0),
	(4,'Tourist',1,'/uploads/profiles/2013/1/1/1.jpg',0),
	(5,'Tourist',1,'/uploads/profiles/2013/1/1/1-1.jpg',0);

/*!40000 ALTER TABLE `medias` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tourists
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tourists`;

CREATE TABLE `tourists` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `bio` text,
  `media_id` int(11) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `tourists` WRITE;
/*!40000 ALTER TABLE `tourists` DISABLE KEYS */;
INSERT INTO `tourists` (`id`,`first_name`,`last_name`,`bio`,`media_id`,`user_id`,`created`,`modified`)
VALUES
	(1,'Gaspard','Beernaert','Il aime les grandes plaines de neige, il veut un yak',5,1,NULL,'2013-01-28 15:02:14'),
	(2,'Jo','Bo','Depuis tout petit, il aimait la glace à la chantilly',2,2,NULL,'2013-01-28 13:58:57');

/*!40000 ALTER TABLE `tourists` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tourists_friends
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tourists_friends`;

CREATE TABLE `tourists_friends` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tourist_id` int(11) unsigned DEFAULT NULL,
  `friend_id` int(11) DEFAULT NULL,
  `status` char(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table tracks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tracks`;

CREATE TABLE `tracks` (
  `id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(150) NOT NULL,
  `email` varchar(200) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`username`,`password`,`email`,`created`,`updated`)
VALUES
	(1,'gasp','pass','gaspard@gmail.com','2013-01-24 13:29:28','2013-01-25 10:59:58'),
	(2,'john','pass','jo@lamo.uk','2013-01-24 13:29:55','2013-01-24 16:30:15'),
	(3,'martha','pass','martha@yahoo.com','2013-01-24 18:18:16','2013-01-24 18:18:16'),
	(4,'joseph','pass','joseh@yahoo.com','2013-01-24 18:19:05','2013-01-24 18:19:05'),
	(5,'veteran','pass','veteranmartha@yahoo.com','2013-01-24 18:19:34','2013-01-24 18:19:34'),
	(6,'patrick','pass','patrick@yahoo.com','2013-01-24 18:20:25','2013-01-24 18:20:25'),
	(7,'emile','pass','emile@yahoo.com','2013-01-24 18:57:35',NULL),
	(8,'ernesto','pass','ernesto@yahoo.com','2013-01-24 18:57:49',NULL),
	(9,'peter','pass','peter@yahoo.com','2013-01-24 18:57:53',NULL),
	(10,'beber','pass','beber@yahoo.com','2013-01-24 18:57:57',NULL),
	(11,'jack','pass','jack@yahoo.com','2013-01-24 18:58:00',NULL),
	(12,'greg','pass','greg@yahoo.com','2013-01-24 18:58:15',NULL),
	(13,'emilio','pass','emilio@yahoo.com','2013-01-24 18:58:29',NULL),
	(14,'michael','pass','michael@yahoo.com','2013-01-24 18:58:45',NULL),
	(15,'juan','pass','juan@yahoo.com','2013-01-24 18:59:07',NULL),
	(16,'wolfgang','pass','wolfgang@yahoo.com','2013-01-24 18:59:21',NULL),
	(17,'dieter','pass','dieter@yahoo.com','2013-01-24 18:59:41',NULL),
	(18,'sam','pass','sam@yahoo.com','2013-01-24 18:59:51',NULL),
	(19,'micah','pass','micah@yahoo.com','2013-01-24 19:00:06',NULL),
	(20,'ferdinand','pass','ferdinand@yahoo.com','2013-01-24 19:00:33',NULL),
	(21,'jekyll','pass','jekyll@yahoo.com','2013-01-24 19:00:49',NULL),
	(22,'hide','pass','hide@yahoo.com','2013-01-24 19:01:32',NULL),
	(23,'sergey','pass','sergey@yahoo.com','2013-01-24 19:33:30','2013-01-24 19:33:30'),
	(24,'maria','pass','maria@yahoo.com','2013-01-24 19:36:44','2013-01-24 19:36:44');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table zones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `zones`;

CREATE TABLE `zones` (
  `id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;






/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
