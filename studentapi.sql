-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2020 at 11:21 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studentapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_03_01_113644_create_tasks_table', 1),
(6, '2020_03_02_053953_create_students_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fathers_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` int(11) NOT NULL,
  `maritial_status` tinyint(1) NOT NULL,
  `dob` date NOT NULL,
  `blood_group` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `contact_no`, `address`, `fathers_name`, `gender`, `maritial_status`, `dob`, `blood_group`, `user_id`, `created_at`, `updated_at`) VALUES
(3, 'check ahmed', 'check@gmail.com', '01822', 'hahhahahhaha', 'Mr. Check', 2, 1, '2020-03-10', 'o+', 1, '2020-03-02 00:40:45', '2020-03-02 00:40:45'),
(4, 'check bbbbb    ahmed 22', 'check@gmail.com22', '01822_22', 'hahhahahhaha22', 'Mr. Check22', 3, 1, '2020-03-11', 'o22', 2, '2020-03-02 00:41:19', '2020-03-02 01:04:20'),
(8, 'check ahmed', 'check@gmail.com', '01822', 'hahhahahhaha', 'Mr. Check', 2, 1, '2020-03-10', 'o+', 5, '2020-03-03 05:21:36', '2020-03-03 05:21:36'),
(9, 'check ahmed', 'chfffeck@gmail.com', '01822', 'hahhahahhaha', 'Mr. Check', 2, 1, '2020-03-10', 'o+', 5, '2020-03-09 03:50:42', '2020-03-09 03:50:42'),
(10, 'check ahmed', 'chfffeck@gmail.com', '01822', 'hahhahahhaha', 'Mr. Check', 2, 1, '2020-03-10', 'o+', 5, '2020-03-09 03:51:13', '2020-03-09 03:51:13');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(2, 4, 'new task 2', 'new tasknew tasknew task 2', '2020-03-01 06:43:55', '2020-03-01 06:43:55'),
(3, 5, 'new task _ok', 'new tasknew tasknew task 2 _ok', '2020-03-01 23:20:06', '2020-03-01 23:20:06'),
(4, 1, 'Finally', 'Yes', '2020-03-01 23:20:42', '2020-03-01 23:37:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'nahid', 'nahid@gmail.com', NULL, '$2y$10$I4ENAYaX7nXwQ3m.ztdilu79DiCJ.Ir6pgjrZQm0Odq7EZYMYr6Gq', NULL, '2020-03-01 05:49:55', '2020-03-01 05:49:55'),
(2, 'nahid', 'nahid22@gmail.com', NULL, '$2y$10$gM7LLidcblzFaIjL5qVS6OEDfrJKY1cXF3DYKkR2280F4Fi4vtPDu', NULL, '2020-03-01 05:53:07', '2020-03-01 05:53:07'),
(3, 'nahid', 'nahid322@gmail.com', NULL, '$2y$10$7m222cxoUTYEV6RNlM.TDuu8iJl7BdZMQm8FqnsxfiBwTiNKuzyTu', NULL, '2020-03-01 05:55:44', '2020-03-01 05:55:44'),
(4, 'nahid', 'nahid3922@gmail.com', NULL, '$2y$10$zdPKXa3dLJXGdC4TeTN5he8NhqIrhg0ZQhOZqtOnbWqg/LZ2ZOwaW', NULL, '2020-03-01 05:57:24', '2020-03-01 05:57:24'),
(5, 'Nahid New', 'nahid_new@gmail.com', NULL, '$2y$10$UE6QwBnp5g/brZHj1SsgX.mME3gATnYE7XwE.DIVv0mgjvgL2sHkm', NULL, '2020-03-01 23:07:31', '2020-03-01 23:07:31'),
(6, 'nahid', 'nahid3d922@gmail.com', NULL, '$2y$10$x5ECidBKSYv5gb0tRt88LuJzivAuz6k70px.H9e66KuYARlteVheW', NULL, '2020-03-02 04:59:16', '2020-03-02 04:59:16'),
(7, 'nahid', 'nahid39292@gmail.com', NULL, '$2y$10$dINCrdQYOqapvoKOZv0xSegenT5sZFTils3Aul0KEdaoE0EBK8zE2', NULL, '2020-03-02 06:03:20', '2020-03-02 06:03:20'),
(8, 'nahid', 'p@gmail.com', NULL, '$2y$10$/CyCDrTv5oNEXyl6yfRtjuyyFWBV8faeHzqsI75Hnch5/mQQSxPM.', NULL, '2020-03-02 06:03:28', '2020-03-02 06:03:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
