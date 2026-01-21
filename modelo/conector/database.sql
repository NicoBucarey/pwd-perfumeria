-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-01-2026 a las 14:30:59
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
-- Base de datos: `bdcarritocompras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `idcompra` bigint(20) NOT NULL,
  `cofecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idusuario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`idcompra`, `cofecha`, `idusuario`) VALUES
(1, '2024-02-10 13:30:00', 1),
(2, '2024-02-10 13:35:00', 1),
(3, '2024-02-10 13:40:00', 1),
(4, '2024-02-10 13:45:00', 1),
(5, '2025-02-22 04:30:40', 7),
(6, '2025-02-24 02:24:58', 7),
(7, '2025-02-22 17:07:05', 8),
(8, '2025-02-22 17:11:59', 8),
(9, '2025-02-22 17:23:29', 8),
(10, '2025-02-22 17:30:08', 8),
(11, '2025-02-22 17:33:43', 8),
(12, '2025-02-22 18:21:00', 8),
(13, '0000-00-00 00:00:00', 8),
(14, '2025-02-24 01:51:48', 3),
(15, '2025-02-24 01:59:01', 3),
(16, '0000-00-00 00:00:00', 3),
(17, '2025-02-24 02:39:50', 7),
(18, '2025-02-24 02:40:59', 7),
(19, '2025-02-24 02:46:46', 7),
(20, '2025-02-24 03:48:14', 7),
(21, '2025-02-24 04:25:42', 7),
(22, '2025-02-25 01:49:38', 7),
(23, '0000-00-00 00:00:00', 10),
(24, '0000-00-00 00:00:00', 11),
(25, '2025-02-25 01:56:41', 7),
(26, '2025-02-25 04:19:04', 7),
(27, '2025-02-25 17:42:14', 7),
(28, '2025-02-27 01:42:42', 7),
(29, '2025-02-27 01:56:27', 7),
(30, '2025-03-03 05:06:44', 7),
(31, '2025-03-06 04:32:39', 7),
(32, '2025-03-06 15:43:13', 7),
(33, '2025-03-06 23:26:04', 7),
(34, '0000-00-00 00:00:00', 12),
(35, '2025-03-06 21:27:26', 13),
(36, '0000-00-00 00:00:00', 13),
(37, '2025-03-06 23:08:20', 14),
(38, '2025-03-06 23:09:41', 14),
(39, '2025-03-06 23:15:14', 14),
(40, '0000-00-00 00:00:00', 14),
(41, '0000-00-00 00:00:00', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compraestado`
--

CREATE TABLE `compraestado` (
  `idcompraestado` bigint(20) UNSIGNED NOT NULL,
  `idcompra` bigint(11) NOT NULL,
  `idcompraestadotipo` int(11) NOT NULL,
  `cefechaini` timestamp NOT NULL DEFAULT current_timestamp(),
  `cefechafin` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `compraestado`
--

INSERT INTO `compraestado` (`idcompraestado`, `idcompra`, `idcompraestadotipo`, `cefechaini`, `cefechafin`) VALUES
(1, 1, 1, '2024-02-10 13:30:01', '2025-02-24 04:23:41'),
(2, 2, 2, '2024-02-10 13:35:01', '2025-03-06 16:11:59'),
(3, 3, 3, '2024-02-10 13:40:02', '0000-00-00 00:00:00'),
(4, 4, 4, '2024-02-10 13:45:01', '0000-00-00 00:00:00'),
(5, 5, 1, '2025-02-22 04:30:40', '2025-02-24 02:23:58'),
(6, 7, 1, '2025-02-22 17:07:05', '2025-02-22 17:10:36'),
(7, 7, 4, '2025-02-22 17:10:36', '0000-00-00 00:00:00'),
(8, 8, 1, '2025-02-22 17:11:59', '2025-02-22 17:16:50'),
(9, 8, 4, '2025-02-22 17:16:51', '0000-00-00 00:00:00'),
(10, 9, 1, '2025-02-22 17:23:29', '2025-02-22 17:27:49'),
(11, 9, 4, '2025-02-22 17:27:49', '0000-00-00 00:00:00'),
(12, 10, 1, '2025-02-22 17:30:08', '2025-03-06 16:12:14'),
(13, 11, 1, '2025-02-22 17:33:43', '2025-02-22 17:55:09'),
(14, 11, 4, '2025-02-22 17:55:09', '2025-02-22 18:05:48'),
(15, 11, 4, '2025-02-22 18:05:48', '2025-02-22 18:06:10'),
(16, 11, 4, '2025-02-22 18:06:10', '0000-00-00 00:00:00'),
(17, 12, 1, '2025-02-22 18:21:00', '2025-03-06 16:10:45'),
(18, 14, 1, '2025-02-24 01:51:48', '2025-02-24 01:52:58'),
(19, 14, 4, '2025-02-24 01:52:58', '0000-00-00 00:00:00'),
(20, 15, 1, '2025-02-24 01:59:01', '2025-02-24 01:59:41'),
(21, 15, 4, '2025-02-24 01:59:41', '0000-00-00 00:00:00'),
(22, 5, 4, '2025-02-24 02:23:58', '0000-00-00 00:00:00'),
(23, 6, 1, '2025-02-24 02:24:58', '2025-02-24 02:25:17'),
(24, 6, 4, '2025-02-24 02:25:17', '0000-00-00 00:00:00'),
(25, 17, 1, '2025-02-24 02:39:50', '2025-02-24 02:40:02'),
(26, 17, 4, '2025-02-24 02:40:02', '0000-00-00 00:00:00'),
(27, 18, 1, '2025-02-24 02:40:59', '2025-02-24 02:41:16'),
(28, 18, 4, '2025-02-24 02:41:16', '0000-00-00 00:00:00'),
(29, 19, 1, '2025-02-24 02:46:46', '2025-02-24 02:46:56'),
(30, 19, 4, '2025-02-24 02:46:56', '0000-00-00 00:00:00'),
(31, 20, 1, '2025-02-24 03:48:14', '2025-02-24 03:48:23'),
(32, 20, 4, '2025-02-24 03:48:23', '2025-02-24 03:48:52'),
(33, 20, 4, '2025-02-24 03:48:53', '2025-02-24 03:58:42'),
(34, 20, 4, '2025-02-24 03:58:42', '2025-02-24 04:01:35'),
(35, 20, 4, '2025-02-24 04:01:35', '2025-02-24 04:01:44'),
(36, 20, 4, '2025-02-24 04:01:44', '2025-02-24 04:03:09'),
(37, 20, 4, '2025-02-24 04:03:09', '2025-02-24 04:22:22'),
(38, 20, 4, '2025-02-24 04:22:22', '0000-00-00 00:00:00'),
(39, 1, 2, '2025-02-24 04:23:41', '2025-02-25 02:17:29'),
(40, 21, 1, '2025-02-24 04:25:42', '2025-02-24 04:26:11'),
(41, 21, 2, '2025-02-24 04:26:11', '2025-02-24 04:27:31'),
(42, 21, 3, '2025-02-24 04:27:31', '2025-02-24 04:36:37'),
(43, 21, 4, '2025-02-24 04:36:37', '0000-00-00 00:00:00'),
(44, 22, 1, '2025-02-25 01:49:38', '2025-02-25 01:51:21'),
(45, 22, 4, '2025-02-25 01:51:21', '0000-00-00 00:00:00'),
(46, 25, 1, '2025-02-25 01:56:41', '2025-02-25 02:01:13'),
(47, 25, 2, '2025-02-25 02:01:13', '2025-02-25 02:02:47'),
(48, 25, 4, '2025-02-25 02:02:47', '0000-00-00 00:00:00'),
(49, 1, 4, '2025-02-25 02:17:29', '0000-00-00 00:00:00'),
(50, 26, 1, '2025-02-25 04:19:04', '2025-02-25 04:20:40'),
(51, 26, 2, '2025-02-25 04:20:40', '2025-02-25 04:21:27'),
(52, 26, 3, '2025-02-25 04:21:27', '0000-00-00 00:00:00'),
(53, 27, 1, '2025-02-25 17:42:14', '0000-00-00 00:00:00'),
(54, 28, 1, '2025-02-27 01:42:42', '2025-02-27 01:47:00'),
(55, 28, 2, '2025-02-27 01:47:00', '2025-02-27 01:47:55'),
(56, 28, 3, '2025-02-27 01:47:55', '2025-02-27 01:48:28'),
(57, 28, 4, '2025-02-27 01:48:29', '0000-00-00 00:00:00'),
(58, 29, 1, '2025-02-27 01:56:27', '2025-02-27 01:57:00'),
(59, 29, 2, '2025-02-27 01:57:01', '2025-02-27 01:57:12'),
(60, 29, 3, '2025-02-27 01:57:12', '0000-00-00 00:00:00'),
(61, 30, 1, '2025-03-03 05:06:44', '2025-03-03 05:09:12'),
(62, 30, 2, '2025-03-03 05:09:12', '2025-03-03 05:09:36'),
(63, 30, 3, '2025-03-03 05:09:36', '0000-00-00 00:00:00'),
(64, 31, 1, '2025-03-06 04:32:39', '2025-03-06 21:32:53'),
(65, 32, 1, '2025-03-06 15:43:13', '2025-03-06 15:43:40'),
(66, 32, 4, '2025-03-06 15:43:40', '0000-00-00 00:00:00'),
(67, 12, 4, '2025-03-06 16:10:45', '0000-00-00 00:00:00'),
(68, 2, 4, '2025-03-06 16:11:59', '0000-00-00 00:00:00'),
(69, 10, 2, '2025-03-06 16:12:14', '0000-00-00 00:00:00'),
(70, 35, 1, '2025-03-06 21:27:26', '2025-03-06 21:29:12'),
(71, 35, 2, '2025-03-06 21:29:12', '2025-03-06 21:31:02'),
(72, 35, 3, '2025-03-06 21:31:02', '0000-00-00 00:00:00'),
(73, 31, 4, '2025-03-06 21:32:53', '0000-00-00 00:00:00'),
(74, 37, 1, '2025-03-06 23:08:20', '0000-00-00 00:00:00'),
(75, 38, 1, '2025-03-06 23:09:41', '2025-03-06 23:11:08'),
(76, 38, 2, '2025-03-06 23:11:08', '2025-03-06 23:13:12'),
(77, 38, 3, '2025-03-06 23:13:12', '0000-00-00 00:00:00'),
(78, 39, 1, '2025-03-06 23:15:14', '2025-03-06 23:15:45'),
(79, 39, 2, '2025-03-06 23:15:45', '2025-03-06 23:16:15'),
(80, 39, 4, '2025-03-06 23:16:15', '0000-00-00 00:00:00'),
(81, 33, 1, '2025-03-06 23:26:04', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compraestadotipo`
--

CREATE TABLE `compraestadotipo` (
  `idcompraestadotipo` int(11) NOT NULL,
  `cetdescripcion` varchar(50) NOT NULL,
  `cetdetalle` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `compraestadotipo`
--

INSERT INTO `compraestadotipo` (`idcompraestadotipo`, `cetdescripcion`, `cetdetalle`) VALUES
(1, 'iniciada', 'Compra iniciada por el cliente.'),
(2, 'aceptada', 'Aceptada por el deposito.'),
(3, 'enviada', 'Enviada por el deposito.'),
(4, 'cancelada', 'Cancelada por el cliente o deposito.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compraitem`
--

CREATE TABLE `compraitem` (
  `idcompraitem` bigint(20) UNSIGNED NOT NULL,
  `idproducto` bigint(20) NOT NULL,
  `idcompra` bigint(20) NOT NULL,
  `cicantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `compraitem`
--

INSERT INTO `compraitem` (`idcompraitem`, `idproducto`, `idcompra`, `cicantidad`) VALUES
(2, 2, 2, 1),
(3, 3, 3, 1),
(4, 4, 4, 1),
(5, 1, 5, 10),
(7, 3, 5, 2),
(8, 2, 7, 1),
(9, 1, 8, 1),
(10, 3, 9, 1),
(12, 5, 11, 1),
(13, 2, 12, 1),
(14, 1, 14, 1),
(15, 2, 15, 2),
(16, 2, 6, 2),
(17, 2, 17, 1),
(18, 1, 18, 1),
(19, 2, 19, 1),
(20, 2, 20, 1),
(21, 2, 21, 1),
(22, 11, 22, 1),
(23, 2, 25, 6),
(24, 2, 26, 2),
(25, 16, 27, 2),
(26, 14, 28, 20),
(27, 8, 29, 2),
(28, 7, 30, 30),
(31, 1, 32, 1),
(32, 2, 33, 2),
(33, 2, 35, 5),
(34, 2, 37, 5),
(35, 1, 38, 9),
(36, 3, 38, 9),
(37, 2, 39, 10),
(38, 1, 33, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `idmenu` bigint(20) NOT NULL,
  `menombre` varchar(100) NOT NULL,
  `medescripcion` varchar(124) NOT NULL,
  `idpadre` bigint(20) DEFAULT NULL,
  `medeshabilitado` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`idmenu`, `menombre`, `medescripcion`, `idpadre`, `medeshabilitado`) VALUES
(0, 'Invisible', '../Nada/', NULL, '0000-00-00 00:00:00'),
(1, 'Home', '../inicio/', NULL, '0000-00-00 00:00:00'),
(2, 'Administrador', '../admin/', NULL, '0000-00-00 00:00:00'),
(3, 'Deposito', '../deposito/', NULL, '0000-00-00 00:00:00'),
(4, 'Cliente', '../cliente/', NULL, '0000-00-00 00:00:00'),
(11, 'Inicio', 'home.php', 1, '0000-00-00 00:00:00'),
(12, 'Crear Cuenta', 'crearCuenta.php', 1, '0000-00-00 00:00:00'),
(13, 'Login', 'login.php', 1, '0000-00-00 00:00:00'),
(21, 'Gestionar Usuarios', 'gestionarUsuarios.php', 2, '0000-00-00 00:00:00'),
(22, 'Asignar Roles', 'asignarRoles.php', 0, '0000-00-00 00:00:00'),
(23, 'Quitar Roles', 'quitarRol.php', 0, '0000-00-00 00:00:00'),
(24, 'Actualizar Usuario', 'formActualizarUsuario.php', 0, '0000-00-00 00:00:00'),
(25, 'Crear Rol', 'crearRol.php', 0, '0000-00-00 00:00:00'),
(31, 'Crear Productos', 'crearProductos.php', 3, '0000-00-00 00:00:00'),
(32, 'Gestionar Productos', 'gestionarProductos.php', 3, '0000-00-00 00:00:00'),
(33, 'Gestionar Compras', 'gestionarCompras.php', 3, '0000-00-00 00:00:00'),
(34, 'Modificar Productos', 'modificarProductos.php', 0, '0000-00-00 00:00:00'),
(41, 'Productos', 'productos.php', 4, '0000-00-00 00:00:00'),
(42, 'Mis Compras', 'misCompras.php', 4, '0000-00-00 00:00:00'),
(43, 'Carrito', 'carrito.php', 4, '0000-00-00 00:00:00'),
(44, 'Agregar Productos', 'agregarProductoAlCarrito.php', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menurol`
--

CREATE TABLE `menurol` (
  `idmenu` bigint(20) NOT NULL,
  `idrol` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `menurol`
--

INSERT INTO `menurol` (`idmenu`, `idrol`) VALUES
(11, 1),
(11, 2),
(11, 3),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(41, 3),
(42, 3),
(43, 3),
(44, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` bigint(20) NOT NULL,
  `pronombre` varchar(250) NOT NULL,
  `prodetalle` varchar(512) NOT NULL,
  `procantstock` int(11) NOT NULL,
  `imagenproducto` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `pronombre`, `prodetalle`, `procantstock`, `imagenproducto`) VALUES
(1, 'Calvin Klein Euphoria Men', '129.998', 10, '../assets/img/productos/img1.jpeg'),
(2, 'Prada L Homme', '319.999', 20, '../assets/img/productos/img2.jpeg'),
(3, 'Jean Paul Gaultier Le Male', '199.999', 40, '../assets/img/productos/img3.jpeg'),
(4, 'Victor & Rolf Spicebomb', '122.999', 50, '../assets/img/productos/img4.jpeg'),
(5, 'Dior Sauvage Eau de Toilette', '249.999', 12, '../assets/img/productos/img5.jpeg'),
(6, 'Chanel Bleu de Chanel', '103.999', 85, '../assets/img/productos/img6.jpeg'),
(7, 'Creed Aventus', '629.999', 100, '../assets/img/productos/img7.jpeg'),
(8, 'Tom Ford Noir Extreme', '229.999', 78, '../assets/img/productos/img8.jpeg'),
(9, 'Giorgio Armani Acqua di Giò Profumo', '219.999', 60, '../assets/img/productos/img9.jpeg'),
(10, 'Yves Saint Laurent La Nuit de L Homme', '789.999', 45, '../assets/img/productos/img10.jpeg'),
(11, 'Paco Rabanne 1 Million', '179.999', 150, '../assets/img/productos/img11.jpeg'),
(12, 'Bvlgari Man in Black', '487.999', 110, '../assets/img/productos/img12.jpeg'),
(13, 'Givenchy Gentleman', '329.999', 95, '../assets/img/productos/img13.jpeg'),
(14, 'Hermès Terre d Hermès', '119.999', 30, '../assets/img/productos/img14.jpeg'),
(15, 'Hugo Boss Bottled', '899.999', 5, '../assets/img/productos/img15.jpeg'),
(16, 'ColoniaPaco', '100.00', 20, '../assets/img/productos/img16.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` bigint(20) NOT NULL,
  `rodescripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `rodescripcion`) VALUES
(1, 'Admin'),
(2, 'Deposito'),
(3, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` bigint(20) NOT NULL,
  `usnombre` varchar(50) NOT NULL,
  `uspass` varchar(50) NOT NULL,
  `usmail` varchar(50) NOT NULL,
  `usdeshabilitado` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `usnombre`, `uspass`, `usmail`, `usdeshabilitado`) VALUES
(1, 'Perezz', 'e10adc3949ba59abbe56e057f20f883e', 'perezz@gmail.com', '0000-00-00 00:00:00'),
(2, 'Gomez', 'e10adc3949ba59abbe56e057f20f883e', 'gomez@gmail.com', '0000-00-00 00:00:00'),
(3, 'Diaz', 'e10adc3949ba59abbe56e057f20f883e', 'juanalvarezok123@gmail.com', '0000-00-00 00:00:00'),
(4, 'Sanchez', 'e10adc3949ba59abbe56e057f20f883e', 'sanchez@gmail.com', '0000-00-00 00:00:00'),
(5, 'Admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin@mail.com', '0000-00-00 00:00:00'),
(6, 'Deposito', 'e10adc3949ba59abbe56e057f20f883e', 'deposito@mail.com', '0000-00-00 00:00:00'),
(7, 'Cliente', 'e10adc3949ba59abbe56e057f20f883e', 'juanalvarezok123@gmail.com', '0000-00-00 00:00:00'),
(8, 'Nico', 'e10adc3949ba59abbe56e057f20f883e', 'nicobucarey12@gmail.com', '0000-00-00 00:00:00'),
(9, 'Torres', 'e10adc3949ba59abbe56e057f20f883e', 'torres@gmail.com', '0000-00-00 00:00:00'),
(10, 'Hernesto', 'e10adc3949ba59abbe56e057f20f883e', 'hernesto@gmail.com', '0000-00-00 00:00:00'),
(11, 'Fernando', 'e10adc3949ba59abbe56e057f20f883e', 'fer@gmail.com', '0000-00-00 00:00:00'),
(12, 'gabriel', 'e10adc3949ba59abbe56e057f20f883e', 'gabriel@gmail.com', '0000-00-00 00:00:00'),
(13, 'diego', 'e10adc3949ba59abbe56e057f20f883e', 'juanalvarezok123@gmail.com', '0000-00-00 00:00:00'),
(14, 'damian', 'e10adc3949ba59abbe56e057f20f883e', 'juanalvarezok123@gmail.com', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariorol`
--

CREATE TABLE `usuariorol` (
  `idusuario` bigint(20) NOT NULL,
  `idrol` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuariorol`
--

INSERT INTO `usuariorol` (`idusuario`, `idrol`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3),
(5, 1),
(6, 2),
(7, 3),
(8, 3),
(11, 3),
(12, 3),
(13, 2),
(14, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`idcompra`),
  ADD UNIQUE KEY `idcompra` (`idcompra`),
  ADD KEY `fkcompra_1` (`idusuario`);

--
-- Indices de la tabla `compraestado`
--
ALTER TABLE `compraestado`
  ADD PRIMARY KEY (`idcompraestado`),
  ADD UNIQUE KEY `idcompraestado` (`idcompraestado`),
  ADD KEY `fkcompraestado_1` (`idcompra`),
  ADD KEY `fkcompraestado_2` (`idcompraestadotipo`);

--
-- Indices de la tabla `compraestadotipo`
--
ALTER TABLE `compraestadotipo`
  ADD PRIMARY KEY (`idcompraestadotipo`);

--
-- Indices de la tabla `compraitem`
--
ALTER TABLE `compraitem`
  ADD PRIMARY KEY (`idcompraitem`),
  ADD UNIQUE KEY `idcompraitem` (`idcompraitem`),
  ADD KEY `fkcompraitem_1` (`idcompra`),
  ADD KEY `fkcompraitem_2` (`idproducto`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idmenu`),
  ADD UNIQUE KEY `idmenu` (`idmenu`),
  ADD KEY `fkmenu_1` (`idpadre`);

--
-- Indices de la tabla `menurol`
--
ALTER TABLE `menurol`
  ADD PRIMARY KEY (`idmenu`,`idrol`),
  ADD KEY `fkmenurol_2` (`idrol`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD UNIQUE KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`),
  ADD UNIQUE KEY `idrol` (`idrol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `usuariorol`
--
ALTER TABLE `usuariorol`
  ADD PRIMARY KEY (`idusuario`,`idrol`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `idrol` (`idrol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `idcompra` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `compraestado`
--
ALTER TABLE `compraestado`
  MODIFY `idcompraestado` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT de la tabla `compraitem`
--
ALTER TABLE `compraitem`
  MODIFY `idcompraitem` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fkcompra_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `compraestado`
--
ALTER TABLE `compraestado`
  ADD CONSTRAINT `fkcompraestado_1` FOREIGN KEY (`idcompra`) REFERENCES `compra` (`idcompra`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fkcompraestado_2` FOREIGN KEY (`idcompraestadotipo`) REFERENCES `compraestadotipo` (`idcompraestadotipo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `compraitem`
--
ALTER TABLE `compraitem`
  ADD CONSTRAINT `fkcompraitem_1` FOREIGN KEY (`idcompra`) REFERENCES `compra` (`idcompra`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fkcompraitem_2` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fkmenu_1` FOREIGN KEY (`idpadre`) REFERENCES `menu` (`idmenu`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `menurol`
--
ALTER TABLE `menurol`
  ADD CONSTRAINT `fkmenurol_1` FOREIGN KEY (`idmenu`) REFERENCES `menu` (`idmenu`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fkmenurol_2` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuariorol`
--
ALTER TABLE `usuariorol`
  ADD CONSTRAINT `fkmovimiento_1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuariorol_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
