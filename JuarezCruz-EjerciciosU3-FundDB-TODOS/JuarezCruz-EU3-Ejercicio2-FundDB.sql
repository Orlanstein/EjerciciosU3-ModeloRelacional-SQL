-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-05-2024 a las 14:49:34
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
-- Base de datos: `camionero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camion`
--

CREATE TABLE `camion` (
  `matricula` varchar(10) NOT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `potencia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `camion`
--

INSERT INTO `camion` (`matricula`, `modelo`, `tipo`, `potencia`) VALUES
('ABC123', 'Model X', 'Tipo A', 500),
('BCD234', 'Model Y', 'Tipo B', 600),
('CDE345', 'Model Z', 'Tipo C', 550),
('DEF456', 'Model W', 'Tipo D', 650),
('EFG567', 'Model V', 'Tipo E', 700);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camionero`
--

CREATE TABLE `camionero` (
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `poblacion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `camionero`
--

INSERT INTO `camionero` (`dni`, `nombre`, `telefono`, `direccion`, `salario`, `poblacion`) VALUES
('12345678A', 'Juan Perez', '600123456', 'Calle Falsa 123', '1500.50', 'Madrid'),
('23456789B', 'Luis Martinez', '600234567', 'Calle Verdadera 234', '1600.75', 'Barcelona'),
('34567890C', 'Ana Lopez', '600345678', 'Avenida Siempreviva 742', '1550.00', 'Valencia'),
('45678901D', 'Maria Garcia', '600456789', 'Calle del Sol 456', '1700.25', 'Sevilla'),
('56789012E', 'Carlos Sanchez', '600567890', 'Calle Luna 567', '1650.80', 'Bilbao');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conduccion`
--

CREATE TABLE `conduccion` (
  `dni_camionero` varchar(9) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `conduccion`
--

INSERT INTO `conduccion` (`dni_camionero`, `matricula`, `fecha`) VALUES
('12345678A', 'ABC123', '2024-05-18'),
('56789012E', 'ABC123', '2024-05-20'),
('12345678A', 'BCD234', '2024-05-19'),
('23456789B', 'BCD234', '2024-05-21'),
('23456789B', 'CDE345', '2024-05-18'),
('34567890C', 'CDE345', '2024-05-22'),
('34567890C', 'DEF456', '2024-05-18'),
('45678901D', 'DEF456', '2024-05-23'),
('45678901D', 'EFG567', '2024-05-18'),
('56789012E', 'EFG567', '2024-05-24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete`
--

CREATE TABLE `paquete` (
  `codigo_paquete` int(11) NOT NULL,
  `descripcion` text,
  `destinatario` varchar(100) DEFAULT NULL,
  `direccion_destinatario` varchar(255) DEFAULT NULL,
  `codigo_provincia` int(11) DEFAULT NULL,
  `dni_camionero` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `paquete`
--

INSERT INTO `paquete` (`codigo_paquete`, `descripcion`, `destinatario`, `direccion_destinatario`, `codigo_provincia`, `dni_camionero`) VALUES
(1, 'Paquete 1', 'Carlos Garcia', 'Avenida Siempreviva 742', 1, '12345678A'),
(2, 'Paquete 2', 'Laura Ruiz', 'Calle Falsa 123', 2, '23456789B'),
(3, 'Paquete 3', 'Miguel Torres', 'Calle Verdadera 234', 3, '34567890C'),
(4, 'Paquete 4', 'Sandra Morales', 'Calle del Sol 456', 4, '45678901D'),
(5, 'Paquete 5', 'Fernando Ortega', 'Calle Luna 567', 5, '56789012E');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `codigo_provincia` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`codigo_provincia`, `nombre`) VALUES
(1, 'Madrid'),
(2, 'Barcelona'),
(3, 'Valencia'),
(4, 'Sevilla'),
(5, 'Bilbao');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `camion`
--
ALTER TABLE `camion`
  ADD PRIMARY KEY (`matricula`);

--
-- Indices de la tabla `camionero`
--
ALTER TABLE `camionero`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `conduccion`
--
ALTER TABLE `conduccion`
  ADD PRIMARY KEY (`dni_camionero`,`matricula`,`fecha`),
  ADD KEY `matricula` (`matricula`);

--
-- Indices de la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD PRIMARY KEY (`codigo_paquete`),
  ADD KEY `codigo_provincia` (`codigo_provincia`),
  ADD KEY `dni_camionero` (`dni_camionero`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`codigo_provincia`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `conduccion`
--
ALTER TABLE `conduccion`
  ADD CONSTRAINT `conduccion_ibfk_1` FOREIGN KEY (`dni_camionero`) REFERENCES `camionero` (`dni`),
  ADD CONSTRAINT `conduccion_ibfk_2` FOREIGN KEY (`matricula`) REFERENCES `camion` (`matricula`);

--
-- Filtros para la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD CONSTRAINT `paquete_ibfk_1` FOREIGN KEY (`codigo_provincia`) REFERENCES `provincia` (`codigo_provincia`),
  ADD CONSTRAINT `paquete_ibfk_2` FOREIGN KEY (`dni_camionero`) REFERENCES `camionero` (`dni`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
