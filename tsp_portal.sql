-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 06, 2026 at 06:25 AM
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
-- Database: `tsp_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile_number` varchar(15) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `admin_type` enum('admin','accountant','employee') NOT NULL DEFAULT 'employee' COMMENT 'admin = super admin',
  `status` enum('A','B') NOT NULL DEFAULT 'A' COMMENT 'A = Active, B = Blocked',
  `login_otp` varchar(255) DEFAULT NULL,
  `login_otp_expires_at` timestamp NULL DEFAULT NULL,
  `reset_otp` varchar(255) DEFAULT NULL,
  `reset_otp_expires_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `mobile_number`, `password`, `admin_type`, `status`, `login_otp`, `login_otp_expires_at`, `reset_otp`, `reset_otp_expires_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'madhuri@finsova.org', '1234567890', '$2y$10$JT1GFn76JFVRPxvu40uxR.1mOOBvUqbJLqfWWX1k5a9Tzxf4SbHMe', 'employee', 'A', NULL, NULL, NULL, NULL, NULL, '2025-12-20 07:27:12', '2025-12-29 08:06:49'),
(3, 'Sadmin', 'bhanu@finsova.org', '9876543210', '$2y$10$q3zZ8HjTBREjk.inaJRQI.SyIOsNY63zw2THfjdZRqGOd0dEbFhuy', 'admin', 'A', NULL, NULL, NULL, NULL, NULL, '2025-12-20 07:27:12', '2026-02-05 09:55:55');

-- --------------------------------------------------------

--
-- Table structure for table `admin_login_logs`
--

CREATE TABLE `admin_login_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `latitude` text DEFAULT NULL,
  `longitude` text DEFAULT NULL,
  `logged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_login_logs`
--

INSERT INTO `admin_login_logs` (`id`, `admin_id`, `otp`, `ip_address`, `latitude`, `longitude`, `logged_at`, `created_at`, `updated_at`) VALUES
(1, 3, '4429', '127.0.0.1', NULL, NULL, '2026-02-04 03:31:08', '2026-02-04 03:31:08', '2026-02-04 03:31:08'),
(2, 3, '1418', '127.0.0.1', NULL, NULL, '2026-02-04 04:42:43', '2026-02-04 04:42:43', '2026-02-04 04:42:43'),
(3, 3, '9859', '127.0.0.1', NULL, NULL, '2026-02-05 09:46:29', '2026-02-05 09:46:29', '2026-02-05 09:46:29'),
(4, 3, '9859', '127.0.0.1', NULL, NULL, '2026-02-05 09:55:55', '2026-02-05 09:55:55', '2026-02-05 09:55:55');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_details`
--

CREATE TABLE `company_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `company_type` enum('private_limited','one_person_company','limited_liability_partnership','public_limited') NOT NULL DEFAULT 'private_limited',
  `gst_no` varchar(20) DEFAULT NULL,
  `gst_image` longtext DEFAULT NULL,
  `address` text DEFAULT NULL,
  `cin` varchar(25) DEFAULT NULL,
  `cin_image` longtext DEFAULT NULL,
  `pan` varchar(20) DEFAULT NULL,
  `pan_image` longtext DEFAULT NULL,
  `udhyam_number` varchar(30) DEFAULT NULL,
  `udhyam_image` longtext DEFAULT NULL,
  `moa_image` longtext DEFAULT NULL,
  `br_image` longtext DEFAULT NULL,
  `director_name` varchar(100) NOT NULL,
  `director_email` varchar(255) NOT NULL,
  `director_mobile` varchar(15) NOT NULL,
  `director_aadhar_no` varchar(20) NOT NULL,
  `director_aadhar_image` longtext NOT NULL,
  `director_pan_no` varchar(20) NOT NULL,
  `director_pan_image` longtext NOT NULL,
  `docs` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fund_requests`
--

