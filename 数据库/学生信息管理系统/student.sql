/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : sims

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 12/12/2019 00:27:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `s_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_sex` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_age` int(11) NOT NULL,
  `s_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_birthday` date NOT NULL,
  PRIMARY KEY (`s_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
