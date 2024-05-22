-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-05-2024 a las 17:24:38
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
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `codigo_autor` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`codigo_autor`, `nombre`) VALUES
(1, 'Gabriel Garcia Marquez'),
(2, 'J.K. Rowling'),
(3, 'George Orwell'),
(4, 'Jane Austen'),
(5, 'Mark Twain');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor_libro`
--

CREATE TABLE `autor_libro` (
  `codigo_autor` int(11) NOT NULL,
  `codigo_libro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `autor_libro`
--

INSERT INTO `autor_libro` (`codigo_autor`, `codigo_libro`) VALUES
(1, 1),
(4, 1),
(2, 2),
(5, 2),
(1, 3),
(3, 3),
(2, 4),
(4, 4),
(3, 5),
(5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplar`
--

CREATE TABLE `ejemplar` (
  `codigo_ejemplar` int(11) NOT NULL,
  `localizacion` varchar(100) DEFAULT NULL,
  `codigo_libro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ejemplar`
--

INSERT INTO `ejemplar` (`codigo_ejemplar`, `localizacion`, `codigo_libro`) VALUES
(1, 'Estante A1', 1),
(2, 'Estante A2', 1),
(3, 'Estante B1', 2),
(4, 'Estante B2', 2),
(5, 'Estante C1', 3),
(6, 'Estante C2', 3),
(7, 'Estante D1', 4),
(8, 'Estante D2', 4),
(9, 'Estante E1', 5),
(10, 'Estante E2', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `codigo_libro` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `editorial` varchar(100) DEFAULT NULL,
  `num_paginas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`codigo_libro`, `titulo`, `isbn`, `editorial`, `num_paginas`) VALUES
(1, 'Cien Años de Soledad', '978-3-16-148410-0', 'Sudamericana', 417),
(2, 'Harry Potter y la Piedra Filosofal', '978-1-4088-5565-2', 'Bloomsbury', 223),
(3, '1984', '978-0-452-28423-4', 'Secker & Warburg', 328),
(4, 'Orgullo y Prejuicio', '978-0-19-283355-7', 'T. Egerton', 279),
(5, 'Las Aventuras de Tom Sawyer', '978-0-14-303956-3', 'American Publishing Company', 274);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `codigo_usuario` int(11) NOT NULL,
  `codigo_ejemplar` int(11) NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`codigo_usuario`, `codigo_ejemplar`, `fecha_prestamo`, `fecha_devolucion`) VALUES
(1, 1, '2024-05-01', '2024-05-10'),
(1, 2, '2024-05-06', '2024-05-15'),
(2, 3, '2024-05-02', '2024-05-11'),
(2, 4, '2024-05-07', '2024-05-16'),
(3, 5, '2024-05-03', '2024-05-12'),
(3, 6, '2024-05-08', '2024-05-17'),
(4, 7, '2024-05-04', '2024-05-13'),
(4, 8, '2024-05-09', '2024-05-18'),
(5, 9, '2024-05-05', '2024-05-14'),
(5, 10, '2024-05-10', '2024-05-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `codigo_usuario` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`codigo_usuario`, `nombre`, `direccion`, `telefono`) VALUES
(1, 'Carlos Mendoza', 'Calle Falsa 123', '600123456'),
(2, 'Laura Fernandez', 'Avenida Siempreviva 742', '600234567'),
(3, 'Miguel Santos', 'Calle del Sol 456', '600345678'),
(4, 'Ana Torres', 'Calle Luna 567', '600456789'),
(5, 'Jose Martinez', 'Calle Verde 789', '600567890');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`codigo_autor`);

--
-- Indices de la tabla `autor_libro`
--
ALTER TABLE `autor_libro`
  ADD PRIMARY KEY (`codigo_autor`,`codigo_libro`),
  ADD KEY `codigo_libro` (`codigo_libro`);

--
-- Indices de la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD PRIMARY KEY (`codigo_ejemplar`),
  ADD KEY `codigo_libro` (`codigo_libro`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`codigo_libro`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`codigo_usuario`,`codigo_ejemplar`,`fecha_prestamo`),
  ADD KEY `codigo_ejemplar` (`codigo_ejemplar`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`codigo_usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autor_libro`
--
ALTER TABLE `autor_libro`
  ADD CONSTRAINT `autor_libro_ibfk_1` FOREIGN KEY (`codigo_autor`) REFERENCES `autor` (`codigo_autor`),
  ADD CONSTRAINT `autor_libro_ibfk_2` FOREIGN KEY (`codigo_libro`) REFERENCES `libro` (`codigo_libro`);

--
-- Filtros para la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD CONSTRAINT `ejemplar_ibfk_1` FOREIGN KEY (`codigo_libro`) REFERENCES `libro` (`codigo_libro`);

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuario` (`codigo_usuario`),
  ADD CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`codigo_ejemplar`) REFERENCES `ejemplar` (`codigo_ejemplar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
