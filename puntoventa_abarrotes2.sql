-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2021 a las 17:52:36
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `puntoventa_abarrotes2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(250) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_session` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL,
  `id_producto` int(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cstate`
--

CREATE TABLE `cstate` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Volcado de datos para la tabla `cstate`
--

INSERT INTO `cstate` (`id`, `nombre`) VALUES
(1, 'Activo'),
(2, 'Inactivo'),
(3, 'Eliminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `id` int(11) NOT NULL,
  `idVenta` int(100) DEFAULT NULL,
  `costo_unitario` decimal(10,2) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `cantidad` int(100) DEFAULT NULL,
  `IdProducto` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `idProducto2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_entrada`
--

CREATE TABLE `detalle_entrada` (
  `id` int(11) NOT NULL,
  `id_entrada` int(11) DEFAULT NULL,
  `costo_unitario` decimal(10,0) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_perdida`
--

CREATE TABLE `detalle_perdida` (
  `id` int(11) NOT NULL,
  `idPerdida` int(11) DEFAULT NULL,
  `costo_unitario` decimal(10,2) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE `entrada` (
  `id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `idState` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id`, `nombre`) VALUES
(1, 'Usuarios'),
(2, 'Roles'),
(3, 'Productos'),
(4, 'Ordenes de compra'),
(5, 'Configuracion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo_operacion`
--

CREATE TABLE `modulo_operacion` (
  `id` int(11) NOT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  `idOperacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operaciones`
--

CREATE TABLE `operaciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idModulo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `operaciones`
--

INSERT INTO `operaciones` (`id`, `nombre`, `idModulo`) VALUES
(1, 'agregar', 1),
(2, 'editar', 1),
(3, 'eliminar', 1),
(4, 'ver', 1),
(5, 'agregar', 2),
(6, 'editar', 2),
(7, 'eliminar', 2),
(8, 'ver', 2),
(9, 'agregar', 3),
(10, 'editar', 3),
(11, 'eliminar', 3),
(12, 'ver', 3),
(13, 'generar', 4),
(14, 'editar configuracion', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perdida`
--

CREATE TABLE `perdida` (
  `id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `idState` int(11) NOT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `precio` decimal(20,2) NOT NULL,
  `prodExis` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `stockMinimo` varchar(1) CHARACTER SET utf8mb4 NOT NULL DEFAULT '5',
  `idState` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `nombre`, `descripcion`, `precio`, `prodExis`, `stockMinimo`, `idState`) VALUES
(2, '750105534960', 'Coca Cola', '235 ml', '6.00', '25', '5', 0),
(7, '750120970102', 'Leche Sello Rojo', '1L', '20.40', '30', '5', 0),
(8, '750120970111', 'Leche Sello Rojo', '1.8L', '34.00', '30', '5', 0),
(9, '750105532834', 'Coca-Cola', '400ml', '7.00', '30', '5', 0),
(10, '750105530524', 'Coca-Cola', '2.5L', '36.00', '30', '5', 0),
(11, '750103049107', 'Príncipe Marinela', '147g', '13.25', '25', '5', 0),
(12, '750047801364', 'Galleta Emperador', '91g', '16.50', '25', '5', 0),
(13, '75752804052', 'Papas Barcel Chips Fuego', '240g', '51.00', '25', '5', 0),
(14, '75752800186', 'Papas Barcel Chips Fuego', '55g', '18.00', '20', '5', 0),
(15, '4133300102', 'Duracell Copper And Black Pilas Alcalinas AA', 'Pack de 6 Piezas', '149.00', '20', '5', 0),
(16, '750108680063', 'Agua Natural Epura', '2L', '15.00', '30', '5', 0),
(17, '750108680104', 'Agua Natural Epura', '1L', '7.30', '30', '5', 0),
(18, '65024001053', 'Tabletas Next Antigripal', '10 tabletas', '29.90', '15', '5', 0),
(19, '7033071756', 'Rastrillo Desechable Bic', '1', '15.00', '10', '5', 0),
(20, '61300873876', 'Te Arizona Sandia', '680ml', '12.90', '25', '5', 0),
(21, '61300873884', 'Té Arizona Limón', '680ml', '12.90', '25', '5', 0),
(22, '770201063119', 'Cepillo de Dientes', 'Colgate', '10.00', '20', '5', 0),
(23, '750630624479', 'Desodorante Aerosol Axe', '150ml', '47.90', '15', '5', 0),
(24, '750104000022', 'Jamon de Pavo Fud', '170g', '31.50', '13', '5', 0),
(25, '750104000975', 'Salchichas Fud', '266g', '27.50', '13', '5', 0),
(26, '762221056153', 'Queso Philadelphia', '200g', '34.50', '15', '5', 0),
(27, '750104008033', 'Queso La Villita', '400g', '63.50', '15', '5', 0),
(76, '7501025400101', 'Pinol', 'AntiBacterial Lavanda de 500mL', '14.00', '11', '5', 1),
(77, '7501025400118', 'Pinol', 'Lavanda Mas Potente de 828mL', '20.00', '12', '5', 1),
(78, '7501025400156', 'Pinol', 'AntiBacterial Marino de 828mL', '20.00', '3', '5', 1),
(79, '7501025400170', 'Pinol', 'AntiBacterial Floral de 500mL', '14.00', '5', '5', 1),
(80, '7501025400187', 'Pinol', 'AntiBacterial Florar de 828mL', '20.00', '11', '5', 1),
(81, '7501025403027', 'Pinol', 'Original de 500mL', '14.50', '8', '5', 1),
(82, '7501025403485', 'Pinol', 'Original de 828mL', '19.00', '8', '5', 1),
(83, '7501025404222', 'Pinol', 'Detergente degradable', '24.00', '6', '5', 1),
(84, '7501025413002', 'Ensueño', 'Origen Vegetal de 850mL', '19.00', '17', '5', 1),
(85, '7501025414153', 'Ensueño', 'Bebe de 850mL', '18.50', '8', '5', 1),
(86, '7501025440350', 'Ensueño', 'Bebe de 450mL', '13.50', '11', '5', 1),
(87, '7501025440367', 'Ensueño', 'Max de 450mL', '14.00', '5', '5', 1),
(88, '7501026004605', 'Roma', 'Economico y rendidor 1kg', '37.00', '8', '5', 1),
(89, '7501026005374', 'Zote', 'Blanco de 400g', '19.00', '21', '5', 1),
(90, '7501026005671', 'Zote', 'Rosa de 400g', '17.50', '29', '5', 1),
(91, '7501026005688', 'Zote', 'Rosa de 200g', '10.50', '9', '5', 1),
(92, '7501026026560', 'Foca', 'detergente biologico degradable 500g', '34.00', '5', '5', 1),
(93, '7501026027536', 'Blanca nieves', '1kg', '36.00', '9', '5', 1),
(94, '7501026028007', 'Foca', 'Liquido para Ropa de 1L', '25.00', '5', '5', 1),
(95, '7501035910034', 'Fabuloso', 'Fresca Lavanda de 1L', '19.00', '7', '5', 1),
(96, '7501035910041', 'Fabuloso', 'Mar Fresco 1L', '21.00', '4', '5', 1),
(97, '7501035910096', 'Fabuloso', 'Fresco Amanecer de 1L', '19.00', '3', '5', 1),
(98, '7501035912793', 'Vel', 'Barra limpiadora Rosita de 350g', '15.00', '6', '5', 1),
(99, '7501042305441', 'Suatel', 'Destello de Sol de 450mL', '16.50', '2', '5', 1),
(100, '7501042305489', 'Suatel', 'Libre Enjuage de 850mL', '16.50', '2', '5', 1),
(101, '7501050410588', 'Iris', 'Papel Higienico de 4 Rollos', '20.00', '13', '5', 1),
(102, '7501056336394', 'Sedal', 'Crecimiento Fortificado de 350mL', '33.00', '3', '5', 1),
(103, '7501058752017', 'Brasso', 'Gold AntiGrasa Bolsa de 500mL', '18.00', '6', '5', 1),
(104, '7501058752772', 'Vanish', 'MultiUso de 450mL', '16.00', '6', '5', 1),
(105, '7501065908841', 'Ariel', 'con perlas limpiadoras', '30.00', '6', '5', 1),
(106, '7501071900204', 'Poett', 'Lavanda de 900mL', '15.00', '9', '5', 1),
(107, '7501071900280', 'Poett', 'Primavera de 900mL', '15.00', '1', '5', 1),
(108, '7501071901355', 'Poett', 'Suavidad de Algodon de 900mL', '15.00', '7', '5', 1),
(109, '7501071903120', 'Poett', 'Bosque de Bambu de 1.8L', '22.00', '1', '5', 1),
(110, '7501071903137', 'Spoett', 'Bosque de bambu de 900mL', '15.00', '11', '5', 1),
(111, '7501071905810', 'Poett', 'MultiEspacios Primavera de 4L', '41.50', '2', '5', 1),
(112, '7501136736366', 'Hogar', 'Papel de Baño de 4 Rollos', '18.00', '6', '5', 1),
(113, '7501199412931', 'Mas', 'Oscura en Bolsa de 415mL', '19.00', '6', '5', 1),
(114, '7501199413006', 'Mas', 'Color Bolsa de 415mL', '17.00', '4', '5', 1),
(115, '7501821500555', 'Wiese', 'Lavanda de 35g', '16.00', '7', '5', 1),
(116, '7501821500562', 'Wiese', 'Naranja de 35g', '16.00', '7', '5', 1),
(117, '75019433494244', 'Kotex', 'anatomica', '22.00', '3', '5', 1),
(118, '7501943418509', 'Kotex', 'Nocturna', '23.00', '10', '5', 1),
(119, '7501943421141', 'Kotex naturals', 'con manzanilla nocturna con alas', '27.00', '9', '5', 1),
(120, '7501943424562', 'Kotex', 'Anatomica con alas', '21.00', '5', '5', 1),
(121, '7501943424623', 'Kotex', 'manzanilla', '23.00', '7', '5', 1),
(122, '7501943428430', 'Kotex', 'unica anatomica sin alas', '25.00', '7', '5', 1),
(123, '7501943428454', 'Kotex unika', 'anatomica con alas', '26.00', '7', '5', 1),
(124, '7501943431317', 'Kotex', 'Regular o tanga', '21.00', '11', '5', 1),
(125, '7501943432451', 'Kotex', 'largo', '22.00', '8', '5', 1),
(126, '7501943494220', 'U kotex', 'Nocturna ultra seca', '20.00', '8', '5', 1),
(127, '7501943494268', 'Kotex', 'ultra delgada con alas ultra seca', '27.00', '8', '5', 1),
(128, '7505005406282', 'Cuadritela', 'Trapo grande', '15.00', '1', '5', 1),
(129, '7506192501019', 'Savile', 'Aguacate de 750mL', '38.00', '4', '5', 1),
(130, '7506192501040', 'Savile', 'Keratina de 750mL', '38.00', '1', '5', 1),
(131, '7506192501057', 'Savile', 'Chile de 750mL', '38.00', '4', '5', 1),
(132, '7506192502542', 'Savile', 'Keratina de 370mL', '28.00', '5', '5', 1),
(133, '7506192503426', 'Savile', 'Keratina de 180mL', '15.00', '6', '5', 1),
(134, '7506192504409', 'Savile', 'Aceite de argan de 370mL', '28.00', '1', '5', 1),
(135, '7506192504416', 'Savile', 'Brillo y Suavidad de 180mL', '15.00', '4', '5', 1),
(136, '7506192506557', 'Savile', 'Menta y Eucalipto 180mL', '16.00', '1', '5', 1),
(137, '7506195158739', 'Naturella', 'manzanilla', '23.00', '7', '5', 1),
(138, '7506195196984', 'Salvo', 'Limon de 300mL', '15.50', '8', '5', 1),
(139, '7506270000038', 'Polifibra', 'Estropajo grande', '5.00', '4', '5', 1),
(140, '7506339343595', 'Salvo', 'Limon de 900mL', '32.50', '9', '5', 1),
(141, '7506425602186', 'Petalo', 'Ultra Resistente de 4 Rollos', '25.00', '3', '5', 1),
(142, '7509546008295', 'Fabuloso', 'Pasion De Fritas de 1L', '18.50', '2', '5', 1),
(143, '7509546016313', 'Suavitel', 'Cuidado Superior de 850mL', '21.00', '4', '5', 1),
(144, '7509546017808', 'Suavitel', 'Fresca Primavera de 450mL', '14.00', '6', '5', 1),
(145, '7509546017815', 'Suavitel', 'Fresco Aroma de Sol 450mL', '14.00', '6', '5', 1),
(146, '7509546026824', 'Caprise', 'Shampoo Control Caida de 220mL', '15.00', '5', '5', 1),
(147, '7509546027029', 'Caprice', 'Shampoo Fuerza vital de 220mL', '15.00', '5', '5', 1),
(148, '7509546027036', 'Caprice', 'Shampoo Bbrillo y Aroma de 220mL', '16.00', '1', '5', 1),
(149, '7509546030074', 'Caprice', 'Shampoo Maxi Gloss de 220mL', '15.00', '5', '5', 1),
(150, '7509546044330', 'Suavitel', 'Complete Aqua de 450mL', '17.00', '6', '5', 1),
(151, '7509546045689', 'Vel', 'Liquido Rosita Delicada de 450mL', '21.00', '5', '5', 1),
(152, '7509546051956', 'Fabuloso', 'Alternativa al cloro Fresca primavera de 1L', '20.00', '8', '5', 1),
(153, '7509546052977', 'Axion', 'Limon de 900mL', '34.00', '9', '5', 1),
(154, '7509546062914', 'Fabuloso', 'Mmenta y Orquideas DE 1L', '20.00', '10', '5', 1),
(155, '7509546067506', 'Suavitel', 'Complete Acqua de 800mL', '20.00', '5', '5', 1),
(156, '7509546067513', 'Suavitel', 'Complete Fresca Primavera de 800mL', '23.50', '5', '5', 1),
(157, '7891035040276', 'Vanish super barra white', '68g', '7.00', '10', '5', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `Id` int(11) NOT NULL,
  `Empresa` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Direccion` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Telefono` varchar(11) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`Id`, `Empresa`, `Direccion`, `Telefono`) VALUES
(1, 'Coca-Cola', 'Lomas Turbas avenida de dios', '666'),
(5, 'visoso', 'calle las rosas ala buelta de lomas turvas', '3152498789'),
(6, 'Lala1', 'Los patos #1323', '3141141803'),
(8, 'lala', 'calle alco', '31457778'),
(10, 'pepsi', 'calle ocar', '33 35432'),
(11, '13', '13', '13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `usuario` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `id_cargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password`, `id_cargo`) VALUES
(1, 'William Ramses', 'William', '12345', 1),
(2, 'Ernesto Jimenez', 'Ernesto', '1234', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idVenta` int(11) NOT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `idState` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idVenta`, `total`, `fecha`, `idState`) VALUES
(24, '155.00', '2021-12-01', NULL),
(25, '0.00', '2021-12-01', NULL),
(26, '42.00', '2021-12-01', NULL),
(27, '0.00', '2021-12-02', NULL),
(28, '0.00', '2021-12-02', NULL),
(29, '0.00', '2021-12-02', NULL),
(30, '0.00', '2021-12-02', NULL),
(31, '0.00', '2021-12-02', NULL),
(32, '0.00', '2021-12-02', NULL),
(33, '0.00', '2021-12-02', NULL),
(34, '0.00', '2021-12-02', NULL),
(35, '0.00', '2021-12-02', NULL),
(36, '0.00', '2021-12-02', NULL),
(37, '0.00', '2021-12-02', NULL),
(38, '0.00', '2021-12-02', NULL),
(39, '0.00', '2021-12-02', NULL),
(40, '0.00', '2021-12-02', NULL),
(41, '0.00', '2021-12-02', NULL),
(42, '0.00', '2021-12-02', NULL),
(43, '0.00', '2021-12-02', NULL),
(44, '0.00', '2021-12-02', NULL),
(45, '0.00', '2021-12-02', NULL),
(46, '0.00', '2021-12-02', NULL),
(47, '0.00', '2021-12-02', NULL),
(48, '0.00', '2021-12-02', NULL),
(49, '0.00', '2021-12-02', NULL),
(50, '0.00', '2021-12-02', NULL),
(51, '0.00', '2021-12-02', NULL),
(52, '0.00', '2021-12-02', NULL),
(53, '0.00', '2021-12-02', NULL),
(54, '0.00', '2021-12-02', NULL),
(55, '0.00', '2021-12-02', NULL),
(56, '0.00', '2021-12-02', NULL),
(57, '6.00', '2021-12-02', NULL),
(58, '0.00', '2021-12-02', NULL),
(59, '0.00', '2021-12-02', NULL),
(60, '0.00', '2021-12-02', NULL),
(61, '0.00', '2021-12-02', NULL),
(62, '33.65', '2021-12-02', NULL),
(63, '0.00', '2021-12-02', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cstate`
--
ALTER TABLE `cstate`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detalleventa_idVenta` (`idVenta`),
  ADD KEY `fk_detalleventa_productoID` (`idProducto2`);

--
-- Indices de la tabla `detalle_entrada`
--
ALTER TABLE `detalle_entrada`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_entrada` (`id_entrada`),
  ADD KEY `fk_idProducto_entrada` (`idProducto`);

--
-- Indices de la tabla `detalle_perdida`
--
ALTER TABLE `detalle_perdida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPerdida` (`idPerdida`),
  ADD KEY `fk_idProducto` (`idProducto`);

--
-- Indices de la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_entrada_cState` (`idState`);

--
-- Indices de la tabla `perdida`
--
ALTER TABLE `perdida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idState` (`idState`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Descripcion` (`descripcion`(768)),
  ADD KEY `idState` (`idState`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cargo` (`id_cargo`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `idState` (`idState`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_perdida`
--
ALTER TABLE `detalle_perdida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perdida`
--
ALTER TABLE `perdida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_entrada`
--
ALTER TABLE `detalle_entrada`
  ADD CONSTRAINT `FK_detalle_entrada_entrada` FOREIGN KEY (`id`) REFERENCES `entrada` (`id`),
  ADD CONSTRAINT `detalle_entrada_ibfk_1` FOREIGN KEY (`id_entrada`) REFERENCES `entrada` (`id`),
  ADD CONSTRAINT `fk_idProducto_entrada` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
