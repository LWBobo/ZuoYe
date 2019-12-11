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

 Date: 12/12/2019 00:27:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for stu_cours_sele
-- ----------------------------
DROP TABLE IF EXISTS `stu_cours_sele`;
CREATE TABLE `stu_cours_sele`  (
  `s_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_grade` int(11) NOT NULL,
  INDEX `fkey1`(`s_num`) USING BTREE,
  INDEX `fkey2`(`c_num`) USING BTREE,
  CONSTRAINT `fkey1` FOREIGN KEY (`s_num`) REFERENCES `student` (`s_num`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fkey2` FOREIGN KEY (`c_num`) REFERENCES `course` (`c_num`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
