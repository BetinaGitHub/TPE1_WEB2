-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-12-2020 a las 03:04:40
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

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
(45, 7, 7, 'Excelente producto, muy relación precio calidad.', 4),
(46, 7, 7, 'El mejor de mercado y como nuevo.', 5),
(47, 8, 7, 'Parece antigua... Pero linda', 3),
(48, 8, 7, 'Modelo pandemia', 1),
(49, 38, 7, 'Embolsa todo tipo de cereal. ', 4),
(50, 43, 7, 'Cosechadora reparada a nuevo. Excelente producto con 6 meses de garantía.', 5),
(51, 43, 7, 'No me gusta este producto, prefiero Zanello.', 2),
(52, 45, 7, 'Una antigüedad con mucha historia, así es el precio!', 4),
(53, 45, 7, 'Para chacra no para campo', 5);

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
  `imagen` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `maquinaria`
--

INSERT INTO `maquinaria` (`id`, `idRubro`, `descripcion`, `modelo`, `precio`, `notas`, `imagen`) VALUES
(7, 4, '     MARTÍNEZ & STANECK MARTÍNEZ & STANECK', 2020, 365500, '     Embolsadora Martínez & staneck de 9 pies! 6 meses de uso- completamente nueva', 'emb50EE.tmp'),
(8, 2, '  PLATAFORMA ARTICULADA DIÉSEL 200 ATJ antes mixer', 2020, 780250, '  Marca: Manitou Modelo: 200 ATJ Años: 2013 / 2011 antes mixer', 'dib10A1.tmp'),
(38, 4, ' Marca Sipeco Para embolsar cereal -', 2010, 80000, 'Sirve para todo tipo de cereal - Se canjea a cosecha', NULL),
(39, 2, 'Es una Akron en descripcion', 2020, 20000, 'Esta buena la Akron', NULL),
(40, 13, 'Tolva Autodescargable ', 2015, 150000, 'Tolva seminueva para todo uso. \r\nReparada a nuevo', NULL),
(41, 17, '  Claas Action Amarilla 52147', 2018, 2500000, '  Cosechadora para uso intensivo. Impecable con 12 meses de garantía oficial. Se toma cereal en parte de pago', NULL),
(42, 16, 'PLATAFORMA ARTICULADA DIÉSEL 200 ATJ', 2015, 0, 'Condicion: buena.\r\nPrecio: consultar', NULL),
(43, 17, 'Claas 4488', 2015, 5000000, 'Semi nueva', 'cos7147.tmp'),
(44, 13, 'Tolva con imagen', 2018, 250000, 'tolva ', 'tol657F.tmp'),
(45, 14, 'Tractor 1910', 1910, 1000000, 'Tractor de ultima tecnologia', 'dib5A3C.tmp');

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
(11, 'SILO BOLSA'),
(13, 'TOLVAS'),
(14, 'TRACTORES'),
(15, 'CARROS'),
(16, 'PLATAFORMAS'),
(17, 'COSECHADORAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `passw` varchar(230) NOT NULL,
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `email`, `passw`, `rol`) VALUES
(4, 'betina', 'beliasain@hotmail.com', '$2y$12$pmEk0c9hZnGMvrwyVRJ.HO.swWuWwczMy5EmliNJjKa5Z50o/t4Te', 0),
(7, 'admindemo', 'admin@demo.com', '$2y$12$yVrlFtHzmva9oF66aUnUeOqwr/LQJdQrykEzeXliHjwB.0Bh/jjDy', 1),
(8, 'Josefina', 'jose@demo.com', '$2y$10$EoxLZiwC2lf2QUTz8PnFx.cW7c7FM06LetBXzMsBnoBmAMh4mpO6i', 2),
(9, 'toto', 'toto@demo.com', '$2y$10$ZnKS2TqYIGdy.gm7GitYI.yv9W3jIH1nT2lqDLE0zdK5YA.tvDAcW', 0),
(10, 'pablo', 'pablo@demo.com', '$2y$10$l22rEeIA0l/dN7jx4h5WE.8T7ePCWmU1XYZB19DwEOfs0E4ccKt2O', 2),
(11, 'tita', 'tita@demo.com', '$2y$10$zpEeHDeYG02U6Slx7PS5PezrXYxjdoECzvZ2V13bru/SrDmKIxLcO', 1),
(13, 'pepe', 'pepe@demo.com', '$2y$10$o4cIF.yL.gSHfAFbKgEkF.9najiXF9mHNMD39Z/9ogfmwmRonD.km', 2),
(14, 'Juana La Loca', 'juana@demo.com', '$2y$10$J7FL28M.cYOlsJRHYPf53.ln79LvWZsUNz3zWU.FOT10ySKG5SLHq', 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `maquinaria`
--
ALTER TABLE `maquinaria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `rubro`
--
ALTER TABLE `rubro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
