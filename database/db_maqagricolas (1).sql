-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-10-2020 a las 03:30:08
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_maqagricolas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquinaria`
--

CREATE TABLE `maquinaria` (
  `id` int(11) NOT NULL,
  `idRubro` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `modelo` int(4) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `notas` varchar(250) DEFAULT NULL,
  `foto` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `maquinaria`
--

INSERT INTO `maquinaria` (`id`, `idRubro`, `descripcion`, `modelo`, `precio`, `notas`, `foto`) VALUES
(3, 2, 'CRUCIANELLI GRINGA II', 2016, 150000, 'Sembradora de 10 a 70cm. Mecánica con alas. Fertilización con algo', NULL),
(4, 3, 'MAINERO 2921 PLUS CON BALANZA', 2015, 230000, 'Mixer Pampero 4010 de 10 mts. cúbicos, con balanza ', NULL),
(5, 4, 'Akron E9700HE', 2018, 200500, 'Embolsadora De Granos Secos semi nueva con garantía de 12 meses', NULL),
(6, 2, 'CRUCIANELLI 3520', 2014, 1250000, 'Sembradora Crucianelli Pionera de 35 líneas a 20 cm. ', NULL),
(7, 4, 'MARTÍNEZ & STANECK MARTÍNEZ & STANECK', 2020, 365500, 'Embolsadora Martínez & staneck de 9 pies! 6 meses de uso- completamente nueva', NULL),
(8, 6, 'PLATAFORMA ARTICULADA DIÉSEL 200 ATJ', 2013, 780250, 'Marca: Manitou Modelo: 200 ATJ Años: 2013 / 2011', NULL),
(9, 2, 'CRUCIANELLI GRINGA VIII', 2013, 125200, ' Sembradora de 20 a 70cm. Mecánica con alas. Fertilización asistida', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubro`
--

CREATE TABLE `rubro` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rubro`
--

INSERT INTO `rubro` (`id`, `descripcion`) VALUES
(2, 'SEMBRADORAS'),
(3, 'MIXERS'),
(4, 'EMBOLSADORAS'),
(5, 'DESMALEZADORAS'),
(6, 'PLATAFORMAS'),
(7, 'ACOPLADOS'),
(8, 'AUTODESCARGABLES'),
(9, 'PLATAFORMAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contraseña` varchar(230) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `email`, `contraseña`) VALUES
(1, 'adminmaq', 'admin@prueba.com', '$2y$12$F4bD6EiedxKefl5noQGz0.5W0DwKm2Q3TYcV/zOYypju7tW5iSk9i'),
(4, 'betina', 'beliasain@hotmail.com', '$2y$12$pmEk0c9hZnGMvrwyVRJ.HO.swWuWwczMy5EmliNJjKa5Z50o/t4Te'),
(6, 'betina1', 'bebebe', '$2y$12$s3b5fXr4nFn5RZ9Z308nBu8hFFqsOlbhfN40yfUs57s6kPRB4ukQ2');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `maquinaria`
--
ALTER TABLE `maquinaria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ixRubro` (`idRubro`);

--
-- Indices de la tabla `rubro`
--
ALTER TABLE `rubro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `maquinaria`
--
ALTER TABLE `maquinaria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `rubro`
--
ALTER TABLE `rubro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `maquinaria`
--
ALTER TABLE `maquinaria`
  ADD CONSTRAINT `maquinaria_ibfk_1` FOREIGN KEY (`idRubro`) REFERENCES `rubro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
