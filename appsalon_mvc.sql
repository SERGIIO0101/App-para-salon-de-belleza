-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-11-2022 a las 15:25:48
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `appsalon_mvc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `usuarioId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id`, `fecha`, `hora`, `usuarioId`) VALUES
(6, '2022-10-23', '16:40:33', NULL),
(7, '2022-11-04', '12:00:00', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citasservicios`
--

CREATE TABLE `citasservicios` (
  `id` int(11) NOT NULL,
  `citaId` int(11) DEFAULT NULL,
  `servicioId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `citasservicios`
--

INSERT INTO `citasservicios` (`id`, `citaId`, `servicioId`) VALUES
(1, 7, 8),
(2, 7, 7),
(3, 7, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `precio` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `nombre`, `precio`) VALUES
(1, 'Corte de Cabello Mujer', '90.00'),
(2, 'Corte de Cabello Hombre', '80.00'),
(3, 'Corte de Cabello Niño', '60.00'),
(4, 'Peinado Mujer', '80.00'),
(5, 'Peinado Hombre', '60.00'),
(6, 'Peinado Niño', '60.00'),
(7, 'Corte de Barba', '60.00'),
(8, 'Tinte Mujer', '300.00'),
(9, 'Uñas', '400.00'),
(10, 'Lavado de Cabello', '50.00'),
(11, 'Tratamiento Capilar', '150.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT 0,
  `confirmado` tinyint(1) DEFAULT 0,
  `token` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `password`, `telefono`, `admin`, `confirmado`, `token`) VALUES
(3, ' Sergio ', 'Severiche ', 'Sergioseveriche1321@hotmail.co', '$2y$10$qC8YFc138nH2RVttWVopn.nze8Kz/VbVUnHLnxHnETYoUQ/MTH7zG', '3152157034', 0, 1, ''),
(4, ' Sergio ', 'Uhia', 'Sergioseveriche1321@hotmail.com', '$2y$10$naogsdaMnYD1acNPZRu3I.SVRckYSa2Y2v1RFNBI2aiR6pYC8znxu', '3152157034', 1, 1, 'null');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarioId` (`usuarioId`);

--
-- Indices de la tabla `citasservicios`
--
ALTER TABLE `citasservicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servicioId` (`servicioId`),
  ADD KEY `citaId` (`citaId`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `citasservicios`
--
ALTER TABLE `citasservicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `citasservicios`
--
ALTER TABLE `citasservicios`
  ADD CONSTRAINT `citasservicios_ibfk_3` FOREIGN KEY (`servicioId`) REFERENCES `servicios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `citasservicios_ibfk_4` FOREIGN KEY (`citaId`) REFERENCES `citas` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
