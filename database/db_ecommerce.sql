-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2023 at 02:25 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `admin_role_id` bigint(20) NOT NULL DEFAULT 2,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `admin_role_id`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'james', '0123456789', 1, '2023-02-16-63edc65174dd3.png', 'admin@james.com', NULL, '$2y$10$9I2NfLysl.820oLkAeaosufMd1iQdyoUrWoY8UNQy2hwRuXAYRQIi', '8OVAmhGZHMPG28qZNfU2RUJad1ZmQnbrtelfThFSSmnB3q6s7zFnqo2iAV45', '2022-12-11 14:10:22', '2023-02-15 22:59:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `module_access` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `module_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL),
(7, 'Bán hàng', '[\"dashboard\"]', 1, '2023-01-30 02:55:17', '2023-01-30 02:55:17'),
(8, 'GIám Đốc', '[\"dashboard\",\"order_management\",\"product_management\",\"promotion_management\",\"support_section\",\"report\",\"user_section\"]', 1, '2023-02-27 13:32:43', '2023-02-27 13:32:43');

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `inhouse_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `inhouse_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_earned`, `delivery_charge_earned`, `pending_amount`, `total_tax_collected`) VALUES
(1, 1, 3860500, 0, NULL, '2023-03-02 21:10:44', 440000.00, 10020.00, 999999.99, 594500.00),
(2, 1, 0, 0, '2022-12-11 14:10:22', '2022-12-11 14:10:22', 0.00, 0.00, 999999.99, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallet_histories`
--

CREATE TABLE `admin_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'type', '2022-12-12 10:06:49', '2022-12-12 10:06:49'),
(2, 'size', '2022-12-12 10:06:53', '2022-12-12 10:06:53');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `banner_type` varchar(255) NOT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `resource_type` varchar(191) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `banner_type`, `published`, `created_at`, `updated_at`, `url`, `resource_type`, `resource_id`) VALUES
(1, '2022-12-11-639612a34069c.png', 'Main Section Banner', 1, '2022-12-11 16:25:55', '2022-12-11 16:25:57', 'http://localhost/web/products?id=2&data_from=category&page=1', 'product', NULL),
(3, '2022-12-11-63961bceb2d1c.png', 'Main Banner', 1, '2022-12-11 16:27:38', '2022-12-11 11:05:02', 'http://localhost/web/products?id=2&data_from=category&page=1', 'product', NULL),
(5, '2022-12-11-63961b790f57b.png', 'Main Banner', 1, '2022-12-11 11:03:13', '2022-12-11 11:03:37', 'http://localhost/web/products?id=2&data_from=category&page=1', 'product', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(191) DEFAULT NULL,
  `address_type` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `zip` int(10) UNSIGNED DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `image` varchar(50) NOT NULL DEFAULT 'def.png',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'TOTODAY', '2022-12-12-63976aa860f84.png', 1, '2022-12-12 10:53:44', '2022-12-12 10:53:44'),
(2, 'Chanel', '2022-12-16-639c2ac7d894e.png', 1, '2022-12-16 01:22:31', '2022-12-16 01:22:31'),
(3, 'Viettien', '2022-12-16-639c2b3133a2f.png', 1, '2022-12-16 01:24:17', '2022-12-16 01:24:17'),
(4, 'Brioni', '2022-12-16-639c2b41461c3.png', 1, '2022-12-16 01:24:33', '2022-12-16 01:24:33'),
(5, 'La Force', '2022-12-16-639c2b81cb220.png', 1, '2022-12-16 01:25:37', '2022-12-16 01:25:37'),
(6, 'Thom Browne', '2022-12-16-639c2bd550e72.png', 1, '2022-12-16 01:27:01', '2022-12-16 01:27:01'),
(7, 'Calvin Klein', '2022-12-16-639c2c11140ed.png', 1, '2022-12-16 01:28:01', '2022-12-16 01:28:01');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'system_default_currency', '8', '2020-10-11 07:43:44', '2022-12-11 11:16:07'),
(2, 'language', '[{\"id\":\"1\",\"name\":\"english\",\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":false},{\"id\":3,\"name\":\"vietnam\",\"direction\":\"ltr\",\"code\":\"vn\",\"status\":1,\"default\":true},{\"id\":3,\"name\":\"france\",\"direction\":\"ltr\",\"code\":\"fr\",\"status\":0,\"default\":false}]', '2020-10-11 07:53:02', '2023-02-20 19:59:40'),
(3, 'mail_config', '{\"status\":\"1\",\"name\":\"James Clothes\",\"host\":\"smtp.gmail.com\",\"driver\":\"SMTP\",\"port\":\"587\",\"username\":\"jamesclothesecommerce@gmail.com\",\"email_id\":\"jamesclothesecommerce@gmail.com\",\"encryption\":\"TLS\",\"password\":\"furitbnjzdigtlpg\"}', '2020-10-12 10:29:18', '2023-02-20 21:46:51'),
(4, 'cash_on_delivery', '{\"status\":\"1\"}', NULL, '2021-05-25 21:21:15'),
(6, 'ssl_commerz_payment', '{\"status\":null,\"environment\":\"sandbox\",\"store_id\":\"435345435\",\"store_password\":\"453454553\"}', '2020-11-09 08:36:51', '2023-02-18 17:47:55'),
(7, 'paypal', '{\"status\":\"0\",\"environment\":\"sandbox\",\"paypal_client_id\":\"\",\"paypal_secret\":\"\"}', '2020-11-09 08:51:39', '2022-11-15 06:43:15'),
(8, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2020-11-09 09:01:47', '2021-07-06 12:30:05'),
(10, 'company_phone', '0826138020', NULL, '2020-12-08 14:15:01'),
(11, 'company_name', 'james', NULL, '2021-02-27 18:11:53'),
(12, 'company_web_logo', '2022-12-16-639c15d234ce1.png', NULL, '2022-12-15 23:53:06'),
(13, 'company_mobile_logo', '2022-12-11-63961f73dd710.png', NULL, '2022-12-11 11:20:35'),
(14, 'terms_condition', '<p>Trang thương mại điện tử của t&ocirc;i, bạn chỉ cần chấp thuật đủ c&aacute;c điều kiện l&agrave; bạn c&oacute; thể mua quần &aacute;o v&agrave; sử dụng ứng dụng&nbsp;</p>', NULL, '2023-02-27 13:40:34'),
(15, 'about_us', '<p> Xin chào các bạn đây là công ty quần áo James do An Nguyen (James) xây dựng </p>', NULL, '2021-06-11 01:42:53'),
(16, 'sms_nexmo', '{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}', NULL, NULL),
(17, 'company_email', 'connectwithan@gmail.com', NULL, '2021-03-15 12:29:51'),
(18, 'colors', '{\"primary\":\"#1f5846\",\"secondary\":\"#bb5f62\"}', '2020-10-11 13:53:02', '2023-02-19 19:40:49'),
(19, 'company_footer_logo', '2022-12-16-639c177448a2b.png', NULL, '2022-12-16 00:00:04'),
(20, 'company_copyright_text', 'James Clothes Company', NULL, '2021-03-15 12:30:47'),
(21, 'download_app_apple_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/www.target.com\\/s\\/apple+store++now?ref=tgt_adv_XS000000&AFID=msn&fndsrc=tgtao&DFA=71700000012505188&CPNG=Electronics_Portable+Computers&adgroup=Portable+Computers&LID=700000001176246&LNM=apple+store+near+me+now&MT=b&network=s&device=c&location=12&targetid=kwd-81913773633608:loc-12&ds_rl=1246978&ds_rl=1248099&gclsrc=ds\"}', NULL, '2020-12-08 12:54:53'),
(22, 'download_app_google_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/play.google.com\\/store?hl=en_US&gl=US\"}', NULL, '2020-12-08 12:54:48'),
(23, 'company_fav_icon', '2021-03-02-603df1634614f.png', '2020-10-11 13:53:02', '2021-03-02 14:03:48'),
(24, 'fcm_topic', '', NULL, NULL),
(25, 'fcm_project_id', '', NULL, NULL),
(26, 'push_notification_key', 'AAAAhuDS2tE:APA91bE0GmIbDGditd-Gd4YS1_aOpI4sS_-GPatRWs4CpzEgxhfqphJXFiNBZ_V_zwx8xQiRXGdDFgI5Yh8TltcaCvZxUrdb7dgJqGo4ygorInjhhOLm9h8m82kkPbAC-VsrENcC1xJ4', NULL, NULL),
(27, 'order_pending_message', '{\"status\":\"1\",\"message\":\"\\u0110\\u01a1n H\\u00e0ng C\\u1ee7a B\\u1ea1n \\u0110\\u00e3 \\u0110\\u01b0\\u1ee3c \\u0110\\u1eb7t\"}', NULL, NULL),
(28, 'order_confirmation_msg', '{\"status\":\"1\",\"message\":\"\\u0110\\u01a1n H\\u00e0ng C\\u1ee7a B\\u1ea1n \\u0110\\u00e3 \\u0110\\u01b0\\u1ee3c X\\u00e1c Nh\\u1eadn \\u0110\\u1eb7t H\\u00e0ng\"}', NULL, NULL),
(29, 'order_processing_message', '{\"status\":\"1\",\"message\":\"\\u0110\\u01a1n H\\u00e0ng C\\u1ee7a B\\u1ea1n \\u0110\\u00e3 \\u0110\\u01b0\\u1ee3c X\\u1eed L\\u00fd\"}', NULL, NULL),
(30, 'out_for_delivery_message', '{\"status\":\"1\",\"message\":\"\\u0110\\u01a1n H\\u00e0ng C\\u1ee7a B\\u1ea1n \\u0110ang \\u0110\\u01b0\\u1ee3c Giao\"}', NULL, NULL),
(31, 'order_delivered_message', '{\"status\":\"1\",\"message\":\"\\u0110\\u01a1n h\\u00e0ng C\\u1ee7a B\\u1ea1n \\u0110\\u00e3 \\u0110\\u01b0\\u1ee3c G\\u1eedi\"}', NULL, NULL),
(32, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', NULL, '2021-07-06 12:30:14'),
(33, 'sales_commission', '0', NULL, '2023-03-02 21:58:59'),
(34, 'seller_registration', '1', NULL, '2021-06-04 21:02:48'),
(35, 'pnc_language', '[\"en\",\"vn\",\"fr\"]', NULL, NULL),
(36, 'order_returned_message', '{\"status\":\"1\",\"message\":\"\\u0110\\u01a1n H\\u00e0ng C\\u1ee7a B\\u1ea1n \\u0110\\u01b0\\u1ee3c Ho\\u00e0n Tr\\u1ea3\"}', NULL, NULL),
(37, 'order_failed_message', '{\"status\":null,\"message\":\"Order fa Message\"}', NULL, NULL),
(40, 'delivery_boy_assign_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(41, 'delivery_boy_start_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(42, 'delivery_boy_delivered_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(43, 'terms_and_conditions', '', NULL, NULL),
(44, 'minimum_order_value', '1', NULL, NULL),
(45, 'privacy_policy', '<p>Đ&acirc;y l&agrave; ch&iacute;nh s&aacute;ch bảo mật</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-02-27 13:40:47'),
(46, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":null}', NULL, '2021-07-06 12:30:35'),
(47, 'senang_pay', '{\"status\":\"0\",\"secret_key\":null,\"merchant_id\":null}', NULL, '2021-07-06 12:30:23'),
(48, 'currency_model', 'single_currency', NULL, NULL),
(49, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":\"579297532625-pdhol0c66mqk8210j5t3ueqn0dg1ecpf.apps.googleusercontent.com\",\"client_secret\":\"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\",\"status\":\"1\"}]', NULL, '2023-02-20 19:47:19'),
(50, 'digital_payment', '{\"status\":\"1\"}', NULL, NULL),
(51, 'phone_verification', '0', NULL, NULL),
(52, 'email_verification', '0', NULL, NULL),
(53, 'order_verification', '0', NULL, NULL),
(54, 'country_code', 'VN', NULL, NULL),
(55, 'pagination_limit', '10', NULL, NULL),
(56, 'shipping_method', 'sellerwise_shipping', NULL, NULL),
(57, 'paymob_accept', '{\"status\":\"0\",\"api_key\":\"\",\"iframe_id\":\"\",\"integration_id\":\"\",\"hmac\":\"\"}', NULL, NULL),
(58, 'bkash', '{\"status\":\"0\",\"environment\":\"sandbox\",\"api_key\":\"\",\"api_secret\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, '2022-11-15 06:43:16'),
(59, 'forgot_password_verification', 'email', NULL, NULL),
(60, 'paytabs', '{\"status\":0,\"profile_id\":\"\",\"server_key\":\"\",\"base_url\":\"https:\\/\\/secure-egypt.paytabs.com\\/\"}', NULL, '2021-11-21 03:01:40'),
(61, 'stock_limit', '10', NULL, NULL),
(62, 'flutterwave', '{\"status\":null,\"environment\":\"sandbox\",\"public_key\":null,\"secret_key\":null,\"hash\":null}', NULL, '2023-02-18 17:47:45'),
(63, 'mercadopago', '{\"status\":null,\"environment\":\"sandbox\",\"public_key\":null,\"access_token\":null}', NULL, '2023-02-18 17:15:19'),
(64, 'announcement', '{\"status\":\"0\",\"color\":\"#895252\",\"text_color\":\"#b06d6d\",\"announcement\":\"Hi Guys\"}', NULL, NULL),
(65, 'fawry_pay', '{\"status\":0,\"merchant_code\":\"\",\"security_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(66, 'recaptcha', '{\"status\":null,\"site_key\":null,\"secret_key\":null}', '2023-02-20 19:40:46', '2023-02-20 19:40:46'),
(67, 'seller_pos', '0', NULL, '2023-02-15 13:26:26'),
(68, 'liqpay', '{\"status\":0,\"public_key\":\"\",\"private_key\":\"\"}', NULL, NULL),
(69, 'paytm', '{\"status\":0,\"environment\":\"sandbox\",\"paytm_merchant_key\":\"\",\"paytm_merchant_mid\":\"\",\"paytm_merchant_website\":\"\",\"paytm_refund_url\":\"\"}', NULL, '2022-11-15 06:43:15'),
(70, 'refund_day_limit', '7', NULL, NULL),
(71, 'business_mode', 'multi', NULL, NULL),
(72, 'mail_config_sendgrid', '{\"status\":0,\"name\":\"An Nguyen Van\",\"host\":\"smtp.gmail.com\",\"driver\":\"SMTP\",\"port\":\"587\",\"username\":\"connectwithan@gmail.com\",\"email_id\":\"connectwithan@gmail.com\",\"encryption\":\"TLS\",\"password\":\"Anhlabao20\"}', NULL, '2023-02-20 21:46:51'),
(73, 'decimal_point_settings', '2', NULL, NULL),
(74, 'shop_address', 'Hanoi, Vietnam', NULL, NULL),
(75, 'billing_input_by_customer', '1', NULL, NULL),
(76, 'wallet_status', '0', NULL, NULL),
(77, 'loyalty_point_status', '1', NULL, NULL),
(78, 'wallet_add_refund', '1', NULL, NULL),
(79, 'loyalty_point_exchange_rate', '1', NULL, NULL),
(80, 'loyalty_point_item_purchase_point', '10', NULL, NULL),
(81, 'loyalty_point_minimum_point', '50000', NULL, NULL),
(82, 'minimum_order_limit', '1', NULL, NULL),
(83, 'product_brand', '1', NULL, NULL),
(84, 'digital_product', '1', NULL, NULL),
(85, 'delivery_boy_expected_delivery_date_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(86, 'order_canceled', '{\"status\":0,\"message\":null}', NULL, NULL),
(87, 'timezone', 'Asia/Bangkok', NULL, NULL),
(88, 'default_location', '{\"lat\":\"20.98123849084675\",\"lng\":\"105.78958891534461\"}', NULL, NULL),
(89, 'currency_symbol_position', 'right', '2022-12-11 18:19:11', '2022-12-11 18:19:13'),
(90, 'shop_banner', '2022-12-11-63961fcbbcae5.png', NULL, NULL),
(91, 'delivery_country_restriction', '1', NULL, '2022-12-11 11:22:32'),
(92, 'delivery_zip_code_area_restriction', '1', NULL, '2023-02-20 19:27:10'),
(93, 'loader_gif', '2022-12-16-639c25c70a4d5.png', NULL, NULL),
(94, 'releans_sms', '{\"status\":\"1\",\"api_key\":null,\"from\":null,\"otp_template\":null}', '2023-01-27 04:33:12', '2023-01-27 04:33:12'),
(95, 'map_api_key', 'AIzaSyAUwsMWQE76V3u8anRygktIBpNejQJzogo', NULL, NULL),
(96, 'map_api_key_server', 'AIzaSyAUwsMWQE76V3u8anRygktIBpNejQJzogo', NULL, NULL),
(97, 'vnpay', '{\"status\":\"1\",\"vnp_TmnCode\":\"NHWZ4FC7\",\"vnp_HashSecret\":\"NLORVYJKMHLYSQEKPWECBHECFGDGQRTD\",\"vnp_Url\":\"https:\\/\\/sandbox.vnpayment.vn\\/paymentv2\\/vpcpay.html\"}', NULL, '2023-02-18 17:23:26');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_type` varchar(20) NOT NULL DEFAULT 'physical',
  `digital_product_type` varchar(30) DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL,
  `choices` text DEFAULT NULL,
  `variations` text DEFAULT NULL,
  `variant` text DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 1,
  `tax` double NOT NULL DEFAULT 1,
  `discount` double NOT NULL DEFAULT 1,
  `slug` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `thumbnail` varchar(191) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_info` varchar(191) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `cart_group_id`, `product_id`, `product_type`, `digital_product_type`, `color`, `choices`, `variations`, `variant`, `quantity`, `price`, `tax`, `discount`, `slug`, `name`, `thumbnail`, `seller_id`, `seller_is`, `created_at`, `updated_at`, `shop_info`, `shipping_cost`, `shipping_type`) VALUES
(1, 3, '3-inGtK-1670902039', 1, 'physical', NULL, '#8B0000', '{\"choice_2\":\"M\"}', '{\"color\":\"DarkRed\",\"size\":\"M\"}', 'DarkRed-M', 1, 520000, 0, 0, 'ao-khoac-ni-unisex-totoday-sparky-Rlofwi', 'ÁO KHOÁC NỈ UNISEX - TOTODAY - SPARKY', '2022-12-12-63976b30c27ba.png', 1, 'admin', '2022-12-12 20:27:19', '2022-12-12 20:27:19', 'james', 0.00, 'order_wise'),
(24, 7, '7-8tl06-1674619892', 24, 'physical', NULL, '#9966CC', '{\"choice_2\":\"X\"}', '{\"color\":\"Amethyst\",\"size\":\"X\"}', 'Amethyst-X', 1, 1400000, 28000, 0, 'ao-vest-1-VTTBmh', 'Áo Vest 1', '2023-01-10-63bdf5cce1826.png', 1, 'seller', '2023-01-24 21:11:32', '2023-01-24 21:11:32', 'An Shop', 0.00, 'order_wise'),
(25, 8, '8-oG9LD-1675272818', 1, 'physical', NULL, '#8B0000', '{\"choice_2\":\"XL\"}', '{\"color\":\"DarkRed\",\"size\":\"XL\"}', 'DarkRed-XL', 1, 520000, 0, 0, 'ao-khoac-ni-unisex-totoday-sparky-Rlofwi', 'ÁO KHOÁC NỈ UNISEX - TOTODAY - SPARKY', '2022-12-12-63976b30c27ba.png', 1, 'admin', '2023-02-01 10:33:38', '2023-02-01 10:33:38', 'james', 0.00, 'order_wise');

-- --------------------------------------------------------

--
-- Table structure for table `cart_shippings`
--

CREATE TABLE `cart_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_shippings`
--

INSERT INTO `cart_shippings` (`id`, `cart_group_id`, `shipping_method_id`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(1, '3-inGtK-1670902039', 2, 5.00, '2022-12-12 20:27:30', '2022-12-12 20:27:30'),
(6, '4-6ITDc-1672888812', 2, 5.00, '2023-01-04 20:20:17', '2023-01-04 20:20:17'),
(7, '4-2okZZ-1672888966', 2, 5.00, '2023-01-04 20:22:50', '2023-01-04 20:22:50'),
(19, '8-oG9LD-1675272818', 2, 5.00, '2023-02-01 10:33:43', '2023-02-01 10:33:43'),
(32, '4-UTSGz-1677790779', 12, 30000.00, '2023-03-02 20:59:42', '2023-03-02 20:59:44');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_status` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `position`, `created_at`, `updated_at`, `home_status`, `priority`) VALUES
(3, 'Áo khoác', 'ao-khoac', '2022-12-12-639766729bbe7.png', 0, 0, '2022-12-11 14:23:39', '2022-12-12 10:35:46', 1, 0),
(6, 'Áo Sơ Mi', 'ao-so-mi', '2022-12-12-63976700e11ed.png', 0, 0, '2022-12-12 10:38:08', '2022-12-12 10:38:12', 1, 1),
(7, 'Áo Polo', 'ao-polo', '2022-12-12-6397675443b38.png', 0, 0, '2022-12-12 10:39:32', '2022-12-12 10:39:35', 1, 1),
(8, 'Áo Vest', 'ao-vest', '2022-12-12-6397679ca31e0.png', 0, 0, '2022-12-12 10:40:44', '2022-12-12 10:40:47', 1, 1),
(9, 'Giày Thể Thao', 'giay-the-thao', '2022-12-12-639767eb6052a.png', 0, 0, '2022-12-12 10:42:03', '2022-12-12 10:42:05', 1, 1),
(10, 'Giày Da', 'giay-da', '2022-12-12-6397680db92cd.png', 0, 0, '2022-12-12 10:42:37', '2022-12-12 10:44:14', 1, 1),
(11, 'Nước Hoa, Trang Sức', 'nuoc-hoa-trang-suc', '2022-12-12-6397686c09315.png', 0, 0, '2022-12-12 10:44:12', '2022-12-12 10:44:14', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_shipping_costs`
--

CREATE TABLE `category_shipping_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_shipping_costs`
--

INSERT INTO `category_shipping_costs` (`id`, `seller_id`, `category_id`, `cost`, `multiply_qty`, `created_at`, `updated_at`) VALUES
(1, 0, 2, 0.00, NULL, '2022-12-11 11:22:16', '2022-12-11 11:22:16'),
(2, 0, 3, 0.00, NULL, '2022-12-11 11:22:16', '2022-12-11 11:22:16'),
(3, 0, 4, 0.00, NULL, '2022-12-11 11:22:16', '2022-12-11 11:22:16'),
(4, 0, 5, 0.00, NULL, '2022-12-11 11:22:16', '2022-12-11 11:22:16'),
(5, 0, 6, 0.00, NULL, '2022-12-12 20:34:08', '2022-12-12 20:34:08'),
(6, 0, 7, 0.00, NULL, '2022-12-12 20:34:08', '2022-12-12 20:34:08'),
(7, 0, 8, 0.00, NULL, '2022-12-12 20:34:08', '2022-12-12 20:34:08'),
(8, 0, 9, 0.00, NULL, '2022-12-12 20:34:08', '2022-12-12 20:34:08'),
(9, 0, 10, 0.00, NULL, '2022-12-12 20:34:08', '2022-12-12 20:34:08'),
(10, 0, 11, 0.00, NULL, '2022-12-12 20:34:08', '2022-12-12 20:34:08'),
(11, 1, 3, 0.00, NULL, '2023-02-20 20:03:16', '2023-02-20 20:03:16'),
(12, 1, 6, 0.00, NULL, '2023-02-20 20:03:16', '2023-02-20 20:03:16'),
(13, 1, 7, 0.00, NULL, '2023-02-20 20:03:16', '2023-02-20 20:03:16'),
(14, 1, 8, 0.00, NULL, '2023-02-20 20:03:16', '2023-02-20 20:03:16'),
(15, 1, 9, 0.00, NULL, '2023-02-20 20:03:16', '2023-02-20 20:03:16'),
(16, 1, 10, 0.00, NULL, '2023-02-20 20:03:16', '2023-02-20 20:03:16'),
(17, 1, 11, 0.00, NULL, '2023-02-20 20:03:16', '2023-02-20 20:03:16');

-- --------------------------------------------------------

--
-- Table structure for table `chattings`
--

CREATE TABLE `chattings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `message` text NOT NULL,
  `sent_by_customer` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_seller` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_admin` tinyint(1) DEFAULT NULL,
  `sent_by_delivery_man` tinyint(1) DEFAULT NULL,
  `seen_by_customer` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_seller` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_admin` tinyint(1) DEFAULT NULL,
  `seen_by_delivery_man` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chattings`
--

INSERT INTO `chattings` (`id`, `user_id`, `seller_id`, `admin_id`, `delivery_man_id`, `message`, `sent_by_customer`, `sent_by_seller`, `sent_by_admin`, `sent_by_delivery_man`, `seen_by_customer`, `seen_by_seller`, `seen_by_admin`, `seen_by_delivery_man`, `status`, `created_at`, `updated_at`, `shop_id`) VALUES
(1, 4, 1, NULL, NULL, 'anh iu ơi', 1, 0, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-02-07 07:15:51', '2023-03-02 22:58:32', 1),
(2, 4, 1, NULL, NULL, 'ơi em iu', 0, 1, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-02-07 07:16:07', '2023-03-02 22:58:46', 1),
(3, 4, 1, NULL, NULL, 'dasdasda', 0, 1, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-02-07 07:48:51', '2023-03-02 22:58:46', 1),
(4, 4, 1, NULL, NULL, 'anh iu oi', 1, 0, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-02-14 08:48:38', '2023-03-02 22:58:32', 1),
(5, 4, 1, NULL, NULL, 'ơi', 0, 1, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-02-14 08:48:53', '2023-03-02 22:58:46', 1),
(6, 4, 1, NULL, NULL, 'hahah', 0, 1, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-02-15 22:49:30', '2023-03-02 22:58:46', 1),
(7, 4, 1, NULL, NULL, 'bạn thật đáng iu', 0, 1, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-02-15 22:49:38', '2023-03-02 22:58:46', 1),
(8, 4, 1, NULL, NULL, 'tui cảm ơn', 1, 0, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-02-15 22:49:48', '2023-03-02 22:58:32', 1),
(9, 4, 1, NULL, NULL, 'hihi', 1, 0, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-02-15 22:49:49', '2023-03-02 22:58:32', 1),
(10, 4, 1, NULL, NULL, 'è', 0, 1, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-02-15 22:49:54', '2023-03-02 22:58:46', 1),
(11, 4, 1, NULL, NULL, 'bạn ơi', 0, 1, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-02-20 20:20:39', '2023-03-02 22:58:46', 1),
(12, 4, 1, NULL, NULL, 'hello', 1, 0, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-03-02 04:12:31', '2023-03-02 22:58:32', 1),
(13, 4, 1, NULL, NULL, 'hello em', 0, 1, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-03-02 04:13:24', '2023-03-02 22:58:46', 1),
(14, 4, 1, NULL, NULL, 'dsd', 0, 1, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-03-02 04:17:18', '2023-03-02 22:58:46', 1),
(15, 4, 1, NULL, NULL, 'fdf', 0, 1, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-03-02 04:24:10', '2023-03-02 22:58:46', 1),
(16, 4, 1, NULL, NULL, 'fd', 0, 1, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-03-02 04:24:30', '2023-03-02 22:58:46', 1),
(17, 4, 1, NULL, NULL, 'sdsd', 0, 1, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-03-02 22:58:35', '2023-03-02 22:58:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `mobile_number` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `feedback` varchar(191) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `mobile_number`, `subject`, `message`, `seen`, `feedback`, `created_at`, `updated_at`, `reply`) VALUES
(1, 'An', 'connectiwthan@gmail.com', '0826138020', 'Cam on', 'cam on', 1, '0', '2023-01-10 16:22:03', '2023-02-19 18:08:40', '{\"subject\":\"ok b\\u1ea1n\",\"body\":\"toi cung thay vay\"}'),
(2, 'Nguyễn Văn An', 'anguyenstr@gmail.com', '0123456789', 'Toi xem hàng', 'hàng', 0, '0', '2023-02-20 21:43:09', '2023-03-02 04:21:49', '{\"subject\":\"hehe\",\"body\":\"hehe\"}');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_type` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `code` varchar(15) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_type`, `title`, `code`, `start_date`, `expire_date`, `min_purchase`, `max_discount`, `discount`, `discount_type`, `status`, `created_at`, `updated_at`, `limit`) VALUES
(1, 'discount_on_purchase', 'Giảm ngày 8/3', 'GIAMNGAYPHUNU', '2023-02-27', '2023-03-09', '20000.00', '50000.00', '50.00', 'percentage', 1, '2023-02-27 13:55:20', '2023-02-27 13:55:20', 100);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `exchange_rate` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `exchange_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 'USD', '1', 1, NULL, '2021-06-27 13:39:37'),
(2, 'BDT', '৳', 'BDT', '84', 0, NULL, '2023-02-20 19:58:59'),
(3, 'Indian Rupi', '₹', 'INR', '60', 0, '2020-10-15 17:23:04', '2023-02-20 19:58:58'),
(4, 'Euro', '€', 'EUR', '100', 0, '2021-05-25 21:00:23', '2023-02-20 19:59:00'),
(5, 'YEN', '¥', 'JPY', '110', 0, '2021-06-10 22:08:31', '2023-02-20 19:58:57'),
(8, 'VND', 'đ', 'VND', '1', 1, '2022-12-11 11:15:34', '2022-12-11 11:15:43');

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallets`
--

CREATE TABLE `customer_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `royality_points` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallet_histories`
--

CREATE TABLE `customer_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `transaction_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) DEFAULT NULL,
  `transaction_method` varchar(30) DEFAULT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_of_the_days`
