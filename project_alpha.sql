-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-03-2019 a las 17:47:07
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `project_alpha`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nacionalidad`
--

CREATE TABLE `nacionalidad` (
  `CodNac` int(11) NOT NULL,
  `NomNac` varchar(60) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `nacionalidad`
--

INSERT INTO `nacionalidad` (`CodNac`, `NomNac`) VALUES
(1, 'Estadounidense'),
(2, 'Rusa'),
(3, 'Japonesa'),
(4, 'Francesa'),
(5, 'Española');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE `nivel` (
  `CodNiv` int(11) NOT NULL,
  `NomNiv` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `SalNiv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `nivel`
--

INSERT INTO `nivel` (`CodNiv`, `NomNiv`, `SalNiv`) VALUES
(1, 'Controlador Adjunto', 1200),
(2, 'Controlador Senior', 1800),
(3, 'Controlador Jefe', 3400);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `CodPer` int(11) NOT NULL,
  `NomPer` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `ApePer` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `EdaPer` int(11) NOT NULL,
  `CodNac` int(11) NOT NULL,
  `CodTra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`CodPer`, `NomPer`, `ApePer`, `EdaPer`, `CodNac`, `CodTra`) VALUES
(1, 'Max                                      ', 'Lecrow                                      ', 32, 1, 2),
(2, 'Alexey', 'Petrov', 46, 2, 1),
(3, 'Hiro', 'Suzumiya', 43, 3, 4),
(4, 'Francisco', 'Montes', 21, 5, 3),
(5, 'Paul', 'Holland', 31, 4, 5),
(6, 'Ernesto', 'Díaz', 40, 2, 5),
(7, 'Saulo', 'Rogel', 21, 1, 4),
(8, 'Alberto', 'Rodríguez', 38, 5, 2),
(9, 'Eva', 'Mackenzie', 27, 4, 3),
(10, 'Cristina', 'Gómez', 37, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `CodTra` int(11) NOT NULL,
  `NomTra` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `ConTra` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `PunTra` int(11) NOT NULL DEFAULT '0',
  `FalTra` int(11) NOT NULL DEFAULT '0',
  `EmaTra` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `CodNiv` int(11) NOT NULL DEFAULT '1',
  `ApeTra` varchar(60) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`CodTra`, `NomTra`, `ConTra`, `PunTra`, `FalTra`, `EmaTra`, `CodNiv`, `ApeTra`) VALUES
(1, 'Víctor', '123', 0, 0, 'victor@gmail.com', 1, 'Cuervo'),
(2, 'Rafa', '123', 0, 0, 'rafa@gmail.com', 1, 'Pipo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajo`
--

CREATE TABLE `trabajo` (
  `CodTra` int(11) NOT NULL,
  `NomTra` varchar(60) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `trabajo`
--

INSERT INTO `trabajo` (`CodTra`, `NomTra`) VALUES
(1, 'Ingenieria'),
(2, 'Sector Servicios'),
(3, 'Prostitución'),
(4, 'Recursos Humanos'),
(5, 'Fuerzas de Seguridad');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `nacionalidad`
--
ALTER TABLE `nacionalidad`
  ADD PRIMARY KEY (`CodNac`);

--
-- Indices de la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`CodNiv`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`CodPer`),
  ADD KEY `CodNac` (`CodNac`),
  ADD KEY `CodTra` (`CodTra`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`CodTra`),
  ADD KEY `CodNiv` (`CodNiv`);

--
-- Indices de la tabla `trabajo`
--
ALTER TABLE `trabajo`
  ADD PRIMARY KEY (`CodTra`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `CodPer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  MODIFY `CodTra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`CodNac`) REFERENCES `nacionalidad` (`CodNac`),
  ADD CONSTRAINT `persona_ibfk_2` FOREIGN KEY (`CodTra`) REFERENCES `trabajo` (`CodTra`);

--
-- Filtros para la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD CONSTRAINT `trabajador_ibfk_1` FOREIGN KEY (`CodNiv`) REFERENCES `nivel` (`CodNiv`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
