-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2023 at 04:43 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping-hub`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_05_11_035033_create_sessions_table', 1),
(7, '2023_05_14_062900_create_roles_table', 1),
(8, '2023_05_14_064517_add_roles_filelds_to_user_table', 1),
(9, '2023_05_20_232657_create_products_table', 1),
(10, '2023_06_04_034519_create_promotions_table', 1),
(11, '2023_06_06_131844_create_suppliers_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'MI 9T', '1b22b40f72a6d1492e815b04e848f757d7437db750b46eb913b16d7c73a890ba', '[\"*\"]', NULL, NULL, '2023-07-30 17:47:32', '2023-07-30 17:47:32'),
(2, 'App\\Models\\User', 3, 'MI 9T', 'e0188f4a374b83e8ac64e14afff2763abd0ffd5013cca85d4f77bb103614d7a5', '[\"*\"]', NULL, NULL, '2023-07-30 17:48:18', '2023-07-30 17:48:18'),
(3, 'App\\Models\\User', 1, '512f306e5aa862fd', 'a9a0164d9ad61fdd0a5cbcbe74e93583d1fcb60c9c8dffe5c3eb641f731d6282', '[\"*\"]', NULL, NULL, '2023-07-30 17:52:02', '2023-07-30 17:52:02'),
(4, 'App\\Models\\User', 2, '512f306e5aa862fd', 'e88873c1b45c96f39485a0af88bd760c2d9fe2c1c518bd878278d512231a3bd7', '[\"*\"]', NULL, NULL, '2023-07-30 18:05:11', '2023-07-30 18:05:11'),
(5, 'App\\Models\\User', 1, '512f306e5aa862fd', '50969a827ae637dd047d97635d5d63e036da3fb1d3f3518d90abbef4da9270d1', '[\"*\"]', NULL, NULL, '2023-07-30 18:32:31', '2023-07-30 18:32:31'),
(6, 'App\\Models\\User', 3, '512f306e5aa862fd', 'b9e88f1ec5aed0407326b8132ebfd0a41bd5bb8bf81f1315612e27e112d55b32', '[\"*\"]', NULL, NULL, '2023-07-30 18:37:33', '2023-07-30 18:37:33'),
(7, 'App\\Models\\User', 3, '512f306e5aa862fd', '2cde88c325359dca527788cad26e6e5c994342f607968668aa7f94e1bcac243e', '[\"*\"]', NULL, NULL, '2023-07-30 18:45:27', '2023-07-30 18:45:27'),
(8, 'App\\Models\\User', 1, '512f306e5aa862fd', '77db96ab56d89c1c9692c872dd2d3778df43a088298aad62b04a5c9f091eae45', '[\"*\"]', NULL, NULL, '2023-07-30 18:46:02', '2023-07-30 18:46:02'),
(9, 'App\\Models\\User', 1, '512f306e5aa862fd', 'a26b268743cdc4ec22bda23525bac560e7b2a34321b3c48118b009d89062e681', '[\"*\"]', NULL, NULL, '2023-07-30 18:50:55', '2023-07-30 18:50:55'),
(10, 'App\\Models\\User', 1, '512f306e5aa862fd', '38980bd9591c8ff2f8825777b6b95e001bf6e7e4b8008a7d665d8aeead561305', '[\"*\"]', NULL, NULL, '2023-07-31 05:03:54', '2023-07-31 05:03:54'),
(11, 'App\\Models\\User', 15, '512f306e5aa862fd', 'd22da27fdff173714a7b0349b67c49ba4675d7e5bcb4380360452f87e734a93f', '[\"*\"]', NULL, NULL, '2023-07-31 11:36:54', '2023-07-31 11:36:54'),
(12, 'App\\Models\\User', 15, '512f306e5aa862fd', '6718251c5c093c59a15bd800dde369494837670d2eed584b2262b0e8c4c5c2ac', '[\"*\"]', NULL, NULL, '2023-07-31 11:50:19', '2023-07-31 11:50:19'),
(13, 'App\\Models\\User', 15, '512f306e5aa862fd', '8a735d79d43fa2f58c17d4825a34bf96a0f8db6225f09450e8d0f6262a431ca2', '[\"*\"]', NULL, NULL, '2023-07-31 11:51:17', '2023-07-31 11:51:17'),
(14, 'App\\Models\\User', 15, '512f306e5aa862fd', '4677572c29cecc1676a38ee7562eb3ccb9189b521804a032ca2804d2ad36404b', '[\"*\"]', NULL, NULL, '2023-07-31 11:53:18', '2023-07-31 11:53:18'),
(15, 'App\\Models\\User', 16, '512f306e5aa862fd', '4d2c4385079c6bd1fbe5c0ccd6241482e42a6998b1497b28eea93e700ee1e6e9', '[\"*\"]', NULL, NULL, '2023-07-31 11:58:08', '2023-07-31 11:58:08'),
(16, 'App\\Models\\User', 16, '512f306e5aa862fd', '1a8000b28d33688b32d6286603e4ea031ca6b4d2ef3476bc29af468b941b30f0', '[\"*\"]', NULL, NULL, '2023-07-31 12:00:48', '2023-07-31 12:00:48'),
(17, 'App\\Models\\User', 17, '512f306e5aa862fd', '8ea9b8b1f17145a2d68d9291f3ac2a3c83ba20c0e01faef53685835aa837c703', '[\"*\"]', NULL, NULL, '2023-07-31 12:14:00', '2023-07-31 12:14:00'),
(18, 'App\\Models\\User', 17, '512f306e5aa862fd', 'c549140faf3496ebd77b35823e9c926975a0deb8fe6a1ebc28a6c4b5a19740c3', '[\"*\"]', NULL, NULL, '2023-07-31 12:14:52', '2023-07-31 12:14:52'),
(19, 'App\\Models\\User', 18, '512f306e5aa862fd', '1ce615d6ff27abdcb9fc777b9f61acee12bd82f96833b446c669f5abb069d134', '[\"*\"]', NULL, NULL, '2023-07-31 12:16:53', '2023-07-31 12:16:53'),
(20, 'App\\Models\\User', 17, '512f306e5aa862fd', 'c5e3518143cf718af2b0d6e8aeef245596ee755aeeb476bfaacf68715618c8f9', '[\"*\"]', NULL, NULL, '2023-07-31 12:24:47', '2023-07-31 12:24:47'),
(21, 'App\\Models\\User', 17, '512f306e5aa862fd', '0e3a783716cb91c811b1ce3b2ce132a46649ca70a106842b27574cf4ef1ef405', '[\"*\"]', NULL, NULL, '2023-07-31 13:04:45', '2023-07-31 13:04:45'),
(22, 'App\\Models\\User', 17, '512f306e5aa862fd', '99a136b2efa42f8eac78d9b7a2bfd5a25e73e5c9bc6c4e00e48af7dada74e5d6', '[\"*\"]', NULL, NULL, '2023-07-31 13:18:53', '2023-07-31 13:18:53'),
(23, 'App\\Models\\User', 17, '512f306e5aa862fd', 'aeca68fab9b608548a32f25cce83842ccb3c90b412b576c7e75a50f9697901e4', '[\"*\"]', NULL, NULL, '2023-07-31 13:26:36', '2023-07-31 13:26:36'),
(24, 'App\\Models\\User', 17, '512f306e5aa862fd', 'f244b0d6159418d566fa17666c40dca95cb4ad1c5a11328fde5dd776258d8ab3', '[\"*\"]', NULL, NULL, '2023-07-31 13:36:06', '2023-07-31 13:36:06'),
(25, 'App\\Models\\User', 17, '512f306e5aa862fd', '43277d65775888778faf3cbfc88b1ded04be790f9d24109c428012d132574362', '[\"*\"]', NULL, NULL, '2023-07-31 13:44:46', '2023-07-31 13:44:46'),
(26, 'App\\Models\\User', 19, '512f306e5aa862fd', '7950be63c1ae9471cd65a78f2ce2dd08429f03d4fb465a5df75cf01e74d8f446', '[\"*\"]', NULL, NULL, '2023-07-31 13:58:04', '2023-07-31 13:58:04'),
(27, 'App\\Models\\User', 19, '512f306e5aa862fd', '8d009c37aeb17e97660fdece4001dd5178c0752cc8aea9dc21387c2b3e584a64', '[\"*\"]', NULL, NULL, '2023-07-31 13:59:01', '2023-07-31 13:59:01'),
(28, 'App\\Models\\User', 20, '512f306e5aa862fd', '0fca925a6be7c483cd6d4e240d640a6e7f66d157a15b04bdd63ee63f9209311a', '[\"*\"]', NULL, NULL, '2023-07-31 14:03:22', '2023-07-31 14:03:22'),
(29, 'App\\Models\\User', 20, '512f306e5aa862fd', 'fe0d8531fdc0ec8eef91cb32eb5381e3e72ec6a7d8af13f7a93e771362d3c75d', '[\"*\"]', NULL, NULL, '2023-07-31 14:04:19', '2023-07-31 14:04:19'),
(30, 'App\\Models\\User', 33, 'web', '62a8bb25b077ddb817faa9bc89acb460fb183e1c7364276f5ad9f98c5e04496a', '[\"*\"]', NULL, NULL, '2023-08-03 13:41:09', '2023-08-03 13:41:09'),
(31, 'App\\Models\\User', 34, 'web', '7d8622d3fef3380c1f4d6dd711530cab093cddebdfc3b705ae73fbaf56e96c1e', '[\"*\"]', NULL, NULL, '2023-08-03 14:32:52', '2023-08-03 14:32:52'),
(32, 'App\\Models\\User', 31, 'web', 'fb83632b2e41fd9f7bd9ebee9f7e9a974dd5a63357ca0f777a959b7c8533b3cc', '[\"*\"]', NULL, NULL, '2023-08-03 15:34:32', '2023-08-03 15:34:32'),
(33, 'App\\Models\\User', 32, 'web', 'd09e7fe15eece84d33ae59c69d5867c16a4303db62b325eac6ccdb7b8dc6cf01', '[\"*\"]', NULL, NULL, '2023-08-04 09:20:00', '2023-08-04 09:20:00'),
(34, 'App\\Models\\User', 35, 'web', 'd239c5dc7052296b14ff5070ae7de1d70a51f46f9c3056bdccadda9fec220dd1', '[\"*\"]', NULL, NULL, '2023-08-04 09:21:40', '2023-08-04 09:21:40'),
(35, 'App\\Models\\User', 31, 'web', 'c11f89c62ff511c6d2aec25626580a1d3a8118cafa65dc12cfee0c44a072bd95', '[\"*\"]', NULL, NULL, '2023-08-04 09:35:39', '2023-08-04 09:35:39'),
(36, 'App\\Models\\User', 30, 'web', '4c2f79b8e523062e60ae121e9db610dbc412b6691f11c533c715c319bea0b7cf', '[\"*\"]', NULL, NULL, '2023-08-04 09:38:32', '2023-08-04 09:38:32'),
(37, 'App\\Models\\User', 36, 'web', '927e3442c8d56e84c31daed3564c7a9b550af0f68e5e46f79487f8edbc740079', '[\"*\"]', NULL, NULL, '2023-08-04 09:51:18', '2023-08-04 09:51:18'),
(38, 'App\\Models\\User', 37, 'web', 'd565b9c0f0cc24058e48adc8bcc240722ec849c621c854e39ea5dee8671790df', '[\"*\"]', NULL, NULL, '2023-08-04 09:57:06', '2023-08-04 09:57:06'),
(39, 'App\\Models\\User', 36, 'web', '22b5fdfb26998b0d8c58b5dfbe351fec793f9737697edc6ca95894fac8aecf13', '[\"*\"]', NULL, NULL, '2023-08-04 09:58:01', '2023-08-04 09:58:01'),
(40, 'App\\Models\\User', 38, 'web', 'fa62c1a6a36f7da4706525aa517969c95fdc2102e29ab0af0ca6b82e15260623', '[\"*\"]', NULL, NULL, '2023-08-04 09:59:13', '2023-08-04 09:59:13'),
(41, 'App\\Models\\User', 39, 'web', 'd743ac9d8bc4f040daf39cd28d51fb7352a3683ba29506f170534963c061f0b5', '[\"*\"]', NULL, NULL, '2023-08-04 11:09:37', '2023-08-04 11:09:37'),
(42, 'App\\Models\\User', 23, 'web', 'e947a74e094a5ea0c2904d086fd870d17bf5ede9a1a4d9ae476bcc27bab4b675', '[\"*\"]', NULL, NULL, '2023-08-05 03:12:32', '2023-08-05 03:12:32');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Bname` varchar(255) NOT NULL,
  `Percentage` int(11) NOT NULL,
  `EndMonth` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'owner', 1, '2023-07-30 16:56:39', '2023-07-30 16:56:39'),
