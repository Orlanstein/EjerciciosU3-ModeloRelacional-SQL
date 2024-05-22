-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-05-2024 a las 17:23:56
-- Versión del servidor: 5.7.24
-- Versión de PHP: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agencia_de_seguros`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accidente`
--

CREATE TABLE `accidente` (
  `numero_referencia` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `lugar` varchar(100) DEFAULT NULL,
  `hora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `accidente`
--

INSERT INTO `accidente` (`numero_referencia`, `fecha`, `lugar`, `hora`) VALUES
(1, '2024-01-01', 'Calle Mayor', '10:00:00'),
(2, '2024-02-02', 'Avenida Sol', '11:00:00'),
(3, '2024-03-03', 'Plaza Luna', '12:00:00'),
(4, '2024-04-04', 'Calle Mar', '13:00:00'),
(5, '2024-05-05', 'Avenida Rio', '14:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multa`
--

CREATE TABLE `multa` (
  `numero_referencia` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `lugar` varchar(100) DEFAULT NULL,
  `importe` decimal(10,2) DEFAULT NULL,
  `dni` varchar(10) DEFAULT NULL,
  `matricula` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `multa`
--

INSERT INTO `multa` (`numero_referencia`, `fecha`, `hora`, `lugar`, `importe`, `dni`, `matricula`) VALUES
(1, '2024-01-01', '10:30:00', 'Calle Mayor', '150.00', '12345678A', '1111AAA'),
(2, '2024-02-02', '11:30:00', 'Avenida Sol', '200.00', '23456789B', '2222BBB'),
(3, '2024-03-03', '12:30:00', 'Plaza Luna', '250.00', '34567890C', '3333CCC'),
(4, '2024-04-04', '13:30:00', 'Calle Mar', '300.00', '45678901D', '4444DDD'),
(5, '2024-05-05', '14:30:00', 'Avenida Rio', '350.00', '56789012E', '5555EEE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `dni` varchar(10) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `poblacion` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`dni`, `nombre`, `apellidos`, `direccion`, `poblacion`, `telefono`) VALUES
('12345678A', 'Juan', 'Perez Garcia', 'Calle Mayor 1', 'Madrid', '600111111'),
('23456789B', 'Maria', 'Lopez Martinez', 'Avenida Sol 2', 'Barcelona', '600222222'),
('34567890C', 'Carlos', 'Sanchez Fernandez', 'Plaza Luna 3', 'Valencia', '600333333'),
('45678901D', 'Laura', 'Gonzalez Ruiz', 'Calle Mar 4', 'Sevilla', '600444444'),
('56789012E', 'Ana', 'Moreno Alvarez', 'Avenida Rio 5', 'Zaragoza', '600555555');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_accidente`
--

CREATE TABLE `persona_accidente` (
  `dni` varchar(10) NOT NULL,
  `numero_referencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona_accidente`
--

INSERT INTO `persona_accidente` (`dni`, `numero_referencia`) VALUES
('12345678A', 1),
('56789012E', 1),
('12345678A', 2),
('23456789B', 2),
('23456789B', 3),
('34567890C', 3),
('34567890C', 4),
('45678901D', 4),
('45678901D', 5),
('56789012E', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_vehiculo`
--

CREATE TABLE `persona_vehiculo` (
  `dni` varchar(10) NOT NULL,
  `matricula` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona_vehiculo`
--

INSERT INTO `persona_vehiculo` (`dni`, `matricula`) VALUES
('12345678A', '1111AAA'),
('56789012E', '1111AAA'),
('12345678A', '2222BBB'),
('23456789B', '2222BBB'),
('23456789B', '3333CCC'),
('34567890C', '3333CCC'),
('34567890C', '4444DDD'),
('45678901D', '4444DDD'),
('45678901D', '5555EEE'),
('56789012E', '5555EEE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `matricula` varchar(10) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`matricula`, `marca`, `modelo`) VALUES
('1111AAA', 'Toyota', 'Corolla'),
('2222BBB', 'Honda', 'Civic'),
('3333CCC', 'Ford', 'Focus'),
('4444DDD', 'BMW', 'X5'),
('5555EEE', 'Audi', 'A3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_accidente`
--

CREATE TABLE `vehiculo_accidente` (
  `matricula` varchar(10) NOT NULL,
  `numero_referencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vehiculo_accidente`
--

INSERT INTO `vehiculo_accidente` (`matricula`, `numero_referencia`) VALUES
('1111AAA', 1),
('5555EEE', 1),
('1111AAA', 2),
('2222BBB', 2),
('2222BBB', 3),
('3333CCC', 3),
('3333CCC', 4),
('4444DDD', 4),
('4444DDD', 5),
('5555EEE', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accidente`
--
ALTER TABLE `accidente`
  ADD PRIMARY KEY (`numero_referencia`);

--
-- Indices de la tabla `multa`
--
ALTER TABLE `multa`
  ADD PRIMARY KEY (`numero_referencia`),
  ADD KEY `dni` (`dni`),
  ADD KEY `matricula` (`matricula`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `persona_accidente`
--
ALTER TABLE `persona_accidente`
  ADD PRIMARY KEY (`dni`,`numero_referencia`),
  ADD KEY `numero_referencia` (`numero_referencia`);

--
-- Indices de la tabla `persona_vehiculo`
--
ALTER TABLE `persona_vehiculo`
  ADD PRIMARY KEY (`dni`,`matricula`),
  ADD KEY `matricula` (`matricula`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`matricula`);

--
-- Indices de la tabla `vehiculo_accidente`
--
ALTER TABLE `vehiculo_accidente`
  ADD PRIMARY KEY (`matricula`,`numero_referencia`),
  ADD KEY `numero_referencia` (`numero_referencia`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `multa`
--
ALTER TABLE `multa`
  ADD CONSTRAINT `multa_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `persona` (`dni`),
  ADD CONSTRAINT `multa_ibfk_2` FOREIGN KEY (`matricula`) REFERENCES `vehiculo` (`matricula`);

--
-- Filtros para la tabla `persona_accidente`
--
ALTER TABLE `persona_accidente`
  ADD CONSTRAINT `persona_accidente_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `persona` (`dni`),
  ADD CONSTRAINT `persona_accidente_ibfk_2` FOREIGN KEY (`numero_referencia`) REFERENCES `accidente` (`numero_referencia`);

--
-- Filtros para la tabla `persona_vehiculo`
--
ALTER TABLE `persona_vehiculo`
  ADD CONSTRAINT `persona_vehiculo_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `persona` (`dni`),
  ADD CONSTRAINT `persona_vehiculo_ibfk_2` FOREIGN KEY (`matricula`) REFERENCES `vehiculo` (`matricula`);

--
-- Filtros para la tabla `vehiculo_accidente`
--
ALTER TABLE `vehiculo_accidente`
  ADD CONSTRAINT `vehiculo_accidente_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `vehiculo` (`matricula`),
  ADD CONSTRAINT `vehiculo_accidente_ibfk_2` FOREIGN KEY (`numero_referencia`) REFERENCES `accidente` (`numero_referencia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
