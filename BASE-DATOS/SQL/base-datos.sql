-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2020 a las 18:56:28
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `base-datos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo_contratista`
--

CREATE TABLE `cargo_contratista` (
  `id_cargo_contratista` int(11) NOT NULL,
  `cargo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cargo_contratista`
--

INSERT INTO `cargo_contratista` (`id_cargo_contratista`, `cargo`) VALUES
(1, 'admin'),
(2, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratista`
--

CREATE TABLE `contratista` (
  `id_contratista` int(11) NOT NULL,
  `nombres` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellidos` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fk_tipo_documento` int(11) NOT NULL,
  `numero_documento` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fk_genero` int(11) NOT NULL,
  `fk_cargo` int(11) NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `direccion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fk_localidad` int(11) NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contraseña` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `celular` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fk_eps` int(11) DEFAULT NULL,
  `fk_sede_contratista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `contratista`
--

INSERT INTO `contratista` (`id_contratista`, `nombres`, `apellidos`, `fk_tipo_documento`, `numero_documento`, `fk_genero`, `fk_cargo`, `edad`, `direccion`, `fk_localidad`, `email`, `contraseña`, `celular`, `telefono`, `fk_eps`, `fk_sede_contratista`) VALUES
(22, 'juan David', 'carooo', 1, '1000840465', 1, 1, 18, 'cll155bis840', 1, 'juandiscaro2008@gmail.com', '12345', '3108019951', '3108016681', 1, 1),
(23, 'asfasf', 'asfasf', 2, 'asfasf', 2, 1, 0, '', 1, 'asfasf', 'asfasf', 'asfasf', 'asfasf', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `id_contrato` int(11) NOT NULL,
  `fk_contratista` int(11) NOT NULL,
  `nombreCompleto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cedula` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `fk_estado` int(11) DEFAULT NULL,
  `fk_tipo_contrato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `contrato`
--

INSERT INTO `contrato` (`id_contrato`, `fk_contratista`, `nombreCompleto`, `cedula`, `fecha_inicio`, `fecha_fin`, `fk_estado`, `fk_tipo_contrato`) VALUES
(4, 22, ' juan david caro martinez', '1000952019', '2020-03-16', '2020-03-15', 1, 1),
(5, 23, ' luisa fernanda', '1000952019', '2020-11-24', '2020-11-12', 1, 1),
(6, 22, ' juan david caro martinez', '1000952019', '2020-11-07', '2020-11-27', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eps`
--

CREATE TABLE `eps` (
  `id_eps` int(11) NOT NULL,
  `nombre_eps` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `eps`
--

INSERT INTO `eps` (`id_eps`, `nombre_eps`) VALUES
(1, 'Medimas'),
(2, 'Famisanar'),
(3, 'Nueva EPS'),
(4, 'Salud Total'),
(5, 'Sura/Suramericana'),
(6, 'Aliansalud'),
(7, 'Sanitas'),
(8, 'Compensar '),
(9, 'Coomeva'),
(10, 'Saludvida'),
(11, 'Cafesalud'),
(12, 'Comfandi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_contrato`
--

CREATE TABLE `estado_contrato` (
  `id_estado_contrato` int(11) NOT NULL,
  `nombre_estado_contrato` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `estado_contrato`
--

INSERT INTO `estado_contrato` (`id_estado_contrato`, `nombre_estado_contrato`) VALUES
(1, 'Aprovado'),
(2, 'Cancelado'),
(3, 'Cerrado'),
(4, 'Borrador'),
(5, 'Vencido'),
(6, 'Revisado'),
(7, 'Suspendido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `firma_digital`
--

CREATE TABLE `firma_digital` (
  `id_firma_digital` int(11) NOT NULL,
  `fk_tipo_documento_firma` int(11) NOT NULL,
  `numero_documento_firma` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono_firma` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombres_firma` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archivo_firma` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `id_genero` int(11) NOT NULL,
  `genero` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id_genero`, `genero`) VALUES
(1, 'Hombre '),
(2, 'Mujer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `id_localidad` int(11) NOT NULL,
  `localidad` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`id_localidad`, `localidad`) VALUES
(1, 'Usaquen'),
(2, 'Chapinero'),
(3, 'Santa Fe'),
(4, 'San Cristobal'),
(5, 'Usme '),
(6, 'Tunjuelito'),
(7, 'Bosa '),
(8, 'Kennedy'),
(9, 'Fontibon'),
(10, 'Engativa'),
(11, 'Suba '),
(12, 'Barrios Unidos '),
(13, 'Teusaquillo'),
(14, 'Los Martines'),
(15, 'Antonio Nariño'),
(16, 'Puente Aranda'),
(17, 'La Candelaria'),
(18, 'Rafael Uribe Uribe'),
(19, 'Ciudad Bolivar'),
(20, 'Sumapaz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `id_sede` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` char(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`id_sede`, `nombre`, `direccion`, `telefono`) VALUES
(1, 'arquitecto en estupides', 'cll155bis#7-70', '32135431');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_contrato`
--

CREATE TABLE `tipo_contrato` (
  `id_tipo_contrato` int(11) NOT NULL,
  `tipo_contrato` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_contrato`
--

INSERT INTO `tipo_contrato` (`id_tipo_contrato`, `tipo_contrato`) VALUES
(1, 'Contrato idefinido'),
(2, 'Contrato temporal'),
(3, 'Por obra o servicio'),
(4, 'Eventual'),
(5, 'De interinidad'),
(6, 'De relevo'),
(7, 'De formacion y aprendizaj'),
(8, 'Contrato de practicas ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id_tipo_documento` int(11) NOT NULL,
  `tipo_documento` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id_tipo_documento`, `tipo_documento`) VALUES
(1, 'Ti'),
(2, 'CC');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo_contratista`
--
ALTER TABLE `cargo_contratista`
  ADD PRIMARY KEY (`id_cargo_contratista`);

--
-- Indices de la tabla `contratista`
--
ALTER TABLE `contratista`
  ADD PRIMARY KEY (`id_contratista`),
  ADD KEY `fk_tipo_documento` (`fk_tipo_documento`),
  ADD KEY `fk_genero` (`fk_genero`),
  ADD KEY `fk_cargo` (`fk_cargo`),
  ADD KEY `fk_localidad` (`fk_localidad`),
  ADD KEY `fk_eps` (`fk_eps`),
  ADD KEY `fk_sede_contratista` (`fk_sede_contratista`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`id_contrato`),
  ADD KEY `fk_tipo_contrato` (`fk_tipo_contrato`),
  ADD KEY `fk_estado` (`fk_estado`),
  ADD KEY `fk_contratista` (`fk_contratista`);

--
-- Indices de la tabla `eps`
--
ALTER TABLE `eps`
  ADD PRIMARY KEY (`id_eps`);

--
-- Indices de la tabla `estado_contrato`
--
ALTER TABLE `estado_contrato`
  ADD PRIMARY KEY (`id_estado_contrato`);

--
-- Indices de la tabla `firma_digital`
--
ALTER TABLE `firma_digital`
  ADD PRIMARY KEY (`id_firma_digital`),
  ADD KEY `fk_tipo_documento_firma` (`fk_tipo_documento_firma`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`id_localidad`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`id_sede`);

--
-- Indices de la tabla `tipo_contrato`
--
ALTER TABLE `tipo_contrato`
  ADD PRIMARY KEY (`id_tipo_contrato`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id_tipo_documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo_contratista`
--
ALTER TABLE `cargo_contratista`
  MODIFY `id_cargo_contratista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `contratista`
--
ALTER TABLE `contratista`
  MODIFY `id_contratista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `contrato`
--
ALTER TABLE `contrato`
  MODIFY `id_contrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `eps`
--
ALTER TABLE `eps`
  MODIFY `id_eps` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `estado_contrato`
--
ALTER TABLE `estado_contrato`
  MODIFY `id_estado_contrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `firma_digital`
--
ALTER TABLE `firma_digital`
  MODIFY `id_firma_digital` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `id_localidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `id_sede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_contrato`
--
ALTER TABLE `tipo_contrato`
  MODIFY `id_tipo_contrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contratista`
--
ALTER TABLE `contratista`
  ADD CONSTRAINT `contratista_ibfk_1` FOREIGN KEY (`fk_tipo_documento`) REFERENCES `tipo_documento` (`id_tipo_documento`),
  ADD CONSTRAINT `contratista_ibfk_2` FOREIGN KEY (`fk_genero`) REFERENCES `generos` (`id_genero`),
  ADD CONSTRAINT `contratista_ibfk_3` FOREIGN KEY (`fk_cargo`) REFERENCES `cargo_contratista` (`id_cargo_contratista`),
  ADD CONSTRAINT `contratista_ibfk_4` FOREIGN KEY (`fk_localidad`) REFERENCES `localidad` (`id_localidad`),
  ADD CONSTRAINT `contratista_ibfk_5` FOREIGN KEY (`fk_eps`) REFERENCES `eps` (`id_eps`),
  ADD CONSTRAINT `contratista_ibfk_6` FOREIGN KEY (`fk_sede_contratista`) REFERENCES `sedes` (`id_sede`);

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`fk_tipo_contrato`) REFERENCES `tipo_contrato` (`id_tipo_contrato`),
  ADD CONSTRAINT `contrato_ibfk_2` FOREIGN KEY (`fk_estado`) REFERENCES `estado_contrato` (`id_estado_contrato`),
  ADD CONSTRAINT `contrato_ibfk_3` FOREIGN KEY (`fk_contratista`) REFERENCES `contratista` (`id_contratista`);

--
-- Filtros para la tabla `firma_digital`
--
ALTER TABLE `firma_digital`
  ADD CONSTRAINT `firma_digital_ibfk_1` FOREIGN KEY (`fk_tipo_documento_firma`) REFERENCES `tipo_documento` (`id_tipo_documento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