--

CREATE TABLE `deal_of_the_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(12) NOT NULL DEFAULT 'amount',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman_notifications`
--

CREATE TABLE `deliveryman_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman_wallets`
--

CREATE TABLE `deliveryman_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `current_balance` decimal(50,2) NOT NULL DEFAULT 0.00,
  `cash_in_hand` decimal(50,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(50,2) NOT NULL DEFAULT 0.00,
  `total_withdraw` decimal(50,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_country_codes`
--

CREATE TABLE `delivery_country_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_country_codes`
--

INSERT INTO `delivery_country_codes` (`id`, `country_code`, `created_at`, `updated_at`) VALUES
(1, 'VN', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `deliveryman_id` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_transactions`
--

CREATE TABLE `delivery_man_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `transaction_id` char(36) NOT NULL,
  `debit` decimal(50,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(50,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `identity_number` varchar(30) DEFAULT NULL,
  `identity_type` varchar(50) DEFAULT NULL,
  `identity_image` varchar(191) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `branch` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_online` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` varchar(191) NOT NULL DEFAULT '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n',
  `fcm_token` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_zip_codes`
--

CREATE TABLE `delivery_zip_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `zipcode` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_zip_codes`
--

INSERT INTO `delivery_zip_codes` (`id`, `zipcode`, `created_at`, `updated_at`) VALUES
(1, '100000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contacts`
--

CREATE TABLE `emergency_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_deals`
--

CREATE TABLE `feature_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) DEFAULT NULL,
  `text_color` varchar(255) DEFAULT NULL,
  `banner` varchar(100) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `deal_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deals`
--

INSERT INTO `flash_deals` (`id`, `title`, `start_date`, `end_date`, `status`, `featured`, `background_color`, `text_color`, `banner`, `slug`, `created_at`, `updated_at`, `product_id`, `deal_type`) VALUES
(1, 'Giảm giá toàn mặt hàng', '2023-01-10', '2023-01-14', 1, 0, NULL, NULL, '2023-01-10-63bd0c354d6db.png', 'giam-gia-toan-mat-hang', '2023-01-09 23:56:53', '2023-01-09 23:57:15', NULL, 'flash_deal');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deal_products`
--

INSERT INTO `flash_deal_products` (`id`, `flash_deal_id`, `product_id`, `discount`, `discount_type`, `created_at`, `updated_at`) VALUES
(1, 1, 8, '0.00', NULL, '2023-01-09 23:57:04', '2023-01-09 23:57:04'),
(2, 1, 1, '0.00', NULL, '2023-01-09 23:57:07', '2023-01-09 23:57:07');

-- --------------------------------------------------------

--
-- Table structure for table `help_topics`
--

CREATE TABLE `help_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `ranking` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `help_topics`
--

INSERT INTO `help_topics` (`id`, `question`, `answer`, `ranking`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Trang này có mua được quần áo không ?', 'Có nhé mua được thoải mái, trừ những sản phẩm hết hàng', 5, 1, '2023-02-27 13:41:31', '2023-02-27 13:41:31'),
(2, 'Trang này có thanh toán online được không ?', 'Có bên mình thanh toán online bằng phương thức VNPAY', 5, 1, '2023-02-27 13:44:37', '2023-02-27 13:44:37');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_point_transactions`
--

CREATE TABLE `loyalty_point_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `reference` varchar(191) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loyalty_point_transactions`
--

INSERT INTO `loyalty_point_transactions` (`id`, `user_id`, `transaction_id`, `credit`, `debit`, `balance`, `reference`, `transaction_type`, `created_at`, `updated_at`) VALUES
(1, 4, 'a78a976d-5df4-43d9-a81a-706e1df53d1f', '571200.000', '0.000', '571200.000', '100024', 'order_place', '2023-02-20 20:34:37', '2023-02-20 20:34:37'),
(2, 10, '749f5141-9d5c-48fb-b8b5-77c6b30b6314', '142800.000', '0.000', '142800.000', '100025', 'order_place', '2023-02-26 12:20:08', '2023-02-26 12:20:08'),
(3, 12, 'bd895245-c9ec-4320-9c53-8f2546c45b78', '39000.000', '0.000', '39000.000', '100029', 'order_place', '2023-03-02 20:57:22', '2023-03-02 20:57:22'),
(4, 12, 'dbd7c2b4-689a-4f24-9efc-248b297a7eeb', '142800.000', '0.000', '181800.000', '100030', 'order_place', '2023-03-02 20:58:11', '2023-03-02 20:58:11'),
(5, 10, '0d14cc20-4237-4539-a32e-847a5ab3ba96', '40000.000', '0.000', '182800.000', '100026', 'order_place', '2023-03-02 21:10:44', '2023-03-02 21:10:44');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_09_08_105159_create_admins_table', 1),
(5, '2020_09_08_111837_create_admin_roles_table', 1),
(6, '2020_09_16_142451_create_categories_table', 2),
(7, '2020_09_16_181753_create_categories_table', 3),
(8, '2020_09_17_134238_create_brands_table', 4),
(9, '2020_09_17_203054_create_attributes_table', 5),
(10, '2020_09_19_112509_create_coupons_table', 6),
(11, '2020_09_19_161802_create_curriencies_table', 7),
(12, '2020_09_20_114509_create_sellers_table', 8),
(13, '2020_09_23_113454_create_shops_table', 9),
(14, '2020_09_23_115615_create_shops_table', 10),
(15, '2020_09_23_153822_create_shops_table', 11),
(16, '2020_09_21_122817_create_products_table', 12),
(17, '2020_09_22_140800_create_colors_table', 12),
(18, '2020_09_28_175020_create_products_table', 13),
(19, '2020_09_28_180311_create_products_table', 14),
(20, '2020_10_04_105041_create_search_functions_table', 15),
(21, '2020_10_05_150730_create_customers_table', 15),
(22, '2020_10_08_133548_create_wishlists_table', 16),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 17),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 17),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 17),
(26, '2016_06_01_000004_create_oauth_clients_table', 17),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 17),
(28, '2020_10_06_133710_create_product_stocks_table', 17),
(29, '2020_10_06_134636_create_flash_deals_table', 17),
(30, '2020_10_06_134719_create_flash_deal_products_table', 17),
(31, '2020_10_08_115439_create_orders_table', 17),
(32, '2020_10_08_115453_create_order_details_table', 17),
(33, '2020_10_08_121135_create_shipping_addresses_table', 17),
(34, '2020_10_10_171722_create_business_settings_table', 17),
(35, '2020_09_19_161802_create_currencies_table', 18),
(36, '2020_10_12_152350_create_reviews_table', 18),
(37, '2020_10_12_161834_create_reviews_table', 19),
(38, '2020_10_12_180510_create_support_tickets_table', 20),
(39, '2020_10_14_140130_create_transactions_table', 21),
(40, '2020_10_14_143553_create_customer_wallets_table', 21),
(41, '2020_10_14_143607_create_customer_wallet_histories_table', 21),
(42, '2020_10_22_142212_create_support_ticket_convs_table', 21),
(43, '2020_10_24_234813_create_banners_table', 22),
(44, '2020_10_27_111557_create_shipping_methods_table', 23),
(45, '2020_10_27_114154_add_url_to_banners_table', 24),
(46, '2020_10_28_170308_add_shipping_id_to_order_details', 25),
(47, '2020_11_02_140528_add_discount_to_order_table', 26),
(48, '2020_11_03_162723_add_column_to_order_details', 27),
(49, '2020_11_08_202351_add_url_to_banners_table', 28),
(50, '2020_11_10_112713_create_help_topic', 29),
(51, '2020_11_10_141513_create_contacts_table', 29),
(52, '2020_11_15_180036_add_address_column_user_table', 30),
(53, '2020_11_18_170209_add_status_column_to_product_table', 31),
(54, '2020_11_19_115453_add_featured_status_product', 32),
(55, '2020_11_21_133302_create_deal_of_the_days_table', 33),
(56, '2020_11_20_172332_add_product_id_to_products', 34),
(57, '2020_11_27_234439_add__state_to_shipping_addresses', 34),
(58, '2020_11_28_091929_create_chattings_table', 35),
(59, '2020_12_02_011815_add_bank_info_to_sellers', 36),
(60, '2020_12_08_193234_create_social_medias_table', 37),
(61, '2020_12_13_122649_shop_id_to_chattings', 37),
(62, '2020_12_14_145116_create_seller_wallet_histories_table', 38),
(63, '2020_12_14_145127_create_seller_wallets_table', 38),
(64, '2020_12_15_174804_create_admin_wallets_table', 39),
(65, '2020_12_15_174821_create_admin_wallet_histories_table', 39),
(66, '2020_12_15_214312_create_feature_deals_table', 40),
(67, '2020_12_17_205712_create_withdraw_requests_table', 41),
(68, '2021_02_22_161510_create_notifications_table', 42),
(69, '2021_02_24_154706_add_deal_type_to_flash_deals', 43),
(70, '2021_03_03_204349_add_cm_firebase_token_to_users', 44),
(71, '2021_04_17_134848_add_column_to_order_details_stock', 45),
(72, '2021_05_12_155401_add_auth_token_seller', 46),
(73, '2021_06_03_104531_ex_rate_update', 47),
(74, '2021_06_03_222413_amount_withdraw_req', 48),
(75, '2021_06_04_154501_seller_wallet_withdraw_bal', 49),
(76, '2021_06_04_195853_product_dis_tax', 50),
(77, '2021_05_27_103505_create_product_translations_table', 51),
(78, '2021_06_17_054551_create_soft_credentials_table', 51),
(79, '2021_06_29_212549_add_active_col_user_table', 52),
(80, '2021_06_30_212619_add_col_to_contact', 53),
(81, '2021_07_01_160828_add_col_daily_needs_products', 54),
(82, '2021_07_04_182331_add_col_seller_sales_commission', 55),
(83, '2021_08_07_190655_add_seo_columns_to_products', 56),
(84, '2021_08_07_205913_add_col_to_category_table', 56),
(85, '2021_08_07_210808_add_col_to_shops_table', 56),
(86, '2021_08_14_205216_change_product_price_col_type', 56),
(87, '2021_08_16_201505_change_order_price_col', 56),
(88, '2021_08_16_201552_change_order_details_price_col', 56),
(89, '2019_09_29_154000_create_payment_cards_table', 57),
(90, '2021_08_17_213934_change_col_type_seller_earning_history', 57),
(91, '2021_08_17_214109_change_col_type_admin_earning_history', 57),
(92, '2021_08_17_214232_change_col_type_admin_wallet', 57),
(93, '2021_08_17_214405_change_col_type_seller_wallet', 57),
(94, '2021_08_22_184834_add_publish_to_products_table', 57),
(95, '2021_09_08_211832_add_social_column_to_users_table', 57),
(96, '2021_09_13_165535_add_col_to_user', 57),
(97, '2021_09_19_061647_add_limit_to_coupons_table', 57),
(98, '2021_09_20_020716_add_coupon_code_to_orders_table', 57),
(99, '2021_09_23_003059_add_gst_to_sellers_table', 57),
(100, '2021_09_28_025411_create_order_transactions_table', 57),
(101, '2021_10_02_185124_create_carts_table', 57),
(102, '2021_10_02_190207_create_cart_shippings_table', 57),
(103, '2021_10_03_194334_add_col_order_table', 57),
(104, '2021_10_03_200536_add_shipping_cost', 57),
(105, '2021_10_04_153201_add_col_to_order_table', 57),
(106, '2021_10_07_172701_add_col_cart_shop_info', 57),
(107, '2021_10_07_184442_create_phone_or_email_verifications_table', 57),
(108, '2021_10_07_185416_add_user_table_email_verified', 57),
(109, '2021_10_11_192739_add_transaction_amount_table', 57),
(110, '2021_10_11_200850_add_order_verification_code', 57),
(111, '2021_10_12_083241_add_col_to_order_transaction', 57),
(112, '2021_10_12_084440_add_seller_id_to_order', 57),
(113, '2021_10_12_102853_change_col_type', 57),
(114, '2021_10_12_110434_add_col_to_admin_wallet', 57),
(115, '2021_10_12_110829_add_col_to_seller_wallet', 57),
(116, '2021_10_13_091801_add_col_to_admin_wallets', 57),
(117, '2021_10_13_092000_add_col_to_seller_wallets_tax', 57),
(118, '2021_10_13_165947_rename_and_remove_col_seller_wallet', 57),
(119, '2021_10_13_170258_rename_and_remove_col_admin_wallet', 57),
(120, '2021_10_14_061603_column_update_order_transaction', 57),
(121, '2021_10_15_103339_remove_col_from_seller_wallet', 57),
(122, '2021_10_15_104419_add_id_col_order_tran', 57),
(123, '2021_10_15_213454_update_string_limit', 57),
(124, '2021_10_16_234037_change_col_type_translation', 57),
(125, '2021_10_16_234329_change_col_type_translation_1', 57),
(126, '2021_10_27_091250_add_shipping_address_in_order', 58),
(127, '2021_01_24_205114_create_paytabs_invoices_table', 59),
(128, '2021_11_20_043814_change_pass_reset_email_col', 59),
(129, '2021_11_25_043109_create_delivery_men_table', 60),
(130, '2021_11_25_062242_add_auth_token_delivery_man', 60),
(131, '2021_11_27_043405_add_deliveryman_in_order_table', 60),
(132, '2021_11_27_051432_create_delivery_histories_table', 60),
(133, '2021_11_27_051512_add_fcm_col_for_delivery_man', 60),
(134, '2021_12_15_123216_add_columns_to_banner', 60),
(135, '2022_01_04_100543_add_order_note_to_orders_table', 60),
(136, '2022_01_10_034952_add_lat_long_to_shipping_addresses_table', 60),
(137, '2022_01_10_045517_create_billing_addresses_table', 60),
(138, '2022_01_11_040755_add_is_billing_to_shipping_addresses_table', 60),
(139, '2022_01_11_053404_add_billing_to_orders_table', 60),
(140, '2022_01_11_234310_add_firebase_toke_to_sellers_table', 60),
(141, '2022_01_16_121801_change_colu_type', 60),
(142, '2022_01_22_101601_change_cart_col_type', 61),
(143, '2022_01_23_031359_add_column_to_orders_table', 61),
(144, '2022_01_28_235054_add_status_to_admins_table', 61),
(145, '2022_02_01_214654_add_pos_status_to_sellers_table', 61),
(146, '2019_12_14_000001_create_personal_access_tokens_table', 62),
(147, '2022_02_11_225355_add_checked_to_orders_table', 62),
(148, '2022_02_14_114359_create_refund_requests_table', 62),
(149, '2022_02_14_115757_add_refund_request_to_order_details_table', 62),
(150, '2022_02_15_092604_add_order_details_id_to_transactions_table', 62),
(151, '2022_02_15_121410_create_refund_transactions_table', 62),
(152, '2022_02_24_091236_add_multiple_column_to_refund_requests_table', 62),
(153, '2022_02_24_103827_create_refund_statuses_table', 62),
(154, '2022_03_01_121420_add_refund_id_to_refund_transactions_table', 62),
(155, '2022_03_10_091943_add_priority_to_categories_table', 63),
(156, '2022_03_13_111914_create_shipping_types_table', 63),
(157, '2022_03_13_121514_create_category_shipping_costs_table', 63),
(158, '2022_03_14_074413_add_four_column_to_products_table', 63),
(159, '2022_03_15_105838_add_shipping_to_carts_table', 63),
(160, '2022_03_16_070327_add_shipping_type_to_orders_table', 63),
(161, '2022_03_17_070200_add_delivery_info_to_orders_table', 63),
(162, '2022_03_18_143339_add_shipping_type_to_carts_table', 63),
(163, '2022_04_06_020313_create_subscriptions_table', 64),
(164, '2022_04_12_233704_change_column_to_products_table', 64),
(165, '2022_04_19_095926_create_jobs_table', 64),
(166, '2022_05_12_104247_create_wallet_transactions_table', 65),
(167, '2022_05_12_104511_add_two_column_to_users_table', 65),
(168, '2022_05_14_063309_create_loyalty_point_transactions_table', 65),
(169, '2022_05_26_044016_add_user_type_to_password_resets_table', 65),
(170, '2022_04_15_235820_add_provider', 66),
(171, '2022_07_21_101659_add_code_to_products_table', 66),
(172, '2022_07_26_103744_add_notification_count_to_notifications_table', 66),
(173, '2022_07_31_031541_add_minimum_order_qty_to_products_table', 66),
(174, '2022_08_11_172839_add_product_type_and_digital_product_type_and_digital_file_ready_to_products', 67),
(175, '2022_08_11_173941_add_product_type_and_digital_product_type_and_digital_file_to_order_details', 67),
(176, '2022_08_20_094225_add_product_type_and_digital_product_type_and_digital_file_ready_to_carts_table', 67),
(177, '2022_10_04_160234_add_banking_columns_to_delivery_men_table', 68),
(178, '2022_10_04_161339_create_deliveryman_wallets_table', 68),
(179, '2022_10_04_184506_add_deliverymanid_column_to_withdraw_requests_table', 68),
(180, '2022_10_11_103011_add_deliverymans_columns_to_chattings_table', 68),
(181, '2022_10_11_144902_add_deliverman_id_cloumn_to_reviews_table', 68),
(182, '2022_10_17_114744_create_order_status_histories_table', 68),
(183, '2022_10_17_120840_create_order_expected_delivery_histories_table', 68),
(184, '2022_10_18_084245_add_deliveryman_charge_and_expected_delivery_date', 68),
(185, '2022_10_18_130938_create_delivery_zip_codes_table', 68),
(186, '2022_10_18_130956_create_delivery_country_codes_table', 68),
(187, '2022_10_20_164712_create_delivery_man_transactions_table', 68),
(188, '2022_10_27_145604_create_emergency_contacts_table', 68),
(189, '2022_10_29_182930_add_is_pause_cause_to_orders_table', 68),
(190, '2022_10_31_150604_add_address_phone_country_code_column_to_delivery_men_table', 68),
(191, '2022_11_05_185726_add_order_id_to_reviews_table', 68),
(192, '2022_11_07_190749_create_deliveryman_notifications_table', 68),
(193, '2022_11_08_132745_change_transaction_note_type_to_withdraw_requests_table', 68),
(194, '2022_11_10_193747_chenge_order_amount_seller_amount_admin_commission_delivery_charge_tax_toorder_transactions_table', 68);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `notification_count` int(11) NOT NULL DEFAULT 0,
  `image` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `description`, `notification_count`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'test ban tin', 'ban tin', 4, 'null', 1, '2023-02-07 07:25:24', '2023-03-02 04:17:46'),
