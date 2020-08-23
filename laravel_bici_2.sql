-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-08-2020 a las 01:04:28
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laravel_bici_2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audits`
--

CREATE TABLE `audits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` bigint(20) UNSIGNED NOT NULL,
  `old_values` text COLLATE utf8mb4_unicode_ci,
  `new_values` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(1023) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `tiulo` varchar(191) DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `descricion` text,
  `users_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `tag` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `blog`
--

INSERT INTO `blog` (`id`, `fecha`, `tiulo`, `imagen`, `descricion`, `users_id`, `created_at`, `updated_at`, `categoria`, `tag`) VALUES
(2, '2020-07-29', 'Región para pedalear alrededor de la ciudad es una realidad', 'WRjp001QUeZ5yCrNxEZRv023R4nkWxU24I69ooCb.jpeg', '<h2><strong>Bogot&aacute; ser&aacute; la primera ciudad en Latinoam&eacute;rica&nbsp;y la segunda en el mundo, despu&eacute;s de Espa&ntilde;a,&nbsp;en implementar el concepto de un recorrido perimetral alrededor de ella para darle una experiencia tur&iacute;stica y deportiva a los biciusuarios.</strong><br />\n<br />\nHoy, 07 de julio, la Regi&oacute;n Administrativa y de Planeaci&oacute;n Especial, RAP-E, adjudic&oacute; la licitaci&oacute;n p&uacute;blica para la construcci&oacute;n e instalaci&oacute;n de los elementos de se&ntilde;al&eacute;tica, orientativos y tur&iacute;sticos que har&aacute;n parte del dise&ntilde;o de este circuito: BiciBogot&aacute; Regi&oacute;n.</h2>\n\n<h2><strong>Este recorrido tendr&aacute; 300 kil&oacute;metros y el objetivo es que los biciusuarios puedan disfrutar m&aacute;s de 42 atractivos tur&iacute;sticos</strong>&nbsp;como paisajes y vistas panor&aacute;micas, eso sin contar que el circuito&nbsp;<strong>pasar&aacute; por 16 municipios de Cundinamarca y atravesar&aacute; las localidades de Ciudad Bol&iacute;var y Usme en Bogot&aacute;.</strong><br />\n<br />\nLa puesta en marcha de este proyecto tendr&aacute; una inversi&oacute;n de $4.100 millones que ser&aacute;n financiados a trav&eacute;s del Sistema General de Regal&iacute;as. Seg&uacute;n Fernando Fl&oacute;rez, gerente de la RAP-E, &ldquo;se evaluaron y analizaron 29 propuestas, de las cuales 21 llegaron a la instancia final cumpliendo con todos los requerimientos. Despu&eacute;s de realizar la respectiva puntuaci&oacute;n, la licitaci&oacute;n fue adjudicada al Consorcio BW RAPE 2020&rdquo;, enfatiz&oacute;.</h2>', 1, NULL, '2020-07-30 04:57:14', 'bicicleta region', 'ciudad BW RAPE 2020'),
(3, '2020-07-29', '¿Cuánto tiempo debo pedalear para quemar más calorías?', 'WRjp001QUeZ5yCrNxEZRv023R4nkWxU24I69ooCb.jpeg', '<p>Debes saber que el tiempo m&iacute;nimo de ejercicio con la bicicleta (y con cualquier otra actividad aer&oacute;bica) es de 20 minutos, ese, es el tiempo b&aacute;sico para comenzar a quemar la grasa que tenemos almacenada. Sin embargo, el tiempo aconsejable es de 30 minutos como m&iacute;nimo al d&iacute;a, para notar alg&uacute;n tipo de resultado y perder peso de manera progresiva.</p>\n\n<p>Como he mencionado, hay diferentes f&oacute;rmulas y calculadoras en l&iacute;nea que pueden ayudarte a valorar cu&aacute;ntas calor&iacute;as quemas en bicicleta, sin embargo el gasto cal&oacute;rico real no depende s&oacute;lo del tiempo que est&eacute;s pedaleando sino tambi&eacute;n de la intensidad con lo que lo hagas. Si pedaleas a una intensidad baja, es decir de unos 16 km/hora, podr&aacute;s calcular las calor&iacute;as que quemas siguiendo la f&oacute;rmula que te compart&iacute; renglones m&aacute;s arriba.</p>\n\n<p>En t&eacute;rminos generales y teniendo siempre en cuenta que la intensidad es baja, el gasto de calor&iacute;as seg&uacute;n el tiempo podr&iacute;a resumirse as&iacute; -teniendo en cuenta que el c&aacute;lculo lo he hecho poniendo una fisonom&iacute;a con el siguiente peso como ejemplo-: una persona con un peso 63 kg, lo que equivaldr&iacute;a a una quema de 6.4 calor&iacute;as cada minuto (aproximadamente).</p>\n\n<ul>\n	<li>\n	<pre>\nEn 20 minutos andando en bicicleta se llegan a quemar 128 calor&iacute;as</pre>\n	</li>\n	<li>\n	<pre>\nEn 30 minutos andando en bicicleta puedes quemar 192 calor&iacute;as</pre>\n	</li>\n	<li>\n	<pre>\nEn 40 minutos andando en bicicleta quemas 256 calor&iacute;as</pre>\n	</li>\n	<li>\n	<pre>\nEn 1 hora andando en bicicleta se pueden quemar unas 384 calor&iacute;as</pre>\n	</li>\n</ul>\n\n<p>Debes tener en cuenta que para poder bajar 1 kilo de peso, las calor&iacute;as que deben quemarse son 7700 kcal, lo que podemos traducir en dos o tres d&iacute;as de alimentaci&oacute;n.</p>', 1, NULL, '2020-07-30 05:20:52', 'bicicleta deporte', 'ejercicios'),
(4, '2020-07-29', '¿Cuánto tiempo debo pedalear para quemar más calorías?', 'WRjp001QUeZ5yCrNxEZRv023R4nkWxU24I69ooCb.jpeg', '<p>Debes saber que el tiempo m&iacute;nimo de ejercicio con la bicicleta (y con cualquier otra actividad aer&oacute;bica) es de 20 minutos, ese, es el tiempo b&aacute;sico para comenzar a quemar la grasa que tenemos almacenada. Sin embargo, el tiempo aconsejable es de 30 minutos como m&iacute;nimo al d&iacute;a, para notar alg&uacute;n tipo de resultado y perder peso de manera progresiva.</p>\r\n\r\n<p>Como he mencionado, hay diferentes f&oacute;rmulas y calculadoras en l&iacute;nea que pueden ayudarte a valorar cu&aacute;ntas calor&iacute;as quemas en bicicleta, sin embargo el gasto cal&oacute;rico real no depende s&oacute;lo del tiempo que est&eacute;s pedaleando sino tambi&eacute;n de la intensidad con lo que lo hagas. Si pedaleas a una intensidad baja, es decir de unos 16 km/hora, podr&aacute;s calcular las calor&iacute;as que quemas siguiendo la f&oacute;rmula que te compart&iacute; renglones m&aacute;s arriba.</p>\r\n\r\n<p>En t&eacute;rminos generales y teniendo siempre en cuenta que la intensidad es baja, el gasto de calor&iacute;as seg&uacute;n el tiempo podr&iacute;a resumirse as&iacute; -teniendo en cuenta que el c&aacute;lculo lo he hecho poniendo una fisonom&iacute;a con el siguiente peso como ejemplo-: una persona con un peso 63 kg, lo que equivaldr&iacute;a a una quema de 6.4 calor&iacute;as cada minuto (aproximadamente).</p>\r\n\r\n<ul>\r\n	<li>\r\n	<pre>\r\nEn 20 minutos andando en bicicleta se llegan a quemar 128 calor&iacute;as</pre>\r\n	</li>\r\n	<li>\r\n	<pre>\r\nEn 30 minutos andando en bicicleta puedes quemar 192 calor&iacute;as</pre>\r\n	</li>\r\n	<li>\r\n	<pre>\r\nEn 40 minutos andando en bicicleta quemas 256 calor&iacute;as</pre>\r\n	</li>\r\n	<li>\r\n	<pre>\r\nEn 1 hora andando en bicicleta se pueden quemar unas 384 calor&iacute;as</pre>\r\n	</li>\r\n</ul>\r\n\r\n<p>Debes tener en cuenta que para poder bajar 1 kilo de peso, las calor&iacute;as que deben quemarse son 7700 kcal, lo que podemos traducir en dos o tres d&iacute;as de alimentaci&oacute;n.</p>', 1, NULL, '2020-07-30 05:20:52', 'bicicleta deporte', 'ejercicios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_compra`
--

CREATE TABLE `carrito_compra` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `precio_comprado` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `class` varchar(45) DEFAULT NULL,
  `statu` varchar(5) NOT NULL DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`, `class`, `statu`) VALUES
(1, '42 EUR', 'null', 'false'),
(2, 'ACCESORIOS', 'null', 'false'),
(3, 'BICI NIÑOS', 'nulll', 'false'),
(4, 'BICICLETA TURISMO', 'null', 'false'),
(5, 'PATINETAS - TABLAS', 'null', 'false'),
(6, 'ROPA', 'null', 'false'),
(7, 'TALLA 50', 'null', 'false'),
(8, 'TALLA L ', 'null', 'false'),
(9, 'TALLA M', 'null', 'false'),
(10, 'TALLAS XS,S,M', 'null', 'false'),
(11, '42.5 EUR', 'null', 'false'),
(12, '43 EUR', 'null', 'false'),
(13, 'PLAYERA', 'null', 'false'),
(14, 'TODO TERRENO', 'null', 'false'),
(15, 'CADENA', 'null', 'false'),
(16, 'CARAMAÑOLA', 'null', 'false'),
(17, 'CASCO', 'null', 'false'),
(18, 'LLANTA', 'null', 'false'),
(19, 'MANGO', 'null', 'false'),
(20, 'PACHA', 'null', 'false'),
(21, 'PEDAL', 'null', 'false'),
(22, 'SILLIN', 'null', 'false'),
(23, 'ZAPATILLA', 'null', 'false'),
(24, 'TIJA', 'null', 'false'),
(25, 'CLEATS', 'null', 'false'),
(26, 'CICLOCOMPUTADOR', 'null', 'false'),
(27, 'GUANTES', 'null', 'false'),
(28, 'BOLSO', 'null', 'false'),
(29, 'BOMBA', 'null', 'false'),
(30, 'CAMISA', 'null', 'false'),
(31, 'DIRECCIÓN', 'null', 'false'),
(32, 'GRUPO', 'null', 'false'),
(33, 'LUBRICANTE', 'null', 'false'),
(34, 'SOPORTE', 'null', 'false'),
(35, 'RUTA', 'null', 'false');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `class` varchar(45) DEFAULT NULL,
  `nota` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `nombre`, `class`, `nota`) VALUES
(1, 'Activo', 'badge badge-secondary', NULL),
(2, 'Inactivo', 'badge badge-secondary', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_venta`
--

CREATE TABLE `estado_venta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `class` varchar(45) DEFAULT NULL,
  `icono` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_venta`
--

INSERT INTO `estado_venta` (`id`, `nombre`, `class`, `icono`) VALUES
(1, 'En proceso', 'badge badge-secondary', NULL),
(2, 'En trasmite', 'badge badge-secondary', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `logo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `nombre`, `logo`) VALUES
(1, 'shimano w2', 'logo.png'),
(2, 'gw', 'gw.jpg'),
(3, 'ft', 'ft.jpg'),
(4, 'BETO', 'beto.jpg'),
(5, 'BONTRAGER', 'BONTRAGER.png'),
(6, 'CATEYE', 'CATEYE.png'),
(7, 'CLIFF', 'CLIFF.png'),
(8, 'CONTINENTAL', 'CONTINENTAL.png'),
(9, 'ELITE', 'ELITE.png'),
(10, 'FINISH LINE', 'FINISH LINE.png'),
(11, 'GARNEAU', 'GARNEAU.png'),
(12, 'GIANT LIV', 'GIANT LIV.png'),
(13, 'GIRO', 'GIRO.png'),
(14, 'GW', 'GW.png'),
(15, 'LAZER', 'LAZER.png'),
(16, 'LIMAR', 'LIMAR.png'),
(17, 'PRO', 'PRO.png'),
(18, 'PROLOGO', 'PROLOGO.png'),
(19, 'RITCHEY', 'RITCHEY.png'),
(20, 'SCOTT', 'SCOTT.png'),
(21, 'SERFAS', 'SERFAS.png'),
(22, 'SHIMANO', 'SHIMANO.png'),
(23, 'SPECIALIZED', 'SPECIALIZED.png'),
(24, 'SUPER LOOK', 'SUPER LOOK.png'),
(25, 'SYNCROS', 'SYNCROS.png'),
(26, 'TREK', 'TREK.png'),
(27, 'VENZO', 'VENZO.png'),
(28, 'VITTORIA', 'VITTORIA.png'),
(29, 'WD-40', 'WD-40.png'),
(30, 'Otras', 'Otras.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_18_12_000000_create_twitter_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2020_07_18_013501_create_audits_table', 2),
(6, '2020_07_22_165806_create_permission_tables', 3),
(7, '2019_12_14_000001_create_personal_access_tokens_table', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, '', 1),
(1, 'App\\User', 1),
(1, 'App\\User', 2),
(1, 'App\\User', 3),
(1, 'App\\User', 4),
(2, 'App\\User', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Producto ver', 'web', NULL, NULL),
(2, 'Producto Add', 'web', NULL, NULL),
(3, 'Producto Editar', 'web', NULL, NULL),
(4, 'Producto Delete', 'web', NULL, NULL),
(5, 'Categoria Editar', 'web', '2020-07-31 01:52:27', '2020-07-31 01:52:27'),
(6, 'Categoria Eliminar', 'web', '2020-07-31 01:52:51', '2020-07-31 01:52:51'),
(7, 'Categoria Menu', 'web', '2020-07-31 01:54:28', '2020-07-31 01:54:28'),
(8, 'Marca Menu', 'web', '2020-07-31 01:55:37', '2020-07-31 01:55:37'),
(9, 'blog Menu', 'web', '2020-07-31 01:55:54', '2020-07-31 01:55:54'),
(10, 'Producto Menu', 'web', '2020-07-31 01:56:58', '2020-07-31 01:56:58'),
(11, 'Blog Anadir', 'web', '2020-07-31 01:59:21', '2020-07-31 01:59:21'),
(12, 'Blog Editar', 'web', '2020-07-31 02:00:11', '2020-07-31 02:00:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `nombre_slud` varchar(45) NOT NULL,
  `precio` int(11) NOT NULL,
  `descuento` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `estado_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_iva` int(11) NOT NULL,
  `iva` int(11) NOT NULL,
  `is_nuevo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `users_id`, `codigo`, `nombre`, `nombre_slud`, `precio`, `descuento`, `stock`, `descripcion`, `estado_id`, `created_at`, `updated_at`, `is_iva`, `iva`, `is_nuevo`) VALUES
(178, 1, '', 'BICICLETA CLIFF ROCK 3.O   27.5\"', 'Null', 2550000, 0, 0, 'Null', 1, '2020-08-05 22:56:28', '0000-00-00 00:00:00', 0, 0, 0),
(179, 1, 'VENZO29', 'BICICLETA CLIFF ROCK SPORT', 'Null', 2200000, 0, 0, 'Null', 1, '2020-08-05 22:56:28', '0000-00-00 00:00:00', 0, 0, 0),
(180, 1, '60461', 'BICICLETA FAT GRIZZLY 26\"', 'Null', 1290000, 0, 0, 'Null', 1, '2020-08-05 22:57:39', '0000-00-00 00:00:00', 0, 0, 0),
(181, 1, '60217', 'BICICLETA GW K2', 'Null', 1150000, 0, 0, 'Null', 1, '2020-08-05 22:57:39', '0000-00-00 00:00:00', 0, 0, 0),
(182, 1, '060507 ', 'BICICLETA PLAYERA CIUDAD VIERNES', 'Null', 420000, 0, 0, 'Null', 1, '2020-08-05 22:57:39', '0000-00-00 00:00:00', 0, 0, 0),
(183, 1, '3488-i', 'BICICLETA PLAYERA NIRVE 3 VELOCIDADES ', 'Null', 1500000, 0, 0, 'Null', 1, '2020-08-05 22:57:39', '0000-00-00 00:00:00', 0, 0, 0),
(184, 1, '60501', 'BICICLETA PLAYERA SUMMER 7 VELO', 'Null', 545000, 0, 0, 'Null', 1, '2020-08-05 22:57:39', '0000-00-00 00:00:00', 0, 0, 0),
(185, 1, '60508', 'BICICLETA PLAYERA SUNDAY', 'Null', 420000, 0, 0, 'Null', 1, '2020-08-05 22:57:39', '0000-00-00 00:00:00', 0, 0, 0),
(186, 1, 'AREZZ0PRO', 'BICICLETA SUPER LOOK AREZZO PRO 29\"', 'Null', 4000000, 0, 0, 'Null', 1, '2020-08-05 22:57:39', '0000-00-00 00:00:00', 0, 0, 0),
(187, 1, 'PHOENIX2.0', 'BICICLETA SUPER LOOK PHOENIX 2.0', 'Null', 3170000, 0, 0, 'Null', 1, '2020-08-05 22:57:39', '0000-00-00 00:00:00', 0, 0, 0),
(188, 1, 'SELA290', 'BICICLETA SUPER LOOK SELLA 290 CARBONO 29\"', 'Null', 4250000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(189, 1, '567958', 'BICICLETA TREK DOMANE AL2', 'Null', 2190000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(190, 1, 'BI28067', 'BICICLETA VENZO IRIS 27.5\"', 'Null', 1230000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(191, 1, '819129', 'BOLSO HIDRATACION 10 L', 'Null', 152000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(192, 1, 'BOL1443', 'BOLSO TERMICO VENZO 3 ', 'Null', 65000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(193, 1, '801431', 'BOMBA BETO MINI ', 'Null', 25000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(194, 1, '301138', 'CADENA GW 11 VELO SX11', 'Null', 47000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(195, 1, '301136', 'CADENA GW 9 VELO SX9', 'Null', 24000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(196, 1, 'CAD032', 'CADENA KMC 10 VELOCIDADES X10 SELLADA ', 'Null', 131000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(197, 1, '3011147', 'CADENA KMC 11 VELOCIDADES X11 CL ', 'Null', 205000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(198, 1, '301282', 'CADENA SHIMANO 12 VELO CN-M8100', 'Null', 151000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(199, 1, '818613', 'CAMISA GW CHEST LINE ', 'Null', 87000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(200, 1, '818394', 'CAMISA GW DIAGONAL', 'Null', 93000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(201, 1, '818518', 'CAMISA GW HALF', 'Null', 95000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(202, 1, '818362', 'CAMISA GW MTB', 'Null', 76000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(203, 1, '818600', 'CAMISA GW OCELOT', 'Null', 90000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(204, 1, '807487', 'CARAMAÑOLA ELITE FLY ', 'Null', 24000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(205, 1, '807487', 'CARAMAÑOLA ELITE FLY ', 'Null', 24000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(206, 1, '807487', 'CARAMAÑOLA ELITE FLY ', 'Null', 24000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(207, 1, '807479', 'CARAMAÑOLA ELITE GIRO DE ITALIA ', 'Null', 24000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(208, 1, '807479', 'CARAMAÑOLA ELITE GIRO DE ITALIA ', 'Null', 24000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(209, 1, '807481', 'CARAMAÑOLA ELITE TEAM INEOS ', 'Null', 24000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(210, 1, '807485', 'CARAMAÑOLA ELITE TOUR DE FRANCIA ', 'Null', 24000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(211, 1, '888818614523', 'CARAMAÑOLA SPECIALIZED 22 OZ', 'Null', 42000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(212, 1, '888818614523', 'CARAMAÑOLA SPECIALIZED 22 OZ', 'Null', 42000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(213, 1, '47089155', 'CASCO GIRO', 'Null', 220000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(214, 1, '47066860', 'CASCO GIRO HEX', 'Null', 308000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(215, 1, '47089170', 'CASCO GIRO REGISTER ', 'Null', 154000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(216, 1, '47095261', 'CASCO GIRO REGISTER MIPS', 'Null', 208000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(217, 1, '47100227', 'CASCO GIRO VASONA MIPS', 'Null', 212000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(218, 1, '47095274', 'CASCO GIRO VASONA MIPS', 'Null', 208000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(219, 1, '47089131', 'CASCO GIRO VASONA MIPS', 'Null', 207000, 0, 0, 'Null', 1, '2020-08-05 22:57:40', '0000-00-00 00:00:00', 0, 0, 0),
(220, 1, '47089159', 'CASCO GIRO VERCE ', 'Null', 220000, 0, 0, 'Null', 1, '2020-08-05 22:58:00', '0000-00-00 00:00:00', 0, 0, 0),
(221, 1, '47089132', 'CASCO GIRO VERONA ', 'Null', 207000, 0, 0, 'Null', 1, '2020-08-05 22:58:00', '0000-00-00 00:00:00', 0, 0, 0),
(222, 1, '814464', 'CASCO GW S-199 COONE HEAD', 'Null', 224000, 0, 0, 'Null', 1, '2020-08-05 22:58:00', '0000-00-00 00:00:00', 0, 0, 0),
(223, 1, '814206', 'CASCO LAZER', 'Null', 154000, 0, 0, 'Null', 1, '2020-08-05 22:58:00', '0000-00-00 00:00:00', 0, 0, 0),
(224, 1, '814215', 'CASCO LAZER BLADE MINS', 'Null', 349000, 0, 0, 'Null', 1, '2020-08-05 22:58:00', '0000-00-00 00:00:00', 0, 0, 0),
(225, 1, '8114203', 'CASCO LAZER CLYCONE', 'Null', 143000, 0, 0, 'Null', 1, '2020-08-05 22:58:00', '0000-00-00 00:00:00', 0, 0, 0),
(226, 1, '814209', 'CASCO LAZER ROLLER ', 'Null', 227000, 0, 0, 'Null', 1, '2020-08-05 22:58:00', '0000-00-00 00:00:00', 0, 0, 0),
(227, 1, '814212', 'CASCO LAZER ULTRAX', 'Null', 290000, 0, 0, 'Null', 1, '2020-08-05 22:58:00', '0000-00-00 00:00:00', 0, 0, 0),
(228, 1, 'CAS0722', 'CASCO LIMA AIR MASTER', 'Null', 466000, 0, 0, 'Null', 1, '2020-08-05 22:58:00', '0000-00-00 00:00:00', 0, 0, 0),
(229, 1, 'CAS0721', 'CASCO LIMAR AIR SPEED', 'Null', 726000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(230, 1, 'CAS0723', 'CASCO LIMAR AIR STAR', 'Null', 317000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(231, 1, '800000482', 'CASCO LIV INFINITA MTB', 'Null', 385000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(232, 1, '814005', 'CASCO SCOOT SUPRA ', 'Null', 160000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(233, 1, '814052', 'CASCO SCOTT GROOVE 2', 'Null', 291000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(234, 1, '814068', 'CASCO SCOTT SUPRA', 'Null', 170000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(235, 1, '888818463619', 'CASCO SPECIALIZED', 'Null', 248000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(236, 1, '888818463695', 'CASCO SPECIALIZED SP ALING', 'Null', 248000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(237, 1, '888818463909', 'CASCO SPECIALIZED SP ALING', 'Null', 248000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(238, 1, '888818465378', 'CASCO SPECIALIZED SP ALING', 'Null', 248000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(239, 1, '888818465545', 'CASCO SPECIALIZED SP ALING', 'Null', 248000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(240, 1, '888818031580', 'CASCO SPECIALIZED WMN VIS', 'Null', 191000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(241, 1, '60614', 'CICICLETA GW SNAKE CARBONO 27.5\"', 'Null', 4390000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(242, 1, '291604600', 'CICLOCOMPUTADOR CATEYE PADRONE +', 'Null', 208000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(243, 1, '291604900', 'CICLOCOMPUTADOR CATEYE QUICK', 'Null', 184000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(244, 1, 'BLK11+', 'CLEATS EXUSTAR ', 'Null', 40000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(245, 1, 'RSL11', 'CLEATS EXUSTAR ', 'Null', 44000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(246, 1, 'BLKR2', 'CLEATS EXUSTAR ', 'Null', 44000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(247, 1, 'T15B903-16', 'CLIFF LIZARD 16\"', 'Null', 350000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(248, 1, '715235040249', 'CLIFF LIZARD 20 20\"', 'Null', 550000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(249, 1, '604279', 'DIRECCION PRO VIBE COMPACT CARBONO ', 'Null', 924000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(250, 1, '604172', 'DIRECCION RITCHEY CMP', 'Null', 67000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(251, 1, '604286', 'DIRECCION RITCHEY WCS TRAIL ', 'Null', 146000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(252, 1, '50086', 'GRUPO ALIVIO M4050 HIDRAULICO ', 'Null', 897000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(253, 1, '50082', 'GRUPO CLARIS R2000 8 VELO', 'Null', 1065000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(254, 1, '50085', 'GRUPO DEORE M6000', 'Null', 1408000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(255, 1, '40010', 'GRUPO DEORE M6100 1 *12', 'Null', 1630000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(256, 1, '50090', 'GRUPO DEORE XT 11 VELO ', 'Null', 2970000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(257, 1, '40004', 'GRUPO DEORE XT M 8100', 'Null', 3707000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(258, 1, '50088', 'GRUPO SHIMANO 105 R7000', 'Null', 2240000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(259, 1, '40002', 'GRUPO SLX M7100 1 *12', 'Null', 2769000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(260, 1, '815758', 'GUANTES CORTOS JASPE ', 'Null', 20000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(261, 1, '888818512416', 'GUANTES SPECIALIZED SP PRO ', 'Null', 138000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(262, 1, '815756', 'GUATES CORTOS GW', 'Null', 17000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(263, 1, '815749', 'GUATES CORTOS GW ', 'Null', 33000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(264, 1, '60367', 'GW ANGEL 12\"', 'Null', 250000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(265, 1, '60624', 'GW BEVERLY 12\"', 'Null', 210000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(266, 1, '60003', 'GW BUGS 12\"', 'Null', 143000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(267, 1, '60639', 'GW BUGS BMX 12\"', 'Null', 203000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(268, 1, '60375', 'GW CANDY 12\"', 'Null', 235000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(269, 1, '60459', 'GW FAT KODIAK 20\"', 'Null', 1000000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(270, 1, '60657', 'GW FLOWERS 12\"', 'Null', 225000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(271, 1, '60582', 'GW FREERIDE 12\"', 'Null', 150000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(272, 1, '60621', 'GW MALIBU 12\"', 'Null', 210000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(273, 1, '6364', 'GW MOTO 12\"', 'Null', 220000, 0, 0, 'Null', 1, '2020-08-05 22:58:01', '0000-00-00 00:00:00', 0, 0, 0),
(274, 1, '60326', 'GW PRINCESS STORY 12\"', 'Null', 265000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(275, 1, '60659', 'GW SPEED 12\"', 'Null', 214000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(276, 1, '60446', 'GW TITAN 20\"', 'Null', 400000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(277, 1, '60518', 'GW WOOD MADERA 12\" ', 'Null', 130000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(278, 1, '407277', 'LLA 29*2.1 VITTORIA MEZCAL', 'Null', 154000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(279, 1, '407277', 'LLA 29*2.1 VITTORIA PEYOTE', 'Null', 154000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(280, 1, '407019', 'LLANTA 700*23 VITTORIA RUBINO ', 'Null', 95000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(281, 1, '12100175', 'LLANTA 700*25  CONTINENTAL 4 SEASON', 'Null', 226000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(282, 1, 'C00021101CA', 'LUBRICANTE DE CADENA HUMEDO', 'Null', 25000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(283, 1, 'M000A1101CA', 'LUBRICANTE DE CADENA LIMPIA Y LUBRICA', 'Null', 27000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(284, 1, '39001', 'LUBRIICANTE DE CADENA SECO ', 'Null', 31000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(285, 1, '1568253', 'MANGO BONTRAGER XR TRAIL', 'Null', 52000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(286, 1, '719676300528', 'MANGO SPECIALIZED SP BG CONTOUR', 'Null', 93000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(287, 1, '888818169917', 'MANGO SPECIALIZED SP SIP LOCKING', 'Null', 74000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(288, 1, '719676582283', 'MANGOS PECIALIZED  SP BG CONTOUR', 'Null', 58000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(289, 1, '818186', 'MEDIAS GW REFLECTIVO', 'Null', 12000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(290, 1, '304524', 'PACHA GW 10 VELO 11-36', 'Null', 95000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(291, 1, '304529', 'PACHA GW 11 VELOCIDADES 11-40', 'Null', 188000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(292, 1, '304533', 'PACHA GW 12 VELOCIDADES 11-46', 'Null', 187000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(293, 1, '304243', 'PACHA GW 8 VELO 11-28', 'Null', 29000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(294, 1, '304239', 'PACHA SHIMANO 105 CS-R7000 11 VELO', 'Null', 175000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(295, 1, '304237', 'PACHA SHIMANO ULTEGRA CS-6800 11 VELO ', 'Null', 216000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(296, 1, 'PAC0571', 'PACHA SUNRACE 10 VELO 11-46', 'Null', 152000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(297, 1, 'PAC0884', 'PACHA SUNRACE 11 VELO 11-46 ', 'Null', 167000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(298, 1, 'PAC0562', 'PACHA SUNRACE 8 VELO 11-40 ', 'Null', 37000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(299, 1, 'PAC0533', 'PACHA SUNRACE 9 VELO 11-40', 'Null', 53000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(300, 1, 'PAC0576', 'PACHASUNRACE 11 VELO 11-40', 'Null', 81000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(301, 1, '', 'PATINETA DE HUMO ', 'Null', 260000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(302, 1, '', 'PATINETA DE NIÑA LLANTA GRUESA ', 'Null', 140000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(303, 1, '', 'PATINETA DE NIÑA MARIPOSA ', 'Null', 110000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(304, 1, '', 'PATINETA GIGANTE ', 'Null', 280000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(305, 1, '', 'PATINETA LLANTA NORMAL ', 'Null', 110000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(306, 1, 'PR200WH', 'PEDAL EXUSTAR EPS-R ', 'Null', 176000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(307, 1, '303255', 'PEDAL SHIMANO 105 PD-R7000', 'Null', 372000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(308, 1, '303464', 'PEDAL SHIMANO PD-EH500', 'Null', 200000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(309, 1, '303430', 'PEDAL SHIMANO PD-M505', 'Null', 97000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(310, 1, '303213', 'PEDAL SHIMANO PD-RS540', 'Null', 256000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(311, 1, '61453', 'SCOTT VOLTAGE 12\"', 'Null', 350000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(312, 1, '605692', 'SILLIN PRO TURNIX 152MM', 'Null', 256000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(313, 1, 'NASP201HB70-AM', 'SILLIN PROLOGO NAGO SPACE ', 'Null', 344000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(314, 1, '605514', 'SILLIN RITCHEY STREEM ', 'Null', 44000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(315, 1, '605527', 'SILLIN RITCHEY STREEM VECTOR ', 'Null', 292000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(316, 1, '605529', 'SILLIN RITCHEY WCS TRAIL', 'Null', 185000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(317, 1, '888818016594', 'SILLIN SPECIALIZED COMP 143 MM', 'Null', 337000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(318, 1, '888818443277', 'SILLIN SPECIALIZED COMP MIMIC WMN 143 MM', 'Null', 0, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(319, 1, '888818016525', 'SILLIN SPECIALIZED EXPERT 143 MM', 'Null', 636000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(320, 1, '605703', 'SILLIN SYNCROS TOFINO ', 'Null', 289000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(321, 1, '806167', 'SOPORTE CARAMAÑOLA', 'Null', 37000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(322, 1, '', 'TABLA CANADIENSE', 'Null', 90000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(323, 1, '601608', 'TIJA PRO 31.6', 'Null', 97000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(324, 1, '41036-C', 'VENZO STINGER 29 ', 'Null', 1530000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(325, 1, '719676276564', 'ZAPATILLA  SPECIALIZED 2FO CLIP', 'Null', 496000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(326, 1, '1516671', 'ZAPATILLA BONTRAGER VELICIS CARBONO ', 'Null', 710000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(327, 1, '148724402043', 'ZAPATILLA GARNEAU BLACK', 'Null', 325000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(328, 1, '148125733142', 'ZAPATILLA GARNEAU CARBONO', 'Null', 430000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(329, 1, '815571', 'ZAPATILLA SHIMANO SH-ME100 ', 'Null', 228000, 0, 0, 'Null', 1, '2020-08-05 22:58:19', '0000-00-00 00:00:00', 0, 0, 0),
(330, 1, '815571', 'ZAPATILLA SHIMANO SH-ME100 ', 'Null', 228000, 0, 0, 'Null', 1, '2020-08-05 22:58:52', '0000-00-00 00:00:00', 0, 0, 0),
(331, 1, '815550', 'ZAPATILLA SHIMANO SH-ME300', 'Null', 308000, 0, 0, 'Null', 1, '2020-08-05 22:58:52', '0000-00-00 00:00:00', 0, 0, 0),
(332, 1, '815575', 'ZAPATILLA SHIMANO SH-ME400', 'Null', 363000, 0, 0, 'Null', 1, '2020-08-05 22:58:52', '0000-00-00 00:00:00', 0, 0, 0),
(333, 1, '815289', 'ZAPATILLA SHIMANO SH-RC900', 'Null', 1050000, 0, 0, 'Null', 1, '2020-08-05 22:58:52', '0000-00-00 00:00:00', 0, 0, 0),
(334, 1, '888818175017', 'ZAPATILLA SKITCH CNDY', 'Null', 160000, 0, 0, 'Null', 1, '2020-08-05 22:58:52', '0000-00-00 00:00:00', 0, 0, 0),
(335, 1, '888818039876', 'ZAPATILLA SPECIALIZED SFO CLIPLITE', 'Null', 616000, 0, 0, 'Null', 1, '2020-08-05 22:58:52', '0000-00-00 00:00:00', 0, 0, 0),
(336, 1, '88881838336', 'ZAPATILLA SPECIALIZED SFO CLIPLITE', 'Null', 616000, 0, 0, 'Null', 1, '2020-08-05 22:58:52', '0000-00-00 00:00:00', 0, 0, 0),
(337, 1, '888818001163', 'ZAPATILLA SPECIALIZED SP RECON MIXED', 'Null', 590000, 0, 0, 'Null', 1, '2020-08-05 22:58:52', '0000-00-00 00:00:00', 0, 0, 0),
(338, 1, '888818444823', 'ZAPATILLA SPECIALIZED SP SPORT ', 'Null', 381000, 0, 0, 'Null', 1, '2020-08-05 22:58:52', '0000-00-00 00:00:00', 0, 0, 0),
(339, 1, '888818444144', 'ZAPATILLA SPECIALIZED SP SPORT ', 'Null', 381000, 0, 0, 'Null', 1, '2020-08-05 22:58:52', '0000-00-00 00:00:00', 0, 0, 0),
(340, 1, '888818577002', 'ZAPATILLA SPECIALIZED SP TORCH 1.0', 'Null', 396000, 0, 0, 'Null', 1, '2020-08-05 22:58:52', '0000-00-00 00:00:00', 0, 0, 0),
(341, 1, '888818574902', 'ZAPATILLA SPECIALIZED SP TORCH 1.1', 'Null', 396000, 0, 0, 'Null', 1, '2020-08-05 22:58:52', '0000-00-00 00:00:00', 0, 0, 0),
(342, 1, '815913', 'ZAPATILLAS GW MTB WARRIOR ', 'Null', 231000, 0, 0, 'Null', 1, '2020-08-05 22:58:52', '0000-00-00 00:00:00', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_has_categoria`
--

CREATE TABLE `producto_has_categoria` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto_has_categoria`
--

INSERT INTO `producto_has_categoria` (`id`, `producto_id`, `categoria_id`) VALUES
(1, 178, 14),
(2, 179, 14),
(3, 180, 14),
(4, 181, 14),
(5, 182, 13),
(6, 183, 13),
(7, 184, 13),
(8, 185, 13),
(9, 186, 14),
(10, 187, 14),
(11, 188, 14),
(12, 189, 14),
(13, 190, 14),
(14, 191, 28),
(15, 192, 28),
(16, 193, 29),
(17, 194, 15),
(18, 195, 15),
(19, 196, 15),
(20, 197, 15),
(21, 198, 15),
(22, 199, 30),
(23, 200, 30),
(24, 201, 30),
(25, 202, 30),
(26, 203, 30),
(27, 204, 16),
(28, 205, 16),
(29, 206, 16),
(30, 207, 16),
(31, 208, 16),
(32, 209, 16),
(33, 210, 16),
(34, 211, 16),
(35, 212, 16),
(36, 213, 17),
(37, 214, 17),
(38, 215, 17),
(39, 216, 17),
(40, 217, 17),
(41, 218, 17),
(42, 219, 17),
(43, 220, 17),
(44, 221, 17),
(45, 222, 17),
(46, 223, 17),
(47, 224, 17),
(48, 225, 17),
(49, 226, 17),
(50, 227, 17),
(51, 228, 17),
(52, 229, 17),
(53, 230, 17),
(54, 231, 17),
(55, 232, 17),
(56, 233, 17),
(57, 234, 17),
(58, 235, 17),
(59, 236, 17),
(60, 237, 17),
(61, 238, 17),
(62, 239, 17),
(63, 240, 17),
(64, 241, 14),
(65, 242, 26),
(66, 243, 26),
(67, 244, 25),
(68, 245, 25),
(69, 246, 25),
(70, 247, 3),
(71, 248, 3),
(72, 249, 31),
(73, 250, 31),
(74, 251, 31),
(75, 252, 32),
(76, 253, 32),
(77, 254, 32),
(78, 255, 32),
(79, 256, 32),
(80, 257, 32),
(81, 258, 32),
(82, 259, 32),
(83, 260, 27),
(84, 261, 27),
(85, 262, 27),
(86, 263, 27),
(87, 264, 3),
(88, 265, 3),
(89, 266, 3),
(90, 267, 3),
(91, 268, 3),
(92, 269, 3),
(93, 270, 3),
(94, 271, 3),
(95, 272, 3),
(96, 273, 3),
(97, 274, 3),
(98, 275, 3),
(99, 276, 3),
(100, 277, 3),
(101, 278, 18),
(102, 279, 18),
(103, 280, 18),
(104, 281, 18),
(105, 282, 33),
(106, 283, 33),
(107, 284, 33),
(108, 285, 19),
(109, 286, 19),
(110, 287, 19),
(111, 288, 19),
(112, 289, 6),
(113, 290, 20),
(114, 291, 20),
(115, 292, 20),
(116, 293, 20),
(117, 294, 20),
(118, 295, 20),
(119, 296, 20),
(120, 297, 20),
(121, 298, 20),
(122, 299, 20),
(123, 300, 20),
(124, 301, 5),
(125, 302, 5),
(126, 303, 5),
(127, 304, 5),
(128, 305, 5),
(129, 306, 21),
(130, 307, 21),
(131, 308, 21),
(132, 309, 21),
(133, 310, 21),
(134, 311, 3),
(135, 312, 22),
(136, 313, 22),
(137, 314, 22),
(138, 315, 22),
(139, 316, 22),
(140, 317, 22),
(141, 318, 22),
(142, 319, 22),
(143, 320, 22),
(144, 321, 34),
(145, 322, 34),
(146, 323, 34),
(147, 324, 14),
(148, 325, 23),
(149, 326, 23),
(150, 327, 23),
(151, 328, 23),
(152, 329, 23),
(153, 330, 23),
(154, 331, 23),
(155, 332, 23),
(156, 333, 23),
(157, 334, 23),
(158, 335, 23),
(159, 336, 23),
(160, 337, 23),
(161, 338, 23),
(162, 339, 23),
(163, 340, 23),
(164, 341, 23),
(165, 342, 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_has_marca`
--

CREATE TABLE `producto_has_marca` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `marca_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto_has_marca`
--

INSERT INTO `producto_has_marca` (`id`, `producto_id`, `marca_id`) VALUES
(1, 178, 7),
(2, 179, 7),
(3, 180, 2),
(4, 181, 2),
(5, 182, 30),
(6, 183, 30),
(7, 184, 30),
(8, 185, 30),
(9, 186, 24),
(10, 187, 24),
(11, 188, 24),
(12, 189, 26),
(13, 190, 27),
(14, 191, 2),
(15, 192, 27),
(16, 193, 4),
(17, 194, 30),
(18, 195, 30),
(19, 196, 30),
(20, 197, 30),
(21, 198, 30),
(22, 199, 30),
(23, 200, 30),
(24, 201, 30),
(25, 202, 2),
(26, 203, 30),
(27, 204, 9),
(28, 205, 9),
(29, 206, 9),
(30, 207, 9),
(31, 208, 9),
(32, 209, 9),
(33, 210, 9),
(34, 211, 23),
(35, 212, 23),
(36, 213, 13),
(37, 214, 13),
(38, 215, 13),
(39, 216, 13),
(40, 217, 13),
(41, 218, 13),
(42, 219, 13),
(43, 220, 13),
(44, 221, 13),
(45, 222, 2),
(46, 223, 15),
(47, 224, 15),
(48, 225, 15),
(49, 226, 15),
(50, 227, 15),
(51, 228, 15),
(52, 229, 16),
(53, 230, 16),
(54, 231, 12),
(55, 232, 20),
(56, 233, 20),
(57, 234, 20),
(58, 235, 23),
(59, 236, 23),
(60, 237, 23),
(61, 238, 23),
(62, 239, 23),
(63, 240, 23),
(64, 241, 2),
(65, 242, 6),
(66, 243, 6),
(67, 244, 30),
(68, 245, 30),
(69, 246, 30),
(70, 247, 7),
(71, 248, 7),
(72, 249, 17),
(73, 250, 19),
(74, 251, 19),
(75, 252, 30),
(76, 253, 30),
(77, 254, 30),
(78, 255, 30),
(79, 256, 30),
(80, 257, 30),
(81, 258, 30),
(82, 259, 30),
(83, 260, 2),
(84, 261, 23),
(85, 262, 2),
(86, 263, 2),
(87, 264, 2),
(88, 265, 2),
(89, 266, 2),
(90, 267, 2),
(91, 268, 2),
(92, 269, 2),
(93, 270, 2),
(94, 271, 2),
(95, 272, 2),
(96, 273, 2),
(97, 274, 2),
(98, 275, 2),
(99, 276, 2),
(100, 277, 2),
(101, 278, 28),
(102, 279, 28),
(103, 280, 28),
(104, 281, 8),
(105, 282, 10),
(106, 283, 10),
(107, 284, 29),
(108, 285, 5),
(109, 286, 23),
(110, 287, 23),
(111, 288, 23),
(112, 289, 2),
(113, 290, 30),
(114, 291, 30),
(115, 292, 30),
(116, 293, 30),
(117, 294, 30),
(118, 295, 30),
(119, 296, 30),
(120, 297, 30),
(121, 298, 30),
(122, 299, 30),
(123, 300, 30),
(124, 301, 30),
(125, 302, 30),
(126, 303, 30),
(127, 304, 30),
(128, 305, 30),
(129, 306, 30),
(130, 307, 30),
(131, 308, 30),
(132, 309, 30),
(133, 310, 30),
(134, 311, 20),
(135, 312, 17),
(136, 313, 18),
(137, 314, 19),
(138, 315, 19),
(139, 316, 19),
(140, 317, 23),
(141, 318, 23),
(142, 319, 23),
(143, 320, 25),
(144, 321, 9),
(145, 322, 30),
(146, 323, 17),
(147, 324, 27),
(148, 325, 23),
(149, 326, 5),
(150, 327, 11),
(151, 328, 11),
(152, 329, 21),
(153, 330, 22),
(154, 331, 22),
(155, 332, 22),
(156, 333, 22),
(157, 334, 23),
(158, 335, 23),
(159, 336, 23),
(160, 337, 23),
(161, 338, 23),
(162, 339, 23),
(163, 340, 23),
(164, 341, 23),
(165, 342, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_has_venta`
--

CREATE TABLE `producto_has_venta` (
  `id` int(45) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  `precio` int(11) NOT NULL,
  `is_iva` int(11) NOT NULL,
  `precio_iva` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_imagen`
--

CREATE TABLE `producto_imagen` (
  `id` int(11) NOT NULL,
  `nombre` varchar(90) NOT NULL,
  `orden` varchar(45) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `subido_por` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Administrado', 'web', NULL, NULL),
(2, 'Empleado', 'web', '2020-07-22 22:46:35', '2020-07-22 23:06:34'),
(3, 'Administradors', 'web', '2020-07-22 22:50:54', '2020-07-22 22:50:54'),
(4, 'Administradorss', 'web', '2020-07-22 22:53:44', '2020-07-22 22:53:44'),
(5, 'supervisor', 'web', '2020-07-22 22:54:44', '2020-07-22 22:54:44'),
(6, 'dddd', 'dddd', '2020-07-22 23:10:48', '2020-07-22 23:10:48'),
(7, 'ddddsw', '', '2020-07-22 23:13:43', '2020-07-22 23:13:43'),
(8, 'fff', '', '2020-07-22 23:39:53', '2020-07-22 23:39:53'),
(9, 'fffder', 'web', '2020-07-22 23:41:00', '2020-07-22 23:41:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 9),
(2, 1),
(2, 9),
(3, 1),
(3, 9),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `twitter`
--

CREATE TABLE `twitter` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `cedula` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `is_cliente` varchar(1) NOT NULL DEFAULT '1',
  `telefono_1` varchar(45) DEFAULT NULL,
  `telefono_2` varchar(45) DEFAULT NULL,
  `is_empleado` varchar(45) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `nombre`, `apellido`, `cedula`, `direccion`, `is_cliente`, `telefono_1`, `telefono_2`, `is_empleado`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Marcos Alberto', 'once.marcos.alberto@gmail.com', 'Marcos Alberto', 'Saavedra Sanadria ', '1069176309', 'carrera 45-45', '1', NULL, NULL, '', NULL, '$2y$10$OLLER1NkK0I31ReqLaRCpuHfE15pHliF7q8DSilWuHu0MsDOplIVi', NULL, NULL, NULL),
(2, 'Entrada_y_Salida_Equipo Editar', 'admin@apoloacademico.com', 'marcos', 'saaaedrs', '12345667', 'carre 45 43', '1', '4345656', '43556', '0', NULL, '$2y$10$mWwxPGTl4.sY9O4ewtRz8.nc7MF.j5hOehXgtCNiUZClKfFeGj9TG', NULL, '2020-07-23 19:26:24', '2020-07-23 19:26:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `estado_venta_id` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `users_id`, `created_at`, `updated_at`, `estado_venta_id`, `fecha`) VALUES
(7, 1, '2020-07-28 01:17:05', '2020-07-28 02:05:31', 2, '2020-07-27'),
(8, 1, '2020-07-28 01:21:53', '2020-07-28 06:19:42', 2, '2020-07-28'),
(9, 1, '2020-07-28 06:21:58', '2020-07-28 06:21:58', 1, '2020-07-28');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  ADD KEY `audits_user_id_user_type_index` (`user_id`,`user_type`);

--
-- Indices de la tabla `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Blog_users1_idx` (`users_id`);

--
-- Indices de la tabla `carrito_compra`
--
ALTER TABLE `carrito_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_carrito_compra_producto1_idx` (`producto_id`),
  ADD KEY `fk_carrito_compra_users1_idx` (`users_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_venta`
--
ALTER TABLE `estado_venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_users1_idx` (`users_id`),
  ADD KEY `fk_producto_estado1_idx` (`estado_id`);

--
-- Indices de la tabla `producto_has_categoria`
--
ALTER TABLE `producto_has_categoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_has_categoria_categoria1_idx` (`categoria_id`),
  ADD KEY `fk_producto_has_categoria_producto1_idx` (`producto_id`);

--
-- Indices de la tabla `producto_has_marca`
--
ALTER TABLE `producto_has_marca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_has_marca_marca1_idx` (`marca_id`),
  ADD KEY `fk_producto_has_marca_producto1_idx` (`producto_id`);

--
-- Indices de la tabla `producto_has_venta`
--
ALTER TABLE `producto_has_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_has_venta_venta1_idx` (`venta_id`),
  ADD KEY `fk_producto_has_venta_producto1_idx` (`producto_id`);

--
-- Indices de la tabla `producto_imagen`
--
ALTER TABLE `producto_imagen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_imagen_producto_idx` (`producto_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `twitter`
--
ALTER TABLE `twitter`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_venta_users1_idx` (`users_id`),
  ADD KEY `fk_venta_estado_venta1_idx` (`estado_venta_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `audits`
--
ALTER TABLE `audits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `carrito_compra`
--
ALTER TABLE `carrito_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_venta`
--
ALTER TABLE `estado_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT de la tabla `producto_has_categoria`
--
ALTER TABLE `producto_has_categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT de la tabla `producto_has_marca`
--
ALTER TABLE `producto_has_marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT de la tabla `producto_has_venta`
--
ALTER TABLE `producto_has_venta`
  MODIFY `id` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `producto_imagen`
--
ALTER TABLE `producto_imagen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `twitter`
--
ALTER TABLE `twitter`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `fk_Blog_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `carrito_compra`
--
ALTER TABLE `carrito_compra`
  ADD CONSTRAINT `fk_carrito_compra_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_carrito_compra_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_has_categoria`
--
ALTER TABLE `producto_has_categoria`
  ADD CONSTRAINT `fk_producto_has_categoria_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_has_categoria_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_has_marca`
--
ALTER TABLE `producto_has_marca`
  ADD CONSTRAINT `fk_producto_has_marca_marca1` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_has_marca_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_has_venta`
--
ALTER TABLE `producto_has_venta`
  ADD CONSTRAINT `fk_producto_has_venta_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_has_venta_venta1` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_imagen`
--
ALTER TABLE `producto_imagen`
  ADD CONSTRAINT `fk_producto_imagen_producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_estado_venta1` FOREIGN KEY (`estado_venta_id`) REFERENCES `estado_venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
