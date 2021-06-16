/*
SQLyog Community v13.1.2 (64 bit)
MySQL - 5.5.62-log : Database - siberiandb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`siberiandb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `siberiandb`;

/*Table structure for table `ciudad` */

DROP TABLE IF EXISTS `ciudad`;

CREATE TABLE `ciudad` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `ciudad` */

insert  into `ciudad`(`Id`,`Name`,`CreateDate`) values 
(1,'Guayaquil','2021-06-15 10:30:50'),
(2,'Quito','2021-06-15 10:30:56');

/*Table structure for table `restaurante` */

DROP TABLE IF EXISTS `restaurante`;

CREATE TABLE `restaurante` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) DEFAULT NULL,
  `IdCiudad` int(11) DEFAULT NULL,
  `AforoNum` int(11) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `Rest_Ciu` (`IdCiudad`),
  CONSTRAINT `Rest_Ciu` FOREIGN KEY (`IdCiudad`) REFERENCES `ciudad` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `restaurante` */

insert  into `restaurante`(`Id`,`Name`,`IdCiudad`,`AforoNum`,`Phone`,`CreateDate`) values 
(1,'La Nana',1,20,'2423234','2021-06-15 10:34:46'),
(2,'La Nana ',2,10,'1231231','2021-06-15 10:35:00');

/* Procedure structure for procedure `Sp_Restaurantes` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_Restaurantes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Restaurantes`(
		in t char(1)
		, in _id int 
		, in _nam nvarchar(200) 
		, in _aforoNum int 
		, in _city inT 
		, in _phone nvarchar(20) 
		)
BEGin
		if (t = 'S')
		then
			SELECT 
			T0.Id
			, T0.Name 
			, T1.Id "city"
			, T0.AforoNum 
			, T0.Phone 
			FROM restaurante T0
			inNER JOin ciudad T1 ON T0.idCiudad = T1.Id;
		end if;
		
		IF (t = 'O')
		THEN
			SELECT 
			T0.Id
			, T0.Name 
			, T1.Id "city"
			, T0.AforoNum 
			, T0.Phone 
			FROM restaurante T0
			inNER JOin ciudad T1 ON T0.idCiudad = T1.Id
			WHERE T0.id = _id;
		END IF;

		IF (t = 'I')
		THEN
			inSERT inTO `restaurante` 
			(`Name`, `IdCiudad`, `AforoNum`, `Phone`)
			VALUES
			(_nam, _city, _aforoNum, _phone);
		END IF;

		IF (t = 'U')
		THEN
			UPDATE `restaurante` 
			SET
			`Name` = _nam, 
			`IdCiudad` = _city, 
			`AforoNum` = _aforoNum, 
			`Phone` = _phone
			WHERE `Id` = _id;
		END IF;
		
		IF (t = 'D')
		THEN
			DELETE FROM `restaurante` WHERE `Id` = _id;
		END IF;
	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
