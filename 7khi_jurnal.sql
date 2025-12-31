-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 31, 2025 at 12:22 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `7khi_jurnal`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `title`, `icon`, `color`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Bangun Pagi', '☀️', 'bg-orange-100', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(2, 'Beribadah', '🤲', 'bg-blue-100', 2, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(3, 'Berolahraga', '⚽', 'bg-green-100', 3, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(4, 'Gemar Belajar', '📚', 'bg-yellow-100', 4, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(5, 'Makan Makanan Sehat dan Bergizi', '🍎', 'bg-pink-100', 5, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(6, 'Bermasyarakat', '👨‍👩‍👧‍👦', 'bg-purple-100', 6, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(7, 'Tidur Cepat', '🌙', 'bg-indigo-100', 7, '2025-12-31 08:49:36', '2025-12-31 08:49:36');

-- --------------------------------------------------------

--
-- Table structure for table `activity_submissions`
--

CREATE TABLE `activity_submissions` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `activity_id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `approved_by` bigint UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `rejection_reason` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_submissions`
--

INSERT INTO `activity_submissions` (`id`, `student_id`, `activity_id`, `date`, `time`, `photo`, `notes`, `status`, `approved_by`, `approved_at`, `rejection_reason`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-12-17', '15:49:37', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(2, 1, 2, '2025-12-17', '15:49:37', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:37', NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(3, 1, 3, '2025-12-17', '15:49:37', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:37', NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(4, 1, 6, '2025-12-17', '15:49:37', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(5, 1, 1, '2025-12-18', '15:49:37', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(6, 1, 3, '2025-12-18', '15:49:37', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:37', NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(7, 1, 4, '2025-12-18', '15:49:37', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(8, 1, 5, '2025-12-18', '15:49:37', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:37', NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(9, 1, 1, '2025-12-19', '15:49:37', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(10, 1, 4, '2025-12-19', '15:49:37', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:37', NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(11, 1, 5, '2025-12-19', '15:49:37', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(12, 1, 6, '2025-12-19', '15:49:37', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(13, 1, 7, '2025-12-19', '15:49:37', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(14, 1, 3, '2025-12-20', '15:49:37', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:37', NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(15, 1, 6, '2025-12-20', '15:49:37', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:37', NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(16, 1, 7, '2025-12-20', '15:49:37', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:37', NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(17, 1, 1, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(18, 1, 2, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(19, 1, 3, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(20, 1, 4, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(21, 1, 6, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(22, 1, 2, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(23, 1, 4, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(24, 1, 5, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(25, 1, 7, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(26, 1, 1, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(27, 1, 4, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(28, 1, 7, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(29, 1, 1, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(30, 1, 2, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(31, 1, 3, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(32, 1, 5, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(33, 1, 7, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(34, 1, 1, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(35, 1, 3, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(36, 1, 4, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(37, 1, 7, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(38, 1, 2, '2025-12-26', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(39, 1, 3, '2025-12-26', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(40, 1, 4, '2025-12-26', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(41, 1, 3, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(42, 1, 4, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(43, 1, 5, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(44, 1, 6, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(45, 1, 7, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(46, 1, 3, '2025-12-28', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(47, 1, 5, '2025-12-28', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(48, 1, 7, '2025-12-28', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(49, 1, 1, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(50, 1, 3, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(51, 1, 4, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(52, 1, 5, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(53, 1, 6, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(54, 1, 1, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(55, 1, 4, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(56, 1, 5, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(57, 1, 6, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(58, 1, 7, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(59, 1, 3, '2025-12-31', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(60, 1, 4, '2025-12-31', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(61, 1, 7, '2025-12-31', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(62, 2, 1, '2025-12-17', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(63, 2, 4, '2025-12-17', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(64, 2, 6, '2025-12-17', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(65, 2, 7, '2025-12-17', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(66, 2, 3, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(67, 2, 5, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(68, 2, 7, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(69, 2, 1, '2025-12-19', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(70, 2, 5, '2025-12-19', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(71, 2, 7, '2025-12-19', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(72, 2, 3, '2025-12-20', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(73, 2, 4, '2025-12-20', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(74, 2, 6, '2025-12-20', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(75, 2, 7, '2025-12-20', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(76, 2, 1, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(77, 2, 2, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(78, 2, 5, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(79, 2, 6, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(80, 2, 2, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(81, 2, 6, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(82, 2, 7, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(83, 2, 1, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(84, 2, 3, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(85, 2, 4, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(86, 2, 6, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(87, 2, 7, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(88, 2, 1, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(89, 2, 3, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(90, 2, 5, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(91, 2, 6, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(92, 2, 1, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(93, 2, 2, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(94, 2, 4, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(95, 2, 6, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(96, 2, 7, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(97, 2, 2, '2025-12-26', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(98, 2, 5, '2025-12-26', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(99, 2, 7, '2025-12-26', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(100, 2, 2, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(101, 2, 3, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(102, 2, 6, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(103, 2, 7, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(104, 2, 5, '2025-12-28', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(105, 2, 6, '2025-12-28', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(106, 2, 7, '2025-12-28', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(107, 2, 2, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(108, 2, 4, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(109, 2, 5, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(110, 2, 7, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(111, 2, 2, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(112, 2, 3, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(113, 2, 5, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(114, 2, 6, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(115, 2, 7, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(116, 2, 1, '2025-12-31', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(117, 2, 4, '2025-12-31', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(118, 2, 7, '2025-12-31', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(119, 3, 1, '2025-12-17', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(120, 3, 6, '2025-12-17', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(121, 3, 7, '2025-12-17', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(122, 3, 3, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(123, 3, 4, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(124, 3, 5, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(125, 3, 6, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(126, 3, 7, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(127, 3, 1, '2025-12-19', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(128, 3, 2, '2025-12-19', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(129, 3, 3, '2025-12-19', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(130, 3, 4, '2025-12-20', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(131, 3, 6, '2025-12-20', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(132, 3, 7, '2025-12-20', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(133, 3, 1, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(134, 3, 2, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(135, 3, 7, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(136, 3, 1, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(137, 3, 5, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(138, 3, 7, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(139, 3, 1, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(140, 3, 5, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(141, 3, 7, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(142, 3, 1, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(143, 3, 3, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(144, 3, 7, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(145, 3, 2, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(146, 3, 4, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(147, 3, 5, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(148, 3, 6, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(149, 3, 7, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(150, 3, 3, '2025-12-26', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(151, 3, 4, '2025-12-26', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(152, 3, 5, '2025-12-26', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(153, 3, 6, '2025-12-26', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(154, 3, 1, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(155, 3, 3, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(156, 3, 5, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(157, 3, 7, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(158, 3, 2, '2025-12-28', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(159, 3, 4, '2025-12-28', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(160, 3, 5, '2025-12-28', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(161, 3, 6, '2025-12-28', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(162, 3, 7, '2025-12-28', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(163, 3, 1, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(164, 3, 2, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(165, 3, 3, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(166, 3, 5, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(167, 3, 7, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(168, 3, 1, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(169, 3, 3, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(170, 3, 6, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(171, 3, 7, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(172, 3, 1, '2025-12-31', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(173, 3, 2, '2025-12-31', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(174, 3, 5, '2025-12-31', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(175, 4, 1, '2025-12-17', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(176, 4, 2, '2025-12-17', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(177, 4, 6, '2025-12-17', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(178, 4, 3, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(179, 4, 4, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(180, 4, 6, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(181, 4, 7, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(182, 4, 1, '2025-12-19', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(183, 4, 4, '2025-12-19', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(184, 4, 5, '2025-12-19', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(185, 4, 6, '2025-12-19', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(186, 4, 7, '2025-12-19', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(187, 4, 1, '2025-12-20', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(188, 4, 2, '2025-12-20', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(189, 4, 3, '2025-12-20', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(190, 4, 5, '2025-12-20', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(191, 4, 7, '2025-12-20', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(192, 4, 2, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(193, 4, 3, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(194, 4, 4, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(195, 4, 6, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(196, 4, 7, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(197, 4, 1, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(198, 4, 2, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(199, 4, 4, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(200, 4, 1, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(201, 4, 2, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(202, 4, 5, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(203, 4, 6, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(204, 4, 7, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(205, 4, 1, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(206, 4, 2, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(207, 4, 4, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(208, 4, 6, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(209, 4, 1, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(210, 4, 5, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(211, 4, 6, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(212, 4, 2, '2025-12-26', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(213, 4, 5, '2025-12-26', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(214, 4, 6, '2025-12-26', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(215, 4, 7, '2025-12-26', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(216, 4, 1, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(217, 4, 3, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(218, 4, 4, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(219, 4, 1, '2025-12-28', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(220, 4, 5, '2025-12-28', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(221, 4, 7, '2025-12-28', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(222, 4, 4, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(223, 4, 5, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(224, 4, 7, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(225, 4, 4, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(226, 4, 6, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(227, 4, 7, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(228, 4, 1, '2025-12-31', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(229, 4, 4, '2025-12-31', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(230, 4, 5, '2025-12-31', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(231, 4, 6, '2025-12-31', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(232, 5, 2, '2025-12-17', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(233, 5, 3, '2025-12-17', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(234, 5, 4, '2025-12-17', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(235, 5, 5, '2025-12-17', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(236, 5, 7, '2025-12-17', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(237, 5, 2, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(238, 5, 4, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(239, 5, 6, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(240, 5, 7, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(241, 5, 2, '2025-12-19', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(242, 5, 3, '2025-12-19', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(243, 5, 4, '2025-12-19', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(244, 5, 5, '2025-12-19', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(245, 5, 2, '2025-12-20', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(246, 5, 4, '2025-12-20', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(247, 5, 5, '2025-12-20', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(248, 5, 1, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(249, 5, 3, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(250, 5, 4, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(251, 5, 5, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(252, 5, 6, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(253, 5, 1, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(254, 5, 2, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(255, 5, 3, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(256, 5, 4, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(257, 5, 1, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(258, 5, 2, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(259, 5, 3, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(260, 5, 5, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(261, 5, 6, '2025-12-23', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(262, 5, 1, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(263, 5, 2, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(264, 5, 4, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(265, 5, 6, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(266, 5, 7, '2025-12-24', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(267, 5, 5, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(268, 5, 6, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(269, 5, 7, '2025-12-25', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(270, 5, 1, '2025-12-26', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(271, 5, 2, '2025-12-26', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(272, 5, 4, '2025-12-26', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(273, 5, 7, '2025-12-26', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(274, 5, 3, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(275, 5, 4, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(276, 5, 5, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(277, 5, 6, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(278, 5, 7, '2025-12-27', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(279, 5, 1, '2025-12-28', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(280, 5, 2, '2025-12-28', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(281, 5, 5, '2025-12-28', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(282, 5, 6, '2025-12-28', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(283, 5, 7, '2025-12-28', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(284, 5, 1, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(285, 5, 2, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(286, 5, 4, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(287, 5, 6, '2025-12-29', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(288, 5, 3, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(289, 5, 5, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(290, 5, 6, '2025-12-30', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(291, 5, 1, '2025-12-31', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(292, 5, 2, '2025-12-31', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(293, 5, 4, '2025-12-31', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(294, 5, 5, '2025-12-31', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(295, 5, 6, '2025-12-31', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(296, 6, 2, '2025-12-17', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(297, 6, 3, '2025-12-17', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(298, 6, 4, '2025-12-17', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(299, 6, 5, '2025-12-17', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(300, 6, 1, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(301, 6, 4, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(302, 6, 6, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(303, 6, 7, '2025-12-18', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(304, 6, 3, '2025-12-19', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(305, 6, 5, '2025-12-19', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(306, 6, 6, '2025-12-19', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(307, 6, 2, '2025-12-20', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(308, 6, 3, '2025-12-20', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(309, 6, 5, '2025-12-20', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(310, 6, 6, '2025-12-20', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(311, 6, 1, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(312, 6, 2, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(313, 6, 4, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(314, 6, 5, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(315, 6, 6, '2025-12-21', '15:49:38', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(316, 6, 1, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(317, 6, 2, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(318, 6, 3, '2025-12-22', '15:49:38', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:38', NULL, '2025-12-31 08:49:38', '2025-12-31 08:49:38'),
(319, 6, 1, '2025-12-23', '15:49:39', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:39', NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(320, 6, 2, '2025-12-23', '15:49:39', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(321, 6, 3, '2025-12-23', '15:49:39', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:39', NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39');
INSERT INTO `activity_submissions` (`id`, `student_id`, `activity_id`, `date`, `time`, `photo`, `notes`, `status`, `approved_by`, `approved_at`, `rejection_reason`, `created_at`, `updated_at`) VALUES
(322, 6, 6, '2025-12-23', '15:49:39', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(323, 6, 7, '2025-12-23', '15:49:39', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:39', NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(324, 6, 1, '2025-12-24', '15:49:39', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:39', NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(325, 6, 2, '2025-12-24', '15:49:39', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:39', NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(326, 6, 5, '2025-12-24', '15:49:39', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(327, 6, 1, '2025-12-25', '15:49:39', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(328, 6, 6, '2025-12-25', '15:49:39', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(329, 6, 7, '2025-12-25', '15:49:39', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(330, 6, 2, '2025-12-26', '15:49:39', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:39', NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(331, 6, 3, '2025-12-26', '15:49:39', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:39', NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(332, 6, 4, '2025-12-26', '15:49:39', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:39', NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(333, 6, 6, '2025-12-26', '15:49:39', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:39', NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(334, 6, 7, '2025-12-26', '15:49:39', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(335, 6, 3, '2025-12-27', '15:49:39', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(336, 6, 4, '2025-12-27', '15:49:39', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(337, 6, 5, '2025-12-27', '15:49:39', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(338, 6, 1, '2025-12-28', '15:49:39', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:39', NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(339, 6, 2, '2025-12-28', '15:49:39', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(340, 6, 4, '2025-12-28', '15:49:39', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:39', NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(341, 6, 5, '2025-12-28', '15:49:39', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:39', NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(342, 6, 7, '2025-12-28', '15:49:39', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(343, 6, 1, '2025-12-29', '15:49:39', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:39', NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(344, 6, 2, '2025-12-29', '15:49:39', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:39', NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(345, 6, 5, '2025-12-29', '15:49:39', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(346, 6, 7, '2025-12-29', '15:49:39', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(347, 6, 3, '2025-12-30', '15:49:39', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:39', NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(348, 6, 4, '2025-12-30', '15:49:39', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:39', NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(349, 6, 6, '2025-12-30', '15:49:39', NULL, 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:39', NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(350, 6, 7, '2025-12-30', '15:49:39', NULL, 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(351, 6, 2, '2025-12-31', '15:49:39', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(352, 6, 3, '2025-12-31', '15:49:39', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:39', NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(353, 6, 6, '2025-12-31', '15:49:39', 'photos/sample.jpg', 'Catatan kegiatan ', 'pending', NULL, NULL, NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39'),
(354, 6, 7, '2025-12-31', '15:49:39', 'photos/sample.jpg', 'Catatan kegiatan ', 'approved', 1, '2025-12-31 08:49:39', NULL, '2025-12-31 08:49:39', '2025-12-31 08:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `bangun_pagi_details`
--

CREATE TABLE `bangun_pagi_details` (
  `id` bigint UNSIGNED NOT NULL,
  `submission_id` bigint UNSIGNED NOT NULL,
  `jam_bangun` time DEFAULT NULL,
  `membereskan_tempat_tidur` tinyint(1) NOT NULL DEFAULT '0',
  `mandi` tinyint(1) NOT NULL DEFAULT '0',
  `berpakaian_rapi` tinyint(1) NOT NULL DEFAULT '0',
  `sarapan` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beribadah_details`
--

CREATE TABLE `beribadah_details` (
  `id` bigint UNSIGNED NOT NULL,
  `submission_id` bigint UNSIGNED NOT NULL,
  `subuh` tinyint(1) NOT NULL DEFAULT '0',
  `dzuhur` tinyint(1) NOT NULL DEFAULT '0',
  `ashar` tinyint(1) NOT NULL DEFAULT '0',
  `maghrib` tinyint(1) NOT NULL DEFAULT '0',
  `isya` tinyint(1) NOT NULL DEFAULT '0',
  `mengaji` tinyint(1) NOT NULL DEFAULT '0',
  `berdoa` tinyint(1) NOT NULL DEFAULT '0',
  `bersedekah` tinyint(1) NOT NULL DEFAULT '0',
  `lainnya` tinyint(1) NOT NULL DEFAULT '0',
  `doa_pagi` tinyint(1) NOT NULL DEFAULT '0',
  `baca_firman` tinyint(1) NOT NULL DEFAULT '0',
  `renungan` tinyint(1) NOT NULL DEFAULT '0',
  `doa_malam` tinyint(1) NOT NULL DEFAULT '0',
  `ibadah_bersama` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bermasyarakat_details`
--

CREATE TABLE `bermasyarakat_details` (
  `id` bigint UNSIGNED NOT NULL,
  `submission_id` bigint UNSIGNED NOT NULL,
  `tarka` tinyint(1) NOT NULL DEFAULT '0',
  `kerja_bakti` tinyint(1) NOT NULL DEFAULT '0',
  `gotong_royong` tinyint(1) NOT NULL DEFAULT '0',
  `lainnya` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `berolahraga_details`
--

CREATE TABLE `berolahraga_details` (
  `id` bigint UNSIGNED NOT NULL,
  `submission_id` bigint UNSIGNED NOT NULL,
  `waktu_berolahraga` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exercise_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `berolahraga` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `biodata_siswa`
--

CREATE TABLE `biodata_siswa` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `hobi` text COLLATE utf8mb4_unicode_ci,
  `cita_cita` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `makanan_kesukaan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minuman_kesukaan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hewan_kesukaan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sesuatu_tidak_suka` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `biodata_siswa`
--

INSERT INTO `biodata_siswa` (`id`, `student_id`, `hobi`, `cita_cita`, `makanan_kesukaan`, `minuman_kesukaan`, `hewan_kesukaan`, `sesuatu_tidak_suka`, `created_at`, `updated_at`) VALUES
(1, 1, 'Bermain Bola', 'Insinyur', 'Rendang', 'Teh Manis', 'Anjing', 'Gelap', '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(2, 2, 'Menggambar', 'Pilot', 'Nasi Goreng', 'Teh Manis', 'Burung', 'Gelap', '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(3, 3, 'Bermain Game', 'Guru', 'Bakso', 'Air Mineral', 'Kelinci', 'Berisik', '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(4, 4, 'Bermain Game', 'Polisi', 'Rendang', 'Teh Manis', 'Kucing', 'Sayur pahit', '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(5, 5, 'Bermain Bola', 'Pilot', 'Bakso', 'Jus Mangga', 'Kelinci', 'Berisik', '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(6, 6, 'Bernyanyi', 'Guru', 'Nasi Goreng', 'Teh Manis', 'Burung', 'Ketinggian', '2025-12-31 08:49:37', '2025-12-31 08:49:37');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-1b319e77b1a887bc3f77181c2d4a6664', 'i:1;', 1767171203),
('laravel-cache-1b319e77b1a887bc3f77181c2d4a6664:timer', 'i:1767171203;', 1767171203),
('laravel-cache-6dd9487425acc80d0147c8f84a00f11a', 'i:1;', 1767171234),
('laravel-cache-6dd9487425acc80d0147c8f84a00f11a:timer', 'i:1767171234;', 1767171234),
('laravel-cache-c6bbba1f44196bffd7353335e11a6427', 'i:3;', 1767171269),
('laravel-cache-c6bbba1f44196bffd7353335e11a6427:timer', 'i:1767171269;', 1767171269),
('laravel-cache-c6be2cf7c13d9a527ee2fe401bbae3c7', 'i:2;', 1767171305),
('laravel-cache-c6be2cf7c13d9a527ee2fe401bbae3c7:timer', 'i:1767171305;', 1767171305),
('laravel-cache-da4b9237bacccdf19c0760cab7aec4a8359010b0', 'i:1;', 1767171290),
('laravel-cache-da4b9237bacccdf19c0760cab7aec4a8359010b0:timer', 'i:1767171290;', 1767171290),
('laravel-cache-nuraini|127.0.0.1', 'i:3;', 1767171305),
('laravel-cache-nuraini|127.0.0.1:timer', 'i:1767171305;', 1767171305),
('laravel-cache-panitia|127.0.0.1', 'i:1;', 1767171203),
('laravel-cache-panitia|127.0.0.1:timer', 'i:1767171203;', 1767171203);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade` int NOT NULL,
  `section` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_id` bigint UNSIGNED DEFAULT NULL,
  `academic_year` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `name`, `grade`, `section`, `teacher_id`, `academic_year`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '7A', 7, 'A', 2, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(2, '7B', 7, 'B', 2, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(3, '7C', 7, 'C', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(4, '7D', 7, 'D', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(5, '7E', 7, 'E', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(6, '7F', 7, 'F', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(7, '7G', 7, 'G', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(8, '7H', 7, 'H', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(9, '7I', 7, 'I', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(10, '7J', 7, 'J', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(11, '8A', 8, 'A', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(12, '8B', 8, 'B', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(13, '8C', 8, 'C', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(14, '8D', 8, 'D', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(15, '8E', 8, 'E', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(16, '8F', 8, 'F', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(17, '8G', 8, 'G', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(18, '8H', 8, 'H', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(19, '8I', 8, 'I', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(20, '8J', 8, 'J', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(21, '9A', 9, 'A', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(22, '9B', 9, 'B', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(23, '9C', 9, 'C', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(24, '9D', 9, 'D', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(25, '9E', 9, 'E', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(26, '9F', 9, 'F', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(27, '9G', 9, 'G', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(28, '9H', 9, 'H', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(29, '9I', 9, 'I', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(30, '9J', 9, 'J', NULL, '2025/2026', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36');

-- --------------------------------------------------------

--
-- Table structure for table `gemar_belajar_details`
--

CREATE TABLE `gemar_belajar_details` (
  `id` bigint UNSIGNED NOT NULL,
  `submission_id` bigint UNSIGNED NOT NULL,
  `gemar_belajar` tinyint(1) NOT NULL DEFAULT '0',
  `ekstrakurikuler` tinyint(1) NOT NULL DEFAULT '0',
  `bimbingan_belajar` tinyint(1) NOT NULL DEFAULT '0',
  `mengerjakan_tugas` tinyint(1) NOT NULL DEFAULT '0',
  `lainnya` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `makan_sehat_details`
--

CREATE TABLE `makan_sehat_details` (
  `id` bigint UNSIGNED NOT NULL,
  `submission_id` bigint UNSIGNED NOT NULL,
  `karbohidrat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `protein` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sayur` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buah` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_16_135119_create_activities_table', 1),
(5, '2025_12_01_155433_create_classes_table', 1),
(6, '2025_12_01_155444_create_students_table', 1),
(7, '2025_12_01_155455_create_parents_table', 1),
(8, '2025_12_01_155513_create_parent_student_table', 1),
(9, '2025_12_01_155520_create_teachers_table', 1),
(10, '2025_12_01_155534_create_activity_submissions_table', 1),
(11, '2025_12_01_155547_create_activity_details_table', 1),
(12, '2025_12_01_155559_create_biodata_siswa_table', 1),
(13, '2025_12_01_155617_create_progress_tracking_table', 1),
(14, '2025_12_05_041505_create_separate_activity_details_tables', 1),
(15, '2025_12_05_042036_migrate_data_to_separate_detail_tables', 1),
(16, '2025_12_08_134809_modify_makan_sehat_details_table_structure', 1),
(17, '2025_12_08_144710_change_makan_sehat_details_to_string', 1),
(18, '2025_12_08_151024_add_checkbox_fields_to_bermasyarakat_details_table', 1),
(19, '2025_12_09_fix_bangun_pagi_columns', 1),
(20, '2025_12_10_120240_fix_bangun_pagi_details_column_names', 1),
(21, '2025_12_10_add_berolahraga_checkbox_to_berolahraga_details', 1),
(22, '2025_12_10_fix_bermasyarakat_details_columns', 1),
(23, '2025_12_10_fix_berolahraga_details_columns', 1),
(24, '2025_12_10_fix_gemar_belajar_details_columns', 1),
(25, '2025_12_10_fix_tidur_cepat_details_columns', 1),
(26, '2025_12_17_000000_add_exercise_type_to_berolahraga_details', 1),
(27, '2025_12_19_120000_move_password_reset_tokens_and_drop_email', 1),
(28, '2025_12_20_114006_add_class_id_to_parents_table', 1),
(29, '2025_12_28_140000_cleanup_unused_database_columns', 1),
(30, '2025_12_28_214900_final_cleanup_unused_columns', 1),
(31, '2025_12_28_220100_remove_religion_from_students', 1),
(32, '2025_12_28_221700_drop_progress_tracking_table', 1),
(33, '2025_12_28_222200_drop_queue_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `occupation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`id`, `user_id`, `class_id`, `phone`, `address`, `occupation`, `created_at`, `updated_at`) VALUES
(1, 3, NULL, '081234567890', 'Jl. Keluarga No. 111, Bandung', 'Wiraswasta', '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(2, 12, NULL, '081234567891', 'Jl. Sejahtera No. 222, Bandung', 'PNS', '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(3, 13, NULL, '081234567892', 'Jl. Makmur No. 333, Bandung', 'Guru', '2025-12-31 08:49:37', '2025-12-31 08:49:37');

-- --------------------------------------------------------

--
-- Table structure for table `parent_student`
--

CREATE TABLE `parent_student` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `relationship` enum('ayah','ibu','wali') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parent_student`
--

INSERT INTO `parent_student` (`id`, `parent_id`, `student_id`, `relationship`, `is_primary`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'ayah', 1, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(2, 1, 2, 'ibu', 0, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(3, 1, 3, 'wali', 0, '2025-12-31 08:49:37', '2025-12-31 08:49:37');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0kAY0UFxPBev5JF6NQYLPegKs0s4Y7Z7Lxf3eVbm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiV01uSm1td0c4eU9IbHVNa3ZqVDcxdXVIanNUTUhuRkpoTXBCdWk2SCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNjoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2d1cnUvZGFzaGJvYXJkIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767181409),
('MVMWfuLVkl16ukuNo08rd40V1ElGozhvtiBDc2M0', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidGE4N3FlUG5lRU9yTmxyeE1XT3RvNHJxd1FDNENOTWpIRWxKTDlDNSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czo0NzoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2d1cnUvZGFzaGJvYXJkP2NsYXNzX2lkPTEiO3M6NToicm91dGUiO3M6MTQ6Imd1cnUuZGFzaGJvYXJkIjt9fQ==', 1767183173);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `nis` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nisn` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_id` bigint UNSIGNED DEFAULT NULL,
  `gender` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `nis`, `nisn`, `class_id`, `gender`, `date_of_birth`, `address`, `photo`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 4, '2025000001', '0012345678', 1, 'L', '2013-05-15', 'Jl. Merdeka No. 123, Bandung', NULL, 1, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(2, 5, '2025000002', '0012345679', 1, 'P', '2013-08-20', 'Jl. Sudirman No. 456, Bandung', NULL, 1, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(3, 6, '2025000003', '0012345680', 2, 'L', '2013-03-10', 'Jl. Asia Afrika No. 789, Bandung', NULL, 1, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(4, 7, '2025000004', '0012345681', 3, 'P', '2012-11-25', 'Jl. Dago No. 321, Bandung', NULL, 1, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(5, 8, '2025000005', '0012345682', 3, 'L', '2012-07-18', 'Jl. Setiabudhi No. 654, Bandung', NULL, 1, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(6, 9, '2025000006', '0012345683', 1, 'P', '2013-08-20', 'Jl. Lengkong No. 789, Bandung', NULL, 1, '2025-12-31 08:49:37', '2025-12-31 08:49:37');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `nip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `user_id`, `nip`, `phone`, `address`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 2, '197801012005011001', '081234567893', 'Jl. Pendidikan No. 444, Bandung', 1, '2025-12-31 08:49:36', '2025-12-31 08:49:36'),
(2, 10, '198205152008012002', '081234567894', 'Jl. Guru No. 555, Bandung', 1, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(3, 11, '198912202010011003', '081234567895', 'Jl. Guru No. 555, Bandung', 1, '2025-12-31 08:49:37', '2025-12-31 08:49:37');

-- --------------------------------------------------------

--
-- Table structure for table `tidur_cepat_details`
--

CREATE TABLE `tidur_cepat_details` (
  `id` bigint UNSIGNED NOT NULL,
  `submission_id` bigint UNSIGNED NOT NULL,
  `sleep_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'muslim',
  `role` enum('siswa','orangtua','guru','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'siswa',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plain_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `religion`, `role`, `password`, `plain_password`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'muslim', 'admin', '$2y$12$iL2vV9vgOQyWkFJMKOcOcuIUv03fL3lKKtVcpC2WOpBbNdWp9xyWO', NULL, '2025-12-31 08:49:34', '2025-12-31 12:16:17'),
(2, 'nuraini', 'nuraini', 'muslim', 'guru', '$2y$12$QrxktzKpVXO2b7I6Cfiabu9keBkifDR.E4McEYylpx6bCHv9B.dm6', NULL, '2025-12-31 08:49:34', '2025-12-31 08:53:51'),
(3, 'Orangtua Test', 'orangtuatest', 'muslim', 'orangtua', '$2y$12$CkuBIfyVPiZkKGh81s7DyOnx5T88kElc5ijCNlplto4VWkxJsdqRy', NULL, '2025-12-31 08:49:35', '2025-12-31 12:16:17'),
(4, 'Siswa Muslim', 'siswamuslim', 'muslim', 'siswa', '$2y$12$UBHmfJkRbZ07iTNc.uLkeuws2PkhrgikNeM1zrlSGrHLvl/ePszou', NULL, '2025-12-31 08:49:35', '2025-12-31 12:16:18'),
(5, 'Siswa Kristen', 'siswakristen', 'kristen', 'siswa', '$2y$12$T8FlFc2mqM7BgvjFbjDcj.hWC62/CUFgnGLGz5fs1O8/nx0RULvRS', NULL, '2025-12-31 08:49:35', '2025-12-31 12:16:18'),
(6, 'Siswa Katolik', 'siswakatoli', 'katolik', 'siswa', '$2y$12$HS99RMXYTMKqDedFynKrx.tOiO8esHecKWo3FQiNhb/j0VQdxwVl6', NULL, '2025-12-31 08:49:35', '2025-12-31 12:16:18'),
(7, 'Siswa Hindu', 'siswahindu', 'hindu', 'siswa', '$2y$12$Vo4Sn8m9VPmUadV8bH9WmO6z7xL78oeIm55unnPpt25DG0tL5ettu', NULL, '2025-12-31 08:49:36', '2025-12-31 12:16:18'),
(8, 'Siswa Buddha', 'siswabuddha', 'buddha', 'siswa', '$2y$12$nx5MT4jhQEvijhlya1Bk6O9z2inDj8qDZw//9KxM42ZOLS8x9Gkpe', NULL, '2025-12-31 08:49:36', '2025-12-31 12:16:18'),
(9, 'Siswa Konghucu', 'siswakonghucu', 'konghucu', 'siswa', '$2y$12$DMx0eMr7X3S563sbXy2nNOfS4MrYMpCAWe73AquHfm2.5FqR5EYtq', NULL, '2025-12-31 08:49:36', '2025-12-31 12:16:19'),
(10, 'Ibu Dewi', 'dewiguru', 'muslim', 'guru', '$2y$12$0GunuVEw26UK/TK5qhNp6uMVRMKD1BarlwCrwe41zbztCJJJrACUy', NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(11, 'Pak Andi', 'andiguru', 'muslim', 'guru', '$2y$12$EkdGOh5JF7fP1VdkYAWsGOS3XMrHQGAQEYvbAFIc3y5jp5m4tUfNa', NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(12, 'Budi Santoso', 'budisantoso', 'muslim', 'orangtua', '$2y$12$MjC8Kd1EzTusAxNvo6ZfmOUGLoDEGazu5c57yXgAKYvh9wA50qdZ.', NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(13, 'Siti Rahayu', 'sitirahayu', 'muslim', 'orangtua', '$2y$12$l3.i3jMSQ.oYQfN1ZOgZIeCyFBqkjjjtOPCZphz2f8gy795x5osoG', NULL, '2025-12-31 08:49:37', '2025-12-31 08:49:37'),
(14, 'Guru Test', 'gurutest', 'muslim', 'guru', '$2y$12$pqtmVM9wu7EVBnx4ABLUS.MTvMy.7dSYssocSC6YApiTSsMBq1IoK', NULL, '2025-12-31 12:16:17', '2025-12-31 12:16:17'),
(15, 'Ahmad Fauzi', 'siswa7a_1', 'muslim', 'siswa', '$2y$12$DV3o90fE.1p7qg9cvCEC4.41wkmhXeQkSPqwiV8I42e2LazAYJtEa', NULL, '2025-12-31 12:16:19', '2025-12-31 12:16:19'),
(16, 'Siti Nurhaliza', 'siswa7a_2', 'muslim', 'siswa', '$2y$12$J4IoBCru2U3/Q8uGVBnlIuQtzVxFM6Y3MoxaH2XOrztWDOwbdv9bG', NULL, '2025-12-31 12:16:19', '2025-12-31 12:16:19'),
(17, 'Budi Santoso', 'siswa7a_3', 'kristen', 'siswa', '$2y$12$9.DiYZXuNudWJubA8a4wZ.gcYWvkz1Hen8wxYj56P6UTA3emKwh6a', NULL, '2025-12-31 12:16:19', '2025-12-31 12:16:19'),
(18, 'Dewi Lestari', 'siswa7a_4', 'katolik', 'siswa', '$2y$12$.Lo7VS3b/vVTIoDUFGy/qOORs4.vNJ0XAYjLIExdGsHXHvRbOB5d6', NULL, '2025-12-31 12:16:20', '2025-12-31 12:16:20'),
(19, 'Eko Prasetyo', 'siswa7a_5', 'muslim', 'siswa', '$2y$12$bf.38wp70xnIh8TuwHDeQeOjsTwU29Y7I2.DcKUTyel08ZdO.t3Uu', NULL, '2025-12-31 12:16:20', '2025-12-31 12:16:20'),
(20, 'Fitri Handayani', 'siswa7a_6', 'muslim', 'siswa', '$2y$12$46DMx09ZAv3MeM3TOrPibeVid3lIn5C.iV3o3g.agFcd680mjhJq2', NULL, '2025-12-31 12:16:20', '2025-12-31 12:16:20'),
(21, 'Gita Savitri', 'siswa7a_7', 'hindu', 'siswa', '$2y$12$6TpNpqUJU.g7h5L70Np8DuCrMUuWYH064ooDWGxJoE2Z3Mv7wNdHS', NULL, '2025-12-31 12:16:20', '2025-12-31 12:16:20'),
(22, 'Hendra Wijaya', 'siswa7a_8', 'buddha', 'siswa', '$2y$12$6K.tO4i4Vk09y6gC4i7CkugDSeWAiBLofhcjrI3ZATMKaDVJskjVq', NULL, '2025-12-31 12:16:20', '2025-12-31 12:16:20'),
(23, 'Indah Permata', 'siswa7a_9', 'kristen', 'siswa', '$2y$12$pFijm48kkE6RAKi.TY5Uv.Wp8FXfWzRvmOoPcCrwOrBOUeK3VEDK2', NULL, '2025-12-31 12:16:21', '2025-12-31 12:16:21'),
(24, 'Joko Widodo', 'siswa7a_10', 'muslim', 'siswa', '$2y$12$k8NE93KnP6/ev38ONIfJCefWh9.fhxcRswo5ulJgQtK8sFOx4xKdq', NULL, '2025-12-31 12:16:21', '2025-12-31 12:16:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_submissions`
--
ALTER TABLE `activity_submissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_student_activity_date` (`student_id`,`activity_id`,`date`),
  ADD KEY `activity_submissions_approved_by_foreign` (`approved_by`),
  ADD KEY `activity_submissions_student_id_index` (`student_id`),
  ADD KEY `activity_submissions_activity_id_index` (`activity_id`),
  ADD KEY `activity_submissions_date_index` (`date`),
  ADD KEY `activity_submissions_status_index` (`status`),
  ADD KEY `activity_submissions_student_id_date_index` (`student_id`,`date`);

--
-- Indexes for table `bangun_pagi_details`
--
ALTER TABLE `bangun_pagi_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bangun_pagi_details_submission_id_index` (`submission_id`);

--
-- Indexes for table `beribadah_details`
--
ALTER TABLE `beribadah_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `beribadah_details_submission_id_index` (`submission_id`);

--
-- Indexes for table `bermasyarakat_details`
--
ALTER TABLE `bermasyarakat_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bermasyarakat_details_submission_id_index` (`submission_id`);

--
-- Indexes for table `berolahraga_details`
--
ALTER TABLE `berolahraga_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `berolahraga_details_submission_id_index` (`submission_id`);

--
-- Indexes for table `biodata_siswa`
--
ALTER TABLE `biodata_siswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `biodata_siswa_student_id_unique` (`student_id`),
  ADD KEY `biodata_siswa_student_id_index` (`student_id`);

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
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classes_grade_section_index` (`grade`,`section`),
  ADD KEY `classes_teacher_id_index` (`teacher_id`);

--
-- Indexes for table `gemar_belajar_details`
--
ALTER TABLE `gemar_belajar_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gemar_belajar_details_submission_id_index` (`submission_id`);

--
-- Indexes for table `makan_sehat_details`
--
ALTER TABLE `makan_sehat_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `makan_sehat_details_submission_id_index` (`submission_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parents_user_id_unique` (`user_id`),
  ADD KEY `parents_user_id_index` (`user_id`),
  ADD KEY `parents_class_id_foreign` (`class_id`);

--
-- Indexes for table `parent_student`
--
ALTER TABLE `parent_student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_parent_student_relationship` (`parent_id`,`student_id`,`relationship`),
  ADD KEY `parent_student_parent_id_index` (`parent_id`),
  ADD KEY `parent_student_student_id_index` (`student_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_user_id_unique` (`user_id`),
  ADD UNIQUE KEY `students_nis_unique` (`nis`),
  ADD UNIQUE KEY `students_nisn_unique` (`nisn`),
  ADD KEY `students_user_id_index` (`user_id`),
  ADD KEY `students_class_id_index` (`class_id`),
  ADD KEY `students_nis_index` (`nis`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teachers_user_id_unique` (`user_id`),
  ADD UNIQUE KEY `teachers_nip_unique` (`nip`),
  ADD KEY `teachers_user_id_index` (`user_id`);

--
-- Indexes for table `tidur_cepat_details`
--
ALTER TABLE `tidur_cepat_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tidur_cepat_details_submission_id_index` (`submission_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `activity_submissions`
--
ALTER TABLE `activity_submissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=355;

--
-- AUTO_INCREMENT for table `bangun_pagi_details`
--
ALTER TABLE `bangun_pagi_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `beribadah_details`
--
ALTER TABLE `beribadah_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bermasyarakat_details`
--
ALTER TABLE `bermasyarakat_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `berolahraga_details`
--
ALTER TABLE `berolahraga_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `biodata_siswa`
--
ALTER TABLE `biodata_siswa`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `gemar_belajar_details`
--
ALTER TABLE `gemar_belajar_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `makan_sehat_details`
--
ALTER TABLE `makan_sehat_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `parent_student`
--
ALTER TABLE `parent_student`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tidur_cepat_details`
--
ALTER TABLE `tidur_cepat_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_submissions`
--
ALTER TABLE `activity_submissions`
  ADD CONSTRAINT `activity_submissions_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `activity_submissions_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `parents` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `activity_submissions_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bangun_pagi_details`
--
ALTER TABLE `bangun_pagi_details`
  ADD CONSTRAINT `bangun_pagi_details_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `activity_submissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `beribadah_details`
--
ALTER TABLE `beribadah_details`
  ADD CONSTRAINT `beribadah_details_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `activity_submissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bermasyarakat_details`
--
ALTER TABLE `bermasyarakat_details`
  ADD CONSTRAINT `bermasyarakat_details_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `activity_submissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `berolahraga_details`
--
ALTER TABLE `berolahraga_details`
  ADD CONSTRAINT `berolahraga_details_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `activity_submissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `biodata_siswa`
--
ALTER TABLE `biodata_siswa`
  ADD CONSTRAINT `biodata_siswa_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `gemar_belajar_details`
--
ALTER TABLE `gemar_belajar_details`
  ADD CONSTRAINT `gemar_belajar_details_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `activity_submissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `makan_sehat_details`
--
ALTER TABLE `makan_sehat_details`
  ADD CONSTRAINT `makan_sehat_details_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `activity_submissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `parents`
--
ALTER TABLE `parents`
  ADD CONSTRAINT `parents_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `parents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `parent_student`
--
ALTER TABLE `parent_student`
  ADD CONSTRAINT `parent_student_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `parent_student_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tidur_cepat_details`
--
ALTER TABLE `tidur_cepat_details`
  ADD CONSTRAINT `tidur_cepat_details_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `activity_submissions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
