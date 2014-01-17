-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-01-2014 a las 05:21:37
-- Versión del servidor: 5.5.32
-- Versión de PHP: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `correo`
--
CREATE DATABASE IF NOT EXISTS `correo` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `correo`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE IF NOT EXISTS `contactos` (
  `keyC` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` char(20) COLLATE utf8_spanish2_ci NOT NULL,
  `ubicacion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(14) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`keyC`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `contactos`
--

INSERT INTO `contactos` (`keyC`, `tipo`, `ubicacion`, `nombre`, `telefono`, `direccion`) VALUES
(1, 'empleado', 'dentroum', 'EVARISTO LOPEZ', 'null', '8262633333'),
(2, 'empleado', 'dentroum', 'JUAN TORRES', 'null', '8262633333'),
(3, 'empleado', 'dentroum', 'ISIDRO LOPEZ', 'null', '8262633333'),
(4, 'TIPO CONTACTO', 'UBICACION', 'JOSE SANTIAGO', '12332323', 'direccion'),
(5, 'TIPO CONTACTO', 'UBICACION', 'JOEL ANTONIO', '12332323', 'direccion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nsolicitud`
--

CREATE TABLE IF NOT EXISTS `nsolicitud` (
  `keyNS` int(11) NOT NULL AUTO_INCREMENT,
  `numSolicitud` int(11) NOT NULL,
  `e` int(11) NOT NULL,
  PRIMARY KEY (`keyNS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE IF NOT EXISTS `proveedores` (
  `keyP` int(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `id_proveedor` char(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`keyP`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`keyP`, `nombre`, `id_proveedor`) VALUES
(1, 'DHL', NULL),
(2, 'ESTAFETA', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrarpaquetes`
--

CREATE TABLE IF NOT EXISTS `registrarpaquetes` (
  `keyRP` int(11) NOT NULL AUTO_INCREMENT,
  `keyC` int(11) DEFAULT NULL,
  `keyP` int(11) NOT NULL,
  `usuario` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nombreProveedor` varchar(150) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nombreContacto` varchar(150) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fecha` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `hora` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `status` char(15) COLLATE utf8_spanish2_ci NOT NULL,
  `fechaEntrega` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`keyRP`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `registrarpaquetes`
--

INSERT INTO `registrarpaquetes` (`keyRP`, `keyC`, `keyP`, `usuario`, `nombreProveedor`, `nombreContacto`, `fecha`, `hora`, `status`, `fechaEntrega`) VALUES
(1, NULL, 1, NULL, NULL, NULL, '2014-01-16 21:18:48', NULL, 'recibido', ''),
(2, NULL, 1, NULL, NULL, NULL, '2014-01-16 21:24:17', NULL, 'recibido', ''),
(3, NULL, 1, NULL, NULL, NULL, '2014-01-16 21:25:30', NULL, 'recibido', ''),
(4, NULL, 1, NULL, NULL, NULL, '2014-01-16 21:25:41', NULL, 'entregado', ''),
(5, NULL, 1, NULL, NULL, NULL, '2014-01-16 21:26:15', NULL, 'recibido', ''),
(6, NULL, 1, NULL, NULL, NULL, '2014-01-16 21:26:44', NULL, 'recibido', ''),
(7, NULL, 2, NULL, NULL, NULL, '2014-01-16 21:26:49', NULL, 'recibido', ''),
(8, NULL, 2, NULL, NULL, NULL, '2014-01-16 21:36:17', NULL, 'recibido', ''),
(9, NULL, 2, NULL, NULL, NULL, '2014-01-16 21:36:48', NULL, 'recibido', ''),
(10, NULL, 2, NULL, NULL, NULL, '2014-01-16 21:39:03', NULL, 'recibido', ''),
(11, NULL, 2, NULL, NULL, NULL, '2014-01-16 21:39:24', NULL, 'recibido', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `keyUser` int(4) NOT NULL AUTO_INCREMENT,
  `usuario` char(20) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `tipoUsuario` char(2) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`keyUser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`keyUser`, `usuario`, `nombre`, `tipoUsuario`, `password`, `email`) VALUES
(1, 'evaristo', 'Evaristo Lopez', '1', 'prueba', 'elopez@um.edu.mx'),
(2, 'jgomez', 'JOSE GOMEZ', '1', 'prueba', 'jgomez@um.edu.mx');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