(2, 'sdsadadas', 'asdasdasdasdsa', 2, 'null', 1, '2023-02-07 07:45:16', '2023-02-14 13:47:15'),
(3, 'dffw', 'wefwefw', 1, 'null', 1, '2023-02-07 07:48:26', '2023-02-07 07:48:26'),
(4, 'weer', 'werew', 2, 'null', 1, '2023-02-07 07:54:04', '2023-02-15 22:48:38'),
(5, 'ewwefwefwe', 'wefwe', 1, 'null', 1, '2023-02-08 04:39:48', '2023-02-08 04:39:48'),
(6, 'dfsdf', 'sdfsdf', 3, 'null', 1, '2023-02-14 13:46:48', '2023-02-20 20:20:52'),
(7, 'test', 'test', 2, 'null', 1, '2023-02-15 22:30:09', '2023-02-15 22:48:35'),
(8, 'Thông báo bảo trì', 'test bảo trì', 3, '2023-02-16-63edc3a4dd1ff.png', 1, '2023-02-15 22:48:20', '2023-03-02 04:14:03'),
(9, 'sds', 'sdsd', 1, 'null', 1, '2023-02-20 20:20:56', '2023-02-20 20:20:56'),
(10, 'sdsds', 'sdsd', 1, 'null', 1, '2023-02-26 12:21:26', '2023-02-26 12:21:26'),
(11, 'toi test thong bao', 'test', 2, 'null', 1, '2023-02-26 12:21:41', '2023-03-02 04:13:55'),
(12, 'test thong bao', 'test', 1, 'null', 1, '2023-03-02 04:14:17', '2023-03-02 04:14:17'),
(13, 'fdf', 'dfdfdfdfdfdf', 1, '2023-03-02-6400251083ad1.png', 1, '2023-03-02 04:24:48', '2023-03-02 04:24:48'),
(14, 'test', 'test', 1, 'null', 1, '2023-03-02 22:58:59', '2023-03-02 22:58:59');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('03578987f7498d27c91cb2b00607c771cbb395ecb4fa15c111309b0653a5d8749c16f54d9dc814e0', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 09:08:12', '2022-12-12 09:08:12', '2023-12-12 16:08:12'),
('0915369099f84ff185556c063e0fb8c42a7f8c616f8b702330a7c73ae6105194fe1bc97c78262d70', 5, 1, 'LaravelAuthApp', '[]', 0, '2023-02-07 07:10:30', '2023-02-07 07:10:30', '2024-02-07 14:10:30'),
('26d0b877e0448ad95a1b3101984c0ca706cdd52dc94a4346f5aef6a56be7e5ee4f5acd1f6ffc29e7', 4, 1, 'LaravelAuthApp', '[]', 0, '2023-02-18 17:43:46', '2023-02-18 17:43:46', '2024-02-19 00:43:46'),
('273cf967b03b23fb06ca84a1001e14db3a93bddd0727d7ea66f8bd7518fdd5a66a334e9aefb1409c', 4, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 20:39:31', '2022-12-12 20:39:31', '2023-12-13 03:39:31'),
('43a117bd9c1d114bd70bc0f2330d03d7b4b6d0e58ac8fd2fa913e7ace610a46120bec454897b25c2', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 08:30:29', '2022-12-12 08:30:29', '2023-12-12 15:30:29'),
('45a8b196d0446f8930d4efdb0635851f9fb85fa4950d6b04cd77bcb8b3dd0de779bf233113c4a590', 4, 1, 'LaravelAuthApp', '[]', 0, '2023-02-07 07:16:40', '2023-02-07 07:16:40', '2024-02-07 14:16:40'),
('4946dcd72c4f51c8283749004084ab18eccbc6f98e915454c7902f7e13c39305d9f57f4e2510da09', 7, 1, 'LaravelAuthApp', '[]', 0, '2023-01-10 16:14:47', '2023-01-10 16:14:47', '2024-01-10 23:14:47'),
('517305a525c4ae17147b1298894b15a73f634e93cbceece41e74932307e67781a092385aa4212cbc', 4, 1, 'LaravelAuthApp', '[]', 0, '2023-02-15 22:21:53', '2023-02-15 22:21:53', '2024-02-16 05:21:53'),
('5877d8f1b2ffae6dd8c6f74b073fc528387c06884c35d0dfafcc92dff1d4b977a2a46c72fd73012c', 4, 1, 'LaravelAuthApp', '[]', 0, '2023-02-17 02:28:06', '2023-02-17 02:28:06', '2024-02-17 09:28:06'),
('5e3f41f9210c84240b8d3e538426a6feacd89dd839843f4eb1be565b7bfde398d97dab541d9a530b', 4, 1, 'LaravelAuthApp', '[]', 0, '2022-12-16 17:21:09', '2022-12-16 17:21:09', '2023-12-17 00:21:09'),
('6597f715e670e1a173d75eae0a43ce76ee6c1087044ccf3c0ba4373ef3e02101389d35e4169acfc4', 4, 1, 'LaravelAuthApp', '[]', 0, '2023-02-19 02:20:39', '2023-02-19 02:20:39', '2024-02-19 09:20:39'),
('6840b7d4ed685bf2e0dc593affa0bd3b968065f47cc226d39ab09f1422b5a1d9666601f3f60a79c1', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:25:41', '2021-07-05 09:25:41', '2022-07-05 15:25:41'),
('6f522f71f4b370c9cf947d71df5fa09432efedd494b7699265fb75b0f64ce24079057067bbce3bd9', 4, 1, 'LaravelAuthApp', '[]', 0, '2023-02-15 22:27:39', '2023-02-15 22:27:39', '2024-02-16 05:27:39'),
('718b467dfb2c64be9ac35c63fee7bbc7b8994f30866063de329221950071890d4f08152267e4203b', 5, 1, 'LaravelAuthApp', '[]', 0, '2022-12-15 22:51:59', '2022-12-15 22:51:59', '2023-12-16 05:51:59'),
('741ca7caf48ca108dbbd337471fc55ea4d523da0625b95fa3f62133fe0ea1a5f8e6d9d3a2e4ab84f', 4, 1, 'LaravelAuthApp', '[]', 0, '2023-03-02 22:57:57', '2023-03-02 22:57:57', '2024-03-03 05:57:57'),
('80af4d1ceab6aba54c3d2a0cbff8e06c768e83bfc7d6d934ad3d69dc3da825bc5a1e65f6789f7e8e', 4, 1, 'LaravelAuthApp', '[]', 0, '2023-02-26 11:48:59', '2023-02-26 11:48:59', '2024-02-26 18:48:59'),
('879edf89106f76de66885a4020f2f22019120a57d18a1419f05147d7ffd9be0f7da1dd3bb59b5f9a', 4, 1, 'LaravelAuthApp', '[]', 0, '2023-02-17 00:41:21', '2023-02-17 00:41:21', '2024-02-17 07:41:21'),
('8de7c0da9cccd4db35de97bd010175caf20040f74d92f6459640b68f8d0d99fa1623afb2872915be', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-12-11 14:16:21', '2022-12-11 14:16:21', '2023-12-11 21:16:21'),
('8f717a43141283ab6ae9a3647accd982c355bb8785e57967a955a06c5c6b274bae5c025f03f6a8df', 5, 1, 'LaravelAuthApp', '[]', 0, '2023-01-06 05:44:41', '2023-01-06 05:44:41', '2024-01-06 12:44:41'),
('a27d67de6e93872cf966cdea9949ad72803b2e5251aa995c6cd5cddd90948e404fefe9b0164ae3f3', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 09:55:53', '2022-12-12 09:55:53', '2023-12-12 16:55:53'),
('ae19126d2cf650601483e3cd736f8fcd814dc76c640343ce4174ff2ad2becff65d7324bad00f48f0', 4, 1, 'LaravelAuthApp', '[]', 0, '2023-01-06 03:54:02', '2023-01-06 03:54:02', '2024-01-06 10:54:02'),
('baf1bda4af12011a06c3de977f97e0e4199be6d5be8bbf88b470a7c5f28f1688e5a5c514f80297b5', 4, 1, 'LaravelAuthApp', '[]', 0, '2023-02-17 02:07:25', '2023-02-17 02:07:25', '2024-02-17 09:07:25'),
('c42cdd5ae652b8b2cbac4f2f4b496e889e1a803b08672954c8bbe06722b54160e71dce3e02331544', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:24:36', '2021-07-05 09:24:36', '2022-07-05 15:24:36'),
('ccc8814a81697edb16efdb38610da21521723a0ae141feee3a5c15e7c2352dee8ec6225a517db2a5', 4, 1, 'LaravelAuthApp', '[]', 0, '2023-02-14 08:59:27', '2023-02-14 08:59:27', '2024-02-14 15:59:27'),
('d20424b9fb10fb82b94bc27166cb7da75ad45b315f604d952c6596203168e4c1c96ac84b282ee57c', 4, 1, 'LaravelAuthApp', '[]', 0, '2023-02-07 07:41:30', '2023-02-07 07:41:30', '2024-02-07 14:41:30'),
('d9aa190e58c078412ac36135d9dd9123957b95fb439097ebdcb5447e77df34b92731e61a30e90bb5', 4, 1, 'LaravelAuthApp', '[]', 0, '2022-12-15 10:22:17', '2022-12-15 10:22:17', '2023-12-15 17:22:17'),
('dbb556806a17dcb5839dd3f210ed3364b986da0df60e260b3744c8078d9ddef890cf6c3d9508a89c', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 08:32:05', '2022-12-12 08:32:05', '2023-12-12 15:32:05'),
('f0d97a74f64d154f59451b176476cb34ecdbf534f14459576dddb0d4b639bec53eae64f4f894eff0', 4, 1, 'LaravelAuthApp', '[]', 0, '2023-01-04 20:44:56', '2023-01-04 20:44:56', '2024-01-05 03:44:56'),
('f222bea363c4517b6998ef3ea669fc77148c6881ef10fb76fea312f91213a2819520e2443375cd1f', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 07:32:19', '2022-12-12 07:32:19', '2023-12-12 14:32:19');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`, `provider`) VALUES
(1, NULL, 'james', 'GEUx5tqkviM6AAQcz4oi1dcm1KtRdJPgw41lj0eI', 'http://localhost', 1, 0, 0, '2020-10-21 18:27:22', '2020-10-21 18:27:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-21 18:27:23', '2020-10-21 18:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `customer_type` varchar(10) DEFAULT NULL,
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(50) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(100) DEFAULT NULL,
  `transaction_ref` varchar(30) DEFAULT NULL,
  `order_amount` double NOT NULL DEFAULT 0,
  `is_pause` varchar(20) NOT NULL DEFAULT '0',
  `cause` varchar(191) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT 0,
  `discount_type` varchar(30) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `shipping_method_id` bigint(20) NOT NULL DEFAULT 0,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `order_group_id` varchar(191) NOT NULL DEFAULT 'def-order-group',
  `verification_code` varchar(191) NOT NULL DEFAULT '0',
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `shipping_address_data` text DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `deliveryman_charge` double NOT NULL DEFAULT 0,
  `expected_delivery_date` date DEFAULT NULL,
  `order_note` text DEFAULT NULL,
  `billing_address` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_data` text DEFAULT NULL,
  `order_type` varchar(191) NOT NULL DEFAULT 'default_type',
  `extra_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `extra_discount_type` varchar(191) DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_type` varchar(191) DEFAULT NULL,
  `delivery_type` varchar(191) DEFAULT NULL,
  `delivery_service_name` varchar(191) DEFAULT NULL,
  `third_party_delivery_tracking_id` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `customer_type`, `payment_status`, `order_status`, `payment_method`, `transaction_ref`, `order_amount`, `is_pause`, `cause`, `shipping_address`, `created_at`, `updated_at`, `discount_amount`, `discount_type`, `coupon_code`, `shipping_method_id`, `shipping_cost`, `order_group_id`, `verification_code`, `seller_id`, `seller_is`, `shipping_address_data`, `delivery_man_id`, `deliveryman_charge`, `expected_delivery_date`, `order_note`, `billing_address`, `billing_address_data`, `order_type`, `extra_discount`, `extra_discount_type`, `checked`, `shipping_type`, `delivery_type`, `delivery_service_name`, `third_party_delivery_tracking_id`) VALUES
(100001, '4', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 520005, '0', NULL, '1', '2022-12-15 10:27:10', '2022-12-15 11:06:30', 0, NULL, '0', 2, 5.00, '3078-Bj95k-1671125230', '674865', 1, 'admin', '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T17:26:58.000000Z\",\"updated_at\":\"2022-12-15T17:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100002, '4', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 1040005, '0', NULL, '1', '2022-12-15 11:04:54', '2023-01-06 00:57:21', 0, NULL, '0', 2, 5.00, '7260-M8OzG-1671127494', '299141', 1, 'admin', '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T17:26:58.000000Z\",\"updated_at\":\"2022-12-15T17:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T17:26:58.000000Z\",\"updated_at\":\"2022-12-15T17:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100003, '4', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 776805, '0', NULL, '1', '2022-12-16 17:22:40', '2023-01-04 09:04:16', 0, NULL, NULL, 2, 5.00, '4-745243-1671236560', '165153', 1, 'admin', '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T17:26:58.000000Z\",\"updated_at\":\"2022-12-15T17:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 2, '{\"id\":2,\"customer_id\":4,\"contact_person_name\":\"test test\",\"address_type\":\"Home\",\"address\":\"rere344\",\"city\":\"hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-17T00:22:33.000000Z\",\"updated_at\":\"2022-12-17T00:22:33.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":1}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100004, '4', 'customer', 'paid', 'returned', 'cash_on_delivery', '', 346805, '0', NULL, '1', '2023-01-04 20:16:45', '2023-01-06 00:50:59', 0, NULL, '0', 2, 5.00, '1843-vq1bB-1672888605', '895909', 1, 'admin', '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T17:26:58.000000Z\",\"updated_at\":\"2022-12-15T17:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T17:26:58.000000Z\",\"updated_at\":\"2022-12-15T17:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100005, '4', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 150005, '0', NULL, '1', '2023-01-04 20:27:31', '2023-01-04 20:27:51', 0, NULL, '0', 2, 5.00, '2743-Ekzpb-1672889251', '775245', 1, 'admin', '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T17:26:58.000000Z\",\"updated_at\":\"2022-12-15T17:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T17:26:58.000000Z\",\"updated_at\":\"2022-12-15T17:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100006, '4', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 150005, '0', NULL, '1', '2023-01-04 20:28:41', '2023-01-06 01:05:10', 0, NULL, '0', 2, 5.00, '4430-5bAS4-1672889321', '331903', 1, 'admin', '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T17:26:58.000000Z\",\"updated_at\":\"2022-12-15T17:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T17:26:58.000000Z\",\"updated_at\":\"2022-12-15T17:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100007, '4', 'customer', 'paid', 'processing', 'cash_on_delivery', '', 400005, '0', NULL, '1', '2023-01-04 20:30:33', '2023-01-10 16:31:28', 0, NULL, '0', 2, 5.00, '4828-c1tiM-1672889433', '649793', 1, 'seller', '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T17:26:58.000000Z\",\"updated_at\":\"2022-12-15T17:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T17:26:58.000000Z\",\"updated_at\":\"2022-12-15T17:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100008, '4', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 776805, '0', NULL, '1', '2023-01-06 05:56:19', '2023-01-06 05:56:30', 0, NULL, '0', 2, 5.00, '2173-PF2Qv-1673009779', '284463', 1, 'admin', '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T17:26:58.000000Z\",\"updated_at\":\"2022-12-15T17:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T17:26:58.000000Z\",\"updated_at\":\"2022-12-15T17:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100009, '7', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 2875005, '0', NULL, '5', '2023-01-10 16:08:22', '2023-01-10 16:10:31', 0, NULL, '0', 2, 5.00, '7452-fH4Ba-1673392102', '209889', 1, 'admin', '{\"id\":5,\"customer_id\":7,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"home\",\"address\":\"Toi viet nam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826123123\",\"created_at\":\"2023-01-10T23:08:21.000000Z\",\"updated_at\":\"2023-01-10T23:08:21.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100010, '7', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 520005, '0', NULL, '5', '2023-01-10 16:13:45', '2023-01-10 16:13:52', 0, NULL, '0', 2, 5.00, '6801-VHShw-1673392425', '142224', 1, 'admin', '{\"id\":5,\"customer_id\":7,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"home\",\"address\":\"Toi viet nam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826123123\",\"created_at\":\"2023-01-10T23:08:21.000000Z\",\"updated_at\":\"2023-01-10T23:08:21.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 5, '{\"id\":5,\"customer_id\":7,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"home\",\"address\":\"Toi viet nam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826123123\",\"created_at\":\"2023-01-10T23:08:21.000000Z\",\"updated_at\":\"2023-01-10T23:08:21.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100011, '7', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 2829005, '0', NULL, '5', '2023-01-10 16:15:30', '2023-01-10 16:16:00', 0, NULL, '0', 2, 5.00, '3115-rjv6j-1673392530', '974598', 1, 'admin', '{\"id\":5,\"customer_id\":7,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"home\",\"address\":\"Toi viet nam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826123123\",\"created_at\":\"2023-01-10T23:08:21.000000Z\",\"updated_at\":\"2023-01-10T23:08:21.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 5, '{\"id\":5,\"customer_id\":7,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"home\",\"address\":\"Toi viet nam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826123123\",\"created_at\":\"2023-01-10T23:08:21.000000Z\",\"updated_at\":\"2023-01-10T23:08:21.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100012, '7', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 246005, '0', NULL, '5', '2023-01-10 16:15:50', '2023-01-10 16:16:00', 0, NULL, '0', 2, 5.00, '1284-NhrZg-1673392550', '494808', 1, 'admin', '{\"id\":5,\"customer_id\":7,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"home\",\"address\":\"Toi viet nam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826123123\",\"created_at\":\"2023-01-10T23:08:21.000000Z\",\"updated_at\":\"2023-01-10T23:08:21.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 5, '{\"id\":5,\"customer_id\":7,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"home\",\"address\":\"Toi viet nam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826123123\",\"created_at\":\"2023-01-10T23:08:21.000000Z\",\"updated_at\":\"2023-01-10T23:08:21.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100013, '7', 'customer', 'unpaid', 'processing', 'cash_on_delivery', '', 400005, '0', NULL, '5', '2023-01-10 16:31:07', '2023-01-10 16:31:38', 0, NULL, '0', 2, 5.00, '7910-IYlOH-1673393467', '670695', 1, 'seller', '{\"id\":5,\"customer_id\":7,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"home\",\"address\":\"Toi viet nam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826123123\",\"created_at\":\"2023-01-10T23:08:21.000000Z\",\"updated_at\":\"2023-01-10T23:08:21.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 5, '{\"id\":5,\"customer_id\":7,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"home\",\"address\":\"Toi viet nam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826123123\",\"created_at\":\"2023-01-10T23:08:21.000000Z\",\"updated_at\":\"2023-01-10T23:08:21.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100014, '7', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 1428005, '0', NULL, '5', '2023-01-10 16:35:32', '2023-01-10 16:36:36', 0, NULL, NULL, 2, 5.00, '7-570360-1673393732', '311899', 1, 'seller', '{\"id\":5,\"customer_id\":7,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"home\",\"address\":\"Toi viet nam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826123123\",\"created_at\":\"2023-01-10T23:08:21.000000Z\",\"updated_at\":\"2023-01-10T23:08:21.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 6, '{\"id\":6,\"customer_id\":7,\"contact_person_name\":\"Nguyen Tuan\",\"address_type\":\"Home\",\"address\":\"hai phong\",\"city\":\"ha noi\",\"zip\":\"100000\",\"phone\":\"0826138234\",\"created_at\":\"2023-01-10T23:35:27.000000Z\",\"updated_at\":\"2023-01-10T23:35:27.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"37.42342342342342\",\"longitude\":\"-122.08395287867832\",\"is_billing\":1}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100015, '7', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 520005, '0', NULL, '5', '2023-01-10 16:48:05', '2023-01-10 18:47:54', 0, NULL, NULL, 2, 5.00, '7-960929-1673394485', '466523', 1, 'admin', '{\"id\":5,\"customer_id\":7,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"home\",\"address\":\"Toi viet nam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826123123\",\"created_at\":\"2023-01-10T23:08:21.000000Z\",\"updated_at\":\"2023-01-10T23:08:21.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 6, '{\"id\":6,\"customer_id\":7,\"contact_person_name\":\"Nguyen Tuan\",\"address_type\":\"Home\",\"address\":\"hai phong\",\"city\":\"ha noi\",\"zip\":\"100000\",\"phone\":\"0826138234\",\"created_at\":\"2023-01-10T23:35:27.000000Z\",\"updated_at\":\"2023-01-10T23:35:27.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"37.42342342342342\",\"longitude\":\"-122.08395287867832\",\"is_billing\":1}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100016, '4', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 910005, '0', NULL, '1', '2023-02-13 18:10:56', '2023-02-13 18:27:00', 0, NULL, '0', 2, 5.00, '6797-WIiWU-1676337056', '512304', 1, 'admin', '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T17:26:58.000000Z\",\"updated_at\":\"2022-12-15T17:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, 'sdsdsdsd', 1, '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T17:26:58.000000Z\",\"updated_at\":\"2022-12-15T17:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100017, '4', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 319805, '0', NULL, '3', '2023-02-15 22:24:35', '2023-02-15 22:30:30', 0, NULL, NULL, 2, 5.00, '4-804686-1676525075', '380979', 1, 'admin', '{\"id\":3,\"customer_id\":4,\"contact_person_name\":\"test test\",\"address_type\":\"Home\",\"address\":\"Vietnam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2023-01-06T11:45:47.000000Z\",\"updated_at\":\"2023-01-06T11:45:47.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', NULL, 0, NULL, NULL, 2, '{\"id\":2,\"customer_id\":4,\"contact_person_name\":\"test test\",\"address_type\":\"Home\",\"address\":\"rere344\",\"city\":\"hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-17T00:22:33.000000Z\",\"updated_at\":\"2022-12-17T00:22:33.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":1}', 'default_type', 0.00, NULL, 1, 'category_wise', NULL, NULL, NULL),
(100018, '4', 'customer', 'unpaid', 'confirmed', 'cash_on_delivery', '', 800000, '0', NULL, '3', '2023-02-15 22:24:41', '2023-02-15 22:30:45', 0, NULL, NULL, 0, 0.00, '4-804686-1676525075', '708865', 1, 'seller', '{\"id\":3,\"customer_id\":4,\"contact_person_name\":\"test test\",\"address_type\":\"Home\",\"address\":\"Vietnam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2023-01-06T11:45:47.000000Z\",\"updated_at\":\"2023-01-06T11:45:47.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', NULL, 0, NULL, NULL, 2, '{\"id\":2,\"customer_id\":4,\"contact_person_name\":\"test test\",\"address_type\":\"Home\",\"address\":\"rere344\",\"city\":\"hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-17T00:22:33.000000Z\",\"updated_at\":\"2022-12-17T00:22:33.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":1}', 'default_type', 0.00, NULL, 1, 'category_wise', NULL, NULL, NULL),
(100019, '4', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 1040000, '0', NULL, '3', '2023-02-15 22:34:37', '2023-02-15 22:37:40', 0, NULL, NULL, 0, 0.00, '4-323809-1676525677', '434212', 1, 'admin', '{\"id\":3,\"customer_id\":4,\"contact_person_name\":\"test test\",\"address_type\":\"Home\",\"address\":\"Vietnam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2023-01-06T11:45:47.000000Z\",\"updated_at\":\"2023-01-06T11:45:47.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', NULL, 0, NULL, NULL, 2, '{\"id\":2,\"customer_id\":4,\"contact_person_name\":\"test test\",\"address_type\":\"Home\",\"address\":\"rere344\",\"city\":\"hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-17T00:22:33.000000Z\",\"updated_at\":\"2022-12-17T00:22:33.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":1}', 'default_type', 0.00, NULL, 1, 'category_wise', NULL, NULL, NULL),
(100020, '4', 'customer', 'unpaid', 'processing', 'cash_on_delivery', '', 380000, '0', NULL, '3', '2023-02-15 22:47:37', '2023-02-15 22:47:57', 0, NULL, NULL, 0, 0.00, '4-889308-1676526457', '505502', 1, 'admin', '{\"id\":3,\"customer_id\":4,\"contact_person_name\":\"test test\",\"address_type\":\"Home\",\"address\":\"Vietnam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2023-01-06T11:45:47.000000Z\",\"updated_at\":\"2023-01-06T11:45:47.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', NULL, 0, NULL, NULL, 2, '{\"id\":2,\"customer_id\":4,\"contact_person_name\":\"test test\",\"address_type\":\"Home\",\"address\":\"rere344\",\"city\":\"hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-17T00:22:33.000000Z\",\"updated_at\":\"2022-12-17T00:22:33.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":1}', 'default_type', 0.00, NULL, 1, 'category_wise', NULL, NULL, NULL),
(100021, '4', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 240000, '0', NULL, '1', '2023-02-18 18:22:38', '2023-02-19 02:08:04', 0, NULL, '0', 0, 0.00, '2736-NbBeU-1676744558', '897091', 1, 'admin', '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T10:26:58.000000Z\",\"updated_at\":\"2022-12-15T10:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T10:26:58.000000Z\",\"updated_at\":\"2022-12-15T10:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'category_wise', NULL, NULL, NULL),
(100022, '4', 'customer', 'paid', 'confirmed', 'vnpay', '6496-f0zaZ-1676744887', 520000, '0', NULL, '1', '2023-02-18 18:28:07', '2023-02-19 02:08:04', 0, NULL, '0', 0, 0.00, '6496-f0zaZ-1676744887', '525924', 1, 'admin', '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T10:26:58.000000Z\",\"updated_at\":\"2022-12-15T10:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T10:26:58.000000Z\",\"updated_at\":\"2022-12-15T10:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'category_wise', NULL, NULL, NULL),
(100023, '4', 'customer', 'paid', 'confirmed', 'vnpay', '7072-Om6hI-1676918685', 240000, '0', NULL, '1', '2023-02-20 18:44:45', '2023-02-20 18:44:55', 0, NULL, '0', 0, 0.00, '7072-Om6hI-1676918685', '153230', 1, 'admin', '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T10:26:58.000000Z\",\"updated_at\":\"2022-12-15T10:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T10:26:58.000000Z\",\"updated_at\":\"2022-12-15T10:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'category_wise', NULL, NULL, NULL),
(100024, '4', 'customer', 'paid', 'delivered', 'vnpay', '3238-wKkjy-1676925227', 5742000, '0', NULL, '3', '2023-02-20 20:33:47', '2023-02-20 20:34:37', 0, NULL, '0', 12, 30000.00, '3238-wKkjy-1676925227', '260008', 1, 'seller', '{\"id\":3,\"customer_id\":4,\"contact_person_name\":\"test test\",\"address_type\":\"Home\",\"address\":\"Vietnam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2023-01-06T04:45:47.000000Z\",\"updated_at\":\"2023-01-06T04:45:47.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":0}', NULL, 0, NULL, NULL, 2, '{\"id\":2,\"customer_id\":4,\"contact_person_name\":\"test test\",\"address_type\":\"Home\",\"address\":\"rere344\",\"city\":\"hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-16T17:22:33.000000Z\",\"updated_at\":\"2022-12-16T17:22:33.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":1}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100025, '10', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 1458000, '0', NULL, '8', '2023-02-26 11:24:14', '2023-02-26 12:20:07', 0, NULL, '0', 12, 30000.00, '8344-Mp1PX-1677410654', '993862', 1, 'seller', '{\"id\":8,\"customer_id\":10,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"permanent\",\"address\":\"SDU Tower, Tr\\u1ea7n Ph\\u00fa, l\\u00e0ng V\\u0103n Qu\\u00e1n, V\\u0103n Qu\\u00e1n, H\\u00e0 \\u0110\\u00f4ng, Hanoi, Vietnam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2023-02-26T11:23:50.000000Z\",\"updated_at\":\"2023-02-26T11:23:50.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"20.98123849084675\",\"longitude\":\"105.78958891534461\",\"is_billing\":0}', NULL, 0, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100026, '10', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 430000, '0', NULL, '8', '2023-02-26 12:22:53', '2023-03-02 21:10:44', 0, NULL, '0', 12, 30000.00, '3677-UNi1I-1677414173', '218500', 1, 'seller', '{\"id\":8,\"customer_id\":10,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"permanent\",\"address\":\"SDU Tower, Tr\\u1ea7n Ph\\u00fa, l\\u00e0ng V\\u0103n Qu\\u00e1n, V\\u0103n Qu\\u00e1n, H\\u00e0 \\u0110\\u00f4ng, Hanoi, Vietnam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2023-02-26T11:23:50.000000Z\",\"updated_at\":\"2023-02-26T11:23:50.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"20.98123849084675\",\"longitude\":\"105.78958891534461\",\"is_billing\":0}', NULL, 0, NULL, NULL, 8, '{\"id\":8,\"customer_id\":10,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"permanent\",\"address\":\"SDU Tower, Tr\\u1ea7n Ph\\u00fa, l\\u00e0ng V\\u0103n Qu\\u00e1n, V\\u0103n Qu\\u00e1n, H\\u00e0 \\u0110\\u00f4ng, Hanoi, Vietnam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2023-02-26T11:23:50.000000Z\",\"updated_at\":\"2023-02-26T11:23:50.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"20.98123849084675\",\"longitude\":\"105.78958891534461\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100027, '10', 'customer', 'paid', 'confirmed', 'vnpay', '3202-Hc0ms-1677414260', 410000, '0', NULL, '8', '2023-02-26 12:24:20', '2023-02-26 12:24:30', 0, NULL, '0', 11, 10000.00, '3202-Hc0ms-1677414260', '165944', 1, 'seller', '{\"id\":8,\"customer_id\":10,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"permanent\",\"address\":\"SDU Tower, Tr\\u1ea7n Ph\\u00fa, l\\u00e0ng V\\u0103n Qu\\u00e1n, V\\u0103n Qu\\u00e1n, H\\u00e0 \\u0110\\u00f4ng, Hanoi, Vietnam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2023-02-26T11:23:50.000000Z\",\"updated_at\":\"2023-02-26T11:23:50.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"20.98123849084675\",\"longitude\":\"105.78958891534461\",\"is_billing\":0}', NULL, 0, NULL, NULL, 8, '{\"id\":8,\"customer_id\":10,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"permanent\",\"address\":\"SDU Tower, Tr\\u1ea7n Ph\\u00fa, l\\u00e0ng V\\u0103n Qu\\u00e1n, V\\u0103n Qu\\u00e1n, H\\u00e0 \\u0110\\u00f4ng, Hanoi, Vietnam\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2023-02-26T11:23:50.000000Z\",\"updated_at\":\"2023-02-26T11:23:50.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"20.98123849084675\",\"longitude\":\"105.78958891534461\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100028, '12', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 1388000, '0', NULL, '9', '2023-02-27 13:59:17', '2023-02-27 13:59:37', 50000, 'coupon_discount', 'GIAMNGAYPHUNU', 11, 10000.00, '3748-PTucH-1677506357', '982964', 1, 'seller', '{\"id\":9,\"customer_id\":12,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"permanent\",\"address\":\"132 P.Y\\u00ean L\\u00e3ng\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2023-02-27T13:59:12.000000Z\",\"updated_at\":\"2023-02-27T13:59:12.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"21.009902789902444\",\"longitude\":\"105.8151626586914\",\"is_billing\":0}', NULL, 0, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100029, '12', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 400000, '0', NULL, '9', '2023-03-02 02:37:39', '2023-03-02 20:57:21', 0, NULL, '0', 9, 10000.00, '7673-K7rLT-1677724659', '222622', 1, 'admin', '{\"id\":9,\"customer_id\":12,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"permanent\",\"address\":\"132 P.Y\\u00ean L\\u00e3ng\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2023-02-27T13:59:12.000000Z\",\"updated_at\":\"2023-02-27T13:59:12.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"21.009902789902444\",\"longitude\":\"105.8151626586914\",\"is_billing\":0}', NULL, 0, NULL, NULL, 9, '{\"id\":9,\"customer_id\":12,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"permanent\",\"address\":\"132 P.Y\\u00ean L\\u00e3ng\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2023-02-27T13:59:12.000000Z\",\"updated_at\":\"2023-02-27T13:59:12.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"21.009902789902444\",\"longitude\":\"105.8151626586914\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100030, '12', 'customer', 'paid', 'delivered', 'vnpay', '3057-lX8dQ-1677724859', 1458000, '0', NULL, '9', '2023-03-02 02:40:59', '2023-03-02 20:58:11', 0, NULL, '0', 12, 30000.00, '3057-lX8dQ-1677724859', '735324', 1, 'seller', '{\"id\":9,\"customer_id\":12,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"permanent\",\"address\":\"132 P.Y\\u00ean L\\u00e3ng\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2023-02-27T13:59:12.000000Z\",\"updated_at\":\"2023-02-27T13:59:12.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"21.009902789902444\",\"longitude\":\"105.8151626586914\",\"is_billing\":0}', NULL, 0, NULL, NULL, 9, '{\"id\":9,\"customer_id\":12,\"contact_person_name\":\"Nguy\\u1ec5n V\\u0103n An\",\"address_type\":\"permanent\",\"address\":\"132 P.Y\\u00ean L\\u00e3ng\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2023-02-27T13:59:12.000000Z\",\"updated_at\":\"2023-02-27T13:59:12.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"21.009902789902444\",\"longitude\":\"105.8151626586914\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100031, '4', 'customer', 'paid', 'confirmed', 'vnpay', '1966-rdDMy-1677730062', 3686000, '0', NULL, '10', '2023-03-02 04:07:42', '2023-03-02 04:09:23', 0, NULL, '0', 12, 30000.00, '1966-rdDMy-1677730062', '776552', 1, 'seller', '{\"id\":10,\"customer_id\":4,\"contact_person_name\":\"test test\",\"address_type\":\"Home\",\"address\":\"7 \\u0110. Ph\\u00f9ng H\\u01b0ng, P. V\\u0103n Qu\\u00e1n, H\\u00e0 \\u0110\\u00f4ng, H\\u00e0 N\\u1ed9i, Vietnam\",\"city\":\"H\\u00e0 N\\u1ed9i\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2023-03-02T04:03:49.000000Z\",\"updated_at\":\"2023-03-02T04:03:49.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"20.97297301893069\",\"longitude\":\"105.78296273946762\",\"is_billing\":0}', NULL, 0, NULL, NULL, 2, '{\"id\":2,\"customer_id\":4,\"contact_person_name\":\"test test\",\"address_type\":\"Home\",\"address\":\"rere344\",\"city\":\"hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-16T17:22:33.000000Z\",\"updated_at\":\"2022-12-16T17:22:33.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":1}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100032, '4', 'customer', 'paid', 'confirmed', 'vnpay', '3261-q713q-1677730148', 530000, '0', NULL, '10', '2023-03-02 04:09:08', '2023-03-02 04:09:23', 0, NULL, '0', 9, 10000.00, '3261-q713q-1677730148', '526861', 1, 'admin', '{\"id\":10,\"customer_id\":4,\"contact_person_name\":\"test test\",\"address_type\":\"Home\",\"address\":\"7 \\u0110. Ph\\u00f9ng H\\u01b0ng, P. V\\u0103n Qu\\u00e1n, H\\u00e0 \\u0110\\u00f4ng, H\\u00e0 N\\u1ed9i, Vietnam\",\"city\":\"H\\u00e0 N\\u1ed9i\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2023-03-02T04:03:49.000000Z\",\"updated_at\":\"2023-03-02T04:03:49.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"20.97297301893069\",\"longitude\":\"105.78296273946762\",\"is_billing\":0}', NULL, 0, NULL, NULL, 2, '{\"id\":2,\"customer_id\":4,\"contact_person_name\":\"test test\",\"address_type\":\"Home\",\"address\":\"rere344\",\"city\":\"hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-16T17:22:33.000000Z\",\"updated_at\":\"2022-12-16T17:22:33.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":1}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100033, '4', 'customer', 'paid', 'confirmed', 'vnpay', '1012-DmXRn-1677776225', 1288290, '0', NULL, '10', '2023-03-02 16:57:05', '2023-03-02 20:57:09', 0, NULL, '0', 10, 30000.00, '1012-DmXRn-1677776225', '346837', 1, 'admin', '{\"id\":10,\"customer_id\":4,\"contact_person_name\":\"test test\",\"address_type\":\"Home\",\"address\":\"7 \\u0110. Ph\\u00f9ng H\\u01b0ng, P. V\\u0103n Qu\\u00e1n, H\\u00e0 \\u0110\\u00f4ng, H\\u00e0 N\\u1ed9i, Vietnam\",\"city\":\"H\\u00e0 N\\u1ed9i\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2023-03-02T04:03:49.000000Z\",\"updated_at\":\"2023-03-02T04:03:49.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"20.97297301893069\",\"longitude\":\"105.78296273946762\",\"is_billing\":0}', NULL, 0, NULL, NULL, 2, '{\"id\":2,\"customer_id\":4,\"contact_person_name\":\"test test\",\"address_type\":\"Home\",\"address\":\"rere344\",\"city\":\"hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-16T17:22:33.000000Z\",\"updated_at\":\"2022-12-16T17:22:33.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":1}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100034, '4', 'customer', 'paid', 'confirmed', 'vnpay', '9065-7mqtK-1677791195', 826000, '0', NULL, '10', '2023-03-02 21:06:35', '2023-03-02 21:07:03', 0, NULL, '0', 9, 10000.00, '9065-7mqtK-1677791195', '832498', 1, 'admin', '{\"id\":10,\"customer_id\":4,\"contact_person_name\":\"test test\",\"address_type\":\"Home\",\"address\":\"7 \\u0110. Ph\\u00f9ng H\\u01b0ng, P. V\\u0103n Qu\\u00e1n, H\\u00e0 \\u0110\\u00f4ng, H\\u00e0 N\\u1ed9i, Vietnam\",\"city\":\"H\\u00e0 N\\u1ed9i\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2023-03-02T04:03:49.000000Z\",\"updated_at\":\"2023-03-02T04:03:49.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"20.97297301893069\",\"longitude\":\"105.78296273946762\",\"is_billing\":0}', NULL, 0, NULL, NULL, 2, '{\"id\":2,\"customer_id\":4,\"contact_person_name\":\"test test\",\"address_type\":\"Home\",\"address\":\"rere344\",\"city\":\"hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-16T17:22:33.000000Z\",\"updated_at\":\"2022-12-16T17:22:33.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"0.0\",\"longitude\":\"0.0\",\"is_billing\":1}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100035, '4', 'customer', 'paid', 'confirmed', 'vnpay', '8911-TR49U-1677797831', 430000, '0', NULL, '1', '2023-03-02 22:57:11', '2023-03-02 22:57:17', 0, NULL, '0', 12, 30000.00, '8911-TR49U-1677797831', '123506', 1, 'seller', '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T10:26:58.000000Z\",\"updated_at\":\"2022-12-15T10:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T10:26:58.000000Z\",\"updated_at\":\"2022-12-15T10:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100036, '4', 'customer', 'paid', 'confirmed', 'vnpay', '8911-TR49U-1677797831', 1268290, '0', NULL, '1', '2023-03-02 22:57:21', '2023-03-02 22:57:29', 0, NULL, '0', 9, 10000.00, '8911-TR49U-1677797831', '668880', 1, 'admin', '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T10:26:58.000000Z\",\"updated_at\":\"2022-12-15T10:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T10:26:58.000000Z\",\"updated_at\":\"2022-12-15T10:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100037, '4', 'customer', 'paid', 'confirmed', 'vnpay', '5266-d6sJL-1677805546', 530000, '0', NULL, '1', '2023-03-03 01:05:46', '2023-03-03 01:05:58', 0, NULL, '0', 9, 10000.00, '5266-d6sJL-1677805546', '438934', 1, 'admin', '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T10:26:58.000000Z\",\"updated_at\":\"2022-12-15T10:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T10:26:58.000000Z\",\"updated_at\":\"2022-12-15T10:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100038, '4', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 410000, '0', NULL, '1', '2023-03-03 01:06:18', '2023-03-03 01:06:26', 0, NULL, '0', 11, 10000.00, '9840-Bgx2E-1677805578', '565788', 1, 'seller', '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T10:26:58.000000Z\",\"updated_at\":\"2022-12-15T10:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":4,\"contact_person_name\":\"dwdwd\",\"address_type\":\"permanent\",\"address\":\"wdwedqwdqwdqw\",\"city\":\"Hanoi\",\"zip\":\"100000\",\"phone\":\"0826132234\",\"created_at\":\"2022-12-15T10:26:58.000000Z\",\"updated_at\":\"2022-12-15T10:26:58.000000Z\",\"state\":null,\"country\":\"Viet Nam\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `digital_file_after_sell` varchar(191) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `delivery_status` varchar(15) NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `variation` varchar(255) DEFAULT NULL,
  `discount_type` varchar(30) DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT 1,
  `refund_request` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `digital_file_after_sell`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(1, 100001, 1, 1, NULL, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C N\\u1ec8 UNISEX - TOTODAY - SPARKY\",\"slug\":\"ao-khoac-ni-unisex-totoday-sparky-Rlofwi\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-12-63976b30c11c9.png\\\",\\\"2022-12-12-63976b30c25ac.png\\\"]\",\"thumbnail\":\"2022-12-12-63976b30c27ba.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#0000FF\\\",\\\"#8B0000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"M\\\",\\\"L\\\",\\\"XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Blue-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Blue-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Blue-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"DarkRed-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"DarkRed-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"DarkRed-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":520000,\"purchase_price\":520000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":6,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-12T17:56:00.000000Z\",\"updated_at\":\"2022-12-12T17:56:04.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"abc\",\"meta_description\":null,\"meta_image\":\"2022-12-12-63976b30c2cbf.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"104241\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 520000, 0, 0, 'pending', 'unpaid', '2022-12-15 10:27:10', '2022-12-15 10:27:10', NULL, 'Blue-M', '{\"color\":\"Blue\",\"size\":\"M\"}', 'discount_on_product', 1, 0),
(2, 100002, 1, 1, NULL, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C N\\u1ec8 UNISEX - TOTODAY - SPARKY\",\"slug\":\"ao-khoac-ni-unisex-totoday-sparky-Rlofwi\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-12-63976b30c11c9.png\\\",\\\"2022-12-12-63976b30c25ac.png\\\"]\",\"thumbnail\":\"2022-12-12-63976b30c27ba.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#0000FF\\\",\\\"#8B0000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"M\\\",\\\"L\\\",\\\"XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Blue-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":0},{\\\"type\\\":\\\"Blue-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Blue-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"DarkRed-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"DarkRed-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"DarkRed-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":520000,\"purchase_price\":520000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":5,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-12T17:56:00.000000Z\",\"updated_at\":\"2022-12-15T17:27:10.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"abc\",\"meta_description\":null,\"meta_image\":\"2022-12-12-63976b30c2cbf.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"104241\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 520000, 0, 0, 'delivered', 'unpaid', '2022-12-15 11:04:54', '2023-01-06 00:57:21', NULL, 'Blue-L', '{\"color\":\"Blue\",\"size\":\"L\"}', 'discount_on_product', 1, 0),
(3, 100002, 1, 1, NULL, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C N\\u1ec8 UNISEX - TOTODAY - SPARKY\",\"slug\":\"ao-khoac-ni-unisex-totoday-sparky-Rlofwi\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-12-63976b30c11c9.png\\\",\\\"2022-12-12-63976b30c25ac.png\\\"]\",\"thumbnail\":\"2022-12-12-63976b30c27ba.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#0000FF\\\",\\\"#8B0000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"M\\\",\\\"L\\\",\\\"XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Blue-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":0},{\\\"type\\\":\\\"Blue-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":0},{\\\"type\\\":\\\"Blue-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"DarkRed-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"DarkRed-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"DarkRed-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":520000,\"purchase_price\":520000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":4,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-12T17:56:00.000000Z\",\"updated_at\":\"2022-12-15T18:04:54.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"abc\",\"meta_description\":null,\"meta_image\":\"2022-12-12-63976b30c2cbf.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"104241\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 520000, 0, 0, 'delivered', 'unpaid', '2022-12-15 11:04:54', '2023-01-06 00:57:21', NULL, 'DarkRed-M', '{\"color\":\"DarkRed\",\"size\":\"M\"}', 'discount_on_product', 1, 0),
(4, 100003, 3, 1, NULL, '{\"id\":3,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C VARSITY UNISEX - TOTODAY - JOVIAL\",\"slug\":\"ao-khoac-varsity-unisex-totoday-jovial-6LDbRN\",\"product_type\":\"digital\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":null,\"min_qty\":1,\"refundable\":1,\"digital_product_type\":\"ready_product\",\"digital_file_ready\":\"2022-12-16-639c28e7b1d3b.jpg\",\"images\":\"[\\\"2022-12-16-639c28e7b03d2.png\\\",\\\"2022-12-16-639c28e7b1537.png\\\"]\",\"thumbnail\":\"2022-12-16-639c28e7b1ab0.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[]\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":430000,\"purchase_price\":430000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":0,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-16T08:14:31.000000Z\",\"updated_at\":\"2022-12-16T08:14:35.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u00c1O KHO\\u00c1C VARSITY UNISEX - TOTODAY - JOVIAL\",\"meta_description\":\"\\u00bb\\u00a0B\\u1ea2O H\\u00c0NH S\\u1ea2N PH\\u1ea8M\\u00a090 NG\\u00c0Y\\r\\n\\r\\n\\u00bb \\u0110\\u1ed4I H\\u00c0NG TRONG V\\u00d2NG 30 NG\\u00c0Y\\r\\n\\r\\n\\u00bb\\u00a0HOTLINE B\\u00c1N H\\u00c0NG 1900 633 501\",\"meta_image\":\"2022-12-16-639c28e7b218f.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"188546\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 430000, 0, 0, 'pending', 'unpaid', '2022-12-16 17:22:40', '2022-12-16 17:22:40', NULL, '', '[]', 'discount_on_product', 1, 0),
(5, 100003, 6, 1, NULL, '{\"id\":6,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1O S\\u01a0 MI NAM - DOUBLE POCKETS - TOTODAY - 12205\",\"slug\":\"ao-so-mi-nam-double-pockets-totoday-12205-69mUzk\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"6\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-16-639c2d8047d54.png\\\",\\\"2022-12-16-639c2d8048f52.png\\\"]\",\"thumbnail\":\"2022-12-16-639c2d80491af.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#7FFFD4\\\",\\\"#000000\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":340000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Aquamarine\\\",\\\"price\\\":340000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Black\\\",\\\"price\\\":340000,\\\"sku\\\":null,\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":340000,\"purchase_price\":340000,\"tax\":2,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":3,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-16T08:34:08.000000Z\",\"updated_at\":\"2022-12-16T08:36:00.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u00c1O S\\u01a0 MI NAM - DOUBLE POCKETS - TOTODAY - 12205\",\"meta_description\":null,\"meta_image\":\"2022-12-16-639c2d80497af.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":1000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"166371\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 340000, 6800, 0, 'pending', 'unpaid', '2022-12-16 17:22:40', '2022-12-16 17:22:40', NULL, 'Aquamarine', '{\"color\":\"Aquamarine\"}', 'discount_on_product', 1, 0),
(6, 100004, 6, 1, NULL, '{\"id\":6,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1O S\\u01a0 MI NAM - DOUBLE POCKETS - TOTODAY - 12205\",\"slug\":\"ao-so-mi-nam-double-pockets-totoday-12205-69mUzk\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"6\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-16-639c2d8047d54.png\\\",\\\"2022-12-16-639c2d8048f52.png\\\"]\",\"thumbnail\":\"2022-12-16-639c2d80491af.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#7FFFD4\\\",\\\"#000000\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":340000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Aquamarine\\\",\\\"price\\\":340000,\\\"sku\\\":null,\\\"qty\\\":0},{\\\"type\\\":\\\"Black\\\",\\\"price\\\":340000,\\\"sku\\\":null,\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":340000,\"purchase_price\":340000,\"tax\":2,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":2,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-16T08:34:08.000000Z\",\"updated_at\":\"2022-12-17T00:22:40.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u00c1O S\\u01a0 MI NAM - DOUBLE POCKETS - TOTODAY - 12205\",\"meta_description\":null,\"meta_image\":\"2022-12-16-639c2d80497af.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":1000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"166371\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 340000, 6800, 0, 'returned', 'unpaid', '2023-01-04 20:16:45', '2023-01-06 00:50:03', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 0, 0),
(7, 100005, 2, 1, NULL, '{\"id\":2,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C W2AKN10201FOSBA\",\"slug\":\"ao-khoac-w2akn10201fosba-ttidMe\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-16-639c283a98dcc.png\\\",\\\"2022-12-16-639c283a9a05b.png\\\"]\",\"thumbnail\":\"2022-12-16-639c283a9a522.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FAEBD7\\\",\\\"#00FFFF\\\",\\\"#000000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\",\\\"M\\\",\\\"L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AntiqueWhite-X\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"AntiqueWhite-M\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"AntiqueWhite-L\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-X\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-M\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-L\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Black-X\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":200000,\"purchase_price\":200000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":50000,\"discount_type\":\"flat\",\"current_stock\":9,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-16T08:11:38.000000Z\",\"updated_at\":\"2022-12-16T08:11:41.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u00c1O KHO\\u00c1C W2AKN10201FOSBA\",\"meta_description\":\"\\u00bb B\\u1ea2O H\\u00c0NH S\\u1ea2N PH\\u1ea8M 90 NG\\u00c0Y\\r\\n\\r\\n\\u00bb \\u0110\\u1ed4I H\\u00c0NG TRONG V\\u00d2NG 30 NG\\u00c0Y\\r\\n\\r\\n\\u00bb HOTLINE B\\u00c1N H\\u00c0NG 1900 633 501\",\"meta_image\":\"2022-12-16-639c283a9a8a9.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":10000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"172058\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 200000, 0, 50000, 'pending', 'unpaid', '2023-01-04 20:27:31', '2023-01-04 20:27:31', NULL, 'AntiqueWhite-X', '{\"color\":\"AntiqueWhite\",\"size\":\"X\"}', 'discount_on_product', 1, 0),
(8, 100006, 2, 1, NULL, '{\"id\":2,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C W2AKN10201FOSBA\",\"slug\":\"ao-khoac-w2akn10201fosba-ttidMe\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-16-639c283a98dcc.png\\\",\\\"2022-12-16-639c283a9a05b.png\\\"]\",\"thumbnail\":\"2022-12-16-639c283a9a522.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FAEBD7\\\",\\\"#00FFFF\\\",\\\"#000000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\",\\\"  M\\\",\\\"  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AntiqueWhite-X\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"AntiqueWhite-M\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"AntiqueWhite-L\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-X\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-M\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-L\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Black-X\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":200000,\"purchase_price\":200000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":50000,\"discount_type\":\"flat\",\"current_stock\":9,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-16T08:11:38.000000Z\",\"updated_at\":\"2023-01-05T03:28:24.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u00c1O KHO\\u00c1C W2AKN10201FOSBA\",\"meta_description\":\"\\u00bb B\\u1ea2O H\\u00c0NH S\\u1ea2N PH\\u1ea8M 90 NG\\u00c0Y\\r\\n\\r\\n\\u00bb \\u0110\\u1ed4I H\\u00c0NG TRONG V\\u00d2NG 30 NG\\u00c0Y\\r\\n\\r\\n\\u00bb HOTLINE B\\u00c1N H\\u00c0NG 1900 633 501\",\"meta_image\":\"2022-12-16-639c283a9a8a9.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":10000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"172058\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 200000, 0, 50000, 'delivered', 'unpaid', '2023-01-04 20:28:41', '2023-01-06 01:05:10', NULL, 'AntiqueWhite-X', '{\"color\":\"AntiqueWhite\",\"size\":\"X\"}', 'discount_on_product', 1, 0),
(9, 100007, 8, 1, NULL, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C D\\u00d9 UNISEX - TOTODAY - TOTODAY WINDBREAKER\",\"slug\":\"ao-khoac-du-unisex-totoday-totoday-windbreaker-guopU9\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":6,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-17-639d10e61115d.png\\\"]\",\"thumbnail\":\"2022-12-17-639d10e612346.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\",\\\"M\\\",\\\"L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"X\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"M\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"L\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":400000,\"purchase_price\":400000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":3,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-17T00:44:22.000000Z\",\"updated_at\":\"2022-12-17T00:44:23.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":\"\\u00bb B\\u1ea2O H\\u00c0NH S\\u1ea2N PH\\u1ea8M 90 NG\\u00c0Y\\r\\n\\r\\n\\u00bb \\u0110\\u1ed4I H\\u00c0NG TRONG V\\u00d2NG 30 NG\\u00c0Y\\r\\n\\r\\n\\u00bb HOTLINE B\\u00c1N H\\u00c0NG 1900 633 501\",\"meta_image\":\"2022-12-17-639d10e612930.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"104678\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 400000, 0, 0, 'pending', 'unpaid', '2023-01-04 20:30:33', '2023-01-04 20:30:33', NULL, 'X', '{\"size\":\"X\"}', 'discount_on_product', 1, 0),
(10, 100008, 3, 1, NULL, '{\"id\":3,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C VARSITY UNISEX - TOTODAY - JOVIAL\",\"slug\":\"ao-khoac-varsity-unisex-totoday-jovial-6LDbRN\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-16-639c28e7b03d2.png\\\",\\\"2022-12-16-639c28e7b1537.png\\\"]\",\"thumbnail\":\"2022-12-16-639c28e7b1ab0.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":430000,\"purchase_price\":430000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":1,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-16T08:14:31.000000Z\",\"updated_at\":\"2023-01-05T03:19:56.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u00c1O KHO\\u00c1C VARSITY UNISEX - TOTODAY - JOVIAL\",\"meta_description\":\"\\u00bb\\u00a0B\\u1ea2O H\\u00c0NH S\\u1ea2N PH\\u1ea8M\\u00a090 NG\\u00c0Y\\r\\n\\r\\n\\u00bb \\u0110\\u1ed4I H\\u00c0NG TRONG V\\u00d2NG 30 NG\\u00c0Y\\r\\n\\r\\n\\u00bb\\u00a0HOTLINE B\\u00c1N H\\u00c0NG 1900 633 501\",\"meta_image\":\"2022-12-16-639c28e7b218f.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"188546\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 430000, 0, 0, 'pending', 'unpaid', '2023-01-06 05:56:19', '2023-01-06 05:56:19', NULL, '', '[]', 'discount_on_product', 1, 0),
(11, 100008, 6, 1, NULL, '{\"id\":6,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1O S\\u01a0 MI NAM - DOUBLE POCKETS - TOTODAY - 12205\",\"slug\":\"ao-so-mi-nam-double-pockets-totoday-12205-69mUzk\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"6\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-16-639c2d8047d54.png\\\",\\\"2022-12-16-639c2d8048f52.png\\\"]\",\"thumbnail\":\"2022-12-16-639c2d80491af.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#7FFFD4\\\",\\\"#000000\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":340000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Aquamarine\\\",\\\"price\\\":340000,\\\"sku\\\":null,\\\"qty\\\":0},{\\\"type\\\":\\\"Black\\\",\\\"price\\\":340000,\\\"sku\\\":null,\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":340000,\"purchase_price\":340000,\"tax\":2,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":2,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-16T08:34:08.000000Z\",\"updated_at\":\"2023-01-06T07:50:03.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u00c1O S\\u01a0 MI NAM - DOUBLE POCKETS - TOTODAY - 12205\",\"meta_description\":null,\"meta_image\":\"2022-12-16-639c2d80497af.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":1000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"166371\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 340000, 6800, 0, 'pending', 'unpaid', '2023-01-06 05:56:19', '2023-01-06 05:56:19', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, 0),
(12, 100009, 23, 1, NULL, '{\"id\":23,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1o Vest 2\",\"slug\":\"ao-vest-2-coyzd4\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"8\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-01-10-63bd7d547f241.png\\\",\\\"2023-01-10-63bd7d5480a0f.png\\\"]\",\"thumbnail\":\"2023-01-10-63bd7d5480c86.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#9966CC\\\",\\\"#00FFFF\\\",\\\"#F0FFFF\\\",\\\"#FFEBCD\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"M\\\",\\\"X\\\",\\\"XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Amethyst-M\\\",\\\"price\\\":2300000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"Amethyst-X\\\",\\\"price\\\":2300000,\\\"sku\\\":null,\\\"qty\\\":34},{\\\"type\\\":\\\"Amethyst-XL\\\",\\\"price\\\":2300000,\\\"sku\\\":null,\\\"qty\\\":45},{\\\"type\\\":\\\"Aqua-M\\\",\\\"price\\\":2300000,\\\"sku\\\":null,\\\"qty\\\":123},{\\\"type\\\":\\\"Aqua-X\\\",\\\"price\\\":2300000,\\\"sku\\\":null,\\\"qty\\\":343},{\\\"type\\\":\\\"Aqua-XL\\\",\\\"price\\\":2300000,\\\"sku\\\":null,\\\"qty\\\":3553},{\\\"type\\\":\\\"Azure-M\\\",\\\"price\\\":2300000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"Azure-X\\\",\\\"price\\\":2300000,\\\"sku\\\":null,\\\"qty\\\":3435},{\\\"type\\\":\\\"Azure-XL\\\",\\\"price\\\":2300000,\\\"sku\\\":null,\\\"qty\\\":233},{\\\"type\\\":\\\"BlanchedAlmond-M\\\",\\\"price\\\":2300000,\\\"sku\\\":null,\\\"qty\\\":343},{\\\"type\\\":\\\"BlanchedAlmond-X\\\",\\\"price\\\":2300000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"BlanchedAlmond-XL\\\",\\\"price\\\":2300000,\\\"sku\\\":null,\\\"qty\\\":434}]\",\"published\":0,\"unit_price\":2300000,\"purchase_price\":2300000,\"tax\":25,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":8612,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-01-10T14:59:32.000000Z\",\"updated_at\":\"2023-01-10T14:59:34.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u00c1o Vest 2\",\"meta_description\":null,\"meta_image\":\"2023-01-10-63bd7d548126b.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":25000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"178052\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 2300000, 575000, 0, 'delivered', 'unpaid', '2023-01-10 16:08:22', '2023-01-10 16:10:31', NULL, 'Aqua-M', '{\"color\":\"Aqua\",\"size\":\"M\"}', 'discount_on_product', 1, 0),
(13, 100010, 1, 1, NULL, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C N\\u1ec8 UNISEX - TOTODAY - SPARKY\",\"slug\":\"ao-khoac-ni-unisex-totoday-sparky-Rlofwi\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-12-63976b30c11c9.png\\\",\\\"2022-12-12-63976b30c25ac.png\\\"]\",\"thumbnail\":\"2022-12-12-63976b30c27ba.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#0000FF\\\",\\\"#8B0000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Blue-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":123},{\\\"type\\\":\\\"Blue-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":343},{\\\"type\\\":\\\"Blue-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":34},{\\\"type\\\":\\\"DarkRed-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":324},{\\\"type\\\":\\\"DarkRed-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":345},{\\\"type\\\":\\\"DarkRed-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":345}]\",\"published\":0,\"unit_price\":520000,\"purchase_price\":520000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":1514,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-12T17:56:00.000000Z\",\"updated_at\":\"2023-01-10T15:03:12.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"abc\",\"meta_description\":null,\"meta_image\":\"2022-12-12-63976b30c2cbf.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":30000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"104241\",\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":1,\"product_id\":1,\"customer_id\":4,\"delivery_man_id\":null,\"order_id\":null,\"comment\":\"\\u00e1o \\u0111\\u1eb9p v\\u00e3i ch\\u01b0\\u1edfng\",\"attachment\":\"[]\",\"rating\":5,\"status\":1,\"is_saved\":0,\"created_at\":\"2023-01-06T07:59:59.000000Z\",\"updated_at\":\"2023-01-06T07:59:59.000000Z\"}]}', 1, 520000, 0, 0, 'pending', 'unpaid', '2023-01-10 16:13:45', '2023-01-10 16:13:45', NULL, 'Blue-M', '{\"color\":\"Blue\",\"size\":\"M\"}', 'discount_on_product', 1, 0),
(14, 100011, 18, 1, NULL, '{\"id\":18,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0110\\u1ed3 h\\u1ed3 1\",\"slug\":\"do-ho-1-6N7DBi\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"11\\\",\\\"position\\\":1}]\",\"brand_id\":6,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-01-06-63b8049618601.png\\\",\\\"2023-01-06-63b80496199ed.png\\\"]\",\"thumbnail\":\"2023-01-06-63b8049619c75.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#00FFFF\\\",\\\"#7FFFD4\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"L\\\",\\\"XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Aqua-L\\\",\\\"price\\\":2300000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"Aqua-XL\\\",\\\"price\\\":2300000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"Aquamarine-L\\\",\\\"price\\\":2300000,\\\"sku\\\":null,\\\"qty\\\":12},{\\\"type\\\":\\\"Aquamarine-XL\\\",\\\"price\\\":2300000,\\\"sku\\\":null,\\\"qty\\\":12}]\",\"published\":0,\"unit_price\":2300000,\"purchase_price\":2300000,\"tax\":23,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":70,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-01-06T11:23:02.000000Z\",\"updated_at\":\"2023-01-06T11:23:04.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u0110\\u1ed3 h\\u1ed3 1\",\"meta_description\":null,\"meta_image\":\"2023-01-06-63b8049619f46.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"118855\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 2300000, 529000, 0, 'pending', 'unpaid', '2023-01-10 16:15:31', '2023-01-10 16:15:31', NULL, 'Aqua-L', '{\"color\":\"Aqua\",\"size\":\"L\"}', 'discount_on_product', 1, 0),
(15, 100012, 19, 1, NULL, '{\"id\":19,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"L\\u1eafc tay 1\",\"slug\":\"lac-tay-1-RWOdGi\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"11\\\",\\\"position\\\":1}]\",\"brand_id\":7,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-01-06-63b804d88e541.png\\\",\\\"2023-01-06-63b804d88f700.png\\\"]\",\"thumbnail\":\"2023-01-06-63b804d88fa3c.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FAEBD7\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AntiqueWhite\\\",\\\"price\\\":200000,\\\"sku\\\":\\\"Lt1-AntiqueWhite\\\",\\\"qty\\\":23}]\",\"published\":0,\"unit_price\":200000,\"purchase_price\":200000,\"tax\":23,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":23,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-01-06T11:24:08.000000Z\",\"updated_at\":\"2023-01-06T11:24:11.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"L\\u1eafc tay 1\",\"meta_description\":null,\"meta_image\":\"2023-01-06-63b804d88fe7f.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"183027\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 200000, 46000, 0, 'pending', 'unpaid', '2023-01-10 16:15:50', '2023-01-10 16:15:50', NULL, 'AntiqueWhite', '{\"color\":\"AntiqueWhite\"}', 'discount_on_product', 1, 0),
(16, 100013, 8, 1, NULL, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C D\\u00d9 UNISEX - TOTODAY - TOTODAY WINDBREAKER\",\"slug\":\"ao-khoac-du-unisex-totoday-totoday-windbreaker-guopU9\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":6,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-17-639d10e61115d.png\\\"]\",\"thumbnail\":\"2022-12-17-639d10e612346.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\",\\\"  M\\\",\\\"  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"X\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":1212},{\\\"type\\\":\\\"M\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"L\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":2323}]\",\"published\":0,\"unit_price\":400000,\"purchase_price\":400000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":3558,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-17T00:44:22.000000Z\",\"updated_at\":\"2023-01-10T23:29:57.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":\"\\u00bb B\\u1ea2O H\\u00c0NH S\\u1ea2N PH\\u1ea8M 90 NG\\u00c0Y\\r\\n\\r\\n\\u00bb \\u0110\\u1ed4I H\\u00c0NG TRONG V\\u00d2NG 30 NG\\u00c0Y\\r\\n\\r\\n\\u00bb HOTLINE B\\u00c1N H\\u00c0NG 1900 633 501\",\"meta_image\":\"2022-12-17-639d10e612930.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":2000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"104678\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 400000, 0, 0, 'pending', 'unpaid', '2023-01-10 16:31:07', '2023-01-10 16:31:07', NULL, 'X', '{\"size\":\"X\"}', 'discount_on_product', 1, 0),
(17, 100014, 24, 1, NULL, '{\"id\":24,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"\\u00c1o Vest 1\",\"slug\":\"ao-vest-1-VTTBmh\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"8\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-01-10-63bdf5ccc8376.png\\\",\\\"2023-01-10-63bdf5cce1326.png\\\",\\\"2023-01-10-63bdf5cce1577.png\\\"]\",\"thumbnail\":\"2023-01-10-63bdf5cce1826.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#9966CC\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Amethyst-X\\\",\\\"price\\\":1400000,\\\"sku\\\":null,\\\"qty\\\":2323}]\",\"published\":0,\"unit_price\":1400000,\"purchase_price\":1400000,\"tax\":2,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":2323,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-01-10T23:33:32.000000Z\",\"updated_at\":\"2023-01-10T23:33:35.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u00c1o Vest 1\",\"meta_description\":null,\"meta_image\":\"2023-01-10-63bdf5cce1b61.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":23,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"160179\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 1400000, 28000, 0, 'delivered', 'unpaid', '2023-01-10 16:35:32', '2023-01-10 16:36:36', NULL, 'Amethyst-X', '{\"color\":\"Amethyst\",\"size\":\"X\"}', 'discount_on_product', 1, 0),
(18, 100015, 1, 1, NULL, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C N\\u1ec8 UNISEX - TOTODAY - SPARKY\",\"slug\":\"ao-khoac-ni-unisex-totoday-sparky-Rlofwi\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-12-63976b30c11c9.png\\\",\\\"2022-12-12-63976b30c25ac.png\\\"]\",\"thumbnail\":\"2022-12-12-63976b30c27ba.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#0000FF\\\",\\\"#8B0000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Blue-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":122},{\\\"type\\\":\\\"Blue-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":343},{\\\"type\\\":\\\"Blue-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":34},{\\\"type\\\":\\\"DarkRed-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":324},{\\\"type\\\":\\\"DarkRed-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":345},{\\\"type\\\":\\\"DarkRed-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":345}]\",\"published\":0,\"unit_price\":520000,\"purchase_price\":520000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":1513,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-12T17:56:00.000000Z\",\"updated_at\":\"2023-01-10T23:13:45.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"abc\",\"meta_description\":null,\"meta_image\":\"2022-12-12-63976b30c2cbf.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":30000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"104241\",\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":1,\"product_id\":1,\"customer_id\":4,\"delivery_man_id\":null,\"order_id\":null,\"comment\":\"\\u00e1o \\u0111\\u1eb9p v\\u00e3i ch\\u01b0\\u1edfng\",\"attachment\":\"[]\",\"rating\":5,\"status\":1,\"is_saved\":0,\"created_at\":\"2023-01-06T07:59:59.000000Z\",\"updated_at\":\"2023-01-06T07:59:59.000000Z\"}]}', 1, 520000, 0, 0, 'pending', 'unpaid', '2023-01-10 16:48:05', '2023-01-10 16:48:05', NULL, 'DarkRed-M', '{\"color\":\"DarkRed\",\"size\":\"M\"}', 'discount_on_product', 1, 0),
(19, 100016, 25, 1, NULL, '{\"id\":25,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1o Jacket si\\u00eau c\\u1ea5p\",\"slug\":\"ao-jacket-sieu-cap-nH5v2z\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":7,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-01-31-63d91047041c8.png\\\",\\\"2023-01-31-63d91047218cd.png\\\"]\",\"thumbnail\":\"2023-01-31-63d9104721b65.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#FAEBD7\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\",\\\"M\\\",\\\"L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-X\\\",\\\"price\\\":390000,\\\"sku\\\":null,\\\"qty\\\":10},{\\\"type\\\":\\\"AliceBlue-M\\\",\\\"price\\\":390000,\\\"sku\\\":null,\\\"qty\\\":20},{\\\"type\\\":\\\"AliceBlue-L\\\",\\\"price\\\":390000,\\\"sku\\\":null,\\\"qty\\\":30},{\\\"type\\\":\\\"AntiqueWhite-X\\\",\\\"price\\\":390000,\\\"sku\\\":null,\\\"qty\\\":40},{\\\"type\\\":\\\"AntiqueWhite-M\\\",\\\"price\\\":390000,\\\"sku\\\":null,\\\"qty\\\":50},{\\\"type\\\":\\\"AntiqueWhite-L\\\",\\\"price\\\":390000,\\\"sku\\\":null,\\\"qty\\\":60}]\",\"published\":0,\"unit_price\":390000,\"purchase_price\":390000,\"tax\":5,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"percent\",\"current_stock\":210,\"minimum_order_qty\":1,\"details\":\"<p>&Aacute;o Jacket si&ecirc;u c\\u1ea5p&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-01-31T12:57:43.000000Z\",\"updated_at\":\"2023-01-31T12:57:46.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u00c1o Jacket si\\u00eau c\\u1ea5p\",\"meta_description\":\"\\u00c1o Jacket si\\u00eau c\\u1ea5p\",\"meta_image\":\"2023-01-31-63d9104721df7.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"110833\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 390000, 19500, 19500, 'pending', 'unpaid', '2023-02-13 18:10:56', '2023-02-13 18:10:56', NULL, 'AliceBlue-X', '{\"color\":\"AliceBlue\",\"size\":\"X\"}', 'discount_on_product', 1, 0),
(20, 100016, 1, 1, NULL, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C N\\u1ec8 UNISEX - TOTODAY - SPARKY\",\"slug\":\"ao-khoac-ni-unisex-totoday-sparky-Rlofwi\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-12-63976b30c11c9.png\\\",\\\"2022-12-12-63976b30c25ac.png\\\"]\",\"thumbnail\":\"2022-12-12-63976b30c27ba.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#0000FF\\\",\\\"#8B0000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Blue-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":122},{\\\"type\\\":\\\"Blue-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":343},{\\\"type\\\":\\\"Blue-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":34},{\\\"type\\\":\\\"DarkRed-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":323},{\\\"type\\\":\\\"DarkRed-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":345},{\\\"type\\\":\\\"DarkRed-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":345}]\",\"published\":0,\"unit_price\":520000,\"purchase_price\":520000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":1512,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-12T17:56:00.000000Z\",\"updated_at\":\"2023-01-10T23:48:05.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"abc\",\"meta_description\":null,\"meta_image\":\"2022-12-12-63976b30c2cbf.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":30000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"104241\",\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":1,\"product_id\":1,\"customer_id\":4,\"delivery_man_id\":null,\"order_id\":null,\"comment\":\"\\u00e1o \\u0111\\u1eb9p v\\u00e3i ch\\u01b0\\u1edfng\",\"attachment\":\"[]\",\"rating\":5,\"status\":1,\"is_saved\":0,\"created_at\":\"2023-01-06T07:59:59.000000Z\",\"updated_at\":\"2023-01-06T07:59:59.000000Z\"}]}', 1, 520000, 0, 0, 'pending', 'unpaid', '2023-02-13 18:10:56', '2023-02-13 18:10:56', NULL, 'Blue-M', '{\"color\":\"Blue\",\"size\":\"M\"}', 'discount_on_product', 1, 0);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `digital_file_after_sell`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(21, 100017, 17, 1, NULL, '{\"id\":17,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Gi\\u00e0y Da 2\",\"slug\":\"giay-da-2-cQ7BdD\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"10\\\",\\\"position\\\":1}]\",\"brand_id\":5,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-01-06-63b803e73676b.png\\\",\\\"2023-01-06-63b803e737c88.png\\\"]\",\"thumbnail\":\"2023-01-06-63b803e737f02.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FAEBD7\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"37\\\",\\\"38\\\",\\\"39\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AntiqueWhite-37\\\",\\\"price\\\":130000,\\\"sku\\\":\\\"GD2-AntiqueWhite-37\\\",\\\"qty\\\":23},{\\\"type\\\":\\\"AntiqueWhite-38\\\",\\\"price\\\":130000,\\\"sku\\\":\\\"GD2-AntiqueWhite-38\\\",\\\"qty\\\":23},{\\\"type\\\":\\\"AntiqueWhite-39\\\",\\\"price\\\":130000,\\\"sku\\\":\\\"GD2-AntiqueWhite-39\\\",\\\"qty\\\":21}]\",\"published\":0,\"unit_price\":130000,\"purchase_price\":130000,\"tax\":23,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":67,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-01-06T11:20:07.000000Z\",\"updated_at\":\"2023-01-25T04:13:20.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2023-01-06-63b803e73819e.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"176723\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 130000, 59800, 0, 'pending', 'unpaid', '2023-02-15 22:24:35', '2023-02-15 22:24:35', NULL, 'AntiqueWhite-39', '{\"color\":\"AntiqueWhite\",\"size\":\"39\"}', 'discount_on_product', 1, 0),
(22, 100018, 8, 1, NULL, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C D\\u00d9 UNISEX - TOTODAY - TOTODAY WINDBREAKER\",\"slug\":\"ao-khoac-du-unisex-totoday-totoday-windbreaker-guopU9\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":6,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-17-639d10e61115d.png\\\"]\",\"thumbnail\":\"2022-12-17-639d10e612346.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\",\\\"  M\\\",\\\"  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"X\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":1211},{\\\"type\\\":\\\"M\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"L\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":2323}]\",\"published\":0,\"unit_price\":400000,\"purchase_price\":400000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":3557,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-17T00:44:22.000000Z\",\"updated_at\":\"2023-01-10T23:31:07.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":\"\\u00bb B\\u1ea2O H\\u00c0NH S\\u1ea2N PH\\u1ea8M 90 NG\\u00c0Y\\r\\n\\r\\n\\u00bb \\u0110\\u1ed4I H\\u00c0NG TRONG V\\u00d2NG 30 NG\\u00c0Y\\r\\n\\r\\n\\u00bb HOTLINE B\\u00c1N H\\u00c0NG 1900 633 501\",\"meta_image\":\"2022-12-17-639d10e612930.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":2000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"104678\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 400000, 0, 0, 'pending', 'unpaid', '2023-02-15 22:24:41', '2023-02-15 22:24:41', NULL, 'X', '{\"size\":\"X\"}', 'discount_on_product', 1, 0),
(23, 100019, 1, 1, NULL, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C N\\u1ec8 UNISEX - TOTODAY - SPARKY\",\"slug\":\"ao-khoac-ni-unisex-totoday-sparky-Rlofwi\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-12-63976b30c11c9.png\\\",\\\"2022-12-12-63976b30c25ac.png\\\"]\",\"thumbnail\":\"2022-12-12-63976b30c27ba.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#0000FF\\\",\\\"#8B0000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Blue-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":121},{\\\"type\\\":\\\"Blue-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":343},{\\\"type\\\":\\\"Blue-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":34},{\\\"type\\\":\\\"DarkRed-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":323},{\\\"type\\\":\\\"DarkRed-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":345},{\\\"type\\\":\\\"DarkRed-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":345}]\",\"published\":0,\"unit_price\":520000,\"purchase_price\":520000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":1511,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-12T17:56:00.000000Z\",\"updated_at\":\"2023-02-14T01:10:56.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"abc\",\"meta_description\":null,\"meta_image\":\"2022-12-12-63976b30c2cbf.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":30000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"104241\",\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":1,\"product_id\":1,\"customer_id\":4,\"delivery_man_id\":null,\"order_id\":null,\"comment\":\"\\u00e1o \\u0111\\u1eb9p v\\u00e3i ch\\u01b0\\u1edfng\",\"attachment\":\"[]\",\"rating\":5,\"status\":1,\"is_saved\":0,\"created_at\":\"2023-01-06T07:59:59.000000Z\",\"updated_at\":\"2023-01-06T07:59:59.000000Z\"}]}', 2, 520000, 0, 0, 'pending', 'unpaid', '2023-02-15 22:34:37', '2023-02-15 22:34:37', NULL, 'DarkRed-M', '{\"color\":\"DarkRed\",\"size\":\"M\"}', 'discount_on_product', 1, 0),
(24, 100020, 14, 1, NULL, '{\"id\":14,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Gi\\u00e0y th\\u1ec3 thao si\\u00eau n\\u1eef t\\u00ednh\",\"slug\":\"giay-the-thao-sieu-nu-tinh-keO6ni\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"9\\\",\\\"position\\\":1}]\",\"brand_id\":5,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-01-06-63b8026ee7a12.png\\\",\\\"2023-01-06-63b8026ee9427.png\\\"]\",\"thumbnail\":\"2023-01-06-63b8026ee9a66.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FFE4C4\\\",\\\"#000000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"XL\\\",\\\"L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Bisque-XL\\\",\\\"price\\\":230000,\\\"sku\\\":\\\"Gttsnt-Bisque-XL\\\",\\\"qty\\\":23},{\\\"type\\\":\\\"Bisque-L\\\",\\\"price\\\":230000,\\\"sku\\\":\\\"Gttsnt-Bisque-L\\\",\\\"qty\\\":32},{\\\"type\\\":\\\"Black-XL\\\",\\\"price\\\":230000,\\\"sku\\\":\\\"Gttsnt-Black-XL\\\",\\\"qty\\\":32},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":230000,\\\"sku\\\":\\\"Gttsnt-Black-L\\\",\\\"qty\\\":4}]\",\"published\":0,\"unit_price\":230000,\"purchase_price\":230000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":91,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-01-06T11:13:50.000000Z\",\"updated_at\":\"2023-01-06T11:13:53.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Gi\\u00e0y th\\u1ec3 thao si\\u00eau n\\u1eef t\\u00ednh\",\"meta_description\":null,\"meta_image\":\"2023-01-06-63b8026ee9fe7.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"107745\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 230000, 0, 0, 'pending', 'unpaid', '2023-02-15 22:47:37', '2023-02-15 22:47:37', NULL, 'Bisque-XL', '{\"color\":\"Bisque\",\"size\":\"XL\"}', 'discount_on_product', 1, 0),
(25, 100020, 2, 1, NULL, '{\"id\":2,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C W2AKN10201FOSBA\",\"slug\":\"ao-khoac-w2akn10201fosba-ttidMe\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-16-639c283a98dcc.png\\\",\\\"2022-12-16-639c283a9a05b.png\\\"]\",\"thumbnail\":\"2022-12-16-639c283a9a522.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FAEBD7\\\",\\\"#00FFFF\\\",\\\"#000000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\",\\\"  M\\\",\\\"  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AntiqueWhite-X\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":0},{\\\"type\\\":\\\"AntiqueWhite-M\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"AntiqueWhite-L\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-X\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-M\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-L\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Black-X\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":200000,\"purchase_price\":200000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":50000,\"discount_type\":\"flat\",\"current_stock\":8,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-16T08:11:38.000000Z\",\"updated_at\":\"2023-01-05T03:28:41.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u00c1O KHO\\u00c1C W2AKN10201FOSBA\",\"meta_description\":\"\\u00bb B\\u1ea2O H\\u00c0NH S\\u1ea2N PH\\u1ea8M 90 NG\\u00c0Y\\r\\n\\r\\n\\u00bb \\u0110\\u1ed4I H\\u00c0NG TRONG V\\u00d2NG 30 NG\\u00c0Y\\r\\n\\r\\n\\u00bb HOTLINE B\\u00c1N H\\u00c0NG 1900 633 501\",\"meta_image\":\"2022-12-16-639c283a9a8a9.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":10000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"172058\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 200000, 0, 50000, 'pending', 'unpaid', '2023-02-15 22:47:37', '2023-02-15 22:47:37', NULL, 'Aqua-X', '{\"color\":\"Aqua\",\"size\":\"X\"}', 'discount_on_product', 1, 0),
(26, 100021, 21, 1, NULL, '{\"id\":21,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1o Polo c\\u1ed5 be\",\"slug\":\"ao-polo-co-be-AVFt0P\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"7\\\",\\\"position\\\":1}]\",\"brand_id\":2,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-01-10-63bd7a689e2be.png\\\",\\\"2023-01-10-63bd7a689f5a6.png\\\"]\",\"thumbnail\":\"2023-01-10-63bd7a689f9f6.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#7FFFD4\\\",\\\"#F0FFFF\\\",\\\"#F5F5DC\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\",\\\"M\\\",\\\"XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Aquamarine-X\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"Aquamarine-M\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":3434},{\\\"type\\\":\\\"Aquamarine-XL\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"Azure-X\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":53},{\\\"type\\\":\\\"Azure-M\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":123},{\\\"type\\\":\\\"Azure-XL\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"Beige-X\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"Beige-M\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":34},{\\\"type\\\":\\\"Beige-XL\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":32}]\",\"published\":0,\"unit_price\":200000,\"purchase_price\":200000,\"tax\":20,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":3768,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-01-10T07:47:04.000000Z\",\"updated_at\":\"2023-01-10T07:47:18.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u00c1o Polo c\\u1ed5 be\",\"meta_description\":null,\"meta_image\":\"2023-01-10-63bd7a689fd69.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"133264\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 200000, 40000, 0, 'pending', 'unpaid', '2023-02-18 18:22:38', '2023-02-18 18:22:38', NULL, 'Aquamarine-X', '{\"color\":\"Aquamarine\",\"size\":\"X\"}', 'discount_on_product', 1, 0),
(27, 100022, 1, 1, NULL, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C N\\u1ec8 UNISEX - TOTODAY - SPARKY\",\"slug\":\"ao-khoac-ni-unisex-totoday-sparky-Rlofwi\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-12-63976b30c11c9.png\\\",\\\"2022-12-12-63976b30c25ac.png\\\"]\",\"thumbnail\":\"2022-12-12-63976b30c27ba.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#0000FF\\\",\\\"#8B0000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Blue-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":121},{\\\"type\\\":\\\"Blue-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":343},{\\\"type\\\":\\\"Blue-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":34},{\\\"type\\\":\\\"DarkRed-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":321},{\\\"type\\\":\\\"DarkRed-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":345},{\\\"type\\\":\\\"DarkRed-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":345}]\",\"published\":0,\"unit_price\":520000,\"purchase_price\":520000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":1509,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-12T10:56:00.000000Z\",\"updated_at\":\"2023-02-15T22:34:37.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"abc\",\"meta_description\":null,\"meta_image\":\"2022-12-12-63976b30c2cbf.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":30000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"104241\",\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":1,\"product_id\":1,\"customer_id\":4,\"delivery_man_id\":null,\"order_id\":null,\"comment\":\"\\u00e1o \\u0111\\u1eb9p v\\u00e3i ch\\u01b0\\u1edfng\",\"attachment\":\"[]\",\"rating\":5,\"status\":1,\"is_saved\":0,\"created_at\":\"2023-01-06T00:59:59.000000Z\",\"updated_at\":\"2023-01-06T00:59:59.000000Z\"}]}', 1, 520000, 0, 0, 'pending', 'unpaid', '2023-02-18 18:28:07', '2023-02-18 18:28:07', NULL, 'Blue-M', '{\"color\":\"Blue\",\"size\":\"M\"}', 'discount_on_product', 1, 0),
(28, 100023, 21, 1, NULL, '{\"id\":21,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1o Polo c\\u1ed5 be\",\"slug\":\"ao-polo-co-be-AVFt0P\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"7\\\",\\\"position\\\":1}]\",\"brand_id\":2,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-01-10-63bd7a689e2be.png\\\",\\\"2023-01-10-63bd7a689f5a6.png\\\"]\",\"thumbnail\":\"2023-01-10-63bd7a689f9f6.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#7FFFD4\\\",\\\"#F0FFFF\\\",\\\"#F5F5DC\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\",\\\"M\\\",\\\"XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Aquamarine-X\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":22},{\\\"type\\\":\\\"Aquamarine-M\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":3434},{\\\"type\\\":\\\"Aquamarine-XL\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"Azure-X\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":53},{\\\"type\\\":\\\"Azure-M\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":123},{\\\"type\\\":\\\"Azure-XL\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"Beige-X\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"Beige-M\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":34},{\\\"type\\\":\\\"Beige-XL\\\",\\\"price\\\":200000,\\\"sku\\\":null,\\\"qty\\\":32}]\",\"published\":0,\"unit_price\":200000,\"purchase_price\":200000,\"tax\":20,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":3767,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-01-10T07:47:04.000000Z\",\"updated_at\":\"2023-02-18T18:22:38.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u00c1o Polo c\\u1ed5 be\",\"meta_description\":null,\"meta_image\":\"2023-01-10-63bd7a689fd69.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"133264\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 200000, 40000, 0, 'pending', 'unpaid', '2023-02-20 18:44:45', '2023-02-20 18:44:45', NULL, 'Aquamarine-X', '{\"color\":\"Aquamarine\",\"size\":\"X\"}', 'discount_on_product', 1, 0),
(29, 100024, 24, 1, NULL, '{\"id\":24,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"\\u00c1o Vest 1\",\"slug\":\"ao-vest-1-VTTBmh\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"8\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-01-10-63bdf5ccc8376.png\\\",\\\"2023-01-10-63bdf5cce1326.png\\\",\\\"2023-01-10-63bdf5cce1577.png\\\"]\",\"thumbnail\":\"2023-01-10-63bdf5cce1826.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#9966CC\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Amethyst-X\\\",\\\"price\\\":1400000,\\\"sku\\\":null,\\\"qty\\\":2322}]\",\"published\":0,\"unit_price\":1400000,\"purchase_price\":1400000,\"tax\":2,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":2322,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-01-10T16:33:32.000000Z\",\"updated_at\":\"2023-01-10T16:35:32.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u00c1o Vest 1\",\"meta_description\":null,\"meta_image\":\"2023-01-10-63bdf5cce1b61.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":23,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"160179\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 4, 1400000, 112000, 0, 'delivered', 'unpaid', '2023-02-20 20:33:47', '2023-02-20 20:34:38', NULL, 'Amethyst-X', '{\"color\":\"Amethyst\",\"size\":\"X\"}', 'discount_on_product', 1, 0),
(30, 100025, 24, 1, NULL, '{\"id\":24,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"\\u00c1o Vest 1\",\"slug\":\"ao-vest-1-VTTBmh\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"8\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-01-10-63bdf5ccc8376.png\\\",\\\"2023-01-10-63bdf5cce1326.png\\\",\\\"2023-01-10-63bdf5cce1577.png\\\"]\",\"thumbnail\":\"2023-01-10-63bdf5cce1826.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#9966CC\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Amethyst-X\\\",\\\"price\\\":1400000,\\\"sku\\\":null,\\\"qty\\\":2318}]\",\"published\":0,\"unit_price\":1400000,\"purchase_price\":1400000,\"tax\":2,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":2318,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-01-10T16:33:32.000000Z\",\"updated_at\":\"2023-02-20T20:33:47.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u00c1o Vest 1\",\"meta_description\":null,\"meta_image\":\"2023-01-10-63bdf5cce1b61.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":23,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"160179\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 1400000, 28000, 0, 'delivered', 'unpaid', '2023-02-26 11:24:14', '2023-02-26 12:20:08', NULL, 'Amethyst-X', '{\"color\":\"Amethyst\",\"size\":\"X\"}', 'discount_on_product', 1, 0),
(31, 100026, 8, 1, NULL, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C D\\u00d9 UNISEX - TOTODAY - TOTODAY WINDBREAKER\",\"slug\":\"ao-khoac-du-unisex-totoday-totoday-windbreaker-guopU9\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":6,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-17-639d10e61115d.png\\\"]\",\"thumbnail\":\"2022-12-17-639d10e612346.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\",\\\"  M\\\",\\\"  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"X\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":1209},{\\\"type\\\":\\\"M\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"L\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":2323}]\",\"published\":0,\"unit_price\":400000,\"purchase_price\":400000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":3555,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-16T17:44:22.000000Z\",\"updated_at\":\"2023-02-15T22:24:41.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":\"\\u00bb B\\u1ea2O H\\u00c0NH S\\u1ea2N PH\\u1ea8M 90 NG\\u00c0Y\\r\\n\\r\\n\\u00bb \\u0110\\u1ed4I H\\u00c0NG TRONG V\\u00d2NG 30 NG\\u00c0Y\\r\\n\\r\\n\\u00bb HOTLINE B\\u00c1N H\\u00c0NG 1900 633 501\",\"meta_image\":\"2022-12-17-639d10e612930.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":2000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"104678\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 400000, 0, 0, 'delivered', 'unpaid', '2023-02-26 12:22:53', '2023-03-02 21:10:44', NULL, 'X', '{\"size\":\"X\"}', 'discount_on_product', 1, 0),
(32, 100027, 8, 1, NULL, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C D\\u00d9 UNISEX - TOTODAY - TOTODAY WINDBREAKER\",\"slug\":\"ao-khoac-du-unisex-totoday-totoday-windbreaker-guopU9\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":6,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-17-639d10e61115d.png\\\"]\",\"thumbnail\":\"2022-12-17-639d10e612346.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\",\\\"  M\\\",\\\"  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"X\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":1208},{\\\"type\\\":\\\"M\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"L\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":2323}]\",\"published\":0,\"unit_price\":400000,\"purchase_price\":400000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":3554,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-16T17:44:22.000000Z\",\"updated_at\":\"2023-02-26T12:22:53.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":\"\\u00bb B\\u1ea2O H\\u00c0NH S\\u1ea2N PH\\u1ea8M 90 NG\\u00c0Y\\r\\n\\r\\n\\u00bb \\u0110\\u1ed4I H\\u00c0NG TRONG V\\u00d2NG 30 NG\\u00c0Y\\r\\n\\r\\n\\u00bb HOTLINE B\\u00c1N H\\u00c0NG 1900 633 501\",\"meta_image\":\"2022-12-17-639d10e612930.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":2000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"104678\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 400000, 0, 0, 'pending', 'unpaid', '2023-02-26 12:24:20', '2023-02-26 12:24:20', NULL, 'X', '{\"size\":\"X\"}', 'discount_on_product', 1, 0),
(33, 100028, 24, 1, NULL, '{\"id\":24,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"\\u00c1o Vest 1\",\"slug\":\"ao-vest-1-VTTBmh\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"8\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-01-10-63bdf5ccc8376.png\\\",\\\"2023-01-10-63bdf5cce1326.png\\\",\\\"2023-01-10-63bdf5cce1577.png\\\"]\",\"thumbnail\":\"2023-01-10-63bdf5cce1826.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#9966CC\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Amethyst-X\\\",\\\"price\\\":1400000,\\\"sku\\\":null,\\\"qty\\\":2317}]\",\"published\":0,\"unit_price\":1400000,\"purchase_price\":1400000,\"tax\":2,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":2317,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-01-10T16:33:32.000000Z\",\"updated_at\":\"2023-02-26T11:24:14.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u00c1o Vest 1\",\"meta_description\":null,\"meta_image\":\"2023-01-10-63bdf5cce1b61.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":23,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"160179\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 1400000, 28000, 0, 'pending', 'unpaid', '2023-02-27 13:59:17', '2023-02-27 13:59:17', NULL, 'Amethyst-X', '{\"color\":\"Amethyst\",\"size\":\"X\"}', 'discount_on_product', 1, 0),
(34, 100029, 25, 1, NULL, '{\"id\":25,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1o Jacket si\\u00eau c\\u1ea5p\",\"slug\":\"ao-jacket-sieu-cap-nH5v2z\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":7,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-01-31-63d91047041c8.png\\\",\\\"2023-01-31-63d91047218cd.png\\\"]\",\"thumbnail\":\"2023-01-31-63d9104721b65.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#FAEBD7\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\",\\\"M\\\",\\\"L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-X\\\",\\\"price\\\":390000,\\\"sku\\\":null,\\\"qty\\\":9},{\\\"type\\\":\\\"AliceBlue-M\\\",\\\"price\\\":390000,\\\"sku\\\":null,\\\"qty\\\":20},{\\\"type\\\":\\\"AliceBlue-L\\\",\\\"price\\\":390000,\\\"sku\\\":null,\\\"qty\\\":30},{\\\"type\\\":\\\"AntiqueWhite-X\\\",\\\"price\\\":390000,\\\"sku\\\":null,\\\"qty\\\":40},{\\\"type\\\":\\\"AntiqueWhite-M\\\",\\\"price\\\":390000,\\\"sku\\\":null,\\\"qty\\\":50},{\\\"type\\\":\\\"AntiqueWhite-L\\\",\\\"price\\\":390000,\\\"sku\\\":null,\\\"qty\\\":60}]\",\"published\":0,\"unit_price\":390000,\"purchase_price\":390000,\"tax\":5,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"percent\",\"current_stock\":209,\"minimum_order_qty\":1,\"details\":\"<p>&Aacute;o Jacket si&ecirc;u c\\u1ea5p&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-01-31T05:57:43.000000Z\",\"updated_at\":\"2023-02-13T18:10:56.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u00c1o Jacket si\\u00eau c\\u1ea5p\",\"meta_description\":\"\\u00c1o Jacket si\\u00eau c\\u1ea5p\",\"meta_image\":\"2023-01-31-63d9104721df7.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"110833\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 390000, 19500, 19500, 'delivered', 'unpaid', '2023-03-02 02:37:39', '2023-03-02 20:57:22', NULL, 'AliceBlue-X', '{\"color\":\"AliceBlue\",\"size\":\"X\"}', 'discount_on_product', 1, 0),
(35, 100030, 24, 1, NULL, '{\"id\":24,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"\\u00c1o Vest 1\",\"slug\":\"ao-vest-1-VTTBmh\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"8\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-01-10-63bdf5ccc8376.png\\\",\\\"2023-01-10-63bdf5cce1326.png\\\",\\\"2023-01-10-63bdf5cce1577.png\\\"]\",\"thumbnail\":\"2023-01-10-63bdf5cce1826.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#9966CC\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Amethyst-X\\\",\\\"price\\\":1400000,\\\"sku\\\":null,\\\"qty\\\":2316}]\",\"published\":0,\"unit_price\":1400000,\"purchase_price\":1400000,\"tax\":2,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":2316,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-01-10T16:33:32.000000Z\",\"updated_at\":\"2023-02-27T13:59:17.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u00c1o Vest 1\",\"meta_description\":null,\"meta_image\":\"2023-01-10-63bdf5cce1b61.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":23,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"160179\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 1400000, 28000, 0, 'delivered', 'unpaid', '2023-03-02 02:40:59', '2023-03-02 20:58:11', NULL, 'Amethyst-X', '{\"color\":\"Amethyst\",\"size\":\"X\"}', 'discount_on_product', 1, 0),
(36, 100031, 8, 1, NULL, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C D\\u00d9 UNISEX - TOTODAY - TOTODAY WINDBREAKER\",\"slug\":\"ao-khoac-du-unisex-totoday-totoday-windbreaker-guopU9\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":6,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-17-639d10e61115d.png\\\"]\",\"thumbnail\":\"2022-12-17-639d10e612346.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\",\\\"  M\\\",\\\"  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"X\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":1207},{\\\"type\\\":\\\"M\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"L\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":2323}]\",\"published\":0,\"unit_price\":400000,\"purchase_price\":400000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":3553,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-16T17:44:22.000000Z\",\"updated_at\":\"2023-02-26T12:24:20.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":\"\\u00bb B\\u1ea2O H\\u00c0NH S\\u1ea2N PH\\u1ea8M 90 NG\\u00c0Y\\r\\n\\r\\n\\u00bb \\u0110\\u1ed4I H\\u00c0NG TRONG V\\u00d2NG 30 NG\\u00c0Y\\r\\n\\r\\n\\u00bb HOTLINE B\\u00c1N H\\u00c0NG 1900 633 501\",\"meta_image\":\"2022-12-17-639d10e612930.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":2000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"104678\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 400000, 0, 0, 'pending', 'unpaid', '2023-03-02 04:07:42', '2023-03-02 04:07:42', NULL, 'X', '{\"size\":\"X\"}', 'discount_on_product', 1, 0),
(37, 100031, 24, 1, NULL, '{\"id\":24,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"\\u00c1o Vest 1\",\"slug\":\"ao-vest-1-VTTBmh\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"8\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-01-10-63bdf5ccc8376.png\\\",\\\"2023-01-10-63bdf5cce1326.png\\\",\\\"2023-01-10-63bdf5cce1577.png\\\"]\",\"thumbnail\":\"2023-01-10-63bdf5cce1826.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#9966CC\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Amethyst-X\\\",\\\"price\\\":1400000,\\\"sku\\\":null,\\\"qty\\\":2315}]\",\"published\":0,\"unit_price\":1400000,\"purchase_price\":1400000,\"tax\":2,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":2315,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-01-10T16:33:32.000000Z\",\"updated_at\":\"2023-03-02T02:40:59.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u00c1o Vest 1\",\"meta_description\":null,\"meta_image\":\"2023-01-10-63bdf5cce1b61.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":23,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"160179\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 1400000, 56000, 0, 'pending', 'unpaid', '2023-03-02 04:07:42', '2023-03-02 04:07:42', NULL, 'Amethyst-X', '{\"color\":\"Amethyst\",\"size\":\"X\"}', 'discount_on_product', 1, 0),
(38, 100032, 1, 1, NULL, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C N\\u1ec8 UNISEX - TOTODAY - SPARKY\",\"slug\":\"ao-khoac-ni-unisex-totoday-sparky-Rlofwi\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-12-63976b30c11c9.png\\\",\\\"2022-12-12-63976b30c25ac.png\\\"]\",\"thumbnail\":\"2022-12-12-63976b30c27ba.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#0000FF\\\",\\\"#8B0000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Blue-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":120},{\\\"type\\\":\\\"Blue-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":343},{\\\"type\\\":\\\"Blue-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":34},{\\\"type\\\":\\\"DarkRed-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":321},{\\\"type\\\":\\\"DarkRed-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":345},{\\\"type\\\":\\\"DarkRed-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":345}]\",\"published\":0,\"unit_price\":520000,\"purchase_price\":520000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":1508,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-12T10:56:00.000000Z\",\"updated_at\":\"2023-02-18T18:28:07.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"abc\",\"meta_description\":null,\"meta_image\":\"2022-12-12-63976b30c2cbf.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":30000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"104241\",\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":1,\"product_id\":1,\"customer_id\":4,\"delivery_man_id\":null,\"order_id\":null,\"comment\":\"\\u00e1o \\u0111\\u1eb9p v\\u00e3i ch\\u01b0\\u1edfng\",\"attachment\":\"[]\",\"rating\":5,\"status\":1,\"is_saved\":0,\"created_at\":\"2023-01-06T00:59:59.000000Z\",\"updated_at\":\"2023-01-06T00:59:59.000000Z\"}]}', 1, 520000, 0, 0, 'pending', 'unpaid', '2023-03-02 04:09:08', '2023-03-02 04:09:08', NULL, 'DarkRed-M', '{\"color\":\"DarkRed\",\"size\":\"M\"}', 'discount_on_product', 1, 0),
(39, 100033, 16, 1, NULL, '{\"id\":16,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Gi\\u00e0y Da 1\",\"slug\":\"giay-da-1-Zs0wFg\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"10\\\",\\\"position\\\":1}]\",\"brand_id\":2,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-01-06-63b803a66d763.png\\\",\\\"2023-01-06-63b803a66ea36.png\\\"]\",\"thumbnail\":\"2023-01-06-63b803a66ec47.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"39\\\",\\\"  40\\\",\\\"  41\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Aqua-39\\\",\\\"price\\\":1023000,\\\"sku\\\":\\\"GD1-Aqua-39\\\",\\\"qty\\\":23},{\\\"type\\\":\\\"Aqua-40\\\",\\\"price\\\":1023000,\\\"sku\\\":\\\"GD1-Aqua-40\\\",\\\"qty\\\":23},{\\\"type\\\":\\\"Aqua-41\\\",\\\"price\\\":1023000,\\\"sku\\\":\\\"GD1-Aqua-41\\\",\\\"qty\\\":14}]\",\"published\":0,\"unit_price\":1023000,\"purchase_price\":1023000,\"tax\":23,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":60,\"minimum_order_qty\":1,\"details\":\"<p>Test<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-01-06T04:19:02.000000Z\",\"updated_at\":\"2023-02-20T20:10:04.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Gi\\u00e0y Da 1\",\"meta_description\":\"test\",\"meta_image\":\"2023-01-06-63b803a66ee7c.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"108097\",\"reviews_count\":0,\"translations\":[{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":16,\"locale\":\"vn\",\"key\":\"name\",\"value\":\"Gi\\u00e0y Da 1\",\"id\":1}],\"reviews\":[]}', 1, 1023000, 235290, 0, 'pending', 'unpaid', '2023-03-02 16:57:05', '2023-03-02 16:57:05', NULL, 'Aqua-39', '{\"color\":\"Aqua\",\"size\":\"39\"}', 'discount_on_product', 1, 0),
(40, 100034, 10, 1, NULL, '{\"id\":10,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1o polo xanh\",\"slug\":\"ao-polo-xanh-4i8Zno\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"7\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-01-06-63b7fee98db31.png\\\",\\\"2023-01-06-63b7fee98ef0b.png\\\"]\",\"thumbnail\":\"2023-01-06-63b7fee98f54f.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#9966CC\\\",\\\"#FAEBD7\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"L\\\",\\\"X\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Amethyst-L\\\",\\\"price\\\":340000,\\\"sku\\\":null,\\\"qty\\\":15},{\\\"type\\\":\\\"Amethyst-X\\\",\\\"price\\\":340000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"AntiqueWhite-L\\\",\\\"price\\\":340000,\\\"sku\\\":null,\\\"qty\\\":12},{\\\"type\\\":\\\"AntiqueWhite-X\\\",\\\"price\\\":340000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-L\\\",\\\"price\\\":340000,\\\"sku\\\":null,\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-X\\\",\\\"price\\\":340000,\\\"sku\\\":null,\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":340000,\"purchase_price\":340000,\"tax\":20,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":53,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-01-06T03:58:49.000000Z\",\"updated_at\":\"2023-01-06T03:58:51.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2023-01-06-63b7fee98f86e.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"133751\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 340000, 136000, 0, 'pending', 'unpaid', '2023-03-02 21:06:35', '2023-03-02 21:06:35', NULL, 'AntiqueWhite-L', '{\"color\":\"AntiqueWhite\",\"size\":\"L\"}', 'discount_on_product', 1, 0),
(41, 100035, 8, 1, NULL, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C D\\u00d9 UNISEX - TOTODAY - TOTODAY WINDBREAKER\",\"slug\":\"ao-khoac-du-unisex-totoday-totoday-windbreaker-guopU9\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":6,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-17-639d10e61115d.png\\\"]\",\"thumbnail\":\"2022-12-17-639d10e612346.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\",\\\"  M\\\",\\\"  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"X\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":1205},{\\\"type\\\":\\\"M\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"L\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":2323}]\",\"published\":0,\"unit_price\":400000,\"purchase_price\":400000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":3551,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-16T17:44:22.000000Z\",\"updated_at\":\"2023-03-02T04:07:42.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":\"\\u00bb B\\u1ea2O H\\u00c0NH S\\u1ea2N PH\\u1ea8M 90 NG\\u00c0Y\\r\\n\\r\\n\\u00bb \\u0110\\u1ed4I H\\u00c0NG TRONG V\\u00d2NG 30 NG\\u00c0Y\\r\\n\\r\\n\\u00bb HOTLINE B\\u00c1N H\\u00c0NG 1900 633 501\",\"meta_image\":\"2022-12-17-639d10e612930.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":2000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"104678\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 400000, 0, 0, 'pending', 'unpaid', '2023-03-02 22:57:11', '2023-03-02 22:57:11', NULL, 'X', '{\"size\":\"X\"}', 'discount_on_product', 1, 0);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `digital_file_after_sell`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(42, 100036, 16, 1, NULL, '{\"id\":16,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Gi\\u00e0y Da 1\",\"slug\":\"giay-da-1-Zs0wFg\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"10\\\",\\\"position\\\":1}]\",\"brand_id\":2,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-01-06-63b803a66d763.png\\\",\\\"2023-01-06-63b803a66ea36.png\\\"]\",\"thumbnail\":\"2023-01-06-63b803a66ec47.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"39\\\",\\\"  40\\\",\\\"  41\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Aqua-39\\\",\\\"price\\\":1023000,\\\"sku\\\":\\\"GD1-Aqua-39\\\",\\\"qty\\\":22},{\\\"type\\\":\\\"Aqua-40\\\",\\\"price\\\":1023000,\\\"sku\\\":\\\"GD1-Aqua-40\\\",\\\"qty\\\":23},{\\\"type\\\":\\\"Aqua-41\\\",\\\"price\\\":1023000,\\\"sku\\\":\\\"GD1-Aqua-41\\\",\\\"qty\\\":14}]\",\"published\":0,\"unit_price\":1023000,\"purchase_price\":1023000,\"tax\":23,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":59,\"minimum_order_qty\":1,\"details\":\"<p>Test<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-01-06T04:19:02.000000Z\",\"updated_at\":\"2023-03-02T16:57:05.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Gi\\u00e0y Da 1\",\"meta_description\":\"test\",\"meta_image\":\"2023-01-06-63b803a66ee7c.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"108097\",\"reviews_count\":0,\"translations\":[{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":16,\"locale\":\"vn\",\"key\":\"name\",\"value\":\"Gi\\u00e0y Da 1\",\"id\":1}],\"reviews\":[]}', 1, 1023000, 235290, 0, 'pending', 'unpaid', '2023-03-02 22:57:21', '2023-03-02 22:57:21', NULL, 'Aqua-39', '{\"color\":\"Aqua\",\"size\":\"39\"}', 'discount_on_product', 1, 0),
(43, 100037, 1, 1, NULL, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C N\\u1ec8 UNISEX - TOTODAY - SPARKY\",\"slug\":\"ao-khoac-ni-unisex-totoday-sparky-Rlofwi\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-12-63976b30c11c9.png\\\",\\\"2022-12-12-63976b30c25ac.png\\\"]\",\"thumbnail\":\"2022-12-12-63976b30c27ba.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#0000FF\\\",\\\"#8B0000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Blue-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":120},{\\\"type\\\":\\\"Blue-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":343},{\\\"type\\\":\\\"Blue-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":34},{\\\"type\\\":\\\"DarkRed-M\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":320},{\\\"type\\\":\\\"DarkRed-L\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":345},{\\\"type\\\":\\\"DarkRed-XL\\\",\\\"price\\\":520000,\\\"sku\\\":null,\\\"qty\\\":345}]\",\"published\":0,\"unit_price\":520000,\"purchase_price\":520000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":1507,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-12T10:56:00.000000Z\",\"updated_at\":\"2023-03-02T04:09:08.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"abc\",\"meta_description\":null,\"meta_image\":\"2022-12-12-63976b30c2cbf.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":30000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"104241\",\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":1,\"product_id\":1,\"customer_id\":4,\"delivery_man_id\":null,\"order_id\":null,\"comment\":\"T\\u1ed1t\",\"attachment\":\"[]\",\"rating\":5,\"status\":1,\"is_saved\":0,\"created_at\":\"2023-01-06T00:59:59.000000Z\",\"updated_at\":\"2023-03-02T21:12:02.000000Z\"}]}', 1, 520000, 0, 0, 'pending', 'unpaid', '2023-03-03 01:05:46', '2023-03-03 01:05:46', NULL, 'Blue-M', '{\"color\":\"Blue\",\"size\":\"M\"}', 'discount_on_product', 1, 0),
(44, 100038, 8, 1, NULL, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"\\u00c1O KHO\\u00c1C D\\u00d9 UNISEX - TOTODAY - TOTODAY WINDBREAKER\",\"slug\":\"ao-khoac-du-unisex-totoday-totoday-windbreaker-guopU9\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1}]\",\"brand_id\":6,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2022-12-17-639d10e61115d.png\\\"]\",\"thumbnail\":\"2022-12-17-639d10e612346.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"size\\\",\\\"options\\\":[\\\"X\\\",\\\"  M\\\",\\\"  L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"X\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":1204},{\\\"type\\\":\\\"M\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":23},{\\\"type\\\":\\\"L\\\",\\\"price\\\":400000,\\\"sku\\\":null,\\\"qty\\\":2323}]\",\"published\":0,\"unit_price\":400000,\"purchase_price\":400000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":3550,\"minimum_order_qty\":1,\"details\":\"<p><strong>&raquo;&nbsp;B\\u1ea2O H&Agrave;NH S\\u1ea2N PH\\u1ea8M&nbsp;90 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo; \\u0110\\u1ed4I H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y<\\/strong><\\/p>\\r\\n\\r\\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501<\\/strong><\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-16T17:44:22.000000Z\",\"updated_at\":\"2023-03-02T22:57:11.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":\"\\u00bb B\\u1ea2O H\\u00c0NH S\\u1ea2N PH\\u1ea8M 90 NG\\u00c0Y\\r\\n\\r\\n\\u00bb \\u0110\\u1ed4I H\\u00c0NG TRONG V\\u00d2NG 30 NG\\u00c0Y\\r\\n\\r\\n\\u00bb HOTLINE B\\u00c1N H\\u00c0NG 1900 633 501\",\"meta_image\":\"2022-12-17-639d10e612930.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":2000,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"104678\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 400000, 0, 0, 'pending', 'unpaid', '2023-03-03 01:06:18', '2023-03-03 01:06:18', NULL, 'X', '{\"size\":\"X\"}', 'discount_on_product', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_expected_delivery_histories`
--

CREATE TABLE `order_expected_delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(191) NOT NULL,
  `expected_delivery_date` date NOT NULL,
  `cause` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_status_histories`
--

CREATE TABLE `order_status_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `cause` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_status_histories`
--

INSERT INTO `order_status_histories` (`id`, `order_id`, `user_id`, `user_type`, `status`, `cause`, `created_at`, `updated_at`) VALUES
(1, 100001, 4, 'customer', 'pending', NULL, '2022-12-15 10:27:10', '2022-12-15 10:27:10'),
(2, 100002, 4, 'customer', 'pending', NULL, '2022-12-15 11:04:54', '2022-12-15 11:04:54'),
(3, 100002, 0, 'admin', 'confirmed', NULL, '2022-12-15 23:41:41', '2022-12-15 23:41:41'),
(4, 100004, 4, 'customer', 'pending', NULL, '2023-01-04 20:16:45', '2023-01-04 20:16:45'),
(5, 100004, 0, 'admin', 'processing', NULL, '2023-01-04 20:17:53', '2023-01-04 20:17:53'),
(6, 100005, 4, 'customer', 'pending', NULL, '2023-01-04 20:27:31', '2023-01-04 20:27:31'),
(7, 100006, 4, 'customer', 'pending', NULL, '2023-01-04 20:28:41', '2023-01-04 20:28:41'),
(8, 100007, 4, 'customer', 'pending', NULL, '2023-01-04 20:30:33', '2023-01-04 20:30:33'),
(9, 100004, 0, 'admin', 'returned', NULL, '2023-01-06 00:50:03', '2023-01-06 00:50:03'),
(10, 100004, 0, 'admin', 'returned', NULL, '2023-01-06 00:50:19', '2023-01-06 00:50:19'),
(11, 100002, 0, 'admin', 'delivered', NULL, '2023-01-06 00:57:21', '2023-01-06 00:57:21'),
(12, 100007, 0, 'admin', 'processing', NULL, '2023-01-06 01:04:45', '2023-01-06 01:04:45'),
(13, 100006, 0, 'admin', 'delivered', NULL, '2023-01-06 01:05:10', '2023-01-06 01:05:10'),
(14, 100008, 4, 'customer', 'pending', NULL, '2023-01-06 05:56:19', '2023-01-06 05:56:19'),
(15, 100009, 7, 'customer', 'pending', NULL, '2023-01-10 16:08:22', '2023-01-10 16:08:22'),
(16, 100009, 0, 'admin', 'delivered', NULL, '2023-01-10 16:10:31', '2023-01-10 16:10:31'),
(17, 100010, 7, 'customer', 'pending', NULL, '2023-01-10 16:13:45', '2023-01-10 16:13:45'),
(18, 100011, 7, 'customer', 'pending', NULL, '2023-01-10 16:15:31', '2023-01-10 16:15:31'),
(19, 100012, 7, 'customer', 'pending', NULL, '2023-01-10 16:15:50', '2023-01-10 16:15:50'),
(20, 100013, 7, 'customer', 'pending', NULL, '2023-01-10 16:31:07', '2023-01-10 16:31:07'),
(21, 100007, 1, 'seller', 'confirmed', NULL, '2023-01-10 16:31:25', '2023-01-10 16:31:25'),
(22, 100007, 1, 'seller', 'processing', NULL, '2023-01-10 16:31:28', '2023-01-10 16:31:28'),
(23, 100013, 1, 'seller', 'processing', NULL, '2023-01-10 16:31:38', '2023-01-10 16:31:38'),
(24, 100014, 1, 'seller', 'processing', NULL, '2023-01-10 16:36:13', '2023-01-10 16:36:13'),
(25, 100014, 0, 'admin', 'delivered', NULL, '2023-01-10 16:36:36', '2023-01-10 16:36:36'),
(26, 100016, 4, 'customer', 'pending', NULL, '2023-02-13 18:10:56', '2023-02-13 18:10:56'),
(27, 100018, 0, 'admin', 'confirmed', NULL, '2023-02-15 22:30:45', '2023-02-15 22:30:45'),
(28, 100020, 0, 'admin', 'processing', NULL, '2023-02-15 22:47:57', '2023-02-15 22:47:57'),
(29, 100021, 4, 'customer', 'pending', NULL, '2023-02-18 18:22:38', '2023-02-18 18:22:38'),
(30, 100022, 4, 'customer', 'confirmed', NULL, '2023-02-18 18:28:07', '2023-02-18 18:28:07'),
(31, 100023, 4, 'customer', 'confirmed', NULL, '2023-02-20 18:44:45', '2023-02-20 18:44:45'),
(32, 100024, 0, 'admin', 'delivered', NULL, '2023-02-20 20:34:37', '2023-02-20 20:34:37'),
(33, 100025, 10, 'customer', 'pending', NULL, '2023-02-26 11:24:14', '2023-02-26 11:24:14'),
(34, 100025, 0, 'admin', 'delivered', NULL, '2023-02-26 12:20:08', '2023-02-26 12:20:08'),
(35, 100026, 10, 'customer', 'pending', NULL, '2023-02-26 12:22:53', '2023-02-26 12:22:53'),
(36, 100027, 10, 'customer', 'confirmed', NULL, '2023-02-26 12:24:20', '2023-02-26 12:24:20'),
(37, 100028, 12, 'customer', 'pending', NULL, '2023-02-27 13:59:17', '2023-02-27 13:59:17'),
(38, 100029, 12, 'customer', 'pending', NULL, '2023-03-02 02:37:39', '2023-03-02 02:37:39'),
(39, 100030, 12, 'customer', 'confirmed', NULL, '2023-03-02 02:40:59', '2023-03-02 02:40:59'),
(40, 100029, 0, 'admin', 'delivered', NULL, '2023-03-02 20:57:22', '2023-03-02 20:57:22'),
(41, 100030, 0, 'admin', 'delivered', NULL, '2023-03-02 20:58:11', '2023-03-02 20:58:11'),
(42, 100026, 0, 'admin', 'delivered', NULL, '2023-03-02 21:10:44', '2023-03-02 21:10:44'),
(43, 100035, 4, 'customer', 'confirmed', NULL, '2023-03-02 22:57:11', '2023-03-02 22:57:11'),
(44, 100036, 4, 'customer', 'confirmed', NULL, '2023-03-02 22:57:21', '2023-03-02 22:57:21'),
(45, 100037, 4, 'customer', 'confirmed', NULL, '2023-03-03 01:05:46', '2023-03-03 01:05:46'),
(46, 100038, 4, 'customer', 'pending', NULL, '2023-03-03 01:06:18', '2023-03-03 01:06:18');

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `seller_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_amount` decimal(50,2) NOT NULL DEFAULT 0.00,
  `seller_amount` decimal(50,2) NOT NULL DEFAULT 0.00,
  `admin_commission` decimal(50,2) NOT NULL DEFAULT 0.00,
  `received_by` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `delivery_charge` decimal(50,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(50,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `delivered_by` varchar(191) NOT NULL DEFAULT 'admin',
  `payment_method` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_transactions`
--

INSERT INTO `order_transactions` (`seller_id`, `order_id`, `order_amount`, `seller_amount`, `admin_commission`, `received_by`, `status`, `delivery_charge`, `tax`, `created_at`, `updated_at`, `customer_id`, `seller_is`, `delivered_by`, `payment_method`, `transaction_id`, `id`) VALUES
(1, 100002, '1040000.00', '1040000.00', '0.00', 'admin', 'disburse', '5.00', '0.00', '2023-01-06 00:57:21', '2023-01-06 00:57:21', 4, 'admin', 'admin', 'cash_on_delivery', '2601-SEzux-1672991841', 1),
(1, 100006, '150000.00', '150000.00', '0.00', 'admin', 'disburse', '5.00', '0.00', '2023-01-06 01:05:10', '2023-01-06 01:05:10', 4, 'admin', 'admin', 'cash_on_delivery', '2670-DydjL-1672992310', 2),
(1, 100009, '2300000.00', '2300000.00', '0.00', 'admin', 'disburse', '5.00', '575000.00', '2023-01-10 16:10:31', '2023-01-10 16:10:31', 7, 'admin', 'admin', 'cash_on_delivery', '4287-Cxq6F-1673392231', 3),
(1, 100014, '1400000.00', '1400000.00', '0.00', 'admin', 'disburse', '5.00', '28000.00', '2023-01-10 16:36:36', '2023-01-10 16:36:36', 7, 'seller', 'admin', 'cash_on_delivery', '3275-K4Bul-1673393796', 4),
(1, 100022, '520000.00', '520000.00', '0.00', 'admin', 'hold', '0.00', '0.00', '2023-02-18 18:28:07', '2023-02-18 18:28:07', 4, 'admin', 'admin', 'vnpay', '6280-FBWd0-1676744887', 5),
(1, 100023, '200000.00', '200000.00', '0.00', 'admin', 'hold', '0.00', '40000.00', '2023-02-20 18:44:45', '2023-02-20 18:44:45', 4, 'admin', 'admin', 'vnpay', '2664-8zxRY-1676918685', 6),
(1, 100024, '5600000.00', '5320000.00', '280000.00', 'admin', 'disburse', '30000.00', '112000.00', '2023-02-20 20:33:47', '2023-02-20 20:34:38', 4, 'seller', 'admin', 'vnpay', '7300-Osap5-1676925227', 7),
(1, 100025, '1400000.00', '1330000.00', '70000.00', 'admin', 'disburse', '30000.00', '28000.00', '2023-02-26 12:20:08', '2023-02-26 12:20:08', 10, 'seller', 'admin', 'cash_on_delivery', '4950-lJ6vE-1677414008', 8),
(1, 100027, '400000.00', '380000.00', '20000.00', 'admin', 'hold', '10000.00', '0.00', '2023-02-26 12:24:20', '2023-02-26 12:24:20', 10, 'seller', 'admin', 'vnpay', '2069-N0FQF-1677414260', 9),
(1, 100030, '1400000.00', '1330000.00', '70000.00', 'admin', 'disburse', '30000.00', '28000.00', '2023-03-02 02:40:59', '2023-03-02 20:58:11', 12, 'seller', 'admin', 'vnpay', '2511-llTN6-1677724859', 10),
(1, 100031, '3600000.00', '3420000.00', '180000.00', 'admin', 'hold', '30000.00', '56000.00', '2023-03-02 04:07:42', '2023-03-02 04:07:42', 4, 'seller', 'admin', 'vnpay', '1752-1Esw0-1677730062', 11),
(1, 100032, '520000.00', '520000.00', '0.00', 'admin', 'hold', '10000.00', '0.00', '2023-03-02 04:09:08', '2023-03-02 04:09:08', 4, 'admin', 'admin', 'vnpay', '8452-PuAtw-1677730148', 12),
(1, 100033, '1023000.00', '1023000.00', '0.00', 'admin', 'hold', '30000.00', '235290.00', '2023-03-02 16:57:05', '2023-03-02 16:57:05', 4, 'admin', 'admin', 'vnpay', '7940-dE9UP-1677776225', 13),
(1, 100029, '370500.00', '370500.00', '0.00', 'admin', 'disburse', '10000.00', '19500.00', '2023-03-02 20:57:22', '2023-03-02 20:57:22', 12, 'admin', 'admin', 'cash_on_delivery', '1952-arvN0-1677790642', 14),
(1, 100034, '680000.00', '680000.00', '0.00', 'admin', 'hold', '10000.00', '136000.00', '2023-03-02 21:06:35', '2023-03-02 21:06:35', 4, 'admin', 'admin', 'vnpay', '2301-YjDV3-1677791195', 15),
(1, 100026, '400000.00', '380000.00', '20000.00', 'admin', 'disburse', '30000.00', '0.00', '2023-03-02 21:10:44', '2023-03-02 21:10:44', 10, 'seller', 'admin', 'cash_on_delivery', '1887-7spGM-1677791444', 16),
(1, 100035, '400000.00', '400000.00', '0.00', 'admin', 'hold', '30000.00', '0.00', '2023-03-02 22:57:11', '2023-03-02 22:57:11', 4, 'seller', 'admin', 'vnpay', '5313-32orQ-1677797831', 17),
(1, 100036, '1023000.00', '1023000.00', '0.00', 'admin', 'hold', '10000.00', '235290.00', '2023-03-02 22:57:21', '2023-03-02 22:57:21', 4, 'admin', 'admin', 'vnpay', '7884-ieSCr-1677797841', 18),
(1, 100037, '520000.00', '520000.00', '0.00', 'admin', 'hold', '10000.00', '0.00', '2023-03-03 01:05:46', '2023-03-03 01:05:46', 4, 'admin', 'admin', 'vnpay', '7776-ZIPD1-1677805546', 19);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `identity` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(191) NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`identity`, `token`, `created_at`, `user_type`) VALUES
('connectwithan1@gmail.com', 'gKNep7pYddl1ZndlgLzxfyjvOsoBWdXiGg2Zy6ATxl0ztkyMHv4st93SvcuniAjaT9y4lZsxtdIeJJhI5BF57WzjR66DVNLzDVPFcuWAIio7i3WMKwMUFuvq', '2022-12-15 22:51:19', 'customer'),
('linyleader@gmail.com', 'KhxZ06veZEL9CYwFpBUpmcWuCthcXbjOiYkuOZGh0fnw5uuq6sMNe9cFbdBVNWSpuPjROZPiyFcOym42YMIfCxtliaBotJVYMZXlPsW9UXzrZGoflJCGIjTS', '2023-02-05 14:58:06', 'customer'),
('connectwithan@gmail.com', 'fBdsaYoN94tkoRDtpaSjDLtgg2pAZZvz1ereuf4OIttdiOZ7jMgqRczMr2muHcN4UFVPTqjtEd6uNfm5MbITPPJdnhjIVJKAAHFXGoWQ75dwLsLn0MhsaYbV', '2023-02-19 02:18:28', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `paytabs_invoices`
--

CREATE TABLE `paytabs_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `result` text NOT NULL,
  `response_code` int(10) UNSIGNED NOT NULL,
  `pt_invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `card_brand` varchar(191) DEFAULT NULL,
  `card_first_six_digits` int(10) UNSIGNED DEFAULT NULL,
  `card_last_four_digits` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_or_email_verifications`
--

CREATE TABLE `phone_or_email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone_or_email` varchar(191) DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `product_type` varchar(20) NOT NULL DEFAULT 'physical',
  `category_ids` varchar(80) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `unit` varchar(191) DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `refundable` tinyint(1) NOT NULL DEFAULT 1,
  `digital_product_type` varchar(30) DEFAULT NULL,
  `digital_file_ready` varchar(191) DEFAULT NULL,
  `images` longtext DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `flash_deal` varchar(255) DEFAULT NULL,
  `video_provider` varchar(30) DEFAULT NULL,
  `video_url` varchar(150) DEFAULT NULL,
  `colors` varchar(150) DEFAULT NULL,
  `variant_product` tinyint(1) NOT NULL DEFAULT 0,
  `attributes` varchar(255) DEFAULT NULL,
  `choice_options` text DEFAULT NULL,
  `variation` text DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `unit_price` double NOT NULL DEFAULT 0,
  `purchase_price` double NOT NULL DEFAULT 0,
  `tax` varchar(191) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(80) DEFAULT NULL,
  `discount` varchar(191) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(80) DEFAULT NULL,
  `current_stock` int(11) DEFAULT NULL,
  `minimum_order_qty` int(11) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `attachment` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `featured_status` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT 0,
  `denied_note` varchar(191) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `temp_shipping_cost` double(8,2) DEFAULT NULL,
  `is_shipping_cost_updated` tinyint(1) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `product_type`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `digital_product_type`, `digital_file_ready`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `minimum_order_qty`, `details`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`, `shipping_cost`, `multiply_qty`, `temp_shipping_cost`, `is_shipping_cost_updated`, `code`) VALUES
(1, 'admin', 1, 'ÁO KHOÁC NỈ UNISEX - TOTODAY - SPARKY', 'ao-khoac-ni-unisex-totoday-sparky-Rlofwi', 'physical', '[{\"id\":\"3\",\"position\":1}]', 1, 'kg', 1, 1, NULL, NULL, '[\"2022-12-12-63976b30c11c9.png\",\"2022-12-12-63976b30c25ac.png\"]', '2022-12-12-63976b30c27ba.png', '1', NULL, 'youtube', NULL, '[\"#0000FF\",\"#8B0000\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"size\",\"options\":[\"M\",\"  L\",\"  XL\"]}]', '[{\"type\":\"Blue-M\",\"price\":520000,\"sku\":null,\"qty\":119},{\"type\":\"Blue-L\",\"price\":520000,\"sku\":null,\"qty\":343},{\"type\":\"Blue-XL\",\"price\":520000,\"sku\":null,\"qty\":34},{\"type\":\"DarkRed-M\",\"price\":520000,\"sku\":null,\"qty\":320},{\"type\":\"DarkRed-L\",\"price\":520000,\"sku\":null,\"qty\":345},{\"type\":\"DarkRed-XL\",\"price\":520000,\"sku\":null,\"qty\":345}]', 0, 520000, 520000, '0', 'percent', '0', 'flat', 1506, 1, '<p><strong>&raquo;&nbsp;BẢO H&Agrave;NH SẢN PHẨM&nbsp;90 NG&Agrave;Y</strong></p>\r\n\r\n<p><strong>&raquo; ĐỔI H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y</strong></p>\r\n\r\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501</strong></p>', 0, NULL, '2022-12-12 10:56:00', '2023-03-03 01:05:46', 1, 1, 'abc', NULL, '2022-12-12-63976b30c2cbf.png', 1, NULL, 30000.00, 1, NULL, NULL, '104241'),
(2, 'admin', 1, 'ÁO KHOÁC W2AKN10201FOSBA', 'ao-khoac-w2akn10201fosba-ttidMe', 'physical', '[{\"id\":\"3\",\"position\":1}]', 1, 'kg', 1, 1, NULL, NULL, '[\"2022-12-16-639c283a98dcc.png\",\"2022-12-16-639c283a9a05b.png\"]', '2022-12-16-639c283a9a522.png', '1', NULL, 'youtube', NULL, '[\"#FAEBD7\",\"#00FFFF\",\"#000000\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"size\",\"options\":[\"X\",\"  M\",\"  L\"]}]', '[{\"type\":\"AntiqueWhite-X\",\"price\":200000,\"sku\":null,\"qty\":0},{\"type\":\"AntiqueWhite-M\",\"price\":200000,\"sku\":null,\"qty\":1},{\"type\":\"AntiqueWhite-L\",\"price\":200000,\"sku\":null,\"qty\":1},{\"type\":\"Aqua-X\",\"price\":200000,\"sku\":null,\"qty\":0},{\"type\":\"Aqua-M\",\"price\":200000,\"sku\":null,\"qty\":1},{\"type\":\"Aqua-L\",\"price\":200000,\"sku\":null,\"qty\":1},{\"type\":\"Black-X\",\"price\":200000,\"sku\":null,\"qty\":1},{\"type\":\"Black-M\",\"price\":200000,\"sku\":null,\"qty\":1},{\"type\":\"Black-L\",\"price\":200000,\"sku\":null,\"qty\":1}]', 0, 200000, 200000, '0', 'percent', '50000', 'flat', 7, 1, '<p><strong>&raquo;&nbsp;BẢO H&Agrave;NH SẢN PHẨM&nbsp;90 NG&Agrave;Y</strong></p>\r\n\r\n<p><strong>&raquo; ĐỔI H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y</strong></p>\r\n\r\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501</strong></p>', 0, NULL, '2022-12-16 01:11:38', '2023-02-15 22:47:37', 1, 1, 'ÁO KHOÁC W2AKN10201FOSBA', '» BẢO HÀNH SẢN PHẨM 90 NGÀY\r\n\r\n» ĐỔI HÀNG TRONG VÒNG 30 NGÀY\r\n\r\n» HOTLINE BÁN HÀNG 1900 633 501', '2022-12-16-639c283a9a8a9.png', 1, NULL, 10000.00, 1, NULL, NULL, '172058'),
(3, 'admin', 1, 'ÁO KHOÁC VARSITY UNISEX - TOTODAY - JOVIAL', 'ao-khoac-varsity-unisex-totoday-jovial-6LDbRN', 'physical', '[{\"id\":\"3\",\"position\":1}]', 1, 'kg', 1, 1, NULL, NULL, '[\"2022-12-16-639c28e7b03d2.png\",\"2022-12-16-639c28e7b1537.png\"]', '2022-12-16-639c28e7b1ab0.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 430000, 430000, '0', 'percent', '0', 'flat', 0, 1, '<p><strong>&raquo;&nbsp;BẢO H&Agrave;NH SẢN PHẨM&nbsp;90 NG&Agrave;Y</strong></p>\r\n\r\n<p><strong>&raquo; ĐỔI H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y</strong></p>\r\n\r\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501</strong></p>', 0, NULL, '2022-12-16 01:14:31', '2023-01-06 05:56:19', 1, 1, 'ÁO KHOÁC VARSITY UNISEX - TOTODAY - JOVIAL', '» BẢO HÀNH SẢN PHẨM 90 NGÀY\r\n\r\n» ĐỔI HÀNG TRONG VÒNG 30 NGÀY\r\n\r\n» HOTLINE BÁN HÀNG 1900 633 501', '2022-12-16-639c28e7b218f.png', 1, NULL, 0.00, 0, NULL, NULL, '188546'),
(4, 'admin', 1, 'ÁO SƠ MI NAM - FLANNEL - TOTODAY - 12207', 'ao-so-mi-nam-flannel-totoday-12207-o2shyW', 'physical', '[{\"id\":\"6\",\"position\":1}]', 1, 'kg', 1, 1, NULL, NULL, '[\"2022-12-16-639c2c9b19226.png\",\"2022-12-16-639c2c9b1ab9f.png\"]', '2022-12-16-639c2c9b1afb0.png', '1', NULL, 'youtube', NULL, '[\"#9966CC\",\"#00FFFF\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"size\",\"options\":[\"X\",\"M\",\"L\"]}]', '[{\"type\":\"Amethyst-X\",\"price\":400000,\"sku\":null,\"qty\":1},{\"type\":\"Amethyst-M\",\"price\":400000,\"sku\":null,\"qty\":1},{\"type\":\"Amethyst-L\",\"price\":400000,\"sku\":null,\"qty\":1},{\"type\":\"Aqua-X\",\"price\":400000,\"sku\":null,\"qty\":1},{\"type\":\"Aqua-M\",\"price\":400000,\"sku\":null,\"qty\":1},{\"type\":\"Aqua-L\",\"price\":400000,\"sku\":null,\"qty\":1}]', 0, 400000, 400000, '0', 'percent', '25', 'percent', 6, 1, '<p><strong>&raquo;&nbsp;BẢO H&Agrave;NH SẢN PHẨM&nbsp;90 NG&Agrave;Y</strong></p>\r\n\r\n<p><strong>&raquo; ĐỔI H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y</strong></p>\r\n\r\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501</strong></p>', 0, NULL, '2022-12-16 01:30:19', '2022-12-16 01:30:21', 1, 1, 'ÁO SƠ MI NAM - FLANNEL - TOTODAY - 12207', '» BẢO HÀNH SẢN PHẨM 90 NGÀY\r\n\r\n» ĐỔI HÀNG TRONG VÒNG 30 NGÀY\r\n\r\n» HOTLINE BÁN HÀNG 1900 633 501', '2022-12-16-639c2c9b1b4fc.png', 1, NULL, 1000.00, 1, NULL, NULL, '156782'),
(5, 'admin', 1, 'ÁO SƠ MI NAM - FLANNEL - TOTODAY - 12206', 'ao-so-mi-nam-flannel-totoday-12206-pZBLOA', 'physical', '[{\"id\":\"6\",\"position\":1}]', 1, 'kg', 1, 1, NULL, NULL, '[\"2022-12-16-639c2d391c0d5.png\",\"2022-12-16-639c2d391d297.png\"]', '2022-12-16-639c2d391d5a5.png', '1', NULL, 'youtube', NULL, '[\"#9966CC\",\"#D2691E\",\"#8B0000\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"size\",\"options\":[\"X\",\"M\",\"L\"]}]', '[{\"type\":\"Amethyst-X\",\"price\":200000,\"sku\":null,\"qty\":1},{\"type\":\"Amethyst-M\",\"price\":200000,\"sku\":null,\"qty\":1},{\"type\":\"Amethyst-L\",\"price\":200000,\"sku\":null,\"qty\":1},{\"type\":\"Chocolate-X\",\"price\":200000,\"sku\":null,\"qty\":1},{\"type\":\"Chocolate-M\",\"price\":200000,\"sku\":null,\"qty\":1},{\"type\":\"Chocolate-L\",\"price\":200000,\"sku\":null,\"qty\":1},{\"type\":\"DarkRed-X\",\"price\":200000,\"sku\":null,\"qty\":1},{\"type\":\"DarkRed-M\",\"price\":200000,\"sku\":null,\"qty\":1},{\"type\":\"DarkRed-L\",\"price\":200000,\"sku\":null,\"qty\":1}]', 0, 200000, 200000, '0', 'percent', '0', 'flat', 9, 1, '<p><strong>&raquo;&nbsp;BẢO H&Agrave;NH SẢN PHẨM&nbsp;90 NG&Agrave;Y</strong></p>\r\n\r\n<p><strong>&raquo; ĐỔI H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y</strong></p>\r\n\r\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501</strong></p>', 0, NULL, '2022-12-16 01:32:57', '2022-12-16 01:34:11', 1, 1, 'ÁO SƠ MI NAM - FLANNEL - TOTODAY - 12206', '» BẢO HÀNH SẢN PHẨM 90 NGÀY\r\n\r\n» ĐỔI HÀNG TRONG VÒNG 30 NGÀY\r\n\r\n» HOTLINE BÁN HÀNG 1900 633 501', '2022-12-16-639c2d391decb.png', 1, NULL, 0.00, 0, NULL, NULL, '127458'),
(6, 'admin', 1, 'ÁO SƠ MI NAM - DOUBLE POCKETS - TOTODAY - 12205', 'ao-so-mi-nam-double-pockets-totoday-12205-69mUzk', 'physical', '[{\"id\":\"6\",\"position\":1}]', 1, 'kg', 1, 1, NULL, NULL, '[\"2022-12-16-639c2d8047d54.png\",\"2022-12-16-639c2d8048f52.png\"]', '2022-12-16-639c2d80491af.png', '1', NULL, 'youtube', NULL, '[\"#F0F8FF\",\"#7FFFD4\",\"#000000\"]', 0, 'null', '[]', '[{\"type\":\"AliceBlue\",\"price\":340000,\"sku\":null,\"qty\":0},{\"type\":\"Aquamarine\",\"price\":340000,\"sku\":null,\"qty\":0},{\"type\":\"Black\",\"price\":340000,\"sku\":null,\"qty\":1}]', 0, 340000, 340000, '2', 'percent', '0', 'flat', 1, 1, NULL, 0, NULL, '2022-12-16 01:34:08', '2023-01-06 05:56:19', 1, 1, 'ÁO SƠ MI NAM - DOUBLE POCKETS - TOTODAY - 12205', NULL, '2022-12-16-639c2d80497af.png', 1, NULL, 1000.00, 1, NULL, NULL, '166371'),
(8, 'seller', 1, 'ÁO KHOÁC DÙ UNISEX - TOTODAY - TOTODAY WINDBREAKER', 'ao-khoac-du-unisex-totoday-totoday-windbreaker-guopU9', 'physical', '[{\"id\":\"3\",\"position\":1}]', 6, 'kg', 1, 1, NULL, NULL, '[\"2022-12-17-639d10e61115d.png\"]', '2022-12-17-639d10e612346.png', '1', NULL, 'youtube', NULL, '[]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"size\",\"options\":[\"X\",\"  M\",\"  L\"]}]', '[{\"type\":\"X\",\"price\":400000,\"sku\":null,\"qty\":1203},{\"type\":\"M\",\"price\":400000,\"sku\":null,\"qty\":23},{\"type\":\"L\",\"price\":400000,\"sku\":null,\"qty\":2323}]', 0, 400000, 400000, '0', 'percent', '0', 'flat', 3549, 1, '<p><strong>&raquo;&nbsp;BẢO H&Agrave;NH SẢN PHẨM&nbsp;90 NG&Agrave;Y</strong></p>\r\n\r\n<p><strong>&raquo; ĐỔI H&Agrave;NG TRONG V&Ograve;NG 30 NG&Agrave;Y</strong></p>\r\n\r\n<p><strong>&raquo;&nbsp;HOTLINE B&Aacute;N H&Agrave;NG 1900 633 501</strong></p>', 0, NULL, '2022-12-16 17:44:22', '2023-03-03 01:06:18', 1, 1, NULL, '» BẢO HÀNH SẢN PHẨM 90 NGÀY\r\n\r\n» ĐỔI HÀNG TRONG VÒNG 30 NGÀY\r\n\r\n» HOTLINE BÁN HÀNG 1900 633 501', '2022-12-17-639d10e612930.png', 1, NULL, 2000.00, 1, NULL, NULL, '104678'),
(9, 'admin', 1, 'Áo Polo siêu đẹp', 'ao-polo-sieu-dep-ikHOGb', 'physical', '[{\"id\":\"7\",\"position\":1}]', 7, 'kg', 1, 1, NULL, NULL, '[\"2023-01-06-63b7fe29442d1.png\",\"2023-01-06-63b7fe2970a3b.png\"]', '2023-01-06-63b7fe2970cc3.png', '1', NULL, 'youtube', NULL, '[]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"size\",\"options\":[\"L\",\"M\",\"X\"]}]', '[{\"type\":\"L\",\"price\":200000,\"sku\":null,\"qty\":1},{\"type\":\"M\",\"price\":200000,\"sku\":null,\"qty\":1},{\"type\":\"X\",\"price\":200000,\"sku\":null,\"qty\":1}]', 0, 200000, 200000, '0', 'percent', '0', 'flat', 3, 1, NULL, 0, NULL, '2023-01-06 03:55:37', '2023-01-06 03:55:40', 1, 1, 'Áo Polo siêu đẹp', NULL, '2023-01-06-63b7fe2970f62.png', 1, NULL, 0.00, 1, NULL, NULL, '188027'),
(10, 'admin', 1, 'Áo polo xanh', 'ao-polo-xanh-4i8Zno', 'physical', '[{\"id\":\"7\",\"position\":1}]', 1, 'kg', 1, 1, NULL, NULL, '[\"2023-01-06-63b7fee98db31.png\",\"2023-01-06-63b7fee98ef0b.png\"]', '2023-01-06-63b7fee98f54f.png', '1', NULL, 'youtube', NULL, '[\"#9966CC\",\"#FAEBD7\",\"#00FFFF\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"size\",\"options\":[\"L\",\"  X\"]}]', '[{\"type\":\"Amethyst-L\",\"price\":340000,\"sku\":null,\"qty\":15},{\"type\":\"Amethyst-X\",\"price\":340000,\"sku\":null,\"qty\":23},{\"type\":\"AntiqueWhite-L\",\"price\":340000,\"sku\":null,\"qty\":10},{\"type\":\"AntiqueWhite-X\",\"price\":340000,\"sku\":null,\"qty\":1},{\"type\":\"Aqua-L\",\"price\":340000,\"sku\":null,\"qty\":1},{\"type\":\"Aqua-X\",\"price\":340000,\"sku\":null,\"qty\":1}]', 0, 340000, 340000, '0', 'percent', '0', 'flat', 51, 1, NULL, 0, NULL, '2023-01-06 03:58:49', '2023-03-02 22:07:13', 1, 1, NULL, NULL, '2023-01-06-63b7fee98f86e.png', 1, NULL, 0.00, 1, NULL, NULL, '133751'),
(12, 'admin', 1, 'Áo Vest 1', 'ao-vest-1-VfCYPC', 'physical', '[{\"id\":\"8\",\"position\":1}]', 7, 'kg', 1, 1, NULL, NULL, '[\"2023-01-06-63b8011cb3461.png\",\"2023-01-06-63b8011cb484b.png\"]', '2023-01-06-63b8011cb4b2b.png', '1', NULL, 'youtube', NULL, '[\"#F0F8FF\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"size\",\"options\":[\"XL\",\"X\"]}]', '[{\"type\":\"AliceBlue-XL\",\"price\":1020000,\"sku\":null,\"qty\":1},{\"type\":\"AliceBlue-X\",\"price\":1020000,\"sku\":null,\"qty\":1}]', 0, 1020000, 1020000, '0', 'percent', '0', 'flat', 2, 1, NULL, 0, NULL, '2023-01-06 04:08:12', '2023-02-27 13:36:29', 1, 1, 'Áo Vest 1', NULL, '2023-01-06-63b8011cb4e78.png', 1, NULL, 0.00, 1, NULL, NULL, '171172'),
(13, 'admin', 1, 'Áo Vest 2', 'ao-vest-2-s1kd7M', 'physical', '[{\"id\":\"8\",\"position\":1}]', 7, 'kg', 1, 1, NULL, NULL, '[\"2023-01-06-63b8018fa5973.png\",\"2023-01-06-63b8018fa6916.png\"]', '2023-01-06-63b8018fa6b4f.png', '1', NULL, 'youtube', NULL, '[\"#FAEBD7\",\"#00FFFF\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"size\",\"options\":[\"X\",\"  L\"]}]', '[{\"type\":\"AntiqueWhite-X\",\"price\":1400000,\"sku\":null,\"qty\":23},{\"type\":\"AntiqueWhite-L\",\"price\":1400000,\"sku\":null,\"qty\":32},{\"type\":\"Aqua-X\",\"price\":1400000,\"sku\":null,\"qty\":14},{\"type\":\"Aqua-L\",\"price\":1400000,\"sku\":null,\"qty\":1}]', 0, 1400000, 1400000, '0', 'percent', '0', 'flat', 70, 1, NULL, 0, NULL, '2023-01-06 04:10:07', '2023-03-02 22:06:58', 1, 1, 'Áo Vest 2', NULL, '2023-01-06-63b8018fa6e3f.png', 1, NULL, 0.00, 1, NULL, NULL, '183787'),
(14, 'admin', 1, 'Giày thể thao siêu nữ tính', 'giay-the-thao-sieu-nu-tinh-keO6ni', 'physical', '[{\"id\":\"9\",\"position\":1}]', 5, 'kg', 1, 1, NULL, NULL, '[\"2023-01-06-63b8026ee7a12.png\",\"2023-01-06-63b8026ee9427.png\"]', '2023-01-06-63b8026ee9a66.png', '1', NULL, 'youtube', NULL, '[\"#FFE4C4\",\"#000000\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"size\",\"options\":[\"XL\",\"L\"]}]', '[{\"type\":\"Bisque-XL\",\"price\":230000,\"sku\":\"Gttsnt-Bisque-XL\",\"qty\":22},{\"type\":\"Bisque-L\",\"price\":230000,\"sku\":\"Gttsnt-Bisque-L\",\"qty\":32},{\"type\":\"Black-XL\",\"price\":230000,\"sku\":\"Gttsnt-Black-XL\",\"qty\":32},{\"type\":\"Black-L\",\"price\":230000,\"sku\":\"Gttsnt-Black-L\",\"qty\":4}]', 0, 230000, 230000, '0', 'percent', '0', 'flat', 90, 1, NULL, 0, NULL, '2023-01-06 04:13:50', '2023-02-15 22:47:37', 1, 1, 'Giày thể thao siêu nữ tính', NULL, '2023-01-06-63b8026ee9fe7.png', 1, NULL, 0.00, 1, NULL, NULL, '107745'),
(15, 'admin', 1, 'Giày hồng siêu nữ tính', 'giay-hong-sieu-nu-tinh-QpFNKQ', 'physical', '[{\"id\":\"9\",\"position\":1}]', 7, 'kg', 1, 1, NULL, NULL, '[\"2023-01-06-63b80317c4429.png\",\"2023-01-06-63b80317c555a.png\"]', '2023-01-06-63b80317c580f.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[{\"name\":\"choice_\",\"title\":\"size\",\"options\":[\"\"]}]', '[{\"type\":\"\",\"price\":0,\"sku\":null,\"qty\":0}]', 0, 400000, 400000, '0', 'percent', '0', 'flat', 0, 1, NULL, 0, NULL, '2023-01-06 04:16:39', '2023-03-02 22:07:33', 1, 1, 'Giày hồng siêu nữ tính', NULL, '2023-01-06-63b80317c5b18.png', 1, NULL, 0.00, 1, NULL, NULL, '120572'),
(16, 'admin', 1, 'Giày Da 1', 'giay-da-1-Zs0wFg', 'physical', '[{\"id\":\"10\",\"position\":1}]', 2, 'kg', 1, 1, NULL, NULL, '[\"2023-01-06-63b803a66d763.png\",\"2023-01-06-63b803a66ea36.png\"]', '2023-01-06-63b803a66ec47.png', '1', NULL, 'youtube', NULL, '[\"#00FFFF\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"size\",\"options\":[\"39\",\"  40\",\"  41\"]}]', '[{\"type\":\"Aqua-39\",\"price\":1023000,\"sku\":\"GD1-Aqua-39\",\"qty\":21},{\"type\":\"Aqua-40\",\"price\":1023000,\"sku\":\"GD1-Aqua-40\",\"qty\":23},{\"type\":\"Aqua-41\",\"price\":1023000,\"sku\":\"GD1-Aqua-41\",\"qty\":14}]', 0, 1023000, 1023000, '23', 'percent', '0', 'flat', 58, 1, '<p>Test</p>', 0, NULL, '2023-01-06 04:19:02', '2023-03-02 22:57:21', 1, 1, 'Giày Da 1', 'test', '2023-01-06-63b803a66ee7c.png', 1, NULL, 0.00, 0, NULL, NULL, '108097'),
(17, 'admin', 1, 'Giày Da 2', 'giay-da-2-cQ7BdD', 'physical', '[{\"id\":\"10\",\"position\":1}]', 5, 'kg', 1, 1, NULL, NULL, '[\"2023-01-06-63b803e73676b.png\",\"2023-01-06-63b803e737c88.png\"]', '2023-01-06-63b803e737f02.png', '1', NULL, 'youtube', NULL, '[\"#FAEBD7\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"size\",\"options\":[\"37\",\"38\",\"39\"]}]', '[{\"type\":\"AntiqueWhite-37\",\"price\":130000,\"sku\":\"GD2-AntiqueWhite-37\",\"qty\":23},{\"type\":\"AntiqueWhite-38\",\"price\":130000,\"sku\":\"GD2-AntiqueWhite-38\",\"qty\":23},{\"type\":\"AntiqueWhite-39\",\"price\":130000,\"sku\":\"GD2-AntiqueWhite-39\",\"qty\":19}]', 0, 130000, 130000, '23', 'percent', '0', 'flat', 65, 1, NULL, 0, NULL, '2023-01-06 04:20:07', '2023-02-15 22:24:35', 1, 1, NULL, NULL, '2023-01-06-63b803e73819e.png', 1, NULL, 0.00, 1, NULL, NULL, '176723'),
(18, 'admin', 1, 'Đồ hồ 1', 'do-ho-1-6N7DBi', 'physical', '[{\"id\":\"11\",\"position\":1}]', 6, 'kg', 1, 1, NULL, NULL, '[\"2023-01-06-63b8049618601.png\",\"2023-01-06-63b80496199ed.png\"]', '2023-01-06-63b8049619c75.png', '1', NULL, 'youtube', NULL, '[\"#00FFFF\",\"#7FFFD4\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"size\",\"options\":[\"L\",\"XL\"]}]', '[{\"type\":\"Aqua-L\",\"price\":2300000,\"sku\":null,\"qty\":22},{\"type\":\"Aqua-XL\",\"price\":2300000,\"sku\":null,\"qty\":23},{\"type\":\"Aquamarine-L\",\"price\":2300000,\"sku\":null,\"qty\":12},{\"type\":\"Aquamarine-XL\",\"price\":2300000,\"sku\":null,\"qty\":12}]', 0, 2300000, 2300000, '23', 'percent', '0', 'flat', 69, 1, NULL, 0, NULL, '2023-01-06 04:23:02', '2023-01-10 16:15:31', 1, 1, 'Đồ hồ 1', NULL, '2023-01-06-63b8049619f46.png', 1, NULL, 0.00, 1, NULL, NULL, '118855'),
(19, 'admin', 1, 'Lắc tay 1', 'lac-tay-1-RWOdGi', 'physical', '[{\"id\":\"11\",\"position\":1}]', 7, 'kg', 1, 1, NULL, NULL, '[\"2023-01-06-63b804d88e541.png\",\"2023-01-06-63b804d88f700.png\"]', '2023-01-06-63b804d88fa3c.png', '1', NULL, 'youtube', NULL, '[\"#FAEBD7\"]', 0, 'null', '[]', '[{\"type\":\"AntiqueWhite\",\"price\":200000,\"sku\":\"Lt1-AntiqueWhite\",\"qty\":22}]', 0, 200000, 200000, '23', 'percent', '0', 'flat', 22, 1, NULL, 0, NULL, '2023-01-06 04:24:08', '2023-01-10 16:15:50', 1, 1, 'Lắc tay 1', NULL, '2023-01-06-63b804d88fe7f.png', 1, NULL, 0.00, 1, NULL, NULL, '183027'),
(20, 'admin', 1, 'Nhẫn 1', 'nhan-1-PzTy5V', 'physical', '[{\"id\":\"11\",\"position\":1}]', 5, 'kg', 1, 1, NULL, NULL, '[\"2023-01-06-63b805042c32d.png\",\"2023-01-06-63b805042d510.png\"]', '2023-01-06-63b805042d8b0.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 2000000, 2000000, '23', 'percent', '0', 'flat', 0, 1, NULL, 0, NULL, '2023-01-06 04:24:52', '2023-01-06 04:24:55', 1, 1, 'Nhẫn 1', NULL, '2023-01-06-63b805042dcd4.png', 1, NULL, 0.00, 1, NULL, NULL, '167715'),
(21, 'admin', 1, 'Áo Polo cổ be', 'ao-polo-co-be-AVFt0P', 'physical', '[{\"id\":\"7\",\"position\":1}]', 2, 'kg', 1, 1, NULL, NULL, '[\"2023-01-10-63bd7a689e2be.png\",\"2023-01-10-63bd7a689f5a6.png\"]', '2023-01-10-63bd7a689f9f6.png', '1', NULL, 'youtube', NULL, '[\"#7FFFD4\",\"#F0FFFF\",\"#F5F5DC\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"size\",\"options\":[\"X\",\"M\",\"XL\"]}]', '[{\"type\":\"Aquamarine-X\",\"price\":200000,\"sku\":null,\"qty\":21},{\"type\":\"Aquamarine-M\",\"price\":200000,\"sku\":null,\"qty\":3434},{\"type\":\"Aquamarine-XL\",\"price\":200000,\"sku\":null,\"qty\":23},{\"type\":\"Azure-X\",\"price\":200000,\"sku\":null,\"qty\":53},{\"type\":\"Azure-M\",\"price\":200000,\"sku\":null,\"qty\":123},{\"type\":\"Azure-XL\",\"price\":200000,\"sku\":null,\"qty\":23},{\"type\":\"Beige-X\",\"price\":200000,\"sku\":null,\"qty\":23},{\"type\":\"Beige-M\",\"price\":200000,\"sku\":null,\"qty\":34},{\"type\":\"Beige-XL\",\"price\":200000,\"sku\":null,\"qty\":32}]', 0, 200000, 200000, '20', 'percent', '0', 'flat', 3766, 1, NULL, 0, NULL, '2023-01-10 07:47:04', '2023-02-20 18:44:45', 1, 1, 'Áo Polo cổ be', NULL, '2023-01-10-63bd7a689fd69.png', 1, NULL, 0.00, 1, NULL, NULL, '133264'),
(22, 'admin', 1, 'Áo Vest 1', 'ao-vest-1-mrniBP', 'physical', '[{\"id\":\"8\",\"position\":1}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-01-10-63bd7cbbf27e4.png\",\"2023-01-10-63bd7cbbf3973.png\"]', '2023-01-10-63bd7cbbf3bfa.png', '0', NULL, 'youtube', NULL, '[\"#9966CC\",\"#00FFFF\",\"#F5F5DC\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"size\",\"options\":[\"X\",\"XL\"]}]', '[{\"type\":\"Amethyst-X\",\"price\":1200000,\"sku\":null,\"qty\":234},{\"type\":\"Amethyst-XL\",\"price\":1200000,\"sku\":null,\"qty\":543},{\"type\":\"Aqua-X\",\"price\":1200000,\"sku\":null,\"qty\":231},{\"type\":\"Aqua-XL\",\"price\":1200000,\"sku\":null,\"qty\":34},{\"type\":\"Beige-X\",\"price\":1200000,\"sku\":null,\"qty\":15},{\"type\":\"Beige-XL\",\"price\":1200000,\"sku\":null,\"qty\":23}]', 0, 1200000, 1200000, '15', 'percent', '0', 'flat', 1080, 1, NULL, 0, NULL, '2023-01-10 07:57:00', '2023-02-27 13:36:38', 0, 1, 'Áo Vest 1', NULL, '2023-01-10-63bd7cbc0025f.png', 1, NULL, 10000.00, 1, NULL, NULL, '175149'),
(23, 'admin', 1, 'Áo Vest 2', 'ao-vest-2-coyzd4', 'physical', '[{\"id\":\"8\",\"position\":1}]', 3, 'kg', 1, 1, NULL, NULL, '[\"2023-01-10-63bd7d547f241.png\",\"2023-01-10-63bd7d5480a0f.png\"]', '2023-01-10-63bd7d5480c86.png', '0', NULL, 'youtube', NULL, '[\"#9966CC\",\"#00FFFF\",\"#F0FFFF\",\"#FFEBCD\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"size\",\"options\":[\"M\",\"  X\",\"  XL\"]}]', '[{\"type\":\"Amethyst-M\",\"price\":2300000,\"sku\":null,\"qty\":23},{\"type\":\"Amethyst-X\",\"price\":2300000,\"sku\":null,\"qty\":34},{\"type\":\"Amethyst-XL\",\"price\":2300000,\"sku\":null,\"qty\":45},{\"type\":\"Aqua-M\",\"price\":2300000,\"sku\":null,\"qty\":122},{\"type\":\"Aqua-X\",\"price\":2300000,\"sku\":null,\"qty\":343},{\"type\":\"Aqua-XL\",\"price\":2300000,\"sku\":null,\"qty\":3553},{\"type\":\"Azure-M\",\"price\":2300000,\"sku\":null,\"qty\":23},{\"type\":\"Azure-X\",\"price\":2300000,\"sku\":null,\"qty\":3435},{\"type\":\"Azure-XL\",\"price\":2300000,\"sku\":null,\"qty\":233},{\"type\":\"BlanchedAlmond-M\",\"price\":2300000,\"sku\":null,\"qty\":343},{\"type\":\"BlanchedAlmond-X\",\"price\":2300000,\"sku\":null,\"qty\":23},{\"type\":\"BlanchedAlmond-XL\",\"price\":2300000,\"sku\":null,\"qty\":434}]', 0, 2300000, 2300000, '0', 'percent', '0', 'flat', 8611, 1, NULL, 0, NULL, '2023-01-10 07:59:32', '2023-03-02 22:06:30', 0, 1, 'Áo Vest 2', NULL, '2023-01-10-63bd7d548126b.png', 1, NULL, 25000.00, 1, NULL, NULL, '178052'),
(24, 'seller', 1, 'Áo Vest 1', 'ao-vest-1-VTTBmh', 'physical', '[{\"id\":\"8\",\"position\":1}]', 3, 'kg', 1, 1, NULL, NULL, '[\"2023-01-10-63bdf5ccc8376.png\",\"2023-01-10-63bdf5cce1326.png\",\"2023-01-10-63bdf5cce1577.png\"]', '2023-01-10-63bdf5cce1826.png', NULL, NULL, 'youtube', NULL, '[\"#9966CC\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"size\",\"options\":[\"X\"]}]', '[{\"type\":\"Amethyst-X\",\"price\":1400000,\"sku\":null,\"qty\":2313}]', 0, 1400000, 1400000, '2', 'percent', '0', 'flat', 2313, 1, NULL, 0, NULL, '2023-01-10 16:33:32', '2023-03-02 04:07:42', 1, 1, 'Áo Vest 1', NULL, '2023-01-10-63bdf5cce1b61.png', 1, NULL, 23.00, 1, NULL, NULL, '160179'),
(25, 'admin', 1, 'Áo Jacket siêu cấp', 'ao-jacket-sieu-cap-nH5v2z', 'physical', '[{\"id\":\"3\",\"position\":1}]', 7, 'kg', 1, 1, NULL, NULL, '[\"2023-01-31-63d91047041c8.png\",\"2023-01-31-63d91047218cd.png\"]', '2023-01-31-63d9104721b65.png', '1', NULL, 'youtube', NULL, '[\"#F0F8FF\",\"#FAEBD7\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"size\",\"options\":[\"X\",\"  M\",\"  L\"]}]', '[{\"type\":\"AliceBlue-X\",\"price\":390000,\"sku\":null,\"qty\":8},{\"type\":\"AliceBlue-M\",\"price\":390000,\"sku\":null,\"qty\":20},{\"type\":\"AliceBlue-L\",\"price\":390000,\"sku\":null,\"qty\":30},{\"type\":\"AntiqueWhite-X\",\"price\":390000,\"sku\":null,\"qty\":40},{\"type\":\"AntiqueWhite-M\",\"price\":390000,\"sku\":null,\"qty\":50},{\"type\":\"AntiqueWhite-L\",\"price\":390000,\"sku\":null,\"qty\":60}]', 0, 390000, 390000, '0', 'percent', '5', 'percent', 208, 1, '<p>&Aacute;o Jacket si&ecirc;u cấp&nbsp;</p>', 0, NULL, '2023-01-31 05:57:43', '2023-03-02 22:06:02', 1, 1, 'Áo Jacket siêu cấp', 'Áo Jacket siêu cấp', '2023-01-31-63d9104721df7.png', 1, NULL, 0.00, 0, NULL, NULL, '110833');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `refund_reason` longtext NOT NULL,
  `images` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_note` longtext DEFAULT NULL,
  `rejected_note` longtext DEFAULT NULL,
  `payment_info` longtext DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_statuses`
--

CREATE TABLE `refund_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `refund_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL,
  `change_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_transactions`
--

CREATE TABLE `refund_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_for` varchar(191) DEFAULT NULL,
  `payer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paid_by` varchar(191) DEFAULT NULL,
  `paid_to` varchar(191) DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `payment_status` varchar(191) DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `comment` mediumtext DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `is_saved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `customer_id`, `delivery_man_id`, `order_id`, `comment`, `attachment`, `rating`, `status`, `is_saved`, `created_at`, `updated_at`) VALUES
(1, 1, 4, NULL, NULL, 'Tốt', '[]', 5, 1, 0, '2023-01-06 00:59:59', '2023-03-02 21:12:02'),
(2, 23, 7, NULL, NULL, 'Quá tuyệt vời', '[]', 5, 1, 0, '2023-01-10 16:10:50', '2023-01-10 16:10:50'),
(3, 24, 10, NULL, NULL, 'Tốt', '[]', 3, 1, 0, '2023-03-02 20:58:48', '2023-03-02 20:58:48'),
(4, 24, 4, NULL, NULL, 'Tốt', '[]', 4, 1, 0, '2023-03-02 21:10:59', '2023-03-02 21:10:59');

-- --------------------------------------------------------

--
-- Table structure for table `search_functions`
--

CREATE TABLE `search_functions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(150) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `visible_for` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `search_functions`
--

INSERT INTO `search_functions` (`id`, `key`, `url`, `visible_for`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'admin/dashboard', 'admin', NULL, NULL),
(2, 'Order All', 'admin/orders/list/all', 'admin', NULL, NULL),
(3, 'Order Pending', 'admin/orders/list/pending', 'admin', NULL, NULL),
(4, 'Order Processed', 'admin/orders/list/processed', 'admin', NULL, NULL),
(5, 'Order Delivered', 'admin/orders/list/delivered', 'admin', NULL, NULL),
(6, 'Order Returned', 'admin/orders/list/returned', 'admin', NULL, NULL),
(7, 'Order Failed', 'admin/orders/list/failed', 'admin', NULL, NULL),
(8, 'Brand Add', 'admin/brand/add-new', 'admin', NULL, NULL),
(9, 'Brand List', 'admin/brand/list', 'admin', NULL, NULL),
(10, 'Banner', 'admin/banner/list', 'admin', NULL, NULL),
(11, 'Category', 'admin/category/view', 'admin', NULL, NULL),
(12, 'Sub Category', 'admin/category/sub-category/view', 'admin', NULL, NULL),
(13, 'Sub sub category', 'admin/category/sub-sub-category/view', 'admin', NULL, NULL),
(14, 'Attribute', 'admin/attribute/view', 'admin', NULL, NULL),
(15, 'Product', 'admin/product/list', 'admin', NULL, NULL),
(16, 'Coupon', 'admin/coupon/add-new', 'admin', NULL, NULL),
(17, 'Custom Role', 'admin/custom-role/create', 'admin', NULL, NULL),
(18, 'Employee', 'admin/employee/add-new', 'admin', NULL, NULL),
(19, 'Seller', 'admin/sellers/seller-list', 'admin', NULL, NULL),
(20, 'Contacts', 'admin/contact/list', 'admin', NULL, NULL),
(21, 'Flash Deal', 'admin/deal/flash', 'admin', NULL, NULL),
(22, 'Deal of the day', 'admin/deal/day', 'admin', NULL, NULL),
(23, 'Language', 'admin/business-settings/language', 'admin', NULL, NULL),
(24, 'Mail', 'admin/business-settings/mail', 'admin', NULL, NULL),
(25, 'Shipping method', 'admin/business-settings/shipping-method/add', 'admin', NULL, NULL),
(26, 'Currency', 'admin/currency/view', 'admin', NULL, NULL),
(27, 'Payment method', 'admin/business-settings/payment-method', 'admin', NULL, NULL),
(28, 'SMS Gateway', 'admin/business-settings/sms-gateway', 'admin', NULL, NULL),
(29, 'Support Ticket', 'admin/support-ticket/view', 'admin', NULL, NULL),
(30, 'FAQ', 'admin/helpTopic/list', 'admin', NULL, NULL),
(31, 'About Us', 'admin/business-settings/about-us', 'admin', NULL, NULL),
(32, 'Terms and Conditions', 'admin/business-settings/terms-condition', 'admin', NULL, NULL),
(33, 'Web Config', 'admin/business-settings/web-config', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(30) DEFAULT NULL,
  `l_name` varchar(30) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `password` varchar(80) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `branch` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `auth_token` text DEFAULT NULL,
  `sales_commission_percentage` double(8,2) DEFAULT NULL,
  `gst` varchar(191) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `pos_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `f_name`, `l_name`, `phone`, `image`, `email`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `branch`, `account_no`, `holder_name`, `auth_token`, `sales_commission_percentage`, `gst`, `cm_firebase_token`, `pos_status`) VALUES
(1, 'test', 'test', '0826138023', '2022-12-17-639d0c9f47668.png', 'linyleader@gmail.com', '$2y$10$.eMY6vRi0d3SHk2MCTB2aOpMov1kKXq4xVuPEO/P/q1KIWnc9Xz8S', 'approved', 'Vv5YJJUH1Dzo9D5Yu1DFXXj9klf6EsuDdBcql5xIWWpZtBywPAma98grnQXK', '2022-12-16 17:26:07', '2023-02-20 20:04:36', 'BIDV', 'Chi nhánh Hà Tây', '45010003667796', 'NGUYEN VAN AN', NULL, NULL, NULL, NULL, 1),
(2, 'Nam', 'Lê Phương', '1234567890', '2023-01-31-63d9120c0ad87.png', 'mevus@gmail.com', '$2y$10$F7cTKeTuTdmWj8ypo744vu5bAx1XyBJW12FZdilmfSVanXTpEHGzq', 'approved', 'Gi0SNcfxQKmfXrRPJcAQF4sctSF5rnSmSCVWQRx8MIIDeEGmg8f7sKsSBhid', '2023-01-31 06:05:16', '2023-01-31 06:06:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallets`
--

CREATE TABLE `seller_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `total_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_given` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `collected_cash` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_wallets`
--

INSERT INTO `seller_wallets` (`id`, `seller_id`, `total_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_given`, `pending_withdraw`, `delivery_charge_earned`, `collected_cash`, `total_tax_collected`) VALUES
(1, 1, 6849000, 1428000, '2022-12-16 17:26:07', '2023-03-02 21:10:44', 440000.00, -427000.01, 120000.00, 999999.99, 196000.00),
(2, 2, 0, 0, '2023-01-31 06:05:16', '2023-01-31 06:05:16', 0.00, 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet_histories`
--

CREATE TABLE `seller_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `contact_person_name` varchar(50) DEFAULT NULL,
  `address_type` varchar(20) NOT NULL DEFAULT 'home',
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `customer_id`, `contact_person_name`, `address_type`, `address`, `city`, `zip`, `phone`, `created_at`, `updated_at`, `state`, `country`, `latitude`, `longitude`, `is_billing`) VALUES
(1, '4', 'dwdwd', 'permanent', 'wdwedqwdqwdqw', 'Hanoi', '100000', '0826132234', '2022-12-15 10:26:58', '2022-12-15 10:26:58', NULL, 'Viet Nam', '', '', 0),
(2, '4', 'test test', 'Home', 'rere344', 'hanoi', '100000', '0826132234', '2022-12-16 17:22:33', '2022-12-16 17:22:33', NULL, 'Viet Nam', '0.0', '0.0', 1),
(3, '4', 'test test', 'Home', 'Vietnam', 'Hanoi', '100000', '0826132234', '2023-01-06 04:45:47', '2023-01-06 04:45:47', NULL, 'Viet Nam', '0.0', '0.0', 0),
(4, '5', 'an nguyen', 'Home', 'addasd', 'Hai Phong', '100000', '+840826138020', '2023-01-06 05:45:35', '2023-01-06 05:45:35', NULL, 'Viet Nam', '37.42342342342342', '-122.08395287867832', 0),
(5, '7', 'Nguyễn Văn An', 'home', 'Toi viet nam', 'Hanoi', '100000', '0826123123', '2023-01-10 16:08:21', '2023-01-10 16:08:21', NULL, 'Viet Nam', '', '', 0),
(6, '7', 'Nguyen Tuan', 'Home', 'hai phong', 'ha noi', '100000', '0826138234', '2023-01-10 16:35:27', '2023-01-10 16:35:27', NULL, 'Viet Nam', '37.42342342342342', '-122.08395287867832', 1),
(7, '4', 'test test', 'Home', 'Unknown Location Found', 'Hai Phong', '100000', '0826132234', '2023-02-15 22:23:28', '2023-02-15 22:23:28', NULL, 'Viet Nam', '20.971729524060084', '105.78024197369814', 0),
(8, '10', 'Nguyễn Văn An', 'permanent', 'SDU Tower, Trần Phú, làng Văn Quán, Văn Quán, Hà Đông, Hanoi, Vietnam', 'Hanoi', '100000', '0826132234', '2023-02-26 11:23:50', '2023-02-26 11:23:50', NULL, 'Viet Nam', '20.98123849084675', '105.78958891534461', 0),
(9, '12', 'Nguyễn Văn An', 'permanent', '132 P.Yên Lãng', 'Hanoi', '100000', '0826132234', '2023-02-27 13:59:12', '2023-02-27 13:59:12', NULL, 'Viet Nam', '21.009902789902444', '105.8151626586914', 0),
(10, '4', 'test test', 'Home', '7 Đ. Phùng Hưng, P. Văn Quán, Hà Đông, Hà Nội, Vietnam', 'Hà Nội', '100000', '0826132234', '2023-03-02 04:03:49', '2023-03-02 04:03:49', NULL, 'Viet Nam', '20.97297301893069', '105.78296273946762', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `creator_type` varchar(191) NOT NULL DEFAULT 'admin',
  `title` varchar(100) DEFAULT NULL,
  `cost` decimal(8,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `creator_id`, `creator_type`, `title`, `cost`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(9, 1, 'admin', 'Giao Hàng Tiết Kiệm', '10000.00', '10 đến 12 ngày', 1, '2023-02-15 13:27:50', '2023-02-15 13:27:50'),
(10, 1, 'admin', 'Giao Hàng Nhanh', '30000.00', '4 đến 6 ngày', 1, '2023-02-15 13:28:32', '2023-02-15 13:28:32'),
(11, 1, 'seller', 'Giao Hàng Tiết Kiệm', '10000.00', '10 đến 12 ngày', 1, '2023-02-20 20:04:03', '2023-02-20 20:04:03'),
(12, 1, 'seller', 'Giao Hàng Nhanh', '30000.00', '10 đến 12 ngày', 1, '2023-02-20 20:04:14', '2023-02-20 20:04:14');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_types`
--

CREATE TABLE `shipping_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_types`
--

INSERT INTO `shipping_types` (`id`, `seller_id`, `shipping_type`, `created_at`, `updated_at`) VALUES
(1, 0, 'order_wise', '2023-02-15 13:27:57', '2023-02-20 19:26:24');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `seller_id`, `name`, `address`, `contact`, `image`, `created_at`, `updated_at`, `banner`) VALUES
(1, 1, 'An Shop', '19/5 Hanoi', '0826138023', '2022-12-17-639d0c9f760f3.png', '2022-12-16 17:26:07', '2022-12-16 17:26:07', '2022-12-17-639d0c9f764a2.png'),
(2, 2, 'Muvees', 'số km10 Trần Phú Hà Đông', '1234567890', '2023-01-31-63d9120c18690.png', '2023-01-31 06:05:16', '2023-01-31 06:05:16', '2023-01-31-63d9120c188de.png');

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `active_status` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `name`, `link`, `icon`, `active_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 'twitter', '', 'fa fa-twitter', 0, 1, '2020-12-31 21:18:03', '2022-12-11 11:13:35'),
(2, 'linkedin', '', 'fa fa-linkedin', 0, 1, '2021-02-27 16:23:01', '2022-12-11 11:13:37'),
(3, 'google-plus', '', 'fa fa-google-plus-square', 0, 1, '2021-02-27 16:23:30', '2022-12-11 11:13:38'),
(4, 'pinterest', '', 'fa fa-pinterest', 0, 1, '2021-02-27 16:24:14', '2022-12-11 11:13:39'),
(5, 'instagram', 'https://www.instagram.com/jamesdev1507/', 'fa fa-instagram', 1, 1, '2021-02-27 16:24:36', '2023-02-20 19:53:44'),
(6, 'facebook', 'https://www.facebook.com/an.nguyenvan1507/', 'fa fa-facebook', 1, 1, '2021-02-27 19:19:42', '2023-02-20 20:08:57');

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `priority` varchar(15) NOT NULL DEFAULT 'low',
  `description` varchar(255) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `customer_id`, `subject`, `type`, `priority`, `description`, `reply`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 'Quần hỏng', 'Complaint', 'Medium', 'Tôi mua quần bị hỏng', NULL, 'open', '2023-01-06 00:58:31', '2023-01-06 00:58:31'),
(2, 4, 'Quần hỏng', 'Complaint', 'Medium', 'đâsdsadas', NULL, 'open', '2023-01-06 05:43:24', '2023-01-06 05:43:24'),
(3, 7, 'Quan ao bi hong', 'Complaint', 'low', 'cua hang gui cho toi quan ao bi hong', NULL, 'open', '2023-01-10 16:21:23', '2023-02-07 07:11:45'),
(4, 5, 'dccsc', 'Website Problem', 'low', 'dcdc', NULL, 'open', '2023-02-07 07:11:00', '2023-02-07 07:11:44'),
(5, 4, 'test', 'Website Problem', 'low', 'test', NULL, 'pending', '2023-03-02 04:22:40', '2023-03-02 04:22:40');

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_convs`
--

CREATE TABLE `support_ticket_convs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `customer_message` varchar(191) DEFAULT NULL,
  `admin_message` varchar(191) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_ticket_convs`
--

INSERT INTO `support_ticket_convs` (`id`, `support_ticket_id`, `admin_id`, `customer_message`, `admin_message`, `position`, `created_at`, `updated_at`) VALUES
(1, 3, 1, NULL, 'Ok toi hieu', 0, '2023-01-10 16:23:11', '2023-01-10 16:23:11'),
(2, 3, 1, 'toi can thay mot chiec moi', NULL, 0, '2023-01-10 16:23:39', '2023-01-10 16:23:39'),
(3, 4, 1, 'alo', NULL, 0, '2023-02-07 07:11:08', '2023-02-07 07:11:08'),
(4, 4, 1, NULL, 'dưqedqdqw', 0, '2023-02-07 07:11:50', '2023-02-07 07:11:50'),
(5, 4, 1, NULL, 'ffdfdfđf', 0, '2023-02-19 18:04:10', '2023-02-19 18:04:10'),
(6, 5, 1, NULL, 'nó như thế nào', 0, '2023-03-02 04:22:52', '2023-03-02 04:22:52'),
(7, 5, 1, 'lỗi nặn lắm', NULL, 0, '2023-03-02 04:23:03', '2023-03-02 04:23:03'),
(8, 5, 1, 'vậy sao', NULL, 0, '2023-03-02 04:23:20', '2023-03-02 04:23:20');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` varchar(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_for` varchar(100) DEFAULT NULL,
  `payer_id` bigint(20) DEFAULT NULL,
  `payment_receiver_id` bigint(20) DEFAULT NULL,
  `paid_by` varchar(15) DEFAULT NULL,
  `paid_to` varchar(15) DEFAULT NULL,
  `payment_method` varchar(15) DEFAULT NULL,
  `payment_status` varchar(10) NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `translationable_type` varchar(191) NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`translationable_type`, `translationable_id`, `locale`, `key`, `value`, `id`) VALUES
('App\\Model\\Product', 16, 'vn', 'name', 'Giày Da 1', 1),
('App\\Model\\Product', 16, 'fr', 'name', 'Giày Da 1', 2),
('App\\Model\\Product', 25, 'vn', 'name', 'Áo Jacket siêu cấp', 3),
('App\\Model\\Product', 25, 'vn', 'description', '<p>&Aacute;o Jacket si&ecirc;u cấp&nbsp;</p>', 4),
('App\\Model\\Product', 25, 'fr', 'name', 'Áo Jacket siêu cấp', 5),
('App\\Model\\Product', 25, 'fr', 'description', '<p>&Aacute;o Jacket si&ecirc;u cấp&nbsp;</p>', 6),
('App\\Model\\Product', 23, 'vn', 'name', 'Áo Vest 2', 7),
('App\\Model\\Product', 23, 'fr', 'name', 'Áo Vest 2', 8),
('App\\Model\\Product', 13, 'vn', 'name', 'Áo Vest 2', 9),
('App\\Model\\Product', 13, 'fr', 'name', 'Áo Vest 2', 10),
('App\\Model\\Product', 10, 'vn', 'name', 'Áo polo xanh', 11),
('App\\Model\\Product', 10, 'fr', 'name', 'Áo polo xanh', 12),
('App\\Model\\Product', 15, 'vn', 'name', 'Giày hồng siêu nữ tính', 13),
('App\\Model\\Product', 15, 'fr', 'name', 'Giày hồng siêu nữ tính', 14);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `phone` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `street_address` varchar(250) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `house_no` varchar(50) DEFAULT NULL,
  `apartment_no` varchar(50) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `payment_card_last_four` varchar(191) DEFAULT NULL,
  `payment_card_brand` varchar(191) DEFAULT NULL,
  `payment_card_fawry_token` text DEFAULT NULL,
  `login_medium` varchar(191) DEFAULT NULL,
  `social_id` varchar(191) DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `temporary_token` varchar(191) DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `wallet_balance` double(8,2) DEFAULT NULL,
  `loyalty_point` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `f_name`, `l_name`, `phone`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `street_address`, `country`, `city`, `zip`, `house_no`, `apartment_no`, `cm_firebase_token`, `is_active`, `payment_card_last_four`, `payment_card_brand`, `payment_card_fawry_token`, `login_medium`, `social_id`, `is_phone_verified`, `temporary_token`, `is_email_verified`, `wallet_balance`, `loyalty_point`) VALUES
(0, 'walking customer', 'walking', 'customer', '000000000000', 'def.png', 'walking@customer.com', NULL, '', NULL, NULL, '2022-02-03 03:46:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(2, NULL, 'test', 'test', '+840123456789', 'def.png', 'test@gmail.com', NULL, '$2y$10$7xTm8rAAhUmoZnMbvC4TWOvQ1.ZCWvMSM3MGSgnGs0zF3ZyeE07V6', NULL, '2022-12-11 14:16:21', '2022-12-11 14:16:21', NULL, NULL, NULL, NULL, NULL, NULL, 'ffmF6IoTTGWwkmF3tCiG0C:APA91bGOzQSFPBe4JXWhyLAa-fSY3RJXA1coUbnE5ceznqr4DradBX7B3KQeeSLXMGgdQgcYyM7x6JheYkcGNW7kyi7j4vOUX_J-7OGL-x2BEDTNKLpyNb_nefI-sBGXGlipowKj3L4b', 1, NULL, NULL, NULL, NULL, NULL, 0, '8RkZtfbyXkPPFfxxxwbD1cyK580EQe2VZkY2YukH', 0, NULL, NULL),
(3, NULL, 'test', 'test', '0826132345', 'def.png', 'test1@gmail.com', NULL, '$2y$10$ca7nE8UuBdsarfm7bVFJaeO4ET3pqe/lck9AgAA4CYv/DW1Qrb6bW', NULL, '2022-12-12 07:22:15', '2022-12-12 09:55:52', NULL, NULL, NULL, NULL, NULL, NULL, 'c-wSmDpzQByZBO9b_JhQVw:APA91bH3MtBmpUFJj-DAaPHMv_VRyuvqN9IbKMAD7kMMKonLxJi0RX7lz0pVQjgSWrRJR4sJqXpwy01AZO_FcbvzMjOwyAoAY-e6VuVyQ2M4M6ZNlaA6aEd2LMFSgKJ5q6o2It3n5bN1', 1, NULL, NULL, NULL, NULL, NULL, 0, 'isMdpFKXKcednbMNIS89AwfcUTR8IKD7y6EHjD5P', 0, NULL, NULL),
(4, NULL, 'test', 'test', '0826132234', '2022-12-15-639b645c12243.png', 'connectwithan1@gmail.com', NULL, '$2y$10$YC84DBZbRDmZfxMxXgOV8OFHqJ5Rq/MAY9uueHVVwaRDRhCPRDT0u', 'QncMsCQV7JZgYmYw7znWKipnGfpju0Th4jomSxBOSSUYEqgCv2y0Z4veX3cO', '2022-12-12 20:39:31', '2023-03-02 22:57:56', NULL, NULL, NULL, NULL, NULL, NULL, 'eQWxGdPPT0SyPrq35bpg1L:APA91bF3lzCmdIdfM7nds8wAZ9QBBNMdz4GhvgnbDz43Q1RoFMYPbmm6Me1kCbpPxjvNmn2thQLVekqW_lBkyMLUPKvf_mJ-8ld3RTsNm18Dy1Nuesj63R06vzpEi8VJAx39mj13pUtz', 1, NULL, NULL, NULL, NULL, NULL, 0, 'tftMgztMRFCmRr59U1IxTYmKmtESGi2kSRVhXUVC', 0, NULL, 571200.00),
(5, NULL, 'an', 'nguyen', '+840826138020', 'def.png', 'connectwithan@gmail.com', NULL, '$2y$10$Ko2IEgNP0hQi7FX1eW0./.8S0RrRqW9k4XpSj8Re8MJOp.2OI31bS', NULL, '2022-12-15 22:51:59', '2023-02-07 07:10:29', NULL, NULL, NULL, NULL, NULL, NULL, 'dlC2F2I1Q8O0_D6KVUfv8q:APA91bEa8bzteqLnvR9_sRDpjKhTEqs308yftKvNGFR21miN9qtJJaVIrGHp7EDdOdhk3b4Y5xIHr3jCYATDWw5Wt6veSm7HGNPSiP2ZCb8P_BSzGPzXPm22mcORsFfipJMMifSKJQGc', 1, NULL, NULL, NULL, NULL, NULL, 0, 'rSb76uauESwfXT7bHOahbDhSaojXJCfE1HmbshyG', 0, NULL, NULL),
(6, NULL, 'test', 'test', '0826138020', 'def.png', 'linyleader@gmail.com', NULL, '$2y$10$ERUvF8OiozaBoquOCduyDO53LtKjbBkn7H8Dxzn5IxkliUcpCkQFK', 'l2tDIOrQIq73L2SZBM8X4WcXYhsH9hhplKKkzejIafMIYld3joEYHlWDUyhN', '2022-12-16 17:23:22', '2022-12-16 17:23:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(7, NULL, 'Nguyen', 'Tuan', '0826138234', 'def.png', 'nguyentuan@gmail.com', NULL, '$2y$10$YIScvw34mvAkVHoRFBY1Cun4tcc8IpdhWGm34j4KbZwn7HyUOWHii', 'lAbme4lV4eV5mrZwQYoT2vTZGUxUufWtzxUKnczGQqxin8EvG9wd9uTKLiDy', '2023-01-10 08:01:21', '2023-01-10 16:14:46', NULL, NULL, NULL, NULL, NULL, NULL, 'dlC2F2I1Q8O0_D6KVUfv8q:APA91bEa8bzteqLnvR9_sRDpjKhTEqs308yftKvNGFR21miN9qtJJaVIrGHp7EDdOdhk3b4Y5xIHr3jCYATDWw5Wt6veSm7HGNPSiP2ZCb8P_BSzGPzXPm22mcORsFfipJMMifSKJQGc', 1, NULL, NULL, NULL, NULL, NULL, 0, '6GqPSAB8wF2c6RXyq9nZzS69EuV6P2hHJ9Gtj62F', 0, NULL, NULL),
(8, NULL, 'dinh', 'doan', '12345678', 'def.png', 'dtndinh2000@gmail.com', NULL, '$2y$10$ciMI94ptkwynmfLyxqyxO.0FwG1Dq2oBPmxdFjxVEpr5OdIt.x35q', 'aVBlpQVnDaHfRfC8FGoaWpSXB458Pw5kADOdpr3stPbASpqosDJQkRtG9IJG', '2023-02-01 10:33:06', '2023-02-01 10:33:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(10, NULL, 'Ejil', 'Fade', '', 'def.png', 'anguyenstr@gmail.com', NULL, '$2y$10$nT3NqDnARmDK8DkFJ1WwI.Rf2f4WI/n7DIQE8MGqnHfsZRFvqbJm6', 'TwKJU1ezuixPUJFGgxNG0DHnjnisHXZ6uRQTxi10AFJq5pBfmCnCVBCh9LYP', '2023-02-20 19:48:12', '2023-03-02 21:10:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'google', '106750503097511739459', 0, '7Lpvh9LrDk3ifpKhBEw3TxOKKXYth5RoULIVbmsh', 0, NULL, 182800.00),
(11, NULL, 'An', 'Dư', '', 'def.png', 'riotcocoro@gmail.com', NULL, '$2y$10$i1sFgSHdBEtSl.gh9ZyIZu16JCjBqg/dlTx22q8D8OjaL6mFaFOum', 'aAG7YrJq6Sel1qp394QPXjlKxb0WrHOLFxfLn8L4Ujxkyl7SuNUs3AokNaPb', '2023-02-27 13:52:44', '2023-02-27 13:52:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'google', '111868607169196117057', 0, 'tPZfJV0r1I7CCKO8dDpNo4evdCtRuagEY6H5mSaG', 0, NULL, NULL),
(12, NULL, 'EJiL', 'Fade', '', 'def.png', 'an.dzaivl@gmail.com', NULL, '$2y$10$M2HJN/wSI8lSUyLl7GnhB.MVGUeUsqzVmfJywDOQcOthWS9g3U86K', 'VKMu87yqfantcG3wg3wHFm0HHJgUnhTeK1kbXVeLXlXJ3gb8pFPmD2hL58gR', '2023-02-27 13:53:09', '2023-03-02 20:58:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'google', '117191714019144550124', 0, 'R4IWbavo2ibmVpzSFxO0zg4aFHeSz2PiYEWavgwJ', 0, NULL, 181800.00);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `transaction_type` varchar(191) DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `customer_id`, `product_id`, `created_at`, `updated_at`) VALUES
(3, 4, 15, '2023-02-14 08:59:54', '2023-02-14 08:59:54'),
(4, 4, 8, '2023-03-03 01:02:53', '2023-03-03 01:02:53');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` varchar(191) NOT NULL DEFAULT '0.00',
  `transaction_note` text DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_requests`
--

INSERT INTO `withdraw_requests` (`id`, `seller_id`, `delivery_man_id`, `admin_id`, `amount`, `transaction_note`, `approved`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, '1428000', NULL, 1, '2023-02-13 18:27:11', '2023-02-20 20:24:44'),
(2, 1, NULL, NULL, '1000', NULL, 0, '2023-02-20 20:34:50', '2023-02-20 20:34:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chattings`
--
ALTER TABLE `chattings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryman_notifications`
--
ALTER TABLE `deliveryman_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryman_wallets`
--
ALTER TABLE `deliveryman_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_country_codes`
--
ALTER TABLE `delivery_country_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man_transactions`
--
ALTER TABLE `delivery_man_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_zip_codes`
--
ALTER TABLE `delivery_zip_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_deals`
--
ALTER TABLE `feature_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_topics`
--
ALTER TABLE `help_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_expected_delivery_histories`
--
ALTER TABLE `order_expected_delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status_histories`
--
ALTER TABLE `order_status_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`identity`);

--
-- Indexes for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_functions`
--
ALTER TABLE `search_functions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`);

--
-- Indexes for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_types`
--
ALTER TABLE `shipping_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD UNIQUE KEY `transactions_id_unique` (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `chattings`
--
ALTER TABLE `chattings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveryman_notifications`
--
ALTER TABLE `deliveryman_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveryman_wallets`
--
ALTER TABLE `deliveryman_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_country_codes`
--
ALTER TABLE `delivery_country_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_man_transactions`
--
ALTER TABLE `delivery_man_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_zip_codes`
--
ALTER TABLE `delivery_zip_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_deals`
--
ALTER TABLE `feature_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `help_topics`
--
ALTER TABLE `help_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100039;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `order_expected_delivery_histories`
--
ALTER TABLE `order_expected_delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status_histories`
--
ALTER TABLE `order_status_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `search_functions`
--
ALTER TABLE `search_functions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `shipping_types`
--
ALTER TABLE `shipping_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
