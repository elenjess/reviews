-- Adminer 4.6.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

USE `IdTV`;

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `client`;

DROP TABLE IF EXISTS `consoles`;
CREATE TABLE `consoles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(30) NOT NULL,
  `locations_id` int(11) NOT NULL,
  `videos_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `locations_id` (`locations_id`),
  KEY `videos_id` (`videos_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `consoles_ibfk_1` FOREIGN KEY (`locations_id`) REFERENCES `locations` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `consoles_ibfk_2` FOREIGN KEY (`locations_id`) REFERENCES `locations` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `consoles_ibfk_3` FOREIGN KEY (`videos_id`) REFERENCES `videos` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `consoles_ibfk_4` FOREIGN KEY (`locations_id`) REFERENCES `locations` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `consoles_ibfk_5` FOREIGN KEY (`videos_id`) REFERENCES `videos` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `consoles_ibfk_6` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `consoles`;

DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(30) NOT NULL,
  `types_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `types_id` (`types_id`),
  CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`types_id`) REFERENCES `types` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`types_id`) REFERENCES `types` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `locations`;

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `types_id` int(11) NOT NULL,
  `consoles_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `location_id` (`location_id`),
  KEY `types_id` (`types_id`),
  KEY `consoles_id` (`consoles_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`types_id`) REFERENCES `types` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `order_ibfk_4` FOREIGN KEY (`consoles_id`) REFERENCES `consoles` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `order`;

DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(20) NOT NULL,
  `order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `order_status_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `order_status_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `order_status`;

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `videos_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  KEY `videos_id` (`videos_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`videos_id`) REFERENCES `videos` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `schedule`;

DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `types`;

DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video` geometrycollection NOT NULL,
  `duration` time NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `client_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `videos_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `videos_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `videos`;

DROP TABLE IF EXISTS `video_status`;
CREATE TABLE `video_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(20) NOT NULL,
  `videos_id` int(11) NOT NULL,
  `console_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `videos_id` (`videos_id`),
  KEY `console_id` (`console_id`),
  CONSTRAINT `video_status_ibfk_1` FOREIGN KEY (`videos_id`) REFERENCES `videos` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `video_status_ibfk_2` FOREIGN KEY (`console_id`) REFERENCES `consoles` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `video_status`;

-- 2018-08-02 19:13:56
