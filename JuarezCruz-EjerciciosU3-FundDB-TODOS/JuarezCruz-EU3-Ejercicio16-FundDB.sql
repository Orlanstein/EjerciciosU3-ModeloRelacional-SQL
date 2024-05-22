-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2024 a las 06:25:28
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejercicio16`
--
CREATE DATABASE IF NOT EXISTS `ejercicio16` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ejercicio16`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `codigo_equipo` int(11) NOT NULL,
  `nombre_equipo` varchar(100) NOT NULL,
  `nombre_estadio` varchar(100) NOT NULL,
  `aforo` int(11) DEFAULT NULL,
  `anio_fundacion` int(11) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`codigo_equipo`, `nombre_equipo`, `nombre_estadio`, `aforo`, `anio_fundacion`, `ciudad`) VALUES
(1, 'Real Madrid', 'Santiago Bernabéu', 81044, 1902, 'Madrid'),
(2, 'FC Barcelona', 'Camp Nou', 99354, 1899, 'Barcelona'),
(3, 'Atlético Madrid', 'Wanda Metropolitano', 68456, 1903, 'Madrid'),
(4, 'Sevilla FC', 'Ramón Sánchez-Pizjuán', 43883, 1890, 'Sevilla'),
(5, 'Valencia CF', 'Mestalla', 49000, 1919, 'Valencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gol`
--

CREATE TABLE `gol` (
  `codigo_gol` int(11) NOT NULL,
  `codigo_partido` int(11) DEFAULT NULL,
  `codigo_jugador` int(11) DEFAULT NULL,
  `minuto` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gol`
--

INSERT INTO `gol` (`codigo_gol`, `codigo_partido`, `codigo_jugador`, `minuto`, `descripcion`) VALUES
(1, 1, 1, 23, 'Gol de cabeza en un córner'),
(2, 1, 2, 45, 'Gol de tiro libre'),
(3, 2, 3, 12, 'Gol de penalti'),
(4, 2, 4, 67, 'Gol en contraataque'),
(5, 3, 5, 89, 'Gol de volea');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `codigo_jugador` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `posicion` varchar(50) DEFAULT NULL,
  `codigo_equipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`codigo_jugador`, `nombre`, `fecha_nacimiento`, `posicion`, `codigo_equipo`) VALUES
(1, 'Sergio Ramos', '1986-03-30', 'Defensa', 1),
(2, 'Lionel Messi', '1987-06-24', 'Delantero', 2),
(3, 'Jan Oblak', '1993-01-07', 'Portero', 3),
(4, 'Jesus Navas', '1985-11-21', 'Centrocampista', 4),
(5, 'Carlos Soler', '1997-01-02', 'Centrocampista', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partido`
--

CREATE TABLE `partido` (
  `codigo_partido` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `goles_equipo_casa` int(11) DEFAULT NULL,
  `goles_equipo_fuera` int(11) DEFAULT NULL,
  `codigo_equipo_casa` int(11) DEFAULT NULL,
  `codigo_equipo_fuera` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `partido`
--

INSERT INTO `partido` (`codigo_partido`, `fecha`, `goles_equipo_casa`, `goles_equipo_fuera`, `codigo_equipo_casa`, `codigo_equipo_fuera`) VALUES
(1, '2024-05-01', 3, 1, 1, 2),
(2, '2024-05-02', 2, 2, 3, 4),
(3, '2024-05-03', 0, 1, 5, 1),
(4, '2024-05-04', 4, 3, 2, 3),
(5, '2024-05-05', 1, 1, 4, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presidente`
--

CREATE TABLE `presidente` (
  `dni` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `codigo_equipo` int(11) DEFAULT NULL,
  `anio_eleccion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `presidente`
--

INSERT INTO `presidente` (`dni`, `nombre`, `apellidos`, `fecha_nacimiento`, `codigo_equipo`, `anio_eleccion`) VALUES
('12345678A', 'Florentino', 'Perez', '1947-03-08', 1, 2009),
('23456789B', 'Joan', 'Laporta', '1962-06-29', 2, 2021),
('34567890C', 'Enrique', 'Cerezo', '1948-02-27', 3, 2003),
('45678901D', 'Jose', 'Castro', '1958-09-14', 4, 2013),
('56789012E', 'Anil', 'Murthy', '1973-09-23', 5, 2017);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`codigo_equipo`);

--
-- Indices de la tabla `gol`
--
ALTER TABLE `gol`
  ADD PRIMARY KEY (`codigo_gol`),
  ADD KEY `codigo_partido` (`codigo_partido`),
  ADD KEY `codigo_jugador` (`codigo_jugador`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`codigo_jugador`),
  ADD KEY `codigo_equipo` (`codigo_equipo`);

--
-- Indices de la tabla `partido`
--
ALTER TABLE `partido`
  ADD PRIMARY KEY (`codigo_partido`),
  ADD KEY `codigo_equipo_casa` (`codigo_equipo_casa`),
  ADD KEY `codigo_equipo_fuera` (`codigo_equipo_fuera`);

--
-- Indices de la tabla `presidente`
--
ALTER TABLE `presidente`
  ADD PRIMARY KEY (`dni`),
  ADD KEY `codigo_equipo` (`codigo_equipo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `gol`
--
ALTER TABLE `gol`
  ADD CONSTRAINT `gol_ibfk_1` FOREIGN KEY (`codigo_partido`) REFERENCES `partido` (`codigo_partido`),
  ADD CONSTRAINT `gol_ibfk_2` FOREIGN KEY (`codigo_jugador`) REFERENCES `jugador` (`codigo_jugador`);

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `jugador_ibfk_1` FOREIGN KEY (`codigo_equipo`) REFERENCES `equipo` (`codigo_equipo`);

--
-- Filtros para la tabla `partido`
--
ALTER TABLE `partido`
  ADD CONSTRAINT `partido_ibfk_1` FOREIGN KEY (`codigo_equipo_casa`) REFERENCES `equipo` (`codigo_equipo`),
  ADD CONSTRAINT `partido_ibfk_2` FOREIGN KEY (`codigo_equipo_fuera`) REFERENCES `equipo` (`codigo_equipo`);

--
-- Filtros para la tabla `presidente`
--
ALTER TABLE `presidente`
  ADD CONSTRAINT `presidente_ibfk_1` FOREIGN KEY (`codigo_equipo`) REFERENCES `equipo` (`codigo_equipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
