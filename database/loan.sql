/*
Navicat MySQL Data Transfer

Source Server         : RITH-PC
Source Server Version : 50617
Source Host           : 127.0.0.1:3306
Source Database       : loan

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-11-24 18:59:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c19_wallets
-- ----------------------------
DROP TABLE IF EXISTS `c19_wallets`;
CREATE TABLE `c19_wallets` (
  `wallet_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) DEFAULT NULL,
  `descriptions` varchar(200) DEFAULT NULL,
  `wallet_type` enum('debit','credit','transfer') DEFAULT NULL,
  `trans_date` int(11) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `transfer_to` int(11) DEFAULT NULL,
  PRIMARY KEY (`wallet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of c19_wallets
-- ----------------------------

-- ----------------------------
-- Table structure for kpos_app_config
-- ----------------------------
DROP TABLE IF EXISTS `kpos_app_config`;
CREATE TABLE `kpos_app_config` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_app_config
-- ----------------------------
INSERT INTO `kpos_app_config` VALUES ('address', '123 Nowhere street');
INSERT INTO `kpos_app_config` VALUES ('company', 'SoftReliance I.T. Solutions');
INSERT INTO `kpos_app_config` VALUES ('currency_side', '0');
INSERT INTO `kpos_app_config` VALUES ('currency_symbol', 'P');
INSERT INTO `kpos_app_config` VALUES ('custom10_name', '0');
INSERT INTO `kpos_app_config` VALUES ('custom1_name', '0');
INSERT INTO `kpos_app_config` VALUES ('custom2_name', '0');
INSERT INTO `kpos_app_config` VALUES ('custom3_name', '0');
INSERT INTO `kpos_app_config` VALUES ('custom4_name', '0');
INSERT INTO `kpos_app_config` VALUES ('custom5_name', '0');
INSERT INTO `kpos_app_config` VALUES ('custom6_name', '0');
INSERT INTO `kpos_app_config` VALUES ('custom7_name', '0');
INSERT INTO `kpos_app_config` VALUES ('custom8_name', '0');
INSERT INTO `kpos_app_config` VALUES ('custom9_name', '0');
INSERT INTO `kpos_app_config` VALUES ('default_tax_1_name', '0');
INSERT INTO `kpos_app_config` VALUES ('default_tax_1_rate', '0');
INSERT INTO `kpos_app_config` VALUES ('default_tax_2_name', '0');
INSERT INTO `kpos_app_config` VALUES ('default_tax_2_rate', '0');
INSERT INTO `kpos_app_config` VALUES ('default_tax_rate', '8');
INSERT INTO `kpos_app_config` VALUES ('email', 'admin@pappastech.com');
INSERT INTO `kpos_app_config` VALUES ('fax', '');
INSERT INTO `kpos_app_config` VALUES ('language', 'en');
INSERT INTO `kpos_app_config` VALUES ('phone', '555-555-5555');
INSERT INTO `kpos_app_config` VALUES ('print_after_sale', '0');
INSERT INTO `kpos_app_config` VALUES ('recv_invoice_format', '0');
INSERT INTO `kpos_app_config` VALUES ('return_policy', '0');
INSERT INTO `kpos_app_config` VALUES ('sales_invoice_format', '0');
INSERT INTO `kpos_app_config` VALUES ('tax_included', '0');
INSERT INTO `kpos_app_config` VALUES ('timezone', 'Asia/Hong_Kong');
INSERT INTO `kpos_app_config` VALUES ('website', '');

-- ----------------------------
-- Table structure for kpos_customers
-- ----------------------------
DROP TABLE IF EXISTS `kpos_customers`;
CREATE TABLE `kpos_customers` (
  `person_id` int(10) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `taxable` int(1) NOT NULL DEFAULT '1',
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `kpos_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `kpos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_customers
-- ----------------------------
INSERT INTO `kpos_customers` VALUES ('3', null, '1', '0');
INSERT INTO `kpos_customers` VALUES ('4', null, '1', '0');
INSERT INTO `kpos_customers` VALUES ('5', null, '1', '1');
INSERT INTO `kpos_customers` VALUES ('6', null, '1', '1');
INSERT INTO `kpos_customers` VALUES ('7', null, '1', '1');
INSERT INTO `kpos_customers` VALUES ('8', null, '1', '1');
INSERT INTO `kpos_customers` VALUES ('9', null, '1', '1');
INSERT INTO `kpos_customers` VALUES ('10', null, '1', '0');
INSERT INTO `kpos_customers` VALUES ('11', null, '1', '1');
INSERT INTO `kpos_customers` VALUES ('18', null, '1', '0');
INSERT INTO `kpos_customers` VALUES ('19', null, '1', '0');
INSERT INTO `kpos_customers` VALUES ('20', null, '1', '0');
INSERT INTO `kpos_customers` VALUES ('21', null, '1', '0');
INSERT INTO `kpos_customers` VALUES ('22', null, '1', '0');
INSERT INTO `kpos_customers` VALUES ('46', null, '1', '0');
INSERT INTO `kpos_customers` VALUES ('48', null, '1', '0');

-- ----------------------------
-- Table structure for kpos_employees
-- ----------------------------
DROP TABLE IF EXISTS `kpos_employees`;
CREATE TABLE `kpos_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `username` (`username`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `kpos_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `kpos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_employees
-- ----------------------------
INSERT INTO `kpos_employees` VALUES ('213123fsadfas', '25d55ad283aa400af464c76d713c07ad', '47', '0');
INSERT INTO `kpos_employees` VALUES ('admin', '0192023a7bbd73250516f069df18b500', '1', '0');
INSERT INTO `kpos_employees` VALUES ('dsfasdfsadf', '25d55ad283aa400af464c76d713c07ad', '28', '1');
INSERT INTO `kpos_employees` VALUES ('fdfasdfsadf123', '25d55ad283aa400af464c76d713c07ad', '41', '0');
INSERT INTO `kpos_employees` VALUES ('fdsfsdfsafs2346', '25d55ad283aa400af464c76d713c07ad', '42', '0');
INSERT INTO `kpos_employees` VALUES ('fsdafas', '25d55ad283aa400af464c76d713c07ad', '27', '1');
INSERT INTO `kpos_employees` VALUES ('luizsept', '25d55ad283aa400af464c76d713c07ad', '45', '0');
INSERT INTO `kpos_employees` VALUES ('mbmg12356', '25d55ad283aa400af464c76d713c07ad', '43', '0');
INSERT INTO `kpos_employees` VALUES ('newnew1', '25d55ad283aa400af464c76d713c07ad', '33', '1');
INSERT INTO `kpos_employees` VALUES ('newnr123', '25d55ad283aa400af464c76d713c07ad', '37', '1');
INSERT INTO `kpos_employees` VALUES ('norman', '5f3cd85febeeefd6c03b6042c19c24bf', '2', '0');
INSERT INTO `kpos_employees` VALUES ('regidor', '5f3cd85febeeefd6c03b6042c19c24bf', '23', '0');
INSERT INTO `kpos_employees` VALUES ('test1', '25d55ad283aa400af464c76d713c07ad', '29', '1');
INSERT INTO `kpos_employees` VALUES ('test3456', '25d55ad283aa400af464c76d713c07ad', '31', '1');
INSERT INTO `kpos_employees` VALUES ('testnorman', '5f3cd85febeeefd6c03b6042c19c24bf', '15', '1');
INSERT INTO `kpos_employees` VALUES ('work1234', '25d55ad283aa400af464c76d713c07ad', '44', '0');

-- ----------------------------
-- Table structure for kpos_financial_status
-- ----------------------------
DROP TABLE IF EXISTS `kpos_financial_status`;
CREATE TABLE `kpos_financial_status` (
  `financial_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `income_sources` text NOT NULL,
  PRIMARY KEY (`financial_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kpos_financial_status
-- ----------------------------
INSERT INTO `kpos_financial_status` VALUES ('1', '21', '[\"salary=5000\"]');
INSERT INTO `kpos_financial_status` VALUES ('3', '22', '[\"salary=12000\",\"online=15000\",\"online=15000\"]');
INSERT INTO `kpos_financial_status` VALUES ('4', '19', '[\"=\"]');
INSERT INTO `kpos_financial_status` VALUES ('5', '3', '[\"=\"]');
INSERT INTO `kpos_financial_status` VALUES ('6', '10', '[\"salary=7000.50\"]');
INSERT INTO `kpos_financial_status` VALUES ('7', '18', '[\"=\"]');
INSERT INTO `kpos_financial_status` VALUES ('8', '46', '[\"=\"]');
INSERT INTO `kpos_financial_status` VALUES ('9', '48', '[\"=\"]');

-- ----------------------------
-- Table structure for kpos_giftcards
-- ----------------------------
DROP TABLE IF EXISTS `kpos_giftcards`;
CREATE TABLE `kpos_giftcards` (
  `record_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `giftcard_id` int(11) NOT NULL AUTO_INCREMENT,
  `giftcard_number` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `value` decimal(15,2) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`giftcard_id`),
  UNIQUE KEY `giftcard_number` (`giftcard_number`),
  KEY `ospos_giftcards_ibfk_1` (`person_id`),
  CONSTRAINT `kpos_giftcards_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `kpos_people` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of kpos_giftcards
-- ----------------------------
INSERT INTO `kpos_giftcards` VALUES ('2015-04-16 21:36:49', '2', '1', '50.00', '1', '3');
INSERT INTO `kpos_giftcards` VALUES ('2015-04-16 21:58:05', '3', '2', '40.00', '1', '4');
INSERT INTO `kpos_giftcards` VALUES ('2015-04-16 22:40:49', '4', '3', '33.00', '0', '3');
INSERT INTO `kpos_giftcards` VALUES ('2015-04-16 22:41:04', '5', '4', '12.00', '0', '4');
INSERT INTO `kpos_giftcards` VALUES ('2015-04-16 22:41:28', '6', '5', '12.00', '0', '10');
INSERT INTO `kpos_giftcards` VALUES ('2015-04-16 22:57:32', '7', '6', '12.00', '0', '10');
INSERT INTO `kpos_giftcards` VALUES ('2015-04-16 22:58:35', '8', '7', '2.00', '0', '4');
INSERT INTO `kpos_giftcards` VALUES ('2015-04-16 23:01:00', '9', '8', '2.00', '0', '10');
INSERT INTO `kpos_giftcards` VALUES ('2015-04-16 23:01:52', '10', '9', '20.00', '0', '4');

-- ----------------------------
-- Table structure for kpos_grants
-- ----------------------------
DROP TABLE IF EXISTS `kpos_grants`;
CREATE TABLE `kpos_grants` (
  `permission_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  PRIMARY KEY (`permission_id`,`person_id`),
  KEY `ospos_grants_ibfk_2` (`person_id`),
  CONSTRAINT `kpos_grants_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `kpos_permissions` (`permission_id`),
  CONSTRAINT `kpos_grants_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `kpos_employees` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_grants
-- ----------------------------
INSERT INTO `kpos_grants` VALUES ('config', '1');
INSERT INTO `kpos_grants` VALUES ('customers', '1');
INSERT INTO `kpos_grants` VALUES ('employees', '1');
INSERT INTO `kpos_grants` VALUES ('giftcards', '1');
INSERT INTO `kpos_grants` VALUES ('items', '1');
INSERT INTO `kpos_grants` VALUES ('items_', '1');
INSERT INTO `kpos_grants` VALUES ('items_stock', '1');
INSERT INTO `kpos_grants` VALUES ('item_kits', '1');
INSERT INTO `kpos_grants` VALUES ('loans', '1');
INSERT INTO `kpos_grants` VALUES ('loan_types', '1');
INSERT INTO `kpos_grants` VALUES ('payments', '1');
INSERT INTO `kpos_grants` VALUES ('receivings', '1');
INSERT INTO `kpos_grants` VALUES ('reports', '1');
INSERT INTO `kpos_grants` VALUES ('reports_categories', '1');
INSERT INTO `kpos_grants` VALUES ('reports_customers', '1');
INSERT INTO `kpos_grants` VALUES ('reports_discounts', '1');
INSERT INTO `kpos_grants` VALUES ('reports_employees', '1');
INSERT INTO `kpos_grants` VALUES ('reports_inventory', '1');
INSERT INTO `kpos_grants` VALUES ('reports_items', '1');
INSERT INTO `kpos_grants` VALUES ('reports_payments', '1');
INSERT INTO `kpos_grants` VALUES ('reports_receivings', '1');
INSERT INTO `kpos_grants` VALUES ('reports_sales', '1');
INSERT INTO `kpos_grants` VALUES ('reports_suppliers', '1');
INSERT INTO `kpos_grants` VALUES ('reports_taxes', '1');
INSERT INTO `kpos_grants` VALUES ('sales', '1');
INSERT INTO `kpos_grants` VALUES ('suppliers', '1');
INSERT INTO `kpos_grants` VALUES ('items', '2');
INSERT INTO `kpos_grants` VALUES ('items_', '2');
INSERT INTO `kpos_grants` VALUES ('items_stock', '2');
INSERT INTO `kpos_grants` VALUES ('item_kits', '2');
INSERT INTO `kpos_grants` VALUES ('loans', '2');
INSERT INTO `kpos_grants` VALUES ('sales', '2');
INSERT INTO `kpos_grants` VALUES ('items_', '23');
INSERT INTO `kpos_grants` VALUES ('loans', '23');
INSERT INTO `kpos_grants` VALUES ('loan_types', '23');
INSERT INTO `kpos_grants` VALUES ('payments', '23');
INSERT INTO `kpos_grants` VALUES ('items_', '41');
INSERT INTO `kpos_grants` VALUES ('loans', '41');
INSERT INTO `kpos_grants` VALUES ('items_', '42');
INSERT INTO `kpos_grants` VALUES ('loans', '42');
INSERT INTO `kpos_grants` VALUES ('items_', '43');
INSERT INTO `kpos_grants` VALUES ('loans', '43');
INSERT INTO `kpos_grants` VALUES ('items_', '44');
INSERT INTO `kpos_grants` VALUES ('loans', '44');
INSERT INTO `kpos_grants` VALUES ('items_', '45');
INSERT INTO `kpos_grants` VALUES ('loans', '45');
INSERT INTO `kpos_grants` VALUES ('items_', '47');
INSERT INTO `kpos_grants` VALUES ('loans', '47');
INSERT INTO `kpos_grants` VALUES ('loan_types', '47');
INSERT INTO `kpos_grants` VALUES ('payments', '47');

-- ----------------------------
-- Table structure for kpos_inventory
-- ----------------------------
DROP TABLE IF EXISTS `kpos_inventory`;
CREATE TABLE `kpos_inventory` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_items` int(11) NOT NULL DEFAULT '0',
  `trans_user` int(11) NOT NULL DEFAULT '0',
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_comment` text NOT NULL,
  `trans_location` int(11) NOT NULL,
  `trans_inventory` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`trans_id`),
  KEY `trans_items` (`trans_items`),
  KEY `trans_user` (`trans_user`),
  KEY `trans_location` (`trans_location`),
  CONSTRAINT `kpos_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `kpos_items` (`item_id`),
  CONSTRAINT `kpos_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `kpos_employees` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_inventory
-- ----------------------------
INSERT INTO `kpos_inventory` VALUES ('1', '1', '1', '2015-04-03 05:46:34', 'Manual Edit of Quantity', '1', '100');
INSERT INTO `kpos_inventory` VALUES ('2', '1', '1', '2015-04-03 05:48:46', 'POS 1', '1', '-1');
INSERT INTO `kpos_inventory` VALUES ('3', '1', '1', '2015-04-03 06:04:02', 'POS 2', '1', '-1');
INSERT INTO `kpos_inventory` VALUES ('4', '1', '1', '2015-04-03 08:57:49', 'POS 3', '1', '-1');
INSERT INTO `kpos_inventory` VALUES ('5', '1', '1', '2015-04-03 08:59:06', 'POS 4', '1', '-2');
INSERT INTO `kpos_inventory` VALUES ('6', '1', '1', '2015-04-03 09:11:42', 'POS 5', '1', '-2');
INSERT INTO `kpos_inventory` VALUES ('7', '1', '1', '2015-04-04 07:19:33', 'POS 6', '1', '-1');
INSERT INTO `kpos_inventory` VALUES ('8', '1', '1', '2015-04-04 07:21:43', 'POS 7', '1', '-1');
INSERT INTO `kpos_inventory` VALUES ('9', '1', '1', '2015-04-04 07:22:20', 'POS 8', '1', '1');
INSERT INTO `kpos_inventory` VALUES ('10', '2', '2', '2015-04-04 08:13:53', 'Manual Edit of Quantity', '1', '100');
INSERT INTO `kpos_inventory` VALUES ('11', '1', '2', '2015-04-04 13:52:05', 'POS 9', '1', '-2');
INSERT INTO `kpos_inventory` VALUES ('12', '2', '2', '2015-04-04 13:52:06', 'POS 9', '1', '-1');
INSERT INTO `kpos_inventory` VALUES ('13', '1', '2', '2015-04-05 15:08:52', 'POS 10', '1', '-2');
INSERT INTO `kpos_inventory` VALUES ('14', '2', '2', '2015-04-05 15:08:52', 'POS 10', '1', '-2');
INSERT INTO `kpos_inventory` VALUES ('15', '1', '2', '2015-04-05 15:10:22', 'POS 11', '1', '1');
INSERT INTO `kpos_inventory` VALUES ('16', '2', '2', '2015-04-05 15:10:22', 'POS 11', '1', '1');
INSERT INTO `kpos_inventory` VALUES ('17', '1', '1', '2015-04-05 15:45:22', 'POS 12', '1', '-1');
INSERT INTO `kpos_inventory` VALUES ('18', '2', '1', '2015-04-05 15:45:22', 'POS 12', '1', '-1');
INSERT INTO `kpos_inventory` VALUES ('19', '1', '1', '2015-04-05 16:53:36', 'POS 13', '1', '-1');
INSERT INTO `kpos_inventory` VALUES ('20', '1', '1', '2015-04-05 18:15:16', 'POS 14', '1', '-1');
INSERT INTO `kpos_inventory` VALUES ('21', '2', '1', '2015-04-05 18:15:16', 'POS 14', '1', '-1');
INSERT INTO `kpos_inventory` VALUES ('22', '1', '1', '2015-04-05 18:24:18', 'POS 15', '1', '-2');
INSERT INTO `kpos_inventory` VALUES ('23', '1', '1', '2015-04-05 18:25:20', 'POS 16', '1', '-2');
INSERT INTO `kpos_inventory` VALUES ('24', '2', '1', '2015-04-05 18:25:20', 'POS 16', '1', '-1');
INSERT INTO `kpos_inventory` VALUES ('25', '2', '1', '2015-04-05 18:29:22', 'POS 17', '1', '-3');
INSERT INTO `kpos_inventory` VALUES ('26', '1', '1', '2015-04-05 18:29:22', 'POS 17', '1', '-2');
INSERT INTO `kpos_inventory` VALUES ('27', '1', '1', '2015-04-05 19:20:44', 'POS 18', '1', '-1');
INSERT INTO `kpos_inventory` VALUES ('28', '3', '1', '2015-04-16 20:46:11', 'Manual Edit of Quantity', '1', '50');
INSERT INTO `kpos_inventory` VALUES ('29', '8', '1', '2015-04-16 23:16:34', 'Manual Edit of Quantity', '1', '5');
INSERT INTO `kpos_inventory` VALUES ('30', '9', '1', '2015-04-16 23:20:34', 'Manual Edit of Quantity', '1', '5');
INSERT INTO `kpos_inventory` VALUES ('31', '10', '1', '2015-04-16 23:22:37', 'Manual Edit of Quantity', '1', '1');
INSERT INTO `kpos_inventory` VALUES ('32', '12', '1', '2015-04-16 23:27:02', 'Manual Edit of Quantity', '1', '4');
INSERT INTO `kpos_inventory` VALUES ('33', '13', '1', '2015-04-16 23:28:30', 'Manual Edit of Quantity', '1', '5');
INSERT INTO `kpos_inventory` VALUES ('34', '2', '1', '2015-04-17 21:38:00', '', '1', '2');
INSERT INTO `kpos_inventory` VALUES ('35', '2', '1', '2015-04-17 21:39:07', '', '1', '-4');
INSERT INTO `kpos_inventory` VALUES ('36', '2', '1', '2015-04-17 21:39:19', '', '1', '2');
INSERT INTO `kpos_inventory` VALUES ('37', '2', '1', '2015-04-17 21:39:31', '', '1', '-2');
INSERT INTO `kpos_inventory` VALUES ('38', '2', '1', '2015-04-17 21:39:47', '', '1', '5');
INSERT INTO `kpos_inventory` VALUES ('39', '1', '1', '2015-04-18 21:32:04', '', '1', '-9');
INSERT INTO `kpos_inventory` VALUES ('40', '1', '1', '2015-04-18 21:32:47', '', '1', '10');
INSERT INTO `kpos_inventory` VALUES ('41', '8', '1', '2015-04-18 22:04:01', 'need to add 10 quantity', '1', '10');
INSERT INTO `kpos_inventory` VALUES ('42', '13', '1', '2015-04-19 21:47:53', 'RECV 1', '1', '1');
INSERT INTO `kpos_inventory` VALUES ('43', '1', '1', '2015-04-21 00:26:35', 'POS 19', '1', '-6');
INSERT INTO `kpos_inventory` VALUES ('44', '13', '1', '2015-04-21 00:26:35', 'POS 19', '1', '-1');
INSERT INTO `kpos_inventory` VALUES ('45', '1', '1', '2015-04-23 22:06:15', 'POS 20', '1', '-1');
INSERT INTO `kpos_inventory` VALUES ('46', '1', '1', '2015-04-23 22:08:40', 'POS 21', '1', '-3');
INSERT INTO `kpos_inventory` VALUES ('47', '10', '1', '2015-04-23 22:08:40', 'POS 21', '1', '-1');
INSERT INTO `kpos_inventory` VALUES ('48', '11', '1', '2015-04-23 22:08:40', 'POS 21', '1', '-1');
INSERT INTO `kpos_inventory` VALUES ('49', '13', '1', '2015-04-23 22:08:40', 'POS 21', '1', '-10');
INSERT INTO `kpos_inventory` VALUES ('50', '2', '1', '2015-04-23 22:08:40', 'POS 21', '1', '-1');
INSERT INTO `kpos_inventory` VALUES ('51', '10', '1', '2015-05-04 08:01:57', 'POS 22', '1', '-6');
INSERT INTO `kpos_inventory` VALUES ('52', '1', '1', '2015-05-04 08:01:57', 'POS 22', '1', '-70');
INSERT INTO `kpos_inventory` VALUES ('53', '13', '1', '2015-05-04 08:01:57', 'POS 22', '1', '-3');
INSERT INTO `kpos_inventory` VALUES ('54', '11', '1', '2015-05-04 08:01:57', 'POS 22', '1', '-10');
INSERT INTO `kpos_inventory` VALUES ('55', '7', '1', '2015-05-04 08:01:57', 'POS 22', '1', '-1');
INSERT INTO `kpos_inventory` VALUES ('56', '4', '1', '2015-05-04 08:01:57', 'POS 22', '1', '-10');

-- ----------------------------
-- Table structure for kpos_items
-- ----------------------------
DROP TABLE IF EXISTS `kpos_items`;
CREATE TABLE `kpos_items` (
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cost_price` decimal(15,2) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `reorder_level` decimal(15,2) NOT NULL DEFAULT '0.00',
  `receiving_quantity` int(11) NOT NULL DEFAULT '1',
  `item_id` int(10) NOT NULL AUTO_INCREMENT,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `custom1` varchar(25) NOT NULL,
  `custom2` varchar(25) NOT NULL,
  `custom3` varchar(25) NOT NULL,
  `custom4` varchar(25) NOT NULL,
  `custom5` varchar(25) NOT NULL,
  `custom6` varchar(25) NOT NULL,
  `custom7` varchar(25) NOT NULL,
  `custom8` varchar(25) NOT NULL,
  `custom9` varchar(25) NOT NULL,
  `custom10` varchar(25) NOT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_number` (`item_number`),
  KEY `ospos_items_ibfk_1` (`supplier_id`),
  CONSTRAINT `kpos_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `kpos_suppliers` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_items
-- ----------------------------
INSERT INTO `kpos_items` VALUES ('my item', 'default', null, '001', 'hello world', '45.75', '46.51', '0.00', '100', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `kpos_items` VALUES ('test1', 'default', null, '002', '', '35.00', '36.00', '0.00', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `kpos_items` VALUES ('sadfas fa', 'default', '13', '1234', '', '35.00', '44.00', '1.00', '0', '3', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `kpos_items` VALUES ('fasdfsafsa', 'default', '12', '004', '', '0.00', '0.00', '0.00', '0', '4', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `kpos_items` VALUES ('', '', null, null, '', '0.00', '0.00', '0.00', '0', '5', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `kpos_items` VALUES ('', '', null, null, '', '0.00', '0.00', '0.00', '0', '6', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `kpos_items` VALUES ('dfasf', 'fasdf', null, null, '', '40.00', '45.00', '0.00', '0', '7', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `kpos_items` VALUES ('fasdfasdfaf', 'default', null, null, '', '45.00', '46.00', '0.00', '0', '8', '0', '0', '1', '', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `kpos_items` VALUES ('sadfasdfa', 'default', null, null, '', '12.00', '13.00', '0.00', '0', '9', '0', '0', '1', '', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `kpos_items` VALUES ('asdfas', 'default', null, '006', '', '11.00', '12.00', '1.00', '0', '10', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `kpos_items` VALUES ('rewrqwer', 'default', null, '007', '', '5.00', '6.00', '0.00', '0', '11', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `kpos_items` VALUES ('dsfaf', 'default', null, null, '', '3.00', '4.00', '0.00', '0', '12', '0', '0', '1', '', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `kpos_items` VALUES ('norman item', 'default', null, '008', '', '4.00', '5.00', '0.00', '0', '13', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for kpos_items_taxes
-- ----------------------------
DROP TABLE IF EXISTS `kpos_items_taxes`;
CREATE TABLE `kpos_items_taxes` (
  `item_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,2) NOT NULL,
  PRIMARY KEY (`item_id`,`name`,`percent`),
  CONSTRAINT `kpos_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `kpos_items` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_items_taxes
-- ----------------------------
INSERT INTO `kpos_items_taxes` VALUES ('1', '', '12.00');
INSERT INTO `kpos_items_taxes` VALUES ('2', 'Sales Tax', '5.00');
INSERT INTO `kpos_items_taxes` VALUES ('3', 'None', '0.00');
INSERT INTO `kpos_items_taxes` VALUES ('4', '', '0.00');
INSERT INTO `kpos_items_taxes` VALUES ('5', '', '0.00');
INSERT INTO `kpos_items_taxes` VALUES ('6', '', '0.00');
INSERT INTO `kpos_items_taxes` VALUES ('7', '', '0.00');
INSERT INTO `kpos_items_taxes` VALUES ('8', '', '0.00');
INSERT INTO `kpos_items_taxes` VALUES ('9', '', '0.00');
INSERT INTO `kpos_items_taxes` VALUES ('10', '', '0.00');
INSERT INTO `kpos_items_taxes` VALUES ('11', '', '0.00');
INSERT INTO `kpos_items_taxes` VALUES ('12', '', '0.00');
INSERT INTO `kpos_items_taxes` VALUES ('13', '', '0.00');

-- ----------------------------
-- Table structure for kpos_item_kits
-- ----------------------------
DROP TABLE IF EXISTS `kpos_item_kits`;
CREATE TABLE `kpos_item_kits` (
  `item_kit_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`item_kit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_item_kits
-- ----------------------------
INSERT INTO `kpos_item_kits` VALUES ('1', 'test123', 'test');
INSERT INTO `kpos_item_kits` VALUES ('2', 'hello world', 'fasdf asdf asdf');

-- ----------------------------
-- Table structure for kpos_item_kit_items
-- ----------------------------
DROP TABLE IF EXISTS `kpos_item_kit_items`;
CREATE TABLE `kpos_item_kit_items` (
  `item_kit_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  PRIMARY KEY (`item_kit_id`,`item_id`,`quantity`),
  KEY `ospos_item_kit_items_ibfk_2` (`item_id`),
  CONSTRAINT `kpos_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `kpos_item_kits` (`item_kit_id`) ON DELETE CASCADE,
  CONSTRAINT `kpos_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `kpos_items` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_item_kit_items
-- ----------------------------
INSERT INTO `kpos_item_kit_items` VALUES ('1', '1', '2.00');
INSERT INTO `kpos_item_kit_items` VALUES ('2', '1', '1.00');
INSERT INTO `kpos_item_kit_items` VALUES ('1', '10', '1.00');
INSERT INTO `kpos_item_kit_items` VALUES ('2', '13', '1.00');

-- ----------------------------
-- Table structure for kpos_item_quantities
-- ----------------------------
DROP TABLE IF EXISTS `kpos_item_quantities`;
CREATE TABLE `kpos_item_quantities` (
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`,`location_id`),
  KEY `item_id` (`item_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `kpos_item_quantities_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `kpos_items` (`item_id`),
  CONSTRAINT `kpos_item_quantities_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `kpos_stock_locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kpos_item_quantities
-- ----------------------------
INSERT INTO `kpos_item_quantities` VALUES ('1', '1', '0');
INSERT INTO `kpos_item_quantities` VALUES ('1', '2', '0');
INSERT INTO `kpos_item_quantities` VALUES ('2', '1', '94');
INSERT INTO `kpos_item_quantities` VALUES ('2', '2', '0');
INSERT INTO `kpos_item_quantities` VALUES ('3', '1', '50');
INSERT INTO `kpos_item_quantities` VALUES ('4', '1', '-10');
INSERT INTO `kpos_item_quantities` VALUES ('4', '2', '0');
INSERT INTO `kpos_item_quantities` VALUES ('5', '2', '0');
INSERT INTO `kpos_item_quantities` VALUES ('6', '2', '0');
INSERT INTO `kpos_item_quantities` VALUES ('7', '1', '-1');
INSERT INTO `kpos_item_quantities` VALUES ('7', '2', '0');
INSERT INTO `kpos_item_quantities` VALUES ('8', '1', '15');
INSERT INTO `kpos_item_quantities` VALUES ('9', '1', '5');
INSERT INTO `kpos_item_quantities` VALUES ('10', '1', '-6');
INSERT INTO `kpos_item_quantities` VALUES ('10', '2', '0');
INSERT INTO `kpos_item_quantities` VALUES ('11', '1', '-11');
INSERT INTO `kpos_item_quantities` VALUES ('11', '2', '0');
INSERT INTO `kpos_item_quantities` VALUES ('12', '1', '4');
INSERT INTO `kpos_item_quantities` VALUES ('13', '1', '-8');
INSERT INTO `kpos_item_quantities` VALUES ('13', '2', '0');

-- ----------------------------
-- Table structure for kpos_loans
-- ----------------------------
DROP TABLE IF EXISTS `kpos_loans`;
CREATE TABLE `kpos_loans` (
  `loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL,
  `remarks` varchar(300) NOT NULL,
  `loan_type_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `loan_amount` decimal(10,2) NOT NULL,
  `loan_balance` decimal(10,2) NOT NULL,
  `loan_status` enum('pending','approved','on going','paid') NOT NULL,
  `loan_agent_id` int(11) NOT NULL,
  `loan_approved_by_id` int(11) NOT NULL,
  `loan_reviewed_by_id` int(11) NOT NULL,
  `loan_applied_date` int(11) NOT NULL,
  `loan_payment_date` int(11) NOT NULL,
  `misc_fees` text NOT NULL,
  `delete_flag` int(11) NOT NULL,
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kpos_loans
-- ----------------------------
INSERT INTO `kpos_loans` VALUES ('1', '0', '0', '0', '0', '0', '0.00', '0.00', 'pending', '0', '0', '1', '0', '0', '', '1');
INSERT INTO `kpos_loans` VALUES ('2', 'fgfh123', 'fsdf sad f', '0', '0', '3', '0.00', '0.00', 'pending', '0', '0', '0', '0', '0', '', '1');
INSERT INTO `kpos_loans` VALUES ('3', '2356', 'fasdfasdfas', '0', '0', '0', '0.00', '0.00', 'pending', '0', '0', '0', '0', '0', '', '1');
INSERT INTO `kpos_loans` VALUES ('4', 'dfgt565', 'fgsdfgdsg', '0', '0', '0', '0.00', '0.00', 'pending', '0', '0', '0', '0', '0', '', '1');
INSERT INTO `kpos_loans` VALUES ('5', 'gdfg', 'gfd', 'fasdf as fsa fa as f s', '7', '20', '50.00', '0.00', 'pending', '1', '0', '0', '1430928000', '1433606400', '{\"service charge\":\"100\",\"office charge\":\"50\"}', '0');
INSERT INTO `kpos_loans` VALUES ('6', 'fds34', 'fasdfas dfsa', '0', '5', '22', '100.00', '85.00', 'approved', '1', '1', '0', '1430841600', '1433839575', '', '0');
INSERT INTO `kpos_loans` VALUES ('7', '23fds', 'fasdfa sdf', 'he need it for his business thank you', '5', '22', '50.00', '0.00', 'pending', '0', '0', '0', '1431014400', '0', '', '1');
INSERT INTO `kpos_loans` VALUES ('8', 'test-account-123', 'dfasdf asd fsad fasd', '0', '5', '4', '250000.00', '50000.00', 'pending', '1', '0', '0', '1431014400', '1433839467', '{\"service fee\":\"50.50\",\"office supplies\":\"70.50\"}', '0');
INSERT INTO `kpos_loans` VALUES ('9', '0', '0', '0', '0', '0', '0.00', '0.00', 'pending', '0', '0', '0', '0', '0', '', '1');
INSERT INTO `kpos_loans` VALUES ('10', '12323', 'fsd fas', 'fsda fsadfsadfs fsdf sadf saf sadfas', '7', '18', '2000.00', '2000.00', 'approved', '1', '1', '0', '1430841600', '0', '{\"notarial fee\":\"100\",\"service charge\":\"50.75\"}', '0');
INSERT INTO `kpos_loans` VALUES ('11', 'fdsf', 'fsdf', '', '7', '3', '2000.00', '2000.00', 'approved', '1', '1', '0', '1430668800', '0', '', '0');
INSERT INTO `kpos_loans` VALUES ('12', '4423df', 'fasdf', '', '7', '22', '1000.00', '700.00', 'approved', '1', '1', '0', '1430668800', '1434087629', '', '0');
INSERT INTO `kpos_loans` VALUES ('13', 'df', '', '', '0', '0', '0.00', '0.00', 'pending', '0', '0', '0', '0', '0', '', '1');
INSERT INTO `kpos_loans` VALUES ('14', '2345', 'fsa fasdfs', 'kenahanglanun kaayo', '7', '4', '2500.00', '2500.00', 'approved', '1', '1', '0', '1432483200', '1435161600', '{\"Service Charge\":\"50.75\",\"Maintenance Fee\":\"25\"}', '0');

-- ----------------------------
-- Table structure for kpos_loan_payments
-- ----------------------------
DROP TABLE IF EXISTS `kpos_loan_payments`;
CREATE TABLE `kpos_loan_payments` (
  `loan_payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) NOT NULL DEFAULT '0',
  `loan_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `balance_amount` decimal(10,2) NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL,
  `teller_id` int(11) NOT NULL,
  `date_paid` int(11) NOT NULL,
  `date_modified` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `remarks` varchar(2000) NOT NULL,
  `delete_flag` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`loan_payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kpos_loan_payments
-- ----------------------------
INSERT INTO `kpos_loan_payments` VALUES ('10', '', '6', '22', '0.00', '100.00', '1', '1431100800', '0', '0', '', '0');
INSERT INTO `kpos_loan_payments` VALUES ('11', '', '12', '22', '0.00', '3.00', '1', '1430755200', '1430835819', '1', 'fasd', '0');
INSERT INTO `kpos_loan_payments` VALUES ('12', '', '12', '22', '0.00', '12.00', '1', '1431100800', '1431136553', '1', '', '0');
INSERT INTO `kpos_loan_payments` VALUES ('13', '', '12', '22', '0.00', '15.00', '1', '1431100800', '1431136566', '1', '', '0');
INSERT INTO `kpos_loan_payments` VALUES ('14', '', '12', '22', '0.00', '15.00', '1', '1431100800', '1431137673', '1', '', '0');
INSERT INTO `kpos_loan_payments` VALUES ('15', '', '12', '22', '0.00', '43.00', '1', '1431100800', '0', '0', '', '0');
INSERT INTO `kpos_loan_payments` VALUES ('16', '', '12', '22', '0.00', '10.00', '1', '1431100800', '0', '0', '', '0');
INSERT INTO `kpos_loan_payments` VALUES ('17', '', '12', '22', '0.00', '5.00', '1', '1431100800', '0', '0', '', '0');
INSERT INTO `kpos_loan_payments` VALUES ('18', '', '8', '4', '194900.00', '500.00', '1', '1431100800', '1431159935', '1', '', '0');
INSERT INTO `kpos_loan_payments` VALUES ('19', '', '8', '4', '245000.00', '50000.00', '1', '1431100800', '0', '0', '', '0');
INSERT INTO `kpos_loan_payments` VALUES ('20', '', '8', '4', '194500.00', '5000.00', '1', '1431100800', '1431159954', '1', '', '0');
INSERT INTO `kpos_loan_payments` VALUES ('21', '', '8', '4', '194500.00', '500.00', '1', '1431100800', '0', '0', '', '0');
INSERT INTO `kpos_loan_payments` VALUES ('22', '', '8', '4', '194000.00', '4000.00', '1', '1431100800', '0', '0', '', '0');
INSERT INTO `kpos_loan_payments` VALUES ('23', '', '8', '4', '190000.00', '90000.00', '1', '1431100800', '0', '0', '', '0');
INSERT INTO `kpos_loan_payments` VALUES ('24', '', '8', '4', '100000.00', '50000.00', '1', '1431100800', '0', '0', '', '0');
INSERT INTO `kpos_loan_payments` VALUES ('25', '', '6', '22', '100.00', '10.00', '1', '1431100800', '0', '0', '', '0');
INSERT INTO `kpos_loan_payments` VALUES ('26', '', '6', '22', '90.00', '5.00', '1', '1431100800', '0', '0', '', '0');
INSERT INTO `kpos_loan_payments` VALUES ('27', '', '12', '22', '880.00', '80.00', '1', '1431360000', '0', '0', '', '0');
INSERT INTO `kpos_loan_payments` VALUES ('28', '', '12', '22', '800.00', '100.00', '1', '1431360000', '0', '0', '', '0');

-- ----------------------------
-- Table structure for kpos_loan_types
-- ----------------------------
DROP TABLE IF EXISTS `kpos_loan_types`;
CREATE TABLE `kpos_loan_types` (
  `loan_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `term` int(11) NOT NULL,
  `term_period_type` varchar(50) NOT NULL,
  `percent_charge1` decimal(10,2) NOT NULL,
  `period_charge1` int(11) NOT NULL,
  `period_type1` varchar(50) NOT NULL,
  `percent_charge2` decimal(10,2) NOT NULL,
  `period_charge2` int(11) NOT NULL,
  `period_type2` varchar(50) NOT NULL,
  `percent_charge3` decimal(10,2) NOT NULL,
  `period_charge3` int(11) NOT NULL,
  `period_type3` varchar(50) NOT NULL,
  `percent_charge4` decimal(10,2) NOT NULL,
  `period_charge4` int(11) NOT NULL,
  `period_type4` varchar(50) NOT NULL,
  `percent_charge5` decimal(10,2) NOT NULL,
  `period_charge5` int(11) NOT NULL,
  `period_type5` varchar(50) NOT NULL,
  `percent_charge6` decimal(10,2) NOT NULL,
  `period_charge6` int(11) NOT NULL,
  `period_type6` varchar(50) NOT NULL,
  `percent_charge7` decimal(10,2) NOT NULL,
  `period_charge7` int(11) NOT NULL,
  `period_type7` varchar(50) NOT NULL,
  `percent_charge8` decimal(10,2) NOT NULL,
  `period_charge8` int(11) NOT NULL,
  `period_type8` varchar(50) NOT NULL,
  `percent_charge9` decimal(10,2) NOT NULL,
  `period_charge9` int(11) NOT NULL,
  `period_type9` varchar(50) NOT NULL,
  `percent_charge10` decimal(10,2) NOT NULL,
  `period_charge10` int(11) NOT NULL,
  `period_type10` varchar(50) NOT NULL,
  `added_by` int(11) NOT NULL,
  `date_added` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `date_modified` int(11) NOT NULL,
  PRIMARY KEY (`loan_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kpos_loan_types
-- ----------------------------
INSERT INTO `kpos_loan_types` VALUES ('5', 'mais loan', 'for maisan loan, etc.', '1', 'monthly', '1.20', '1', 'year', '2.00', '1', 'month', '0.00', '0', 'week', '0.00', '0', 'week', '0.00', '0', 'week', '0.00', '0', 'week', '0.00', '0', 'week', '0.00', '0', 'week', '0.00', '0', 'week', '0.00', '0', 'week', '0', '0', '0', '0');
INSERT INTO `kpos_loan_types` VALUES ('7', 'tubo loans', 'loans for tubo, etc.', '1', 'monthly', '1.20', '1', 'year', '0.00', '0', 'week', '0.00', '0', 'week', '0.00', '0', 'week', '0.00', '0', 'week', '0.00', '0', 'week', '0.00', '0', 'week', '0.00', '0', 'week', '0.00', '0', 'week', '0.00', '0', 'week', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for kpos_messages
-- ----------------------------
DROP TABLE IF EXISTS `kpos_messages`;
CREATE TABLE `kpos_messages` (
  `message_id` int(11) NOT NULL,
  `recipient_id` varchar(100) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `body` text,
  `send_date` date DEFAULT NULL,
  `sender_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_messages
-- ----------------------------

-- ----------------------------
-- Table structure for kpos_modules
-- ----------------------------
DROP TABLE IF EXISTS `kpos_modules`;
CREATE TABLE `kpos_modules` (
  `module_id` varchar(255) NOT NULL,
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `icons` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  UNIQUE KEY `name_lang_key` (`name_lang_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_modules
-- ----------------------------
INSERT INTO `kpos_modules` VALUES ('config', 'module_config', 'module_config_desc', '100', '<i class=\"fa fa-cogs\" style=\"font-size: 50px; color:#26B6AE\"></i>', '1');
INSERT INTO `kpos_modules` VALUES ('customers', 'module_customers', 'module_customers_desc', '10', '<i class=\"fa fa-smile-o\" style=\"font-size: 50px; color:#FF5400\"></i>', '1');
INSERT INTO `kpos_modules` VALUES ('employees', 'module_employees', 'module_employees_desc', '80', '<i class=\"fa fa-users\" style=\"font-size: 50px; color:#FF5400\"></i>', '1');
INSERT INTO `kpos_modules` VALUES ('giftcards', 'module_giftcards', 'module_giftcards_desc', '90', '', '0');
INSERT INTO `kpos_modules` VALUES ('items', 'module_items', 'module_items_desc', '20', '', '0');
INSERT INTO `kpos_modules` VALUES ('item_kits', 'module_item_kits', 'module_item_kits_desc', '30', '', '0');
INSERT INTO `kpos_modules` VALUES ('loans', 'module_loans', 'module_loans_desc', '80', '<i class=\"fa fa-money\" style=\"font-size: 50px; color:#4EA216\"></i>', '1');
INSERT INTO `kpos_modules` VALUES ('loan_types', 'module_loan_types', 'module_loan_types_desc', '79', '<i class=\"fa fa-sitemap\" style=\"font-size: 50px; color:#e80a0a\"></i>', '1');
INSERT INTO `kpos_modules` VALUES ('payments', 'module_payments', 'module_payments_desc', '80', '<i class=\"fa fa-paypal\" style=\"font-size: 50px; color:#2B9EC4\"></i>', '1');
INSERT INTO `kpos_modules` VALUES ('receivings', 'module_receivings', 'module_receivings_desc', '60', '', '0');
INSERT INTO `kpos_modules` VALUES ('reports', 'module_reports', 'module_reports_desc', '50', '<i class=\"fa fa-bar-chart\" style=\"font-size: 50px; color:#2B9EC4\"></i>', '0');
INSERT INTO `kpos_modules` VALUES ('sales', 'module_sales', 'module_sales_desc', '70', '<i class=\"fa fa-usd\" style=\"font-size: 50px; color:#e80a0a\"></i>', '0');
INSERT INTO `kpos_modules` VALUES ('suppliers', 'module_suppliers', 'module_suppliers_desc', '40', '', '0');

-- ----------------------------
-- Table structure for kpos_payment_schedules
-- ----------------------------
DROP TABLE IF EXISTS `kpos_payment_schedules`;
CREATE TABLE `kpos_payment_schedules` (
  `payment_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `recurrence` int(11) NOT NULL DEFAULT '0',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`payment_schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kpos_payment_schedules
-- ----------------------------
INSERT INTO `kpos_payment_schedules` VALUES ('1', 'weekly', '0', '0');
INSERT INTO `kpos_payment_schedules` VALUES ('2', 'biweekly', '0', '0');
INSERT INTO `kpos_payment_schedules` VALUES ('3', 'monthly', '0', '0');
INSERT INTO `kpos_payment_schedules` VALUES ('4', 'bimonthly', '0', '0');

-- ----------------------------
-- Table structure for kpos_people
-- ----------------------------
DROP TABLE IF EXISTS `kpos_people`;
CREATE TABLE `kpos_people` (
  `person_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `photo_url` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_people
-- ----------------------------
INSERT INTO `kpos_people` VALUES ('1', 'Admin', 'Marino', '', '421-2583', 'admin@loans.com', 'nowhere', '0', '0', '0', '0', '0', '0');
INSERT INTO `kpos_people` VALUES ('2', 'norman', 'marino', '100_81433.jpg', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('3', 'customer 123', 'customer name', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('4', 'norman1', 'marino', 'tree.jpg', '421-2583', 'norman.marino@gmail.com', 'fsdf asdfasdfas df', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('5', 'John', 'doe', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('6', 'John', 'doe', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('7', 'John', 'doe', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('8', 'test', 'test', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('9', 'j', 'j', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('10', 'dsfas123', 'fasdf123', '', '', '', 'Upper Cantil-e Dumaguete City, Neg. Or. Philippines 6200', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('11', 'hello', 'world', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('12', 'rodrigo', 'zuellig', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('13', 'norman', 'marino', '', '', 'norman.marino@gmail.com', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('14', 'ronard', 'cauba', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('15', 'normantest', 'testnorman', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('16', 'beboy', 'boboy', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('17', 'jb', 'jb', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('18', 'Chad', 'Alvarez', '', '', 'chad@alvarez.com', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('19', 'regidor', 'marino', 'norman.jpg', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('20', 'dsfasdfa', 'fasdfa', 'tree.jpg', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('21', 'test', 'sfdas', 'norman.jpg', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('22', 'ronard', 'cauba', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('23', 'regidor', 'marino', '1609802_666202490102593_1919724290_n (1).jpg', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('27', 'fasdfasdf', 'fasdfasdf', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('28', 'fsdf asdf as', 'df asdfs', 'me_bata.jpg', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('29', 'fsadf asdf asf as ', 'f asdfsadf sdf s', 'selfie2.jpg', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('31', 'fsadf asdf asf as ', 'f asdfsadf sdf s', 'selfie2.jpg', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('33', 'new1', 'fsadfsdf', 'selfie2.jpg', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('37', 'dgdsfgsdgd', 'gsdfgsdfgsdg', 'selfie2.jpg', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('41', 'asdfasdf sdaf sdf', 'fa sfsdfsafad fsdf', 'o_19l3917rl1h4rq908emsae36jh.jpg', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('42', 'fsd fsa dfasdf', 'fs adfsdfsdf', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('43', 'sdfds fas', 'tertert', 'images.jpg', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('44', 'finally', 'working', 'images.jpg', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('45', 'luiz', 'beck', 'o_19l38lien83a1toip8kakh30t7.jpg', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('46', 'luiz', 'beck', '20150112_155934-1.jpg', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('47', 'fasdfsad', 'fsadfsadf', 'o_19l38mgeo1uan9s61p1cp1l1isc7.jpg', '', '', '', '', '', '', '', '', '');
INSERT INTO `kpos_people` VALUES ('48', 'new cust', 'fsdf', 'o_19l3a54bv1pne1g0e1nvp1ji11qfp7.jpg', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for kpos_permissions
-- ----------------------------
DROP TABLE IF EXISTS `kpos_permissions`;
CREATE TABLE `kpos_permissions` (
  `permission_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `location_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `module_id` (`module_id`),
  KEY `ospos_permissions_ibfk_2` (`location_id`),
  CONSTRAINT `kpos_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `kpos_modules` (`module_id`) ON DELETE CASCADE,
  CONSTRAINT `kpos_permissions_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `kpos_stock_locations` (`location_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_permissions
-- ----------------------------
INSERT INTO `kpos_permissions` VALUES ('config', 'config', null);
INSERT INTO `kpos_permissions` VALUES ('customers', 'customers', null);
INSERT INTO `kpos_permissions` VALUES ('employees', 'employees', null);
INSERT INTO `kpos_permissions` VALUES ('giftcards', 'giftcards', null);
INSERT INTO `kpos_permissions` VALUES ('items', 'items', null);
INSERT INTO `kpos_permissions` VALUES ('items_', 'items', '2');
INSERT INTO `kpos_permissions` VALUES ('items_stock', 'items', '1');
INSERT INTO `kpos_permissions` VALUES ('item_kits', 'item_kits', null);
INSERT INTO `kpos_permissions` VALUES ('loans', 'loans', null);
INSERT INTO `kpos_permissions` VALUES ('loan_types', 'loan_types', null);
INSERT INTO `kpos_permissions` VALUES ('payments', 'payments', null);
INSERT INTO `kpos_permissions` VALUES ('receivings', 'receivings', null);
INSERT INTO `kpos_permissions` VALUES ('reports', 'reports', null);
INSERT INTO `kpos_permissions` VALUES ('reports_categories', 'reports', null);
INSERT INTO `kpos_permissions` VALUES ('reports_customers', 'reports', null);
INSERT INTO `kpos_permissions` VALUES ('reports_discounts', 'reports', null);
INSERT INTO `kpos_permissions` VALUES ('reports_employees', 'reports', null);
INSERT INTO `kpos_permissions` VALUES ('reports_inventory', 'reports', null);
INSERT INTO `kpos_permissions` VALUES ('reports_items', 'reports', null);
INSERT INTO `kpos_permissions` VALUES ('reports_payments', 'reports', null);
INSERT INTO `kpos_permissions` VALUES ('reports_receivings', 'reports', null);
INSERT INTO `kpos_permissions` VALUES ('reports_sales', 'reports', null);
INSERT INTO `kpos_permissions` VALUES ('reports_suppliers', 'reports', null);
INSERT INTO `kpos_permissions` VALUES ('reports_taxes', 'reports', null);
INSERT INTO `kpos_permissions` VALUES ('sales', 'sales', null);
INSERT INTO `kpos_permissions` VALUES ('suppliers', 'suppliers', null);

-- ----------------------------
-- Table structure for kpos_receivings
-- ----------------------------
DROP TABLE IF EXISTS `kpos_receivings`;
CREATE TABLE `kpos_receivings` (
  `receiving_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `receiving_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(20) DEFAULT NULL,
  `invoice_number` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`receiving_id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `supplier_id` (`supplier_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `kpos_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `kpos_employees` (`person_id`),
  CONSTRAINT `kpos_receivings_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `kpos_suppliers` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_receivings
-- ----------------------------
INSERT INTO `kpos_receivings` VALUES ('2015-04-19 21:47:53', null, '1', '', '1', 'Cash', null);

-- ----------------------------
-- Table structure for kpos_receivings_items
-- ----------------------------
DROP TABLE IF EXISTS `kpos_receivings_items`;
CREATE TABLE `kpos_receivings_items` (
  `receiving_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL,
  `quantity_purchased` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  PRIMARY KEY (`receiving_id`,`item_id`,`line`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `kpos_receivings_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `kpos_items` (`item_id`),
  CONSTRAINT `kpos_receivings_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `kpos_receivings` (`receiving_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_receivings_items
-- ----------------------------
INSERT INTO `kpos_receivings_items` VALUES ('1', '13', '', '', '1', '1.00', '4.00', '4.00', '0.00', '1');

-- ----------------------------
-- Table structure for kpos_roles
-- ----------------------------
DROP TABLE IF EXISTS `kpos_roles`;
CREATE TABLE `kpos_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `low_level` varchar(200) DEFAULT NULL,
  `rights` text,
  `added_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kpos_roles
-- ----------------------------
INSERT INTO `kpos_roles` VALUES ('13', 'admin', '[\"13\",\"15\"]', '[\"customers\",\"roles\",\"plugins\",\"loan_types\",\"loans\",\"overdues\",\"payments\",\"employees\",\"config\"]', '1');
INSERT INTO `kpos_roles` VALUES ('15', 'Staff', 'false', '[\"customers\",\"roles\",\"plugins\",\"loan_types\"]', '1');

-- ----------------------------
-- Table structure for kpos_sales
-- ----------------------------
DROP TABLE IF EXISTS `kpos_sales`;
CREATE TABLE `kpos_sales` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `invoice_number` varchar(32) DEFAULT NULL,
  `sale_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `kpos_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `kpos_employees` (`person_id`),
  CONSTRAINT `kpos_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `kpos_customers` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_sales
-- ----------------------------
INSERT INTO `kpos_sales` VALUES ('2015-04-03 05:48:46', null, '1', '0', null, '1', 'Cash: $100.00<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-03 06:04:01', null, '1', '0', null, '2', 'Cash: $52.08<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-03 08:57:49', null, '1', '0', null, '3', 'Cash: $52.08<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-03 08:59:05', null, '1', '0', null, '4', 'Cash: $104.16<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-03 09:11:42', null, '1', '0', null, '5', 'Cash: P102.08<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-04 07:19:33', null, '1', 'sf safs afas fs fsad sqf', null, '6', 'Cash: P52.08<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-04 07:21:42', null, '1', '0', null, '7', 'Cash: P52.08<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-04 07:22:20', null, '1', '0', null, '8', 'Cash: -P52.08<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-04 13:52:05', null, '2', '0', null, '9', 'Cash: P140.16<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-05 15:08:52', null, '2', '0', '11', '10', 'Cash: P176.16<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-05 15:10:21', null, '2', '0', '1', '11', 'Cash: -P88.08<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-05 15:45:21', '10', '1', '0', null, '12', 'Cash: P88.08<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-05 16:53:35', null, '1', '0', null, '13', 'Cash: P52.08<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-05 18:15:16', '9', '1', '0', '25', '14', 'Cash: P88.08<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-05 18:24:18', null, '1', '0', '28', '15', 'Cash: P104.16<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-05 18:25:19', null, '1', '0', '4', '16', 'Cash: P140.16<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-05 18:29:22', null, '1', '0', '5', '17', 'Cash: P212.16<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-05 19:20:44', null, '1', '0', null, '18', 'Cash: P20.00<br />Credit Card: P32.08<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-21 00:26:35', null, '1', '0', '6', '19', 'Check: P610.10<br />Credit Card: P40.00<br />Cash: -P345.05<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-23 22:06:15', null, '1', '0', null, '20', 'Cash: P60.00<br />');
INSERT INTO `kpos_sales` VALUES ('2015-04-23 22:08:40', null, '1', '0', null, '21', 'Cash: P500.00<br />');
INSERT INTO `kpos_sales` VALUES ('2015-05-04 08:01:57', null, '1', '0', null, '22', '');

-- ----------------------------
-- Table structure for kpos_sales_items
-- ----------------------------
DROP TABLE IF EXISTS `kpos_sales_items`;
CREATE TABLE `kpos_sales_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`),
  KEY `item_location` (`item_location`),
  CONSTRAINT `kpos_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `kpos_items` (`item_id`),
  CONSTRAINT `kpos_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `kpos_sales` (`sale_id`),
  CONSTRAINT `kpos_sales_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `kpos_stock_locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_sales_items
-- ----------------------------
INSERT INTO `kpos_sales_items` VALUES ('1', '1', 'hello world', '', '1', '1.00', '45.75', '46.50', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('2', '1', 'hello world', '', '1', '1.00', '45.75', '46.50', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('3', '1', 'hello world', '', '1', '1.00', '45.75', '46.50', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('4', '1', 'hello world', '', '1', '2.00', '45.75', '46.50', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('5', '1', 'hello world', '', '1', '2.00', '45.75', '46.50', '2.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('6', '1', 'hello world', '', '1', '1.00', '45.75', '46.50', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('7', '1', 'hello world', '', '1', '1.00', '45.75', '46.50', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('8', '1', 'hello world', '', '1', '-1.00', '45.75', '46.50', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('9', '1', 'hello world', '', '1', '2.00', '45.75', '46.50', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('9', '2', '', '', '2', '1.00', '35.00', '36.00', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('10', '1', 'hello world', '', '1', '2.00', '45.75', '46.50', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('10', '2', '', '', '2', '2.00', '35.00', '36.00', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('11', '1', 'hello world', '', '1', '-1.00', '45.75', '46.50', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('11', '2', '', '', '2', '-1.00', '35.00', '36.00', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('12', '1', 'hello world', '', '1', '1.00', '45.75', '46.50', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('12', '2', '', '', '2', '1.00', '35.00', '36.00', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('13', '1', 'hello world', '', '1', '1.00', '45.75', '46.50', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('14', '1', 'hello world', '', '1', '1.00', '45.75', '46.50', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('14', '2', '', '', '2', '1.00', '35.00', '36.00', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('15', '1', 'hello world', '', '1', '2.00', '45.75', '46.50', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('16', '1', 'hello world', '', '1', '2.00', '45.75', '46.50', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('16', '2', '', '', '2', '1.00', '35.00', '36.00', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('17', '1', 'hello world', '', '2', '2.00', '45.75', '46.50', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('17', '2', '', '', '1', '3.00', '35.00', '36.00', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('18', '1', 'hello world', '', '1', '1.00', '45.75', '46.50', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('19', '1', '0', '0', '1', '6.00', '45.75', '46.51', '4.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('19', '13', '', '', '2', '1.00', '4.00', '5.00', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('20', '1', 'hello world', '', '1', '1.00', '45.75', '46.51', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('21', '1', 'hello world', '', '1', '3.00', '45.75', '46.51', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('21', '2', '', '', '5', '1.00', '35.00', '36.00', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('21', '10', '', '', '2', '1.00', '11.00', '12.00', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('21', '11', '', '', '3', '1.00', '5.00', '6.00', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('21', '13', '0', '0', '4', '10.00', '4.00', '5.00', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('22', '1', '0', '0', '7', '70.00', '45.75', '46.51', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('22', '4', '0', '0', '11', '10.00', '0.00', '0.00', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('22', '7', '', '', '10', '1.00', '40.00', '45.00', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('22', '10', '0', '0', '6', '6.00', '11.00', '12.00', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('22', '11', '0', '0', '9', '10.00', '5.00', '6.00', '0.00', '1');
INSERT INTO `kpos_sales_items` VALUES ('22', '13', '', '', '8', '3.00', '4.00', '5.00', '0.00', '1');

-- ----------------------------
-- Table structure for kpos_sales_items_taxes
-- ----------------------------
DROP TABLE IF EXISTS `kpos_sales_items_taxes`;
CREATE TABLE `kpos_sales_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `kpos_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `kpos_sales_items` (`sale_id`),
  CONSTRAINT `kpos_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `kpos_items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_sales_items_taxes
-- ----------------------------
INSERT INTO `kpos_sales_items_taxes` VALUES ('1', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('2', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('3', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('4', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('5', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('6', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('7', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('8', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('9', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('10', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('11', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('12', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('13', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('14', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('15', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('16', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('17', '1', '2', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('18', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('19', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('19', '13', '2', '', '0.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('20', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('21', '1', '1', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('21', '2', '5', 'Sales Tax', '5.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('21', '10', '2', '', '0.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('21', '11', '3', '', '0.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('21', '13', '4', '', '0.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('22', '1', '7', '', '12.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('22', '4', '11', '', '0.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('22', '7', '10', '', '0.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('22', '10', '6', '', '0.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('22', '11', '9', '', '0.00');
INSERT INTO `kpos_sales_items_taxes` VALUES ('22', '13', '8', '', '0.00');

-- ----------------------------
-- Table structure for kpos_sales_payments
-- ----------------------------
DROP TABLE IF EXISTS `kpos_sales_payments`;
CREATE TABLE `kpos_sales_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`payment_type`),
  KEY `sale_id` (`sale_id`),
  CONSTRAINT `kpos_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `kpos_sales` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_sales_payments
-- ----------------------------
INSERT INTO `kpos_sales_payments` VALUES ('1', 'Cash', '100.00');
INSERT INTO `kpos_sales_payments` VALUES ('2', 'Cash', '52.08');
INSERT INTO `kpos_sales_payments` VALUES ('3', 'Cash', '52.08');
INSERT INTO `kpos_sales_payments` VALUES ('4', 'Cash', '104.16');
INSERT INTO `kpos_sales_payments` VALUES ('5', 'Cash', '102.08');
INSERT INTO `kpos_sales_payments` VALUES ('6', 'Cash', '52.08');
INSERT INTO `kpos_sales_payments` VALUES ('7', 'Cash', '52.08');
INSERT INTO `kpos_sales_payments` VALUES ('8', 'Cash', '-52.08');
INSERT INTO `kpos_sales_payments` VALUES ('9', 'Cash', '140.16');
INSERT INTO `kpos_sales_payments` VALUES ('10', 'Cash', '176.16');
INSERT INTO `kpos_sales_payments` VALUES ('11', 'Cash', '-88.08');
INSERT INTO `kpos_sales_payments` VALUES ('12', 'Cash', '88.08');
INSERT INTO `kpos_sales_payments` VALUES ('13', 'Cash', '52.08');
INSERT INTO `kpos_sales_payments` VALUES ('14', 'Cash', '88.08');
INSERT INTO `kpos_sales_payments` VALUES ('15', 'Cash', '104.16');
INSERT INTO `kpos_sales_payments` VALUES ('16', 'Cash', '140.16');
INSERT INTO `kpos_sales_payments` VALUES ('17', 'Cash', '212.16');
INSERT INTO `kpos_sales_payments` VALUES ('18', 'Cash', '20.00');
INSERT INTO `kpos_sales_payments` VALUES ('18', 'Credit Card', '32.08');
INSERT INTO `kpos_sales_payments` VALUES ('19', 'Cash', '-345.05');
INSERT INTO `kpos_sales_payments` VALUES ('19', 'Check', '610.10');
INSERT INTO `kpos_sales_payments` VALUES ('19', 'Credit Card', '40.00');
INSERT INTO `kpos_sales_payments` VALUES ('20', 'Cash', '60.00');
INSERT INTO `kpos_sales_payments` VALUES ('21', 'Cash', '500.00');

-- ----------------------------
-- Table structure for kpos_sales_suspended
-- ----------------------------
DROP TABLE IF EXISTS `kpos_sales_suspended`;
CREATE TABLE `kpos_sales_suspended` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `invoice_number` varchar(32) DEFAULT NULL,
  `sale_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `kpos_sales_suspended_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `kpos_employees` (`person_id`),
  CONSTRAINT `kpos_sales_suspended_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `kpos_customers` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_sales_suspended
-- ----------------------------

-- ----------------------------
-- Table structure for kpos_sales_suspended_items
-- ----------------------------
DROP TABLE IF EXISTS `kpos_sales_suspended_items`;
CREATE TABLE `kpos_sales_suspended_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`),
  KEY `ospos_sales_suspended_items_ibfk_3` (`item_location`),
  CONSTRAINT `kpos_sales_suspended_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `kpos_items` (`item_id`),
  CONSTRAINT `kpos_sales_suspended_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `kpos_sales_suspended` (`sale_id`),
  CONSTRAINT `kpos_sales_suspended_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `kpos_stock_locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_sales_suspended_items
-- ----------------------------

-- ----------------------------
-- Table structure for kpos_sales_suspended_items_taxes
-- ----------------------------
DROP TABLE IF EXISTS `kpos_sales_suspended_items_taxes`;
CREATE TABLE `kpos_sales_suspended_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `kpos_sales_suspended_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `kpos_sales_suspended_items` (`sale_id`),
  CONSTRAINT `kpos_sales_suspended_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `kpos_items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_sales_suspended_items_taxes
-- ----------------------------

-- ----------------------------
-- Table structure for kpos_sales_suspended_payments
-- ----------------------------
DROP TABLE IF EXISTS `kpos_sales_suspended_payments`;
CREATE TABLE `kpos_sales_suspended_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`payment_type`),
  CONSTRAINT `kpos_sales_suspended_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `kpos_sales_suspended` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_sales_suspended_payments
-- ----------------------------

-- ----------------------------
-- Table structure for kpos_sessions
-- ----------------------------
DROP TABLE IF EXISTS `kpos_sessions`;
CREATE TABLE `kpos_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_sessions
-- ----------------------------
INSERT INTO `kpos_sessions` VALUES ('057eadc56c5675c94434c64ac7e97a7c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36', '1428134875', '');
INSERT INTO `kpos_sessions` VALUES ('08c5c6ab0d5228797e908783ae718d42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1429797733', '');
INSERT INTO `kpos_sessions` VALUES ('0c7eb0f4000e06e3526a45bde9cc2464', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1430727972', 'a:8:{s:9:\"user_data\";s:0:\"\";s:9:\"person_id\";s:1:\"1\";s:13:\"sale_location\";s:1:\"1\";s:4:\"cart\";a:6:{i:1;a:14:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:1;s:4:\"name\";s:7:\"my item\";s:11:\"item_number\";s:3:\"001\";s:11:\"description\";b:0;s:12:\"serialnumber\";b:0;s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";d:11;s:8:\"discount\";s:1:\"0\";s:8:\"in_stock\";s:1:\"0\";s:5:\"price\";s:5:\"46.51\";}i:2;a:14:{s:7:\"item_id\";s:1:\"2\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:2;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:3:\"002\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:2;s:8:\"discount\";i:0;s:8:\"in_stock\";s:2:\"94\";s:5:\"price\";s:5:\"36.00\";}i:3;a:14:{s:7:\"item_id\";s:2:\"13\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:3;s:4:\"name\";s:11:\"norman item\";s:11:\"item_number\";s:3:\"008\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";d:6;s:8:\"discount\";i:0;s:8:\"in_stock\";s:2:\"-8\";s:5:\"price\";s:4:\"5.00\";}i:4;a:14:{s:7:\"item_id\";s:2:\"11\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:4;s:4:\"name\";s:8:\"rewrqwer\";s:11:\"item_number\";s:3:\"007\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:3;s:8:\"discount\";i:0;s:8:\"in_stock\";s:3:\"-11\";s:5:\"price\";s:4:\"6.00\";}i:5;a:14:{s:7:\"item_id\";s:2:\"10\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:5;s:4:\"name\";s:6:\"asdfas\";s:11:\"item_number\";s:3:\"006\";s:11:\"description\";b:0;s:12:\"serialnumber\";b:0;s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";s:1:\"5\";s:8:\"discount\";s:1:\"0\";s:8:\"in_stock\";s:2:\"-6\";s:5:\"price\";s:5:\"12.00\";}i:6;a:14:{s:7:\"item_id\";s:1:\"7\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:6;s:4:\"name\";s:5:\"dfasf\";s:11:\"item_number\";N;s:11:\"description\";b:0;s:12:\"serialnumber\";b:0;s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";s:1:\"4\";s:8:\"discount\";s:1:\"0\";s:8:\"in_stock\";s:2:\"-1\";s:5:\"price\";s:5:\"45.00\";}}s:9:\"sale_mode\";s:4:\"sale\";s:8:\"customer\";i:-1;s:8:\"payments\";a:0:{}s:20:\"sales_invoice_number\";s:1:\"7\";}');
INSERT INTO `kpos_sessions` VALUES ('0ca8c23fe774dc286edb4ad61a887175', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36', '1428134826', '');
INSERT INTO `kpos_sessions` VALUES ('0ee0bf063bccb339b1db574a89fcc3b6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '1428297168', 'a:9:{s:9:\"user_data\";s:0:\"\";s:9:\"person_id\";s:1:\"1\";s:13:\"sale_location\";s:1:\"1\";s:28:\"sales_invoice_number_enabled\";s:4:\"true\";s:4:\"cart\";a:2:{i:1;a:14:{s:7:\"item_id\";s:1:\"2\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:1;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:3:\"002\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:1;s:8:\"discount\";i:0;s:8:\"in_stock\";s:2:\"92\";s:5:\"price\";s:5:\"36.00\";}i:2;a:14:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:2;s:4:\"name\";s:7:\"my item\";s:11:\"item_number\";s:3:\"001\";s:11:\"description\";s:11:\"hello world\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:1;s:8:\"discount\";i:0;s:8:\"in_stock\";s:2:\"79\";s:5:\"price\";s:5:\"46.50\";}}s:9:\"sale_mode\";s:4:\"sale\";s:8:\"customer\";i:-1;s:8:\"payments\";a:1:{s:4:\"Cash\";a:2:{s:12:\"payment_type\";s:4:\"Cash\";s:14:\"payment_amount\";s:5:\"88.08\";}}s:20:\"sales_invoice_number\";s:1:\"6\";}');
INSERT INTO `kpos_sessions` VALUES ('19acf810ec0d1a0e54cae4d7d5afc0a6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1430007557', 'a:9:{s:9:\"user_data\";s:0:\"\";s:9:\"person_id\";s:1:\"1\";s:13:\"sale_location\";s:1:\"1\";s:4:\"cart\";a:2:{i:3;a:14:{s:7:\"item_id\";s:1:\"2\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:3;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:3:\"002\";s:11:\"description\";b:0;s:12:\"serialnumber\";b:0;s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";s:1:\"4\";s:8:\"discount\";s:1:\"0\";s:8:\"in_stock\";s:2:\"94\";s:5:\"price\";s:5:\"36.00\";}i:4;a:14:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:4;s:4:\"name\";s:7:\"my item\";s:11:\"item_number\";s:3:\"001\";s:11:\"description\";s:11:\"hello world\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:1;s:8:\"discount\";i:0;s:8:\"in_stock\";s:2:\"70\";s:5:\"price\";s:5:\"46.51\";}}s:8:\"payments\";a:1:{s:4:\"Cash\";a:2:{s:12:\"payment_type\";s:4:\"Cash\";s:14:\"payment_amount\";s:5:\"36.00\";}}s:8:\"customer\";i:-1;s:7:\"comment\";s:1:\"0\";s:20:\"sales_invoice_number\";s:1:\"5\";s:9:\"sale_mode\";s:4:\"sale\";}');
INSERT INTO `kpos_sessions` VALUES ('357de6ba50bf442eb759228061bfcf0b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1429435438', '');
INSERT INTO `kpos_sessions` VALUES ('39117afc447eab3162071add3362b17e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1429709373', '');
INSERT INTO `kpos_sessions` VALUES ('463d3c795e728723f8b849048af3f9aa', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1429622188', '');
INSERT INTO `kpos_sessions` VALUES ('470ddd9a9996c4ad6cc533db085ce934', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1429622565', '');
INSERT INTO `kpos_sessions` VALUES ('4e18c23dc17f94b25628f422f46f4c26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1429413183', '');
INSERT INTO `kpos_sessions` VALUES ('4faff9afface83d0680669ae30afe625', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1429622578', '');
INSERT INTO `kpos_sessions` VALUES ('527515eeb5c8fe912a163f5748babe0c', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', '1431415910', 'a:1:{s:9:\"person_id\";s:1:\"1\";}');
INSERT INTO `kpos_sessions` VALUES ('54fc4c8f43575203c848e42faa05ca8b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1429621960', '');
INSERT INTO `kpos_sessions` VALUES ('597c9f2dd2bd3b4b48ffa74068a66cf5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36', '1428134802', '');
INSERT INTO `kpos_sessions` VALUES ('5aa2b87d0f17aa09c3d39e9336a8e711', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1429278399', '');
INSERT INTO `kpos_sessions` VALUES ('5bc76e37cc1f811c8fe3a9dcd1c8c653', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36', '1428155620', 'a:7:{s:9:\"person_id\";s:1:\"1\";s:13:\"sale_location\";s:1:\"1\";s:9:\"sale_mode\";s:6:\"return\";s:4:\"cart\";a:0:{}s:8:\"customer\";i:-1;s:8:\"payments\";a:0:{}s:20:\"sales_invoice_number\";s:1:\"0\";}');
INSERT INTO `kpos_sessions` VALUES ('607a0126f265985d3204d555d7ef9b9d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36', '1428142589', 'a:8:{s:9:\"user_data\";s:0:\"\";s:9:\"person_id\";s:1:\"2\";s:13:\"sale_location\";s:1:\"1\";s:9:\"sale_mode\";s:4:\"sale\";s:4:\"cart\";a:0:{}s:8:\"customer\";i:-1;s:8:\"payments\";a:0:{}s:20:\"sales_invoice_number\";s:1:\"0\";}');
INSERT INTO `kpos_sessions` VALUES ('67611fed7ca2f4f5ad6655689bc0abe6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', '1431355115', 'a:9:{s:9:\"user_data\";s:0:\"\";s:9:\"person_id\";s:1:\"1\";s:4:\"data\";a:2:{s:6:\"params\";a:2:{s:4:\"name\";s:19:\"20141216_194844.jpg\";s:7:\"user_id\";s:2:\"41\";}s:8:\"filename\";s:19:\"20141216_194844.jpg\";}s:4:\"cart\";a:10:{i:1;a:14:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:1;s:4:\"name\";s:7:\"my item\";s:11:\"item_number\";s:3:\"001\";s:11:\"description\";b:0;s:12:\"serialnumber\";b:0;s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";s:2:\"10\";s:8:\"discount\";s:1:\"0\";s:8:\"in_stock\";s:1:\"0\";s:5:\"price\";s:5:\"46.51\";}i:2;a:14:{s:7:\"item_id\";s:1:\"2\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:2;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:3:\"002\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:3;s:8:\"discount\";i:0;s:8:\"in_stock\";s:2:\"94\";s:5:\"price\";s:5:\"36.00\";}i:3;a:14:{s:7:\"item_id\";s:1:\"3\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:3;s:4:\"name\";s:9:\"sadfas fa\";s:11:\"item_number\";s:4:\"1234\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:3;s:8:\"discount\";i:0;s:8:\"in_stock\";s:2:\"50\";s:5:\"price\";s:5:\"44.00\";}i:4;a:14:{s:7:\"item_id\";s:1:\"4\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:4;s:4:\"name\";s:10:\"fasdfsafsa\";s:11:\"item_number\";s:3:\"004\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:3;s:8:\"discount\";i:0;s:8:\"in_stock\";s:3:\"-10\";s:5:\"price\";s:4:\"0.00\";}i:5;a:14:{s:7:\"item_id\";s:1:\"5\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:5;s:4:\"name\";s:0:\"\";s:11:\"item_number\";N;s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:3;s:8:\"discount\";i:0;s:8:\"in_stock\";i:0;s:5:\"price\";s:4:\"0.00\";}i:6;a:14:{s:7:\"item_id\";s:1:\"6\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:6;s:4:\"name\";s:0:\"\";s:11:\"item_number\";N;s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:2;s:8:\"discount\";i:0;s:8:\"in_stock\";i:0;s:5:\"price\";s:4:\"0.00\";}i:7;a:14:{s:7:\"item_id\";s:1:\"7\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:7;s:4:\"name\";s:5:\"dfasf\";s:11:\"item_number\";N;s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:3;s:8:\"discount\";i:0;s:8:\"in_stock\";s:2:\"-1\";s:5:\"price\";s:5:\"45.00\";}i:8;a:14:{s:7:\"item_id\";s:1:\"8\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:8;s:4:\"name\";s:11:\"fasdfasdfaf\";s:11:\"item_number\";N;s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:3;s:8:\"discount\";i:0;s:8:\"in_stock\";s:2:\"15\";s:5:\"price\";s:5:\"46.00\";}i:9;a:14:{s:7:\"item_id\";s:1:\"9\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:9;s:4:\"name\";s:9:\"sadfasdfa\";s:11:\"item_number\";N;s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:1;s:8:\"discount\";i:0;s:8:\"in_stock\";s:1:\"5\";s:5:\"price\";s:5:\"13.00\";}i:10;a:14:{s:7:\"item_id\";s:2:\"10\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:10;s:4:\"name\";s:6:\"asdfas\";s:11:\"item_number\";s:3:\"006\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:1;s:8:\"discount\";i:0;s:8:\"in_stock\";s:2:\"-6\";s:5:\"price\";s:5:\"12.00\";}}s:9:\"sale_mode\";s:4:\"sale\";s:13:\"sale_location\";s:1:\"1\";s:8:\"customer\";i:-1;s:8:\"payments\";a:0:{}s:20:\"sales_invoice_number\";s:1:\"7\";}');
INSERT INTO `kpos_sessions` VALUES ('67cc3cf4f14adad910713af31cb8e2fd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36', '1428103414', 'a:10:{s:9:\"person_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:9:\"recv_mode\";s:7:\"receive\";s:28:\"sales_invoice_number_enabled\";s:5:\"false\";s:13:\"sale_location\";s:1:\"1\";s:9:\"sale_mode\";s:4:\"sale\";s:4:\"cart\";a:0:{}s:8:\"customer\";i:-1;s:8:\"payments\";a:0:{}s:20:\"sales_invoice_number\";s:1:\"0\";}');
INSERT INTO `kpos_sessions` VALUES ('6949581619fde46e15ec9b1975f5ebe4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36', '1428135830', 'a:9:{s:9:\"user_data\";s:0:\"\";s:9:\"person_id\";s:1:\"2\";s:13:\"sale_location\";s:1:\"1\";s:28:\"sales_invoice_number_enabled\";s:5:\"false\";s:9:\"sale_mode\";s:6:\"return\";s:4:\"cart\";a:0:{}s:8:\"customer\";i:-1;s:8:\"payments\";a:0:{}s:20:\"sales_invoice_number\";s:1:\"0\";}');
INSERT INTO `kpos_sessions` VALUES ('8df70369e263ee2a5f48ddaf453f877d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1429705027', '');
INSERT INTO `kpos_sessions` VALUES ('9050c573daf3e35b93764b2a354e0553', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1430316875', 'a:1:{s:9:\"person_id\";s:1:\"1\";}');
INSERT INTO `kpos_sessions` VALUES ('95051f987a112c2fa44e8c231209075d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0', '1479988119', 'a:1:{s:9:\"person_id\";s:1:\"1\";}');
INSERT INTO `kpos_sessions` VALUES ('9a0aa2fef7e4b3776f5cd705e39e551d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '1428230844', '');
INSERT INTO `kpos_sessions` VALUES ('9bcf27fbdb201fc80a073921f29ab490', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36', '1428134815', '');
INSERT INTO `kpos_sessions` VALUES ('9ff2e8295dfd5768949e3bef620b80ca', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', '1431141564', 'a:2:{s:9:\"user_data\";s:0:\"\";s:9:\"person_id\";s:1:\"1\";}');
INSERT INTO `kpos_sessions` VALUES ('a444885ee5f5410d0d64ed71d5de6c0c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:35.0) Gecko/20100101 Firefox/35.0', '1429625589', '');
INSERT INTO `kpos_sessions` VALUES ('accd4b05b93b01d8502190db93db3e57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1429708979', '');
INSERT INTO `kpos_sessions` VALUES ('ad564c163d347fc78d64a8083a991e43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36', '1428134887', '');
INSERT INTO `kpos_sessions` VALUES ('b0500ad70f43bcbaa069d83723eeacea', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36', '1428134793', '');
INSERT INTO `kpos_sessions` VALUES ('b177801d888ad9e65c532f2dc05d431a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1429620677', '');
INSERT INTO `kpos_sessions` VALUES ('b619691943479fd0c8c3c9871d7655ef', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1429619807', '');
INSERT INTO `kpos_sessions` VALUES ('bd5e1ffa0b165c63fa14d2468b7e02d3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1429622055', '');
INSERT INTO `kpos_sessions` VALUES ('c968e8b31a102d8cccd844e664c5813b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1429621220', '');
INSERT INTO `kpos_sessions` VALUES ('cc3bede06d884e85160bb124ec9aecde', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36', '1428134871', '');
INSERT INTO `kpos_sessions` VALUES ('d491907beb17b6bd79a30d5a1bfd07eb', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '1428236546', '');
INSERT INTO `kpos_sessions` VALUES ('d54a702ae8b3f1fba712fc73308bdd48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '1428230840', '');
INSERT INTO `kpos_sessions` VALUES ('da4b851f30c894cfeec07cad4770098d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '1428224021', '');
INSERT INTO `kpos_sessions` VALUES ('db1aa6b858c2c1e68fcf544a5b732918', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', '1429626888', 'a:13:{s:9:\"user_data\";s:0:\"\";s:9:\"person_id\";s:1:\"1\";s:13:\"sale_location\";s:1:\"1\";s:4:\"cart\";a:2:{i:1;a:14:{s:7:\"item_id\";s:1:\"2\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:1;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:3:\"002\";s:11:\"description\";b:0;s:12:\"serialnumber\";b:0;s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";s:1:\"1\";s:8:\"discount\";s:1:\"0\";s:8:\"in_stock\";s:2:\"92\";s:5:\"price\";s:5:\"36.00\";}i:2;a:14:{s:7:\"item_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:2;s:4:\"name\";s:7:\"my item\";s:11:\"item_number\";s:3:\"001\";s:11:\"description\";s:11:\"hello world\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:1;s:8:\"discount\";i:0;s:8:\"in_stock\";s:2:\"74\";s:5:\"price\";s:5:\"46.51\";}}s:9:\"sale_mode\";s:4:\"sale\";s:8:\"customer\";i:-1;s:8:\"payments\";a:3:{s:4:\"Cash\";a:2:{s:12:\"payment_type\";s:4:\"Cash\";s:14:\"payment_amount\";d:8.1099999999999994315658113919198513031005859375;}s:11:\"Credit Card\";a:2:{s:12:\"payment_type\";s:11:\"Credit Card\";s:14:\"payment_amount\";s:2:\"20\";}s:5:\"Check\";a:2:{s:12:\"payment_type\";s:5:\"Check\";s:14:\"payment_amount\";s:5:\"67.78\";}}s:20:\"sales_invoice_number\";s:1:\"6\";s:13:\"item_location\";s:1:\"1\";s:8:\"cartRecv\";a:0:{}s:9:\"recv_mode\";s:7:\"receive\";s:8:\"supplier\";i:-1;s:19:\"recv_invoice_number\";s:1:\"0\";}');
INSERT INTO `kpos_sessions` VALUES ('db52b6cae1deee7bffa393f63e541ccd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1429797680', '');
INSERT INTO `kpos_sessions` VALUES ('e44db3114e9bc852ecdf6c1d29a05dee', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', '1429709005', 'a:15:{s:9:\"person_id\";s:1:\"1\";s:13:\"item_location\";s:1:\"1\";s:9:\"recv_mode\";s:7:\"receive\";s:13:\"sale_location\";s:1:\"1\";s:17:\"recv_stock_source\";s:1:\"1\";s:27:\"recv_invoice_number_enabled\";s:5:\"false\";s:8:\"cartRecv\";a:0:{}s:8:\"supplier\";i:-1;s:19:\"recv_invoice_number\";s:1:\"0\";s:28:\"sales_invoice_number_enabled\";s:4:\"true\";s:4:\"cart\";a:2:{i:4;a:14:{s:7:\"item_id\";s:1:\"2\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:4;s:4:\"name\";s:5:\"test1\";s:11:\"item_number\";s:3:\"002\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:1;s:8:\"discount\";i:0;s:8:\"in_stock\";s:2:\"95\";s:5:\"price\";s:5:\"36.00\";}i:5;a:14:{s:7:\"item_id\";s:2:\"13\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:5:\"stock\";s:4:\"line\";i:5;s:4:\"name\";s:11:\"norman item\";s:11:\"item_number\";s:3:\"008\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:1;s:8:\"discount\";i:0;s:8:\"in_stock\";s:1:\"5\";s:5:\"price\";s:4:\"5.00\";}}s:9:\"sale_mode\";s:4:\"sale\";s:8:\"customer\";i:-1;s:8:\"payments\";a:0:{}s:20:\"sales_invoice_number\";s:1:\"7\";}');
INSERT INTO `kpos_sessions` VALUES ('ef3217c9051fb05d3c905fef9991c075', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1429620922', '');
INSERT INTO `kpos_sessions` VALUES ('fd5fc6cd60c475bcdbbeac520d61b007', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '1429883089', '');

-- ----------------------------
-- Table structure for kpos_stock_locations
-- ----------------------------
DROP TABLE IF EXISTS `kpos_stock_locations`;
CREATE TABLE `kpos_stock_locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kpos_stock_locations
-- ----------------------------
INSERT INTO `kpos_stock_locations` VALUES ('1', 'stock', '1');
INSERT INTO `kpos_stock_locations` VALUES ('2', '', '0');

-- ----------------------------
-- Table structure for kpos_suppliers
-- ----------------------------
DROP TABLE IF EXISTS `kpos_suppliers`;
CREATE TABLE `kpos_suppliers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `kpos_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `kpos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpos_suppliers
-- ----------------------------
INSERT INTO `kpos_suppliers` VALUES ('12', 'zuellig pharma', null, '0');
INSERT INTO `kpos_suppliers` VALUES ('13', 'test123', null, '1');
INSERT INTO `kpos_suppliers` VALUES ('14', 'new company', null, '0');
INSERT INTO `kpos_suppliers` VALUES ('16', 'bacolod columbia', null, '0');
INSERT INTO `kpos_suppliers` VALUES ('17', 'jb marketing', null, '1');

-- ----------------------------
-- Table structure for kpos_wallets
-- ----------------------------
DROP TABLE IF EXISTS `kpos_wallets`;
CREATE TABLE `kpos_wallets` (
  `wallet_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) DEFAULT NULL,
  `descriptions` varchar(200) DEFAULT NULL,
  `wallet_type` enum('debit','credit','transfer') DEFAULT NULL,
  `trans_date` int(11) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `transfer_to` int(11) DEFAULT NULL,
  PRIMARY KEY (`wallet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kpos_wallets
-- ----------------------------
