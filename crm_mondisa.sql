-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-01-2026 a las 08:25:58
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
-- Base de datos: `crm_mondisa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`id`, `name`, `domain`, `email`, `phone`, `address`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Moen-Kiehn', 'hills.com', 'rbins@stark.info', NULL, '968 Olen Shoals Suite 046\nNew Amiraton, VT 90922', 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58', NULL),
(2, 'Dickinson-Balistreri', 'kovacek.info', 'josiah.veum@abbott.com', NULL, '976 Waters Crest Apt. 358\nLittleport, FL 60760', 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58', NULL),
(3, 'Schmitt-Breitenberg', 'collins.com', 'schroeder.logan@huel.biz', NULL, '2693 Granville Crossroad\nNorth Bridgetteberg, AL 04340', 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58', NULL),
(4, 'Dooley, Hartmann and Sauer', 'greenfelder.net', 'koelpin.quincy@paucek.com', NULL, '77810 Alvis Turnpike\nWest Onaton, VT 81311', 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58', NULL),
(6, 'Mertz-Paucek', 'kutch.com', 'carmella87@kertzmann.info', NULL, '129 Daniel Road Suite 308\nPort Laurynfort, UT 50666', 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58', NULL),
(7, 'The House Of Tech', 'thehouseoftech.com', 'info@thehouseoftech.com', '1154523654', '642 Stoltenberg Fort Apt. 042\nLake Ambroseville, KS 42285', 1, '2025-12-28 06:51:58', '2025-12-31 10:09:46', NULL),
(8, 'Kirlin-Jones', 'collins.com', 'keith69@kuhlman.org', NULL, '966 Witting Divide Apt. 429\nBaileychester, LA 11537', 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58', NULL),
(9, 'Grady, Dickens and Roberts', 'grady.com', 'aubrey13@senger.com', NULL, '8856 Rodriguez Rue\nPearlbury, PA 57372-1765', 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58', NULL),
(10, 'Bogisich-Hagenes', 'kunze.com', 'bauch.briana@homenick.com', NULL, '14023 Quitzon Crest\nIvabury, FL 12749', 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58', NULL),
(11, 'Informática Servicios de Software', 'informatica.com', 'info@informatica.com', '3815521654', 'Las Rosas 1050, Yerba Buena, Tucumán', 1, '2025-12-31 10:11:00', '2025-12-31 10:17:20', NULL),
(12, 'UNIBER', 'uniber.com.ar', 'info@uniber.com.ar', '3812432332', 'Mendoza 1639, San Miguel de Tucumán', 1, '2025-12-31 10:18:25', '2025-12-31 10:18:25', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `contacts`
--

INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `phone`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Laisha', 'Kunde', 'frederick87@example.org', '414-285-8235', 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(2, 'Prince', 'Heaney', 'bennett30@example.com', '1-463-281-7975', 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(3, 'Wilford', 'Yost', 'nyasia42@example.org', '+1-805-309-0761', 2, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(4, 'Daniela', 'Ryan', 'yadira.crist@example.net', '+1.986.847.1113', 2, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(5, 'Markus', 'Larson', 'austen52@example.net', '386.876.7378', 3, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(6, 'Elinor', 'Wuckert', 'gertrude.ankunding@example.net', '830.996.2926', 3, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(7, 'Gerald', 'Rempel', 'loren.smith@example.org', '870.235.9735', 4, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(8, 'Rosalyn', 'Lang', 'oreilly.noemie@example.org', '(702) 479-8599', 4, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(11, 'Nicklaus', 'O\'Kon', 'skeebler@example.org', '1-562-878-0163', 6, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(12, 'Germaine', 'Mitchell', 'casper.howe@example.net', '248.706.2872', 6, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(13, 'Jason', 'Stroman', 'clementine.ziemann@example.net', '309-904-1240', 7, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(14, 'Michele', 'Stracke', 'fritz69@example.net', '475.848.3827', 7, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(15, 'Leland', 'Jakubowski', 'vrosenbaum@example.net', '1-754-880-2828', 8, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(16, 'Remington', 'Schowalter', 'sipes.rosemary@example.org', '+1-616-782-6535', 8, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(17, 'Vivianne', 'Hyatt', 'bogan.ericka@example.com', '+1-480-995-1875', 9, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(18, 'Desiree', 'Tromp', 'miracle.conn@example.net', '702-990-6168', 9, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(19, 'Leopold', 'Heaney', 'zbogan@example.org', '(620) 739-6222', 10, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(20, 'Frederik', 'Effertz', 'carissa.swift@example.net', '(810) 388-5111', 10, '2025-12-28 06:51:58', '2025-12-28 06:51:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deals`
--

