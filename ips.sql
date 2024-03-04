-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-03-2024 a las 21:46:19
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ips`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autorizacion`
--

CREATE TABLE `autorizacion` (
  `id_autorizacion` int(11) NOT NULL,
  `fecha_autorizacion` date DEFAULT NULL,
  `servicio` varchar(30) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_eps` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `autorizacion`
--

INSERT INTO `autorizacion` (`id_autorizacion`, `fecha_autorizacion`, `servicio`, `id_paciente`, `id_eps`) VALUES
(1, '2024-03-01', 'Consulta Médica', 1, 1),
(2, '2024-03-02', 'Análisis de Sangre', 2, 2),
(3, '2024-03-03', 'Radiografía', 3, 3),
(4, '2024-03-04', 'Cirugía Menor', 4, 4),
(5, '2024-03-05', 'Tratamiento Fisioterapéutico', 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eps`
--

CREATE TABLE `eps` (
  `id_eps` int(11) NOT NULL,
  `nombre_eps` varchar(45) NOT NULL,
  `afiliacion_paciente` varchar(45) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `eps`
--

INSERT INTO `eps` (`id_eps`, `nombre_eps`, `afiliacion_paciente`, `direccion`, `correo`, `telefono`) VALUES
(1, 'EPS SaludTotal', 'ST123456', 'Carrera 123, Ciudad', 'info@saludtotal.com', '555-1111'),
(2, 'EPS Coomeva', 'CV789012', 'Avenida 456, Pueblo', 'info@coomeva.com', '555-2222'),
(3, 'EPS Sura', 'SR345678', 'Plaza 789, Villa', 'info@sura.com', '555-3333'),
(4, 'EPS Sanitas', 'SN456789', 'Calle 567, Pueblo', 'info@sanitas.com', '555-4444'),
(5, 'EPS Cruz Blanca', 'CB567890', 'Avenida 890, Ciudad', 'info@cruzblanca.com', '555-5555');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia_clinica`
--

CREATE TABLE `historia_clinica` (
  `id_historia_clinica` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `observacion` text NOT NULL,
  `diagnostico_medico` text NOT NULL,
  `antecedentes_medicos` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historia_clinica`
--

INSERT INTO `historia_clinica` (`id_historia_clinica`, `fecha_creacion`, `observacion`, `diagnostico_medico`, `antecedentes_medicos`) VALUES
(1, '2024-02-15', 'Paciente presenta fiebre y dolor de garganta.', 'Amigdalitis aguda', 'Ninguno'),
(2, '2024-01-20', 'Paciente se queja de dolores abdominales.', 'Gastritis', 'Intolerancia a la lactosa'),
(3, '2024-03-05', 'Paciente con mareos y pérdida de equilibrio.', 'Vértigo benigno', 'Hipertensión arterial'),
(4, '2024-02-10', 'Paciente embarazada en su tercer trimestre.', 'Embarazo normal', 'Diabetes gestacional'),
(5, '2024-01-05', 'Paciente con dolor de cabeza persistente.', 'Migraña crónica', 'Antecedentes familiares de migraña');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia_clinica_medico`
--

CREATE TABLE `historia_clinica_medico` (
  `id_historia_clinica` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historia_clinica_medico`
--

INSERT INTO `historia_clinica_medico` (`id_historia_clinica`, `id_medico`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `id_medico` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `especialidad` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`id_medico`, `nombre`, `especialidad`) VALUES
(1, 'Juan Pérez', 'Cardiología'),
(2, 'Ana Gómez', 'Pediatría'),
(3, 'Laura Rodríguez', 'Oncología'),
(4, 'Carlos Martínez', 'Ginecología'),
(5, 'María López', 'Neurología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico_sede`
--

CREATE TABLE `medico_sede` (
  `id_medico` int(11) DEFAULT NULL,
  `id_sede` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medico_sede`
--

INSERT INTO `medico_sede` (`id_medico`, `id_sede`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `cedula` varchar(15) NOT NULL,
  `genero` char(1) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `rh` varchar(3) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `nombre`, `fecha_nacimiento`, `cedula`, `genero`, `direccion`, `rh`, `correo`, `telefono`) VALUES
(1, 'Juan Pérez', '1990-05-15', '123456789', 'M', 'Calle 123, Ciudad', 'O+', 'juan.perez@email.com', '555-1234'),
(2, 'Ana Gómez', '1985-08-22', '987654321', 'F', 'Avenida 456, Pueblo', 'A-', 'ana.gomez@email.com', '555-5678'),
(3, 'Carlos Rodríguez', '1998-02-10', '234567890', 'M', 'Plaza 789, Villa', 'B+', 'carlos.rodriguez@email.com', '555-9012'),
(4, 'María López', '1980-11-30', '345678901', 'F', 'Calle 567, Pueblo', 'AB-', NULL, '555-3456'),
(5, 'Pedro Ramírez', '1995-07-18', '456789012', 'M', 'Avenida 890, Ciudad', 'O-', 'pedro.ramirez@email.com', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `id_sede` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sede`
--

INSERT INTO `sede` (`id_sede`, `nombre`, `direccion`, `correo`, `telefono`) VALUES
(1, 'Sede Principal', 'Calle Principal 123, Ciudad', 'info@sedeprincipal.com', '555-1111'),
(2, 'Sede Norte', 'Avenida Norte 456, Pueblo', 'info@sedenorte.com', '555-2222'),
(3, 'Sede Sur', 'Plaza Sur 789, Villa', 'info@sedesur.com', '555-3333'),
(4, 'Sede Este', 'Carrera Este 567, Pueblo', 'info@sedeeste.com', '555-4444'),
(5, 'Sede Oeste', 'Calle Oeste 890, Ciudad', 'info@sedeoeste.com', '555-5555');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede_eps`
--

CREATE TABLE `sede_eps` (
  `id_sede` int(11) DEFAULT NULL,
  `id_eps` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sede_eps`
--

INSERT INTO `sede_eps` (`id_sede`, `id_eps`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autorizacion`
--
ALTER TABLE `autorizacion`
  ADD PRIMARY KEY (`id_autorizacion`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_eps` (`id_eps`);

--
-- Indices de la tabla `eps`
--
ALTER TABLE `eps`
  ADD PRIMARY KEY (`id_eps`);

--
-- Indices de la tabla `historia_clinica`
--
ALTER TABLE `historia_clinica`
  ADD PRIMARY KEY (`id_historia_clinica`);

--
-- Indices de la tabla `historia_clinica_medico`
--
ALTER TABLE `historia_clinica_medico`
  ADD KEY `id_historia_clinica` (`id_historia_clinica`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_medico`);

--
-- Indices de la tabla `medico_sede`
--
ALTER TABLE `medico_sede`
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_sede` (`id_sede`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`id_sede`);

--
-- Indices de la tabla `sede_eps`
--
ALTER TABLE `sede_eps`
  ADD KEY `id_sede` (`id_sede`),
  ADD KEY `id_eps` (`id_eps`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autorizacion`
--
ALTER TABLE `autorizacion`
  MODIFY `id_autorizacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `eps`
--
ALTER TABLE `eps`
  MODIFY `id_eps` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `historia_clinica`
--
ALTER TABLE `historia_clinica`
  MODIFY `id_historia_clinica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `medico`
--
ALTER TABLE `medico`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sede`
--
ALTER TABLE `sede`
  MODIFY `id_sede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autorizacion`
--
ALTER TABLE `autorizacion`
  ADD CONSTRAINT `autorizacion_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`),
  ADD CONSTRAINT `autorizacion_ibfk_2` FOREIGN KEY (`id_eps`) REFERENCES `eps` (`id_eps`);

--
-- Filtros para la tabla `historia_clinica_medico`
--
ALTER TABLE `historia_clinica_medico`
  ADD CONSTRAINT `historia_clinica_medico_ibfk_1` FOREIGN KEY (`id_historia_clinica`) REFERENCES `historia_clinica` (`id_historia_clinica`),
  ADD CONSTRAINT `historia_clinica_medico_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`);

--
-- Filtros para la tabla `medico_sede`
--
ALTER TABLE `medico_sede`
  ADD CONSTRAINT `medico_sede_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  ADD CONSTRAINT `medico_sede_ibfk_2` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`);

--
-- Filtros para la tabla `sede_eps`
--
ALTER TABLE `sede_eps`
  ADD CONSTRAINT `sede_eps_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`),
  ADD CONSTRAINT `sede_eps_ibfk_2` FOREIGN KEY (`id_eps`) REFERENCES `eps` (`id_eps`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
