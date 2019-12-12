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

 Date: 13/12/2019 00:59:23
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
  `c_endtime` date NOT NULL,
  PRIMARY KEY (`c_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('5003001', 'JAVA进阶-javaweb', 4, '2019-10-10', '2019-12-13');
INSERT INTO `course` VALUES ('5003002', '数据库系统概论', 5, '2019-09-20', '2019-11-15');
INSERT INTO `course` VALUES ('5003003', '离散数学', 5, '2019-09-05', '2019-11-22');
INSERT INTO `course` VALUES ('5003004', 'JAVA基础', 4, '2018-09-11', '2018-12-14');

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
  CONSTRAINT `stu_cours_sele_ibfk_1` FOREIGN KEY (`s_num`) REFERENCES `student` (`s_num`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stu_cours_sele_ibfk_2` FOREIGN KEY (`c_num`) REFERENCES `course` (`c_num`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stu_cours_sele
-- ----------------------------
INSERT INTO `stu_cours_sele` VALUES ('201716040224', '5003001', 90);
INSERT INTO `stu_cours_sele` VALUES ('201716040224', '5003002', 85);
INSERT INTO `stu_cours_sele` VALUES ('201716040223', '5003002', 83);
INSERT INTO `stu_cours_sele` VALUES ('201716040223', '5003003', 80);
INSERT INTO `stu_cours_sele` VALUES ('201716040224', '5003003', 82);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `s_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_sex` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_birthday` date NOT NULL,
  PRIMARY KEY (`s_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('201716040223', '韩旭', '男', '13253386935', '天津市大港区', '1998-07-10');
INSERT INTO `student` VALUES ('201716040224', '刘文博', '男', '13253376824', '河南省新乡市卫辉市', '1998-02-11');

-- ----------------------------
-- Table structure for tea_cours_teach
-- ----------------------------
DROP TABLE IF EXISTS `tea_cours_teach`;
CREATE TABLE `tea_cours_teach`  (
  `tct_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`tct_id`) USING BTREE,
  UNIQUE INDEX `c_num`(`c_num`) USING BTREE,
  INDEX `t_num`(`t_num`) USING BTREE,
  CONSTRAINT `tea_cours_teach_ibfk_1` FOREIGN KEY (`t_num`) REFERENCES `teacher` (`t_num`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tea_cours_teach_ibfk_2` FOREIGN KEY (`c_num`) REFERENCES `course` (`c_num`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tea_cours_teach
-- ----------------------------
INSERT INTO `tea_cours_teach` VALUES (1, '10010610', '5003001');
INSERT INTO `tea_cours_teach` VALUES (2, '10010611', '5003003');
INSERT INTO `tea_cours_teach` VALUES (3, '10010610', '5003004');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `t_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_sex` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_birthday` date NOT NULL,
  PRIMARY KEY (`t_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('10010610', '郑丽萍', '女', '讲师', '1979-07-13');
INSERT INTO `teacher` VALUES ('10010611', '费选', '男', '主任', '1982-07-21');

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
