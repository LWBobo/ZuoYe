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

 Date: 12/12/2019 00:27:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tea_cours_teach
-- ----------------------------
DROP TABLE IF EXISTS `tea_cours_teach`;
CREATE TABLE `tea_cours_teach`  (
  `t_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`t_num`) USING BTREE,
  INDEX `c_num`(`c_num`) USING BTREE,
  CONSTRAINT `tea_cours_teach_ibfk_1` FOREIGN KEY (`t_num`) REFERENCES `teacher` (`t_num`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tea_cours_teach_ibfk_2` FOREIGN KEY (`c_num`) REFERENCES `course` (`c_num`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
