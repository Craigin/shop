/*
Navicat MySQL Data Transfer

Source Server         : cms
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : stoshop

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-04-07 13:38:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for combo
-- ----------------------------
DROP TABLE IF EXISTS `combo`;
CREATE TABLE `combo` (
  `combo_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `price` int(10) NOT NULL DEFAULT '0',
  `product_id` int(8) NOT NULL,
  PRIMARY KEY (`combo_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of combo
-- ----------------------------
INSERT INTO `combo` VALUES ('1', '456', '100', '1');

-- ----------------------------
-- Table structure for combo_goods
-- ----------------------------
DROP TABLE IF EXISTS `combo_goods`;
CREATE TABLE `combo_goods` (
  `combo_goods_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `num` int(5) NOT NULL,
  `erp_id` int(8) NOT NULL DEFAULT '0',
  `combo_id` int(8) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`combo_goods_id`),
  KEY `combo_id` (`combo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of combo_goods
-- ----------------------------
INSERT INTO `combo_goods` VALUES ('1', '5', '245', '1', '55');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
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
  `post_erp_msg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_no` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', 'G314833437907008', '1170314052619149', 'NOT_PAID', '1', '1', '日本UV紫外線綿の帽子', '井上', '', '785@qq.com', '0901234567', '台灣   三重県785785', '下单未付款', '100', 'SUCCESS', '货到付款', '2017-03-14 17:22:23', '127.0.0.1', '1', '{\"key\":\"ae1b5d75b02b71ceca917274245a1de8\",\"web_url\":\"www.lkonq.com\",\"first_name\":\"井上\",\"last_name\":null,\"tel\":\"0901234567\",\"email\":\"785@qq.com\",\"address\":\"三重県785785\",\"remark\":\"785\",\"zipcode\":\"75\",\"country\":\"中国\",\"province\":\"台灣\",\"city\":\"\",\"area\":\"\",\"products\":[{\"id_product\":\"245\",\"product_title\":\"55\",\"sale_title\":\"55\",\"price\":\"0.00\",\"price_title\":\"￥0.00\",\"qty\":5,\"attrs\":[]}],\"id_zone\":\"1\",\"id_department\":\"1\",\"id_users\":\"9\",\"identify\":\"9\",\"grand_total\":1,\"currency_code\":\"RMB\",\"date_purchase\":\"2017-03-14 17:22:23\",\"payment_method\":0,\"payment_status\":\"processing\",\"payment_details\":\"\",\"created_at\":\"2017-03-14 17:22:23\",\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36\",\"number\":\"1\",\"expends\":[]}', null);
INSERT INTO `order` VALUES ('2', 'G317437896849343', '1170317054719380', 'NOT_PAID', '9', '3', '2016秋冬爆款加羊絨牛皮靴44', '陈嘉就', '', '111@qq.com', '08540065454554', '台灣   哈哈哈哈或', '下单未付款', '476400', 'SUCCESS', '货到付款', '2017-03-17 17:43:09', '127.0.0.1', '1', '{\"key\":\"3f3477925f99f904c8aeb0173f022f71\",\"web_url\":\"www.lkonq.com\",\"first_name\":\"陈嘉就\",\"last_name\":null,\"tel\":\"08540065454554\",\"email\":\"111@qq.com\",\"address\":\"哈哈哈哈或\",\"remark\":\"0866454544\",\"zipcode\":\"521021\",\"country\":\"中国\",\"province\":\"台灣\",\"city\":\"\",\"area\":\"\",\"products\":[{\"id_product\":\"877\",\"product_title\":\"2016秋冬爆款加羊絨牛皮靴44\",\"sale_title\":\"2016秋冬爆款加羊絨牛皮靴44\",\"price\":4764,\"price_title\":\"￥4764\",\"qty\":\"3\",\"attrs\":[\"4134\",\"4138\"]}],\"id_zone\":\"1\",\"id_department\":\"1\",\"id_users\":\"9\",\"identify\":\"9\",\"grand_total\":4764,\"currency_code\":\"RMB\",\"date_purchase\":\"2017-03-17 17:43:09\",\"payment_method\":0,\"payment_status\":\"processing\",\"payment_details\":\"\",\"created_at\":\"2017-03-17 17:43:09\",\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36\",\"number\":\"3\",\"expends\":[]}', null);
INSERT INTO `order` VALUES ('3', 'G322742065794674', '1170322052112183', 'NOT_PAID', '14', '1', '駝背塑形矯正帶', '张三', '', '111@qq.com', '08540065454554', '台灣   11', '下单未付款', '108800', 'SUCCESS', '货到付款', '2017-03-22 17:16:46', '127.0.0.1', '1', '{\"key\":\"6dfa8e1bb2ea190532ac7bc4b4531155\",\"web_url\":\"www.lkonq.com\",\"first_name\":\"张三\",\"last_name\":null,\"tel\":\"08540065454554\",\"email\":\"111@qq.com\",\"address\":\"11\",\"remark\":\"\",\"zipcode\":null,\"country\":\"中国\",\"province\":\"台灣\",\"city\":\"\",\"area\":\"\",\"products\":[{\"id_product\":\"879\",\"product_title\":\"駝背塑形矯正帶\",\"sale_title\":\"駝背塑形矯正帶\",\"price\":1088,\"price_title\":\"￥1088\",\"qty\":\"1\",\"attrs\":[\"4145\"]}],\"id_zone\":\"1\",\"id_department\":\"1\",\"id_users\":\"1\",\"identify\":\"1\",\"grand_total\":1088,\"currency_code\":\"RMB\",\"date_purchase\":\"2017-03-22 17:16:46\",\"payment_method\":0,\"payment_status\":\"processing\",\"payment_details\":\"\",\"created_at\":\"2017-03-22 17:16:46\",\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36\",\"number\":\"1\",\"expends\":[]}', null);
INSERT INTO `order` VALUES ('4', 'G324264020022286', '1170324113757452', 'NOT_PAID', '17', '1', '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '张三', '', '111@qq.com', '08540065454554', '台灣   11111111111', '下单未付款', '158800', 'SUCCESS', '货到付款', '2017-03-24 11:33:22', '127.0.0.1', '6', '{\"key\":\"94c884afbd178c037c137bd1ab921bea\",\"web_url\":\"www.lkonq.com\",\"first_name\":\"张三\",\"last_name\":null,\"tel\":\"08540065454554\",\"email\":\"111@qq.com\",\"address\":\"11111111111\",\"remark\":\"\",\"zipcode\":\"1111111111\",\"country\":\"中国\",\"province\":\"台灣\",\"city\":\"\",\"area\":\"\",\"products\":[{\"id_product\":\"273\",\"product_title\":\"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌\",\"sale_title\":\"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌\",\"price\":1588,\"price_title\":\"￥1588\",\"qty\":\"1\",\"attrs\":[\"8455\",\"8450\"]}],\"id_zone\":\"1\",\"id_department\":\"1\",\"id_users\":\"1\",\"identify\":\"1\",\"grand_total\":1588,\"currency_code\":\"RMB\",\"date_purchase\":\"2017-03-24 11:33:22\",\"payment_method\":0,\"payment_status\":\"processing\",\"payment_details\":\"\",\"created_at\":\"2017-03-24 11:33:22\",\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36\",\"number\":\"1\",\"expends\":[]}', null);
INSERT INTO `order` VALUES ('5', 'G324264592512212', '1170324113854437', 'NOT_PAID', '17', '1', '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '张三', '', '111@qq.com', '08540065454554', '台灣   11111111111', '下单未付款', '158800', 'SUCCESS', '货到付款', '2017-03-24 11:34:19', '127.0.0.1', '6', '{\"key\":\"8b6a0eb637c0a95cb3322e7a1bb5f176\",\"web_url\":\"www.lkonq.com\",\"first_name\":\"张三\",\"last_name\":null,\"tel\":\"08540065454554\",\"email\":\"111@qq.com\",\"address\":\"11111111111\",\"remark\":\"\",\"zipcode\":\"1111111111\",\"country\":\"中国\",\"province\":\"台灣\",\"city\":\"\",\"area\":\"\",\"products\":[{\"id_product\":\"273\",\"product_title\":\"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌\",\"sale_title\":\"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌\",\"price\":1588,\"price_title\":\"￥1588\",\"qty\":\"1\",\"attrs\":[\"8455\",\"8450\"]}],\"id_zone\":\"1\",\"id_department\":\"1\",\"id_users\":\"1\",\"identify\":\"1\",\"grand_total\":1588,\"currency_code\":\"RMB\",\"date_purchase\":\"2017-03-24 11:34:19\",\"payment_method\":0,\"payment_status\":\"processing\",\"payment_details\":\"\",\"created_at\":\"2017-03-24 11:34:19\",\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36\",\"number\":\"1\",\"expends\":[]}', null);
INSERT INTO `order` VALUES ('6', 'G324266947102285', '1170324114249699', 'NOT_PAID', '17', '1', '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '张三', '', '111@qq.com', '08540065454554', '台灣   11111111111', '下单未付款', '158800', 'SUCCESS', '货到付款', '2017-03-24 11:38:14', '127.0.0.1', '6', '{\"key\":\"90a50ecbccb5e47135dcb05ac1b55daf\",\"web_url\":\"www.lkonq.com\",\"first_name\":\"张三\",\"last_name\":null,\"tel\":\"08540065454554\",\"email\":\"111@qq.com\",\"address\":\"11111111111\",\"remark\":\"\",\"zipcode\":\"1111111111\",\"country\":\"中国\",\"province\":\"台灣\",\"city\":\"\",\"area\":\"\",\"products\":[{\"id_product\":\"273\",\"product_title\":\"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌\",\"sale_title\":\"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌\",\"price\":1588,\"price_title\":\"￥1588\",\"qty\":\"1\",\"attrs\":[\"8455\",\"8450\"]}],\"id_zone\":\"1\",\"id_department\":\"1\",\"id_users\":\"1\",\"identify\":\"1\",\"grand_total\":1588,\"currency_code\":\"RMB\",\"date_purchase\":\"2017-03-24 11:38:14\",\"payment_method\":0,\"payment_status\":\"processing\",\"payment_details\":\"\",\"created_at\":\"2017-03-24 11:38:14\",\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36\",\"number\":\"1\",\"expends\":[]}', null);
INSERT INTO `order` VALUES ('7', 'G324267773042210', '1170324114412188', 'NOT_PAID', '17', '1', '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '张三', '', '111@qq.com', '08540065454554', '台灣   11111111111', '下单未付款', '158800', 'SUCCESS', '货到付款', '2017-03-24 11:39:37', '127.0.0.1', '6', '{\"key\":\"cd554bd9b5154f71ace449e47b09c983\",\"web_url\":\"www.lkonq.com\",\"first_name\":\"张三\",\"last_name\":null,\"tel\":\"08540065454554\",\"email\":\"111@qq.com\",\"address\":\"11111111111\",\"remark\":\"\",\"zipcode\":\"1111111111\",\"country\":\"中国\",\"province\":\"台灣\",\"city\":\"\",\"area\":\"\",\"products\":[{\"id_product\":\"273\",\"product_title\":\"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌\",\"sale_title\":\"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌\",\"price\":1588,\"price_title\":\"￥1588\",\"qty\":\"1\",\"attrs\":[\"8455\",\"8450\"]}],\"id_zone\":\"1\",\"id_department\":\"1\",\"id_users\":\"1\",\"identify\":\"1\",\"grand_total\":1588,\"currency_code\":\"RMB\",\"date_purchase\":\"2017-03-24 11:39:37\",\"payment_method\":0,\"payment_status\":\"processing\",\"payment_details\":\"\",\"created_at\":\"2017-03-24 11:39:37\",\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36\",\"number\":\"1\",\"expends\":[]}', null);
INSERT INTO `order` VALUES ('8', 'G324270524272231', '1170324114847837', 'NOT_PAID', '17', '1', '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '张三', '', '111@qq.com', '08540065454554', '台灣   11111111111', '下单未付款', '158800', 'SUCCESS', '货到付款', '2017-03-24 11:44:12', '127.0.0.1', '6', '{\"key\":\"661c12432647f87a74e53f33c0e207a5\",\"web_url\":\"www.lkonq.com\",\"first_name\":\"张三\",\"last_name\":null,\"tel\":\"08540065454554\",\"email\":\"111@qq.com\",\"address\":\"11111111111\",\"remark\":\"\",\"zipcode\":\"1111111111\",\"country\":\"中国\",\"province\":\"台灣\",\"city\":\"\",\"area\":\"\",\"products\":[{\"id_product\":\"273\",\"product_title\":\"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌\",\"sale_title\":\"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌\",\"price\":1588,\"price_title\":\"￥1588\",\"qty\":\"1\",\"attrs\":[\"8455\",\"8450\"]}],\"id_zone\":\"1\",\"id_department\":\"1\",\"id_users\":\"1\",\"identify\":\"1\",\"grand_total\":1588,\"currency_code\":\"RMB\",\"date_purchase\":\"2017-03-24 11:44:12\",\"payment_method\":0,\"payment_status\":\"processing\",\"payment_details\":\"\",\"created_at\":\"2017-03-24 11:44:12\",\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36\",\"number\":\"1\",\"expends\":[]}', null);
INSERT INTO `order` VALUES ('9', 'G324270636592219', '1170324114858390', 'NOT_PAID', '17', '1', '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '张三', '', '111@qq.com', '08540065454554', '台灣   11111111111', '下单未付款', '158800', 'SUCCESS', '货到付款', '2017-03-24 11:44:23', '127.0.0.1', '6', '{\"key\":\"587e7115b69785a0e5aea5a5fa194ead\",\"web_url\":\"www.lkonq.com\",\"first_name\":\"张三\",\"last_name\":null,\"tel\":\"08540065454554\",\"email\":\"111@qq.com\",\"address\":\"11111111111\",\"remark\":\"\",\"zipcode\":\"1111111111\",\"country\":\"中国\",\"province\":\"台灣\",\"city\":\"\",\"area\":\"\",\"products\":[{\"id_product\":\"273\",\"product_title\":\"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌\",\"sale_title\":\"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌\",\"price\":1588,\"price_title\":\"￥1588\",\"qty\":\"1\",\"attrs\":[\"8455\",\"8450\"]}],\"id_zone\":\"1\",\"id_department\":\"1\",\"id_users\":\"1\",\"identify\":\"1\",\"grand_total\":1588,\"currency_code\":\"RMB\",\"date_purchase\":\"2017-03-24 11:44:23\",\"payment_method\":0,\"payment_status\":\"processing\",\"payment_details\":\"\",\"created_at\":\"2017-03-24 11:44:23\",\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36\",\"number\":\"1\",\"expends\":[]}', null);
INSERT INTO `order` VALUES ('10', 'G324275243522239', '1170324115639844', 'NOT_PAID', '17', '1', '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '张三', '', '111@qq.com', '08540065454554', '台灣   11111111111', '下单未付款', '158800', 'SUCCESS', '货到付款', '2017-03-24 11:52:04', '127.0.0.1', '6', '{\"key\":\"f278aea97145f89b651f50c6cc0f2562\",\"web_url\":\"www.lkonq.com\",\"first_name\":\"张三\",\"last_name\":null,\"tel\":\"08540065454554\",\"email\":\"111@qq.com\",\"address\":\"11111111111\",\"remark\":\"\",\"zipcode\":\"1111111111\",\"country\":\"中国\",\"province\":\"台灣\",\"city\":\"\",\"area\":\"\",\"products\":[{\"id_product\":\"273\",\"product_title\":\"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌\",\"sale_title\":\"厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌\",\"price\":1588,\"price_title\":\"￥1588\",\"qty\":\"1\",\"attrs\":[\"8455\",\"8450\"]}],\"id_zone\":\"1\",\"id_department\":\"1\",\"id_users\":\"1\",\"identify\":\"1\",\"grand_total\":1588,\"currency_code\":\"RMB\",\"date_purchase\":\"2017-03-24 11:52:04\",\"payment_method\":0,\"payment_status\":\"processing\",\"payment_details\":\"\",\"created_at\":\"2017-03-24 11:52:04\",\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/56.0.2924.87 Safari\\/537.36\",\"number\":\"1\",\"expends\":[]}', null);

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods` (
  `order_goods_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `num` int(8) NOT NULL DEFAULT '0',
  `price` int(10) NOT NULL DEFAULT '0',
  `total` int(10) NOT NULL DEFAULT '0',
  `order_id` int(8) NOT NULL DEFAULT '0',
  `erp_id` int(8) DEFAULT NULL,
  PRIMARY KEY (`order_goods_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_goods
-- ----------------------------
INSERT INTO `order_goods` VALUES ('1', '55', '1', '0', '0', '1', '245');
INSERT INTO `order_goods` VALUES ('2', '2016秋冬爆款加羊絨牛皮靴44', '3', '476400', '1429200', '2', '877');
INSERT INTO `order_goods` VALUES ('3', '駝背塑形矯正帶', '1', '108800', '108800', '3', '879');
INSERT INTO `order_goods` VALUES ('4', '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '1', '158800', '158800', '4', '273');
INSERT INTO `order_goods` VALUES ('5', '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '1', '158800', '158800', '5', '273');
INSERT INTO `order_goods` VALUES ('6', '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '1', '158800', '158800', '6', '273');
INSERT INTO `order_goods` VALUES ('7', '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '1', '158800', '158800', '7', '273');
INSERT INTO `order_goods` VALUES ('8', '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '1', '158800', '158800', '8', '273');
INSERT INTO `order_goods` VALUES ('9', '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '1', '158800', '158800', '9', '273');
INSERT INTO `order_goods` VALUES ('10', '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '1', '158800', '158800', '10', '273');

-- ----------------------------
-- Table structure for order_goods_attr
-- ----------------------------
DROP TABLE IF EXISTS `order_goods_attr`;
CREATE TABLE `order_goods_attr` (
  `order_goods_attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_goods_id` int(8) NOT NULL,
  `product_attr_id` int(8) NOT NULL,
  PRIMARY KEY (`order_goods_attr_id`),
  KEY `order_goods_id` (`order_goods_id`,`order_goods_attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_goods_attr
-- ----------------------------
INSERT INTO `order_goods_attr` VALUES ('1', '2', '59');
INSERT INTO `order_goods_attr` VALUES ('2', '2', '63');
INSERT INTO `order_goods_attr` VALUES ('3', '3', '86');
INSERT INTO `order_goods_attr` VALUES ('4', '4', '102');
INSERT INTO `order_goods_attr` VALUES ('5', '4', '114');
INSERT INTO `order_goods_attr` VALUES ('6', '5', '102');
INSERT INTO `order_goods_attr` VALUES ('7', '5', '114');
INSERT INTO `order_goods_attr` VALUES ('8', '6', '102');
INSERT INTO `order_goods_attr` VALUES ('9', '6', '114');
INSERT INTO `order_goods_attr` VALUES ('10', '7', '102');
INSERT INTO `order_goods_attr` VALUES ('11', '7', '114');
INSERT INTO `order_goods_attr` VALUES ('12', '8', '102');
INSERT INTO `order_goods_attr` VALUES ('13', '8', '114');
INSERT INTO `order_goods_attr` VALUES ('14', '9', '102');
INSERT INTO `order_goods_attr` VALUES ('15', '9', '114');
INSERT INTO `order_goods_attr` VALUES ('16', '10', '102');
INSERT INTO `order_goods_attr` VALUES ('17', '10', '114');

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(20) NOT NULL DEFAULT '',
  `account` varchar(255) NOT NULL DEFAULT '',
  `key` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`payment_id`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES ('1', 'yjf', '20160825020000752433', '05a29a66557ad2f3634534a940d3577c');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `erp_number` char(50) DEFAULT '',
  `ad_member_id` int(8) DEFAULT '0' COMMENT '广告手id',
  `id_zone` int(8) DEFAULT '0',
  `id_department` int(8) DEFAULT '0',
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
  `tips` varchar(255) DEFAULT '',
  PRIMARY KEY (`product_id`),
  KEY `theme` (`theme`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '日本UV紫外線綿の帽子', '日本UV紫外線綿の帽子', '日本UV紫外線綿の帽子', '<p>2</p>', '129900', '129900', '2017-03-14 09:05:06', '0', 'www.lkonq.com', 'RMB', '1', '￥', '0', '1000', '100', '', 'wnczxzd.com(jp)', 'TW', '1', '1', '5811', '9', '1', '1', '                                                 <script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/19042546.js\"></script><noscript><a href=\"http://www.51.la/?19042546\" target=\"_blank\"><img alt=\"我要啦免费统计\" src=\"http://img.users.51.la/19042546.asp\" style=\"border:none\" /></a></noscript>                                                   ', '2', '1', '', '0', 'Bello@lkonq.com', 'aaa', 0x202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020203C73637269707420747970653D22746578742F6A617661736372697074223E0A76617220676F6F676C655F636F6E76657273696F6E5F6964203D203836303332363834383B0A76617220676F6F676C655F636F6E76657273696F6E5F6C616E6775616765203D2022656E223B0A76617220676F6F676C655F636F6E76657273696F6E5F666F726D6174203D202233223B0A76617220676F6F676C655F636F6E76657273696F6E5F636F6C6F72203D2022666666666666223B0A76617220676F6F676C655F636F6E76657273696F6E5F6C6162656C203D2022456744784350696732323451774A65656D674D223B0A76617220676F6F676C655F72656D61726B6574696E675F6F6E6C79203D2066616C73653B0A3C2F7363726970743E3C73637269707420747970653D22746578742F6A61766173637269707422207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2E6A73223E3C2F7363726970743E3C6E6F7363726970743E3C646976207374796C653D22646973706C61793A696E6C696E653B223E3C696D67206865696768743D2231222077696474683D223122207374796C653D22626F726465722D7374796C653A6E6F6E653B2220616C743D2222207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2F3836303332363834382F3F6C6162656C3D456744784350696732323451774A65656D674D26677569643D4F4E267363726970743D30222F3E3C2F6469763E3C2F6E6F7363726970743E2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020, null, null, '');
INSERT INTO `product` VALUES ('2', '崙威堡爾品牌 夏日上新 專櫃驗貨 真皮男包 有型有範兒 防水耐磨', '崙威堡爾品牌 夏日上新 專櫃驗貨 真皮男包 有型有範兒 防水耐磨', '崙威堡爾品牌 夏日上新 專櫃驗貨 真皮男包 有型有範兒 防水耐磨', '', '158890', '158800', '2017-03-16 10:35:02', '0', 'www.lkonq.com', 'RMB', '1', '￥', '0', '1000', '100', '', 'Black(EN)', 'TW', null, null, '268', '1', '1', '1', '     <script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/19042546.js\"></script><noscript><a href=\"http://www.51.la/?19042546\" target=\"_blank\"><img alt=\"我要啦免费统计\" src=\"http://img.users.51.la/19042546.asp\" style=\"border:none\" /></a></noscript>       ', '2', '1', '', '0', 'Bello@lkonq.com', '', 0x20202020203C73637269707420747970653D22746578742F6A617661736372697074223E0D0A76617220676F6F676C655F636F6E76657273696F6E5F6964203D203836303332363834383B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C616E6775616765203D2022656E223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F666F726D6174203D202233223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F636F6C6F72203D2022666666666666223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C6162656C203D2022456744784350696732323451774A65656D674D223B0D0A76617220676F6F676C655F72656D61726B6574696E675F6F6E6C79203D2066616C73653B0D0A3C2F7363726970743E3C73637269707420747970653D22746578742F6A61766173637269707422207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2E6A73223E3C2F7363726970743E3C6E6F7363726970743E3C646976207374796C653D22646973706C61793A696E6C696E653B223E3C696D67206865696768743D2231222077696474683D223122207374796C653D22626F726465722D7374796C653A6E6F6E653B2220616C743D2222207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2F3836303332363834382F3F6C6162656C3D456744784350696732323451774A65656D674D26677569643D4F4E267363726970743D30222F3E3C2F6469763E3C2F6E6F7363726970743E202020202020, null, null, '');
INSERT INTO `product` VALUES ('3', 'DT-B650智能魔盒自拍神器手機迷你藍牙音箱', 'DT-B650智能魔盒自拍神器手機迷你藍牙音箱', 'DT-B650智能魔盒自拍神器手機迷你藍牙音箱', '', '138800', '138800', '2017-03-16 10:37:47', '0', 'www.lkonq.com', 'RMB', '1', '￥', '0', '1000', '100', '', 'Black(EN)', 'TW', null, null, '298', '1', '1', '1', '   <script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/19042546.js\"></script><noscript><a href=\"http://www.51.la/?19042546\" target=\"_blank\"><img alt=\"我要啦免费统计\" src=\"http://img.users.51.la/19042546.asp\" style=\"border:none\" /></a></noscript>     ', '2', '1', '', '0', 'Bello@lkonq.com', '544', 0x2020203C73637269707420747970653D22746578742F6A617661736372697074223E0D0A76617220676F6F676C655F636F6E76657273696F6E5F6964203D203836303332363834383B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C616E6775616765203D2022656E223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F666F726D6174203D202233223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F636F6C6F72203D2022666666666666223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C6162656C203D2022456744784350696732323451774A65656D674D223B0D0A76617220676F6F676C655F72656D61726B6574696E675F6F6E6C79203D2066616C73653B0D0A3C2F7363726970743E3C73637269707420747970653D22746578742F6A61766173637269707422207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2E6A73223E3C2F7363726970743E3C6E6F7363726970743E3C646976207374796C653D22646973706C61793A696E6C696E653B223E3C696D67206865696768743D2231222077696474683D223122207374796C653D22626F726465722D7374796C653A6E6F6E653B2220616C743D2222207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2F3836303332363834382F3F6C6162656C3D456744784350696732323451774A65656D674D26677569643D4F4E267363726970743D30222F3E3C2F6469763E3C2F6E6F7363726970743E20202020, null, null, '');
INSERT INTO `product` VALUES ('4', '特威斯Tevise全自動防水鏤空機械男士腕錶', '特威斯Tevise全自動防水鏤空機械男士腕錶', '特威斯Tevise全自動防水鏤空機械男士腕錶', '', '158800', '158800', '2017-03-16 10:39:39', '0', 'www.lkonq.com', '', '0', '', '0', '1000', '100', '', 'Black(EN)', 'TW', null, null, '267', '0', '0', '1', '     <script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/19042546.js\"></script><noscript><a href=\"http://www.51.la/?19042546\" target=\"_blank\"><img alt=\"我要啦免费统计\" src=\"http://img.users.51.la/19042546.asp\" style=\"border:none\" /></a></noscript>       ', '2', '1', '', '0', 'Bello@lkonq.com', 'jjj', 0x20202020203C73637269707420747970653D22746578742F6A617661736372697074223E0D0A76617220676F6F676C655F636F6E76657273696F6E5F6964203D203836303332363834383B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C616E6775616765203D2022656E223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F666F726D6174203D202233223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F636F6C6F72203D2022666666666666223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C6162656C203D2022456744784350696732323451774A65656D674D223B0D0A76617220676F6F676C655F72656D61726B6574696E675F6F6E6C79203D2066616C73653B0D0A3C2F7363726970743E3C73637269707420747970653D22746578742F6A61766173637269707422207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2E6A73223E3C2F7363726970743E3C6E6F7363726970743E3C646976207374796C653D22646973706C61793A696E6C696E653B223E3C696D67206865696768743D2231222077696474683D223122207374796C653D22626F726465722D7374796C653A6E6F6E653B2220616C743D2222207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2F3836303332363834382F3F6C6162656C3D456744784350696732323451774A65656D674D26677569643D4F4E267363726970743D30222F3E3C2F6469763E3C2F6E6F7363726970743E202020202020, null, null, '');
INSERT INTO `product` VALUES ('5', 'Charles Keith時尚真皮爆款女包', 'Charles Keith時尚真皮爆款女包', 'Charles Keith時尚真皮爆款女包', '', '158800', '158800', '2017-03-16 10:53:36', '0', 'www.lkonq.com', 'RMB', '1', '￥', '0', '1000', '100', '', 'style6', 'TW', null, null, '297', '1', '1', '1', '   <script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/19042546.js\"></script><noscript><a href=\"http://www.51.la/?19042546\" target=\"_blank\"><img alt=\"我要啦免费统计\" src=\"http://img.users.51.la/19042546.asp\" style=\"border:none\" /></a></noscript>     ', '2', '1', '', '0', 'Bello@lkonq.com', '888', 0x2020203C73637269707420747970653D22746578742F6A617661736372697074223E0D0A76617220676F6F676C655F636F6E76657273696F6E5F6964203D203836303332363834383B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C616E6775616765203D2022656E223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F666F726D6174203D202233223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F636F6C6F72203D2022666666666666223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C6162656C203D2022456744784350696732323451774A65656D674D223B0D0A76617220676F6F676C655F72656D61726B6574696E675F6F6E6C79203D2066616C73653B0D0A3C2F7363726970743E3C73637269707420747970653D22746578742F6A61766173637269707422207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2E6A73223E3C2F7363726970743E3C6E6F7363726970743E3C646976207374796C653D22646973706C61793A696E6C696E653B223E3C696D67206865696768743D2231222077696474683D223122207374796C653D22626F726465722D7374796C653A6E6F6E653B2220616C743D2222207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2F3836303332363834382F3F6C6162656C3D456744784350696732323451774A65656D674D26677569643D4F4E267363726970743D30222F3E3C2F6469763E3C2F6E6F7363726970743E20202020, null, null, '');
INSERT INTO `product` VALUES ('6', '2016新款歐美大牌復古菱格單肩包', '2016新款歐美大牌復古菱格單肩包', '2016新款歐美大牌復古菱格單肩包', '', '158800', '158800', '2017-03-16 10:57:09', '0', 'www.lkonq.com', 'RMB', '1', '￥', '0', '1000', '100', '', 'style6', 'TW', null, '1', '333', '1', '1', '1', '   <script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/19042546.js\"></script><noscript><a href=\"http://www.51.la/?19042546\" target=\"_blank\"><img alt=\"我要啦免费统计\" src=\"http://img.users.51.la/19042546.asp\" style=\"border:none\" /></a></noscript>     ', '2', '1', '', '0', 'Bello@lkonq.com', 'aaa', 0x2020203C73637269707420747970653D22746578742F6A617661736372697074223E0D0A76617220676F6F676C655F636F6E76657273696F6E5F6964203D203836303332363834383B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C616E6775616765203D2022656E223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F666F726D6174203D202233223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F636F6C6F72203D2022666666666666223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C6162656C203D2022456744784350696732323451774A65656D674D223B0D0A76617220676F6F676C655F72656D61726B6574696E675F6F6E6C79203D2066616C73653B0D0A3C2F7363726970743E3C73637269707420747970653D22746578742F6A61766173637269707422207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2E6A73223E3C2F7363726970743E3C6E6F7363726970743E3C646976207374796C653D22646973706C61793A696E6C696E653B223E3C696D67206865696768743D2231222077696474683D223122207374796C653D22626F726465722D7374796C653A6E6F6E653B2220616C743D2222207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2F3836303332363834382F3F6C6162656C3D456744784350696732323451774A65656D674D26677569643D4F4E267363726970743D30222F3E3C2F6469763E3C2F6E6F7363726970743E20202020, null, null, '');
INSERT INTO `product` VALUES ('7', '雙爾健男女通用懶人自動回彈式靜音雙巨輪健腹輪', '雙爾健男女通用懶人自動回彈式靜音雙巨輪健腹輪', '雙爾健男女通用懶人自動回彈式靜音雙巨輪健腹輪', '', '138000', '138000', '2017-03-16 11:18:06', '0', 'www.lkonq.com', 'RMB', '1', '￥', '0', '1000', '100', '', 'style7', 'TW', null, null, '789', '1', '1', '1', '     <script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/19042546.js\"></script><noscript><a href=\"http://www.51.la/?19042546\" target=\"_blank\"><img alt=\"我要啦免费统计\" src=\"http://img.users.51.la/19042546.asp\" style=\"border:none\" /></a></noscript>       ', '2', '1', '', '0', 'Bello@lkonq.com', 'klk', 0x20202020203C73637269707420747970653D22746578742F6A617661736372697074223E0D0A76617220676F6F676C655F636F6E76657273696F6E5F6964203D203836303332363834383B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C616E6775616765203D2022656E223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F666F726D6174203D202233223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F636F6C6F72203D2022666666666666223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C6162656C203D2022456744784350696732323451774A65656D674D223B0D0A76617220676F6F676C655F72656D61726B6574696E675F6F6E6C79203D2066616C73653B0D0A3C2F7363726970743E3C73637269707420747970653D22746578742F6A61766173637269707422207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2E6A73223E3C2F7363726970743E3C6E6F7363726970743E3C646976207374796C653D22646973706C61793A696E6C696E653B223E3C696D67206865696768743D2231222077696474683D223122207374796C653D22626F726465722D7374796C653A6E6F6E653B2220616C743D2222207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2F3836303332363834382F3F6C6162656C3D456744784350696732323451774A65656D674D26677569643D4F4E267363726970743D30222F3E3C2F6469763E3C2F6E6F7363726970743E202020202020, null, null, '');
INSERT INTO `product` VALUES ('8', 'DREAL止鼾戒指', 'DREAL止鼾戒指', 'DREAL止鼾戒指', '', '169900', '169900', '2017-03-16 11:39:10', '0', 'www.lkonq.com', 'RMB', '1', '￥', '0', '1000', '100', '', 'style5+timer', 'TW', null, null, '465', '1', '1', '1', '     <script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/19042546.js\"></script><noscript><a href=\"http://www.51.la/?19042546\" target=\"_blank\"><img alt=\"我要啦免费统计\" src=\"http://img.users.51.la/19042546.asp\" style=\"border:none\" /></a></noscript>       ', '2', '1', '', '0', 'Bello@lkonq.com', 'rrr', 0x20202020203C73637269707420747970653D22746578742F6A617661736372697074223E0D0A76617220676F6F676C655F636F6E76657273696F6E5F6964203D203836303332363834383B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C616E6775616765203D2022656E223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F666F726D6174203D202233223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F636F6C6F72203D2022666666666666223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C6162656C203D2022456744784350696732323451774A65656D674D223B0D0A76617220676F6F676C655F72656D61726B6574696E675F6F6E6C79203D2066616C73653B0D0A3C2F7363726970743E3C73637269707420747970653D22746578742F6A61766173637269707422207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2E6A73223E3C2F7363726970743E3C6E6F7363726970743E3C646976207374796C653D22646973706C61793A696E6C696E653B223E3C696D67206865696768743D2231222077696474683D223122207374796C653D22626F726465722D7374796C653A6E6F6E653B2220616C743D2222207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2F3836303332363834382F3F6C6162656C3D456744784350696732323451774A65656D674D26677569643D4F4E267363726970743D30222F3E3C2F6469763E3C2F6E6F7363726970743E202020202020, null, null, '');
INSERT INTO `product` VALUES ('9', '2016秋冬爆款加羊絨牛皮靴44', '2016秋冬爆款加羊絨牛皮靴44', '2016秋冬爆款加羊絨牛皮靴444', '', '158800', '158800', '2017-03-16 12:27:30', '0', 'www.lkonq.com', 'RMB', '1', '￥', '0', '1000', '100', '', 'style6', 'TW', null, null, '877', '9', '1', '1', '                               <script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/19042546.js\"></script><noscript><a href=\"http://www.51.la/?19042546\" target=\"_blank\"><img alt=\"我要啦免费统计\" src=\"http://img.users.51.la/19042546.asp\" style=\"border:none\" /></a></noscript>                                 ', '2', '1', '', '0', 'Bello@lkonq.com', 'lll', 0x202020202020202020202020202020202020202020202020202020202020203C73637269707420747970653D22746578742F6A617661736372697074223E0D0A76617220676F6F676C655F636F6E76657273696F6E5F6964203D203836303332363834383B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C616E6775616765203D2022656E223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F666F726D6174203D202233223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F636F6C6F72203D2022666666666666223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C6162656C203D2022456744784350696732323451774A65656D674D223B0D0A76617220676F6F676C655F72656D61726B6574696E675F6F6E6C79203D2066616C73653B0D0A3C2F7363726970743E3C73637269707420747970653D22746578742F6A61766173637269707422207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2E6A73223E3C2F7363726970743E3C6E6F7363726970743E3C646976207374796C653D22646973706C61793A696E6C696E653B223E3C696D67206865696768743D2231222077696474683D223122207374796C653D22626F726465722D7374796C653A6E6F6E653B2220616C743D2222207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2F3836303332363834382F3F6C6162656C3D456744784350696732323451774A65656D674D26677569643D4F4E267363726970743D30222F3E3C2F6469763E3C2F6E6F7363726970743E2020202020202020202020202020202020202020202020202020202020202020, null, null, '');
INSERT INTO `product` VALUES ('10', '全金屬機身鋰電池空中飛鼠', '全金屬機身鋰電池空中飛鼠', '全金屬機身鋰電池空中飛鼠', '<p>453245</p>', '189900', '189900', '2017-03-17 08:51:28', '0', 'www.lkonq.com', 'RMB', '1', '￥', '0', '1000', '100', '', 'style5+timer', 'TW', null, null, '999', '9', '1', '1', '                   <script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/19042546.js\"></script><noscript><a href=\"http://www.51.la/?19042546\" target=\"_blank\"><img alt=\"我要啦免费统计\" src=\"http://img.users.51.la/19042546.asp\" style=\"border:none\" /></a></noscript>                     ', '55', '1', '', '0', 'Bello@lkonq.com', 'hhh', 0x202020202020202020202020202020202020203C73637269707420747970653D22746578742F6A617661736372697074223E0D0A76617220676F6F676C655F636F6E76657273696F6E5F6964203D203836303332363834383B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C616E6775616765203D2022656E223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F666F726D6174203D202233223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F636F6C6F72203D2022666666666666223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C6162656C203D2022456744784350696732323451774A65656D674D223B0D0A76617220676F6F676C655F72656D61726B6574696E675F6F6E6C79203D2066616C73653B0D0A3C2F7363726970743E3C73637269707420747970653D22746578742F6A61766173637269707422207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2E6A73223E3C2F7363726970743E3C6E6F7363726970743E3C646976207374796C653D22646973706C61793A696E6C696E653B223E3C696D67206865696768743D2231222077696474683D223122207374796C653D22626F726465722D7374796C653A6E6F6E653B2220616C743D2222207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2F3836303332363834382F3F6C6162656C3D456744784350696732323451774A65656D674D26677569643D4F4E267363726970743D30222F3E3C2F6469763E3C2F6E6F7363726970743E2020202020202020202020202020202020202020, null, null, '');
INSERT INTO `product` VALUES ('11', 'DT-B650智能魔盒自拍神器手機迷你藍牙音箱', 'DT-B650智能魔盒自拍神器手機迷你藍牙音箱', 'DT-B650智能魔盒自拍神器手機迷你藍牙音箱', '', '138800', '138800', '2017-03-20 12:51:51', '0', 'www.lkonq.com', 'RMB', '1', '￥', '0', '1000', '100', '', 'style6', 'TW', null, '1', '298', '1', '1', '1', '   <script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/19042546.js\"></script><noscript><a href=\"http://www.51.la/?19042546\" target=\"_blank\"><img alt=\"我要啦免费统计\" src=\"http://img.users.51.la/19042546.asp\" style=\"border:none\" /></a></noscript>     ', '2', '1', '', '0', 'Bello@lkonq.com', 'tjuyuj', 0x2020203C73637269707420747970653D22746578742F6A617661736372697074223E0D0A76617220676F6F676C655F636F6E76657273696F6E5F6964203D203836303332363834383B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C616E6775616765203D2022656E223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F666F726D6174203D202233223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F636F6C6F72203D2022666666666666223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C6162656C203D2022456744784350696732323451774A65656D674D223B0D0A76617220676F6F676C655F72656D61726B6574696E675F6F6E6C79203D2066616C73653B0D0A3C2F7363726970743E3C73637269707420747970653D22746578742F6A61766173637269707422207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2E6A73223E3C2F7363726970743E3C6E6F7363726970743E3C646976207374796C653D22646973706C61793A696E6C696E653B223E3C696D67206865696768743D2231222077696474683D223122207374796C653D22626F726465722D7374796C653A6E6F6E653B2220616C743D2222207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2F3836303332363834382F3F6C6162656C3D456744784350696732323451774A65656D674D26677569643D4F4E267363726970743D30222F3E3C2F6469763E3C2F6E6F7363726970743E20202020, null, null, '');
INSERT INTO `product` VALUES ('12', '電子煙', '電子煙', '電子煙', '<p>22</p>', '158800', '158800', '2017-03-20 12:55:29', '1', 'www.zgrud.com', 'RMB', '1', '￥', '0', '1000', '100', '', 'style8(en)', 'TW', null, '1', '6377', '1', '1', '1', '       <script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/19042546.js\"></script><noscript><a href=\"http://www.51.la/?19042546\" target=\"_blank\"><img alt=\"我要啦免费统计\" src=\"http://img.users.51.la/19042546.asp\" style=\"border:none\" /></a></noscript>         ', '2', '1', '', '0', 'Bello@zgrud.com', 'klll', 0x202020202020203C73637269707420747970653D22746578742F6A617661736372697074223E0D0A76617220676F6F676C655F636F6E76657273696F6E5F6964203D203836303332363834383B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C616E6775616765203D2022656E223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F666F726D6174203D202233223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F636F6C6F72203D2022666666666666223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C6162656C203D2022456744784350696732323451774A65656D674D223B0D0A76617220676F6F676C655F72656D61726B6574696E675F6F6E6C79203D2066616C73653B0D0A3C2F7363726970743E3C73637269707420747970653D22746578742F6A61766173637269707422207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2E6A73223E3C2F7363726970743E3C6E6F7363726970743E3C646976207374796C653D22646973706C61793A696E6C696E653B223E3C696D67206865696768743D2231222077696474683D223122207374796C653D22626F726465722D7374796C653A6E6F6E653B2220616C743D2222207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2F3836303332363834382F3F6C6162656C3D456744784350696732323451774A65656D674D26677569643D4F4E267363726970743D30222F3E3C2F6469763E3C2F6E6F7363726970743E2020202020202020, null, null, '');
INSERT INTO `product` VALUES ('13', '日本OSEWAYA現貨星球宇宙月亮珍珠耳釘套裝', '日本OSEWAYA現貨星球宇宙月亮珍珠耳釘套裝', '日本OSEWAYA現貨星球宇宙月亮珍珠耳釘套裝', '', '99900', '99900', '2017-03-20 12:58:59', '1', 'www.zgrud.com', 'RMB', '1', '￥', '0', '1000', '100', '', 'style6', 'TW', null, '1', '689', '1', '1', '1', ' <script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/19042546.js\"></script><noscript><a href=\"http://www.51.la/?19042546\" target=\"_blank\"><img alt=\"我要啦免费统计\" src=\"http://img.users.51.la/19042546.asp\" style=\"border:none\" /></a></noscript>   ', '2', '1', '', '0', 'Bello@zgrud.com', 'hhhh', 0x203C73637269707420747970653D22746578742F6A617661736372697074223E0D0A76617220676F6F676C655F636F6E76657273696F6E5F6964203D203836303332363834383B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C616E6775616765203D2022656E223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F666F726D6174203D202233223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F636F6C6F72203D2022666666666666223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C6162656C203D2022456744784350696732323451774A65656D674D223B0D0A76617220676F6F676C655F72656D61726B6574696E675F6F6E6C79203D2066616C73653B0D0A3C2F7363726970743E3C73637269707420747970653D22746578742F6A61766173637269707422207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2E6A73223E3C2F7363726970743E3C6E6F7363726970743E3C646976207374796C653D22646973706C61793A696E6C696E653B223E3C696D67206865696768743D2231222077696474683D223122207374796C653D22626F726465722D7374796C653A6E6F6E653B2220616C743D2222207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2F3836303332363834382F3F6C6162656C3D456744784350696732323451774A65656D674D26677569643D4F4E267363726970743D30222F3E3C2F6469763E3C2F6E6F7363726970743E2020, null, null, '');
INSERT INTO `product` VALUES ('14', '駝背塑形矯正帶', '駝背塑形矯正帶', '駝背塑形矯正帶', '', '108800', '108800', '2017-03-20 12:59:56', '0', 'www.lkonq.com', 'RMB', '1', '￥', '0', '1000', '100', '/upload/style6/thumb/17-03-21/1489487626612868.gif', 'style6', 'TW', null, '1', '879', '1', '1', '1', '         <script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/19042546.js\"></script><noscript><a href=\"http://www.51.la/?19042546\" target=\"_blank\"><img alt=\"我要啦免费统计\" src=\"http://img.users.51.la/19042546.asp\" style=\"border:none\" /></a></noscript>           ', '2', '1', '/upload/style6/thumb/17-03-21/1489487626494174.gif', '0', 'Bello@lkonq.com', 'kjkss', 0x2020202020202020203C73637269707420747970653D22746578742F6A617661736372697074223E0D0A76617220676F6F676C655F636F6E76657273696F6E5F6964203D203836303332363834383B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C616E6775616765203D2022656E223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F666F726D6174203D202233223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F636F6C6F72203D2022666666666666223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C6162656C203D2022456744784350696732323451774A65656D674D223B0D0A76617220676F6F676C655F72656D61726B6574696E675F6F6E6C79203D2066616C73653B0D0A3C2F7363726970743E3C73637269707420747970653D22746578742F6A61766173637269707422207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2E6A73223E3C2F7363726970743E3C6E6F7363726970743E3C646976207374796C653D22646973706C61793A696E6C696E653B223E3C696D67206865696768743D2231222077696474683D223122207374796C653D22626F726465722D7374796C653A6E6F6E653B2220616C743D2222207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2F3836303332363834382F3F6C6162656C3D456744784350696732323451774A65656D674D26677569643D4F4E267363726970743D30222F3E3C2F6469763E3C2F6E6F7363726970743E20202020202020202020, null, null, '');
INSERT INTO `product` VALUES ('15', 'DT-B650智能魔盒自拍神器手機迷你藍牙音箱', 'DT-B650智能魔盒自拍神器手機迷你藍牙音箱', 'DT-B650智能魔盒自拍神器手機迷你藍牙音箱', '', '138800', '138800', '2017-03-23 04:12:28', '0', 'www.bzlga.com', 'RMB', '1', '￥', '0', '1000', '100', '', 'Black(EN)', 'TW', null, null, '298', '1', '1', '1', '       <script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/19042546.js\"></script><noscript><a href=\"http://www.51.la/?19042546\" target=\"_blank\"><img alt=\"我要啦免费统计\" src=\"http://img.users.51.la/19042546.asp\" style=\"border:none\" /></a></noscript>         ', '288', '1', '', '0', 'Bello@bzlga.com', '', 0x202020202020203C73637269707420747970653D22746578742F6A617661736372697074223E0D0A76617220676F6F676C655F636F6E76657273696F6E5F6964203D203836303332363834383B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C616E6775616765203D2022656E223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F666F726D6174203D202233223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F636F6C6F72203D2022666666666666223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C6162656C203D2022456744784350696732323451774A65656D674D223B0D0A76617220676F6F676C655F72656D61726B6574696E675F6F6E6C79203D2066616C73653B0D0A3C2F7363726970743E3C73637269707420747970653D22746578742F6A61766173637269707422207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2E6A73223E3C2F7363726970743E3C6E6F7363726970743E3C646976207374796C653D22646973706C61793A696E6C696E653B223E3C696D67206865696768743D2231222077696474683D223122207374796C653D22626F726465722D7374796C653A6E6F6E653B2220616C743D2222207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2F3836303332363834382F3F6C6162656C3D456744784350696732323451774A65656D674D26677569643D4F4E267363726970743D30222F3E3C2F6469763E3C2F6E6F7363726970743E2020202020202020, 0x20202020202020202020202020203C73637269707420747970653D22746578742F6A617661736372697074223E0D0A76617220676F6F676C655F636F6E76657273696F6E5F6964203D203836303332363834383B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C616E6775616765203D2022656E223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F666F726D6174203D202233223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F636F6C6F72203D2022666666666666223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C6162656C203D2022456744784350696732323451774A65656D674D223B0D0A76617220676F6F676C655F72656D61726B6574696E675F6F6E6C79203D2066616C73653B0D0A3C2F7363726970743E3C73637269707420747970653D22746578742F6A61766173637269707422207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2E6A73223E3C2F7363726970743E3C6E6F7363726970743E3C646976207374796C653D22646973706C61793A696E6C696E653B223E3C696D67206865696768743D2231222077696474683D223122207374796C653D22626F726465722D7374796C653A6E6F6E653B2220616C743D2222207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2F3836303332363834382F3F6C6162656C3D456744784350696732323451774A65656D674D26677569643D4F4E267363726970743D30222F3E3C2F6469763E3C2F6E6F7363726970743E2020202020202020, 0x20202032, '');
INSERT INTO `product` VALUES ('16', 'NARY 全智能藍牙通話腕錶-通用版', 'NARY 全智能藍牙通話腕錶-通用版', 'NARY 全智能藍牙通話腕錶-通用版', '', '155800', '155800', '2017-03-24 04:30:52', '0', 'www.bzlga.com', 'RMB', '1', '￥', '0', '1000', '100', '', 'style6', 'TW', null, null, '287', '1', '1', '1', ' <script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/19042546.js\"></script><noscript><a href=\"http://www.51.la/?19042546\" target=\"_blank\"><img alt=\"我要啦免费统计\" src=\"http://img.users.51.la/19042546.asp\" style=\"border:none\" /></a></noscript>   ', '2', '6', '', '0', 'Bello@bzlga.com', 'aaa', 0x203C73637269707420747970653D22746578742F6A617661736372697074223E0D0A76617220676F6F676C655F636F6E76657273696F6E5F6964203D203836303332363834383B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C616E6775616765203D2022656E223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F666F726D6174203D202233223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F636F6C6F72203D2022666666666666223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C6162656C203D2022456744784350696732323451774A65656D674D223B0D0A76617220676F6F676C655F72656D61726B6574696E675F6F6E6C79203D2066616C73653B0D0A3C2F7363726970743E3C73637269707420747970653D22746578742F6A61766173637269707422207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2E6A73223E3C2F7363726970743E3C6E6F7363726970743E3C646976207374796C653D22646973706C61793A696E6C696E653B223E3C696D67206865696768743D2231222077696474683D223122207374796C653D22626F726465722D7374796C653A6E6F6E653B2220616C743D2222207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2F3836303332363834382F3F6C6162656C3D456744784350696732323451774A65656D674D26677569643D4F4E267363726970743D30222F3E3C2F6469763E3C2F6E6F7363726970743E2020, 0x202020, 0x202020, '');
INSERT INTO `product` VALUES ('17', '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '厚薄款刺繡性感調整型文胸 女士按摩聚攏內衣胸罩品牌', '', '158800', '158800', '2017-03-24 04:32:14', '0', 'www.lkonq.com', 'RMB', '1', '￥', '0', '1000', '100', '', 'style6', 'TW', null, null, '273', '1', '1', '1', '     <script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/19042546.js\"></script><noscript><a href=\"http://www.51.la/?19042546\" target=\"_blank\"><img alt=\"我要啦免费统计\" src=\"http://img.users.51.la/19042546.asp\" style=\"border:none\" /></a></noscript>       ', '2', '6', '', '0', 'Bello@lkonq.com', 'hhhhhhh', 0x20202020203C73637269707420747970653D22746578742F6A617661736372697074223E0D0A76617220676F6F676C655F636F6E76657273696F6E5F6964203D203836303332363834383B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C616E6775616765203D2022656E223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F666F726D6174203D202233223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F636F6C6F72203D2022666666666666223B0D0A76617220676F6F676C655F636F6E76657273696F6E5F6C6162656C203D2022456744784350696732323451774A65656D674D223B0D0A76617220676F6F676C655F72656D61726B6574696E675F6F6E6C79203D2066616C73653B0D0A3C2F7363726970743E3C73637269707420747970653D22746578742F6A61766173637269707422207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2E6A73223E3C2F7363726970743E3C6E6F7363726970743E3C646976207374796C653D22646973706C61793A696E6C696E653B223E3C696D67206865696768743D2231222077696474683D223122207374796C653D22626F726465722D7374796C653A6E6F6E653B2220616C743D2222207372633D222F2F7777772E676F6F676C65616473657276696365732E636F6D2F7061676561642F636F6E76657273696F6E2F3836303332363834382F3F6C6162656C3D456744784350696732323451774A65656D674D26677569643D4F4E267363726970743D30222F3E3C2F6469763E3C2F6E6F7363726970743E202020202020, 0x2020202020202020202020, 0x2020202020202020202020, '');
INSERT INTO `product` VALUES ('18', 'st', 'a', 'a', '<p>asdasd</p>', '100', '200', '2017-04-07 13:35:42', '0', 'www.test.com', 'TWD', '1', 'NT$', '5000', '100', '3', '/upload/style6/thumb/17-04-07/1491543342_16.jpg', 'style6', 'TW', null, '1', '', null, null, '0', ' <script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/19042546.js\"></script><noscript><a href=\"http://www.51.la/?19042546\" target=\"_blank\"><img alt=\"我要啦免费统计\" src=\"http://img.users.51.la/19042546.asp\" style=\"border:none\" /></a></noscript>   ', 'asdgasdga', '5', '/upload/style6/thumb/17-04-07/1491543342_16.jpg', '0', 'aa@qq.com', 'test', null, null, null, 'ads');
INSERT INTO `product` VALUES ('19', 'st', 'a', 'a', '<p>asdasd</p>', '100', '200', '2017-04-07 13:37:00', '0', 'www.shop.com', 'TWD', '1', 'NT$', '5000', '100', '3', '/upload/style6/thumb/17-04-07/1491543420_16.jpg', 'style6', 'TW', null, '1', '', null, null, '0', ' <script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/19042546.js\"></script><noscript><a href=\"http://www.51.la/?19042546\" target=\"_blank\"><img alt=\"我要啦免费统计\" src=\"http://img.users.51.la/19042546.asp\" style=\"border:none\" /></a></noscript>   ', 'asdgasdga', '5', '/upload/style6/thumb/17-04-07/1491543420_16.jpg', '0', 'aa@qq.com', 'test123', null, null, null, 'ads');

-- ----------------------------
-- Table structure for product_attr
-- ----------------------------
DROP TABLE IF EXISTS `product_attr`;
CREATE TABLE `product_attr` (
  `product_attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) NOT NULL DEFAULT '0',
  `attr_group_id` int(8) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `price` int(8) DEFAULT '0',
  `thumb` varchar(255) DEFAULT NULL,
  `sort` tinyint(1) NOT NULL DEFAULT '0',
  `price_prefix` tinyint(1) DEFAULT '1',
  `number` char(20) NOT NULL DEFAULT '',
  `attr_group_title` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`product_attr_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_attr
-- ----------------------------
INSERT INTO `product_attr` VALUES ('1', '1', '6657', '淺米色', '0', null, '0', '1', '26103', '顏色');
INSERT INTO `product_attr` VALUES ('2', '1', '6657', '淡粉色', '0', null, '0', '1', '26105', '顏色');
INSERT INTO `product_attr` VALUES ('3', '1', '6657', '墨綠色', '0', null, '0', '1', '26107', '顏色');
INSERT INTO `product_attr` VALUES ('4', '1', '6657', '淺藍色', '0', null, '0', '1', '26109', '顏色');
INSERT INTO `product_attr` VALUES ('6', '1', '6657', '海藍色', '0', null, '0', '1', '26113', '顏色');
INSERT INTO `product_attr` VALUES ('7', '1', '6657', '軍綠色', '0', null, '0', '1', '26115', '顏色');
INSERT INTO `product_attr` VALUES ('8', '1', '6657', '卡其色', '0', null, '0', '1', '26117', '顏色');
INSERT INTO `product_attr` VALUES ('9', '1', '6657', '黑色', '0', null, '0', '1', '26119', '顏色');
INSERT INTO `product_attr` VALUES ('13', '1', '0', '大红', '0', null, '0', '1', '26111', '颜色');
INSERT INTO `product_attr` VALUES ('14', '1', '0', '大黑', '0', null, '0', '1', '26222', '颜色');
INSERT INTO `product_attr` VALUES ('15', '1', '6657', '大红黑', '0', null, '0', '1', '26333', '颜色');
INSERT INTO `product_attr` VALUES ('18', '2', '314', '棕色', '0', null, '0', '1', '1310', '颜色');
INSERT INTO `product_attr` VALUES ('19', '2', '16', '大红', '0', null, '0', '1', '1311', '');
INSERT INTO `product_attr` VALUES ('20', '2', '314', '大黑', '0', null, '0', '1', '1358', '颜色');
INSERT INTO `product_attr` VALUES ('21', '3', '2032', '天藍色', '0', null, '0', '1', '8595', '音响颜色');
INSERT INTO `product_attr` VALUES ('22', '3', '2032', '天藍色', '0', null, '0', '1', '8595', '音响颜色');
INSERT INTO `product_attr` VALUES ('23', '3', '2032', '白色', '0', null, '0', '1', '8596', '音响颜色');
INSERT INTO `product_attr` VALUES ('24', '3', '2032', '粉紅色', '0', null, '0', '1', '8597', '音响颜色');
INSERT INTO `product_attr` VALUES ('25', '3', '2032', '紫色', '0', null, '0', '1', '8598', '音响颜色');
INSERT INTO `product_attr` VALUES ('26', '3', '2032', '黑色', '0', null, '0', '1', '8599', '音响颜色');
INSERT INTO `product_attr` VALUES ('28', '4', '1998', '間金金', '0', null, '0', '1', '8426', '手表颜色');
INSERT INTO `product_attr` VALUES ('29', '4', '1998', '間金金', '0', null, '0', '1', '8426', '手表颜色');
INSERT INTO `product_attr` VALUES ('30', '4', '1998', '間金白', '0', null, '0', '1', '8427', '手表颜色');
INSERT INTO `product_attr` VALUES ('31', '4', '1998', '間金黑', '0', null, '0', '1', '8428', '手表颜色');
INSERT INTO `product_attr` VALUES ('32', '4', '1998', '銀色白', '0', null, '0', '1', '8429', '手表颜色');
INSERT INTO `product_attr` VALUES ('33', '4', '1998', '銀色黑', '0', null, '0', '1', '8430', '手表颜色');
INSERT INTO `product_attr` VALUES ('34', '4', '28', '红色', '0', null, '0', '1', '8431', '');
INSERT INTO `product_attr` VALUES ('35', '4', '2000', '大白', '0', null, '0', '1', '8450', '手表颜色');
INSERT INTO `product_attr` VALUES ('36', '4', '4000', '尊享黑', '0', null, '0', '1', '8451', '手表颜色');
INSERT INTO `product_attr` VALUES ('37', '5', '2031', '黑色', '0', null, '0', '1', '8590', '包包颜色');
INSERT INTO `product_attr` VALUES ('38', '5', '2031', '白色', '0', null, '0', '1', '8591', '包包颜色');
INSERT INTO `product_attr` VALUES ('39', '5', '2031', '紅色', '0', null, '0', '1', '8592', '包包颜色');
INSERT INTO `product_attr` VALUES ('40', '5', '2031', '金色', '0', null, '0', '1', '8593', '包包颜色');
INSERT INTO `product_attr` VALUES ('41', '5', '2031', '藍綠色', '0', null, '0', '1', '8594', '包包颜色');
INSERT INTO `product_attr` VALUES ('42', '5', '2031', '尊享黑', '0', null, '0', '1', '8598', '包包颜色');
INSERT INTO `product_attr` VALUES ('43', '6', '2065', '黑色', '0', null, '0', '1', '8774', '包包颜色');
INSERT INTO `product_attr` VALUES ('44', '6', '2065', '酒紅色', '0', null, '0', '1', '8775', '包包颜色');
INSERT INTO `product_attr` VALUES ('45', '6', '2065', '粉紅色', '0', null, '0', '1', '8776', '包包颜色');
INSERT INTO `product_attr` VALUES ('46', '6', '2065', '尊享黑', '0', null, '0', '1', '8888', '包包颜色');
INSERT INTO `product_attr` VALUES ('47', '6', '2065', '尊享白', '0', null, '0', '1', '9999', '包包颜色');
INSERT INTO `product_attr` VALUES ('48', '7', '888', '可回彈式健腹輪', '0', null, '0', '1', '3744', '健腹輪');
INSERT INTO `product_attr` VALUES ('49', '7', '888', '不可回彈式健腹輪', '0', null, '0', '1', '3745', '健腹輪');
INSERT INTO `product_attr` VALUES ('50', '7', '888', '黑色', '0', null, '0', '1', '888', '颜色');
INSERT INTO `product_attr` VALUES ('51', '8', '851', '清晰自然妝盒（贈送護手霜）', '0', null, '0', '1', '3593', '彩妝五件套');
INSERT INTO `product_attr` VALUES ('52', '8', '851', '優雅淑女裝盒（贈送護手霜）', '0', null, '0', '1', '3594', '彩妝五件套');
INSERT INTO `product_attr` VALUES ('53', '8', '851', '浪漫桃花裝盒（贈送護手霜）', '0', null, '0', '1', '3595', '彩妝五件套');
INSERT INTO `product_attr` VALUES ('54', '8', '509', '白金色', '0', null, '0', '1', '2175', '戒指顏色');
INSERT INTO `product_attr` VALUES ('55', '8', '509', '玫瑰金', '0', null, '0', '1', '2176', '戒指顏色');
INSERT INTO `product_attr` VALUES ('56', '8', '509', '金黃色', '0', null, '0', '1', '2177', '戒指顏色');
INSERT INTO `product_attr` VALUES ('58', '8', '509', '尊享白', '0', null, '0', '1', '2189', '戒指顏色');
INSERT INTO `product_attr` VALUES ('59', '9', '1002', '酒紅', '0', null, '0', '1', '4134', '女鞋顏色');
INSERT INTO `product_attr` VALUES ('60', '9', '1002', '黑色', '0', null, '0', '1', '4135', '女鞋顏色');
INSERT INTO `product_attr` VALUES ('61', '9', '1002', '灰色', '0', null, '0', '1', '4136', '女鞋顏色');
INSERT INTO `product_attr` VALUES ('62', '9', '1002', '棕色', '0', null, '0', '1', '4137', '女鞋顏色');
INSERT INTO `product_attr` VALUES ('63', '9', '1003', '標準鞋碼-35', '0', null, '0', '1', '4138', '女鞋');
INSERT INTO `product_attr` VALUES ('64', '9', '1003', '標準鞋碼-36', '0', null, '0', '1', '4139', '女鞋');
INSERT INTO `product_attr` VALUES ('65', '9', '1003', '標準鞋碼-37', '0', null, '0', '1', '4140', '女鞋');
INSERT INTO `product_attr` VALUES ('66', '9', '1003', '標準鞋碼-38', '0', null, '0', '1', '4141', '女鞋');
INSERT INTO `product_attr` VALUES ('67', '9', '1003', '標準鞋碼-39', '0', null, '0', '1', '4142', '女鞋');
INSERT INTO `product_attr` VALUES ('68', '9', '1003', '標準鞋碼-40', '0', null, '0', '1', '4143', '女鞋');
INSERT INTO `product_attr` VALUES ('69', '9', '1003', '標準鞋碼-41', '0', null, '0', '1', '4144', '女鞋');
INSERT INTO `product_attr` VALUES ('70', '3', '2032', '东北银', '0', null, '0', '1', '8600', '音响颜色');
INSERT INTO `product_attr` VALUES ('71', '10', '1153', '太空黑', '0', null, '0', '1', '4752', '產品顏色');
INSERT INTO `product_attr` VALUES ('72', '10', '1153', '珍珠白', '0', null, '0', '1', '4753', '產品顏色');
INSERT INTO `product_attr` VALUES ('73', '11', '2032', '天藍色', '0', null, '0', '1', '8595', '音响颜色');
INSERT INTO `product_attr` VALUES ('74', '11', '2032', '白色', '0', null, '0', '1', '8596', '音响颜色');
INSERT INTO `product_attr` VALUES ('75', '11', '2032', '粉紅色', '0', null, '0', '1', '8597', '音响颜色');
INSERT INTO `product_attr` VALUES ('76', '11', '2032', '紫色', '0', null, '0', '1', '8598', '音响颜色');
INSERT INTO `product_attr` VALUES ('77', '11', '2032', '黑色', '0', null, '0', '1', '8599', '音响颜色');
INSERT INTO `product_attr` VALUES ('78', '12', '7255', '白色', '0', null, '0', '1', '28393', '顏色');
INSERT INTO `product_attr` VALUES ('79', '12', '7255', '黑色', '0', null, '0', '1', '28395', '顏色');
INSERT INTO `product_attr` VALUES ('80', '13', '773', '耳钉粉', '0', null, '0', '1', '3297', '宇宙月亮珍珠耳釘套裝颜色');
INSERT INTO `product_attr` VALUES ('81', '13', '773', '耳钉黄', '0', null, '0', '1', '3298', '宇宙月亮珍珠耳釘套裝颜色');
INSERT INTO `product_attr` VALUES ('82', '13', '773', '耳钉蓝', '0', null, '0', '1', '3299', '宇宙月亮珍珠耳釘套裝颜色');
INSERT INTO `product_attr` VALUES ('83', '13', '773', '耳夹粉', '0', null, '0', '1', '3300', '宇宙月亮珍珠耳釘套裝颜色');
INSERT INTO `product_attr` VALUES ('84', '13', '773', '耳夹黄', '0', null, '0', '1', '3301', '宇宙月亮珍珠耳釘套裝颜色');
INSERT INTO `product_attr` VALUES ('85', '13', '773', '耳夹蓝', '0', null, '0', '1', '3302', '宇宙月亮珍珠耳釘套裝颜色');
INSERT INTO `product_attr` VALUES ('86', '14', '1004', '駝背矯正白(新)', '0', null, '0', '1', '4145', '駝背矯正帶');
INSERT INTO `product_attr` VALUES ('87', '14', '1004', '駝背矯正黑', '0', null, '0', '1', '4146', '駝背矯正帶');
INSERT INTO `product_attr` VALUES ('88', '14', '1005', 'S', '0', null, '0', '1', '4147', '尺寸');
INSERT INTO `product_attr` VALUES ('89', '14', '1005', 'M', '0', null, '0', '1', '4148', '尺寸');
INSERT INTO `product_attr` VALUES ('90', '14', '1005', 'L', '0', null, '0', '1', '4149', '尺寸');
INSERT INTO `product_attr` VALUES ('91', '14', '1005', 'XL', '0', null, '0', '1', '4150', '尺寸');
INSERT INTO `product_attr` VALUES ('92', '14', '1005', 'XXL', '0', null, '0', '1', '4151', '尺寸');
INSERT INTO `product_attr` VALUES ('93', '15', '2032', '天藍色', '0', null, '0', '1', '8595', '音响颜色');
INSERT INTO `product_attr` VALUES ('94', '15', '2032', '白色', '0', null, '0', '1', '8596', '音响颜色');
INSERT INTO `product_attr` VALUES ('95', '15', '2032', '粉紅色', '0', null, '0', '1', '8597', '音响颜色');
INSERT INTO `product_attr` VALUES ('96', '15', '2032', '紫色', '0', null, '0', '1', '8598', '音响颜色');
INSERT INTO `product_attr` VALUES ('97', '15', '2032', '黑色', '0', null, '0', '1', '8599', '音响颜色');
INSERT INTO `product_attr` VALUES ('98', '16', '2022', '金色（真皮皮帶）', '0', null, '0', '1', '8554', '颜色');
INSERT INTO `product_attr` VALUES ('99', '16', '2022', '金色（矽膠錶帶）', '0', null, '0', '1', '8555', '颜色');
INSERT INTO `product_attr` VALUES ('100', '16', '2022', '黑色（真皮錶帶）', '0', null, '0', '1', '8556', '颜色');
INSERT INTO `product_attr` VALUES ('101', '16', '2022', '黑色（矽膠錶帶）', '0', null, '0', '1', '8557', '颜色');
INSERT INTO `product_attr` VALUES ('102', '17', '2005', '70A', '0', null, '0', '1', '8455', '内衣尺寸');
INSERT INTO `product_attr` VALUES ('103', '17', '2005', '70B', '0', null, '0', '1', '8456', '内衣尺寸');
INSERT INTO `product_attr` VALUES ('104', '17', '2005', '70C', '0', null, '0', '1', '8457', '内衣尺寸');
INSERT INTO `product_attr` VALUES ('105', '17', '2005', '75A', '0', null, '0', '1', '8458', '内衣尺寸');
INSERT INTO `product_attr` VALUES ('106', '17', '2005', '75B', '0', null, '0', '1', '8459', '内衣尺寸');
INSERT INTO `product_attr` VALUES ('107', '17', '2005', '75C', '0', null, '0', '1', '8460', '内衣尺寸');
INSERT INTO `product_attr` VALUES ('108', '17', '2005', '80A', '0', null, '0', '1', '8461', '内衣尺寸');
INSERT INTO `product_attr` VALUES ('109', '17', '2005', '80B', '0', null, '0', '1', '8462', '内衣尺寸');
INSERT INTO `product_attr` VALUES ('110', '17', '2005', '80C', '0', null, '0', '1', '8463', '内衣尺寸');
INSERT INTO `product_attr` VALUES ('111', '17', '2005', '85C', '0', null, '0', '1', '8464', '内衣尺寸');
INSERT INTO `product_attr` VALUES ('112', '17', '2005', '85B', '0', null, '0', '1', '8465', '内衣尺寸');
INSERT INTO `product_attr` VALUES ('113', '17', '2005', '85A', '0', null, '0', '1', '8466', '内衣尺寸');
INSERT INTO `product_attr` VALUES ('114', '17', '2004', '紫花水袋杯', '0', null, '0', '1', '8450', '内衣颜色');
INSERT INTO `product_attr` VALUES ('115', '17', '2004', '金花水袋杯', '0', null, '0', '1', '8451', '内衣颜色');
INSERT INTO `product_attr` VALUES ('116', '17', '2004', '紫花插片薄杯', '0', null, '0', '1', '8452', '内衣颜色');
INSERT INTO `product_attr` VALUES ('117', '17', '2004', '金花插片薄杯', '0', null, '0', '1', '8453', '内衣颜色');
INSERT INTO `product_attr` VALUES ('118', '17', '2004', '紫花插片薄杯', '0', null, '0', '1', '8454', '内衣颜色');

-- ----------------------------
-- Table structure for product_comment
-- ----------------------------
DROP TABLE IF EXISTS `product_comment`;
CREATE TABLE `product_comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(20) DEFAULT '',
  `content` varchar(255) DEFAULT NULL,
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否匿名',
  `is_del` int(1) DEFAULT '0',
  `star` tinyint(4) DEFAULT '0',
  `product_id` int(10) NOT NULL DEFAULT '0',
  `aid` int(8) NOT NULL DEFAULT '0',
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_comment
-- ----------------------------
INSERT INTO `product_comment` VALUES ('1', '4524', '5555555', '1', '0', '5', '10', '1', '2017-03-17 17:15:06');
INSERT INTO `product_comment` VALUES ('2', '', '555555', '1', '0', '0', '11', '1', '2017-03-21 11:25:18');
INSERT INTO `product_comment` VALUES ('3', '5554', '6545644', '0', '0', '5', '10', '1', '2017-03-21 11:34:06');
INSERT INTO `product_comment` VALUES ('4', '555', '555555', '0', '0', '5', '10', '1', '2017-03-21 11:34:31');
INSERT INTO `product_comment` VALUES ('5', '54657', '56456454', '0', '0', '5', '10', '1', '2017-03-21 11:35:01');

-- ----------------------------
-- Table structure for product_comment_thumb
-- ----------------------------
DROP TABLE IF EXISTS `product_comment_thumb`;
CREATE TABLE `product_comment_thumb` (
  `commont_thumb_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `comment_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`commont_thumb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_comment_thumb
-- ----------------------------
INSERT INTO `product_comment_thumb` VALUES ('1', '/upload/comment/17-03-21/1489474093_1.jpg', '5');

-- ----------------------------
-- Table structure for product_thumb
-- ----------------------------
DROP TABLE IF EXISTS `product_thumb`;
CREATE TABLE `product_thumb` (
  `thumb_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(8) DEFAULT '0',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`thumb_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_thumb
-- ----------------------------
INSERT INTO `product_thumb` VALUES ('1', '14', '/upload/style6/photos/17-03-21/1488945434_1.00.gif', '2017-03-21 03:28:39');
INSERT INTO `product_thumb` VALUES ('2', '0', '/upload/style6/photos/17-04-07/QQ图片20151218143403.png', '2017-04-07 11:46:43');
INSERT INTO `product_thumb` VALUES ('3', '0', '/upload/style6/photos/17-04-07/QQ图片20151229153029.png', '2017-04-07 11:46:43');
INSERT INTO `product_thumb` VALUES ('4', '0', '/upload/style6/photos/17-04-07/QQ图片2016011414102123.png', '2017-04-07 11:46:43');
INSERT INTO `product_thumb` VALUES ('5', '0', '/upload/style6/photos/17-04-07/QQ图片2016041410195411.png', '2017-04-07 11:46:43');
INSERT INTO `product_thumb` VALUES ('6', '0', '/upload/style6/photos/17-04-07/16.jpg', '2017-04-07 12:48:26');
INSERT INTO `product_thumb` VALUES ('7', '0', '/upload/style6/photos/17-04-07/Ace18.jpg', '2017-04-07 13:02:45');
INSERT INTO `product_thumb` VALUES ('8', '0', '/upload/style6/photos/17-04-07/1491541596_16.jpg', '2017-04-07 13:06:36');
INSERT INTO `product_thumb` VALUES ('9', '0', '/upload/style6/photos/17-04-07/1491542241_16.jpg', '2017-04-07 13:17:21');
INSERT INTO `product_thumb` VALUES ('10', '18', '/upload/style6/photos/17-04-07/1491543342_16.jpg', '2017-04-07 13:35:42');
INSERT INTO `product_thumb` VALUES ('11', '19', '/upload/style6/photos/17-04-07/1491543420_16.jpg', '2017-04-07 13:37:00');

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `region_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_name` varchar(120) NOT NULL DEFAULT '',
  `region_type` tinyint(1) NOT NULL DEFAULT '2',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_code` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`region_id`),
  KEY `parent_id` (`parent_id`),
  KEY `region_type` (`region_type`),
  KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3831 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES ('3420', '3409', '彰化縣', '1', '0', '');
INSERT INTO `region` VALUES ('3409', '0', '台灣', '0', '0', 'TW');
INSERT INTO `region` VALUES ('3410', '3409', '台北市', '1', '0', '');
INSERT INTO `region` VALUES ('3411', '3409', '基隆市', '1', '0', '');
INSERT INTO `region` VALUES ('3412', '3409', '台北縣', '1', '0', '');
INSERT INTO `region` VALUES ('3413', '3409', '宜蘭縣', '1', '0', '');
INSERT INTO `region` VALUES ('3414', '3409', '新竹市', '1', '0', '');
INSERT INTO `region` VALUES ('3415', '3409', '新竹縣', '1', '0', '');
INSERT INTO `region` VALUES ('3416', '3409', '桃園縣', '1', '0', '');
INSERT INTO `region` VALUES ('3417', '3409', '苗栗縣', '1', '0', '');
INSERT INTO `region` VALUES ('3418', '3409', '台中市', '1', '0', '');
INSERT INTO `region` VALUES ('3419', '3409', '台中縣', '1', '0', '');
INSERT INTO `region` VALUES ('3421', '3409', '南投縣', '1', '0', '');
INSERT INTO `region` VALUES ('3422', '3409', '嘉義市 ', '1', '0', '');
INSERT INTO `region` VALUES ('3423', '3409', '嘉義縣', '1', '0', '');
INSERT INTO `region` VALUES ('3424', '3409', '雲林縣', '1', '0', '');
INSERT INTO `region` VALUES ('3426', '3409', '台南市', '1', '0', '');
INSERT INTO `region` VALUES ('3427', '3409', '台南縣', '1', '0', '');
INSERT INTO `region` VALUES ('3428', '3409', '高雄市', '1', '0', '');
INSERT INTO `region` VALUES ('3429', '3409', '高雄縣', '1', '0', '');
INSERT INTO `region` VALUES ('3430', '3409', '澎湖縣', '1', '0', '');
INSERT INTO `region` VALUES ('3431', '3409', '屏東縣', '1', '0', '');
INSERT INTO `region` VALUES ('3432', '3409', '台東縣', '1', '0', '');
INSERT INTO `region` VALUES ('3433', '3409', '花蓮縣', '1', '0', '');
INSERT INTO `region` VALUES ('3434', '3409', '金門縣', '1', '0', '');
INSERT INTO `region` VALUES ('3435', '3409', '連江縣', '1', '0', '');
INSERT INTO `region` VALUES ('3436', '3410', '中正區', '2', '0', '');
INSERT INTO `region` VALUES ('3437', '3410', '大同區', '2', '0', '');
INSERT INTO `region` VALUES ('3438', '3410', '中山區', '2', '0', '');
INSERT INTO `region` VALUES ('3439', '3410', '松山區', '2', '0', '');
INSERT INTO `region` VALUES ('3440', '3410', '大安區', '2', '0', '');
INSERT INTO `region` VALUES ('3441', '3410', '萬華區', '2', '0', '');
INSERT INTO `region` VALUES ('3442', '3410', '信義區', '2', '0', '');
INSERT INTO `region` VALUES ('3443', '3410', '士林區', '2', '0', '');
INSERT INTO `region` VALUES ('3444', '3410', '北投區', '2', '0', '');
INSERT INTO `region` VALUES ('3445', '3410', '內湖區', '2', '0', '');
INSERT INTO `region` VALUES ('3447', '3411', '仁愛區', '2', '0', '');
INSERT INTO `region` VALUES ('3448', '3411', '信義區', '2', '0', '');
INSERT INTO `region` VALUES ('3449', '3411', '中正區', '2', '0', '');
INSERT INTO `region` VALUES ('3450', '3411', '中山區', '2', '0', '');
INSERT INTO `region` VALUES ('3451', '3411', '安樂區', '2', '0', '');
INSERT INTO `region` VALUES ('3452', '3411', '暖暖區', '2', '0', '');
INSERT INTO `region` VALUES ('3453', '3411', '七堵區', '2', '0', '');
INSERT INTO `region` VALUES ('3454', '3412', '萬里鄉', '2', '0', '');
INSERT INTO `region` VALUES ('3455', '3412', '金山鄉', '2', '0', '');
INSERT INTO `region` VALUES ('3456', '3412', '板橋市', '2', '0', '');
INSERT INTO `region` VALUES ('3457', '3412', '汐止市', '2', '0', '');
INSERT INTO `region` VALUES ('3458', '3412', '深坑鄉', '2', '0', '');
INSERT INTO `region` VALUES ('3459', '3412', '石碇鄉', '2', '0', '');
INSERT INTO `region` VALUES ('3460', '3412', '瑞芳鎮', '2', '0', '');
INSERT INTO `region` VALUES ('3461', '3412', '平溪鄉', '2', '0', '');
INSERT INTO `region` VALUES ('3462', '3412', '雙溪鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3463', '3412', '貢寮鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3464', '3412', '新店市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3465', '3412', '坪林鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3466', '3412', '烏來鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3467', '3412', '永和市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3468', '3412', '中和市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3469', '3412', '土城市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3470', '3412', '三峽鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3471', '3412', '樹林鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3472', '3412', '鶯歌鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3473', '3412', '三重市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3474', '3412', '新莊市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3475', '3412', '泰山鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3476', '3412', '林口鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3477', '3412', '蘆洲市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3478', '3412', '五股鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3479', '3412', '八里鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3480', '3412', '淡水鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3481', '3412', '三芝鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3482', '3412', '石門鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3483', '3413', '宜蘭市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3484', '3413', '頭城鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3485', '3413', '礁溪鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3486', '3413', '壯圍鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3487', '3413', '員山鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3488', '3413', '羅東鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3489', '3413', '三星鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3490', '3413', '大同鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3491', '3413', '五結鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3492', '3413', '冬山鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3493', '3413', '蘇澳鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3494', '3413', '南澳鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3495', '3410', '南港區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3496', '3410', '文山區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3510', '3416', '中壢市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3511', '3416', '平鎮市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3512', '3416', '龍潭鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3513', '3416', '楊梅鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3514', '3416', '新屋鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3515', '3416', '觀音鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3516', '3416', '桃園市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3517', '3416', '龜山鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3518', '3416', '八德市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3519', '3416', '大溪鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3520', '3416', '復興鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3521', '3416', '大園鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3522', '3416', '蘆竹鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3523', '3417', '竹南鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3524', '3417', '頭份鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3525', '3417', '三灣鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3526', '3417', '南庄鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3527', '3417', '獅潭鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3528', '3417', '後龍鎮', '2', '0', '');
INSERT INTO `region` VALUES ('3529', '3417', '通霄鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3530', '3417', '苑裡鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3531', '3417', '苗栗市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3532', '3417', '造橋鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3533', '3417', '頭屋鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3534', '3417', '公館鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3535', '3417', '大湖鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3536', '3417', '泰安鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3537', '3417', '銅鑼鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3538', '3417', '三義鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3539', '3417', '西湖鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3540', '3417', '卓蘭鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3549', '3418', '中區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3550', '3418', '東區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3551', '3418', '南區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3552', '3418', '西區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3553', '3418', '北區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3554', '3418', '北屯區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3555', '3418', '西屯區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3556', '3418', '南屯區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3557', '3419', '太平市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3558', '3419', '大里市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3559', '3419', '霧峰鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3560', '3419', '烏日鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3561', '3419', '豐原市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3562', '3419', '后里鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3563', '3419', '石岡鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3564', '3419', '東勢鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3565', '3419', '和平鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3566', '3419', '新社鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3567', '3419', '潭子鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3568', '3419', '大雅鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3569', '3419', '神岡鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3570', '3419', '大肚鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3571', '3419', '沙鹿鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3572', '3419', '龍井鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3573', '3419', '梧棲鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3574', '3419', '清水鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3575', '3419', '大甲鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3576', '3419', '外埔鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3577', '3419', '大安鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3578', '3420', '彰化市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3579', '3420', '芬園鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3580', '3420', '花壇鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3581', '3420', '秀水鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3582', '3420', '鹿港鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3583', '3420', '福興鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3584', '3420', '線西鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3585', '3420', '和美鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3586', '3420', '伸港鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3587', '3420', '員林鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3588', '3420', '社頭鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3589', '3420', '永靖鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3590', '3420', '埔心鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3591', '3420', '溪湖鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3592', '3420', '大村鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3593', '3420', '埔鹽鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3594', '3420', '田中鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3595', '3420', '北斗鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3596', '3420', '田尾鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3604', '3420', '埤頭鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3605', '3420', '溪州鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3606', '3420', '竹塘鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3607', '3420', '二林鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3608', '3420', '大城鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3609', '3420', '芳苑鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3610', '3420', '二水鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3611', '3421', '南投市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3612', '3421', '中寮鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3613', '3421', '草屯鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3614', '3421', '國姓鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3615', '3421', '埔里鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3616', '3421', '仁愛鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3617', '3421', '名間鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3618', '3421', '集集鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3619', '3421', '水里鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3620', '3421', '魚池鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3621', '3421', '信義鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3622', '3421', '竹山鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3623', '3421', '鹿谷鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3624', '3415', '竹北市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3625', '3415', '湖口鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3626', '3415', '新豐鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3627', '3415', '新埔鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3628', '3415', '關西鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3629', '3415', '芎林鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3630', '3415', '寶山鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3631', '3415', '竹東鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3632', '3415', '五峰鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3633', '3415', '橫山鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3634', '3415', '尖石鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3635', '3415', '北埔鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3636', '3415', '峨眉鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3637', '3423', '番路鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3638', '3423', '梅山鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3639', '3423', '竹崎鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3640', '3423', '阿里山鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3641', '3423', '中埔鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3642', '3423', '大埔鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3643', '3423', '水上鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3644', '3423', '鹿草鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3645', '3423', '太保市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3646', '3423', '朴子市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3647', '3423', '東石鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3648', '3423', '六腳鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3649', '3423', '新港鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3650', '3423', '民雄鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3651', '3423', '大林鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3652', '3423', '溪口鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3653', '3423', '義竹鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3654', '3423', '布袋鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3655', '3424', '斗南鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3656', '3424', '大埤鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3657', '3424', '虎尾鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3658', '3424', '土庫鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3659', '3424', '褒忠鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3660', '3424', '東勢鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3661', '3424', '台西鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3662', '3424', '崙背鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3663', '3424', '麥寮鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3664', '3424', '斗六市', '2', '0', '');
INSERT INTO `region` VALUES ('3665', '3424', '林內鄉', '2', '0', '');
INSERT INTO `region` VALUES ('3666', '3424', '古坑鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3667', '3424', '莿桐鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3668', '3424', '西螺鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3669', '3424', '二崙鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3670', '3424', '北港鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3671', '3424', '水林鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3672', '3424', '口湖鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3673', '3424', '四湖鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3674', '3424', '元長鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3675', '3426', '中區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3676', '3426', '東區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3677', '3426', '南區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3678', '3426', '西區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3679', '3426', '北區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3680', '3426', '安平區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3681', '3426', '安南區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3682', '3427', '永康市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3683', '3427', '歸仁鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3684', '3427', '新化鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3685', '3427', '左鎮鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3686', '3427', '玉井鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3687', '3427', '楠西鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3688', '3427', '南化鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3689', '3427', '仁德鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3690', '3427', '關廟鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3691', '3427', '龍崎鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3692', '3427', '官田鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3693', '3427', '麻豆鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3694', '3427', '佳里鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3695', '3427', '西港鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3696', '3427', '七股鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3697', '3427', '將軍鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3698', '3427', '學甲鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3699', '3427', '北門鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3700', '3427', '新營市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3701', '3427', '後壁鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3702', '3427', '白河鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3703', '3427', '東山鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3704', '3427', '六甲鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3705', '3427', '下營鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3706', '3427', '柳營鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3707', '3427', '鹽水鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3708', '3427', '善化鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3709', '3427', '大內鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3710', '3427', '山上鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3711', '3427', '新市鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3712', '3427', '安定鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3713', '3428', '新興區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3714', '3428', '前金區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3715', '3428', '苓雅區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3716', '3428', '鹽埕區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3717', '3428', '鼓山區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3718', '3428', '旗津區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3719', '3428', '前鎮區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3720', '3428', '三民區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3721', '3428', '楠梓區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3722', '3428', '小港區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3723', '3428', '左營區 ', '2', '0', '');
INSERT INTO `region` VALUES ('3724', '3429', '仁武鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3725', '3429', '大社鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3726', '3429', '岡山鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3727', '3429', '路竹鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3728', '3429', '阿蓮鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3729', '3429', '田寮鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3730', '3429', '燕巢鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3731', '3429', '橋頭鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3732', '3429', '梓官鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3733', '3429', '彌陀鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3734', '3429', '永安鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3735', '3429', '湖內鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3736', '3429', '鳳山市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3737', '3429', '大寮鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3738', '3429', '林園鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3739', '3429', '鳥松鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3740', '3429', '大樹鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3741', '3429', '旗山鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3742', '3429', '美濃鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3743', '3429', '六龜鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3744', '3429', '內門鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3745', '3429', '杉林鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3746', '3429', '甲仙鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3747', '3429', '桃源鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3748', '3429', '那瑪夏鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3749', '3429', '茂林鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3750', '3429', '茄萣鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3751', '3430', '馬公市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3752', '3430', '西嶼鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3753', '3430', '望安鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3754', '3430', '七美鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3755', '3430', '白沙鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3756', '3430', '湖西鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3757', '3431', '屏東市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3758', '3431', '三地門鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3759', '3431', '霧台鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3760', '3431', '瑪家鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3761', '3431', '九如鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3762', '3431', '里港鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3763', '3431', '高樹鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3764', '3431', '鹽埔鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3765', '3431', '長治鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3766', '3431', '麟洛鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3767', '3431', '竹田鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3768', '3431', '內埔鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3769', '3431', '萬丹鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3770', '3431', '潮州鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3771', '3431', '泰武鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3772', '3431', '來義鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3773', '3431', '萬巒鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3774', '3431', '崁頂鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3775', '3431', '新埤鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3776', '3431', '南州鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3777', '3431', '林邊鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3778', '3431', '東港鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3779', '3431', '琉球鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3780', '3431', '佳冬鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3781', '3431', '新園鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3782', '3431', '枋寮鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3783', '3431', '枋山鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3784', '3431', '春日鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3785', '3431', '獅子鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3786', '3431', '車城鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3787', '3431', '牡丹鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3788', '3431', '恆春鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3789', '3431', '滿州鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3790', '3432', '台東市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3791', '3432', '綠島鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3792', '3432', '蘭嶼鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3793', '3432', '延平鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3794', '3432', '卑南鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3795', '3432', '鹿野鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3796', '3432', '關山鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3797', '3432', '海瑞鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3798', '3432', '池上鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3799', '3432', '東河鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3800', '3432', '成功鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3801', '3432', '長濱鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3802', '3432', '太麻里鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3803', '3432', '金峰鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3804', '3432', '大武鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3805', '3432', '達仁鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3806', '3433', '花蓮市 ', '2', '0', '');
INSERT INTO `region` VALUES ('3807', '3433', '新城鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3808', '3433', '秀林鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3809', '3433', '吉安鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3810', '3433', '壽豐鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3811', '3433', '鳳林鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3812', '3433', '光復鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3813', '3433', '豐濱鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3814', '3433', '瑞穗鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3815', '3433', '萬榮鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3816', '3433', '玉里鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3817', '3433', '卓溪鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3818', '3433', '富里鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3819', '3434', '金沙鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3820', '3434', '金湖鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3821', '3434', '金寧鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3822', '3434', '金城鎮 ', '2', '0', '');
INSERT INTO `region` VALUES ('3823', '3434', '烈嶼鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3824', '3434', '烏坵鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3825', '3435', '南竿鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3826', '3435', '北竿鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3827', '3435', '莒光鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('3828', '3435', '東引鄉 ', '2', '0', '');
INSERT INTO `region` VALUES ('61', '1', 'Armed Forces Pacific', '1', '0', 'AP');
INSERT INTO `region` VALUES ('1', '0', 'United States', '0', '0', 'US');
INSERT INTO `region` VALUES ('2', '1', 'Alabama', '1', '0', 'AL');
INSERT INTO `region` VALUES ('3', '1', 'Alaska', '1', '0', 'AK');
INSERT INTO `region` VALUES ('4', '1', 'Arizona', '1', '0', 'AZ');
INSERT INTO `region` VALUES ('5', '1', 'California', '1', '0', 'CA');
INSERT INTO `region` VALUES ('6', '1', 'Colorado', '1', '0', 'CO');
INSERT INTO `region` VALUES ('7', '1', 'Connecticut', '1', '0', 'CT');
INSERT INTO `region` VALUES ('8', '1', 'Delaware', '1', '0', 'DE');
INSERT INTO `region` VALUES ('9', '1', 'District of Columbia', '1', '0', 'DC');
INSERT INTO `region` VALUES ('10', '1', 'Florida', '1', '0', 'FL');
INSERT INTO `region` VALUES ('11', '1', 'Georgia', '1', '0', 'GA');
INSERT INTO `region` VALUES ('12', '1', 'Hawaii', '1', '0', 'HI');
INSERT INTO `region` VALUES ('13', '1', 'Idaho', '1', '0', 'ID');
INSERT INTO `region` VALUES ('14', '1', 'Illinois ', '1', '0', 'IL');
INSERT INTO `region` VALUES ('15', '1', 'Indiana', '1', '0', 'IN');
INSERT INTO `region` VALUES ('16', '1', 'Iowa', '1', '0', 'IA');
INSERT INTO `region` VALUES ('17', '1', 'Kansas', '1', '0', 'KS');
INSERT INTO `region` VALUES ('18', '1', 'Kentucky', '1', '0', 'KY');
INSERT INTO `region` VALUES ('19', '1', 'Louisiana', '1', '0', 'LA');
INSERT INTO `region` VALUES ('20', '1', 'Maine', '1', '0', 'ME');
INSERT INTO `region` VALUES ('21', '1', 'Maryland', '1', '0', 'MD');
INSERT INTO `region` VALUES ('22', '1', 'Massachusetts', '1', '0', 'MA');
INSERT INTO `region` VALUES ('23', '1', 'Michigan', '1', '0', 'MI');
INSERT INTO `region` VALUES ('24', '1', 'Minnesota', '1', '0', 'MN');
INSERT INTO `region` VALUES ('25', '1', 'Mississippi', '1', '0', 'MS');
INSERT INTO `region` VALUES ('26', '1', 'Missouri', '1', '0', 'MO');
INSERT INTO `region` VALUES ('27', '1', 'Montana', '1', '0', 'MT');
INSERT INTO `region` VALUES ('28', '1', 'Nebraska', '1', '0', 'NE');
INSERT INTO `region` VALUES ('29', '1', 'Nevada', '1', '0', 'NV');
INSERT INTO `region` VALUES ('30', '1', 'New Hampshire', '1', '0', 'NH');
INSERT INTO `region` VALUES ('31', '1', 'New Jersey', '1', '0', 'NJ');
INSERT INTO `region` VALUES ('32', '1', 'New Mexico', '1', '0', 'NM');
INSERT INTO `region` VALUES ('33', '1', 'New York', '1', '0', 'NY');
INSERT INTO `region` VALUES ('34', '1', 'North Carolina', '1', '0', 'NC');
INSERT INTO `region` VALUES ('35', '1', 'North Dakota', '1', '0', 'ND');
INSERT INTO `region` VALUES ('36', '1', 'Ohio ', '1', '0', 'OH');
INSERT INTO `region` VALUES ('37', '1', 'Oklahoma', '1', '0', 'OK');
INSERT INTO `region` VALUES ('38', '1', 'Oregon', '1', '0', 'OR');
INSERT INTO `region` VALUES ('39', '1', 'Pennsylvania', '1', '0', 'PA');
INSERT INTO `region` VALUES ('40', '1', 'Rhode Island', '1', '0', 'RI');
INSERT INTO `region` VALUES ('41', '1', 'South Carolina', '1', '0', 'SC');
INSERT INTO `region` VALUES ('42', '1', 'South Dakota', '1', '0', 'SD');
INSERT INTO `region` VALUES ('43', '1', 'Tennessee', '1', '0', 'TN');
INSERT INTO `region` VALUES ('44', '1', 'Texas', '1', '0', 'TX');
INSERT INTO `region` VALUES ('45', '1', 'Utah', '1', '0', 'UT');
INSERT INTO `region` VALUES ('46', '1', 'Vermont', '1', '0', 'VT');
INSERT INTO `region` VALUES ('47', '1', 'Virginia', '1', '0', 'VA');
INSERT INTO `region` VALUES ('48', '1', 'Washington', '1', '0', 'WA');
INSERT INTO `region` VALUES ('49', '1', 'West Virginia', '1', '0', 'WV');
INSERT INTO `region` VALUES ('50', '1', 'Wisconsin', '1', '0', 'WI');
INSERT INTO `region` VALUES ('51', '1', 'Wyoming', '1', '0', 'WY');
INSERT INTO `region` VALUES ('52', '1', 'American Samoa', '1', '0', 'AS');
INSERT INTO `region` VALUES ('53', '1', 'Federated States of Micronesia', '1', '0', 'FM');
INSERT INTO `region` VALUES ('54', '1', 'Guam', '1', '0', 'GU');
INSERT INTO `region` VALUES ('55', '1', 'Northern Mariana Islands', '1', '0', 'MP');
INSERT INTO `region` VALUES ('56', '1', 'Puerto Rico', '1', '0', 'PR');
INSERT INTO `region` VALUES ('57', '1', 'Republic of Marshall Islands', '1', '0', 'MH');
INSERT INTO `region` VALUES ('58', '1', 'Virgin Islands of the U.S. ', '1', '0', 'VI');
INSERT INTO `region` VALUES ('59', '1', 'Armed Forces Middle East', '1', '0', 'AE');
INSERT INTO `region` VALUES ('60', '1', 'Armed Forces Americas', '1', '0', 'AA');
INSERT INTO `region` VALUES ('62', '1', 'Arkansas', '1', '0', 'AR');
INSERT INTO `region` VALUES ('63', '0', '香港', '0', '0', 'HK');
INSERT INTO `region` VALUES ('64', '63', '九龍', '1', '0', '');
INSERT INTO `region` VALUES ('65', '63', '香港島', '1', '0', '');
INSERT INTO `region` VALUES ('66', '63', '新界', '1', '0', '');
INSERT INTO `region` VALUES ('3830', '3409', '新北市', '1', '0', '');
INSERT INTO `region` VALUES ('67', '0', 'Việt Nam', '0', '0', 'YN');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(50) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `add_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `email` varchar(225) DEFAULT NULL,
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `password` (`password`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'dafb23c65fc066e6df1ae2277289bc91', '2017-01-12 12:00:00', 'admin@qq.com', '0');
INSERT INTO `user` VALUES ('2', 'Walli_JJ', 'e10adc3949ba59abbe56e057f20f883e', '2017-01-16 19:59:08', '978704526@qq.com', '1');
INSERT INTO `user` VALUES ('3', 'admin', '', '2017-01-16 20:05:34', '978704526@qq.com', '1');
INSERT INTO `user` VALUES ('4', 'admin', '01afae0f96ab83c9e7937a3358a8b419', '2017-02-03 18:11:26', '9787045261@qq.com', '1');
INSERT INTO `user` VALUES ('5', 'buguniao', 'e10adc3949ba59abbe56e057f20f883e', '2017-02-08 16:14:52', 'admin@163.com', '0');
INSERT INTO `user` VALUES ('6', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2017-01-12 12:00:00', 'admin@qq.com', '1');
INSERT INTO `user` VALUES ('7', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2017-03-17 10:04:28', 'admin@163.com', '1');
INSERT INTO `user` VALUES ('8', '111', 'e10adc3949ba59abbe56e057f20f883e', '2017-03-21 04:27:25', '111@qq.com', '0');
INSERT INTO `user` VALUES ('9', 'buguniao', 'dafb23c65fc066e6df1ae2277289bc91', '2017-01-12 12:00:00', 'buguniao@qq.com', '0');
INSERT INTO `user` VALUES ('10', 'buguniao', 'dafb23c65fc066e6df1ae2277289bc91', '2017-01-12 12:00:00', 'buguniao@qq.com', '0');