CREATE TABLE `deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `expected_close_date` date DEFAULT NULL,
  `status` enum('open','won','lost') NOT NULL DEFAULT 'open',
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pipeline_stage_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `deals`
--

INSERT INTO `deals` (`id`, `title`, `amount`, `expected_close_date`, `status`, `company_id`, `contact_id`, `pipeline_stage_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Negocio: dicta corporis nostrum', 23502.69, '2026-01-27', 'open', 1, 1, 2, 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(2, 'Negocio: suscipit impedit neque', 44921.11, '2026-01-06', 'open', 1, 1, 2, 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(3, 'Venta de Licencias de SGIL', 13417.07, '2026-01-19', 'open', 10, 3, 1, 1, '2025-12-28 06:51:58', '2025-12-28 08:45:19'),
(4, 'Negocio: accusamus adipisci et', 30086.16, '2025-12-29', 'won', 2, 3, 5, 1, '2025-12-28 06:51:58', '2025-12-29 18:00:29'),
(5, 'Negocio: nisi nihil est', 20262.34, '2026-02-22', 'open', 3, 5, 3, 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(6, 'Negocio: reiciendis facilis eos', 40259.07, '2026-02-08', 'open', 3, 5, 3, 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(7, 'Negocio: quod nostrum repudiandae', 26550.73, '2025-12-29', 'won', 4, 7, 5, 1, '2025-12-28 06:51:58', '2025-12-29 18:00:36'),
(8, 'Negocio: inventore aperiam et', 9818.18, '2026-02-19', 'open', 4, 7, 4, 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(9, 'Negocio: unde velit nobis', 8350.41, '2026-03-03', 'open', 4, 7, 4, 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(11, 'Negocio: fugit fugiat magnam', 5395.72, '2026-02-16', 'open', 6, 11, 6, 1, '2025-12-28 06:51:58', '2025-12-28 08:55:31'),
(12, 'Negocio: unde odit ad', 26911.63, '2026-01-20', 'open', 6, 11, 3, 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(13, 'Negocio: ut aperiam dolore', 27377.67, '2026-02-16', 'open', 6, 11, 3, 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(14, 'Negocio: suscipit saepe quae', 49275.80, '2026-02-13', 'open', 8, 13, 2, 1, '2025-12-28 06:51:58', '2026-01-02 10:10:26'),
(15, 'Negocio: rerum atque fugiat', 23659.73, '2026-02-05', 'open', 7, 13, 4, 1, '2025-12-28 06:51:58', '2025-12-28 07:54:01'),
(16, 'Negocio: itaque ut sunt', 37223.48, '2026-02-04', 'open', 8, 15, 3, 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(17, 'Negocio: incidunt esse neque', 22905.71, '2026-03-08', 'open', 8, 15, 3, 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(18, 'Negocio: magnam ut laborum', 28881.17, '2026-01-09', 'open', 8, 15, 3, 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(19, 'Negocio: maiores doloremque sapiente', 9320.53, '2025-12-29', 'open', 9, 17, 3, 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(20, 'Negocio: et numquam velit', 23661.93, '2026-01-30', 'open', 9, 17, 3, 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(21, 'Negocio: officiis iste ut', 24479.41, '2026-03-02', 'open', 9, 17, 3, 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(22, 'Negocio: occaecati quod voluptatibus', 14696.50, '2026-03-07', 'open', 10, 19, 4, 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(23, 'Negocio: voluptate quia quam', 13984.64, '2026-02-05', 'open', 10, 19, 4, 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(24, 'Negocio: quis autem minima', 46727.76, '2026-01-28', 'open', 10, 19, 4, 1, '2025-12-28 06:51:58', '2025-12-28 06:51:58'),
(25, 'Venta de Licencias de Tickeger', 4500.00, '2026-01-15', 'open', 2, NULL, 4, 1, '2025-12-28 08:12:16', '2025-12-28 08:13:07'),
(26, 'Venta de Licencias de Alerta Amiga', 40000000.00, '2026-03-13', 'open', 4, NULL, 1, 1, '2025-12-28 08:43:02', '2025-12-28 08:43:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_12_28_025031_create_companies_table', 1),
(5, '2025_12_28_025031_create_pipeline_stages_table', 1),
(6, '2025_12_28_025032_create_contacts_table', 1),
(7, '2025_12_28_025032_create_deals_table', 1),
(8, '2025_12_31_070242_add_phone_and_domain_to_companies_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pipeline_stages`
--

CREATE TABLE `pipeline_stages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pipeline_stages`
--

INSERT INTO `pipeline_stages` (`id`, `name`, `position`, `created_at`, `updated_at`) VALUES
(1, 'Lead', 1, '2025-12-28 06:51:57', '2025-12-28 06:51:57'),
(2, 'Contactado', 2, '2025-12-28 06:51:57', '2025-12-28 06:51:57'),
(3, 'Propuesta', 3, '2025-12-28 06:51:57', '2025-12-28 06:51:57'),
(4, 'Negociación', 4, '2025-12-28 06:51:57', '2025-12-28 06:51:57'),
(5, 'Ganado', 5, '2025-12-28 06:51:57', '2025-12-28 06:51:57'),
(6, 'Perdido', 6, '2025-12-28 06:51:57', '2025-12-28 06:51:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('10uMk3iLHeHXAnRYy7xlwA5IPK0j94uFnylK0f0x', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:146.0) Gecko/20100101 Firefox/146.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWVhKWHlTYjJxTmlSNFR3eEdpZzZtVWpsYkNrUkNpYVYwdmNJRk5sMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1767165505),
('KRXxvJNaNuWMnLOxkUAqQSuhfRTgRWQNLohBsoAo', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:146.0) Gecko/20100101 Firefox/146.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiT1JhUXNXdWtQNFBpM2dCNXJFMVBMd1QydmNuMTBFcHZKaE4zeGY3ZyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZGVhbHMiO3M6NToicm91dGUiO3M6MTE6ImRlYWxzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1767020441),
('uF2tnaMwO5IQzeQAQxDhTwTiyPzxABvlQLh9phYv', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:146.0) Gecko/20100101 Firefox/146.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQ2tvcEp4RGNvZ3c1RDd1SGxabFRvejJkb1lQMjJzT0tlMktOMlpxRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1767337835);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'MONDISA | La Casa de la Tecnología', 'lacasadelatecnologia@protonmail.com', '2025-12-28 06:51:57', '$2y$12$AcqpETFv8D5jdMbqOCgpf.AQqzztT/JY12Wi5XZ5KHhZBOm0/uTva', 'zXgc8IEtFv', '2025-12-28 06:51:58', '2025-12-28 06:51:58');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_company_id_foreign` (`company_id`);

--
-- Indices de la tabla `deals`
--
ALTER TABLE `deals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deals_company_id_foreign` (`company_id`),
  ADD KEY `deals_contact_id_foreign` (`contact_id`),
  ADD KEY `deals_pipeline_stage_id_foreign` (`pipeline_stage_id`),
  ADD KEY `deals_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `pipeline_stages`
--
ALTER TABLE `pipeline_stages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `deals`
--
ALTER TABLE `deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pipeline_stages`
--
ALTER TABLE `pipeline_stages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `deals`
--
ALTER TABLE `deals`
  ADD CONSTRAINT `deals_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deals_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `deals_pipeline_stage_id_foreign` FOREIGN KEY (`pipeline_stage_id`) REFERENCES `pipeline_stages` (`id`),
  ADD CONSTRAINT `deals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
