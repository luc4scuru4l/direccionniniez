-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 31-10-2021 a las 13:46:28
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `DireccionNiñez`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Contacto`
--

CREATE TABLE `Contacto` (
  `idContacto` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido` varchar(30) NOT NULL,
  `DNI` varchar(9) NOT NULL,
  `Sexo` tinyint(1) NOT NULL,
  `Telefono1` varchar(20) DEFAULT NULL,
  `Telefono2` varchar(20) DEFAULT NULL,
  `Tutor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Contacto`
--

INSERT INTO `Contacto` (`idContacto`, `Nombre`, `Apellido`, `DNI`, `Sexo`, `Telefono1`, `Telefono2`, `Tutor`) VALUES
(1, 'Raquel', 'Villanueva', '23908654', 1, '1559872345', NULL, 1),
(2, 'Jorge', 'García', '20508154', 0, '34156872145', NULL, 0),
(3, 'Sara', 'Hebe', '29178134', 1, '028016457135', NULL, 0),
(4, 'Mabel', 'Rodriguez', '8818192', 1, '3412299467', NULL, 1),
(5, 'Emeterio', 'Giqueaux', '8435931', 0, '02942857345', NULL, 1),
(6, 'Lautaro', 'Koatz', '39654871', 0, '3417894573', '3414398038', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Contacto-Menor`
--

CREATE TABLE `Contacto-Menor` (
  `idMenor` int(11) NOT NULL,
  `idContacto` int(11) NOT NULL,
  `idParentesco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Contacto-Menor`
--

INSERT INTO `Contacto-Menor` (`idMenor`, `idContacto`, `idParentesco`) VALUES
(1, 1, 3),
(2, 2, 1),
(2, 3, 2),
(3, 4, 4),
(4, 5, 5),
(5, 6, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Menor`
--

CREATE TABLE `Menor` (
  `idMenor` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido` varchar(30) NOT NULL,
  `FechaDeNacimiento` date NOT NULL,
  `DNI` varchar(9) NOT NULL,
  `Domicilio_Origen` varchar(45) NOT NULL,
  `Domicilio_Actual` varchar(45) NOT NULL,
  `Observaciones` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Menor`
--

INSERT INTO `Menor` (`idMenor`, `Nombre`, `Apellido`, `FechaDeNacimiento`, `DNI`, `Domicilio_Origen`, `Domicilio_Actual`, `Observaciones`) VALUES
(1, 'Joel', 'Garcia', '2003-10-17', '45809931', 'Av. Siempre Viva 742', 'Cordiviola 1100', 'Hijo único'),
(2, 'Chiara', 'Fernandez', '2011-05-21', '48965213', 'Bv. Segui 3800 ', 'Av. Francia 800', 'Ingresado en el hospital de niños Héctor J. Vilela el 21/10/10. Motivo: Covid-19'),
(3, 'Juan Cruz', 'Komar', '2013-03-11', '46565913', 'Av. Sabin 2200', 'Bv. Rondeau 500 Edificio 4 Piso 0 Depto 9', 'Insulino dependiente'),
(4, 'Felipe', 'Gorostiaga', '2007-12-01', '45786032', 'Velez Sarsfield 1323', 'Santa fe 3300', 'Bajo desempeño escolar.'),
(5, 'Tobias', 'Lopez', '2016-07-07', '50196015', 'Colombia 1548 Bis', 'Av. San Martin 200 Edificio 9 Piso 10 Depto A', 'En proceso de reubicación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Parentesco`
--

CREATE TABLE `Parentesco` (
  `idParentesco` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Parentesco`
--

INSERT INTO `Parentesco` (`idParentesco`, `Nombre`) VALUES
(1, 'Padre'),
(2, 'Madre'),
(3, 'Tio/a'),
(4, 'Abuelo/a'),
(5, 'Vecino/a'),
(6, 'Hermano/a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Personal`
--

CREATE TABLE `Personal` (
  `idPersonal` int(11) NOT NULL,
  `idRol` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido` varchar(30) NOT NULL,
  `DNI` varchar(9) NOT NULL,
  `Domicilio` varchar(45) NOT NULL,
  `Telefono1` varchar(20) DEFAULT NULL,
  `Telefono2` varchar(20) NOT NULL,
  `Admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Personal`
--

INSERT INTO `Personal` (`idPersonal`, `idRol`, `Nombre`, `Apellido`, `DNI`, `Domicilio`, `Telefono1`, `Telefono2`, `Admin`) VALUES
(1, 3, 'Saul', 'Goodman', '15876512', 'Av. Wheelright 300', '341786932', '', 0),
(2, 3, 'Paula', 'Español', '22817000', 'Av. Casiano Casas 1591', '34187461028', '', 0),
(3, 2, 'Evangelina', 'Paciencia', '19591617', 'Salta 2671', '3415531804', '3414557129', 0),
(4, 2, 'José', 'Escucha', '27617888', 'Av. De Los Trabajadores 3865', '45589312', '', 0),
(5, 1, 'Ramiro', 'Cejas', '36986312', 'Guttenberg 471', '3412299827', '', 0),
(6, 1, 'Estefania', 'Gomez', '38593025', 'Baigorria 3000', '3415679832', '', 0),
(7, 1, 'Verónica', 'Garrido', '22100927', 'Riccieri 1138', '3410028457', '', 0),
(8, 1, 'Clarisa', 'Boffeli', '27508731', 'San Juan 1500', '3416781232', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Personal-Menor`
--

CREATE TABLE `Personal-Menor` (
  `idMenor` int(11) NOT NULL,
  `idPersonal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Personal-Menor`
--

INSERT INTO `Personal-Menor` (`idMenor`, `idPersonal`) VALUES
(1, 3),
(2, 3),
(3, 3),
(4, 4),
(5, 4),
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(1, 5),
(2, 6),
(3, 7),
(5, 8),
(4, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Rol`
--

CREATE TABLE `Rol` (
  `idRol` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Rol`
--

INSERT INTO `Rol` (`idRol`, `Nombre`) VALUES
(1, 'Acompañante'),
(2, 'Psicólogo/a'),
(3, 'Abogado/a');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Contacto`
--
ALTER TABLE `Contacto`
  ADD PRIMARY KEY (`idContacto`),
  ADD UNIQUE KEY `DNI` (`DNI`);

--
-- Indices de la tabla `Contacto-Menor`
--
ALTER TABLE `Contacto-Menor`
  ADD KEY `idMenor` (`idMenor`),
  ADD KEY `idContacto` (`idContacto`),
  ADD KEY `idParentesco` (`idParentesco`);

--
-- Indices de la tabla `Menor`
--
ALTER TABLE `Menor`
  ADD PRIMARY KEY (`idMenor`),
  ADD UNIQUE KEY `DNI` (`DNI`);

--
-- Indices de la tabla `Parentesco`
--
ALTER TABLE `Parentesco`
  ADD PRIMARY KEY (`idParentesco`);

--
-- Indices de la tabla `Personal`
--
ALTER TABLE `Personal`
  ADD PRIMARY KEY (`idPersonal`),
  ADD UNIQUE KEY `DNI` (`DNI`),
  ADD KEY `idRol` (`idRol`);

--
-- Indices de la tabla `Personal-Menor`
--
ALTER TABLE `Personal-Menor`
  ADD KEY `idMenor` (`idMenor`),
  ADD KEY `idPersonal` (`idPersonal`);

--
-- Indices de la tabla `Rol`
--
ALTER TABLE `Rol`
  ADD PRIMARY KEY (`idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Contacto`
--
ALTER TABLE `Contacto`
  MODIFY `idContacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Menor`
--
ALTER TABLE `Menor`
  MODIFY `idMenor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Parentesco`
--
ALTER TABLE `Parentesco`
  MODIFY `idParentesco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Rol`
--
ALTER TABLE `Rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Contacto-Menor`
--
ALTER TABLE `Contacto-Menor`
  ADD CONSTRAINT `Contacto-Menor_ibfk_1` FOREIGN KEY (`idMenor`) REFERENCES `Menor` (`idMenor`),
  ADD CONSTRAINT `Contacto-Menor_ibfk_2` FOREIGN KEY (`idParentesco`) REFERENCES `Parentesco` (`idParentesco`),
  ADD CONSTRAINT `Contacto-Menor_ibfk_3` FOREIGN KEY (`idContacto`) REFERENCES `Contacto` (`idContacto`);

--
-- Filtros para la tabla `Personal`
--
ALTER TABLE `Personal`
  ADD CONSTRAINT `Personal_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `Rol` (`idRol`);

--
-- Filtros para la tabla `Personal-Menor`
--
ALTER TABLE `Personal-Menor`
  ADD CONSTRAINT `Personal-Menor_ibfk_1` FOREIGN KEY (`idMenor`) REFERENCES `Menor` (`idMenor`),
  ADD CONSTRAINT `Personal-Menor_ibfk_2` FOREIGN KEY (`idPersonal`) REFERENCES `Personal` (`idPersonal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
