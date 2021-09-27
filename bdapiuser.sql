-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.38-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para bd_usuarios
CREATE DATABASE IF NOT EXISTS `bd_usuarios` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bd_usuarios`;

-- Volcando estructura para tabla bd_usuarios.curso
CREATE TABLE IF NOT EXISTS `curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_usuarios.curso: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` (`id`, `nombre`, `creditos`) VALUES
	(1, 'matematica', 5),
	(2, 'fisica', 4);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;

-- Volcando estructura para tabla bd_usuarios.hibernate_sequence
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_usuarios.hibernate_sequence: 1 rows
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` (`next_val`) VALUES
	(6);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;

-- Volcando estructura para tabla bd_usuarios.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `curso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_usuario_curso` (`curso`),
  CONSTRAINT `FK_usuario_curso` FOREIGN KEY (`curso`) REFERENCES `curso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_usuarios.usuario: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `nombre`, `correo`, `curso`) VALUES
	(1, 'Pato Pérez Pinto', 'pato@gmail.com', 1),
	(2, 'josesitopessssss', 'josesito@gmail.com', 1),
	(6, 'juan', 'juan@gmail.com', 2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para procedimiento bd_usuarios.SP_UsuariosInscritosCurso
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UsuariosInscritosCurso`(
	IN `id` INT
)
BEGIN
	SELECT usuario.nombre,usuario.correo, curso.nombre as curso, curso.creditos
	FROM usuario
	INNER JOIN curso
	ON curso.id = usuario.curso WHERE curso.id = id;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
