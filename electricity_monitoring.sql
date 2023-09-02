-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2023 at 01:16 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electricity_monitoring`
--

-- --------------------------------------------------------

--
-- Table structure for table `appliances`
--

CREATE TABLE `appliances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appliances`
--

INSERT INTO `appliances` (`id`, `name`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Fridge', NULL, '2023-09-01 08:49:06', '2023-09-01 08:49:06'),
(2, 'Stove 4 Plate', NULL, '2023-09-01 08:50:42', '2023-09-01 08:50:42'),
(3, 'Television', NULL, '2023-09-01 11:50:38', '2023-09-01 11:50:38'),
(4, 'Laptop', NULL, '2023-09-01 11:50:48', '2023-09-01 11:50:48'),
(5, 'Gyser', NULL, '2023-09-01 11:50:53', '2023-09-01 11:50:53'),
(6, 'Lights', NULL, '2023-09-01 11:51:02', '2023-09-01 11:51:02'),
(7, 'Borehole', NULL, '2023-09-02 08:24:01', '2023-09-02 08:24:01');

-- --------------------------------------------------------

--
-- Table structure for table `electricity_consumptions`
--

CREATE TABLE `electricity_consumptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_appliance_id` bigint(20) UNSIGNED NOT NULL,
  `units_used` double NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `electricity_consumptions`
--

INSERT INTO `electricity_consumptions` (`id`, `user_appliance_id`, `units_used`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 100, 4, '2023-09-01 11:09:59', '2023-09-02 08:30:06'),
(2, 2, 150, 4, '2023-09-01 11:09:59', '2023-09-02 08:30:06'),
(3, 3, 600, 4, '2023-09-01 11:53:50', '2023-09-02 08:30:06'),
(4, 4, 150, 4, '2023-09-01 11:53:50', '2023-09-02 08:30:06'),
(5, 5, 960, 4, '2023-09-01 11:53:50', '2023-09-02 08:30:06'),
(6, 6, 135, 4, '2023-09-01 11:53:50', '2023-09-02 08:30:06'),
(7, 7, 800, 6, '2023-09-01 11:57:17', '2023-09-02 08:30:06'),
(8, 8, 10000, 6, '2023-09-01 11:57:17', '2023-09-02 08:30:06'),
(9, 9, 100, 8, '2023-09-02 08:30:06', '2023-09-02 08:30:06'),
(10, 10, 50, 8, '2023-09-02 08:30:06', '2023-09-02 08:30:06'),
(11, 11, 70, 8, '2023-09-02 08:30:06', '2023-09-02 08:30:06');

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
-- Table structure for table `meters`
--

CREATE TABLE `meters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `meter_number` varchar(255) NOT NULL,
  `current_units` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meters`
--

INSERT INTO `meters` (`id`, `user_id`, `meter_number`, `current_units`, `created_at`, `updated_at`) VALUES
(1, 2, '26959600247', 0, '2023-09-01 06:40:51', '2023-09-01 06:40:51'),
(2, 3, '38473104784', 400000, '2023-09-01 08:01:44', '2023-09-01 09:34:27'),
(3, 4, '46054079212', 97905, '2023-09-01 08:23:40', '2023-09-02 08:30:06'),
(5, 6, '61567095029', 389200, '2023-09-01 11:54:57', '2023-09-02 08:30:06'),
(6, 7, '75363292222', 0, '2023-09-02 08:08:26', '2023-09-02 08:08:26'),
(7, 8, '85740807913', 999780, '2023-09-02 08:20:34', '2023-09-02 08:30:06');

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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_09_01_074457_create_appliances_table', 1),
(6, '2023_09_01_074524_create_meters_table', 1),
(7, '2023_09_01_074540_create_user_appliances_table', 1),
(8, '2023_09_01_074601_create_tokens_table', 1),
(9, '2023_09_01_074630_create_electricity_consumptions_table', 1),
(10, '2014_10_12_200000_add_two_factor_columns_to_users_table', 2),
(11, '2023_09_01_075928_create_sessions_table', 2);

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
('5wiMDO1DGc7GERA1fBJJfo9DO3N1CBADaLqMLTQH', 8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZTNZa3JPT2ppZVJYM3R2OTAxT1laTUFZMTBBTEI5VTBoa1Z5RnFwQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6ODtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2Rhc2hib2FyZCI7fXM6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJFlJcHpXM3cveWxzQkp6cDY4RUNTTU9NVWk0T1lYay5tWUxIUkkwZUppTng3UWJtV2s5TVVDIjt9', 1693652492),
('ENT98BeM4RPJbX31fp5o0kkVzykC2LgVuzTMOob7', 8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoid1BnU3I3VVlBRW1BNTRoZ1ZVWElYSkVZZnZCdHQ3TjcxS1c5VVlUVCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2NvbnN1bWVyL2FwcGxpYW5jZXMiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0MToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2NvbnN1bWVyL2FwcGxpYW5jZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo4O30=', 1693652490),
('N5poTtLqJYBpfVaCKx7qnouY7UFPftJqyKAeb79H', 8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZW12NE94SDdUNkppVVhuSTVmQ3RLdXM4WXpyVlNoekpwT1FHREk4TyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6ODtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0MToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2NvbnN1bWVyL2FwcGxpYW5jZXMiO319', 1693652490);

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(255) NOT NULL,
  `units` double NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `cost` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `user_id`, `token`, `units`, `status`, `cost`, `created_at`, `updated_at`) VALUES
(1, 3, '32345709766678826', 400000, 'used', 200000, '2023-09-01 09:34:27', '2023-09-01 09:34:27'),
(2, 4, '49301156425652230', 100000, 'used', 50000, '2023-09-01 09:35:51', '2023-09-01 09:35:51'),
(3, 6, '66783415326504177', 400000, 'used', 200000, '2023-09-01 11:57:12', '2023-09-01 11:57:12'),
(4, 8, '87877756648311922', 1000000, 'used', 500000, '2023-09-02 08:22:06', '2023-09-02 08:22:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT 'consumer',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `address`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `user_type`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Test User', 'test@gmail.com', '6 Fairway Mt Pleasant Harare', NULL, '$2y$10$zYn/EON3tfbVaTZAV2q94u3el6FeKeE9ojlMQWLl4T4tvoHSCG4E6', NULL, NULL, NULL, 'admin', NULL, '2023-09-01 06:40:50', '2023-09-01 06:40:50'),
(3, 'Denzel Mwale', 'denzel@gamil.com', '7 Wingate  Rhodesville Harare', NULL, '$2y$10$hoLcssJJmadnU.o9ChGPOeBQIwAxZDzTa4.vV6XN0TlVk3H5V7vL.', NULL, NULL, NULL, 'consumer', NULL, '2023-09-01 08:01:44', '2023-09-01 08:01:44'),
(4, 'Trevor Sibanda', 'trevor@gmail.com', '7 Fairway M Pleasant Harare', NULL, '$2y$10$zYn/EON3tfbVaTZAV2q94u3el6FeKeE9ojlMQWLl4T4tvoHSCG4E6', NULL, NULL, NULL, 'consumer', NULL, '2023-09-01 08:23:40', '2023-09-01 08:23:40'),
(6, 'Tendai Ndoro', 'tendai@gmail.com', '45 Mt Pleasant Heights', NULL, '$2y$10$yFk7nQCwlFnWasQqvH4m6.2krCxRO160CmMrG1qcrHb//SD8BJ0um', NULL, NULL, NULL, 'consumer', NULL, '2023-09-01 11:54:57', '2023-09-01 11:54:57'),
(7, 'Maybe Beacuse', 'maybe@gmail.com', '15 Fary Tale Harare', NULL, '$2y$10$LgWzrwYmqdo32CR4/5r.j.XSUR4XXPnf9cnUY0T72w4q2V4pcgFuy', NULL, NULL, NULL, 'consumer', NULL, '2023-09-02 08:08:26', '2023-09-02 08:08:26'),
(8, 'Peter Moyo', 'peter@gmail.com', '16 Hatclief Harare', NULL, '$2y$10$YIpzW3w/ylsBJzp68ECSMOMUi4OYXk.mYLHRI0eJiNx7QbmWk9MUC', NULL, NULL, NULL, 'consumer', NULL, '2023-09-02 08:20:34', '2023-09-02 08:20:34');

-- --------------------------------------------------------

--
-- Table structure for table `user_appliances`
--

CREATE TABLE `user_appliances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `appliance_id` bigint(20) UNSIGNED NOT NULL,
  `power_rating` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_appliances`
--

INSERT INTO `user_appliances` (`id`, `user_id`, `appliance_id`, `power_rating`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 20, '2023-09-01 10:32:14', '2023-09-01 10:32:14'),
(2, 4, 2, 30, '2023-09-01 10:34:47', '2023-09-01 10:34:47'),
(3, 4, 5, 200, '2023-09-01 11:51:56', '2023-09-01 11:51:56'),
(4, 4, 6, 50, '2023-09-01 11:52:02', '2023-09-01 11:52:02'),
(5, 4, 4, 320, '2023-09-01 11:52:10', '2023-09-01 11:52:10'),
(6, 4, 3, 45, '2023-09-01 11:52:20', '2023-09-01 11:52:20'),
(7, 6, 5, 400, '2023-09-01 11:56:37', '2023-09-01 11:56:37'),
(8, 6, 2, 5000, '2023-09-01 11:56:45', '2023-09-01 11:56:45'),
(9, 8, 7, 100, '2023-09-02 08:24:31', '2023-09-02 08:24:31'),
(10, 8, 3, 50, '2023-09-02 08:24:56', '2023-09-02 08:24:56'),
(11, 8, 4, 70, '2023-09-02 08:25:05', '2023-09-02 08:25:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appliances`
--
ALTER TABLE `appliances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `electricity_consumptions`
--
ALTER TABLE `electricity_consumptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `electricity_consumptions_user_appliance_id_foreign` (`user_appliance_id`),
  ADD KEY `electricity_consumptions_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `meters`
--
ALTER TABLE `meters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meters_user_id_foreign` (`user_id`);

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
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_appliances`
--
ALTER TABLE `user_appliances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_appliances_user_id_foreign` (`user_id`),
  ADD KEY `user_appliances_appliance_id_foreign` (`appliance_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appliances`
--
ALTER TABLE `appliances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `electricity_consumptions`
--
ALTER TABLE `electricity_consumptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meters`
--
ALTER TABLE `meters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_appliances`
--
ALTER TABLE `user_appliances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `electricity_consumptions`
--
ALTER TABLE `electricity_consumptions`
  ADD CONSTRAINT `electricity_consumptions_user_appliance_id_foreign` FOREIGN KEY (`user_appliance_id`) REFERENCES `user_appliances` (`id`),
  ADD CONSTRAINT `electricity_consumptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `meters`
--
ALTER TABLE `meters`
  ADD CONSTRAINT `meters_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_appliances`
--
ALTER TABLE `user_appliances`
  ADD CONSTRAINT `user_appliances_appliance_id_foreign` FOREIGN KEY (`appliance_id`) REFERENCES `appliances` (`id`),
  ADD CONSTRAINT `user_appliances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