CREATE TABLE `fund_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `request_id` varchar(150) NOT NULL,
  `wallet_txn_id` varchar(255) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `sender_account_number` varchar(255) NOT NULL,
  `company_account_number` varchar(255) NOT NULL,
  `transaction_utr` varchar(255) NOT NULL,
  `mode` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` enum('A','R','P') NOT NULL DEFAULT 'P',
  `source` varchar(55) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fund_requests`
--

INSERT INTO `fund_requests` (`id`, `user_id`, `request_id`, `wallet_txn_id`, `amount`, `sender_account_number`, `company_account_number`, `transaction_utr`, `mode`, `remark`, `description`, `status`, `source`, `created_at`, `updated_at`) VALUES
(2, 2, 'FUNDR5890719', 'FUNDR5890719', 100.00, '12341241412', '12341241412', '123455667', 'IMPS', 'test/1-portaladmin/rejected', 'test', 'A', 'Webhook', '2025-08-05 18:58:33', '2026-02-05 12:32:03');

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_12_16_131120_create_users_table', 2),
(5, '2025_12_16_152237_create_admins_table', 2),
(6, '2025_12_17_060009_create_company_details_table', 3),
(7, '2025_12_17_080942_create_user_services_table', 4),
(8, '2025_12_17_081855_create_user_api_keys_table', 4),
(9, '2025_12_17_160223_create_company_details_table', 5),
(10, '2026_01_02_075300_create_user_login_logs_table', 6),
(11, '2026_01_02_093727_create_admin_login_logs_table', 6);

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
-- Table structure for table `payin_transactions`
--

CREATE TABLE `payin_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `txn_id` varchar(100) NOT NULL,
  `payer_name` varchar(255) DEFAULT NULL,
  `transfer_mode` varchar(50) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT 0.00,
  `charge_amount` decimal(15,2) DEFAULT 0.00,
  `gst_amount` decimal(15,2) DEFAULT 0.00,
  `total_charge` decimal(15,2) DEFAULT 0.00,
  `total_amount` decimal(15,2) DEFAULT 0.00,
  `status` varchar(20) DEFAULT 'P',
  `payment_status` varchar(50) DEFAULT NULL,
  `api_payment_status` varchar(50) DEFAULT NULL,
  `api` varchar(100) DEFAULT NULL,
  `api_txn_id` varchar(100) DEFAULT NULL,
  `utr` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `response_message` text DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payout_transactions`
--

CREATE TABLE `payout_transactions` (
  `id` int(11) NOT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `txn_id` varchar(50) DEFAULT NULL,
  `bene_account` varchar(50) DEFAULT NULL,
  `bene_ifsc` varchar(20) DEFAULT NULL,
  `bene_name` varchar(200) DEFAULT NULL,
  `transfer_mode` varchar(20) DEFAULT NULL,
  `amount` varchar(20) DEFAULT NULL,
  `charge_amount` decimal(20,2) DEFAULT NULL,
  `gst_amount` decimal(20,2) DEFAULT NULL,
  `total_charge` decimal(20,2) DEFAULT NULL,
  `total_amount` decimal(20,2) DEFAULT NULL,
  `status` enum('P','S','F','R','Q') NOT NULL DEFAULT 'P',
  `payment_status` enum('P','S','F') NOT NULL DEFAULT 'P',
  `api_payment_status` enum('P','S') DEFAULT 'P',
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(200) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(200) DEFAULT NULL,
  `processed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `processed_by` varchar(255) DEFAULT NULL,
  `api` varchar(200) DEFAULT NULL,
  `api_txn_id` varchar(50) DEFAULT NULL,
  `utr` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `response_message` varchar(500) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uid` varchar(4) NOT NULL,
  `company_name` varchar(150) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `mobile_number` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` enum('A','B') NOT NULL DEFAULT 'A' COMMENT 'A = Active, B = Blocked',
  `login_otp` varchar(255) DEFAULT NULL,
  `login_otp_expires_at` timestamp NULL DEFAULT NULL,
  `reset_otp` varchar(255) DEFAULT NULL,
  `reset_otp_expires_at` timestamp NULL DEFAULT NULL,
  `payout_balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payin_balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `reserve_balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `freeze_balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `virtual_balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_virtual_accounts`
--

CREATE TABLE `users_virtual_accounts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `virtual_account_id` varchar(50) NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `receiver_id` varchar(50) DEFAULT NULL,
  `entity` varchar(50) DEFAULT NULL,
  `status` enum('A','B') DEFAULT 'A',
  `bank_name` varchar(100) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `ifsc` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_on` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_api_keys`
--

CREATE TABLE `user_api_keys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_key` longtext DEFAULT NULL,
  `client_secret` longtext DEFAULT NULL,
  `payin_webhooks` text DEFAULT NULL,
  `payout_webhooks` text DEFAULT NULL,
  `ip` text DEFAULT NULL COMMENT 'comma separated whitelisted ips',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_login_logs`
--

CREATE TABLE `user_login_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `latitude` text DEFAULT NULL,
  `longitude` text DEFAULT NULL,
  `logged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_services`
--

