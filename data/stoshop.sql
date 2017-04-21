-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-04-06 03:31:41
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stoshop`
--

-- --------------------------------------------------------

--
-- 表的结构 `combo`
--

CREATE TABLE `combo` (
  `combo_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `price` int(10) NOT NULL DEFAULT '0',
  `product_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `combo`
--

INSERT INTO `combo` (`combo_id`, `title`, `price`, `product_id`) VALUES
(1, '456', 100, 1);

-- --------------------------------------------------------

--
-- 表的结构 `combo_goods`
--

CREATE TABLE `combo_goods` (
  `combo_goods_id` int(11) UNSIGNED NOT NULL,
  `num` int(5) NOT NULL,
  `erp_id` int(8) NOT NULL DEFAULT '0',
  `combo_id` int(8) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `combo_goods`
--

INSERT INTO `combo_goods` (`combo_goods_id`, `num`, `erp_id`, `combo_id`, `title`) VALUES
(1, 5, 245, 1, '55');

-- --------------------------------------------------------

--
-- 表的结构 `order`
--

CREATE TABLE `order` (
  `order_id` int(11) UNSIGNED NOT NULL,
  `order_no` char(32) NOT NULL DEFAULT '',
  `erp_no` char(32) DEFAULT NULL,
  `order_status` char(20) NOT NULL DEFAULT 'NOT_PAID',
  `product_id` int(8) NOT NULL DEFAULT '0',
  `num` int(8) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `name` char(11) NOT NULL DEFAULT '',
  `last_name` char(11) DEFAULT NULL,
  `email` char(20) NOT NULL DEFAULT '',
  `mobile` char(20) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `order_msg` varchar(255) DEFAULT '',
  `payment_amount` int(10) NOT NULL DEFAULT '0',
  `erp_status` char(20) NOT NULL DEFAULT 'SUCCESS',
  `pay_type` char(20) DEFAULT '',
  `add_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` char(20) NOT NULL DEFAULT '0.0.0.0',
  `aid` int(8) NOT NULL DEFAULT '0',
  `post_erp_data` text,
  `post_erp_msg` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `order`
--

INSERT INTO `order` (`order_id`, `order_no`, `erp_no`, `order_status`, `product_id`, `num`, `title`, `name`, `last_name`, `email`, `mobile`, `address`, `order_msg`, `payment_amount`, `erp_status`, `pay_type`, `add_time`, `ip`, `aid`, `post_erp_data`, `post_erp_msg`) VALUES
(1, 'G314833437907008', '1170314052619149', 'NOT_PAID', 1, 1, '日本UV紫外線綿の帽子', '井上', '', '785@qq.com', '0901234567', '台灣   三重県785785', '下单未付款', 100, 'SUCCESS', '货到付款', '2017-03-14 09:22:23', '127.0.0.1', 1, '{"key":"ae1b5d75b02b71ceca917274245a1de8","web_url":"www.lkonq.com","first_name":"井上","last_name":null,"tel":"0901234567","email":"785@qq.com","address":"三重県785785","remark":"785","zipcode":"75","country":"中国","province":"台灣","city":"","area":"","products":[{"id_product":"245","product_title":"55","sale_title":"55","price":"0.00","price_title":"￥0.00","qty":5,"attrs":[]}],"id_zone":"1","id_department":"1","id_users":"9","identify":"9","grand_total":1,"currency_code":"RMB","date_purchase":"2017-03-14 17:22:23","payment_method":0,"payment_status":"processing","payment_details":"","created_at":"2017-03-14 17:22:23","ip":"127.0.0.1","user_agent":"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36","number":"1","expends":[]}', NULL),
(2, 'G317437896849343', '1170317054719380', 'NOT_PAID', 9, 3, '2016秋冬爆款加羊絨牛皮靴44', '陈嘉就', '', '111@qq.com', '08540065454554', '台灣   哈哈哈哈或', '下单未付款', 476400, 'SUCCESS', '货到付款', '2017-03-17 09:43:09', '127.0.0.1', 1, '{"key":"3f3477925f99f904c8aeb0173f022f71","web_url":"www.lkonq.com","first_name":"陈嘉就","last_name":null,"tel":"08540065454554","email":"111@qq.com","address":"哈哈哈哈或","remark":"0866454544","zipcode":"521021","country":"中国","province":"台灣","city":"","area":"","products":[{"id_product":"877","product_title":"2016秋冬爆款加羊絨牛皮靴44","sale_title":"2016秋冬爆款加羊絨牛皮靴44","price":4764,"price_title":"￥4764","qty":"3","attrs":["4134","4138"]}],"id_zone":"1","id_department":"1","id_users":"9","identify":"9","grand_total":4764,"currency_code":"RMB","date_purchase":"2017-03-17 17:43:09","payment_method":0,"payment_status":"processing","payment_details":"","created_at":"2017-03-17 17:43:09","ip":"127.0.0.1","user_agent":"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36","number":"3","expends":[]}', NULL),
(3, 'G322742065794674', '1170322052112183', 'NOT_PAID', 14, 1, '駝背塑形矯正帶', '张三', '', '111@qq.com', '08540065454554', '台灣   11', '下单未付款', 108800, 'SUCCESS', '货到付款', '2017-03-22 09:16:46', '127.0.0.1', 1, '{"key":"6dfa8e1bb2ea190532ac7bc4b4531155","web_url":"www.lkonq.com","first_name":"张三","last_name":null,"tel":"08540065454554","email":"111@qq.com","address":"11","remark":"","zipcode":null,"country":"中国","province":"台灣","city":"","area":"","products":[{"id_product":"879","product_title":"駝背塑形矯正帶","sale_title":"駝背塑形矯正帶","price":1088,"price_title":"￥1088","qty":"1","attrs":["4145"]}],"id_zone":"1","id_department":"1","id_users":"1","identify":"1","grand_total":1088,"currency_code":"RMB","date_purchase":"2017-03-22 17:16:46","payment_method":0,"payment_status":"processing","payment_details":"","created_at":"2017-03-22 17:16:46","ip":"127.0.0.1","user_agent":"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36","number":"1","expends":[]}', NULL),
(4, 'G324264020022286', '1170324113757452', 'NOT_PAID', 17, 1, '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '张三', '', '111@qq.com', '08540065454554', '台灣   11111111111', '下单未付款', 158800, 'SUCCESS', '货到付款', '2017-03-24 03:33:22', '127.0.0.1', 6, '{"key":"94c884afbd178c037c137bd1ab921bea","web_url":"www.lkonq.com","first_name":"张三","last_name":null,"tel":"08540065454554","email":"111@qq.com","address":"11111111111","remark":"","zipcode":"1111111111","country":"中国","province":"台灣","city":"","area":"","products":[{"id_product":"273","product_title":"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌","sale_title":"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌","price":1588,"price_title":"￥1588","qty":"1","attrs":["8455","8450"]}],"id_zone":"1","id_department":"1","id_users":"1","identify":"1","grand_total":1588,"currency_code":"RMB","date_purchase":"2017-03-24 11:33:22","payment_method":0,"payment_status":"processing","payment_details":"","created_at":"2017-03-24 11:33:22","ip":"127.0.0.1","user_agent":"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36","number":"1","expends":[]}', NULL),
(5, 'G324264592512212', '1170324113854437', 'NOT_PAID', 17, 1, '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '张三', '', '111@qq.com', '08540065454554', '台灣   11111111111', '下单未付款', 158800, 'SUCCESS', '货到付款', '2017-03-24 03:34:19', '127.0.0.1', 6, '{"key":"8b6a0eb637c0a95cb3322e7a1bb5f176","web_url":"www.lkonq.com","first_name":"张三","last_name":null,"tel":"08540065454554","email":"111@qq.com","address":"11111111111","remark":"","zipcode":"1111111111","country":"中国","province":"台灣","city":"","area":"","products":[{"id_product":"273","product_title":"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌","sale_title":"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌","price":1588,"price_title":"￥1588","qty":"1","attrs":["8455","8450"]}],"id_zone":"1","id_department":"1","id_users":"1","identify":"1","grand_total":1588,"currency_code":"RMB","date_purchase":"2017-03-24 11:34:19","payment_method":0,"payment_status":"processing","payment_details":"","created_at":"2017-03-24 11:34:19","ip":"127.0.0.1","user_agent":"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36","number":"1","expends":[]}', NULL),
(6, 'G324266947102285', '1170324114249699', 'NOT_PAID', 17, 1, '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '张三', '', '111@qq.com', '08540065454554', '台灣   11111111111', '下单未付款', 158800, 'SUCCESS', '货到付款', '2017-03-24 03:38:14', '127.0.0.1', 6, '{"key":"90a50ecbccb5e47135dcb05ac1b55daf","web_url":"www.lkonq.com","first_name":"张三","last_name":null,"tel":"08540065454554","email":"111@qq.com","address":"11111111111","remark":"","zipcode":"1111111111","country":"中国","province":"台灣","city":"","area":"","products":[{"id_product":"273","product_title":"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌","sale_title":"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌","price":1588,"price_title":"￥1588","qty":"1","attrs":["8455","8450"]}],"id_zone":"1","id_department":"1","id_users":"1","identify":"1","grand_total":1588,"currency_code":"RMB","date_purchase":"2017-03-24 11:38:14","payment_method":0,"payment_status":"processing","payment_details":"","created_at":"2017-03-24 11:38:14","ip":"127.0.0.1","user_agent":"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36","number":"1","expends":[]}', NULL),
(7, 'G324267773042210', '1170324114412188', 'NOT_PAID', 17, 1, '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '张三', '', '111@qq.com', '08540065454554', '台灣   11111111111', '下单未付款', 158800, 'SUCCESS', '货到付款', '2017-03-24 03:39:37', '127.0.0.1', 6, '{"key":"cd554bd9b5154f71ace449e47b09c983","web_url":"www.lkonq.com","first_name":"张三","last_name":null,"tel":"08540065454554","email":"111@qq.com","address":"11111111111","remark":"","zipcode":"1111111111","country":"中国","province":"台灣","city":"","area":"","products":[{"id_product":"273","product_title":"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌","sale_title":"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌","price":1588,"price_title":"￥1588","qty":"1","attrs":["8455","8450"]}],"id_zone":"1","id_department":"1","id_users":"1","identify":"1","grand_total":1588,"currency_code":"RMB","date_purchase":"2017-03-24 11:39:37","payment_method":0,"payment_status":"processing","payment_details":"","created_at":"2017-03-24 11:39:37","ip":"127.0.0.1","user_agent":"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36","number":"1","expends":[]}', NULL),
(8, 'G324270524272231', '1170324114847837', 'NOT_PAID', 17, 1, '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '张三', '', '111@qq.com', '08540065454554', '台灣   11111111111', '下单未付款', 158800, 'SUCCESS', '货到付款', '2017-03-24 03:44:12', '127.0.0.1', 6, '{"key":"661c12432647f87a74e53f33c0e207a5","web_url":"www.lkonq.com","first_name":"张三","last_name":null,"tel":"08540065454554","email":"111@qq.com","address":"11111111111","remark":"","zipcode":"1111111111","country":"中国","province":"台灣","city":"","area":"","products":[{"id_product":"273","product_title":"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌","sale_title":"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌","price":1588,"price_title":"￥1588","qty":"1","attrs":["8455","8450"]}],"id_zone":"1","id_department":"1","id_users":"1","identify":"1","grand_total":1588,"currency_code":"RMB","date_purchase":"2017-03-24 11:44:12","payment_method":0,"payment_status":"processing","payment_details":"","created_at":"2017-03-24 11:44:12","ip":"127.0.0.1","user_agent":"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36","number":"1","expends":[]}', NULL),
(9, 'G324270636592219', '1170324114858390', 'NOT_PAID', 17, 1, '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '张三', '', '111@qq.com', '08540065454554', '台灣   11111111111', '下单未付款', 158800, 'SUCCESS', '货到付款', '2017-03-24 03:44:23', '127.0.0.1', 6, '{"key":"587e7115b69785a0e5aea5a5fa194ead","web_url":"www.lkonq.com","first_name":"张三","last_name":null,"tel":"08540065454554","email":"111@qq.com","address":"11111111111","remark":"","zipcode":"1111111111","country":"中国","province":"台灣","city":"","area":"","products":[{"id_product":"273","product_title":"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌","sale_title":"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌","price":1588,"price_title":"￥1588","qty":"1","attrs":["8455","8450"]}],"id_zone":"1","id_department":"1","id_users":"1","identify":"1","grand_total":1588,"currency_code":"RMB","date_purchase":"2017-03-24 11:44:23","payment_method":0,"payment_status":"processing","payment_details":"","created_at":"2017-03-24 11:44:23","ip":"127.0.0.1","user_agent":"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36","number":"1","expends":[]}', NULL),
(10, 'G324275243522239', '1170324115639844', 'NOT_PAID', 17, 1, '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '张三', '', '111@qq.com', '08540065454554', '台灣   11111111111', '下单未付款', 158800, 'SUCCESS', '货到付款', '2017-03-24 03:52:04', '127.0.0.1', 6, '{"key":"f278aea97145f89b651f50c6cc0f2562","web_url":"www.lkonq.com","first_name":"张三","last_name":null,"tel":"08540065454554","email":"111@qq.com","address":"11111111111","remark":"","zipcode":"1111111111","country":"中国","province":"台灣","city":"","area":"","products":[{"id_product":"273","product_title":"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌","sale_title":"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌","price":1588,"price_title":"￥1588","qty":"1","attrs":["8455","8450"]}],"id_zone":"1","id_department":"1","id_users":"1","identify":"1","grand_total":1588,"currency_code":"RMB","date_purchase":"2017-03-24 11:52:04","payment_method":0,"payment_status":"processing","payment_details":"","created_at":"2017-03-24 11:52:04","ip":"127.0.0.1","user_agent":"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36","number":"1","expends":[]}', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `order_goods`
--

CREATE TABLE `order_goods` (
  `order_goods_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `num` int(8) NOT NULL DEFAULT '0',
  `price` int(10) NOT NULL DEFAULT '0',
  `total` int(10) NOT NULL DEFAULT '0',
  `order_id` int(8) NOT NULL DEFAULT '0',
  `erp_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `order_goods`
--

INSERT INTO `order_goods` (`order_goods_id`, `title`, `num`, `price`, `total`, `order_id`, `erp_id`) VALUES
(1, '55', 1, 0, 0, 1, 245),
(2, '2016秋冬爆款加羊絨牛皮靴44', 3, 476400, 1429200, 2, 877),
(3, '駝背塑形矯正帶', 1, 108800, 108800, 3, 879),
(4, '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', 1, 158800, 158800, 4, 273),
(5, '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', 1, 158800, 158800, 5, 273),
(6, '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', 1, 158800, 158800, 6, 273),
(7, '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', 1, 158800, 158800, 7, 273),
(8, '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', 1, 158800, 158800, 8, 273),
(9, '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', 1, 158800, 158800, 9, 273),
(10, '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', 1, 158800, 158800, 10, 273);

-- --------------------------------------------------------

--
-- 表的结构 `order_goods_attr`
--

CREATE TABLE `order_goods_attr` (
  `order_goods_attr_id` int(11) UNSIGNED NOT NULL,
  `order_goods_id` int(8) NOT NULL,
  `product_attr_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `order_goods_attr`
