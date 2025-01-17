-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2022 a las 03:03:57
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `venta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonos`
--

CREATE TABLE `abonos` (
  `id` int(11) NOT NULL,
  `abono` decimal(10,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_credito` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apartados`
--

CREATE TABLE `apartados` (
  `id` int(11) NOT NULL,
  `fecha_apartado` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_retiro` datetime NOT NULL,
  `abono` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `color` varchar(15) NOT NULL DEFAULT '#ffa426',
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `apartados`
--

INSERT INTO `apartados` (`id`, `fecha_apartado`, `fecha_retiro`, `abono`, `total`, `color`, `estado`, `id_cliente`) VALUES
(1, '2022-11-29 14:48:21', '2022-11-29 10:48:00', '100.00', '20.00', '#ffa426', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id` int(11) NOT NULL,
  `caja` varchar(50) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`id`, `caja`, `fecha`, `estado`) VALUES
(1, 'GENERAL', '2022-05-28 16:18:55', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `fecha`, `estado`) VALUES
(1, 'TUBOS', '2022-11-13 18:30:58', 1),
(2, 'VENTA DE ROPAS', '2022-11-28 15:04:28', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cierre_caja`
--

CREATE TABLE `cierre_caja` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `monto_inicial` decimal(10,2) NOT NULL,
  `fecha_apertura` date NOT NULL,
  `fecha_cierre` date DEFAULT NULL,
  `monto_final` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_ventas` int(11) NOT NULL DEFAULT 0,
  `monto_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cierre_caja`
--

INSERT INTO `cierre_caja` (`id`, `id_usuario`, `monto_inicial`, `fecha_apertura`, `fecha_cierre`, `monto_final`, `total_ventas`, `monto_total`, `estado`) VALUES
(1, 1, '200.00', '2022-11-13', NULL, '0.00', 0, '0.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `dni` varchar(10) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `dni`, `nombre`, `telefono`, `direccion`, `fecha`, `estado`) VALUES
(1, '71394160', 'YAMPIER OSCARE', '903559483', 'LIMA-PERU', '2022-11-28 14:50:42', 0),
(2, '9999999999', 'OSCAR ASCON', '666666666666666', 'lima-peru', '2022-11-28 14:50:30', 1),
(3, '6666666666', 'PRUEBA DEL SISTEMA', '26263232323', 'colombia', '2022-11-28 14:51:22', 1),
(4, '0000000000', 'YAMPIER', '66666666666666', 'COSTA RICA', '2022-11-28 14:57:57', 1),
(5, '6666666666', 'OSCAR ASCON', '22222222222222', 'ayacucho', '2022-11-29 14:40:23', 1),
(6, '9999999999', 'YHAMPIER EVANGELISTA', '66666666666', 'COLOMBIA', '2022-11-29 14:42:59', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `serie` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `metodo` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `id_proveedor`, `id_usuario`, `total`, `fecha`, `hora`, `serie`, `estado`, `metodo`) VALUES
(1, 1, 1, '10.00', '2022-11-13', '19:32:14', 1, 1, 1),
(2, 1, 1, '10.00', '2022-11-13', '19:37:25', 1, 1, 1),
(3, 1, 1, '10.00', '2022-11-26', '16:49:11', 1, 1, 1),
(4, 1, 1, '10.00', '2022-11-26', '16:49:28', 1, 1, 1),
(5, 1, 1, '100.00', '2022-11-28', '16:05:48', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `ruc` varchar(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `mensaje` text NOT NULL,
  `logo` varchar(10) NOT NULL,
  `moneda` int(11) NOT NULL,
  `impuesto` int(11) NOT NULL,
  `cant_factura` int(11) NOT NULL DEFAULT 0,
  `site` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `ruc`, `nombre`, `telefono`, `correo`, `direccion`, `mensaje`, `logo`, `moneda`, `impuesto`, `cant_factura`, `site`) VALUES
(1, '6456665478', 'sistema de venta', '900897537', 'admin@gmail.com', 'LIMA - PERÚ - Lorem ipsum dolor sit amet.', '<p>GRACIAS POR LA PREFERENCIAs</p>', 'logo.png', 1, 18, 1000, 'tuweb.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizaciones`
--

CREATE TABLE `cotizaciones` (
  `id` int(11) NOT NULL,
  `productos` longtext NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `validez` varchar(50) NOT NULL DEFAULT '',
  `comentario` longtext DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cotizaciones`
--

INSERT INTO `cotizaciones` (`id`, `productos`, `total`, `fecha`, `hora`, `validez`, `comentario`, `id_cliente`, `id_usuario`) VALUES
(1, '[{\"id\":1,\"precio\":\"20.00\",\"cantidad\":1,\"nombre\":\"AZUCAR\",\"medida\":\"UND\",\"descuento\":\"0.00\",\"impuesto\":0}]', '20.00', '2022-11-26', '16:49:53', '5 DIAS', '', 1, 1),
(2, '[{\"id\":1,\"precio\":\"20.00\",\"cantidad\":1,\"nombre\":\"AZUCAR\",\"medida\":\"UND\",\"descuento\":\"0.00\",\"impuesto\":0}]', '20.00', '2022-11-26', '17:27:23', '5 DIAS', '', 1, 1),
(3, '[{\"id\":1,\"precio\":\"20.00\",\"cantidad\":1,\"nombre\":\"AZUCAR\",\"medida\":\"UND\",\"descuento\":\"0.00\",\"impuesto\":0}]', '20.00', '2022-11-26', '18:48:39', '5 DIAS', '', 1, 1),
(4, '[{\"id\":1,\"precio\":\"20.00\",\"cantidad\":2,\"nombre\":\"AZUCAR\",\"medida\":\"UND\",\"descuento\":\"0.00\",\"impuesto\":0}]', '40.00', '2022-11-28', '15:53:32', '5 DIAS', '', 1, 1),
(5, '[{\"id\":6,\"precio\":\"20.00\",\"cantidad\":1,\"nombre\":\"PRUEBA\",\"medida\":\"UND\",\"descuento\":\"0.00\",\"impuesto\":0}]', '20.00', '2022-11-29', '15:44:46', '5 DIAS', '', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `creditos`
--

CREATE TABLE `creditos` (
  `id` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_apartados`
--

CREATE TABLE `detalle_apartados` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_apartado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_apartados`
--

INSERT INTO `detalle_apartados` (`id`, `cantidad`, `precio`, `id_producto`, `id_apartado`) VALUES
(1, 1, '20.00', 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `id` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_compras`
--

INSERT INTO `detalle_compras` (`id`, `id_compra`, `id_producto`, `cantidad`, `precio`) VALUES
(1, 1, 1, '1.00', '10.00'),
(2, 2, 1, '1.00', '10.00'),
(3, 3, 1, '1.00', '10.00'),
(4, 4, 1, '1.00', '10.00'),
(5, 5, 6, '10.00', '10.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_permisos`
--

CREATE TABLE `detalle_permisos` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

CREATE TABLE `detalle_temp` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_temp`
--

INSERT INTO `detalle_temp` (`id`, `id_producto`, `id_usuario`, `precio`, `cantidad`) VALUES
(6, 6, 1, '20.00', '2.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id`, `id_venta`, `id_producto`, `cantidad`, `precio`, `fecha`) VALUES
(1, 1, 1, '1.00', '20.00', '2022-11-13'),
(2, 2, 1, '1.00', '20.00', '2022-11-26'),
(3, 3, 1, '1.00', '20.00', '2022-11-26'),
(4, 4, 1, '1.00', '20.00', '2022-11-28'),
(5, 5, 6, '2.00', '20.00', '2022-11-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `entradas` decimal(10,2) NOT NULL DEFAULT 0.00,
  `fecha` date NOT NULL,
  `salidas` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `id_producto`, `id_usuario`, `entradas`, `fecha`, `salidas`) VALUES
(1, 1, 1, '1.00', '2022-11-13', '0.00'),
(2, 1, 1, '0.00', '2022-11-13', '1.00'),
(3, 1, 1, '1.00', '2022-11-13', '0.00'),
(4, 1, 1, '0.00', '2022-11-26', '1.00'),
(5, 1, 1, '1.00', '2022-11-26', '0.00'),
(6, 1, 1, '1.00', '2022-11-26', '0.00'),
(7, 1, 1, '0.00', '2022-11-26', '1.00'),
(8, 1, 1, '0.00', '2022-11-28', '1.00'),
(9, 6, 1, '10.00', '2022-11-28', '0.00'),
(10, 6, 1, '0.00', '2022-11-29', '2.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `landing`
--

CREATE TABLE `landing` (
  `id` int(11) NOT NULL,
  `hora_registro` time NOT NULL,
  `fecha_registro` date NOT NULL,
  `pagina` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `correo` varchar(40) NOT NULL,
  `negocio` varchar(20) NOT NULL,
  `control` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `landing`
--

INSERT INTO `landing` (`id`, `hora_registro`, `fecha_registro`, `pagina`, `nombre`, `telefono`, `correo`, `negocio`, `control`) VALUES
(1, '15:56:56', '2022-11-28', 'PRUEBA', 'YAMPIER', '66666666666666', 'yampier18es@gmail.com', 'PRUEBA', 1),
(2, '15:41:30', '2022-11-29', 'HOLAAAA', 'YHAMPIER EVANGELISTA', '66666666666', 'yampier19es@gmail.com', 'PRUEBA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medidas`
--

CREATE TABLE `medidas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `nombre_corto` varchar(5) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `medidas`
--

INSERT INTO `medidas` (`id`, `nombre`, `nombre_corto`, `fecha`, `estado`) VALUES
(1, 'PRUEBA AMOIR', 'PRUEB', '2022-11-13 18:30:41', 1),
(2, 'PRUEBA', 'HOLA', '2022-11-28 15:04:49', 1),
(3, 'LATA ML', 'LATA ', '2022-11-30 18:15:23', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

CREATE TABLE `moneda` (
  `id` int(11) NOT NULL,
  `simbolo` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `moneda`
--

INSERT INTO `moneda` (`id`, `simbolo`, `nombre`, `fecha`, `estado`) VALUES
(1, 'S/', 'NUEVO SOLES', '2022-05-28 16:18:27', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `permiso` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `permiso`) VALUES
(1, 'crear_usuario'),
(2, 'modificar_usuario'),
(3, 'eliminar_usuario'),
(4, 'restaurar_usuario'),
(5, 'configuracion'),
(6, 'crear_moneda'),
(7, 'modificar_moneda'),
(8, 'eliminar_moneda'),
(9, 'crear_caja'),
(10, 'modificar_caja'),
(11, 'eliminar_caja'),
(12, 'restaurar_caja'),
(13, 'crear_cliente'),
(14, 'modificar_cliente'),
(15, 'eliminar_cliente'),
(16, 'restaurar_cliente'),
(17, 'crear_proveedor'),
(18, 'modificar_proveedor'),
(19, 'eliminar_proveedor'),
(20, 'restaurar_proveedor'),
(21, 'inventario'),
(22, 'crear_medida'),
(23, 'modificar_medida'),
(24, 'eliminar_medida'),
(25, 'restaurar_medida'),
(26, 'crear_categoria'),
(27, 'modificar_categoria'),
(28, 'eliminar_categoria'),
(29, 'restaurar_categoria'),
(30, 'crear_producto'),
(31, 'modificar_producto'),
(32, 'eliminar_producto'),
(33, 'restaurar_producto'),
(34, 'nueva_compra'),
(35, 'anular_compra'),
(36, 'reporte_compras'),
(37, 'nueva_venta'),
(38, 'anular_venta'),
(39, 'reporte_ventas'),
(40, 'reporte_pdf_inventario'),
(41, 'reporte_pdf_compras'),
(42, 'reporte_pdf_ventas'),
(43, 'abrir_caja'),
(44, 'cerrar_caja'),
(46, 'landing'),
(47, 'cotizaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precio_compra` decimal(10,2) NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL DEFAULT 0.00,
  `id_medida` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `descripcion`, `precio_compra`, `precio_venta`, `cantidad`, `id_medida`, `id_categoria`, `foto`, `estado`, `fecha`) VALUES
(1, '1111111111', 'AZUCAR', '10.00', '20.00', '0.00', 1, 1, 'default.png', 0, '2022-11-28 15:03:31'),
(2, '8888888888888', 'YUCA AMOR', '10.00', '15.00', '0.00', 1, 1, 'default.png', 0, '2022-11-28 15:03:37'),
(3, '444444444444444', 'TUBO 5 CM', '10.00', '30.00', '0.00', 1, 1, 'default.png', 0, '2022-11-28 15:03:42'),
(4, '33333333333333', 'ARROZ', '15.00', '20.00', '0.00', 1, 1, 'default.png', 0, '2022-11-29 14:51:24'),
(5, '465612626621', 'PRUEBA', '15.00', '20.00', '0.00', 1, 1, 'default.png', 1, '2022-11-28 15:03:02'),
(6, '11111111111111', 'PRUEBA', '10.00', '20.00', '7.00', 1, 1, 'default.png', 1, '2022-11-29 14:48:21'),
(7, '5555555555555', 'OSCAR', '10.00', '20.00', '0.00', 2, 2, 'default.png', 1, '2022-11-28 15:05:22'),
(8, '22222222222222', 'TUBO PARA AGUA', '10.00', '20.00', '0.00', 2, 1, '20221129155107.jpg', 1, '2022-11-29 14:51:07'),
(9, '88888888888888888888', 'LECHE PREUBA', '10.00', '20.00', '0.00', 3, 2, 'default.png', 1, '2022-11-30 18:16:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `ruc` varchar(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `ruc`, `nombre`, `telefono`, `direccion`, `estado`) VALUES
(1, '2222222222', 'NISAN SAC EMPRESA', '903559483', 'LIMA-PERU', 1),
(2, '5555555555', 'TOYOTA SAC', '944444444', 'lima peru', 1),
(3, '77777777', 'EMPRESA KIA', '999999999', 'Colombia', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temp_apartados`
--

CREATE TABLE `temp_apartados` (
  `id` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temp_cotizaciones`
--

CREATE TABLE `temp_cotizaciones` (
  `id` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cantidad` int(11) NOT NULL,
  `medida` varchar(50) NOT NULL DEFAULT 'UND',
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `impuesto` int(11) NOT NULL DEFAULT 0,
  `id_producto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `temp_cotizaciones`
--

INSERT INTO `temp_cotizaciones` (`id`, `precio`, `cantidad`, `medida`, `descuento`, `impuesto`, `id_producto`, `id_usuario`) VALUES
(6, '20.00', 1, 'UND', '0.00', 0, 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `terminos`
--

CREATE TABLE `terminos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descripcion` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `terminos`
--

INSERT INTO `terminos` (`id`, `titulo`, `descripcion`) VALUES
(1, 'NUESTROS COSTOS', 'EXPRESADOS EN SOLES, PRECIOS UNITARIOS NO INCLUYEN IGV'),
(2, 'FORMA DE PAGO', 'AL CONTADO Y/O'),
(3, 'TIEMPO DE ENTREGA', ': DIAS HÁBILES DESPUES DE LA OC Y DEPOSITO EN CUENTA'),
(4, ' LUGAR DE ENTREGA', 'A'),
(5, ' DURACIÓN DEL HDPE', 'HASTA 20 AÑOS COMO MATERIAL'),
(6, 'GARANTÍA', 'HASTA 36 MESES POR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `correo` varchar(80) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `perfil` varchar(50) NOT NULL DEFAULT 'avatar.svg',
  `clave` varchar(100) NOT NULL,
  `id_caja` int(11) NOT NULL,
  `token` varchar(50) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `correo`, `telefono`, `direccion`, `perfil`, `clave`, `id_caja`, `token`, `fecha`, `estado`) VALUES
(1, 'SUPER ADMINISTRADOR', NULL, 'admin@gmail.com', NULL, NULL, 'avatar.svg', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1, '62793cdc403f094f42eb900600bb0a90', '2022-12-01 02:02:37', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `apertura` int(11) NOT NULL DEFAULT 1,
  `serie` int(11) NOT NULL DEFAULT 1,
  `metodo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_usuario`, `id_cliente`, `total`, `fecha`, `hora`, `estado`, `apertura`, `serie`, `metodo`) VALUES
(1, 1, 1, '20.00', '2022-11-13', '19:36:44', 1, 1, 1, 1),
(2, 1, 1, '20.00', '2022-11-26', '16:46:28', 1, 1, 1, 1),
(3, 1, 1, '20.00', '2022-11-26', '16:51:38', 1, 1, 1, 1),
(4, 1, 1, '20.00', '2022-11-28', '16:01:44', 1, 1, 1, 1),
(5, 1, 4, '40.00', '2022-11-29', '15:46:48', 1, 1, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abonos`
--
ALTER TABLE `abonos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_credito` (`id_credito`);

--
-- Indices de la tabla `apartados`
--
ALTER TABLE `apartados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cierre_caja`
--
ALTER TABLE `cierre_caja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `creditos`
--
ALTER TABLE `creditos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_venta` (`id_venta`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `detalle_apartados`
--
ALTER TABLE `detalle_apartados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_permisos`
--
ALTER TABLE `detalle_permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `landing`
--
ALTER TABLE `landing`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medidas`
--
ALTER TABLE `medidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `moneda`
--
ALTER TABLE `moneda`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `temp_apartados`
--
ALTER TABLE `temp_apartados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `temp_cotizaciones`
--
ALTER TABLE `temp_cotizaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `terminos`
--
ALTER TABLE `terminos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_caja` (`id_caja`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abonos`
--
ALTER TABLE `abonos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `apartados`
--
ALTER TABLE `apartados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cierre_caja`
--
ALTER TABLE `cierre_caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `creditos`
--
ALTER TABLE `creditos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle`
--
ALTER TABLE `detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_apartados`
--
ALTER TABLE `detalle_apartados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_permisos`
--
ALTER TABLE `detalle_permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `landing`
--
ALTER TABLE `landing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `medidas`
--
ALTER TABLE `medidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `moneda`
--
ALTER TABLE `moneda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `temp_apartados`
--
ALTER TABLE `temp_apartados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `temp_cotizaciones`
--
ALTER TABLE `temp_cotizaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `terminos`
--
ALTER TABLE `terminos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abonos`
--
ALTER TABLE `abonos`
  ADD CONSTRAINT `abonos_ibfk_1` FOREIGN KEY (`id_credito`) REFERENCES `creditos` (`id`),
  ADD CONSTRAINT `abonos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `apartados`
--
ALTER TABLE `apartados`
  ADD CONSTRAINT `apartados_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `cierre_caja`
--
ALTER TABLE `cierre_caja`
  ADD CONSTRAINT `cierre_caja_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD CONSTRAINT `cotizaciones_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `cotizaciones_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
