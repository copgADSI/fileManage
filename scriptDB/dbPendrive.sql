
-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.4.18-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para pendrive
CREATE DATABASE IF NOT EXISTS `pendrive` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `pendrive`;

-- Volcando estructura para tabla pendrive.category
CREATE TABLE IF NOT EXISTS `category` (
  `CategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `Category` varchar(12) NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla pendrive.category: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
REPLACE INTO `category` (`CategoryId`, `Category`, `Description`) VALUES
	(1, 'Trabajos ', 'T');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Volcando estructura para tabla pendrive.file
CREATE TABLE IF NOT EXISTS `file` (
  `FileId` int(11) NOT NULL AUTO_INCREMENT,
  `FileLocation` varchar(300) NOT NULL,
  `FileView` varchar(100) NOT NULL,
  `FileName` varchar(40) NOT NULL,
  `FileType` varchar(10) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `FileDateAdded` datetime NOT NULL,
  `FileLastUpdate` datetime NOT NULL,
  `Downloads` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`FileId`),
  KEY `fk_categoryId` (`CategoryId`),
  CONSTRAINT `fk_categoryId` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla pendrive.file: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
REPLACE INTO `file` (`FileId`, `FileLocation`, `FileView`, `FileName`, `FileType`, `CategoryId`, `FileDateAdded`, `FileLastUpdate`, `Downloads`) VALUES
	(2, 'ww', 'ww', 'ww', 'pdf', 1, '2021-03-31 15:04:41', '2021-03-31 15:04:42', 0);
/*!40000 ALTER TABLE `file` ENABLE KEYS */;

-- Volcando estructura para tabla pendrive.storage
CREATE TABLE IF NOT EXISTS `storage` (
  `StorageId` int(11) NOT NULL AUTO_INCREMENT,
  `Capacity` decimal(3,1) NOT NULL DEFAULT 49.9,
  `UserId` int(11) NOT NULL,
  `StorageDateAdded` datetime NOT NULL,
  `StorageLastUpdate` datetime NOT NULL,
  PRIMARY KEY (`StorageId`),
  UNIQUE KEY `UserId2` (`UserId`),
  KEY `UserId` (`UserId`) USING BTREE,
  CONSTRAINT `fk_UserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla pendrive.storage: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
REPLACE INTO `storage` (`StorageId`, `Capacity`, `UserId`, `StorageDateAdded`, `StorageLastUpdate`) VALUES
	(1, 49.9, 1, '2021-03-31 16:16:27', '2021-03-31 16:16:27'),
	(2, 49.9, 4, '2021-03-31 16:17:22', '2021-03-31 16:17:22');
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;

-- Volcando estructura para tabla pendrive.user
CREATE TABLE IF NOT EXISTS `user` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(200) NOT NULL,
  `Password` varchar(400) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Rol` varchar(10) NOT NULL DEFAULT 'Customer',
  `Status` varchar(22) DEFAULT 'Waiting for activate',
  `UserDateAdded` datetime NOT NULL,
  `UserLastUpdate` datetime NOT NULL,
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla pendrive.user: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`UserId`, `Email`, `Password`, `Phone`, `Rol`, `Status`, `UserDateAdded`, `UserLastUpdate`) VALUES
	(1, 'mail1@mail.com', '579d9ec9d0c3d687aaa91289ac2854e4', '123', 'Customer', 'Waiting for activate', '2021-03-31 16:16:24', '2021-03-31 16:16:25'),
	(4, 'admin@pendrivel.com', '579d9ec9d0c3d687aaa91289ac2854e4', '123', 'Admin', 'Master', '2021-03-31 16:16:24', '2021-03-31 16:16:25');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Volcando estructura para disparador pendrive.tgrStorage
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tgrStorage` AFTER INSERT ON `user` FOR EACH ROW INSERT INTO storage (Capacity,UserId,StorageDateAdded,StorageLastUpdate)
 VALUES (49.9,NEW.UserId,NOW(),NOW())//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
