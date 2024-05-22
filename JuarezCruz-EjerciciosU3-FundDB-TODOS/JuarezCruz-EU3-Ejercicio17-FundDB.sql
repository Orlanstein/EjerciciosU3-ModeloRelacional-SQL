-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 21-05-2024 a las 19:20:50
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
-- Base de datos: `centroedu`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id_alumno` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `poblacion` varchar(50) DEFAULT NULL,
  `dni` varchar(9) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id_alumno`, `nombre`, `apellidos`, `direccion`, `poblacion`, `dni`, `fecha_nacimiento`, `codigo_postal`, `telefono`) VALUES
(1, 'Pedro', 'Ramírez', 'Calle Norte 45', 'Madrid', '67890123F', '2000-02-14', '28002', '600678901'),
(2, 'Laura', 'Martínez', 'Calle Sur 67', 'Barcelona', '78901234G', '2001-06-18', '08002', '600789012'),
(3, 'David', 'Hernández', 'Calle Este 89', 'Valencia', '89012345H', '2002-10-25', '46002', '600890123'),
(4, 'Sara', 'González', 'Calle Oeste 101', 'Sevilla', '90123456I', '2003-12-05', '41002', '600901234'),
(5, 'Elena', 'Torres', 'Calle Centro 121', 'Bilbao', '01234567J', '1999-04-10', '48002', '600012345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `id_asignatura` int(11) NOT NULL,
  `codigo_asignatura` varchar(10) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `horas_semana` int(11) DEFAULT NULL,
  `id_profesor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`id_asignatura`, `codigo_asignatura`, `nombre`, `horas_semana`, `id_profesor`) VALUES
(1, 'MAT101', 'Matemáticas', 4, 1),
(2, 'HIS202', 'Español', 3, 2),
(3, 'FIS303', 'Física', 5, 3),
(4, 'QUI404', 'Química', 4, 4),
(5, 'LIT505', 'Programacion', 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas_aulas`
--

CREATE TABLE `asignaturas_aulas` (
  `id_asignatura` int(11) NOT NULL,
  `id_aula` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `dia` int(11) NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignaturas_aulas`
--

INSERT INTO `asignaturas_aulas` (`id_asignatura`, `id_aula`, `mes`, `dia`, `hora`) VALUES
(1, 1, 1, 15, '08:00:00'),
(2, 2, 2, 20, '09:00:00'),
(3, 3, 3, 25, '10:00:00'),
(4, 4, 4, 10, '11:00:00'),
(5, 5, 5, 5, '12:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas_cursos`
--

CREATE TABLE `asignaturas_cursos` (
  `id_asignatura` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignaturas_cursos`
--

INSERT INTO `asignaturas_cursos` (`id_asignatura`, `id_curso`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE `aulas` (
  `id_aula` int(11) NOT NULL,
  `codigo_aula` varchar(10) DEFAULT NULL,
  `piso` int(11) DEFAULT NULL,
  `numero_pupitres` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aulas`
--

INSERT INTO `aulas` (`id_aula`, `codigo_aula`, `piso`, `numero_pupitres`) VALUES
(1, 'A101', 1, 30),
(2, 'A202', 2, 25),
(3, 'A303', 3, 20),
(4, 'A404', 4, 35),
(5, 'A505', 5, 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` int(11) NOT NULL,
  `codigo_curso` varchar(10) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id_curso`, `codigo_curso`, `nombre`) VALUES
(1, 'CUR001', 'Primero de Bachillerato'),
(2, 'CUR002', 'Segundo de Bachillerato'),
(3, 'CUR003', 'Primero de ESO'),
(4, 'CUR004', 'Segundo de ESO'),
(5, 'CUR005', 'Tercero de ESO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matriculas`
--

CREATE TABLE `matriculas` (
  `id_matricula` int(11) NOT NULL,
  `id_alumno` int(11) DEFAULT NULL,
  `id_asignatura` int(11) DEFAULT NULL,
  `nota` decimal(4,2) DEFAULT NULL,
  `incidencias` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `matriculas`
--

INSERT INTO `matriculas` (`id_matricula`, `id_alumno`, `id_asignatura`, `nota`, `incidencias`) VALUES
(1, 1, 1, '8.50', 'Ninguna'),
(2, 2, 2, '7.00', 'Faltas de asistencia'),
(3, 3, 3, '9.00', 'Ninguna'),
(4, 4, 4, '6.50', 'Incidente menor en clase'),
(5, 5, 5, '8.00', 'Ninguna');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `id_profesor` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `poblacion` varchar(50) DEFAULT NULL,
  `dni` varchar(9) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`id_profesor`, `nombre`, `apellidos`, `direccion`, `poblacion`, `dni`, `fecha_nacimiento`, `codigo_postal`, `telefono`) VALUES
(1, 'Juan', 'Pérez', 'Calle Mondriz 123', 'Madrid', '12345678A', '1970-01-15', '28001', '600123456'),
(2, 'Ana', 'López', 'Avenida Nova 675', 'Barcelona', '23456789B', '1980-05-23', '08001', '600234567'),
(3, 'Luis', 'García', 'Calle Luna 4', 'Valencia', '34567890C', '1975-08-30', '46001', '600345678'),
(4, 'Marta', 'Sánchez', 'Calle Sol 9', 'Sevilla', '45678901D', '1985-11-11', '41001', '600456789'),
(5, 'Carlos', 'Fernández', 'Aaguiire 10', 'Bilbao', '56789012E', '1965-03-22', '48001', '600567890');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutores`
--

CREATE TABLE `tutores` (
  `id_profesor` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tutores`
--

INSERT INTO `tutores` (`id_profesor`, `id_curso`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id_alumno`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`id_asignatura`),
  ADD UNIQUE KEY `codigo_asignatura` (`codigo_asignatura`),
  ADD KEY `id_profesor` (`id_profesor`);

--
-- Indices de la tabla `asignaturas_aulas`
--
ALTER TABLE `asignaturas_aulas`
  ADD PRIMARY KEY (`id_asignatura`,`id_aula`,`mes`,`dia`,`hora`),
  ADD KEY `id_aula` (`id_aula`);

--
-- Indices de la tabla `asignaturas_cursos`
--
ALTER TABLE `asignaturas_cursos`
  ADD PRIMARY KEY (`id_asignatura`,`id_curso`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indices de la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`id_aula`),
  ADD UNIQUE KEY `codigo_aula` (`codigo_aula`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_curso`),
  ADD UNIQUE KEY `codigo_curso` (`codigo_curso`);

--
-- Indices de la tabla `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`id_matricula`),
  ADD KEY `id_alumno` (`id_alumno`),
  ADD KEY `id_asignatura` (`id_asignatura`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id_profesor`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `tutores`
--
ALTER TABLE `tutores`
  ADD PRIMARY KEY (`id_profesor`,`id_curso`),
  ADD KEY `id_curso` (`id_curso`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `id_asignatura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `aulas`
--
ALTER TABLE `aulas`
  MODIFY `id_aula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `matriculas`
--
ALTER TABLE `matriculas`
  MODIFY `id_matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `id_profesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD CONSTRAINT `asignaturas_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`);

--
-- Filtros para la tabla `asignaturas_aulas`
--
ALTER TABLE `asignaturas_aulas`
  ADD CONSTRAINT `asignaturas_aulas_ibfk_1` FOREIGN KEY (`id_asignatura`) REFERENCES `asignaturas` (`id_asignatura`),
  ADD CONSTRAINT `asignaturas_aulas_ibfk_2` FOREIGN KEY (`id_aula`) REFERENCES `aulas` (`id_aula`);

--
-- Filtros para la tabla `asignaturas_cursos`
--
ALTER TABLE `asignaturas_cursos`
  ADD CONSTRAINT `asignaturas_cursos_ibfk_1` FOREIGN KEY (`id_asignatura`) REFERENCES `asignaturas` (`id_asignatura`),
  ADD CONSTRAINT `asignaturas_cursos_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`);

--
-- Filtros para la tabla `matriculas`
--
ALTER TABLE `matriculas`
  ADD CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id_alumno`),
  ADD CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `asignaturas` (`id_asignatura`);

--
-- Filtros para la tabla `tutores`
--
ALTER TABLE `tutores`
  ADD CONSTRAINT `tutores_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`),
  ADD CONSTRAINT `tutores_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
