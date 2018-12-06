-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 06, 2018 at 01:38 PM
-- Server version: 5.7.24-0ubuntu0.16.04.1
-- PHP Version: 7.0.32-4+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adonis`
--

-- --------------------------------------------------------

--
-- Table structure for table `adonis_schema`
--

CREATE TABLE `adonis_schema` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adonis_schema`
--

INSERT INTO `adonis_schema` (`id`, `name`, `batch`, `migration_time`) VALUES
(1, '1503248427885_user', 1, '2018-11-24 01:46:15'),
(2, '1503248427886_token', 1, '2018-11-24 01:46:15'),
(3, '1543196177997_products_schema', 2, '2018-11-26 02:12:04'),
(4, '1543369348520_news_schema', 3, '2018-11-28 01:45:32'),
(5, '1543369609800_category_schema', 4, '2018-11-28 01:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Bóng đá', 'hello đây là test thôi', 'bong-da', NULL, NULL),
(2, 'Quần vợt', 'hello chào bà con', 'quan-vot', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `name`, `description`, `slug`, `user_id`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Tin tức bóng đá mới nhất', 'hello xin chào tất cả các bạn.', 'tin-tuc-bong-da-moi-nhat', 1, 1, 1, NULL, NULL),
(2, 'Đây là tin tức quần vợt', 'hello hello hello', 'abcabc', 1, 2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `price` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_image`, `slug`, `status`, `price`, `created_at`, `updated_at`) VALUES
(1, 'aaaa', 'vvvvvvvvvv.png', 'aaa', 1, 100, NULL, NULL),
(2, 'product 2', 'product2.jpg', 'slug', 0, 123456, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(101, 'cuchuoi1234', '123456', '2018-12-04 16:29:58', '2018-12-06 10:21:50'),
(102, 'sdfg', 'dfg', '2018-12-04 16:30:03', '2018-12-04 16:30:03'),
(103, 'sdfg', 'dfg', '2018-12-04 16:30:04', '2018-12-04 16:30:04'),
(124, 'sad', 'asd', '2018-12-05 17:13:40', '2018-12-05 17:13:40'),
(126, 'asd', 'asdsad', '2018-12-05 17:15:34', '2018-12-05 17:15:34'),
(131, 'asd', 'asd', '2018-12-05 17:26:30', '2018-12-05 17:26:30'),
(132, 'asd', 'asd', '2018-12-05 17:28:08', '2018-12-05 17:28:08'),
(133, 'gsdfg', 'dsfgg', '2018-12-05 17:33:47', '2018-12-05 17:33:47'),
(134, 'adsfs', 'asdf', '2018-12-05 17:34:09', '2018-12-05 17:34:09'),
(135, 'cuchuoi1234', '123456', '2018-12-06 11:39:37', '2018-12-06 11:39:37'),
(136, '', '', '2018-12-06 11:39:56', '2018-12-06 11:39:56'),
(137, '', '', '2018-12-06 11:40:24', '2018-12-06 11:40:24'),
(138, '', '', '2018-12-06 11:41:44', '2018-12-06 11:41:44'),
(139, '', '', '2018-12-06 11:41:45', '2018-12-06 11:41:45'),
(140, '', '', '2018-12-06 11:41:46', '2018-12-06 11:41:46'),
(141, '', '', '2018-12-06 11:41:47', '2018-12-06 11:41:47'),
(142, '', '', '2018-12-06 11:41:47', '2018-12-06 11:41:47'),
(143, '', '', '2018-12-06 11:41:47', '2018-12-06 11:41:47'),
(144, '', '', '2018-12-06 11:41:47', '2018-12-06 11:41:47');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `is_revoked` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `image`, `created_at`, `updated_at`) VALUES
(1, 'cuchuoi', 'abc@gmail.com', '123456', 'images.jpeg', NULL, '2018-12-05 16:16:32'),
(4, 'cuchuoi2', 'tiennm@vinsofts.net', '$2a$10$jCV5/LaaSrYqFOGzP41A.ePRSux6FwV0hgsEAd5UbEVkTnAiZquc.', '1544063674559.download.jpeg', '2018-11-24 11:48:26', '2018-12-06 09:34:34'),
(9, 'test', 'email', '$2a$10$na4J0oKZFAzoeyz4YNQz1uJxHs0AJ9aEwCG3mjAIqSbGJFrsJ.VLK', NULL, '2018-12-05 09:53:12', '2018-12-05 09:53:12'),
(11, 'test1', 'email1', '$2a$10$bmJi6bqijddWvy30rwI6kOrX41gvQDj2.oYvAop3wJJvoHByPJvSK', NULL, '2018-12-05 09:53:35', '2018-12-05 09:53:35'),
(12, 'test2', 'email2', '$2a$10$nz33UF0Mh.WUBEXueovK7eGf0IEwAjTGh0is4wxpHuX5hYPJPURaW', '1544063722794.images.jpeg', '2018-12-05 15:35:28', '2018-12-06 09:35:22'),
(24, '123345345', '123fdf', '$2a$10$nUv.3GsyZEst1q09rRwBVOyNB5EKkFP2EThmb62VYtuzl8kQZVPDK', '1544063739348.adonis.jpeg', '2018-12-06 08:51:03', '2018-12-06 09:35:39'),
(25, '212', '122', '$2a$10$pIjsg2J7dHUYEmgMZJp6H.sgjGeBT3M/J05QAsTIDcy1mHG5C5b4y', '1544061751652.adonis.jpeg', '2018-12-06 09:02:31', '2018-12-06 09:02:31'),
(26, '2121', '1221', '$2a$10$0fubbgMhgVU7Kvtw5tCdbeSDmuUhd.SwxOVD/HE78RtaSH4xhW4/i', '1544061774947.adonis.jpeg', '2018-12-06 09:02:55', '2018-12-06 09:02:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_product_name_unique` (`product_name`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unique` (`token`),
  ADD KEY `tokens_user_id_foreign` (`user_id`),
  ADD KEY `tokens_token_index` (`token`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