(2, 'driver', 1, '2023-07-30 17:00:12', '2023-07-30 17:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
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
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('7302W0VdFtMWlrkCenR8NCZWmrCpizetrZN3n4sI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidThhbGt1R0szblVvWURhV2ZCZVpDamN1QWpTY3RWczMzRlZKRkh3byI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1691167887),
('8f4rv6GlylM0X7hN0kZGxNtVJohCYSQQMmWv30bV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiS1pna2tRNm53SWNBZFI2MzdGMzJISzRRckQxajc4dUVZRXh4b3NQVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDgwIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODA4MC9sb2dpbiI7fX0=', 1690747567),
('o3O7n86B1tw8ngD52QxYeiqYjCsuMc3SNYTJRBwA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRTBOVVlEQXdvTkRhaHhKc2VLNWNUcWlMa2tZZXJwR1k4a1ZodU5xVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDgwIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODA4MC9sb2dpbiI7fX0=', 1690758924),
('VWroulvTfWDAF2Th8aSZvj3E7v8S15lso8KwnIqa', NULL, '127.0.0.1', 'PostmanRuntime/7.32.3', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUkhCdzcyZExRamdoR1Nla3oxQjFKRGdMNVBnMU5YUHZ4dlFUSElMUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1690739847),
('wKm0YxES5s6VlS60Q4kWxo3BnktEM85e3LTZDGf8', NULL, '127.0.0.1', 'PostmanRuntime/7.32.3', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidXA3NzY0N1FKRGlhYUtoV1hOalN1QVB2am9iVGx2TjlyUDJIcUNkeCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDgwIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODA4MC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1690758969),
('X02dU6q3uiNY7wQNJ4OR26UyKAXOe457jFhUjVJK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidEZQQmhEMDBDZWp2bVdHM1dwUnozSWhjb1BFNzI1WlR3MldFcE9OZiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozOToiaHR0cDovL2Y5ZTQtNDUtMTIxLTg4LTI1Lm5ncm9rLWZyZWUuYXBwIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly9mOWU0LTQ1LTEyMS04OC0yNS5uZ3Jvay1mcmVlLmFwcC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1690748629),
('z7Idixff7IsE2fpIoB4m00hMK9uearaDSPSfrfmu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTldRMzBRTnV5S01OWlpZYllLMUdpQzNzcktZSEJReUxHNmI0Vng2eSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1690758850);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Sname` varchar(255) NOT NULL,
  `Saddress` varchar(255) NOT NULL,
  `Sphone` varchar(255) NOT NULL,
  `Semail` varchar(255) NOT NULL,
  `Product` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 4
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `phone`, `address`, `dob`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `status`, `created_at`, `updated_at`, `role_id`) VALUES
(1, 'User1', 'user1@gmail.com', NULL, '0754568789', 'colombo', '1995-10-05', '$2y$10$uNQbVb06B1sKi6uBZJHUy.ZJ.0zJTzSEJ1y9hias.QoBYS89gk68u', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-07-30 11:31:48', '2023-07-30 11:31:48', 2),
(2, 'user0', 'user2@gmail.com', NULL, '0771415145', 'kandy', '1999-01-12', '$2y$10$FSJoCtG.Dl4D7kqVa6p4jO/4iAsN5UpreDvTTO2wXPO7lSJgPQW3i', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-07-30 12:36:07', '2023-07-30 12:36:07', 1),
(3, 'user3', 'user3@gmail.com', NULL, '0774784777', 'kandy', '1999-08-18', '$2y$10$aVr26AZJvR3.onixuJQPGORtJOTaLemOO4uwXcd24VPATicrvtaQO', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-07-30 12:40:01', '2023-07-30 12:40:01', 1),
(4, 'fjgdf', 'gggf@gdg.fhdf', NULL, '0771234561', 'ggdhff', '1999-01-21', '$2y$10$nvqImW1UUYHZCT6f6N6r6.u2mVEhzJ84DNwKGo3Yej7tJmclPdily', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-07-30 14:56:05', '2023-07-30 14:56:05', 1),
(5, 'user5', 'user5@gmail.com', NULL, '0771232123', 'galle', '1993-12-05', '$2y$10$yQ0eCm19h2yZM17TWXv2ueTkZmMNRMeFhQKj4mVyP8QbvhqV96IjC', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-07-30 15:16:02', '2023-07-30 15:16:02', 1),
(6, 'user5', 'user5@gmail.con', NULL, '0751213123', 'sri lanka', '1999-09-19', '$2y$10$ZYOsY.g/QRZphNhdo.6s9eHsl7LWsZRLT9I6QUoxcqaKln7k//HK6', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-07-31 05:11:15', '2023-07-31 05:11:15', 1),
(17, 'Sam Walker', 'chathuracde@gmail.com', NULL, '0771234111', '64c7f2c024c6b9.22402515', '1999-09-19', '$2y$10$qpm1jtBpCpiT/8po6RDeVO7Tt7rbzn/JzxhIOrS2kjC2aguygQEvO', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-07-31 12:13:28', '2023-07-31 12:14:21', 1),
(18, 'Alan', 'chathuranewali@gmail.com', NULL, '0754323123', '64c7f358e801c8.88533657', '1999-09-19', '$2y$10$i3AB22cq3dPg1Lf9aKMGAeBpSzA9XHxQgeVzKVvRcX53wHmaHvwJ2', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-07-31 12:16:00', '2023-07-31 12:16:21', 1),
(19, 'Mike Jones', 'chathuraejob@gmail.com', NULL, '0112376456', '64c80b1fb41b17.09488168', '1999-09-19', '$2y$10$ikRN0VpbBEe3wjT/A5.AzO6o2qBDFwr6dx0aUIbcraRTMeiFxevi2', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-07-31 13:57:27', '2023-07-31 13:58:29', 1),
(20, 'Nike', 'g10696.chathura@gmail.com', NULL, '0119864123', '64c80c50cbbad1.61977834', '1999-09-19', '$2y$10$ZX0EE.e8RFBZbs.qJr/9/OR0zl7ReGPbTvceOpuQ5Deiq9Ac0q.vq', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-07-31 14:02:32', '2023-07-31 14:03:44', 1),
(21, 'Josh', 'josh@gmail.com', NULL, '0754758785', '64cbe755b27478.71479236', '2000-01-01', '$2y$10$KIlrlXKmiikS9zLwzE2x0eha6YBsbdtN6BmRrkeaPddziC1vQxkiC', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-03 12:13:49', '2023-08-03 12:13:49', 1),
(22, 'user8', 'user8@gmail.com', NULL, '0774784778', '64cbe846a6f205.80860502', '1999-08-18', '$2y$10$SxuMdYlCc2Bm5WjVC6pMgOVCVhIRtLlAPxc5HAIW8WzbSqPVCtY4K', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-03 12:17:50', '2023-08-03 12:17:50', 1),
(23, 'Mike', 'mike2@gmail.com', NULL, '0114254120', '64cbe9ae053d74.03817720', '2000-01-01', '$2y$10$34zuZE.8RJJvD3Itl7JJIueGcnr3NBJqzLpTBHA4SSjuf6CzC70Fa', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-03 12:23:50', '2023-08-03 12:23:50', 1),
(24, 'ann', 'ann2@gmailcom', NULL, '0114254785', '64cbeb0f1c19c8.85684907', '2000-01-01', '$2y$10$jKmXnqGxmK4mCFSIuNQPLOCYSwhKI7iHl9KnFDU5yGac6KnPa5R5q', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-03 12:29:43', '2023-08-03 12:29:43', 1),
(25, 'norm', 'norm@gmail.com', NULL, '0114525478', '64cbefb4864fb5.69683385', '2000-01-01', '$2y$10$jEbYR1u2ULo7v3U8.qOMOeWDrg4EGasgyamUwCpAL67kogQHEmGyO', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-03 12:49:32', '2023-08-03 12:49:32', 1),
(26, 'jim', 'jim@gmail.com', NULL, '0112475875', '64cbf150bfcea9.62511786', '2000-01-01', '$2y$10$iWnM.Zgvq.ntA3SDTfZV/OhLVJ2.6E9MjuK/G7Avx2f2R5bdO2way', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-03 12:56:24', '2023-08-03 12:56:24', 1),
(27, 'adam', 'adam1@gmail.com', NULL, '0114254678', '64cbf1f1a4bad5.38941680', '2000-01-01', '$2y$10$bLyQsvML9nG90QvzxhTfquDrG6TqvjGheG2QDpbBeUBL9H.mIVdl6', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-03 12:59:05', '2023-08-03 12:59:05', 1),
(28, 'Mike5', 'mike5@gmail.com', NULL, '0114562458', '64cbf3468d07a9.75046579', '2000-01-01', '$2y$10$qsN.lTZX.vq5ssQTLu7xq.I/qHoZjyhcogCO6SCe0WDaZctKU68BC', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-03 13:04:46', '2023-08-03 13:04:46', 1),
(29, 'Mike6', 'mike6@gmail.com', NULL, '0117854252', '64cbf3f7e57a91.63611535', '2000-01-01', '$2y$10$ir6TvXNo9DIYfkwV546J9eiu4E9y4NiUXtYPREH3MW.KHq6YT9hgG', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-03 13:07:43', '2023-08-03 13:07:43', 1),
(30, 'namal', 'namal@gmail.com', NULL, '0112454785', '64cbf8624d51b7.97710671', '2000-01-01', '$2y$10$gCMxBwbSL1uoOHSws.yire7gBU6FxGGDb5gOkJJQjxd2Jq.M50JjK', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-03 13:26:34', '2023-08-03 13:26:34', 1),
(31, 'kamal', 'kamal@gmail.com', NULL, '0114526785', '64cbf8e8d91268.82598151', '2000-01-01', '$2y$10$CSdw8oCeyhi9o6Uctm2W6e8dUNUycZhuDxtUnb9GQgHDJ8hjzG1QS', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-03 13:28:48', '2023-08-03 13:28:48', 1),
(32, 'anura', 'anura@gmail.com', NULL, '0112545785', '64cbf92be56603.25877954', '2000-01-01', '$2y$10$uXcNndYo5WclvswyEe7dzuWUbtoqZ1DZK588kfy2GvTYLMFxAVs7a', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-03 13:29:55', '2023-08-03 13:29:55', 1),
(33, 'nimal', 'nimal@gmail.com', NULL, '0114578785', '64cbf962d63f13.22594104', '2000-01-01', '$2y$10$TxU9Vwtm5R/Wg4NZWmKx..U6.o4hHOZXsjL4Ef3rQyWgp..tVlGbO', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-03 13:30:50', '2023-08-03 13:30:50', 1),
(34, 'Mike7', 'mike7@gmail.com', NULL, '0714526875', '64cbfa626a3bd0.89464703', '2000-01-01', '$2y$10$FHaC59RXw7D9ZDBaBl3Tw.iPDnINhi9vnnHMhKuYUB8ZANU3Vsqii', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-03 13:35:06', '2023-08-03 13:35:06', 1),
(35, 'anura2', 'anura2@gmail.com', NULL, '0745425412', '64cd10695b3bc2.62812385', '2000-01-01', '$2y$10$Qjf8t70osoY9sdRtamAAC.1OmJOvhA5Zu4Gu1NR5DV49qYbzfULGe', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-04 09:21:21', '2023-08-04 09:21:21', 1),
(36, 'norm2', 'norm2@gmail.com', NULL, '0741542632', '64cd175b495846.20029574', '2000-01-01', '$2y$10$Z8BVEK2L7VK2RWeff/.f8.6vNXWRLbsYrHx9MwEVGZ.QA0FE3Rm7m', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-04 09:50:59', '2023-08-04 09:50:59', 1),
(37, 'jimmy', 'jimmy@gmail.com', NULL, '0757415235', '64cd1889a9e5c4.11057565', '2000-01-01', '$2y$10$Uk8JsGnv8BDG0LJYWo7jnetSkmdGK87smH9QOkqWquyo0TfuruSjm', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-04 09:56:01', '2023-08-04 09:56:01', 1),
(38, 'jimmy2', 'jimmy2@gmail.com', NULL, '0774102456', '64cd193821f817.25049291', '2000-01-01', '$2y$10$01qIw.NqtaQ1oPb1nnO5Ie1CNeQxRUzPyV3/9O7/R263UoQLwxUb2', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-04 09:58:56', '2023-08-04 09:58:56', 1),
(39, 'paul', 'paul2@gmail.com', NULL, '0751425746', '64cd29a5e1f0d3.00902888', '2000-01-01', '$2y$10$WCjnP5USVYAvQWVco39Pn.Lns7uf1suq2vaMKi/aVT0xes0.1uvei', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-08-04 11:09:01', '2023-08-04 11:09:01', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
