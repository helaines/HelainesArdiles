-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para uny
CREATE DATABASE IF NOT EXISTS `uny` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `uny`;

-- Volcando estructura para tabla uny.alumno
CREATE TABLE IF NOT EXISTS `alumno` (
  `ID` int(5) NOT NULL COMMENT 'LLAVE PRIMARIA DE LA TABLA',
  `Nombre` varchar(30) NOT NULL,
  `Apellido` varchar(35) NOT NULL,
  `Dirección` varchar(75) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Estado` varchar(70) NOT NULL,
  `Municipio` varchar(15) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Primera tabla creada.';

-- Volcando datos para la tabla uny.alumno: ~7 rows (aproximadamente)
INSERT INTO `alumno` (`ID`, `Nombre`, `Apellido`, `Dirección`, `Email`, `Fecha_Nacimiento`, `Estado`, `Municipio`) VALUES
	(13645, 'Will', 'Olivares', 'Palo Verde', 'willolivares@gmail.com', '2020-01-20', 'Miranda', 'Sucre'),
	(15256, 'Alexandra', 'Rivas', 'Mariche', 'alexqu@gmail.com', '2003-10-25', 'Miranda', 'sucre'),
	(25684, 'Jesus', 'Maneiro', 'Altamira', 'jmaneiro@gmail.com', '2002-02-25', 'Miranda', 'Chacao'),
	(45789, 'Cristian', 'Peraza', 'Altamira', 'cristpera@gmail.com', '2004-03-19', 'Miranda', 'Chacao'),
	(75621, 'Helaines', 'Ardiles', 'Guaicoco', 'helainesoliveros15@gmail.com', '2003-10-22', 'Miranda', 'Sucre'),
	(85469, 'Kelly', 'Bello', 'Vista Hermosa', 'kbello12@gmail.com', '2005-04-12', 'Miranda', 'Sucre'),
	(124545, 'Carolina', 'Oliveros', 'Palo Verde', 'carooliv@gmail.com', '1982-05-06', 'Miranda', 'Sucre');

-- Volcando estructura para procedimiento uny.BuscarAlumno
DELIMITER //
CREATE PROCEDURE `BuscarAlumno`(
	IN `idAlumno` INT
)
BEGIN
      SELECT CONCAT(Nombre,' ' , Apellido,' ' , Fecha_Nacimiento)-- Concatena información del alumno
      FROM alumno
      WHERE ID = idAlumno;-- Filtra por ID del alumno

   END//
DELIMITER ;

-- Volcando estructura para tabla uny.historico_alumno
CREATE TABLE IF NOT EXISTS `historico_alumno` (
  `IDALUM` int(5) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(35) DEFAULT NULL,
  `Estado` varchar(70) DEFAULT NULL,
  `Usuario_Activo` varchar(40) DEFAULT NULL,
  `Fecha_Ingreso` date DEFAULT NULL,
  `Hora_Registro` time DEFAULT NULL,
  PRIMARY KEY (`IDALUM`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='segunda tabla que se pidió.';

-- Volcando datos para la tabla uny.historico_alumno: ~13 rows (aproximadamente)
INSERT INTO `historico_alumno` (`IDALUM`, `Nombre`, `Apellido`, `Estado`, `Usuario_Activo`, `Fecha_Ingreso`, `Hora_Registro`) VALUES
	(12345, 'josé', 'ramirez', 'Miranda', 'root@localhost', '2024-07-24', '21:55:27'),
	(13645, 'Will', 'Olivares', 'Miranda', 'root@localhost', '2024-07-25', '19:50:50'),
	(15256, 'Alexandra', 'Rivas', 'caracas', 'root@localhost', '2024-07-24', '22:25:44'),
	(25664, 'HELAINES', 'OLIVEROS', 'miranda', 'root@localhost', '2024-07-25', '19:07:38'),
	(25684, '', '', '', 'root@localhost', '2024-07-24', '21:34:39'),
	(36254, '', '', '', 'root@localhost', '2024-07-24', '21:38:09'),
	(45789, '', '', '', 'root@localhost', '2024-07-24', '21:39:45'),
	(52465, 'Carolina', '', '', 'root@localhost', '2024-07-24', '21:42:37'),
	(52651, 'Kelly', 'Bello', '', 'root@localhost', '2024-07-24', '21:44:10'),
	(62545, '', '', '', 'root@localhost', '2024-07-24', '21:36:14'),
	(62595, 'Antonio', 'Centeno', '', 'root@localhost', '2024-07-24', '21:45:46'),
	(75621, 'Helaines', 'Ardiles', '', 'root@localhost', '2024-07-24', '21:42:13'),
	(124545, 'Carolina', 'Oliveros', 'Miranda', 'root@localhost', '2024-07-25', '19:49:05');

-- Volcando estructura para tabla uny.historico_operaciones
CREATE TABLE IF NOT EXISTS `historico_operaciones` (
  `ID_BORRADO` int(5) NOT NULL,
  `Nombre_BORRADO` varchar(30) DEFAULT NULL,
  `Apellido_BORRADO` varchar(35) DEFAULT NULL,
  `Usuario_Activo` varchar(40) DEFAULT NULL,
  `Fecha_Borrado` date DEFAULT NULL,
  `Hora_Borrado` time DEFAULT NULL,
  PRIMARY KEY (`ID_BORRADO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tercera tabla creada con los campos correspondientes.';

-- Volcando datos para la tabla uny.historico_operaciones: ~7 rows (aproximadamente)
INSERT INTO `historico_operaciones` (`ID_BORRADO`, `Nombre_BORRADO`, `Apellido_BORRADO`, `Usuario_Activo`, `Fecha_Borrado`, `Hora_Borrado`) VALUES
	(12345, 'josé', 'ramirez', 'root@localhost', '2024-07-25', '19:30:14'),
	(25664, 'HELAINES', 'OLIVEROS', 'root@localhost', '2024-07-25', '19:30:14'),
	(35268, 'María', 'Moncada', 'root@localhost', '2024-07-25', '19:30:14'),
	(36254, 'Mora', 'Oliveros', 'root@localhost', '2024-07-25', '19:31:16'),
	(52465, 'Carolina', 'Rivas', 'root@localhost', '2024-07-25', '19:43:20'),
	(62595, 'Antonio', 'Centeno', 'root@localhost', '2024-07-25', '19:31:16'),
	(95682, 'Will', 'Lira', 'root@localhost', '2024-07-25', '19:37:49');

-- Volcando estructura para procedimiento uny.ingresarAlumno
DELIMITER //
CREATE PROCEDURE `ingresarAlumno`(
	IN `p_ID` INT,
	IN `p_Nombre` VARCHAR(50),
	IN `p_Apellido` VARCHAR(50),
	IN `p_Direccion` VARCHAR(100),
	IN `p_Email` VARCHAR(100),
	IN `p_Fecha_Nacimiento` DATE,
	IN `p_Estado` VARCHAR(50),
	IN `p_Municipio` VARCHAR(50)
)
BEGIN
  INSERT INTO ALUMNO (
    ID,
    Nombre,
    Apellido,
    Dirección,
    Email,
    Fecha_Nacimiento,
    Estado,
    Municipio
  ) VALUES (
    p_ID,
    p_Nombre,
    p_Apellido,
    p_Direccion,
    p_Email,
    p_Fecha_Nacimiento,
    p_Estado,
    p_Municipio
  );

  -- Seleccionar el registro recién insertado en ALUMNO
  SELECT * FROM ALUMNO WHERE ID = p_ID;

  -- Seleccionar el registro correspondiente en HISTORICO_ALUMNO (si existe)
  SELECT * FROM HISTORICO_ALUMNO WHERE IDALUM = p_ID;
END -- CONSULTA PARA INGRESAR UN ALUMNO: CALL ingresarAlumno(10, 'Juan', 'Pérez', 'Bella Vista', 'juan@gmail.com', '1990-01-01', 'Miranda', 'Sucre')//
DELIMITER ;

-- Volcando estructura para vista uny.reporte_de_estudiantes
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `reporte_de_estudiantes` (
	`ID` INT(5) NOT NULL COMMENT 'LLAVE PRIMARIA DE LA TABLA',
	`Nombre` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Apellido` VARCHAR(35) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Dirección` VARCHAR(75) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Email` VARCHAR(45) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Fecha_Nacimiento` DATE NOT NULL,
	`Estado` VARCHAR(70) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Municipio` VARCHAR(15) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista uny.vw_cambios_alumnos
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_cambios_alumnos` (
	`ID_ALUMNO` INT(11) NOT NULL,
	`Nombre_ANTERIOR` VARCHAR(30) NULL COLLATE 'utf8mb4_general_ci',
	`Apellido_ANTERIOR` VARCHAR(35) NULL COLLATE 'utf8mb4_general_ci',
	`Usuario_Activo` VARCHAR(141) NULL COLLATE 'utf8mb4_general_ci',
	`Fecha_Borrado` DATE NULL,
	`Hora_Borrado` TIME NULL,
	`Tipo_Cambio` VARCHAR(21) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para disparador uny.AFTER_INSERT
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `AFTER_INSERT` AFTER INSERT ON `alumno` FOR EACH ROW BEGIN
  INSERT INTO HISTORICO_ALUMNO (
    IDALUM,
    Nombre,
    Apellido,
    Estado,
    Usuario_Activo,
    Fecha_Ingreso,
    Hora_Registro
  ) VALUES (
    NEW.ID, -- Asumiendo que ID en ALUMNO corresponde a IDALUM en HISTORICO_ALUMNO
    NEW.Nombre,
    NEW.Apellido,
    NEW.Estado,
    CURRENT_USER(), -- Obtienen el usuario actual.
    CURDATE(), -- Se usa para fechas.
    CURTIME()  -- Se usa para la hora.
  );
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador uny.BEFORE_DETELE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `BEFORE_DETELE` BEFORE DELETE ON `alumno` FOR EACH ROW BEGIN -- Se crea un trigger llamado BEFORE_DETELE
  INSERT INTO historico_operaciones (
    ID_BORRADO,
    Nombre_BORRADO,
    Apellido_BORRADO,
    Usuario_Activo,
    Fecha_Borrado,
    Hora_Borrado
  ) VALUES (
    OLD.ID, -- Acceden a los valores de las columnas correspondientes del registro que se va a eliminar.
    OLD.Nombre,
    OLD.Apellido,
    CURRENT_USER(),
    CURDATE(),
    CURTIME()
  ); -- Consulta para eliminar Alumnos : DELETE FROM ALUMNO WHERE ID IN (ID1, ID2, ID3);
END -- BEGIN...END: Define el bloque de código que se ejecutará cuando se active el trigger.//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para vista uny.reporte_de_estudiantes
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `reporte_de_estudiantes`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `reporte_de_estudiantes` AS SELECT
   ID,
Nombre,
Apellido,
Dirección,
Email,
Fecha_Nacimiento,
Estado,
Municipio 

FROM
    alumno -- Selecciona todos los campos necesarios de la tabla 'alumno' 
    -- CONSULTA PARA VER EL REPORTE: SELECT * FROM reporte_de_estudiantes ;

-- Volcando estructura para vista uny.vw_cambios_alumnos
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_cambios_alumnos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_cambios_alumnos` AS SELECT
    ha.ID_BORRADO AS ID_ALUMNO,
    ha.Nombre_BORRADO AS Nombre_ANTERIOR,
    ha.Apellido_BORRADO AS Apellido_ANTERIOR,
    ha.Usuario_Activo,
    ha.Fecha_Borrado,
    ha.Hora_Borrado,
    'Eliminado' AS Tipo_Cambio
FROM
    historico_operaciones ha
UNION ALL
SELECT
    a.ID AS ID_ALUMNO,
    a.Nombre AS Nombre_ACTUAL,
    a.Apellido AS Apellido_ACTUAL,
    CURRENT_USER() AS Usuario_Activo,
    CURDATE() AS Fecha_Cambio,
    CURTIME() AS Hora_Cambio,
    'Insertado/Actualizado' AS Tipo_Cambio
FROM
    alumno a
WHERE
    NOT EXISTS (
        SELECT 1 FROM historico_operaciones h WHERE h.ID_BORRADO = a.ID
    ) 
    -- CREADO PARA MOSTRAR LOS ULTIMOS CAMBIOS EN LAS TABLAS, TENIENDO EN CUENTA
    -- QUE CON EL SIGUIENTE CÓDIGO SE PUEDEN VER LOS ÚLTIMOS 10 REGISTROS:
	 -- SELECT * FROM vw_cambios_alumnos ORDER BY Fecha_Borrado DESC LIMIT 10 ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
