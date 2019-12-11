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

 Date: 12/12/2019 00:46:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `c_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_credit` int(11) NOT NULL,
  `c_begintime` date NOT NULL,
  PRIMARY KEY (`c_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `t_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `t_sex` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `t_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `t_birthday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`t_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `u_pwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
