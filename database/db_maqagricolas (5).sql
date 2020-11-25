-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2020 a las 04:25:54
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
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `idmaq` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `comment` varchar(150) NOT NULL,
  `puntaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `idmaq`, `iduser`, `comment`, `puntaje`) VALUES
(2, 8, 1, 'Segundo comentario', 5);

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
(7, 4, 'MARTÍNEZ & STANECK MARTÍNEZ & STANECK', 2020, 365500, 'Embolsadora Martínez & staneck de 9 pies! 6 meses de uso- completamente nueva', NULL),
(8, 2, ' PLATAFORMA ARTICULADA DIÉSEL 200 ATJ antes mixer', 2020, 780250, ' Marca: Manitou Modelo: 200 ATJ Años: 2013 / 2011 antes mixer', NULL),
(38, 4, 'fghdfgh', 2020, 2000, 'huiohui', NULL),
(39, 2, 'Es una Akron en descripcion', 2020, 20000, 'Esta buena la Akron', NULL);

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
(4, 'EMBOLSADORAS'),
(11, 'SILO BOLSA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(230) NOT NULL,
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `email`, `password`, `rol`) VALUES
(1, 'adminmaq', 'admin@prueba.com', '$2y$12$F4bD6EiedxKefl5noQGz0.5W0DwKm2Q3TYcV/zOYypju7tW5iSk9i', 0),
(4, 'betina', 'beliasain@hotmail.com', '$2y$12$pmEk0c9hZnGMvrwyVRJ.HO.swWuWwczMy5EmliNJjKa5Z50o/t4Te', 0),
(6, 'betina1', 'bebebe', '$2y$12$s3b5fXr4nFn5RZ9Z308nBu8hFFqsOlbhfN40yfUs57s6kPRB4ukQ2', 0),
(7, 'admindemo', 'admin@demo.com', '$2y$12$yVrlFtHzmva9oF66aUnUeOqwr/LQJdQrykEzeXliHjwB.0Bh/jjDy', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idmaq` (`idmaq`),
  ADD KEY `iduser` (`iduser`);

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
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `maquinaria`
--
ALTER TABLE `maquinaria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `rubro`
--
ALTER TABLE `rubro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`idmaq`) REFERENCES `maquinaria` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`iduser`) REFERENCES `usuario` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `maquinaria`
--
ALTER TABLE `maquinaria`
  ADD CONSTRAINT `maquinaria_ibfk_1` FOREIGN KEY (`idRubro`) REFERENCES `rubro` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
