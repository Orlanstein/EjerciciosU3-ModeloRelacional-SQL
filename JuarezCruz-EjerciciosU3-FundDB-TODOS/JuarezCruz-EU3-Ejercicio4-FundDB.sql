-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2024 a las 06:25:11
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
-- Base de datos: `ejercicio4`
--
CREATE DATABASE IF NOT EXISTS `ejercicio4` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ejercicio4`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `codigo_interno` int(11) NOT NULL,
  `NIF` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`codigo_interno`, `NIF`, `nombre`, `direccion`, `ciudad`, `telefono`) VALUES
(1, '12345678A', 'Juan Perez', 'Calle Falsa 123', 'Madrid', '600123456'),
(2, '23456789B', 'Maria Lopez', 'Avenida Siempreviva 742', 'Barcelona', '600234567'),
(3, '34567890C', 'Luis Garcia', 'Plaza Mayor 1', 'Sevilla', '600345678'),
(4, '45678901D', 'Ana Sanchez', 'Calle Luna 45', 'Valencia', '600456789'),
(5, '56789012E', 'Carlos Martinez', 'Calle Sol 67', 'Bilbao', '600567890');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coche`
--

CREATE TABLE `coche` (
  `matricula` varchar(20) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `coche`
--

INSERT INTO `coche` (`matricula`, `marca`, `modelo`, `color`, `precio_venta`) VALUES
('1234ABC', 'Toyota', 'Corolla', 'Rojo', 15000.00),
('2345BCD', 'Honda', 'Civic', 'Azul', 18000.00),
('3456CDE', 'Ford', 'Focus', 'Negro', 17000.00),
('4567DEF', 'BMW', 'Serie 3', 'Blanco', 35000.00),
('5678EFG', 'Audi', 'A4', 'Gris', 30000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `codigo_interno` int(11) NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `fecha_compra` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`codigo_interno`, `matricula`, `fecha_compra`) VALUES
(1, '1234ABC', '2024-01-15'),
(2, '2345BCD', '2024-02-20'),
(3, '3456CDE', '2024-03-10'),
(4, '4567DEF', '2024-04-05'),
(5, '5678EFG', '2024-05-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revision`
--

CREATE TABLE `revision` (
  `codigo` int(11) NOT NULL,
  `cambio_filtro` tinyint(1) DEFAULT NULL,
  `cambio_aceite` tinyint(1) DEFAULT NULL,
  `cambio_frenos` tinyint(1) DEFAULT NULL,
  `otros` text DEFAULT NULL,
  `matricula` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `revision`
--

INSERT INTO `revision` (`codigo`, `cambio_filtro`, `cambio_aceite`, `cambio_frenos`, `otros`, `matricula`) VALUES
(1, 1, 1, 0, 'Revisión general', '1234ABC'),
(2, 0, 1, 1, 'Cambio de frenos y aceite', '2345BCD'),
(3, 1, 0, 1, 'Cambio de filtro y frenos', '3456CDE'),
(4, 1, 1, 1, 'Revisión completa', '4567DEF'),
(5, 0, 0, 0, 'Solo revisión básica', '5678EFG');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codigo_interno`);

--
-- Indices de la tabla `coche`
--
ALTER TABLE `coche`
  ADD PRIMARY KEY (`matricula`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`codigo_interno`,`matricula`),
  ADD KEY `matricula` (`matricula`);

--
-- Indices de la tabla `revision`
--
ALTER TABLE `revision`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `matricula` (`matricula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codigo_interno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `revision`
--
ALTER TABLE `revision`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`codigo_interno`) REFERENCES `cliente` (`codigo_interno`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`matricula`) REFERENCES `coche` (`matricula`);

--
-- Filtros para la tabla `revision`
--
ALTER TABLE `revision`
  ADD CONSTRAINT `revision_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `coche` (`matricula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
