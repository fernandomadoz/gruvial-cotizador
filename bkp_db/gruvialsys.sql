-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2022 a las 01:48:40
-- Versión del servidor: 5.7.14
-- Versión de PHP: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gruvialsys`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_accion_de_mantenimiento`
--

CREATE TABLE `tb_accion_de_mantenimiento` (
  `id_accion_de_mantenimiento` int(10) UNSIGNED NOT NULL,
  `fecha_now` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tb_tipo_accion_de_mantenimiento` int(11) NOT NULL,
  `tb_maquina` int(11) NOT NULL,
  `fecha_de_realizaion` date NOT NULL,
  `km_hs` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_accion_de_mantenimiento`
--

INSERT INTO `tb_accion_de_mantenimiento` (`id_accion_de_mantenimiento`, `fecha_now`, `tb_tipo_accion_de_mantenimiento`, `tb_maquina`, `fecha_de_realizaion`, `km_hs`) VALUES
(1, '0000-00-00 00:00:00', 2, 1, '2008-02-13', 0),
(2, '0000-00-00 00:00:00', 2, 1, '2009-01-27', 3000),
(3, '0000-00-00 00:00:00', 6, 1, '2009-01-27', 3000),
(4, '2009-01-30 07:51:28', 1, 5, '2009-01-27', 3000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_alarma`
--

CREATE TABLE `tb_alarma` (
  `id_alarma` int(10) UNSIGNED NOT NULL,
  `tb_tipo_de_alarma` int(10) UNSIGNED NOT NULL,
  `id_1` int(10) UNSIGNED DEFAULT NULL,
  `id_2` int(10) UNSIGNED DEFAULT NULL,
  `id_3` int(10) UNSIGNED DEFAULT NULL,
  `mensaje_de_alarma` text NOT NULL,
  `campo_1` varchar(250) DEFAULT NULL,
  `campo_2` varchar(250) DEFAULT NULL,
  `campo_3` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_alarma`
--

INSERT INTO `tb_alarma` (`id_alarma`, `tb_tipo_de_alarma`, `id_1`, `id_2`, `id_3`, `mensaje_de_alarma`, `campo_1`, `campo_2`, `campo_3`) VALUES
(1, 5, 6, 11, 6, 'CHEQUE VENCIDO<br> - Nro. de cheque: 2002<br> - Banco: CAJA<br> - Importe: 2002.00<br> - Fecha de Emision: 14/12/2012<br> - Fecha de Inicio de Cobro: 14/12/2012<br> - Fecha de Vencimiento: 13/1/2013<br> - Obs: <br> - Persona que recibio el cheque: MIGUEL ANGEL MADOZ<br> - Obs del cobro: <br> - Empresa: <br> - Firma: GRU-VIAL', NULL, NULL, NULL),
(2, 10, 1, 3, NULL, 'COBRO VENCIDO<br> - Fecha de Cobro: 1/4/2009<br> - Empresa: BOSETTI Y CIA. SA<br> - Firma: GRU-VIAL<br> - Obs del cobro: ', NULL, NULL, NULL),
(3, 10, 2, 3, NULL, 'COBRO VENCIDO<br> - Fecha de Cobro: 1/4/2009<br> - Empresa: BOSETTI Y CIA. SA<br> - Firma: GRU-VIAL<br> - Obs del cobro: ', NULL, NULL, NULL),
(5, 14, 3, 3, NULL, 'LINEA DE TRABAJO VENCIDA<br> - Firma: GRU-VIAL<br> - Empresa: BOSETTI Y CIA. SA<br> - Fecha de Inicio: 1/1/2008<br> - Empresa: GRUA PPM A 380 32 TN<br> - Observaciones: <br> - Dias que faltan para realizar el trabajo: -5248', NULL, NULL, NULL),
(6, 14, 5, 13, NULL, 'LINEA DE TRABAJO VENCIDA<br> - Firma: BAÑOS QUIMICOS<br> - Empresa: PROMAS S.A.<br> - Fecha de Inicio: 27/1/2009<br> - Empresa: BAÑO EVENTO<br> - Observaciones: <br> - Dias que faltan para realizar el trabajo: -4856', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_banco`
--

CREATE TABLE `tb_banco` (
  `id_banco` int(10) UNSIGNED NOT NULL,
  `nombre_del_banco` char(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_banco`
--

INSERT INTO `tb_banco` (`id_banco`, `nombre_del_banco`) VALUES
(2, 'CAJA'),
(3, 'NUEVO BANCO DE LA RIOJA'),
(4, 'BANCO  FRANCES'),
(5, 'BANCO SANTANDER RIO'),
(6, 'BANCO GALICIA'),
(7, 'BANCO MACRO'),
(8, 'BANCO HSBC'),
(9, 'BANCO NACION');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_causa_de_baja_cheque`
--

CREATE TABLE `tb_causa_de_baja_cheque` (
  `id_causa_de_baja_cheque` int(10) UNSIGNED NOT NULL,
  `causa_de_baja_cheque` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_causa_de_baja_cheque`
--

INSERT INTO `tb_causa_de_baja_cheque` (`id_causa_de_baja_cheque`, `causa_de_baja_cheque`) VALUES
(1, 'VENCIDO'),
(2, 'SIN FONDOS'),
(3, 'PERDIDO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cheque`
--

CREATE TABLE `tb_cheque` (
  `id_cheque` int(10) UNSIGNED NOT NULL,
  `fecha_now` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tb_cuenta0cuenta_emisora` int(11) DEFAULT NULL,
  `numero_de_cheque` char(30) NOT NULL,
  `tb_banco` int(11) NOT NULL,
  `importe` decimal(10,2) NOT NULL,
  `fecha_de_emision` date NOT NULL,
  `fecha_inicio_de_cobro` date NOT NULL,
  `fecha_de_vencimiento` date NOT NULL,
  `fecha_de_cobro` date DEFAULT NULL,
  `tb_sys_personal0persona_que_cobro` int(11) DEFAULT NULL,
  `observaciones` char(200) DEFAULT NULL,
  `tb_causa_de_baja_cheque` int(10) UNSIGNED DEFAULT NULL,
  `tb_cuenta0cuenta_destino` int(10) UNSIGNED DEFAULT NULL,
  `fecha_de_entrega_a_cuenta_destino` date DEFAULT NULL,
  `tb_sys_personal0persona_que_recibe_en_cuenta_destino` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_cheque`
--

INSERT INTO `tb_cheque` (`id_cheque`, `fecha_now`, `tb_cuenta0cuenta_emisora`, `numero_de_cheque`, `tb_banco`, `importe`, `fecha_de_emision`, `fecha_inicio_de_cobro`, `fecha_de_vencimiento`, `fecha_de_cobro`, `tb_sys_personal0persona_que_cobro`, `observaciones`, `tb_causa_de_baja_cheque`, `tb_cuenta0cuenta_destino`, `fecha_de_entrega_a_cuenta_destino`, `tb_sys_personal0persona_que_recibe_en_cuenta_destino`) VALUES
(5, '0000-00-00 00:00:00', 0, '83771548', 8, '1350.00', '2008-03-27', '2008-04-25', '2008-05-25', '2008-03-02', 2, 'CHEQUE ENTREGADO POR RESAGOS INDUSTRIALES', 2, NULL, NULL, NULL),
(8, '0000-00-00 00:00:00', NULL, '35235324563', 2, '5800.00', '2008-01-01', '0000-00-00', '2008-03-01', '2008-03-03', 10, NULL, NULL, NULL, NULL, NULL),
(10, '0000-00-00 00:00:00', NULL, '83771502', 2, '1350.00', '2008-01-01', '2009-01-01', '2009-01-31', '2008-03-02', 2, NULL, NULL, NULL, NULL, NULL),
(11, '0000-00-00 00:00:00', NULL, '83771502', 2, '1350.00', '2008-01-01', '2009-01-01', '2009-01-31', '2008-03-02', 2, NULL, NULL, NULL, NULL, NULL),
(12, '2014-01-14 13:12:39', NULL, '2002', 2, '2002.00', '2012-12-14', '2012-12-14', '2013-01-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2014-01-16 10:55:43', NULL, '33', 5, '700.00', '2012-12-14', '2012-12-15', '2013-01-14', '2014-01-14', 2, NULL, NULL, NULL, NULL, NULL),
(14, '2014-05-27 16:33:28', NULL, '3333', 7, '500.00', '2014-01-01', '2014-01-01', '2014-01-31', '2014-01-01', 5, NULL, NULL, NULL, NULL, NULL),
(15, '2019-10-15 18:23:43', NULL, '654654', 4, '10000.00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 10, NULL, NULL, NULL, NULL, NULL),
(16, '2022-05-15 13:40:05', NULL, '44444', 4, '10000.00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 2, NULL, NULL, NULL, NULL, NULL),
(17, '2022-05-15 13:40:40', NULL, '44444', 3, '10000.00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 2, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cobro`
--

CREATE TABLE `tb_cobro` (
  `id_cobro` int(10) UNSIGNED NOT NULL,
  `fecha_now` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tb_trabajo_encabezado` int(11) DEFAULT NULL,
  `fecha_de_cobro` date NOT NULL,
  `tb_sys_personal0persona_que_cobro` int(11) DEFAULT NULL,
  `tb_firma0firma_de_origen` int(10) DEFAULT NULL,
  `tb_cuenta0cuenta_destino` int(10) NOT NULL,
  `fecha_de_entrega_a_cuenta_destino` date DEFAULT NULL,
  `tb_sys_personal0persona_que_recibe_en_cuenta_destino` int(11) DEFAULT NULL,
  `tb_tipo_de_cobro` int(2) DEFAULT NULL,
  `importe` decimal(10,2) DEFAULT NULL,
  `tb_deposito0deposito_de_cobro` int(11) DEFAULT NULL,
  `tb_cheque` int(11) DEFAULT NULL,
  `observaciones` text,
  `tb_deposito0deposito_destino` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_cobro`
--

INSERT INTO `tb_cobro` (`id_cobro`, `fecha_now`, `tb_trabajo_encabezado`, `fecha_de_cobro`, `tb_sys_personal0persona_que_cobro`, `tb_firma0firma_de_origen`, `tb_cuenta0cuenta_destino`, `fecha_de_entrega_a_cuenta_destino`, `tb_sys_personal0persona_que_recibe_en_cuenta_destino`, `tb_tipo_de_cobro`, `importe`, `tb_deposito0deposito_de_cobro`, `tb_cheque`, `observaciones`, `tb_deposito0deposito_destino`) VALUES
(1, '0000-00-00 00:00:00', 3, '2009-04-01', 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '0000-00-00 00:00:00', 3, '2009-04-01', 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '0000-00-00 00:00:00', 3, '2008-04-01', 2, NULL, 1, NULL, NULL, 3, '1350.00', NULL, 5, NULL, NULL),
(4, '0000-00-00 00:00:00', NULL, '2008-03-02', 2, NULL, 1, NULL, NULL, 3, '1350.00', NULL, 11, NULL, NULL),
(5, '0000-00-00 00:00:00', NULL, '2009-01-31', 1, 1, 1, NULL, NULL, 1, '400.00', NULL, NULL, NULL, NULL),
(6, '0000-00-00 00:00:00', 11, '2008-03-02', 2, NULL, 1, NULL, NULL, 3, '2002.00', NULL, 12, NULL, NULL),
(7, '0000-00-00 00:00:00', 13, '2008-03-02', 1, NULL, 1, NULL, NULL, 1, '10.00', NULL, NULL, NULL, NULL),
(9, '0000-00-00 00:00:00', 15, '2008-04-01', NULL, NULL, 1, NULL, NULL, 1, '10.00', NULL, NULL, NULL, NULL),
(10, '0000-00-00 00:00:00', 13, '2008-04-01', NULL, NULL, 1, NULL, NULL, 1, '10.00', NULL, NULL, NULL, NULL),
(11, '2009-02-24 19:53:24', 16, '2008-03-02', 2, NULL, 1, NULL, NULL, 2, '7000.00', 10, NULL, NULL, NULL),
(12, '2013-10-10 07:42:02', 17, '2013-01-01', NULL, NULL, 1, NULL, NULL, 1, '300.00', NULL, NULL, NULL, NULL),
(13, '2014-01-14 15:23:15', 11, '2014-01-15', 1, NULL, 5, NULL, NULL, 1, '230.00', NULL, NULL, NULL, NULL),
(14, '2014-01-16 10:50:17', 11, '2008-03-02', 1, NULL, 6, NULL, NULL, 2, '500.00', 11, NULL, NULL, NULL),
(15, '2014-01-16 10:55:44', 11, '2014-01-14', 2, NULL, 6, NULL, NULL, 3, '700.00', NULL, 13, NULL, 12),
(16, '2014-05-27 16:33:28', 13, '2014-01-01', 5, NULL, 4, NULL, NULL, 3, '500.00', NULL, 14, NULL, NULL),
(17, '2019-10-15 18:18:27', 21, '0000-00-00', 6, 1, 1, NULL, NULL, 1, '10000.00', NULL, NULL, NULL, NULL),
(18, '2019-10-15 18:23:43', 21, '0000-00-00', 10, 1, 1, NULL, NULL, 3, '10000.00', NULL, 15, NULL, NULL),
(19, '2022-05-15 13:40:40', 22, '0000-00-00', 2, 3, 4, NULL, NULL, 3, '10000.00', NULL, 17, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_compra`
--

CREATE TABLE `tb_compra` (
  `id_compra` int(10) UNSIGNED NOT NULL,
  `lugar_de_compra` varchar(55) DEFAULT NULL,
  `timecreate0fecha_de_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_de_compra` date NOT NULL,
  `importe_de_compra` decimal(10,2) NOT NULL,
  `importe_cancelado` decimal(10,2) NOT NULL,
  `descripcion_de_gasto` varchar(100) NOT NULL,
  `tb_trabajo_encabezado` int(10) UNSIGNED DEFAULT NULL,
  `nro_de_factura` varchar(45) DEFAULT NULL,
  `tb_tipo_de_factura` int(10) UNSIGNED DEFAULT NULL,
  `tb_plan_de_cuenta` int(10) UNSIGNED NOT NULL,
  `tb_cuenta0cuenta_origen` int(10) UNSIGNED NOT NULL,
  `tb_firma0firma_beneficiaria` int(10) NOT NULL,
  `observaciones` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_compra`
--

INSERT INTO `tb_compra` (`id_compra`, `lugar_de_compra`, `timecreate0fecha_de_creacion`, `fecha_de_compra`, `importe_de_compra`, `importe_cancelado`, `descripcion_de_gasto`, `tb_trabajo_encabezado`, `nro_de_factura`, `tb_tipo_de_factura`, `tb_plan_de_cuenta`, `tb_cuenta0cuenta_origen`, `tb_firma0firma_beneficiaria`, `observaciones`) VALUES
(2, NULL, '0000-00-00 00:00:00', '2009-01-10', '355.00', '355.00', 'SILENCIADOR PARA CAMION INTERNACIONAL APA', NULL, NULL, NULL, 2, 3, 1, NULL),
(3, NULL, '0000-00-00 00:00:00', '2009-01-10', '60.00', '60.00', 'TRABAJO PARA GRUVIAL', NULL, NULL, NULL, 1, 1, 1, NULL),
(4, NULL, '0000-00-00 00:00:00', '2009-01-10', '427.00', '427.00', 'PONC- JUEGO DE VALVULAS, JUEGO JUNTA TAPA IGM', NULL, NULL, NULL, 1, 1, 1, NULL),
(5, NULL, '0000-00-00 00:00:00', '2009-01-10', '80.00', '80.00', 'FORMULA DIESEL PARA TOYOTA', NULL, NULL, NULL, 1, 1, 1, NULL),
(6, NULL, '0000-00-00 00:00:00', '2009-01-10', '50.00', '50.00', 'GASOIL', NULL, NULL, NULL, 1, 1, 1, NULL),
(7, NULL, '0000-00-00 00:00:00', '2009-01-10', '10.00', '10.00', 'CHAVETA EMBRAGUE (APA)', NULL, NULL, NULL, 1, 1, 1, NULL),
(8, NULL, '0000-00-00 00:00:00', '2009-01-10', '140.00', '140.00', 'PINTURA 2X1 PARA CARRETON', NULL, NULL, NULL, 1, 1, 1, NULL),
(9, NULL, '0000-00-00 00:00:00', '2009-01-10', '10.00', '10.00', 'NAFTA', NULL, NULL, NULL, 1, 1, 1, NULL),
(10, NULL, '0000-00-00 00:00:00', '2009-01-10', '20.00', '20.00', 'A CARGO DE APA', NULL, NULL, NULL, 1, 1, 3, NULL),
(11, NULL, '0000-00-00 00:00:00', '2009-01-10', '19.00', '19.00', '1 TUERCA CASTILLO + 1 TRABASIL (APA)', NULL, NULL, NULL, 1, 3, 1, NULL),
(12, NULL, '0000-00-00 00:00:00', '2009-01-10', '45.00', '45.00', 'RULEMAN (APA)', NULL, NULL, NULL, 1, 1, 1, NULL),
(13, NULL, '0000-00-00 00:00:00', '2009-01-10', '20.50', '20.50', 'RETEN (APA)', NULL, NULL, NULL, 1, 1, 1, NULL),
(14, NULL, '0000-00-00 00:00:00', '2009-01-10', '175.00', '175.00', 'ACEITE TRANSMISION MONOGRADO 90 X 20L PARA IGM', NULL, NULL, NULL, 1, 1, 1, NULL),
(15, NULL, '0000-00-00 00:00:00', '2009-01-10', '419.00', '419.00', '2 TARROS ACEITE HIPOIDAL 85W140 X 20L', NULL, NULL, NULL, 1, 1, 1, NULL),
(16, NULL, '0000-00-00 00:00:00', '2009-01-10', '88.00', '88.00', '', NULL, NULL, NULL, 1, 1, 1, NULL),
(17, NULL, '0000-00-00 00:00:00', '2009-01-10', '320.00', '320.00', 'BOMBA INYECTORA APA', NULL, NULL, NULL, 1, 1, 1, NULL),
(18, NULL, '0000-00-00 00:00:00', '2009-01-10', '101.00', '101.00', 'ARTICULOS DE LIMPIEZA VARIOS', NULL, NULL, NULL, 1, 3, 1, NULL),
(19, NULL, '0000-00-00 00:00:00', '2009-01-10', '111.00', '111.00', 'VOLETA DE TODO RULEMANES $108 + $3 EN TORNILLOS (BOB CAT FERNANDO)', NULL, NULL, NULL, 1, 1, 1, NULL),
(20, NULL, '0000-00-00 00:00:00', '2009-01-10', '58.00', '58.00', '4 DISCOS BASE DE FIBRA PARA CARRETON', NULL, NULL, NULL, 1, 1, 1, NULL),
(21, NULL, '0000-00-00 00:00:00', '2009-01-10', '10.00', '10.00', 'SOLDADURA PARA FERNANDO ALBELO', NULL, NULL, NULL, 1, 1, 1, NULL),
(22, NULL, '0000-00-00 00:00:00', '2009-01-10', '200.00', '200.00', 'GASOIL', NULL, NULL, NULL, 1, 1, 1, NULL),
(23, NULL, '0000-00-00 00:00:00', '2009-01-10', '30.00', '30.00', 'CARBONES PARA MARTILLO NEUMATICO BOSCH', NULL, NULL, NULL, 1, 1, 1, NULL),
(24, NULL, '0000-00-00 00:00:00', '2009-01-10', '64.00', '64.00', 'PREGUNTAR POR TEMA FECHAS', NULL, NULL, NULL, 1, 1, 1, NULL),
(25, NULL, '0000-00-00 00:00:00', '2009-01-10', '160.00', '160.00', 'BOBINADO DE MOTOR Y CAMBIO DE RODAMIENTO MAQUINA DE CORTAR CESPED', NULL, NULL, NULL, 1, 1, 1, NULL),
(26, NULL, '0000-00-00 00:00:00', '2009-01-10', '22.50', '22.50', 'LIQUIDO DE FRENO', NULL, NULL, NULL, 1, 1, 1, NULL),
(27, NULL, '0000-00-00 00:00:00', '2009-01-10', '28.00', '28.00', 'MANGUERAS Y BRIDAS PARA APA', NULL, NULL, NULL, 1, 1, 1, NULL),
(28, NULL, '0000-00-00 00:00:00', '2009-01-10', '20.00', '20.00', 'ARANDELAS APA', NULL, NULL, NULL, 1, 1, 1, NULL),
(29, NULL, '0000-00-00 00:00:00', '2009-01-10', '50.00', '50.00', 'REPUESTOS VARIOS', NULL, NULL, NULL, 1, 1, 1, NULL),
(30, NULL, '0000-00-00 00:00:00', '2009-01-10', '26.00', '26.00', 'JABON BLANCO', NULL, NULL, NULL, 1, 1, 1, NULL),
(31, NULL, '0000-00-00 00:00:00', '2009-01-10', '38.00', '38.00', 'PICOS Y CANDADOS', NULL, NULL, NULL, 1, 1, 1, NULL),
(32, NULL, '0000-00-00 00:00:00', '2009-01-10', '72.00', '72.00', 'SON $66 DE TODO RULEMANES + $6 APARTE. TOTAL $69. PARA BOBCAT DE FERNANDO ALBELO', NULL, NULL, NULL, 1, 1, 1, NULL),
(33, NULL, '0000-00-00 00:00:00', '2009-01-10', '16.00', '16.00', '2 ARANDELAS ARAÑA PARA APA', NULL, NULL, NULL, 1, 1, 1, NULL),
(34, NULL, '0000-00-00 00:00:00', '2009-01-10', '6.00', '6.00', 'LUZ PILOTO PARA IGM', NULL, NULL, NULL, 1, 1, 1, NULL),
(35, NULL, '0000-00-00 00:00:00', '2009-01-10', '710.00', '710.00', 'PAGO A DANIEL RODRIGUEZ', NULL, NULL, NULL, 1, 1, 1, NULL),
(36, NULL, '0000-00-00 00:00:00', '2009-01-10', '73.00', '73.00', 'FORMULA DIESEL', NULL, NULL, NULL, 1, 1, 1, NULL),
(37, NULL, '0000-00-00 00:00:00', '2009-01-10', '500.00', '500.00', 'POR TRABAJOS REALIZADOS', NULL, NULL, NULL, 1, 1, 1, NULL),
(38, NULL, '0000-00-00 00:00:00', '2009-01-10', '84.00', '84.00', 'COMPRA GRAL EN EL SUPERMERCADO\r\n', NULL, NULL, NULL, 1, 1, 1, NULL),
(39, NULL, '0000-00-00 00:00:00', '2009-01-10', '15.00', '15.00', 'CUADERNOS VARIOS', NULL, NULL, NULL, 1, 1, 1, NULL),
(40, NULL, '0000-00-00 00:00:00', '2009-01-10', '100.00', '100.00', 'POR LIMPIEZA Y COMIDA', NULL, NULL, NULL, 1, 1, 1, NULL),
(41, NULL, '0000-00-00 00:00:00', '2009-01-10', '50.00', '50.00', 'CRAPODINA PARA DIEGO', NULL, NULL, NULL, 1, 1, 1, NULL),
(42, NULL, '0000-00-00 00:00:00', '2009-01-10', '56.00', '56.00', 'COMIDA PARA PERROS', NULL, NULL, NULL, 1, 1, 1, NULL),
(43, NULL, '0000-00-00 00:00:00', '2009-01-10', '89.00', '89.00', '$83 POR REPARACION DE ALTERNADOR + $6 DE BUJE NUEVO. PARA DIEGO', NULL, NULL, NULL, 1, 1, 1, NULL),
(44, NULL, '0000-00-00 00:00:00', '2009-01-10', '40.00', '40.00', 'REGULADOR DE EMBRAGUE', NULL, NULL, NULL, 1, 1, 1, NULL),
(45, NULL, '0000-00-00 00:00:00', '2009-01-10', '45.00', '45.00', '1 CARGA DE OXIGENO', NULL, NULL, NULL, 1, 1, 1, NULL),
(46, NULL, '0000-00-00 00:00:00', '2009-01-10', '700.00', '700.00', 'aceite', 11, NULL, NULL, 1, 1, 1, NULL),
(47, NULL, '2009-02-24 19:55:37', '2008-02-05', '1500.00', '1500.00', '', NULL, '1', 16, 1, 0, 0, NULL),
(48, NULL, '0000-00-00 00:00:00', '2014-05-01', '8000.00', '8000.00', 'hhh', NULL, NULL, NULL, 1, 4, 3, NULL),
(49, 'viatico', '2018-01-03 13:54:44', '0000-00-00', '400.00', '400.00', 'eeee', 20, NULL, 1, 1, 3, 0, NULL),
(50, 'eso', '2019-10-15 18:14:13', '0000-00-00', '2000.00', '2000.00', 'combustible', 21, '5646564', 1, 1, 1, 0, NULL),
(51, NULL, '2022-05-15 13:35:12', '0000-00-00', '3000.00', '3000.00', 'pape', 22, NULL, 1, 1, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cuenta`
--

CREATE TABLE `tb_cuenta` (
  `id_cuenta` int(10) UNSIGNED NOT NULL,
  `numero_de_cuenta` char(30) NOT NULL,
  `tb_banco` int(11) NOT NULL,
  `titular_de_la_cuenta` char(100) DEFAULT NULL,
  `tb_firma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_cuenta`
--

INSERT INTO `tb_cuenta` (`id_cuenta`, `numero_de_cuenta`, `tb_banco`, `titular_de_la_cuenta`, `tb_firma`) VALUES
(1, 'CAJA GRUVIAL', 2, NULL, 1),
(2, 'CAJA EL VASCO', 2, NULL, 2),
(3, 'CAJA BAÑOS QUIMICOS', 2, NULL, 3),
(4, '1111', 4, 'Madoz Rodolfo y Miguel', 1),
(5, '2222', 6, 'Madoz Miguel y Maria Cristina Podio', 2),
(6, '3333', 7, 'Martin Madoz', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_deposito`
--

CREATE TABLE `tb_deposito` (
  `id_deposito` int(10) UNSIGNED NOT NULL,
  `fecha_now` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_de_deposito` date NOT NULL,
  `tb_cuenta0cuenta_origen` int(10) DEFAULT NULL,
  `tb_cuenta0cuenta_destino` int(11) NOT NULL,
  `monto_de_deposito` decimal(10,2) NOT NULL,
  `tb_sys_personal0persona_que_deposito` int(11) DEFAULT NULL,
  `tb_empresa0cliente_que_deposito` int(11) DEFAULT NULL,
  `tb_cheque` int(11) DEFAULT NULL,
  `observaciones` char(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_deposito`
--

INSERT INTO `tb_deposito` (`id_deposito`, `fecha_now`, `fecha_de_deposito`, `tb_cuenta0cuenta_origen`, `tb_cuenta0cuenta_destino`, `monto_de_deposito`, `tb_sys_personal0persona_que_deposito`, `tb_empresa0cliente_que_deposito`, `tb_cheque`, `observaciones`) VALUES
(8, '0000-00-00 00:00:00', '2008-05-05', NULL, 4, '10.00', 1, NULL, 8, NULL),
(9, '0000-00-00 00:00:00', '2008-01-01', NULL, 1, '3500.00', NULL, NULL, NULL, NULL),
(10, '2009-02-24 19:53:24', '2009-01-30', NULL, 1, '7000.00', NULL, 2, NULL, NULL),
(11, '2014-01-16 10:50:17', '2014-01-01', NULL, 6, '500.00', NULL, 35, NULL, 'haber'),
(12, '2014-01-16 10:55:44', '2014-12-12', NULL, 6, '700.00', 2, NULL, 13, NULL),
(13, '2014-01-18 09:29:04', '2014-01-15', 1, 6, '350.00', 2, NULL, NULL, 'por deuda'),
(14, '2014-05-30 08:56:25', '2014-05-13', 4, 3, '4000.00', 2, NULL, NULL, 'por ajuste de deuda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_empresa`
--

CREATE TABLE `tb_empresa` (
  `id_empresa` int(10) UNSIGNED NOT NULL,
  `nombre_o_razon_social` char(80) NOT NULL,
  `CUIT_o_CUIL` char(12) DEFAULT NULL,
  `telefonos` char(80) DEFAULT NULL,
  `fax` char(40) DEFAULT NULL,
  `direccion` char(80) DEFAULT NULL,
  `email` char(80) DEFAULT NULL,
  `web` char(80) DEFAULT NULL,
  `observaciones` char(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_empresa`
--

INSERT INTO `tb_empresa` (`id_empresa`, `nombre_o_razon_social`, `CUIT_o_CUIL`, `telefonos`, `fax`, `direccion`, `email`, `web`, `observaciones`) VALUES
(1, 'PROMAS S.A.', '30671847705', '380-4430750/53/05', '380-4430750/53/05', 'Ruta Provincial Nº 25 Km 13', 'info@promas.com.ar', NULL, NULL),
(36, 'ENOD S.A.', '30657237449', '0380- 4437858', '0380 4437858', 'RUTA NAC. Nº 38 KM 1154 0 - PARQUE INDUSTRIAL LA RIOJA', 'tgomez@cladd.com.ar // cladd@textil.com.ar', NULL, NULL),
(37, 'DIARCO', NULL, '(0380) 442-3739 / 3799 / 3764 / 3727', NULL, 'Ruta N38 y Esquina Malvinas Argentinas', NULL, 'larioja@diarco.com.ar', NULL),
(38, 'BIAGI EDUARDO', '20080459182', ' (0383) 443-3195 / 0383 154565642 / 0383 154591510', NULL, 'PADRE REINOSO 155, Bº VALLE VIEJO VILLA DOLORES  4707-CATAMARCA', 'ebiagi@arnet.com.ar', NULL, 'CONTACTO LA RIOJA: ING. PABLO BRIZUELA (CYSE SRL) 0380 154520330'),
(39, 'ANDES S.R.L.', '30698886184', NULL, NULL, 'MANUEL GALVEZ 181 VILLA ALLENDE  5105-CORDOBA', NULL, ' www.expordelosandes.com.ar', NULL),
(40, 'CITRUS SERVICE S.R.L.', '30679953814', '(0381) 156811088', NULL, 'RUTA PROV. 321 - KM 3 3 - PARAJE : LA BOLSA LULES  4128-TUCUMAN', NULL, NULL, 'el contacto telefonico es de Alex Citrus Service'),
(41, 'CELOMAT S.A.', '30561689691', NULL, NULL, 'Ruta 5 km 5.5 - Parque Industrial', NULL, NULL, NULL),
(42, 'SERVYCOM S.R.L.', '30651424689', '(0380)  243 7537', NULL, 'RUTA Nº 5 Y N. GUZ.LOZA 0 - parque industrial', 'servycomsrl@sge.com.ar', NULL, NULL),
(43, 'DRIPSA S.R.L.', '30634637326', ' (0380) 442-0885 / 442-4214', NULL, 'Parque Industrial La Rioja, Ruta 5, Nº 5022', 'info@dripsa.com.ar', NULL, NULL),
(44, 'AERATION ARGENTINA S A', '30678620544', '(54-11) 4742-9559', '(54-11) 4742- 6886', 'AVDA. SANTA FE 782 Piso:5 Dpto:J ACASSUSO 1641-BUENOS AIRES', 'aeration@aeration.com.ar', 'www.aeration.com.ar', NULL),
(45, 'MATEX ALERTA CONTROL SEGURIDAD S.R.L.', '30710237383', NULL, NULL, 'ALBERDI 488 - BARRIO : CENTRO LA RIOJA', NULL, NULL, NULL),
(46, 'ASOCIACION CAMINO', '30712364315', NULL, NULL, 'PIO XII 112 - BARRIO : INFANTERIA II', NULL, NULL, NULL),
(48, 'MUNICIPALIDAD DEPARTAMENTO CAPITAL', NULL, '154539359 / 154536988 / 4435658', NULL, 'SANTA FE 971', NULL, NULL, 'CONTACTO RAUL DIAZ'),
(49, 'SIERRAS DE MAZAN SA', '30653686222', '03825 427300 / 03825 427320', NULL, 'FINCA SAN GABRIEL: RUTA NAC. 38 KM 405... FINCA LILIANA: RUTA NAC. 74 KM 1058', 'jdrvega@smazan.com.ar', 'www.smazan.com.ar', 'Ing. Jorge Romero de la Vega 0380 154300022'),
(50, 'INDUSTRIAS QUIMICAS Y MINERAS TIMBO SA', '30515969213', '0380 4434586', NULL, 'RUTA NAC 38 KM 415', 'rlobato@timbo.com.ar', 'www.timbo.com.ar', 'CONTACTO: CR. RICARDO LOBATO 0380 154593273'),
(51, 'TRANSNOA SA', '30661919406', '0380 154300477', NULL, 'AV SANTA FE 846, PISO 4TO CABA (1059)', 'admin.larioja@transnoa.com.ar / jpablo_plr@hotmail.com', NULL, 'CONTACTO: JUAN PABLO PEREYRA 0380 154300477'),
(52, 'HUACO AGROPECUARIA SA', '30671856674', '0223 155217632', NULL, 'JUAN BAUTISTA ALBERDI 583 LA RIOJA', 'huacoaimogasta@gmail.com', NULL, 'CONTACTO: JESUS NIETO'),
(53, 'SEGURIDAD VICUS SA', '30708893885', '0380 4421791', NULL, 'AV RIVADAVIA 127', NULL, NULL, 'CONTACTO: CR. SORIA'),
(54, 'ADMINISTRACION PROVINCIAL DE VIVIENDA Y URBANISMO', '30999022436', '0380 4453738 int 204 Noelia Valor int 231 Cra. Rita Llanos', NULL, 'AV ORTIZ DE OCAMPO 1700', 'noelia13481@hotmail.com', NULL, 'CONTACTO: NOELIA VALOR 0380 154500555'),
(55, 'MINISTERIO DE DESARROLLO SOCIAL - PROGRAMA ARGENTINA TRABAJA', '30707101683', '0380 154508408 (Cr. Troncoso Luis) 0380 154356146 (Arq. Carolina Torres)', '0380 154603503 (Duilio Madera, Hno Tere)', 'AV. LEANDRO ALEM Y TAJAMAR', NULL, NULL, 'CONTACTO: CR. LUIS TRONCOSO'),
(56, 'CORALINO SA', '30694606691', '03825 499563/147/455', NULL, 'CNEL NICOLAS DAVILA S/N NONOGASTA', 'coralino_administracion@arnet.com.ar / javierbonfanti@coralino.com', 'www.coralino.com', 'CONTACTO: CR. EDUARDO MAZZUCO (03825 15524723) o JAVIER BONFATI'),
(57, 'LAGUNA BRAVA SA', '30671897516', '0380 154666203', NULL, 'RUTA PCIAL 25 KM 10', NULL, NULL, 'CONTACTO: JORGE RAMIREZ'),
(58, 'DIRECCION GENERAL DE DESARROLLO LOCAL', '30671853535', '0380 154307275', NULL, '25 DE MAYO Y SAN N. DE BARI', NULL, NULL, 'CONTACTO: JORGE FERREYRA'),
(59, 'BONANO JORGE HUMBERTO', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'CARMO SA', '33649669959', '0380 154661746', NULL, '8 DE DICIEMBRE 153', NULL, NULL, 'CONTACTO: CR. MARNETTO'),
(61, 'BOSETTI Y CIA. SA', '30612529724', '0380 154446904 (VIVI FRANCES) 0380 154312801 (EDUARDO CAMPAZO)', NULL, 'AV ORTIZ DE OCAMPO 3080', 'vivifrances@hotmail.com', NULL, 'CONTACTO: VIVI FRANCES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_fabricante`
--

CREATE TABLE `tb_fabricante` (
  `id_fabricante` int(10) UNSIGNED NOT NULL,
  `nombre_del_fabricante` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_fabricante`
--

INSERT INTO `tb_fabricante` (`id_fabricante`, `nombre_del_fabricante`) VALUES
(1, 'YPF'),
(2, 'SHELL'),
(3, 'ESSO'),
(4, 'CATERPILLAR'),
(5, 'TOYOTA'),
(6, 'PIRELLI'),
(7, 'GOODYEAR'),
(8, 'MICHELLIN'),
(9, 'MITSUBISHI'),
(10, 'DESCONOCIDO'),
(11, 'TERSUAVE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_firma`
--

CREATE TABLE `tb_firma` (
  `id_firma` int(10) UNSIGNED NOT NULL,
  `firma` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_firma`
--

INSERT INTO `tb_firma` (`id_firma`, `firma`) VALUES
(1, 'GRU-VIAL'),
(2, 'EL VASCO'),
(3, 'BAÑOS QUIMICOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_gastos_varios`
--

CREATE TABLE `tb_gastos_varios` (
  `id_gastos_varios` int(10) UNSIGNED NOT NULL,
  `fecha_now` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha` datetime NOT NULL,
  `nro_de_factura` varchar(45) DEFAULT NULL,
  `tb_tipo_de_factura` int(10) UNSIGNED DEFAULT NULL,
  `concepto` varchar(250) NOT NULL,
  `neto` decimal(10,5) DEFAULT NULL,
  `iva` decimal(10,5) DEFAULT NULL,
  `percepcion` decimal(10,5) DEFAULT NULL,
  `importe` decimal(10,5) NOT NULL,
  `tb_plan_de_cuenta` int(10) UNSIGNED NOT NULL,
  `observaciones` varchar(250) DEFAULT NULL,
  `tb_sucursal` int(10) UNSIGNED NOT NULL,
  `tb_personal` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_gastos_varios`
--

INSERT INTO `tb_gastos_varios` (`id_gastos_varios`, `fecha_now`, `fecha`, `nro_de_factura`, `tb_tipo_de_factura`, `concepto`, `neto`, `iva`, `percepcion`, `importe`, `tb_plan_de_cuenta`, `observaciones`, `tb_sucursal`, `tb_personal`) VALUES
(1, '0000-00-00 00:00:00', '2008-08-11 00:00:00', '0001-00000005', 3, 'servi-tec soluciones', '10.00000', '2.10000', NULL, '10.00000', 6, 'cable de usb.', 1, 27),
(2, '0000-00-00 00:00:00', '2008-08-11 00:00:00', NULL, 4, 'infocopi.', '36.00000', '7.56000', NULL, '36.00000', 3, 'voligoma y hojas a cuatro.', 1, 27),
(3, '0000-00-00 00:00:00', '2008-08-05 00:00:00', '0130-00158011', 2, 'urquiza', '16.00000', '3.36000', NULL, '16.00000', 7, 'encomienda', 1, 27),
(4, '0000-00-00 00:00:00', '2008-08-07 00:00:00', '0001-00001572', 3, 'RO-ELI FOTOCOPIAS', '14.25000', '2.99000', NULL, '14.25000', 3, 'FOTOCOPIAS.', 1, 27),
(5, '0000-00-00 00:00:00', '2008-08-08 00:00:00', '0002-00008137', 1, 'EL INDEPENDIENTE.', '40.72000', '4.28000', NULL, '45.00000', 11, NULL, 1, 27),
(6, '0000-00-00 00:00:00', '2008-08-06 00:00:00', '0001-00000094', 3, 'LINK SERVICIOS INFORMATICOS', '160.00000', '3.36000', NULL, '160.00000', 6, 'MEMORIA DE 512.', 1, 27),
(7, '0000-00-00 00:00:00', '2008-08-04 00:00:00', '8102-07556096', 2, 'TELECOM', '545.56000', '114.56000', NULL, '545.56000', 5, 'TELECOM ARGENTINA.', 1, 27),
(8, '0000-00-00 00:00:00', '2008-08-01 00:00:00', '00017683', 5, 'TRANSPORTE EL ZONDA.', '7.00000', '1.47000', NULL, '7.00000', 7, 'UN SOBRE . ', 1, 27),
(9, '0000-00-00 00:00:00', '2008-08-06 00:00:00', '0008-00017193', 1, 'CASA PITTY', '127.89000', '13.11000', NULL, '138.00000', 3, 'CARTUCHO HP NEGRO.', 1, 27),
(10, '0000-00-00 00:00:00', '2008-08-01 00:00:00', '0004-00001619', 1, 'GIRAUD LIBRERIA', '89.15000', '18.72000', NULL, '107.87000', 3, 'VOLIGOMA. LAPIZ CORRECTOR.\r\nMEMO FIX\r\nLAPICERAS BROCHES FOLIO OF.100\r\nCUADERNOS.16X21\r\n', 1, 27),
(11, '0000-00-00 00:00:00', '2008-07-30 00:00:00', '00000041', 5, 'LA RIOJANA S.R.L', '7.00000', '1.47000', NULL, '7.00000', 7, 'UN SOBRE', 1, 27),
(12, '0000-00-00 00:00:00', '2008-08-07 00:00:00', '0026718', 5, 'RECIBO. DE PAGO .', '13704.00000', NULL, NULL, '13704.00000', 10, 'PAGO DE SUELDO DE LAPRIDA MOTOS.', 1, 27),
(13, '0000-00-00 00:00:00', '2008-08-08 00:00:00', '0005-00024532', 1, 'FROZEN S.T.L', '16.52000', '3.46000', NULL, '19.99000', 1, 'BIDONES DE AGUA.', 1, 27),
(14, '0000-00-00 00:00:00', '2008-08-05 00:00:00', '0002-00002719', 2, 'INFOCOPI', '16.00000', '3.36000', NULL, '32.00000', 3, 'DOS RESMA A4 X 75 GRS.', 1, 27),
(15, '0000-00-00 00:00:00', '2008-08-07 00:00:00', '1283-00000075', 1, 'GARBARINO ', '1666.30005', '174.96001', NULL, '1969.96997', 4, 'COMPUTADORAS. DOS LCD 17 L 177', 1, 27),
(16, '0000-00-00 00:00:00', '2008-08-07 00:00:00', '1283-00000075', 1, 'GARBARINO', '217.13000', '45.60000', NULL, '134.02000', 4, 'COMP. KE-1001 COMMODORE', 1, 27),
(17, '0000-00-00 00:00:00', '2008-08-07 00:00:00', '1283-0000074', 1, 'GARBARINO', '57.84000', '12.14000', NULL, '69.99000', 4, 'KEY DRIVE 1GB DTI KINGSTON', 1, 27),
(18, '0000-00-00 00:00:00', '2008-08-04 00:00:00', '17605', 5, 'encomienda transporte el zonda', NULL, NULL, NULL, '7.00000', 7, NULL, 1, 26),
(19, '0000-00-00 00:00:00', '2008-08-08 00:00:00', '4817', 3, 'sellos', NULL, NULL, NULL, '40.00000', 3, NULL, 1, 26),
(20, '0000-00-00 00:00:00', '2008-08-15 00:00:00', NULL, NULL, 'encomienda chepes ', NULL, NULL, NULL, '10.00000', 7, NULL, 1, 26),
(21, '0000-00-00 00:00:00', '2008-08-28 00:00:00', NULL, 4, 'Emir Made', '200.00000', NULL, NULL, '200.00000', 9, 'Viaticos viaje aimogasta', 1, 16),
(22, '0000-00-00 00:00:00', '2008-08-20 00:00:00', NULL, 5, 'EL ZONDA', '7.00000', NULL, NULL, '7.00000', 7, 'EL ZONDA', 1, 26),
(23, '0000-00-00 00:00:00', '2007-08-27 00:00:00', '26720', NULL, 'RECIBO', '100.00000', NULL, NULL, '100.00000', 11, 'COMISION DE LA FUENTE V DE PAUL', 1, 26),
(24, '0000-00-00 00:00:00', '2008-07-24 00:00:00', '26668', NULL, 'RECIBO', '2595.00000', NULL, NULL, '2595.00000', 10, 'SUELDO BRIZUELA HECTOR', 1, 26),
(25, '0000-00-00 00:00:00', '2008-08-14 00:00:00', '26672', NULL, 'RECIBO', '1842.00000', NULL, NULL, '1842.00000', 10, 'COMISION GONZALEZ SEBASTIAN ALEJANDRO', 1, 26),
(26, '0000-00-00 00:00:00', '2008-08-15 00:00:00', '26673', NULL, 'RECIBO', '1180.00000', NULL, NULL, '1180.00000', 10, 'COMISION CARINA BLANCO', 1, 26),
(27, '0000-00-00 00:00:00', '2008-08-15 00:00:00', '26674', NULL, 'RECIBO', '1180.00000', NULL, NULL, '1180.00000', 10, 'COMISION ANA VESELY', 1, 26),
(28, '0000-00-00 00:00:00', '2008-07-15 00:00:00', NULL, NULL, 'RECIBO', '4092.00000', NULL, NULL, '4092.00000', 10, 'SUELDO LUJLIO\r\nTORRES MATIAS', 1, 26),
(29, '0000-00-00 00:00:00', '2008-08-15 00:00:00', NULL, NULL, 'RECIBO', '400.00000', NULL, NULL, '400.00000', 10, 'PAGO PROPORCIONAL SUELDO JULIO ROCA JULIETA', 1, 26),
(30, '0000-00-00 00:00:00', '2008-08-15 00:00:00', NULL, NULL, 'SUELDO', '4500.00000', NULL, NULL, '4500.00000', 10, 'SUELDO JULIO EMIR MADE', 1, 26),
(31, '0000-00-00 00:00:00', '2008-08-15 00:00:00', NULL, 6, 'RECIBO', '3133.00000', NULL, NULL, '3133.00000', 10, 'SUELDO JULIO CEREZO HERNAN', 1, 26),
(32, '0000-00-00 00:00:00', '2008-08-25 00:00:00', '73951', 2, 'AUTOTRANSPORTE FACUNDO', '5.00000', NULL, NULL, '5.00000', 7, NULL, 1, 26),
(33, '0000-00-00 00:00:00', '0000-08-13 00:00:00', '44', 3, 'OLIVERA DIEGO RICARDO', '1000.00000', NULL, NULL, '1000.00000', 11, 'HONORARIOS ASESORAMIENTO PROFECIONAL', 1, 26),
(34, '0000-00-00 00:00:00', '2008-08-26 00:00:00', '26685', 6, 'PAGO INTERESES', '800.00000', NULL, NULL, '800.00000', 11, 'INTERESES PAGOS TICAC ALEJANDRO\r\n', 1, 26),
(35, '0000-00-00 00:00:00', '2008-08-28 00:00:00', '901', NULL, 'LA RIOJANA', '5.00000', NULL, NULL, '5.00000', 7, 'SOBRE', 1, 26),
(36, '0000-00-00 00:00:00', '2008-08-28 00:00:00', '18032', NULL, 'EL ZONDA', '7.00000', NULL, NULL, '7.00000', 7, 'SOBRE', 1, 26),
(37, '0000-00-00 00:00:00', '2008-08-28 00:00:00', '257', NULL, 'INTERIOJA', '10.00000', NULL, NULL, '10.00000', 7, '1 SOBRE', 1, 26),
(38, '0000-00-00 00:00:00', '0000-08-13 00:00:00', '26613', 6, 'INTERESES', '180.00000', NULL, NULL, '180.00000', 11, 'INTERESES DE JULIO QUIROGA GUILLERMO', 1, 26),
(39, '0000-00-00 00:00:00', '2008-08-13 00:00:00', '26612', 6, 'INTERESES', '180.00000', NULL, NULL, '180.00000', 11, 'INTERESES JUNIO QUIROGA GUILLERMO', 1, 26),
(40, '0000-00-00 00:00:00', '2008-08-26 00:00:00', '88', NULL, 'LA RIOJANA ', '7.00000', NULL, NULL, '7.00000', 7, 'SOBRE', 1, 26),
(41, '0000-00-00 00:00:00', '2008-08-22 00:00:00', '1954', 3, 'COMEDOR DON JAIME', '30.00000', NULL, NULL, '30.00000', 1, 'DOS ALMUERZOS', 1, 26),
(42, '0000-00-00 00:00:00', '2008-08-22 00:00:00', '9013', 3, 'CONFITERIA LA TERMINAL', '6.00000', NULL, NULL, '6.00000', 1, 'DESAYUNO', 1, 26),
(43, '0000-00-00 00:00:00', '2008-08-22 00:00:00', '667', 5, 'REMIS ', '4.80000', NULL, NULL, '4.80000', 11, 'REMIS', 1, 26),
(44, '0000-00-00 00:00:00', '2008-08-29 00:00:00', '1705', 3, 'casa de comidas', '29.50000', NULL, NULL, '29.50000', 1, '3 almuerzoz', 1, 26),
(45, '0000-00-00 00:00:00', '2008-08-29 00:00:00', '4622', 1, 'MENBER S.R.L', '69.14000', '14.52000', '36.35000', '120.01000', 11, 'COMBUSTIBLE', 1, 26),
(46, '0000-00-00 00:00:00', '2008-08-29 00:00:00', '1344', 3, 'LA HERENCIA', NULL, NULL, NULL, '65.00000', 1, 'COMESTIBLE VARIOS', 1, 26),
(47, '0000-00-00 00:00:00', '2008-08-22 00:00:00', NULL, 5, 'REMIS', NULL, NULL, NULL, '4.80000', 11, 'REMIS', 1, 26),
(48, '0000-00-00 00:00:00', '2008-08-22 00:00:00', '9013', 3, 'CONFITERIA LA TERMINAL', '6.00000', NULL, NULL, '6.00000', 1, 'DESAYUNO', 1, 26),
(49, '0000-00-00 00:00:00', '2008-08-22 00:00:00', '1954', 3, 'COMEDOR DON JAIME', '30.00000', NULL, NULL, '30.00000', 1, ' ALMUERZO', 1, 26),
(50, '0000-00-00 00:00:00', '2008-08-26 00:00:00', '88', 5, 'LA RIOJANA', '7.00000', NULL, NULL, '7.00000', 7, 'UN SOBRE', 1, 26),
(51, '0000-00-00 00:00:00', '2008-08-13 00:00:00', '26612', 6, 'PAGO INTERESES', '180.00000', NULL, NULL, '180.00000', 11, 'INTERESES DE JUNIO GUILLERMO QUIROGA', 1, 26),
(52, '0000-00-00 00:00:00', '2008-08-13 00:00:00', '26613', 6, 'INTERESES', '180.00000', NULL, NULL, '180.00000', 11, 'INTERESES DE JULIO DE GUILLERMO QUIROGA', 1, 26),
(53, '0000-00-00 00:00:00', '2008-08-29 00:00:00', NULL, 5, 'REMIS', '6.95000', NULL, NULL, '6.95000', 11, 'REMIS', 1, 26),
(54, '0000-00-00 00:00:00', '2008-08-26 00:00:00', '24780', 1, 'FROZEN SRL', '22.00000', NULL, NULL, '22.00000', 11, 'AGUA', 1, 26),
(55, '0000-00-00 00:00:00', '2008-09-02 00:00:00', '18181', NULL, 'EL ZONDA', '8.00000', NULL, NULL, '8.00000', 7, 'UN SOBRE', 1, 26),
(56, '0000-00-00 00:00:00', '2008-09-03 00:00:00', '31819', NULL, 'EL ZONDA', '7.00000', NULL, NULL, '7.00000', 7, 'UN SOBRE', 1, 26),
(57, '0000-00-00 00:00:00', '2008-09-03 00:00:00', '275', NULL, 'LA RIOJANA', '7.00000', NULL, NULL, '7.00000', 7, 'UN SOBRE', 1, 26),
(58, '0000-00-00 00:00:00', '2008-09-03 00:00:00', '29852', 1, 'OCA', '22.72000', '4.78000', NULL, '27.50000', 7, 'UN SOBRE', 1, 26),
(59, '0000-00-00 00:00:00', '2008-08-04 00:00:00', '1131', 1, 'INFOCOPI', '29.34000', '6.16000', NULL, '35.50000', 3, 'RESMAS DE PAPEL A4', 1, 26),
(60, '0000-00-00 00:00:00', '2008-08-04 00:00:00', '01252', NULL, 'INTER RIOJA', '10.00000', NULL, NULL, '10.00000', 7, 'UN SOBRE', 1, 26),
(61, '0000-00-00 00:00:00', '2008-08-04 00:00:00', '74399', 2, 'AUTOTRANSPORTE FACUNDO', '5.00000', NULL, NULL, '5.00000', 7, 'ENCOMIENDA', 1, 26),
(62, '0000-00-00 00:00:00', '2008-08-04 00:00:00', '01815', NULL, 'TELECOM', '547.87000', NULL, NULL, '547.87000', 5, 'PAGO FACTURA VENCIMIENTO 04-O8', 1, 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_linea_de_liquidacion_de_trabajo`
--

CREATE TABLE `tb_linea_de_liquidacion_de_trabajo` (
  `id_linea_de_liquidacion_de_trabajo` int(10) UNSIGNED NOT NULL,
  `tb_trabajo_linea` int(10) UNSIGNED NOT NULL,
  `tb_sys_personal0personal` int(10) UNSIGNED NOT NULL,
  `timecreate_fecha_de_registracion` datetime DEFAULT NULL,
  `fecha_de_pago` date DEFAULT NULL,
  `importe` decimal(10,2) NOT NULL,
  `observaciones` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_linea_de_liquidacion_de_trabajo`
--

INSERT INTO `tb_linea_de_liquidacion_de_trabajo` (`id_linea_de_liquidacion_de_trabajo`, `tb_trabajo_linea`, `tb_sys_personal0personal`, `timecreate_fecha_de_registracion`, `fecha_de_pago`, `importe`, `observaciones`) VALUES
(1, 1, 7, '2013-10-10 11:28:02', NULL, '300.00', NULL),
(2, 1, 9, '2013-10-10 11:37:30', NULL, '400.00', NULL),
(3, 2, 8, '2013-10-10 11:40:22', NULL, '300.00', NULL),
(4, 1, 10, '2013-10-10 11:56:07', '2013-01-01', '300.00', NULL),
(5, 2, 7, '2014-01-18 12:55:46', NULL, '400.00', NULL),
(6, 12, 6, '2019-10-15 15:12:49', '2019-10-23', '1500.00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_maquina`
--

CREATE TABLE `tb_maquina` (
  `id_maquina` int(10) UNSIGNED NOT NULL,
  `nombre_de_maquina` char(50) NOT NULL,
  `file_imagen` char(50) DEFAULT NULL,
  `tb_tipo_de_maquina` int(11) NOT NULL,
  `cantidad_hs_km_reseteo_reloj` int(11) NOT NULL,
  `presion_para_neumaticos_delanteros` int(11) NOT NULL,
  `presion_para_neumaticos_traseros` int(11) NOT NULL,
  `tb_unidad_de_trabajo` int(11) NOT NULL,
  `fecha_de_alta` date NOT NULL,
  `fecha_de_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_maquina`
--

INSERT INTO `tb_maquina` (`id_maquina`, `nombre_de_maquina`, `file_imagen`, `tb_tipo_de_maquina`, `cantidad_hs_km_reseteo_reloj`, `presion_para_neumaticos_delanteros`, `presion_para_neumaticos_traseros`, `tb_unidad_de_trabajo`, `fecha_de_alta`, `fecha_de_baja`) VALUES
(1, 'GRUA PPM A 380 32 TN', '963017393.jpg', 3, 999999, 110, 110, 2, '0000-00-00', NULL),
(3, 'GRUA P&H WS 250', '637517595.jpg', 3, 999999, 110, 110, 2, '0000-00-00', NULL),
(5, 'HIDROGRUA P&M 17002', '216010686.jpg', 3, 99999, 100, 100, 1, '0000-00-00', NULL),
(6, 'RETROEXCAVADORA CASE 580 G', '471020762.jpg', 2, 9999, 80, 100, 2, '0000-00-00', NULL),
(7, 'CATERPILLAR 910 WHEEL LOADER', '512216193.jpg', 2, 9999, 100, 100, 2, '0000-00-00', NULL),
(8, 'CARRETON NEUMATICO- 5 EJES - DE ANGELLIS', '160416504.jpg', 4, 99999, 80, 80, 1, '0000-00-00', NULL),
(9, 'SCANIA FRONTAL 113 M', '765734596.jpg', 1, 99999, 100, 100, 1, '0000-00-00', NULL),
(10, 'MERCEDEZ BENZ 608 CON CARROCERIA PLAYA', '621810112.jpg', 1, 99999, 80, 80, 1, '0000-00-00', NULL),
(11, 'AUTOELEVADOR DAEWOO', '91862733.jpg', 5, 9999, 60, 60, 2, '0000-00-00', NULL),
(12, 'TOYOTA 2.8', '385551960.jpg', 6, 999999, 40, 40, 1, '0000-00-00', NULL),
(13, 'MITSUBISHI L200 4X4', '529105937.jpg', 6, 999999, 40, 40, 1, '0000-00-00', NULL),
(14, 'CHEVROLET', '992490908.jpg', 6, 999999, 40, 40, 1, '0000-00-00', NULL),
(16, 'CASE 580 G  NUEVA', '649394102.jpg', 2, 9999, 80, 80, 2, '0000-00-00', NULL),
(17, 'DESAGOTADORA', '259786033.jpg', 1, 9999, 100, 100, 1, '0000-00-00', NULL),
(18, 'BAÑO EVENTO', '565404208.jpg', 7, 0, 0, 0, 2, '0000-00-00', NULL),
(19, 'BAÑO CONSTRUCCION', '117943500.jpg', 7, 0, 0, 0, 2, '0000-00-00', NULL),
(20, 'MOTONIVELADORA', NULL, 2, 9999, 100, 100, 2, '0000-00-00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_mes`
--

CREATE TABLE `tb_mes` (
  `id_mes` int(10) UNSIGNED NOT NULL,
  `mes` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_mes`
--

INSERT INTO `tb_mes` (`id_mes`, `mes`) VALUES
(1, 'ENERO'),
(2, 'FEBRERO'),
(3, 'MARZO'),
(4, 'ABRIL'),
(5, 'MAYO'),
(6, 'JUNIO'),
(7, 'JULIO'),
(8, 'AGOSTO'),
(9, 'SEPTIEMBRE'),
(10, 'OCTUBRE'),
(11, 'NOVIEMBRE'),
(12, 'DICIEMBRE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_modulo_de_alarma`
--

CREATE TABLE `tb_modulo_de_alarma` (
  `id_modulo_de_alarma` int(10) UNSIGNED NOT NULL,
  `modulo_de_alarma` varchar(45) NOT NULL,
  `nro_de_orden` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_modulo_de_alarma`
--

INSERT INTO `tb_modulo_de_alarma` (`id_modulo_de_alarma`, `modulo_de_alarma`, `nro_de_orden`) VALUES
(1, 'TRABAJOS', 1),
(2, 'COBROS', 2),
(3, 'MANTENIMIENTO', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_nivel_de_alarma`
--

CREATE TABLE `tb_nivel_de_alarma` (
  `id_nivel_de_alarma` int(10) UNSIGNED NOT NULL,
  `nivel_de_alarma` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_nivel_de_alarma`
--

INSERT INTO `tb_nivel_de_alarma` (`id_nivel_de_alarma`, `nivel_de_alarma`) VALUES
(1, 'ALTO'),
(2, 'MEDIO'),
(3, 'BAJO'),
(4, 'ADVERTENCIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_pago_de_sueldo`
--

CREATE TABLE `tb_pago_de_sueldo` (
  `id_pago_de_sueldo` int(10) UNSIGNED NOT NULL,
  `fecha_now` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tb_sys_personal0persona_que_pago` int(11) NOT NULL,
  `tb_sys_personal0persona_que_cobro` int(11) NOT NULL,
  `fecha_de_pago` datetime NOT NULL,
  `mes_de_liquidacion` int(11) NOT NULL,
  `anio_de_liquidacion` int(11) NOT NULL,
  `importe` decimal(10,2) NOT NULL,
  `observaciones` char(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_pago_de_sueldo`
--

INSERT INTO `tb_pago_de_sueldo` (`id_pago_de_sueldo`, `fecha_now`, `tb_sys_personal0persona_que_pago`, `tb_sys_personal0persona_que_cobro`, `fecha_de_pago`, `mes_de_liquidacion`, `anio_de_liquidacion`, `importe`, `observaciones`) VALUES
(2, '0000-00-00 00:00:00', 2, 6, '2008-03-20 00:00:00', 3, 2008, '55.00', 'PORCENTAJE POR TRABAJO CON HIDROGRUA. TRABAJO REALIZADO AL BOLITA-EL GALLEGO'),
(3, '0000-00-00 00:00:00', 2, 6, '2008-03-21 00:00:00', 3, 2008, '55.00', 'PORCENTAJE POR TRABAJO CON HIDROGRUA. TRABAJO REALIZADO EN ESTRUCTURAS ARGENTINAS'),
(4, '0000-00-00 00:00:00', 2, 8, '2008-03-22 00:00:00', 3, 2008, '100.00', 'POR TRABAJAR LOS FERIADOS 20-03 Y 22-03'),
(5, '0000-00-00 00:00:00', 2, 6, '2008-03-22 00:00:00', 3, 2008, '150.00', 'POR TRABAJAR LOS FERIADOS 20-03 Y 22-03'),
(6, '0000-00-00 00:00:00', 2, 7, '2008-03-22 00:00:00', 3, 2008, '100.00', 'POR TRABAJAR LOS FERIADOS 20-03 Y 22-03'),
(7, '0000-00-00 00:00:00', 2, 8, '2008-03-24 00:00:00', 3, 2008, '100.00', 'POR TRABAJAR LOS FERIADOS 23-03 Y 24-03'),
(8, '0000-00-00 00:00:00', 2, 6, '2008-03-24 00:00:00', 3, 2008, '150.00', 'POR TRABAJAR LOS FERIADOS 23-03 Y 24-03'),
(9, '0000-00-00 00:00:00', 2, 7, '2008-03-24 00:00:00', 3, 2008, '0.00', 'POR TRABAJAR LOS FERIADOS 23-03 Y 24-03'),
(10, '0000-00-00 00:00:00', 2, 6, '2008-03-16 00:00:00', 3, 2008, '457.00', 'POR TRABAJAR LOS FERIADOS 15-03 Y 16-03'),
(11, '0000-00-00 00:00:00', 2, 11, '2008-03-26 00:00:00', 3, 2008, '50.00', 'PAGO ADELANTADO'),
(12, '0000-00-00 00:00:00', 2, 3, '2008-03-28 00:00:00', 3, 2008, '3470.00', 'PAGO POR PRESUPUESTOS'),
(13, '0000-00-00 00:00:00', 2, 12, '2008-03-29 00:00:00', 3, 2008, '1100.00', 'POR CALZODO DE POZO Y CAMARA'),
(14, '0000-00-00 00:00:00', 2, 10, '2008-03-29 00:00:00', 3, 2008, '200.00', 'ADELANTO'),
(15, '0000-00-00 00:00:00', 2, 8, '2008-03-29 00:00:00', 3, 2008, '200.00', 'PAGO SEMANAL'),
(16, '0000-00-00 00:00:00', 2, 7, '2008-03-29 00:00:00', 3, 2008, '200.00', 'ADELANTO'),
(17, '0000-00-00 00:00:00', 2, 11, '2008-03-29 00:00:00', 3, 2008, '250.00', 'PAGO SEMANAL RESTANTE'),
(18, '0000-00-00 00:00:00', 2, 5, '2008-03-29 00:00:00', 3, 2008, '300.00', NULL),
(19, '0000-00-00 00:00:00', 2, 13, '2008-03-29 00:00:00', 3, 2008, '20.00', NULL),
(20, '0000-00-00 00:00:00', 10, 6, '2008-03-22 00:00:00', 3, 2008, '458.00', NULL),
(21, '0000-00-00 00:00:00', 10, 6, '2008-03-22 00:00:00', 3, 2008, '458.00', NULL),
(22, '0000-00-00 00:00:00', 6, 6, '2008-03-04 00:00:00', 3, 2008, '150.00', NULL),
(25, '0000-00-00 00:00:00', 3, 6, '2008-03-04 00:00:00', 3, 2008, '150.00', NULL),
(26, '0000-00-00 00:00:00', 2, 6, '2008-03-04 00:00:00', 3, 2008, '151.00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_paso`
--

CREATE TABLE `tb_paso` (
  `id_paso` int(10) UNSIGNED NOT NULL,
  `paso` varchar(45) NOT NULL,
  `tb_proceso` int(10) UNSIGNED NOT NULL,
  `nro_de_orden` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_paso`
--

INSERT INTO `tb_paso` (`id_paso`, `paso`, `tb_proceso`, `nro_de_orden`) VALUES
(1, 'REGISTRADO', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_periodo_de_liquidacion`
--

CREATE TABLE `tb_periodo_de_liquidacion` (
  `id_periodo_de_liquidacion` int(10) UNSIGNED NOT NULL,
  `tb_mes` int(10) UNSIGNED NOT NULL,
  `anio` int(4) UNSIGNED NOT NULL,
  `timecreate_fecha_de_generacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_periodo_de_liquidacion`
--

INSERT INTO `tb_periodo_de_liquidacion` (`id_periodo_de_liquidacion`, `tb_mes`, `anio`, `timecreate_fecha_de_generacion`) VALUES
(1, 6, 2014, '2014-06-01 18:02:24'),
(2, 1, 2018, '2018-01-03 11:24:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_persona`
--

CREATE TABLE `tb_persona` (
  `id_personal` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL DEFAULT '',
  `apellido` varchar(60) NOT NULL DEFAULT '',
  `numero_de_documento` int(11) NOT NULL,
  `celular` varchar(80) DEFAULT NULL,
  `domicilio` varchar(100) DEFAULT NULL,
  `file_fotografia` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_plan_de_cuenta`
--

CREATE TABLE `tb_plan_de_cuenta` (
  `id_plan_de_cuenta` int(10) UNSIGNED NOT NULL,
  `plan_de_cuenta` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_plan_de_cuenta`
--

INSERT INTO `tb_plan_de_cuenta` (`id_plan_de_cuenta`, `plan_de_cuenta`) VALUES
(1, 'TRABAJO'),
(2, 'PAGO DE IVA'),
(3, 'LIBRERÍA '),
(4, 'MUEBLES Y UTILES'),
(5, 'TELEFONO '),
(6, 'MANTENIMIENTO '),
(7, 'ENCOMIENDA '),
(8, 'FOTOCOPIAS '),
(9, 'VIATICOS '),
(10, 'SUELDOS '),
(11, 'GASTOS VARIOS '),
(12, 'ALQUILER '),
(13, 'COMESTIBLES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_proceso`
--

CREATE TABLE `tb_proceso` (
  `id_proceso` int(10) UNSIGNED NOT NULL,
  `proceso` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_proceso`
--

INSERT INTO `tb_proceso` (`id_proceso`, `proceso`) VALUES
(1, 'TRABAJOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_razon_social`
--

CREATE TABLE `tb_razon_social` (
  `id_razon_social` int(10) UNSIGNED NOT NULL,
  `razon_social` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_razon_social`
--

INSERT INTO `tb_razon_social` (`id_razon_social`, `razon_social`) VALUES
(1, 'MADOZ RODOLFO Y MIGUEL S.H.'),
(2, 'MARTIN MADOZ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_registro_de_km_hs`
--

CREATE TABLE `tb_registro_de_km_hs` (
  `id_registro_de_km_hs` int(10) UNSIGNED NOT NULL,
  `tb_maquina` int(10) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `km_hs` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_registro_de_km_hs`
--

INSERT INTO `tb_registro_de_km_hs` (`id_registro_de_km_hs`, `tb_maquina`, `fecha`, `km_hs`) VALUES
(1, 1, '2008-11-01', 100),
(2, 1, '2008-12-01', 1002),
(3, 1, '2009-01-27', 3000),
(4, 3, '2009-01-27', 5000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_regla_de_mantenimiento`
--

CREATE TABLE `tb_regla_de_mantenimiento` (
  `id_regla_de_mantenimiento` int(10) UNSIGNED NOT NULL,
  `tb_maquina` int(11) NOT NULL,
  `tb_tipo_accion_de_mantenimiento` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `tb_unidad_de_control` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_regla_de_mantenimiento`
--

INSERT INTO `tb_regla_de_mantenimiento` (`id_regla_de_mantenimiento`, `tb_maquina`, `tb_tipo_accion_de_mantenimiento`, `cantidad`, `tb_unidad_de_control`) VALUES
(1, 1, 2, 1000, 1),
(2, 1, 6, 500, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_rel_cobro_factura`
--

CREATE TABLE `tb_rel_cobro_factura` (
  `id_rel_cobro_factura` int(10) UNSIGNED NOT NULL,
  `tb_cobro` int(10) UNSIGNED NOT NULL,
  `tb_trabajo_encabezado_factura` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_rel_cobro_factura`
--

INSERT INTO `tb_rel_cobro_factura` (`id_rel_cobro_factura`, `tb_cobro`, `tb_trabajo_encabezado_factura`) VALUES
(1, 6, 1),
(4, 6, 3),
(5, 6, 7),
(6, 13, 3),
(7, 15, 6),
(8, 17, 8),
(9, 19, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_rel_empresa_x_repuesto`
--

CREATE TABLE `tb_rel_empresa_x_repuesto` (
  `id_rel_proveedor_repuesto_o_insumo` int(10) UNSIGNED NOT NULL,
  `tb_empresa0proveedor` int(11) NOT NULL,
  `tb_repuesto_o_insumo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_rel_empresa_x_repuesto`
--

INSERT INTO `tb_rel_empresa_x_repuesto` (`id_rel_proveedor_repuesto_o_insumo`, `tb_empresa0proveedor`, `tb_repuesto_o_insumo`) VALUES
(1, 12, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_repuesto_insumo_x_mantenimiento`
--

CREATE TABLE `tb_repuesto_insumo_x_mantenimiento` (
  `id_repuesto_insumo_x_mantenimiento` int(10) UNSIGNED NOT NULL,
  `tb_repuesto_o_insumo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `tb_accion_de_mantenimiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_repuesto_insumo_x_maquina`
--

CREATE TABLE `tb_repuesto_insumo_x_maquina` (
  `id_repuesto_insumo_x_maquina` int(10) UNSIGNED NOT NULL,
  `tb_maquina` int(11) NOT NULL,
  `tb_repuesto_o_insumo` int(11) NOT NULL,
  `tb_uso_de_repuesto_insumo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_repuesto_insumo_x_maquina`
--

INSERT INTO `tb_repuesto_insumo_x_maquina` (`id_repuesto_insumo_x_maquina`, `tb_maquina`, `tb_repuesto_o_insumo`, `tb_uso_de_repuesto_insumo`) VALUES
(1, 1, 5, 1),
(2, 3, 6, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_repuesto_insumo_x_trabajo_linea`
--

CREATE TABLE `tb_repuesto_insumo_x_trabajo_linea` (
  `id_repuesto_insumo_x_mantenimiento` int(10) UNSIGNED NOT NULL,
  `tb_repuesto_o_insumo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `tb_trabajo_linea` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_repuesto_o_insumo`
--

CREATE TABLE `tb_repuesto_o_insumo` (
  `id_repuesto_o_insumo` int(10) UNSIGNED NOT NULL,
  `tb_tipo_repuesto_insumo` int(11) NOT NULL,
  `nombre_de_repuesto_o_descripcion` char(150) NOT NULL,
  `tb_fabricante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_repuesto_o_insumo`
--

INSERT INTO `tb_repuesto_o_insumo` (`id_repuesto_o_insumo`, `tb_tipo_repuesto_insumo`, `nombre_de_repuesto_o_descripcion`, `tb_fabricante`) VALUES
(1, 2, 'GASOIL', NULL),
(2, 2, 'NAFTA NORMAL', NULL),
(3, 2, 'NAFTA SUPER', NULL),
(4, 2, 'KEROSENE', NULL),
(5, 2, 'ACEITE 15W40', 1),
(6, 2, 'ACEITE HIDRAULICO 19', 1),
(7, 1, 'SILENCIADOR PARA CAMION INTERNACIONAL', 10),
(8, 1, 'VARIOS', 10),
(9, 1, 'JUEGO DE VALVULAS + JUEGO DE JUNTA TAPA', 10),
(10, 1, 'CHAVETA EMBRAGUE APA', 10),
(11, 2, 'PINTURA 2X1', 11),
(12, 1, 'BULONES', 10),
(13, 1, 'RULEMANES', 10),
(14, 1, 'RETENES', 10),
(15, 2, 'ACEITE MONOGRADO 90', 2),
(16, 2, 'DISCO BASE DE FIBRA', 10),
(17, 2, 'ACEITE HIPOIDAL 85W140', 1),
(18, 1, 'REPARACION BOMBA INYECTORA', 10),
(19, 1, 'ARTICULOS DE LIMPIEZA', 10),
(20, 2, 'SOLDADURA', 10),
(21, 1, 'CARBONES', 10),
(22, 1, 'BOBINADO MOTOR MAQ. CESPED', 10),
(23, 1, 'LIQUIDO DE FRENOS', 10),
(24, 1, 'MANGUERAS Y BRIDAS', 10),
(25, 1, 'ARANDELAS', 10),
(26, 2, 'JABON BLANCO', 10),
(27, 2, 'PICOS Y CANDADOS', 10),
(28, 1, 'ARANDELAS ARAÑA', 10),
(29, 1, 'LUZ PILOTO', 10),
(30, 2, 'CUADERNOS', 10),
(31, 1, 'CRAPODINA', 10),
(32, 2, 'ALIMENTO PARA PERROS', 10),
(33, 1, 'REGULADOR DE EMBRAGUE', 10),
(34, 2, 'OXIGENO', 10),
(35, 2, 'LIMPIEZA Y COMIDA', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_servicio_de_personal`
--

CREATE TABLE `tb_servicio_de_personal` (
  `id_servicio_de_personal` int(10) UNSIGNED NOT NULL,
  `tb_sys_personal` int(10) UNSIGNED NOT NULL,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` date DEFAULT NULL,
  `sueldo_fijo` decimal(10,2) NOT NULL,
  `sueldo_neto` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_servicio_de_personal`
--

INSERT INTO `tb_servicio_de_personal` (`id_servicio_de_personal`, `tb_sys_personal`, `fecha_desde`, `fecha_hasta`, `sueldo_fijo`, `sueldo_neto`) VALUES
(1, 4, '2008-01-01', NULL, '3000.00', '3800.00'),
(2, 7, '2005-01-01', NULL, '4000.00', '4500.00'),
(3, 10, '2008-01-01', NULL, '4500.00', '4000.00'),
(4, 9, '2007-01-01', '2013-12-15', '2000.00', '2500.00'),
(5, 8, '2013-12-12', NULL, '2500.00', '3000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tipo_accion_de_mantenimiento`
--

CREATE TABLE `tb_tipo_accion_de_mantenimiento` (
  `id_tipo_accion_de_mantenimiento` int(10) UNSIGNED NOT NULL,
  `tipo_accion_de_mantenimiento` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_tipo_accion_de_mantenimiento`
--

INSERT INTO `tb_tipo_accion_de_mantenimiento` (`id_tipo_accion_de_mantenimiento`, `tipo_accion_de_mantenimiento`) VALUES
(1, 'CAMBIO FILTRO DE ACEITE MOTOR'),
(2, 'CAMBIO FILTRO DE ACEITE HIDRAULICO'),
(3, 'CAMBIO FILTRO DE GASOIL'),
(4, 'CAMBIO FILTRO DE AIRE'),
(5, 'CAMBIO DE BATERIA'),
(6, 'ENGRASE'),
(7, 'REGULACION DE FRENOS'),
(8, 'CALIBRACION DE NEUMATICOS'),
(9, 'CAMBIO DE AMORTIGUADORES'),
(10, 'SUPERVISION DE HS O KM DE MAQUINA'),
(11, 'SOPLETEO FILTRO DE AIRE'),
(12, 'CAMBIO ACEITE MOTOR'),
(13, 'CAMBIO ACEITE HIDRAULICO'),
(14, 'CAMBIO ACEITE CAJA'),
(15, 'CAMBIO ACEITE DIFERENCIAL'),
(16, 'REVISAR Y COMPLETAR ACEITE DIRECCION HIDRAULICA'),
(17, 'REVISAR Y COMPLETAR LIQUIDO DE FRENOS'),
(18, 'LIMPIEZA DE RADIADOR, CAMBIO DE AGUA Y AGREGADO DE LIQUIDO REFRIGERANTE'),
(19, 'REVISADO Y CARGA DE BATERIA'),
(20, 'REVISADO Y CAMBIO DE CORREAS'),
(21, 'REFUERZO DE BALDES PARA PALA Y RETRO'),
(22, 'CAMBIO DE UÑA O CUCHILLAS PALA O RETRO'),
(23, 'LIMPIEZA O CAMBIO DE FILTRO TACITA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tipo_de_alarma`
--

CREATE TABLE `tb_tipo_de_alarma` (
  `id_tipo_de_alarma` int(10) UNSIGNED NOT NULL,
  `tipo_de_alarma` varchar(45) NOT NULL,
  `tb_nivel_de_alarma` int(10) UNSIGNED NOT NULL,
  `tb_modulo_de_alarma` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_tipo_de_alarma`
--

INSERT INTO `tb_tipo_de_alarma` (`id_tipo_de_alarma`, `tipo_de_alarma`, `tb_nivel_de_alarma`, `tb_modulo_de_alarma`) VALUES
(1, 'REGISTRO DE KM/HS', 1, 3),
(2, 'ACCION DE MANTENIMIENTO', 1, 3),
(3, 'CHEQUE A COBRAR', 3, 2),
(4, 'CHEQUE POR VENCER', 2, 2),
(5, 'CHEQUE VENCIDO', 1, 2),
(6, 'TRABAJO PROXIMO A REALIZAR', 3, 1),
(7, 'TRABAJO A REALIZAR HOY', 1, 1),
(8, 'COBRO PROXIMO', 4, 2),
(9, 'COBRO HOY', 1, 2),
(10, 'COBRO VENCIDO', 1, 2),
(11, 'TRABAJO VENCIDO', 1, 1),
(12, 'LINEA DE TRABAJO PROXIMO A REALIZAR', 3, 1),
(13, 'LINEA DE TRABAJO A REALIZAR HOY', 1, 1),
(14, 'LINEA DE TRABAJO VENCIDA', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tipo_de_cobro`
--

CREATE TABLE `tb_tipo_de_cobro` (
  `id_tipo_de_cobro` int(2) NOT NULL,
  `tipo_de_cobro` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_tipo_de_cobro`
--

INSERT INTO `tb_tipo_de_cobro` (`id_tipo_de_cobro`, `tipo_de_cobro`) VALUES
(1, 'EFECTIVO'),
(2, 'DEPOSITO'),
(3, 'CHEQUE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tipo_de_factura`
--

CREATE TABLE `tb_tipo_de_factura` (
  `id_tipo_de_factura` int(10) UNSIGNED NOT NULL,
  `tipo_de_factura` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_tipo_de_factura`
--

INSERT INTO `tb_tipo_de_factura` (`id_tipo_de_factura`, `tipo_de_factura`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'X'),
(5, 'TICKET'),
(6, 'RECIBOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tipo_de_maquina`
--

CREATE TABLE `tb_tipo_de_maquina` (
  `id_tipo_de_maquina` int(10) UNSIGNED NOT NULL,
  `tipo_de_maquina` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_tipo_de_maquina`
--

INSERT INTO `tb_tipo_de_maquina` (`id_tipo_de_maquina`, `tipo_de_maquina`) VALUES
(1, 'CAMION'),
(2, 'MAQUINA VIAL'),
(3, 'GRUA'),
(4, 'CARRETON'),
(5, 'AUTOELEVADOR'),
(6, 'VEHICULO O CAMIONETA'),
(7, 'OTRO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tipo_de_trabajo`
--

CREATE TABLE `tb_tipo_de_trabajo` (
  `id_tipo_de_trabajo` int(10) UNSIGNED NOT NULL,
  `tipo_de_trabajo` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_tipo_de_trabajo`
--

INSERT INTO `tb_tipo_de_trabajo` (`id_tipo_de_trabajo`, `tipo_de_trabajo`) VALUES
(1, 'TRANSPORTE DE MAQUINA'),
(2, 'ALQUILER DE MAQUINA'),
(3, 'FLETE'),
(4, 'REPARACION MECANICA'),
(5, 'REPARACION HIDRAULICA'),
(6, 'SOLDADURA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tipo_repuesto_insumo`
--

CREATE TABLE `tb_tipo_repuesto_insumo` (
  `id_tipo_repuesto_insumo` int(10) UNSIGNED NOT NULL,
  `tipo_repuesto_insumo` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_tipo_repuesto_insumo`
--

INSERT INTO `tb_tipo_repuesto_insumo` (`id_tipo_repuesto_insumo`, `tipo_repuesto_insumo`) VALUES
(1, 'REPUESTO'),
(2, 'INSUMO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_trabajo_encabezado`
--

CREATE TABLE `tb_trabajo_encabezado` (
  `id_trabajo_encabezado` int(10) UNSIGNED NOT NULL,
  `fecha_now` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tb_firma` int(10) UNSIGNED DEFAULT NULL,
  `tb_empresa0cliente` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `tb_sys_personal0usuario_que_cargo` int(10) UNSIGNED NOT NULL,
  `fecha_de_cancelacion` date DEFAULT NULL,
  `observaciones` varchar(250) DEFAULT NULL,
  `observaciones_de_cancelacion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_trabajo_encabezado`
--

INSERT INTO `tb_trabajo_encabezado` (`id_trabajo_encabezado`, `fecha_now`, `tb_firma`, `tb_empresa0cliente`, `fecha_inicio`, `fecha_fin`, `tb_sys_personal0usuario_que_cargo`, `fecha_de_cancelacion`, `observaciones`, `observaciones_de_cancelacion`) VALUES
(3, '0000-00-00 00:00:00', 1, 38, '2007-12-12', NULL, 5, NULL, NULL, NULL),
(11, '0000-00-00 00:00:00', 1, 35, '2009-01-09', NULL, 5, NULL, 'ninguna', NULL),
(12, '0000-00-00 00:00:00', 0, 1, NULL, NULL, 5, NULL, NULL, NULL),
(13, '0000-00-00 00:00:00', 3, 1, '2009-01-27', NULL, 5, NULL, 'ninguna', NULL),
(14, '0000-00-00 00:00:00', 1, 1, '2008-01-01', NULL, 5, NULL, NULL, NULL),
(15, '0000-00-00 00:00:00', 1, 1, '2009-01-28', NULL, 5, NULL, NULL, NULL),
(16, '2009-02-24 19:45:39', 1, 2, '2009-02-24', NULL, 5, NULL, NULL, NULL),
(17, '2013-10-10 06:57:29', 1, 1, '2013-10-10', NULL, 2, NULL, NULL, NULL),
(18, '2013-10-10 07:16:53', 1, 4, '2013-10-10', NULL, 5, NULL, NULL, NULL),
(19, '2013-10-10 12:00:18', NULL, 46, NULL, NULL, 5, NULL, NULL, NULL),
(20, '2018-01-03 13:40:57', 3, 36, '0000-00-00', NULL, 5, NULL, 'llamo y pidio 2 ba{os', NULL),
(21, '2019-10-15 18:08:52', 1, 61, '0000-00-00', NULL, 5, NULL, NULL, NULL),
(22, '2022-05-15 13:31:00', 1, 61, '0000-00-00', NULL, 5, NULL, 'chaya', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_trabajo_encabezado_factura`
--

CREATE TABLE `tb_trabajo_encabezado_factura` (
  `id_trabajo_encabezado_factura` int(10) UNSIGNED NOT NULL,
  `fecha_now` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tb_trabajo_encabezado` int(10) UNSIGNED NOT NULL,
  `tb_razon_social` int(10) NOT NULL,
  `tb_tipo_de_factura` int(10) UNSIGNED NOT NULL,
  `fecha_de_la_factura` date NOT NULL,
  `nro_de_factura` varchar(45) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_trabajo_encabezado_factura`
--

INSERT INTO `tb_trabajo_encabezado_factura` (`id_trabajo_encabezado_factura`, `fecha_now`, `tb_trabajo_encabezado`, `tb_razon_social`, `tb_tipo_de_factura`, `fecha_de_la_factura`, `nro_de_factura`, `descripcion`, `importe`) VALUES
(1, '0000-00-00 00:00:00', 11, 1, 1, '2008-12-12', '1', 'n', 1300),
(2, '2009-02-24 19:55:08', 16, 0, 1, '2008-02-15', '0001-45872', NULL, 4000),
(3, '2014-01-11 17:44:29', 11, 1, 1, '2008-12-12', '2', NULL, 11),
(4, '2014-01-11 17:44:56', 11, 1, 1, '2008-12-12', '3', NULL, 20),
(5, '2014-01-11 17:45:28', 11, 1, 1, '2008-12-12', '4', NULL, 1),
(6, '2014-01-11 17:46:03', 11, 1, 1, '2008-12-12', '5', NULL, 1),
(7, '2014-01-11 17:50:48', 11, 1, 1, '2008-12-12', '6', NULL, 1),
(8, '2019-10-15 18:16:42', 21, 1, 1, '0000-00-00', '0005', NULL, 20000),
(9, '2022-05-15 13:36:06', 22, 1, 1, '0000-00-00', '3333', NULL, 5000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_trabajo_encabezado_factura_remito`
--

CREATE TABLE `tb_trabajo_encabezado_factura_remito` (
  `id_trabajo_encabezado_factura_remito` int(10) UNSIGNED NOT NULL,
  `tb_trabajo_encabezado_factura` int(10) UNSIGNED NOT NULL,
  `tb_trabajo_linea` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_trabajo_encabezado_factura_remito`
--

INSERT INTO `tb_trabajo_encabezado_factura_remito` (`id_trabajo_encabezado_factura_remito`, `tb_trabajo_encabezado_factura`, `tb_trabajo_linea`) VALUES
(5, 2, 8),
(6, 2, 9),
(7, 8, 12),
(8, 9, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_trabajo_encabezado_paso`
--

CREATE TABLE `tb_trabajo_encabezado_paso` (
  `id_trabajo_encabezado_paso` int(10) UNSIGNED NOT NULL,
  `tb_trabajo_encabezado` int(10) UNSIGNED NOT NULL,
  `tb_paso` int(10) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `observaciones` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_trabajo_encabezado_seguimiento`
--

CREATE TABLE `tb_trabajo_encabezado_seguimiento` (
  `id_trabajo_encabezado_seguimiento` int(10) UNSIGNED NOT NULL,
  `fecha_now` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tb_trabajo_encabezado` int(10) UNSIGNED NOT NULL,
  `observaciones` varchar(250) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_trabajo_encabezado_seguimiento`
--

INSERT INTO `tb_trabajo_encabezado_seguimiento` (`id_trabajo_encabezado_seguimiento`, `fecha_now`, `tb_trabajo_encabezado`, `observaciones`, `fecha`) VALUES
(1, '2012-06-29 14:07:03', 13, 'lklñk', '2012-06-29'),
(2, '2013-10-10 07:22:54', 17, 'aa', '2013-10-10'),
(3, '2018-01-03 13:46:05', 20, 'los fuimos a dejar y estan instalados', '2018-01-03'),
(4, '2019-10-15 18:13:07', 21, 'el arq. pidio que los o', '2019-10-15'),
(5, '2022-05-15 13:34:10', 22, 'hubsasdasd', '2022-05-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_trabajo_linea`
--

CREATE TABLE `tb_trabajo_linea` (
  `id_trabajo_linea` int(10) UNSIGNED NOT NULL,
  `fecha_now` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tb_trabajo_encabezado` int(11) NOT NULL,
  `tb_maquina` int(11) DEFAULT NULL,
  `lugar_de_trabajo` char(150) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `tb_tipo_de_trabajo` int(11) NOT NULL,
  `tb_unidad_de_trabajo` int(11) DEFAULT NULL,
  `cantidad_unidades_trabajo` decimal(10,2) DEFAULT NULL,
  `importe` decimal(10,2) DEFAULT NULL,
  `nro_de_remito` varchar(15) DEFAULT NULL,
  `persona_que_autoriza` varchar(80) DEFAULT NULL,
  `persona_que_supervisa` varchar(80) DEFAULT NULL,
  `observaciones` varchar(250) DEFAULT NULL,
  `trabajo_realizado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_trabajo_linea`
--

INSERT INTO `tb_trabajo_linea` (`id_trabajo_linea`, `fecha_now`, `tb_trabajo_encabezado`, `tb_maquina`, `lugar_de_trabajo`, `fecha_inicio`, `fecha_fin`, `tb_tipo_de_trabajo`, `tb_unidad_de_trabajo`, `cantidad_unidades_trabajo`, `importe`, `nro_de_remito`, `persona_que_autoriza`, `persona_que_supervisa`, `observaciones`, `trabajo_realizado`) VALUES
(1, '0000-00-00 00:00:00', 11, 1, 'Fabrica', '2008-01-01', '2008-01-31', 1, 2, '5.00', '5.00', '454', NULL, NULL, NULL, 'NO'),
(2, '0000-00-00 00:00:00', 11, 5, 'Fabrica', '2008-01-01', '2008-01-31', 1, 1, '5.00', '5.00', '1234', 'fer', 'nando', NULL, 'NO'),
(3, '0000-00-00 00:00:00', 3, 1, 'Fabrica', '2008-01-01', '2008-01-31', 1, 1, '5.00', '1350.00', NULL, NULL, NULL, NULL, ''),
(5, '0000-00-00 00:00:00', 13, 18, NULL, '2009-01-27', NULL, 2, NULL, NULL, '1350.00', NULL, NULL, NULL, NULL, 'NO'),
(6, '0000-00-00 00:00:00', 14, 1, NULL, '0000-00-00', NULL, 1, NULL, NULL, '1350.00', NULL, NULL, NULL, NULL, ''),
(7, '0000-00-00 00:00:00', 15, 1, NULL, '2008-01-01', NULL, 4, 1, NULL, '10.00', NULL, NULL, NULL, NULL, 'SI'),
(8, '2009-02-24 19:47:13', 16, 7, NULL, '2008-01-01', NULL, 2, 2, '20.00', '5000.00', '1542', NULL, NULL, NULL, 'SI'),
(9, '2009-02-24 19:47:51', 16, 16, NULL, '2009-02-05', NULL, 2, 2, '60.00', '2000.00', NULL, NULL, NULL, NULL, 'SI'),
(10, '2013-10-10 08:00:00', 17, 6, '1', '2013-01-01', NULL, 1, 1, NULL, '300.00', NULL, NULL, NULL, NULL, 'SI'),
(11, '2018-01-03 13:45:00', 20, 18, 'fabrica', '0000-00-00', '0000-00-00', 2, NULL, NULL, '1400.00', NULL, NULL, NULL, NULL, 'NO'),
(12, '2019-10-15 18:11:35', 21, 1, NULL, '0000-00-00', '0000-00-00', 2, 2, '10.00', '25000.00', '333545', NULL, NULL, NULL, 'SI'),
(13, '2022-05-15 13:33:54', 22, 18, NULL, '0000-00-00', NULL, 2, NULL, '10.00', '10000.00', '222', NULL, NULL, NULL, 'SI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_unidad_de_control`
--

CREATE TABLE `tb_unidad_de_control` (
  `id_unidad_de_control` int(10) UNSIGNED NOT NULL,
  `unidad_de_control` char(20) NOT NULL,
  `cantidad_de_dias_de_la_unidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_unidad_de_control`
--

INSERT INTO `tb_unidad_de_control` (`id_unidad_de_control`, `unidad_de_control`, `cantidad_de_dias_de_la_unidad`) VALUES
(1, 'HS O KM', NULL),
(2, 'DIA', 1),
(3, 'SEMANA', 7),
(4, 'MES', 30),
(5, 'AÑO', 365);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_unidad_de_trabajo`
--

CREATE TABLE `tb_unidad_de_trabajo` (
  `id_unidad_de_trabajo` int(10) UNSIGNED NOT NULL,
  `unidad_de_trabajo` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_unidad_de_trabajo`
--

INSERT INTO `tb_unidad_de_trabajo` (`id_unidad_de_trabajo`, `unidad_de_trabajo`) VALUES
(1, 'KM'),
(2, 'HS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_uso_de_repuesto_insumo`
--

CREATE TABLE `tb_uso_de_repuesto_insumo` (
  `id_uso_de_repuesto_insumo` int(10) UNSIGNED NOT NULL,
  `uso_de_repuesto_insumo` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_uso_de_repuesto_insumo`
--

INSERT INTO `tb_uso_de_repuesto_insumo` (`id_uso_de_repuesto_insumo`, `uso_de_repuesto_insumo`) VALUES
(1, 'MOTOR'),
(2, 'HIDRAULICA'),
(3, 'CAJA'),
(4, 'DIFERENCIAL');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_accion_de_mantenimiento`
--
ALTER TABLE `tb_accion_de_mantenimiento`
  ADD PRIMARY KEY (`id_accion_de_mantenimiento`),
  ADD KEY `tb_tipo_accion_de_mantenimiento` (`tb_tipo_accion_de_mantenimiento`),
  ADD KEY `tb_maquina` (`tb_maquina`),
  ADD KEY `fecha_de_realizaion` (`fecha_de_realizaion`);

--
-- Indices de la tabla `tb_alarma`
--
ALTER TABLE `tb_alarma`
  ADD PRIMARY KEY (`id_alarma`) USING BTREE;

--
-- Indices de la tabla `tb_banco`
--
ALTER TABLE `tb_banco`
  ADD PRIMARY KEY (`id_banco`);

--
-- Indices de la tabla `tb_causa_de_baja_cheque`
--
ALTER TABLE `tb_causa_de_baja_cheque`
  ADD PRIMARY KEY (`id_causa_de_baja_cheque`);

--
-- Indices de la tabla `tb_cheque`
--
ALTER TABLE `tb_cheque`
  ADD PRIMARY KEY (`id_cheque`),
  ADD KEY `numero_de_cheque` (`numero_de_cheque`),
  ADD KEY `tb_banco` (`tb_banco`);

--
-- Indices de la tabla `tb_cobro`
--
ALTER TABLE `tb_cobro`
  ADD PRIMARY KEY (`id_cobro`),
  ADD KEY `tb_trabajo_encabezado` (`tb_trabajo_encabezado`);

--
-- Indices de la tabla `tb_compra`
--
ALTER TABLE `tb_compra`
  ADD PRIMARY KEY (`id_compra`) USING BTREE,
  ADD KEY `fecha_de_compra` (`fecha_de_compra`);

--
-- Indices de la tabla `tb_cuenta`
--
ALTER TABLE `tb_cuenta`
  ADD PRIMARY KEY (`id_cuenta`),
  ADD KEY `numero_de_cuenta` (`numero_de_cuenta`),
  ADD KEY `tb_banco` (`tb_banco`),
  ADD KEY `titular_de_la_cuenta` (`titular_de_la_cuenta`),
  ADD KEY `Index_5` (`tb_firma`);

--
-- Indices de la tabla `tb_deposito`
--
ALTER TABLE `tb_deposito`
  ADD PRIMARY KEY (`id_deposito`),
  ADD KEY `fecha_de_deposito` (`fecha_de_deposito`),
  ADD KEY `monto_de_deposito` (`monto_de_deposito`),
  ADD KEY `tb_empresa0cliente_que_deposito` (`tb_empresa0cliente_que_deposito`),
  ADD KEY `tb_personal0persona_que_deposito` (`tb_sys_personal0persona_que_deposito`) USING BTREE,
  ADD KEY `tb_cuenta` (`tb_cuenta0cuenta_destino`) USING BTREE;

--
-- Indices de la tabla `tb_empresa`
--
ALTER TABLE `tb_empresa`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `tb_fabricante`
--
ALTER TABLE `tb_fabricante`
  ADD PRIMARY KEY (`id_fabricante`);

--
-- Indices de la tabla `tb_firma`
--
ALTER TABLE `tb_firma`
  ADD PRIMARY KEY (`id_firma`);

--
-- Indices de la tabla `tb_gastos_varios`
--
ALTER TABLE `tb_gastos_varios`
  ADD PRIMARY KEY (`id_gastos_varios`),
  ADD KEY `tb_personal` (`tb_personal`),
  ADD KEY `FK_tb_gastos_varios_1` (`tb_tipo_de_factura`),
  ADD KEY `FK_tb_gastos_varios_2` (`tb_plan_de_cuenta`),
  ADD KEY `FK_tb_gastos_varios_3` (`tb_sucursal`);

--
-- Indices de la tabla `tb_linea_de_liquidacion_de_trabajo`
--
ALTER TABLE `tb_linea_de_liquidacion_de_trabajo`
  ADD PRIMARY KEY (`id_linea_de_liquidacion_de_trabajo`);

--
-- Indices de la tabla `tb_maquina`
--
ALTER TABLE `tb_maquina`
  ADD PRIMARY KEY (`id_maquina`);

--
-- Indices de la tabla `tb_mes`
--
ALTER TABLE `tb_mes`
  ADD PRIMARY KEY (`id_mes`);

--
-- Indices de la tabla `tb_modulo_de_alarma`
--
ALTER TABLE `tb_modulo_de_alarma`
  ADD PRIMARY KEY (`id_modulo_de_alarma`);

--
-- Indices de la tabla `tb_nivel_de_alarma`
--
ALTER TABLE `tb_nivel_de_alarma`
  ADD PRIMARY KEY (`id_nivel_de_alarma`);

--
-- Indices de la tabla `tb_pago_de_sueldo`
--
ALTER TABLE `tb_pago_de_sueldo`
  ADD PRIMARY KEY (`id_pago_de_sueldo`),
  ADD KEY `mes_de_liquidacion` (`mes_de_liquidacion`),
  ADD KEY `anio_de_liquidacion` (`anio_de_liquidacion`),
  ADD KEY `fecha_de_pago` (`fecha_de_pago`),
  ADD KEY `tb_personal0persona_que_cobro` (`tb_sys_personal0persona_que_cobro`) USING BTREE;

--
-- Indices de la tabla `tb_paso`
--
ALTER TABLE `tb_paso`
  ADD PRIMARY KEY (`id_paso`);

--
-- Indices de la tabla `tb_periodo_de_liquidacion`
--
ALTER TABLE `tb_periodo_de_liquidacion`
  ADD PRIMARY KEY (`id_periodo_de_liquidacion`);

--
-- Indices de la tabla `tb_persona`
--
ALTER TABLE `tb_persona`
  ADD PRIMARY KEY (`id_personal`,`nombre`,`apellido`);

--
-- Indices de la tabla `tb_plan_de_cuenta`
--
ALTER TABLE `tb_plan_de_cuenta`
  ADD PRIMARY KEY (`id_plan_de_cuenta`);

--
-- Indices de la tabla `tb_proceso`
--
ALTER TABLE `tb_proceso`
  ADD PRIMARY KEY (`id_proceso`);

--
-- Indices de la tabla `tb_razon_social`
--
ALTER TABLE `tb_razon_social`
  ADD PRIMARY KEY (`id_razon_social`);

--
-- Indices de la tabla `tb_registro_de_km_hs`
--
ALTER TABLE `tb_registro_de_km_hs`
  ADD PRIMARY KEY (`id_registro_de_km_hs`),
  ADD KEY `tb_maquina` (`tb_maquina`),
  ADD KEY `fecha` (`fecha`);

--
-- Indices de la tabla `tb_regla_de_mantenimiento`
--
ALTER TABLE `tb_regla_de_mantenimiento`
  ADD PRIMARY KEY (`id_regla_de_mantenimiento`),
  ADD KEY `tb_maquina` (`tb_maquina`),
  ADD KEY `tb_tipo_accion_de_mantenimiento` (`tb_tipo_accion_de_mantenimiento`);

--
-- Indices de la tabla `tb_rel_cobro_factura`
--
ALTER TABLE `tb_rel_cobro_factura`
  ADD PRIMARY KEY (`id_rel_cobro_factura`);

--
-- Indices de la tabla `tb_rel_empresa_x_repuesto`
--
ALTER TABLE `tb_rel_empresa_x_repuesto`
  ADD PRIMARY KEY (`id_rel_proveedor_repuesto_o_insumo`),
  ADD KEY `tb_empresa0proveedor` (`tb_empresa0proveedor`),
  ADD KEY `tb_repuesto_o_insumo` (`tb_repuesto_o_insumo`);

--
-- Indices de la tabla `tb_repuesto_insumo_x_mantenimiento`
--
ALTER TABLE `tb_repuesto_insumo_x_mantenimiento`
  ADD PRIMARY KEY (`id_repuesto_insumo_x_mantenimiento`),
  ADD KEY `tb_repuesto_o_insumo` (`tb_repuesto_o_insumo`),
  ADD KEY `tb_accion_de_mantenimiento` (`tb_accion_de_mantenimiento`);

--
-- Indices de la tabla `tb_repuesto_insumo_x_maquina`
--
ALTER TABLE `tb_repuesto_insumo_x_maquina`
  ADD PRIMARY KEY (`id_repuesto_insumo_x_maquina`),
  ADD KEY `tb_maquina` (`tb_maquina`),
  ADD KEY `tb_repuesto_o_insumo` (`tb_repuesto_o_insumo`);

--
-- Indices de la tabla `tb_repuesto_insumo_x_trabajo_linea`
--
ALTER TABLE `tb_repuesto_insumo_x_trabajo_linea`
  ADD PRIMARY KEY (`id_repuesto_insumo_x_mantenimiento`),
  ADD KEY `tb_repuesto_o_insumo` (`tb_repuesto_o_insumo`),
  ADD KEY `tb_accion_de_mantenimiento` (`tb_trabajo_linea`);

--
-- Indices de la tabla `tb_repuesto_o_insumo`
--
ALTER TABLE `tb_repuesto_o_insumo`
  ADD PRIMARY KEY (`id_repuesto_o_insumo`),
  ADD KEY `nombre_de_repuesto_o_descripcion` (`nombre_de_repuesto_o_descripcion`),
  ADD KEY `tb_fabricante` (`tb_fabricante`);

--
-- Indices de la tabla `tb_servicio_de_personal`
--
ALTER TABLE `tb_servicio_de_personal`
  ADD PRIMARY KEY (`id_servicio_de_personal`);

--
-- Indices de la tabla `tb_tipo_accion_de_mantenimiento`
--
ALTER TABLE `tb_tipo_accion_de_mantenimiento`
  ADD PRIMARY KEY (`id_tipo_accion_de_mantenimiento`);

--
-- Indices de la tabla `tb_tipo_de_alarma`
--
ALTER TABLE `tb_tipo_de_alarma`
  ADD PRIMARY KEY (`id_tipo_de_alarma`);

--
-- Indices de la tabla `tb_tipo_de_cobro`
--
ALTER TABLE `tb_tipo_de_cobro`
  ADD PRIMARY KEY (`id_tipo_de_cobro`);

--
-- Indices de la tabla `tb_tipo_de_factura`
--
ALTER TABLE `tb_tipo_de_factura`
  ADD PRIMARY KEY (`id_tipo_de_factura`);

--
-- Indices de la tabla `tb_tipo_de_maquina`
--
ALTER TABLE `tb_tipo_de_maquina`
  ADD PRIMARY KEY (`id_tipo_de_maquina`);

--
-- Indices de la tabla `tb_tipo_de_trabajo`
--
ALTER TABLE `tb_tipo_de_trabajo`
  ADD PRIMARY KEY (`id_tipo_de_trabajo`);

--
-- Indices de la tabla `tb_tipo_repuesto_insumo`
--
ALTER TABLE `tb_tipo_repuesto_insumo`
  ADD PRIMARY KEY (`id_tipo_repuesto_insumo`);

--
-- Indices de la tabla `tb_trabajo_encabezado`
--
ALTER TABLE `tb_trabajo_encabezado`
  ADD PRIMARY KEY (`id_trabajo_encabezado`),
  ADD KEY `tb_empresa0cliente` (`tb_empresa0cliente`),
  ADD KEY `fecha_inicio` (`fecha_inicio`);

--
-- Indices de la tabla `tb_trabajo_encabezado_factura`
--
ALTER TABLE `tb_trabajo_encabezado_factura`
  ADD PRIMARY KEY (`id_trabajo_encabezado_factura`) USING BTREE;

--
-- Indices de la tabla `tb_trabajo_encabezado_factura_remito`
--
ALTER TABLE `tb_trabajo_encabezado_factura_remito`
  ADD PRIMARY KEY (`id_trabajo_encabezado_factura_remito`);

--
-- Indices de la tabla `tb_trabajo_encabezado_paso`
--
ALTER TABLE `tb_trabajo_encabezado_paso`
  ADD PRIMARY KEY (`id_trabajo_encabezado_paso`);

--
-- Indices de la tabla `tb_trabajo_encabezado_seguimiento`
--
ALTER TABLE `tb_trabajo_encabezado_seguimiento`
  ADD PRIMARY KEY (`id_trabajo_encabezado_seguimiento`);

--
-- Indices de la tabla `tb_trabajo_linea`
--
ALTER TABLE `tb_trabajo_linea`
  ADD PRIMARY KEY (`id_trabajo_linea`),
  ADD KEY `tb_trabajo_encabezado` (`tb_trabajo_encabezado`),
  ADD KEY `tb_maquina` (`tb_maquina`),
  ADD KEY `lugar_de_trabajo` (`lugar_de_trabajo`),
  ADD KEY `fecha_inicio` (`fecha_inicio`);

--
-- Indices de la tabla `tb_unidad_de_control`
--
ALTER TABLE `tb_unidad_de_control`
  ADD PRIMARY KEY (`id_unidad_de_control`);

--
-- Indices de la tabla `tb_unidad_de_trabajo`
--
ALTER TABLE `tb_unidad_de_trabajo`
  ADD PRIMARY KEY (`id_unidad_de_trabajo`);

--
-- Indices de la tabla `tb_uso_de_repuesto_insumo`
--
ALTER TABLE `tb_uso_de_repuesto_insumo`
  ADD PRIMARY KEY (`id_uso_de_repuesto_insumo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_accion_de_mantenimiento`
--
ALTER TABLE `tb_accion_de_mantenimiento`
  MODIFY `id_accion_de_mantenimiento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tb_alarma`
--
ALTER TABLE `tb_alarma`
  MODIFY `id_alarma` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `tb_banco`
--
ALTER TABLE `tb_banco`
  MODIFY `id_banco` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `tb_causa_de_baja_cheque`
--
ALTER TABLE `tb_causa_de_baja_cheque`
  MODIFY `id_causa_de_baja_cheque` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tb_cheque`
--
ALTER TABLE `tb_cheque`
  MODIFY `id_cheque` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `tb_cobro`
--
ALTER TABLE `tb_cobro`
  MODIFY `id_cobro` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `tb_compra`
--
ALTER TABLE `tb_compra`
  MODIFY `id_compra` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT de la tabla `tb_cuenta`
--
ALTER TABLE `tb_cuenta`
  MODIFY `id_cuenta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tb_deposito`
--
ALTER TABLE `tb_deposito`
  MODIFY `id_deposito` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `tb_empresa`
--
ALTER TABLE `tb_empresa`
  MODIFY `id_empresa` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT de la tabla `tb_fabricante`
--
ALTER TABLE `tb_fabricante`
  MODIFY `id_fabricante` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `tb_firma`
--
ALTER TABLE `tb_firma`
  MODIFY `id_firma` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tb_gastos_varios`
--
ALTER TABLE `tb_gastos_varios`
  MODIFY `id_gastos_varios` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT de la tabla `tb_linea_de_liquidacion_de_trabajo`
--
ALTER TABLE `tb_linea_de_liquidacion_de_trabajo`
  MODIFY `id_linea_de_liquidacion_de_trabajo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tb_maquina`
--
ALTER TABLE `tb_maquina`
  MODIFY `id_maquina` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `tb_mes`
--
ALTER TABLE `tb_mes`
  MODIFY `id_mes` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `tb_modulo_de_alarma`
--
ALTER TABLE `tb_modulo_de_alarma`
  MODIFY `id_modulo_de_alarma` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tb_nivel_de_alarma`
--
ALTER TABLE `tb_nivel_de_alarma`
  MODIFY `id_nivel_de_alarma` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tb_pago_de_sueldo`
--
ALTER TABLE `tb_pago_de_sueldo`
  MODIFY `id_pago_de_sueldo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `tb_paso`
--
ALTER TABLE `tb_paso`
  MODIFY `id_paso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tb_periodo_de_liquidacion`
--
ALTER TABLE `tb_periodo_de_liquidacion`
  MODIFY `id_periodo_de_liquidacion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tb_persona`
--
ALTER TABLE `tb_persona`
  MODIFY `id_personal` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tb_plan_de_cuenta`
--
ALTER TABLE `tb_plan_de_cuenta`
  MODIFY `id_plan_de_cuenta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `tb_proceso`
--
ALTER TABLE `tb_proceso`
  MODIFY `id_proceso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tb_razon_social`
--
ALTER TABLE `tb_razon_social`
  MODIFY `id_razon_social` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tb_registro_de_km_hs`
--
ALTER TABLE `tb_registro_de_km_hs`
  MODIFY `id_registro_de_km_hs` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tb_regla_de_mantenimiento`
--
ALTER TABLE `tb_regla_de_mantenimiento`
  MODIFY `id_regla_de_mantenimiento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tb_rel_cobro_factura`
--
ALTER TABLE `tb_rel_cobro_factura`
  MODIFY `id_rel_cobro_factura` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `tb_rel_empresa_x_repuesto`
--
ALTER TABLE `tb_rel_empresa_x_repuesto`
  MODIFY `id_rel_proveedor_repuesto_o_insumo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tb_repuesto_insumo_x_mantenimiento`
--
ALTER TABLE `tb_repuesto_insumo_x_mantenimiento`
  MODIFY `id_repuesto_insumo_x_mantenimiento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tb_repuesto_insumo_x_maquina`
--
ALTER TABLE `tb_repuesto_insumo_x_maquina`
  MODIFY `id_repuesto_insumo_x_maquina` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tb_repuesto_insumo_x_trabajo_linea`
--
ALTER TABLE `tb_repuesto_insumo_x_trabajo_linea`
  MODIFY `id_repuesto_insumo_x_mantenimiento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tb_repuesto_o_insumo`
--
ALTER TABLE `tb_repuesto_o_insumo`
  MODIFY `id_repuesto_o_insumo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT de la tabla `tb_servicio_de_personal`
--
ALTER TABLE `tb_servicio_de_personal`
  MODIFY `id_servicio_de_personal` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tb_tipo_accion_de_mantenimiento`
--
ALTER TABLE `tb_tipo_accion_de_mantenimiento`
  MODIFY `id_tipo_accion_de_mantenimiento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `tb_tipo_de_alarma`
--
ALTER TABLE `tb_tipo_de_alarma`
  MODIFY `id_tipo_de_alarma` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `tb_tipo_de_cobro`
--
ALTER TABLE `tb_tipo_de_cobro`
  MODIFY `id_tipo_de_cobro` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tb_tipo_de_factura`
--
ALTER TABLE `tb_tipo_de_factura`
  MODIFY `id_tipo_de_factura` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tb_tipo_de_maquina`
--
ALTER TABLE `tb_tipo_de_maquina`
  MODIFY `id_tipo_de_maquina` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `tb_tipo_de_trabajo`
--
ALTER TABLE `tb_tipo_de_trabajo`
  MODIFY `id_tipo_de_trabajo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tb_tipo_repuesto_insumo`
--
ALTER TABLE `tb_tipo_repuesto_insumo`
  MODIFY `id_tipo_repuesto_insumo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tb_trabajo_encabezado`
--
ALTER TABLE `tb_trabajo_encabezado`
  MODIFY `id_trabajo_encabezado` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `tb_trabajo_encabezado_factura`
--
ALTER TABLE `tb_trabajo_encabezado_factura`
  MODIFY `id_trabajo_encabezado_factura` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `tb_trabajo_encabezado_factura_remito`
--
ALTER TABLE `tb_trabajo_encabezado_factura_remito`
  MODIFY `id_trabajo_encabezado_factura_remito` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `tb_trabajo_encabezado_paso`
--
ALTER TABLE `tb_trabajo_encabezado_paso`
  MODIFY `id_trabajo_encabezado_paso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tb_trabajo_encabezado_seguimiento`
--
ALTER TABLE `tb_trabajo_encabezado_seguimiento`
  MODIFY `id_trabajo_encabezado_seguimiento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tb_trabajo_linea`
--
ALTER TABLE `tb_trabajo_linea`
  MODIFY `id_trabajo_linea` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `tb_unidad_de_control`
--
ALTER TABLE `tb_unidad_de_control`
  MODIFY `id_unidad_de_control` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tb_unidad_de_trabajo`
--
ALTER TABLE `tb_unidad_de_trabajo`
  MODIFY `id_unidad_de_trabajo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tb_uso_de_repuesto_insumo`
--
ALTER TABLE `tb_uso_de_repuesto_insumo`
  MODIFY `id_uso_de_repuesto_insumo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