CREATE TABLE `user_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `payout_status` enum('A','B') NOT NULL DEFAULT 'B' COMMENT 'A = Active, B = Blocked',
  `minimum_transaction` decimal(15,2) NOT NULL DEFAULT 100.00,
  `maximum_transaction` decimal(15,2) NOT NULL DEFAULT 49999.00,
  `ftransaction` enum('A','B','C') NOT NULL DEFAULT 'B' COMMENT 'A = Allow, B = Block, C = Conditional',
  `payin_status` enum('A','B') NOT NULL DEFAULT 'B' COMMENT 'A = Active, B = Blocked',
  `payin_minimum_transaction` decimal(15,2) NOT NULL DEFAULT 100.00,
  `payin_maximum_transaction` decimal(15,2) NOT NULL DEFAULT 49999.00,
  `ptransaction` enum('A','B','C') NOT NULL DEFAULT 'B' COMMENT 'A = Allow, B = Block, C = Conditional',
  `virtual_charges` decimal(15,2) NOT NULL DEFAULT 1.00,
  `virtual_type` enum('percentage','flat_rate') NOT NULL DEFAULT 'percentage',
  `pslab_1000` decimal(15,2) NOT NULL DEFAULT 5.00,
  `pslab_25000` decimal(15,2) NOT NULL DEFAULT 7.00,
  `pslab_200000` decimal(15,2) NOT NULL DEFAULT 15.00,
  `pslab_percentage` decimal(15,2) NOT NULL DEFAULT 7.00,
  `payin_charges` decimal(15,2) NOT NULL DEFAULT 2.00,
  `active_payout_api` varchar(255) DEFAULT NULL,
  `active_payin_api` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_virtual_beneficiaries`
--

CREATE TABLE `user_virtual_beneficiaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `bene_name` varchar(255) NOT NULL,
  `bene_account` varchar(255) NOT NULL,
  `bene_ifsc` varchar(255) NOT NULL,
  `bene_email` varchar(255) NOT NULL,
  `bene_mobile` varchar(255) NOT NULL,
  `bene_proof_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_wallet_transactions`
--

CREATE TABLE `user_wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `refid` varchar(255) DEFAULT NULL,
  `opening_balance` decimal(20,2) NOT NULL DEFAULT 0.00,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `total_charge` decimal(20,2) NOT NULL DEFAULT 0.00,
  `total_amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `closing_balance` decimal(20,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(20,2) NOT NULL DEFAULT 0.00,
  `debit` decimal(20,2) NOT NULL DEFAULT 0.00,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_mobile_number_unique` (`mobile_number`);

--
-- Indexes for table `admin_login_logs`
--
ALTER TABLE `admin_login_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_login_logs_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `company_details`
--
ALTER TABLE `company_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_details_director_mobile_unique` (`director_mobile`),
  ADD UNIQUE KEY `company_details_gst_no_unique` (`gst_no`),
  ADD UNIQUE KEY `company_details_cin_unique` (`cin`),
  ADD UNIQUE KEY `company_details_pan_unique` (`pan`),
  ADD UNIQUE KEY `company_details_udhyam_number_unique` (`udhyam_number`),
  ADD KEY `company_details_user_id_foreign` (`user_id`),
  ADD KEY `company_details_director_email_index` (`director_email`);

--
-- Indexes for table `fund_requests`
--
ALTER TABLE `fund_requests`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `payin_transactions`
--
ALTER TABLE `payin_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `txn_id` (`txn_id`),
  ADD KEY `status` (`status`),
  ADD KEY `api_txn_id` (`api_txn_id`);

--
-- Indexes for table `payout_transactions`
--
ALTER TABLE `payout_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_uid_unique` (`uid`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_number_unique` (`mobile_number`);

--
-- Indexes for table `users_virtual_accounts`
--
ALTER TABLE `users_virtual_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_api_keys`
--
ALTER TABLE `user_api_keys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_api_keys_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_login_logs`
--
ALTER TABLE `user_login_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_login_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_services`
--
ALTER TABLE `user_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_services_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_virtual_beneficiaries`
--
ALTER TABLE `user_virtual_beneficiaries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_virtual_beneficiaries_user_id` (`user_id`);

--
-- Indexes for table `user_wallet_transactions`
--
ALTER TABLE `user_wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_login_logs`
--
ALTER TABLE `admin_login_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `company_details`
--
ALTER TABLE `company_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fund_requests`
--
ALTER TABLE `fund_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `payin_transactions`
--
ALTER TABLE `payin_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payout_transactions`
--
ALTER TABLE `payout_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_virtual_accounts`
--
ALTER TABLE `users_virtual_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_api_keys`
--
ALTER TABLE `user_api_keys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_login_logs`
--
ALTER TABLE `user_login_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_services`
--
ALTER TABLE `user_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_virtual_beneficiaries`
--
ALTER TABLE `user_virtual_beneficiaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_wallet_transactions`
--
ALTER TABLE `user_wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_login_logs`
--
ALTER TABLE `admin_login_logs`
  ADD CONSTRAINT `admin_login_logs_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `company_details`
--
ALTER TABLE `company_details`
  ADD CONSTRAINT `company_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_api_keys`
--
ALTER TABLE `user_api_keys`
  ADD CONSTRAINT `user_api_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_login_logs`
--
ALTER TABLE `user_login_logs`
  ADD CONSTRAINT `user_login_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_services`
--
ALTER TABLE `user_services`
  ADD CONSTRAINT `user_services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_virtual_beneficiaries`
--
ALTER TABLE `user_virtual_beneficiaries`
  ADD CONSTRAINT `fk_uvb_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