--

INSERT INTO `order_goods_attr` (`order_goods_attr_id`, `order_goods_id`, `product_attr_id`) VALUES
(1, 2, 59),
(2, 2, 63),
(3, 3, 86),
(4, 4, 102),
(5, 4, 114),
(6, 5, 102),
(7, 5, 114),
(8, 6, 102),
(9, 6, 114),
(10, 7, 102),
(11, 7, 114),
(12, 8, 102),
(13, 8, 114),
(14, 9, 102),
(15, 9, 114),
(16, 10, 102),
(17, 10, 114);

-- --------------------------------------------------------

--
-- 表的结构 `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) UNSIGNED NOT NULL,
  `code` char(20) NOT NULL DEFAULT '',
  `account` varchar(255) NOT NULL DEFAULT '',
  `key` char(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `payment`
--

INSERT INTO `payment` (`payment_id`, `code`, `account`, `key`) VALUES
(1, 'yjf', '20160825020000752433', '05a29a66557ad2f3634534a940d3577c');

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE `product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `title` char(100) NOT NULL DEFAULT '',
  `seo_title` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `price` int(10) NOT NULL,
  `market_price` int(10) DEFAULT '0',
  `add_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  `domain` char(50) NOT NULL DEFAULT '',
  `currency` char(20) NOT NULL DEFAULT '',
  `currency_prefix` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 前置 0 后置',
  `currency_code` char(10) NOT NULL,
  `discount` int(8) NOT NULL DEFAULT '0',
  `sales` int(8) NOT NULL DEFAULT '0',
  `stock` int(8) NOT NULL DEFAULT '0',
  `thumb` varchar(255) DEFAULT '',
  `theme` char(50) NOT NULL DEFAULT '',
  `lang` char(20) NOT NULL DEFAULT '',
  `payment_online` tinyint(1) DEFAULT '0' COMMENT '1 线上 0 否',
  `payment_underline` tinyint(1) DEFAULT '0' COMMENT '1线下 0否',
  `erp_number` char(50) NOT NULL DEFAULT '',
  `ad_member_id` int(8) NOT NULL DEFAULT '0' COMMENT '广告手id',
  `id_zone` int(8) NOT NULL DEFAULT '0',
  `id_department` int(8) NOT NULL DEFAULT '0',
  `la` text,
  `fb_px` char(30) DEFAULT '0',
  `aid` int(8) NOT NULL DEFAULT '0',
  `logo` varchar(255) DEFAULT '',
  `service_contact_id` int(10) DEFAULT '0',
  `service_email` char(30) DEFAULT NULL,
  `identity_tag` varchar(30) DEFAULT '',
  `google_js` text CHARACTER SET utf8 COLLATE utf8_bin,
  `yahoo_js` text CHARACTER SET utf8 COLLATE utf8_bin,
  `yahoo_js_trigger` text CHARACTER SET utf8 COLLATE utf8_bin,
  `tips` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`product_id`, `title`, `seo_title`, `seo_description`, `content`, `price`, `market_price`, `add_time`, `is_del`, `domain`, `currency`, `currency_prefix`, `currency_code`, `discount`, `sales`, `stock`, `thumb`, `theme`, `lang`, `payment_online`, `payment_underline`, `erp_number`, `ad_member_id`, `id_zone`, `id_department`, `la`, `fb_px`, `aid`, `logo`, `service_contact_id`, `service_email`, `identity_tag`, `google_js`, `yahoo_js`, `yahoo_js_trigger`, `tips`) VALUES
(1, '日本UV紫外線綿の帽子', '日本UV紫外線綿の帽子', '日本UV紫外線綿の帽子', '<p>2</p>', 129900, 129900, '2017-03-14 01:05:06', 0, 'www.lkonq.com', 'RMB', 1, '￥', 0, 1000, 100, '', 'wnczxzd.com(jp)', 'TW', 1, 1, '5811', 9, 1, 1, '                                                 <script language="javascript" type="text/javascript" src="http://js.users.51.la/19042546.js"></script><noscript><a href="http://www.51.la/?19042546" target="_blank"><img alt="我要啦免费统计" src="http://img.users.51.la/19042546.asp" style="border:none" /></a></noscript>                                                   ', '2', 1, '', 0, 'Bello@lkonq.com', 'aaa', '                                                 <script type="text/javascript">\nvar google_conversion_id = 860326848;\nvar google_conversion_language = "en";\nvar google_conversion_format = "3";\nvar google_conversion_color = "ffffff";\nvar google_conversion_label = "EgDxCPig224QwJeemgM";\nvar google_remarketing_only = false;\n</script><script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script><noscript><div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/860326848/?label=EgDxCPig224QwJeemgM&guid=ON&script=0"/></div></noscript>                                                  ', NULL, NULL, ''),
(2, '崙威堡爾品牌 夏日上新 專櫃驗貨 真皮男包 有型有範兒 防水耐磨', '崙威堡爾品牌 夏日上新 專櫃驗貨 真皮男包 有型有範兒 防水耐磨', '崙威堡爾品牌 夏日上新 專櫃驗貨 真皮男包 有型有範兒 防水耐磨', '', 158890, 158800, '2017-03-16 02:35:02', 0, 'www.lkonq.com', 'RMB', 1, '￥', 0, 1000, 100, '', 'Black(EN)', 'TW', NULL, NULL, '268', 1, 1, 1, '     <script language="javascript" type="text/javascript" src="http://js.users.51.la/19042546.js"></script><noscript><a href="http://www.51.la/?19042546" target="_blank"><img alt="我要啦免费统计" src="http://img.users.51.la/19042546.asp" style="border:none" /></a></noscript>       ', '2', 1, '', 0, 'Bello@lkonq.com', '', '     <script type="text/javascript">\r\nvar google_conversion_id = 860326848;\r\nvar google_conversion_language = "en";\r\nvar google_conversion_format = "3";\r\nvar google_conversion_color = "ffffff";\r\nvar google_conversion_label = "EgDxCPig224QwJeemgM";\r\nvar google_remarketing_only = false;\r\n</script><script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script><noscript><div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/860326848/?label=EgDxCPig224QwJeemgM&guid=ON&script=0"/></div></noscript>      ', NULL, NULL, ''),
(3, 'DT-B650智能魔盒自拍神器手機迷你藍牙音箱', 'DT-B650智能魔盒自拍神器手機迷你藍牙音箱', 'DT-B650智能魔盒自拍神器手機迷你藍牙音箱', '', 138800, 138800, '2017-03-16 02:37:47', 0, 'www.lkonq.com', 'RMB', 1, '￥', 0, 1000, 100, '', 'Black(EN)', 'TW', NULL, NULL, '298', 1, 1, 1, '   <script language="javascript" type="text/javascript" src="http://js.users.51.la/19042546.js"></script><noscript><a href="http://www.51.la/?19042546" target="_blank"><img alt="我要啦免费统计" src="http://img.users.51.la/19042546.asp" style="border:none" /></a></noscript>     ', '2', 1, '', 0, 'Bello@lkonq.com', '544', '   <script type="text/javascript">\r\nvar google_conversion_id = 860326848;\r\nvar google_conversion_language = "en";\r\nvar google_conversion_format = "3";\r\nvar google_conversion_color = "ffffff";\r\nvar google_conversion_label = "EgDxCPig224QwJeemgM";\r\nvar google_remarketing_only = false;\r\n</script><script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script><noscript><div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/860326848/?label=EgDxCPig224QwJeemgM&guid=ON&script=0"/></div></noscript>    ', NULL, NULL, ''),
(4, '特威斯Tevise全自動防水鏤空機械男士腕錶', '特威斯Tevise全自動防水鏤空機械男士腕錶', '特威斯Tevise全自動防水鏤空機械男士腕錶', '', 158800, 158800, '2017-03-16 02:39:39', 0, 'www.lkonq.com', '', 0, '', 0, 1000, 100, '', 'Black(EN)', 'TW', NULL, NULL, '267', 0, 0, 1, '     <script language="javascript" type="text/javascript" src="http://js.users.51.la/19042546.js"></script><noscript><a href="http://www.51.la/?19042546" target="_blank"><img alt="我要啦免费统计" src="http://img.users.51.la/19042546.asp" style="border:none" /></a></noscript>       ', '2', 1, '', 0, 'Bello@lkonq.com', 'jjj', '     <script type="text/javascript">\r\nvar google_conversion_id = 860326848;\r\nvar google_conversion_language = "en";\r\nvar google_conversion_format = "3";\r\nvar google_conversion_color = "ffffff";\r\nvar google_conversion_label = "EgDxCPig224QwJeemgM";\r\nvar google_remarketing_only = false;\r\n</script><script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script><noscript><div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/860326848/?label=EgDxCPig224QwJeemgM&guid=ON&script=0"/></div></noscript>      ', NULL, NULL, ''),
(5, 'Charles Keith時尚真皮爆款女包', 'Charles Keith時尚真皮爆款女包', 'Charles Keith時尚真皮爆款女包', '', 158800, 158800, '2017-03-16 02:53:36', 0, 'www.lkonq.com', 'RMB', 1, '￥', 0, 1000, 100, '', 'style6', 'TW', NULL, NULL, '297', 1, 1, 1, '   <script language="javascript" type="text/javascript" src="http://js.users.51.la/19042546.js"></script><noscript><a href="http://www.51.la/?19042546" target="_blank"><img alt="我要啦免费统计" src="http://img.users.51.la/19042546.asp" style="border:none" /></a></noscript>     ', '2', 1, '', 0, 'Bello@lkonq.com', '888', '   <script type="text/javascript">\r\nvar google_conversion_id = 860326848;\r\nvar google_conversion_language = "en";\r\nvar google_conversion_format = "3";\r\nvar google_conversion_color = "ffffff";\r\nvar google_conversion_label = "EgDxCPig224QwJeemgM";\r\nvar google_remarketing_only = false;\r\n</script><script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script><noscript><div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/860326848/?label=EgDxCPig224QwJeemgM&guid=ON&script=0"/></div></noscript>    ', NULL, NULL, ''),
(6, '2016新款歐美大牌復古菱格單肩包', '2016新款歐美大牌復古菱格單肩包', '2016新款歐美大牌復古菱格單肩包', '', 158800, 158800, '2017-03-16 02:57:09', 0, 'www.lkonq.com', 'RMB', 1, '￥', 0, 1000, 100, '', 'style6', 'TW', NULL, 1, '333', 1, 1, 1, '   <script language="javascript" type="text/javascript" src="http://js.users.51.la/19042546.js"></script><noscript><a href="http://www.51.la/?19042546" target="_blank"><img alt="我要啦免费统计" src="http://img.users.51.la/19042546.asp" style="border:none" /></a></noscript>     ', '2', 1, '', 0, 'Bello@lkonq.com', 'aaa', '   <script type="text/javascript">\r\nvar google_conversion_id = 860326848;\r\nvar google_conversion_language = "en";\r\nvar google_conversion_format = "3";\r\nvar google_conversion_color = "ffffff";\r\nvar google_conversion_label = "EgDxCPig224QwJeemgM";\r\nvar google_remarketing_only = false;\r\n</script><script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script><noscript><div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/860326848/?label=EgDxCPig224QwJeemgM&guid=ON&script=0"/></div></noscript>    ', NULL, NULL, ''),
(7, '雙爾健男女通用懶人自動回彈式靜音雙巨輪健腹輪', '雙爾健男女通用懶人自動回彈式靜音雙巨輪健腹輪', '雙爾健男女通用懶人自動回彈式靜音雙巨輪健腹輪', '', 138000, 138000, '2017-03-16 03:18:06', 0, 'www.lkonq.com', 'RMB', 1, '￥', 0, 1000, 100, '', 'style7', 'TW', NULL, NULL, '789', 1, 1, 1, '     <script language="javascript" type="text/javascript" src="http://js.users.51.la/19042546.js"></script><noscript><a href="http://www.51.la/?19042546" target="_blank"><img alt="我要啦免费统计" src="http://img.users.51.la/19042546.asp" style="border:none" /></a></noscript>       ', '2', 1, '', 0, 'Bello@lkonq.com', 'klk', '     <script type="text/javascript">\r\nvar google_conversion_id = 860326848;\r\nvar google_conversion_language = "en";\r\nvar google_conversion_format = "3";\r\nvar google_conversion_color = "ffffff";\r\nvar google_conversion_label = "EgDxCPig224QwJeemgM";\r\nvar google_remarketing_only = false;\r\n</script><script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script><noscript><div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/860326848/?label=EgDxCPig224QwJeemgM&guid=ON&script=0"/></div></noscript>      ', NULL, NULL, ''),
(8, 'DREAL止鼾戒指', 'DREAL止鼾戒指', 'DREAL止鼾戒指', '', 169900, 169900, '2017-03-16 03:39:10', 0, 'www.lkonq.com', 'RMB', 1, '￥', 0, 1000, 100, '', 'style5+timer', 'TW', NULL, NULL, '465', 1, 1, 1, '     <script language="javascript" type="text/javascript" src="http://js.users.51.la/19042546.js"></script><noscript><a href="http://www.51.la/?19042546" target="_blank"><img alt="我要啦免费统计" src="http://img.users.51.la/19042546.asp" style="border:none" /></a></noscript>       ', '2', 1, '', 0, 'Bello@lkonq.com', 'rrr', '     <script type="text/javascript">\r\nvar google_conversion_id = 860326848;\r\nvar google_conversion_language = "en";\r\nvar google_conversion_format = "3";\r\nvar google_conversion_color = "ffffff";\r\nvar google_conversion_label = "EgDxCPig224QwJeemgM";\r\nvar google_remarketing_only = false;\r\n</script><script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script><noscript><div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/860326848/?label=EgDxCPig224QwJeemgM&guid=ON&script=0"/></div></noscript>      ', NULL, NULL, ''),
(9, '2016秋冬爆款加羊絨牛皮靴44', '2016秋冬爆款加羊絨牛皮靴44', '2016秋冬爆款加羊絨牛皮靴444', '', 158800, 158800, '2017-03-16 04:27:30', 0, 'www.lkonq.com', 'RMB', 1, '￥', 0, 1000, 100, '', 'style6', 'TW', NULL, NULL, '877', 9, 1, 1, '                               <script language="javascript" type="text/javascript" src="http://js.users.51.la/19042546.js"></script><noscript><a href="http://www.51.la/?19042546" target="_blank"><img alt="我要啦免费统计" src="http://img.users.51.la/19042546.asp" style="border:none" /></a></noscript>                                 ', '2', 1, '', 0, 'Bello@lkonq.com', 'lll', '                               <script type="text/javascript">\r\nvar google_conversion_id = 860326848;\r\nvar google_conversion_language = "en";\r\nvar google_conversion_format = "3";\r\nvar google_conversion_color = "ffffff";\r\nvar google_conversion_label = "EgDxCPig224QwJeemgM";\r\nvar google_remarketing_only = false;\r\n</script><script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script><noscript><div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/860326848/?label=EgDxCPig224QwJeemgM&guid=ON&script=0"/></div></noscript>                                ', NULL, NULL, ''),
(10, '全金屬機身鋰電池空中飛鼠', '全金屬機身鋰電池空中飛鼠', '全金屬機身鋰電池空中飛鼠', '<p>453245</p>', 189900, 189900, '2017-03-17 00:51:28', 0, 'www.lkonq.com', 'RMB', 1, '￥', 0, 1000, 100, '', 'style5+timer', 'TW', NULL, NULL, '999', 9, 1, 1, '                   <script language="javascript" type="text/javascript" src="http://js.users.51.la/19042546.js"></script><noscript><a href="http://www.51.la/?19042546" target="_blank"><img alt="我要啦免费统计" src="http://img.users.51.la/19042546.asp" style="border:none" /></a></noscript>                     ', '55', 1, '', 0, 'Bello@lkonq.com', 'hhh', '                   <script type="text/javascript">\r\nvar google_conversion_id = 860326848;\r\nvar google_conversion_language = "en";\r\nvar google_conversion_format = "3";\r\nvar google_conversion_color = "ffffff";\r\nvar google_conversion_label = "EgDxCPig224QwJeemgM";\r\nvar google_remarketing_only = false;\r\n</script><script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script><noscript><div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/860326848/?label=EgDxCPig224QwJeemgM&guid=ON&script=0"/></div></noscript>                    ', NULL, NULL, ''),
(11, 'DT-B650智能魔盒自拍神器手機迷你藍牙音箱', 'DT-B650智能魔盒自拍神器手機迷你藍牙音箱', 'DT-B650智能魔盒自拍神器手機迷你藍牙音箱', '', 138800, 138800, '2017-03-20 04:51:51', 0, 'www.lkonq.com', 'RMB', 1, '￥', 0, 1000, 100, '', 'style6', 'TW', NULL, 1, '298', 1, 1, 1, '   <script language="javascript" type="text/javascript" src="http://js.users.51.la/19042546.js"></script><noscript><a href="http://www.51.la/?19042546" target="_blank"><img alt="我要啦免费统计" src="http://img.users.51.la/19042546.asp" style="border:none" /></a></noscript>     ', '2', 1, '', 0, 'Bello@lkonq.com', 'tjuyuj', '   <script type="text/javascript">\r\nvar google_conversion_id = 860326848;\r\nvar google_conversion_language = "en";\r\nvar google_conversion_format = "3";\r\nvar google_conversion_color = "ffffff";\r\nvar google_conversion_label = "EgDxCPig224QwJeemgM";\r\nvar google_remarketing_only = false;\r\n</script><script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script><noscript><div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/860326848/?label=EgDxCPig224QwJeemgM&guid=ON&script=0"/></div></noscript>    ', NULL, NULL, ''),
(12, '電子煙', '電子煙', '電子煙', '<p>22</p>', 158800, 158800, '2017-03-20 04:55:29', 1, 'www.zgrud.com', 'RMB', 1, '￥', 0, 1000, 100, '', 'style8(en)', 'TW', NULL, 1, '6377', 1, 1, 1, '       <script language="javascript" type="text/javascript" src="http://js.users.51.la/19042546.js"></script><noscript><a href="http://www.51.la/?19042546" target="_blank"><img alt="我要啦免费统计" src="http://img.users.51.la/19042546.asp" style="border:none" /></a></noscript>         ', '2', 1, '', 0, 'Bello@zgrud.com', 'klll', '       <script type="text/javascript">\r\nvar google_conversion_id = 860326848;\r\nvar google_conversion_language = "en";\r\nvar google_conversion_format = "3";\r\nvar google_conversion_color = "ffffff";\r\nvar google_conversion_label = "EgDxCPig224QwJeemgM";\r\nvar google_remarketing_only = false;\r\n</script><script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script><noscript><div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/860326848/?label=EgDxCPig224QwJeemgM&guid=ON&script=0"/></div></noscript>        ', NULL, NULL, ''),
(13, '日本OSEWAYA現貨星球宇宙月亮珍珠耳釘套裝', '日本OSEWAYA現貨星球宇宙月亮珍珠耳釘套裝', '日本OSEWAYA現貨星球宇宙月亮珍珠耳釘套裝', '', 99900, 99900, '2017-03-20 04:58:59', 1, 'www.zgrud.com', 'RMB', 1, '￥', 0, 1000, 100, '', 'style6', 'TW', NULL, 1, '689', 1, 1, 1, ' <script language="javascript" type="text/javascript" src="http://js.users.51.la/19042546.js"></script><noscript><a href="http://www.51.la/?19042546" target="_blank"><img alt="我要啦免费统计" src="http://img.users.51.la/19042546.asp" style="border:none" /></a></noscript>   ', '2', 1, '', 0, 'Bello@zgrud.com', 'hhhh', ' <script type="text/javascript">\r\nvar google_conversion_id = 860326848;\r\nvar google_conversion_language = "en";\r\nvar google_conversion_format = "3";\r\nvar google_conversion_color = "ffffff";\r\nvar google_conversion_label = "EgDxCPig224QwJeemgM";\r\nvar google_remarketing_only = false;\r\n</script><script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script><noscript><div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/860326848/?label=EgDxCPig224QwJeemgM&guid=ON&script=0"/></div></noscript>  ', NULL, NULL, ''),
(14, '駝背塑形矯正帶', '駝背塑形矯正帶', '駝背塑形矯正帶', '', 108800, 108800, '2017-03-20 04:59:56', 0, 'www.lkonq.com', 'RMB', 1, '￥', 0, 1000, 100, '/upload/style6/thumb/17-03-21/1489487626612868.gif', 'style6', 'TW', NULL, 1, '879', 1, 1, 1, '         <script language="javascript" type="text/javascript" src="http://js.users.51.la/19042546.js"></script><noscript><a href="http://www.51.la/?19042546" target="_blank"><img alt="我要啦免费统计" src="http://img.users.51.la/19042546.asp" style="border:none" /></a></noscript>           ', '2', 1, '/upload/style6/thumb/17-03-21/1489487626494174.gif', 0, 'Bello@lkonq.com', 'kjkss', '         <script type="text/javascript">\r\nvar google_conversion_id = 860326848;\r\nvar google_conversion_language = "en";\r\nvar google_conversion_format = "3";\r\nvar google_conversion_color = "ffffff";\r\nvar google_conversion_label = "EgDxCPig224QwJeemgM";\r\nvar google_remarketing_only = false;\r\n</script><script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script><noscript><div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/860326848/?label=EgDxCPig224QwJeemgM&guid=ON&script=0"/></div></noscript>          ', NULL, NULL, ''),
(15, 'DT-B650智能魔盒自拍神器手機迷你藍牙音箱', 'DT-B650智能魔盒自拍神器手機迷你藍牙音箱', 'DT-B650智能魔盒自拍神器手機迷你藍牙音箱', '', 138800, 138800, '2017-03-22 20:12:28', 0, 'www.bzlga.com', 'RMB', 1, '￥', 0, 1000, 100, '', 'Black(EN)', 'TW', NULL, NULL, '298', 1, 1, 1, '       <script language="javascript" type="text/javascript" src="http://js.users.51.la/19042546.js"></script><noscript><a href="http://www.51.la/?19042546" target="_blank"><img alt="我要啦免费统计" src="http://img.users.51.la/19042546.asp" style="border:none" /></a></noscript>         ', '288', 1, '', 0, 'Bello@bzlga.com', '', '       <script type="text/javascript">\r\nvar google_conversion_id = 860326848;\r\nvar google_conversion_language = "en";\r\nvar google_conversion_format = "3";\r\nvar google_conversion_color = "ffffff";\r\nvar google_conversion_label = "EgDxCPig224QwJeemgM";\r\nvar google_remarketing_only = false;\r\n</script><script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script><noscript><div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/860326848/?label=EgDxCPig224QwJeemgM&guid=ON&script=0"/></div></noscript>        ', '              <script type="text/javascript">\r\nvar google_conversion_id = 860326848;\r\nvar google_conversion_language = "en";\r\nvar google_conversion_format = "3";\r\nvar google_conversion_color = "ffffff";\r\nvar google_conversion_label = "EgDxCPig224QwJeemgM";\r\nvar google_remarketing_only = false;\r\n</script><script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script><noscript><div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/860326848/?label=EgDxCPig224QwJeemgM&guid=ON&script=0"/></div></noscript>        ', '   2', ''),
(16, 'NARY 全智能藍牙通話腕錶-通用版', 'NARY 全智能藍牙通話腕錶-通用版', 'NARY 全智能藍牙通話腕錶-通用版', '', 155800, 155800, '2017-03-23 20:30:52', 0, 'www.bzlga.com', 'RMB', 1, '￥', 0, 1000, 100, '', 'style6', 'TW', NULL, NULL, '287', 1, 1, 1, ' <script language="javascript" type="text/javascript" src="http://js.users.51.la/19042546.js"></script><noscript><a href="http://www.51.la/?19042546" target="_blank"><img alt="我要啦免费统计" src="http://img.users.51.la/19042546.asp" style="border:none" /></a></noscript>   ', '2', 6, '', 0, 'Bello@bzlga.com', 'aaa', ' <script type="text/javascript">\r\nvar google_conversion_id = 860326848;\r\nvar google_conversion_language = "en";\r\nvar google_conversion_format = "3";\r\nvar google_conversion_color = "ffffff";\r\nvar google_conversion_label = "EgDxCPig224QwJeemgM";\r\nvar google_remarketing_only = false;\r\n</script><script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script><noscript><div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/860326848/?label=EgDxCPig224QwJeemgM&guid=ON&script=0"/></div></noscript>  ', '   ', '   ', ''),
(17, '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '', 158800, 158800, '2017-03-23 20:32:14', 0, 'www.lkonq.com', 'RMB', 1, '￥', 0, 1000, 100, '', 'style6', 'TW', NULL, NULL, '273', 1, 1, 1, '     <script language="javascript" type="text/javascript" src="http://js.users.51.la/19042546.js"></script><noscript><a href="http://www.51.la/?19042546" target="_blank"><img alt="我要啦免费统计" src="http://img.users.51.la/19042546.asp" style="border:none" /></a></noscript>       ', '2', 6, '', 0, 'Bello@lkonq.com', 'hhhhhhh', '     <script type="text/javascript">\r\nvar google_conversion_id = 860326848;\r\nvar google_conversion_language = "en";\r\nvar google_conversion_format = "3";\r\nvar google_conversion_color = "ffffff";\r\nvar google_conversion_label = "EgDxCPig224QwJeemgM";\r\nvar google_remarketing_only = false;\r\n</script><script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script><noscript><div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/860326848/?label=EgDxCPig224QwJeemgM&guid=ON&script=0"/></div></noscript>      ', '           ', '           ', '');

-- --------------------------------------------------------

--
-- 表的结构 `product_attr`
--

CREATE TABLE `product_attr` (
  `product_attr_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) NOT NULL DEFAULT '0',
  `attr_group_id` int(8) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `price` int(8) DEFAULT '0',
  `thumb` varchar(255) DEFAULT NULL,
  `sort` tinyint(1) NOT NULL DEFAULT '0',
  `price_prefix` tinyint(1) DEFAULT '1',
  `number` char(20) NOT NULL DEFAULT '',
  `attr_group_title` char(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `product_attr`
--

INSERT INTO `product_attr` (`product_attr_id`, `product_id`, `attr_group_id`, `name`, `price`, `thumb`, `sort`, `price_prefix`, `number`, `attr_group_title`) VALUES
(1, 1, 6657, '淺米色', 0, NULL, 0, 1, '26103', '顏色'),
(2, 1, 6657, '淡粉色', 0, NULL, 0, 1, '26105', '顏色'),
(3, 1, 6657, '墨綠色', 0, NULL, 0, 1, '26107', '顏色'),
(4, 1, 6657, '淺藍色', 0, NULL, 0, 1, '26109', '顏色'),
(6, 1, 6657, '海藍色', 0, NULL, 0, 1, '26113', '顏色'),
(7, 1, 6657, '軍綠色', 0, NULL, 0, 1, '26115', '顏色'),
(8, 1, 6657, '卡其色', 0, NULL, 0, 1, '26117', '顏色'),
(9, 1, 6657, '黑色', 0, NULL, 0, 1, '26119', '顏色'),
(13, 1, 0, '大红', 0, NULL, 0, 1, '26111', '颜色'),
(14, 1, 0, '大黑', 0, NULL, 0, 1, '26222', '颜色'),
(15, 1, 6657, '大红黑', 0, NULL, 0, 1, '26333', '颜色'),
(18, 2, 314, '棕色', 0, NULL, 0, 1, '1310', '颜色'),
(19, 2, 16, '大红', 0, NULL, 0, 1, '1311', ''),
(20, 2, 314, '大黑', 0, NULL, 0, 1, '1358', '颜色'),
(21, 3, 2032, '天藍色', 0, NULL, 0, 1, '8595', '音响颜色'),
(22, 3, 2032, '天藍色', 0, NULL, 0, 1, '8595', '音响颜色'),
(23, 3, 2032, '白色', 0, NULL, 0, 1, '8596', '音响颜色'),
(24, 3, 2032, '粉紅色', 0, NULL, 0, 1, '8597', '音响颜色'),
(25, 3, 2032, '紫色', 0, NULL, 0, 1, '8598', '音响颜色'),
(26, 3, 2032, '黑色', 0, NULL, 0, 1, '8599', '音响颜色'),
(28, 4, 1998, '間金金', 0, NULL, 0, 1, '8426', '手表颜色'),
(29, 4, 1998, '間金金', 0, NULL, 0, 1, '8426', '手表颜色'),
(30, 4, 1998, '間金白', 0, NULL, 0, 1, '8427', '手表颜色'),
(31, 4, 1998, '間金黑', 0, NULL, 0, 1, '8428', '手表颜色'),
(32, 4, 1998, '銀色白', 0, NULL, 0, 1, '8429', '手表颜色'),
(33, 4, 1998, '銀色黑', 0, NULL, 0, 1, '8430', '手表颜色'),
(34, 4, 28, '红色', 0, NULL, 0, 1, '8431', ''),
(35, 4, 2000, '大白', 0, NULL, 0, 1, '8450', '手表颜色'),
(36, 4, 4000, '尊享黑', 0, NULL, 0, 1, '8451', '手表颜色'),
(37, 5, 2031, '黑色', 0, NULL, 0, 1, '8590', '包包颜色'),
(38, 5, 2031, '白色', 0, NULL, 0, 1, '8591', '包包颜色'),
(39, 5, 2031, '紅色', 0, NULL, 0, 1, '8592', '包包颜色'),
(40, 5, 2031, '金色', 0, NULL, 0, 1, '8593', '包包颜色'),
(41, 5, 2031, '藍綠色', 0, NULL, 0, 1, '8594', '包包颜色'),
(42, 5, 2031, '尊享黑', 0, NULL, 0, 1, '8598', '包包颜色'),
(43, 6, 2065, '黑色', 0, NULL, 0, 1, '8774', '包包颜色'),
(44, 6, 2065, '酒紅色', 0, NULL, 0, 1, '8775', '包包颜色'),
(45, 6, 2065, '粉紅色', 0, NULL, 0, 1, '8776', '包包颜色'),
(46, 6, 2065, '尊享黑', 0, NULL, 0, 1, '8888', '包包颜色'),
(47, 6, 2065, '尊享白', 0, NULL, 0, 1, '9999', '包包颜色'),
(48, 7, 888, '可回彈式健腹輪', 0, NULL, 0, 1, '3744', '健腹輪'),
(49, 7, 888, '不可回彈式健腹輪', 0, NULL, 0, 1, '3745', '健腹輪'),
(50, 7, 888, '黑色', 0, NULL, 0, 1, '888', '颜色'),
(51, 8, 851, '清晰自然妝盒（贈送護手霜）', 0, NULL, 0, 1, '3593', '彩妝五件套'),
(52, 8, 851, '優雅淑女裝盒（贈送護手霜）', 0, NULL, 0, 1, '3594', '彩妝五件套'),
(53, 8, 851, '浪漫桃花裝盒（贈送護手霜）', 0, NULL, 0, 1, '3595', '彩妝五件套'),
(54, 8, 509, '白金色', 0, NULL, 0, 1, '2175', '戒指顏色'),
(55, 8, 509, '玫瑰金', 0, NULL, 0, 1, '2176', '戒指顏色'),
(56, 8, 509, '金黃色', 0, NULL, 0, 1, '2177', '戒指顏色'),
(58, 8, 509, '尊享白', 0, NULL, 0, 1, '2189', '戒指顏色'),
(59, 9, 1002, '酒紅', 0, NULL, 0, 1, '4134', '女鞋顏色'),
(60, 9, 1002, '黑色', 0, NULL, 0, 1, '4135', '女鞋顏色'),
(61, 9, 1002, '灰色', 0, NULL, 0, 1, '4136', '女鞋顏色'),
(62, 9, 1002, '棕色', 0, NULL, 0, 1, '4137', '女鞋顏色'),
(63, 9, 1003, '標準鞋碼-35', 0, NULL, 0, 1, '4138', '女鞋'),
(64, 9, 1003, '標準鞋碼-36', 0, NULL, 0, 1, '4139', '女鞋'),
(65, 9, 1003, '標準鞋碼-37', 0, NULL, 0, 1, '4140', '女鞋'),
(66, 9, 1003, '標準鞋碼-38', 0, NULL, 0, 1, '4141', '女鞋'),
(67, 9, 1003, '標準鞋碼-39', 0, NULL, 0, 1, '4142', '女鞋'),
(68, 9, 1003, '標準鞋碼-40', 0, NULL, 0, 1, '4143', '女鞋'),
(69, 9, 1003, '標準鞋碼-41', 0, NULL, 0, 1, '4144', '女鞋'),
(70, 3, 2032, '东北银', 0, NULL, 0, 1, '8600', '音响颜色'),
(71, 10, 1153, '太空黑', 0, NULL, 0, 1, '4752', '產品顏色'),
(72, 10, 1153, '珍珠白', 0, NULL, 0, 1, '4753', '產品顏色'),
(73, 11, 2032, '天藍色', 0, NULL, 0, 1, '8595', '音响颜色'),
(74, 11, 2032, '白色', 0, NULL, 0, 1, '8596', '音响颜色'),
(75, 11, 2032, '粉紅色', 0, NULL, 0, 1, '8597', '音响颜色'),
(76, 11, 2032, '紫色', 0, NULL, 0, 1, '8598', '音响颜色'),
(77, 11, 2032, '黑色', 0, NULL, 0, 1, '8599', '音响颜色'),
(78, 12, 7255, '白色', 0, NULL, 0, 1, '28393', '顏色'),
(79, 12, 7255, '黑色', 0, NULL, 0, 1, '28395', '顏色'),
(80, 13, 773, '耳钉粉', 0, NULL, 0, 1, '3297', '宇宙月亮珍珠耳釘套裝颜色'),
(81, 13, 773, '耳钉黄', 0, NULL, 0, 1, '3298', '宇宙月亮珍珠耳釘套裝颜色'),
(82, 13, 773, '耳钉蓝', 0, NULL, 0, 1, '3299', '宇宙月亮珍珠耳釘套裝颜色'),
(83, 13, 773, '耳夹粉', 0, NULL, 0, 1, '3300', '宇宙月亮珍珠耳釘套裝颜色'),
(84, 13, 773, '耳夹黄', 0, NULL, 0, 1, '3301', '宇宙月亮珍珠耳釘套裝颜色'),
(85, 13, 773, '耳夹蓝', 0, NULL, 0, 1, '3302', '宇宙月亮珍珠耳釘套裝颜色'),
(86, 14, 1004, '駝背矯正白(新)', 0, NULL, 0, 1, '4145', '駝背矯正帶'),
(87, 14, 1004, '駝背矯正黑', 0, NULL, 0, 1, '4146', '駝背矯正帶'),
(88, 14, 1005, 'S', 0, NULL, 0, 1, '4147', '尺寸'),
(89, 14, 1005, 'M', 0, NULL, 0, 1, '4148', '尺寸'),
(90, 14, 1005, 'L', 0, NULL, 0, 1, '4149', '尺寸'),
(91, 14, 1005, 'XL', 0, NULL, 0, 1, '4150', '尺寸'),
(92, 14, 1005, 'XXL', 0, NULL, 0, 1, '4151', '尺寸'),
(93, 15, 2032, '天藍色', 0, NULL, 0, 1, '8595', '音响颜色'),
(94, 15, 2032, '白色', 0, NULL, 0, 1, '8596', '音响颜色'),
(95, 15, 2032, '粉紅色', 0, NULL, 0, 1, '8597', '音响颜色'),
(96, 15, 2032, '紫色', 0, NULL, 0, 1, '8598', '音响颜色'),
(97, 15, 2032, '黑色', 0, NULL, 0, 1, '8599', '音响颜色'),
(98, 16, 2022, '金色（真皮皮帶）', 0, NULL, 0, 1, '8554', '颜色'),
(99, 16, 2022, '金色（矽膠錶帶）', 0, NULL, 0, 1, '8555', '颜色'),
(100, 16, 2022, '黑色（真皮錶帶）', 0, NULL, 0, 1, '8556', '颜色'),
(101, 16, 2022, '黑色（矽膠錶帶）', 0, NULL, 0, 1, '8557', '颜色'),
(102, 17, 2005, '70A', 0, NULL, 0, 1, '8455', '内衣尺寸'),
(103, 17, 2005, '70B', 0, NULL, 0, 1, '8456', '内衣尺寸'),
(104, 17, 2005, '70C', 0, NULL, 0, 1, '8457', '内衣尺寸'),
(105, 17, 2005, '75A', 0, NULL, 0, 1, '8458', '内衣尺寸'),
(106, 17, 2005, '75B', 0, NULL, 0, 1, '8459', '内衣尺寸'),
(107, 17, 2005, '75C', 0, NULL, 0, 1, '8460', '内衣尺寸'),
(108, 17, 2005, '80A', 0, NULL, 0, 1, '8461', '内衣尺寸'),
(109, 17, 2005, '80B', 0, NULL, 0, 1, '8462', '内衣尺寸'),
(110, 17, 2005, '80C', 0, NULL, 0, 1, '8463', '内衣尺寸'),
(111, 17, 2005, '85C', 0, NULL, 0, 1, '8464', '内衣尺寸'),
(112, 17, 2005, '85B', 0, NULL, 0, 1, '8465', '内衣尺寸'),
(113, 17, 2005, '85A', 0, NULL, 0, 1, '8466', '内衣尺寸'),
(114, 17, 2004, '紫花水袋杯', 0, NULL, 0, 1, '8450', '内衣颜色'),
(115, 17, 2004, '金花水袋杯', 0, NULL, 0, 1, '8451', '内衣颜色'),
(116, 17, 2004, '紫花插片薄杯', 0, NULL, 0, 1, '8452', '内衣颜色'),
(117, 17, 2004, '金花插片薄杯', 0, NULL, 0, 1, '8453', '内衣颜色'),
(118, 17, 2004, '紫花插片薄杯', 0, NULL, 0, 1, '8454', '内衣颜色');

-- --------------------------------------------------------

--
-- 表的结构 `product_comment`
--

CREATE TABLE `product_comment` (
  `comment_id` int(11) UNSIGNED NOT NULL,
  `name` char(20) DEFAULT '',
  `content` varchar(255) DEFAULT NULL,
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否匿名',
  `is_del` int(1) DEFAULT '0',
  `star` tinyint(4) DEFAULT '0',
  `product_id` int(10) NOT NULL DEFAULT '0',
  `aid` int(8) NOT NULL DEFAULT '0',
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `product_comment`
--

INSERT INTO `product_comment` (`comment_id`, `name`, `content`, `is_anonymous`, `is_del`, `star`, `product_id`, `aid`, `add_time`) VALUES
(1, '4524', '5555555', 1, 0, 5, 10, 1, '2017-03-17 09:15:06'),
(2, '', '555555', 1, 0, 0, 11, 1, '2017-03-21 03:25:18'),
(3, '5554', '6545644', 0, 0, 5, 10, 1, '2017-03-21 03:34:06'),
(4, '555', '555555', 0, 0, 5, 10, 1, '2017-03-21 03:34:31'),
(5, '54657', '56456454', 0, 0, 5, 10, 1, '2017-03-21 03:35:01');

-- --------------------------------------------------------

--
-- 表的结构 `product_comment_thumb`
--

CREATE TABLE `product_comment_thumb` (
  `commont_thumb_id` int(11) UNSIGNED NOT NULL,
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `comment_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `product_comment_thumb`
--

INSERT INTO `product_comment_thumb` (`commont_thumb_id`, `thumb`, `comment_id`) VALUES
(1, '/upload/comment/17-03-21/1489474093_1.jpg', 5);

-- --------------------------------------------------------

--
-- 表的结构 `product_thumb`
--

CREATE TABLE `product_thumb` (
  `thumb_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(8) DEFAULT '0',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `product_thumb`
--

INSERT INTO `product_thumb` (`thumb_id`, `product_id`, `thumb`, `add_time`) VALUES
(1, 14, '/upload/style6/photos/17-03-21/1488945434_1.00.gif', '2017-03-20 19:28:39');

-- --------------------------------------------------------

--
-- 表的结构 `region`
--

CREATE TABLE `region` (
  `region_id` smallint(5) UNSIGNED NOT NULL,
  `parent_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `region_name` varchar(120) NOT NULL DEFAULT '',
  `region_type` tinyint(1) NOT NULL DEFAULT '2',
  `agency_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `region_code` char(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `region`
--

INSERT INTO `region` (`region_id`, `parent_id`, `region_name`, `region_type`, `agency_id`, `region_code`) VALUES
(3420, 3409, '彰化縣', 1, 0, ''),
(3409, 0, '台灣', 0, 0, 'TW'),
(3410, 3409, '台北市', 1, 0, ''),
(3411, 3409, '基隆市', 1, 0, ''),
(3412, 3409, '台北縣', 1, 0, ''),
(3413, 3409, '宜蘭縣', 1, 0, ''),
(3414, 3409, '新竹市', 1, 0, ''),
(3415, 3409, '新竹縣', 1, 0, ''),
(3416, 3409, '桃園縣', 1, 0, ''),
(3417, 3409, '苗栗縣', 1, 0, ''),
(3418, 3409, '台中市', 1, 0, ''),
(3419, 3409, '台中縣', 1, 0, ''),
(3421, 3409, '南投縣', 1, 0, ''),
(3422, 3409, '嘉義市 ', 1, 0, ''),
(3423, 3409, '嘉義縣', 1, 0, ''),
(3424, 3409, '雲林縣', 1, 0, ''),
(3426, 3409, '台南市', 1, 0, ''),
(3427, 3409, '台南縣', 1, 0, ''),
(3428, 3409, '高雄市', 1, 0, ''),
(3429, 3409, '高雄縣', 1, 0, ''),
(3430, 3409, '澎湖縣', 1, 0, ''),
(3431, 3409, '屏東縣', 1, 0, ''),
(3432, 3409, '台東縣', 1, 0, ''),
(3433, 3409, '花蓮縣', 1, 0, ''),
(3434, 3409, '金門縣', 1, 0, ''),
(3435, 3409, '連江縣', 1, 0, ''),
(3436, 3410, '中正區', 2, 0, ''),
(3437, 3410, '大同區', 2, 0, ''),
(3438, 3410, '中山區', 2, 0, ''),
(3439, 3410, '松山區', 2, 0, ''),
(3440, 3410, '大安區', 2, 0, ''),
(3441, 3410, '萬華區', 2, 0, ''),
(3442, 3410, '信義區', 2, 0, ''),
(3443, 3410, '士林區', 2, 0, ''),
(3444, 3410, '北投區', 2, 0, ''),
(3445, 3410, '內湖區', 2, 0, ''),
(3447, 3411, '仁愛區', 2, 0, ''),
(3448, 3411, '信義區', 2, 0, ''),
(3449, 3411, '中正區', 2, 0, ''),
(3450, 3411, '中山區', 2, 0, ''),
(3451, 3411, '安樂區', 2, 0, ''),
(3452, 3411, '暖暖區', 2, 0, ''),
(3453, 3411, '七堵區', 2, 0, ''),
(3454, 3412, '萬里鄉', 2, 0, ''),
(3455, 3412, '金山鄉', 2, 0, ''),
(3456, 3412, '板橋市', 2, 0, ''),
(3457, 3412, '汐止市', 2, 0, ''),
(3458, 3412, '深坑鄉', 2, 0, ''),
(3459, 3412, '石碇鄉', 2, 0, ''),
(3460, 3412, '瑞芳鎮', 2, 0, ''),
(3461, 3412, '平溪鄉', 2, 0, ''),
(3462, 3412, '雙溪鄉 ', 2, 0, ''),
(3463, 3412, '貢寮鄉 ', 2, 0, ''),
(3464, 3412, '新店市 ', 2, 0, ''),
(3465, 3412, '坪林鄉 ', 2, 0, ''),
(3466, 3412, '烏來鄉 ', 2, 0, ''),
(3467, 3412, '永和市 ', 2, 0, ''),
(3468, 3412, '中和市 ', 2, 0, ''),
(3469, 3412, '土城市 ', 2, 0, ''),
(3470, 3412, '三峽鎮 ', 2, 0, ''),
(3471, 3412, '樹林鎮 ', 2, 0, ''),
(3472, 3412, '鶯歌鎮 ', 2, 0, ''),
(3473, 3412, '三重市 ', 2, 0, ''),
(3474, 3412, '新莊市 ', 2, 0, ''),
(3475, 3412, '泰山鄉 ', 2, 0, ''),
(3476, 3412, '林口鄉 ', 2, 0, ''),
(3477, 3412, '蘆洲市 ', 2, 0, ''),
(3478, 3412, '五股鄉 ', 2, 0, ''),
(3479, 3412, '八里鄉 ', 2, 0, ''),
(3480, 3412, '淡水鎮 ', 2, 0, ''),
(3481, 3412, '三芝鄉 ', 2, 0, ''),
(3482, 3412, '石門鄉 ', 2, 0, ''),
(3483, 3413, '宜蘭市 ', 2, 0, ''),
(3484, 3413, '頭城鎮 ', 2, 0, ''),
(3485, 3413, '礁溪鄉 ', 2, 0, ''),
(3486, 3413, '壯圍鄉 ', 2, 0, ''),
(3487, 3413, '員山鄉 ', 2, 0, ''),
(3488, 3413, '羅東鎮 ', 2, 0, ''),
(3489, 3413, '三星鄉 ', 2, 0, ''),
(3490, 3413, '大同鄉 ', 2, 0, ''),
(3491, 3413, '五結鄉 ', 2, 0, ''),
(3492, 3413, '冬山鄉 ', 2, 0, ''),
(3493, 3413, '蘇澳鎮 ', 2, 0, ''),
(3494, 3413, '南澳鄉 ', 2, 0, ''),
(3495, 3410, '南港區 ', 2, 0, ''),
(3496, 3410, '文山區 ', 2, 0, ''),
(3510, 3416, '中壢市 ', 2, 0, ''),
(3511, 3416, '平鎮市 ', 2, 0, ''),
(3512, 3416, '龍潭鄉 ', 2, 0, ''),
(3513, 3416, '楊梅鎮 ', 2, 0, ''),
(3514, 3416, '新屋鄉 ', 2, 0, ''),
(3515, 3416, '觀音鄉 ', 2, 0, ''),
(3516, 3416, '桃園市 ', 2, 0, ''),
(3517, 3416, '龜山鄉 ', 2, 0, ''),
(3518, 3416, '八德市 ', 2, 0, ''),
(3519, 3416, '大溪鎮 ', 2, 0, ''),
(3520, 3416, '復興鄉 ', 2, 0, ''),
(3521, 3416, '大園鄉 ', 2, 0, ''),
(3522, 3416, '蘆竹鄉 ', 2, 0, ''),
(3523, 3417, '竹南鎮 ', 2, 0, ''),
(3524, 3417, '頭份鎮 ', 2, 0, ''),
(3525, 3417, '三灣鄉 ', 2, 0, ''),
(3526, 3417, '南庄鄉 ', 2, 0, ''),
(3527, 3417, '獅潭鄉 ', 2, 0, ''),
(3528, 3417, '後龍鎮', 2, 0, ''),
(3529, 3417, '通霄鎮 ', 2, 0, ''),
(3530, 3417, '苑裡鎮 ', 2, 0, ''),
(3531, 3417, '苗栗市 ', 2, 0, ''),
(3532, 3417, '造橋鄉 ', 2, 0, ''),
(3533, 3417, '頭屋鄉 ', 2, 0, ''),
(3534, 3417, '公館鄉 ', 2, 0, ''),
(3535, 3417, '大湖鄉 ', 2, 0, ''),
(3536, 3417, '泰安鄉 ', 2, 0, ''),
(3537, 3417, '銅鑼鄉 ', 2, 0, ''),
(3538, 3417, '三義鄉 ', 2, 0, ''),
(3539, 3417, '西湖鄉 ', 2, 0, ''),
(3540, 3417, '卓蘭鎮 ', 2, 0, ''),
(3549, 3418, '中區 ', 2, 0, ''),
(3550, 3418, '東區 ', 2, 0, ''),
(3551, 3418, '南區 ', 2, 0, ''),
(3552, 3418, '西區 ', 2, 0, ''),
(3553, 3418, '北區 ', 2, 0, ''),
(3554, 3418, '北屯區 ', 2, 0, ''),
(3555, 3418, '西屯區 ', 2, 0, ''),
(3556, 3418, '南屯區 ', 2, 0, ''),
(3557, 3419, '太平市 ', 2, 0, ''),
(3558, 3419, '大里市 ', 2, 0, ''),
(3559, 3419, '霧峰鄉 ', 2, 0, ''),
(3560, 3419, '烏日鄉 ', 2, 0, ''),
(3561, 3419, '豐原市 ', 2, 0, ''),
(3562, 3419, '后里鄉 ', 2, 0, ''),
(3563, 3419, '石岡鄉 ', 2, 0, ''),
(3564, 3419, '東勢鎮 ', 2, 0, ''),
(3565, 3419, '和平鄉 ', 2, 0, ''),
(3566, 3419, '新社鄉 ', 2, 0, ''),
(3567, 3419, '潭子鄉 ', 2, 0, ''),
(3568, 3419, '大雅鄉 ', 2, 0, ''),
(3569, 3419, '神岡鄉 ', 2, 0, ''),
(3570, 3419, '大肚鄉 ', 2, 0, ''),
(3571, 3419, '沙鹿鎮 ', 2, 0, ''),
(3572, 3419, '龍井鄉 ', 2, 0, ''),
(3573, 3419, '梧棲鎮 ', 2, 0, ''),
(3574, 3419, '清水鎮 ', 2, 0, ''),
(3575, 3419, '大甲鎮 ', 2, 0, ''),
(3576, 3419, '外埔鄉 ', 2, 0, ''),
(3577, 3419, '大安鄉 ', 2, 0, ''),
(3578, 3420, '彰化市 ', 2, 0, ''),
(3579, 3420, '芬園鄉 ', 2, 0, ''),
(3580, 3420, '花壇鄉 ', 2, 0, ''),
(3581, 3420, '秀水鄉 ', 2, 0, ''),
(3582, 3420, '鹿港鎮 ', 2, 0, ''),
(3583, 3420, '福興鄉 ', 2, 0, ''),
(3584, 3420, '線西鄉 ', 2, 0, ''),
(3585, 3420, '和美鎮 ', 2, 0, ''),
(3586, 3420, '伸港鄉 ', 2, 0, ''),
(3587, 3420, '員林鎮 ', 2, 0, ''),
(3588, 3420, '社頭鄉 ', 2, 0, ''),
(3589, 3420, '永靖鄉 ', 2, 0, ''),
(3590, 3420, '埔心鄉 ', 2, 0, ''),
(3591, 3420, '溪湖鎮 ', 2, 0, ''),
(3592, 3420, '大村鄉 ', 2, 0, ''),
(3593, 3420, '埔鹽鄉 ', 2, 0, ''),
(3594, 3420, '田中鎮 ', 2, 0, ''),
(3595, 3420, '北斗鎮 ', 2, 0, ''),
(3596, 3420, '田尾鄉 ', 2, 0, ''),
(3604, 3420, '埤頭鄉 ', 2, 0, ''),
(3605, 3420, '溪州鄉 ', 2, 0, ''),
(3606, 3420, '竹塘鄉 ', 2, 0, ''),
(3607, 3420, '二林鎮 ', 2, 0, ''),
(3608, 3420, '大城鄉 ', 2, 0, ''),
(3609, 3420, '芳苑鄉 ', 2, 0, ''),
(3610, 3420, '二水鄉 ', 2, 0, ''),
(3611, 3421, '南投市 ', 2, 0, ''),
(3612, 3421, '中寮鄉 ', 2, 0, ''),
(3613, 3421, '草屯鎮 ', 2, 0, ''),
(3614, 3421, '國姓鄉 ', 2, 0, ''),
(3615, 3421, '埔里鎮 ', 2, 0, ''),
(3616, 3421, '仁愛鄉 ', 2, 0, ''),
(3617, 3421, '名間鄉 ', 2, 0, ''),
(3618, 3421, '集集鎮 ', 2, 0, ''),
(3619, 3421, '水里鄉 ', 2, 0, ''),
(3620, 3421, '魚池鄉 ', 2, 0, ''),
(3621, 3421, '信義鄉 ', 2, 0, ''),
(3622, 3421, '竹山鎮 ', 2, 0, ''),
(3623, 3421, '鹿谷鄉 ', 2, 0, ''),
(3624, 3415, '竹北市 ', 2, 0, ''),
(3625, 3415, '湖口鄉 ', 2, 0, ''),
(3626, 3415, '新豐鄉 ', 2, 0, ''),
(3627, 3415, '新埔鎮 ', 2, 0, ''),
(3628, 3415, '關西鎮 ', 2, 0, ''),
(3629, 3415, '芎林鄉 ', 2, 0, ''),
(3630, 3415, '寶山鄉 ', 2, 0, ''),
(3631, 3415, '竹東鎮 ', 2, 0, ''),
(3632, 3415, '五峰鄉 ', 2, 0, ''),
(3633, 3415, '橫山鄉 ', 2, 0, ''),
(3634, 3415, '尖石鄉 ', 2, 0, ''),
(3635, 3415, '北埔鄉 ', 2, 0, ''),
(3636, 3415, '峨眉鄉 ', 2, 0, ''),
(3637, 3423, '番路鄉 ', 2, 0, ''),
(3638, 3423, '梅山鄉 ', 2, 0, ''),
(3639, 3423, '竹崎鄉 ', 2, 0, ''),
(3640, 3423, '阿里山鄉 ', 2, 0, ''),
(3641, 3423, '中埔鄉 ', 2, 0, ''),
(3642, 3423, '大埔鄉 ', 2, 0, ''),
(3643, 3423, '水上鄉 ', 2, 0, ''),
(3644, 3423, '鹿草鄉 ', 2, 0, ''),
(3645, 3423, '太保市 ', 2, 0, ''),
(3646, 3423, '朴子市 ', 2, 0, ''),
(3647, 3423, '東石鄉 ', 2, 0, ''),
(3648, 3423, '六腳鄉 ', 2, 0, ''),
(3649, 3423, '新港鄉 ', 2, 0, ''),
(3650, 3423, '民雄鄉 ', 2, 0, ''),
(3651, 3423, '大林鎮 ', 2, 0, ''),
(3652, 3423, '溪口鄉 ', 2, 0, ''),
(3653, 3423, '義竹鄉 ', 2, 0, ''),
(3654, 3423, '布袋鎮 ', 2, 0, ''),
(3655, 3424, '斗南鎮 ', 2, 0, ''),
(3656, 3424, '大埤鄉 ', 2, 0, ''),
(3657, 3424, '虎尾鎮 ', 2, 0, ''),
(3658, 3424, '土庫鎮 ', 2, 0, ''),
(3659, 3424, '褒忠鄉 ', 2, 0, ''),
(3660, 3424, '東勢鎮 ', 2, 0, ''),
(3661, 3424, '台西鄉 ', 2, 0, ''),
(3662, 3424, '崙背鄉 ', 2, 0, ''),
(3663, 3424, '麥寮鄉 ', 2, 0, ''),
(3664, 3424, '斗六市', 2, 0, ''),
(3665, 3424, '林內鄉', 2, 0, ''),
(3666, 3424, '古坑鄉 ', 2, 0, ''),
(3667, 3424, '莿桐鄉 ', 2, 0, ''),
(3668, 3424, '西螺鎮 ', 2, 0, ''),
(3669, 3424, '二崙鄉 ', 2, 0, ''),
(3670, 3424, '北港鎮 ', 2, 0, ''),
(3671, 3424, '水林鄉 ', 2, 0, ''),
(3672, 3424, '口湖鄉 ', 2, 0, ''),
(3673, 3424, '四湖鄉 ', 2, 0, ''),
(3674, 3424, '元長鄉 ', 2, 0, ''),
(3675, 3426, '中區 ', 2, 0, ''),
(3676, 3426, '東區 ', 2, 0, ''),
(3677, 3426, '南區 ', 2, 0, ''),
(3678, 3426, '西區 ', 2, 0, ''),
(3679, 3426, '北區 ', 2, 0, ''),
(3680, 3426, '安平區 ', 2, 0, ''),
(3681, 3426, '安南區 ', 2, 0, ''),
(3682, 3427, '永康市 ', 2, 0, ''),
(3683, 3427, '歸仁鄉 ', 2, 0, ''),
(3684, 3427, '新化鎮 ', 2, 0, ''),
(3685, 3427, '左鎮鄉 ', 2, 0, ''),
(3686, 3427, '玉井鄉 ', 2, 0, ''),
(3687, 3427, '楠西鄉 ', 2, 0, ''),
(3688, 3427, '南化鄉 ', 2, 0, ''),
(3689, 3427, '仁德鄉 ', 2, 0, ''),
(3690, 3427, '關廟鄉 ', 2, 0, ''),
(3691, 3427, '龍崎鄉 ', 2, 0, ''),
(3692, 3427, '官田鄉 ', 2, 0, ''),
(3693, 3427, '麻豆鎮 ', 2, 0, ''),
(3694, 3427, '佳里鎮 ', 2, 0, ''),
(3695, 3427, '西港鄉 ', 2, 0, ''),
(3696, 3427, '七股鄉 ', 2, 0, ''),
(3697, 3427, '將軍鄉 ', 2, 0, ''),
(3698, 3427, '學甲鎮 ', 2, 0, ''),
(3699, 3427, '北門鄉 ', 2, 0, ''),
(3700, 3427, '新營市 ', 2, 0, ''),
(3701, 3427, '後壁鄉 ', 2, 0, ''),
(3702, 3427, '白河鎮 ', 2, 0, ''),
(3703, 3427, '東山鄉 ', 2, 0, ''),
(3704, 3427, '六甲鄉 ', 2, 0, ''),
(3705, 3427, '下營鄉 ', 2, 0, ''),
(3706, 3427, '柳營鄉 ', 2, 0, ''),
(3707, 3427, '鹽水鎮 ', 2, 0, ''),
(3708, 3427, '善化鎮 ', 2, 0, ''),
(3709, 3427, '大內鄉 ', 2, 0, ''),
(3710, 3427, '山上鄉 ', 2, 0, ''),
(3711, 3427, '新市鄉 ', 2, 0, ''),
(3712, 3427, '安定鄉 ', 2, 0, ''),
(3713, 3428, '新興區 ', 2, 0, ''),
(3714, 3428, '前金區 ', 2, 0, ''),
(3715, 3428, '苓雅區 ', 2, 0, ''),
(3716, 3428, '鹽埕區 ', 2, 0, ''),
(3717, 3428, '鼓山區 ', 2, 0, ''),
(3718, 3428, '旗津區 ', 2, 0, ''),
(3719, 3428, '前鎮區 ', 2, 0, ''),
(3720, 3428, '三民區 ', 2, 0, ''),
(3721, 3428, '楠梓區 ', 2, 0, ''),
(3722, 3428, '小港區 ', 2, 0, ''),
(3723, 3428, '左營區 ', 2, 0, ''),
(3724, 3429, '仁武鄉 ', 2, 0, ''),
(3725, 3429, '大社鄉 ', 2, 0, ''),
(3726, 3429, '岡山鎮 ', 2, 0, ''),
(3727, 3429, '路竹鄉 ', 2, 0, ''),
(3728, 3429, '阿蓮鄉 ', 2, 0, ''),
(3729, 3429, '田寮鄉 ', 2, 0, ''),
(3730, 3429, '燕巢鄉 ', 2, 0, ''),
(3731, 3429, '橋頭鄉 ', 2, 0, ''),
(3732, 3429, '梓官鄉 ', 2, 0, ''),
(3733, 3429, '彌陀鄉 ', 2, 0, ''),
(3734, 3429, '永安鄉 ', 2, 0, ''),
(3735, 3429, '湖內鄉 ', 2, 0, ''),
(3736, 3429, '鳳山市 ', 2, 0, ''),
(3737, 3429, '大寮鄉 ', 2, 0, ''),
(3738, 3429, '林園鄉 ', 2, 0, ''),
(3739, 3429, '鳥松鄉 ', 2, 0, ''),
(3740, 3429, '大樹鄉 ', 2, 0, ''),
(3741, 3429, '旗山鎮 ', 2, 0, ''),
(3742, 3429, '美濃鎮 ', 2, 0, ''),
(3743, 3429, '六龜鄉 ', 2, 0, ''),
(3744, 3429, '內門鄉 ', 2, 0, ''),
(3745, 3429, '杉林鄉 ', 2, 0, ''),
(3746, 3429, '甲仙鄉 ', 2, 0, ''),
(3747, 3429, '桃源鄉 ', 2, 0, ''),
(3748, 3429, '那瑪夏鄉 ', 2, 0, ''),
(3749, 3429, '茂林鄉 ', 2, 0, ''),
(3750, 3429, '茄萣鄉 ', 2, 0, ''),
(3751, 3430, '馬公市 ', 2, 0, ''),
(3752, 3430, '西嶼鄉 ', 2, 0, ''),
(3753, 3430, '望安鄉 ', 2, 0, ''),
(3754, 3430, '七美鄉 ', 2, 0, ''),
(3755, 3430, '白沙鄉 ', 2, 0, ''),
(3756, 3430, '湖西鄉 ', 2, 0, ''),
(3757, 3431, '屏東市 ', 2, 0, ''),
(3758, 3431, '三地門鄉 ', 2, 0, ''),
(3759, 3431, '霧台鄉 ', 2, 0, ''),
(3760, 3431, '瑪家鄉 ', 2, 0, ''),
(3761, 3431, '九如鄉 ', 2, 0, ''),
(3762, 3431, '里港鄉 ', 2, 0, ''),
(3763, 3431, '高樹鄉 ', 2, 0, ''),
(3764, 3431, '鹽埔鄉 ', 2, 0, ''),
(3765, 3431, '長治鄉 ', 2, 0, ''),
(3766, 3431, '麟洛鄉 ', 2, 0, ''),
(3767, 3431, '竹田鄉 ', 2, 0, ''),
(3768, 3431, '內埔鄉 ', 2, 0, ''),
(3769, 3431, '萬丹鄉 ', 2, 0, ''),
(3770, 3431, '潮州鎮 ', 2, 0, ''),
(3771, 3431, '泰武鄉 ', 2, 0, ''),
(3772, 3431, '來義鄉 ', 2, 0, ''),
(3773, 3431, '萬巒鄉 ', 2, 0, ''),
(3774, 3431, '崁頂鄉 ', 2, 0, ''),
(3775, 3431, '新埤鄉 ', 2, 0, ''),
(3776, 3431, '南州鄉 ', 2, 0, ''),
(3777, 3431, '林邊鄉 ', 2, 0, ''),
(3778, 3431, '東港鎮 ', 2, 0, ''),
(3779, 3431, '琉球鄉 ', 2, 0, ''),
(3780, 3431, '佳冬鄉 ', 2, 0, ''),
(3781, 3431, '新園鄉 ', 2, 0, ''),
(3782, 3431, '枋寮鄉 ', 2, 0, ''),
(3783, 3431, '枋山鄉 ', 2, 0, ''),
(3784, 3431, '春日鄉 ', 2, 0, ''),
(3785, 3431, '獅子鄉 ', 2, 0, ''),
(3786, 3431, '車城鄉 ', 2, 0, ''),
(3787, 3431, '牡丹鄉 ', 2, 0, ''),
(3788, 3431, '恆春鎮 ', 2, 0, ''),
(3789, 3431, '滿州鄉 ', 2, 0, ''),
(3790, 3432, '台東市 ', 2, 0, ''),
(3791, 3432, '綠島鄉 ', 2, 0, ''),
(3792, 3432, '蘭嶼鄉 ', 2, 0, ''),
(3793, 3432, '延平鄉 ', 2, 0, ''),
(3794, 3432, '卑南鄉 ', 2, 0, ''),
(3795, 3432, '鹿野鄉 ', 2, 0, ''),
(3796, 3432, '關山鎮 ', 2, 0, ''),
(3797, 3432, '海瑞鄉 ', 2, 0, ''),
(3798, 3432, '池上鄉 ', 2, 0, ''),
(3799, 3432, '東河鄉 ', 2, 0, ''),
(3800, 3432, '成功鎮 ', 2, 0, ''),
(3801, 3432, '長濱鄉 ', 2, 0, ''),
(3802, 3432, '太麻里鄉 ', 2, 0, ''),
(3803, 3432, '金峰鄉 ', 2, 0, ''),
(3804, 3432, '大武鄉 ', 2, 0, ''),
(3805, 3432, '達仁鄉 ', 2, 0, ''),
(3806, 3433, '花蓮市 ', 2, 0, ''),
(3807, 3433, '新城鄉 ', 2, 0, ''),
(3808, 3433, '秀林鄉 ', 2, 0, ''),
(3809, 3433, '吉安鄉 ', 2, 0, ''),
(3810, 3433, '壽豐鄉 ', 2, 0, ''),
(3811, 3433, '鳳林鎮 ', 2, 0, ''),
(3812, 3433, '光復鄉 ', 2, 0, ''),
(3813, 3433, '豐濱鄉 ', 2, 0, ''),
(3814, 3433, '瑞穗鄉 ', 2, 0, ''),
(3815, 3433, '萬榮鄉 ', 2, 0, ''),
(3816, 3433, '玉里鎮 ', 2, 0, ''),
(3817, 3433, '卓溪鄉 ', 2, 0, ''),
(3818, 3433, '富里鄉 ', 2, 0, ''),
(3819, 3434, '金沙鎮 ', 2, 0, ''),
(3820, 3434, '金湖鎮 ', 2, 0, ''),
(3821, 3434, '金寧鄉 ', 2, 0, ''),
(3822, 3434, '金城鎮 ', 2, 0, ''),
(3823, 3434, '烈嶼鄉 ', 2, 0, ''),
(3824, 3434, '烏坵鄉 ', 2, 0, ''),
(3825, 3435, '南竿鄉 ', 2, 0, ''),
(3826, 3435, '北竿鄉 ', 2, 0, ''),
(3827, 3435, '莒光鄉 ', 2, 0, ''),
(3828, 3435, '東引鄉 ', 2, 0, ''),
(61, 1, 'Armed Forces Pacific', 1, 0, 'AP'),
(1, 0, 'United States', 0, 0, 'US'),
(2, 1, 'Alabama', 1, 0, 'AL'),
(3, 1, 'Alaska', 1, 0, 'AK'),
(4, 1, 'Arizona', 1, 0, 'AZ'),
(5, 1, 'California', 1, 0, 'CA'),
(6, 1, 'Colorado', 1, 0, 'CO'),
(7, 1, 'Connecticut', 1, 0, 'CT'),
(8, 1, 'Delaware', 1, 0, 'DE'),
(9, 1, 'District of Columbia', 1, 0, 'DC'),
(10, 1, 'Florida', 1, 0, 'FL'),
(11, 1, 'Georgia', 1, 0, 'GA'),
(12, 1, 'Hawaii', 1, 0, 'HI'),
(13, 1, 'Idaho', 1, 0, 'ID'),
(14, 1, 'Illinois ', 1, 0, 'IL'),
(15, 1, 'Indiana', 1, 0, 'IN'),
(16, 1, 'Iowa', 1, 0, 'IA'),
(17, 1, 'Kansas', 1, 0, 'KS'),
(18, 1, 'Kentucky', 1, 0, 'KY'),
(19, 1, 'Louisiana', 1, 0, 'LA'),
(20, 1, 'Maine', 1, 0, 'ME'),
(21, 1, 'Maryland', 1, 0, 'MD'),
(22, 1, 'Massachusetts', 1, 0, 'MA'),
(23, 1, 'Michigan', 1, 0, 'MI'),
(24, 1, 'Minnesota', 1, 0, 'MN'),
(25, 1, 'Mississippi', 1, 0, 'MS'),
(26, 1, 'Missouri', 1, 0, 'MO'),
(27, 1, 'Montana', 1, 0, 'MT'),
(28, 1, 'Nebraska', 1, 0, 'NE'),
(29, 1, 'Nevada', 1, 0, 'NV'),
(30, 1, 'New Hampshire', 1, 0, 'NH'),
(31, 1, 'New Jersey', 1, 0, 'NJ'),
(32, 1, 'New Mexico', 1, 0, 'NM'),
(33, 1, 'New York', 1, 0, 'NY'),
(34, 1, 'North Carolina', 1, 0, 'NC'),
(35, 1, 'North Dakota', 1, 0, 'ND'),
(36, 1, 'Ohio ', 1, 0, 'OH'),
(37, 1, 'Oklahoma', 1, 0, 'OK'),
(38, 1, 'Oregon', 1, 0, 'OR'),
(39, 1, 'Pennsylvania', 1, 0, 'PA'),
(40, 1, 'Rhode Island', 1, 0, 'RI'),
(41, 1, 'South Carolina', 1, 0, 'SC'),
(42, 1, 'South Dakota', 1, 0, 'SD'),
(43, 1, 'Tennessee', 1, 0, 'TN'),
(44, 1, 'Texas', 1, 0, 'TX'),
(45, 1, 'Utah', 1, 0, 'UT'),
(46, 1, 'Vermont', 1, 0, 'VT'),
(47, 1, 'Virginia', 1, 0, 'VA'),
(48, 1, 'Washington', 1, 0, 'WA'),
(49, 1, 'West Virginia', 1, 0, 'WV'),
(50, 1, 'Wisconsin', 1, 0, 'WI'),
(51, 1, 'Wyoming', 1, 0, 'WY'),
(52, 1, 'American Samoa', 1, 0, 'AS'),
(53, 1, 'Federated States of Micronesia', 1, 0, 'FM'),
(54, 1, 'Guam', 1, 0, 'GU'),
(55, 1, 'Northern Mariana Islands', 1, 0, 'MP'),
(56, 1, 'Puerto Rico', 1, 0, 'PR'),
(57, 1, 'Republic of Marshall Islands', 1, 0, 'MH'),
(58, 1, 'Virgin Islands of the U.S. ', 1, 0, 'VI'),
(59, 1, 'Armed Forces Middle East', 1, 0, 'AE'),
(60, 1, 'Armed Forces Americas', 1, 0, 'AA'),
(62, 1, 'Arkansas', 1, 0, 'AR'),
(63, 0, '香港', 0, 0, 'HK'),
(64, 63, '九龍', 1, 0, ''),
(65, 63, '香港島', 1, 0, ''),
(66, 63, '新界', 1, 0, ''),
(3830, 3409, '新北市', 1, 0, ''),
(67, 0, 'Việt Nam', 0, 0, 'YN');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `uid` int(11) UNSIGNED NOT NULL,
  `username` char(50) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `add_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `email` varchar(225) DEFAULT NULL,
  `is_del` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`uid`, `username`, `password`, `add_time`, `email`, `is_del`) VALUES
(1, 'admin', 'dafb23c65fc066e6df1ae2277289bc91', '2017-01-12 04:00:00', 'admin@qq.com', 0),
(2, 'Walli_JJ', 'e10adc3949ba59abbe56e057f20f883e', '2017-01-16 11:59:08', '978704526@qq.com', 1),
(3, 'admin', '', '2017-01-16 12:05:34', '978704526@qq.com', 1),
(4, 'admin', '01afae0f96ab83c9e7937a3358a8b419', '2017-02-03 10:11:26', '9787045261@qq.com', 1),
(5, 'buguniao', 'e10adc3949ba59abbe56e057f20f883e', '2017-02-08 08:14:52', 'admin@163.com', 0),
(6, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2017-01-12 04:00:00', 'admin@qq.com', 1),
(7, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2017-03-17 02:04:28', 'admin@163.com', 1),
(8, '111', 'e10adc3949ba59abbe56e057f20f883e', '2017-03-20 20:27:25', '111@qq.com', 0),
(9, 'buguniao', 'dafb23c65fc066e6df1ae2277289bc91', '2017-01-12 04:00:00', 'buguniao@qq.com', 0),
(10, 'buguniao', 'dafb23c65fc066e6df1ae2277289bc91', '2017-01-12 04:00:00', 'buguniao@qq.com', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `combo`
--
ALTER TABLE `combo`
  ADD PRIMARY KEY (`combo_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `combo_goods`
--
ALTER TABLE `combo_goods`
  ADD PRIMARY KEY (`combo_goods_id`),
  ADD KEY `combo_id` (`combo_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_no` (`order_no`);

--
-- Indexes for table `order_goods`
--
ALTER TABLE `order_goods`
  ADD PRIMARY KEY (`order_goods_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `order_goods_attr`
--
ALTER TABLE `order_goods_attr`
  ADD PRIMARY KEY (`order_goods_attr_id`),
  ADD KEY `order_goods_id` (`order_goods_id`,`order_goods_attr_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `theme` (`theme`);

--
-- Indexes for table `product_attr`
--
ALTER TABLE `product_attr`
  ADD PRIMARY KEY (`product_attr_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_comment`
--
ALTER TABLE `product_comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_comment_thumb`
--
ALTER TABLE `product_comment_thumb`
  ADD PRIMARY KEY (`commont_thumb_id`);

--
-- Indexes for table `product_thumb`
--
ALTER TABLE `product_thumb`
  ADD PRIMARY KEY (`thumb_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`region_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `region_type` (`region_type`),
  ADD KEY `agency_id` (`agency_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `password` (`password`),
  ADD KEY `email` (`email`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `combo`
--
ALTER TABLE `combo`
  MODIFY `combo_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `combo_goods`
--
ALTER TABLE `combo_goods`
  MODIFY `combo_goods_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `order_goods`
--
ALTER TABLE `order_goods`
  MODIFY `order_goods_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `order_goods_attr`
--
ALTER TABLE `order_goods_attr`
  MODIFY `order_goods_attr_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- 使用表AUTO_INCREMENT `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- 使用表AUTO_INCREMENT `product_attr`
--
ALTER TABLE `product_attr`
  MODIFY `product_attr_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
--
-- 使用表AUTO_INCREMENT `product_comment`
--
ALTER TABLE `product_comment`
  MODIFY `comment_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `product_comment_thumb`
--
ALTER TABLE `product_comment_thumb`
  MODIFY `commont_thumb_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `product_thumb`
--
ALTER TABLE `product_thumb`
  MODIFY `thumb_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `region`
--
ALTER TABLE `region`
  MODIFY `region_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3831;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
