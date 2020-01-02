/*
 Navicat Premium Data Transfer

 Source Server         : 本地MySQL
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : sims

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 02/01/2020 14:01:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classschedule
-- ----------------------------
DROP TABLE IF EXISTS `classschedule`;
CREATE TABLE `classschedule`  (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `monday` int(11) NULL DEFAULT 0,
  `tuesday` int(11) NULL DEFAULT 0,
  `wednesday` int(11) NULL DEFAULT 0,
  `thursday` int(11) NULL DEFAULT 0,
  `friday` int(11) NULL DEFAULT 0,
  `classroom_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`c_id`) USING BTREE,
  INDEX `c_num`(`c_num`) USING BTREE,
  INDEX `c_name`(`c_name`) USING BTREE,
  CONSTRAINT `classschedule_ibfk_1` FOREIGN KEY (`c_num`) REFERENCES `course` (`c_num`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `classschedule_ibfk_2` FOREIGN KEY (`c_name`) REFERENCES `course` (`c_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of classschedule
-- ----------------------------
INSERT INTO `classschedule` VALUES (1, '5003001', 'JAVA进阶', 0, 1, 0, 2, 0, '4436');
INSERT INTO `classschedule` VALUES (2, '5003002', '数据库系统概论', 2, 0, 0, 0, 1, '3305');
INSERT INTO `classschedule` VALUES (3, '5003003', '离散数学', 0, 0, 8, 0, 4, '3130');
INSERT INTO `classschedule` VALUES (4, '5003004', 'JAVA基础', 8, 2, 0, 0, 0, '4237');
INSERT INTO `classschedule` VALUES (5, '5003005', '计算机网络', 0, 0, 1, 8, 0, '3212');
INSERT INTO `classschedule` VALUES (6, '5003006', 'Linux基础', 0, 16, 0, 0, 0, '4332');

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
  `c_islabcourse` int(11) NOT NULL DEFAULT 0 COMMENT '是否有实验课',
  PRIMARY KEY (`c_num`) USING BTREE,
  INDEX `c_name`(`c_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('5003001', 'JAVA进阶', 4, '2019-10-10', '2019-12-13', 0);
INSERT INTO `course` VALUES ('5003002', '数据库系统概论', 5, '2019-09-20', '2019-11-15', 1);
INSERT INTO `course` VALUES ('5003003', '离散数学', 5, '2018-03-05', '2018-06-05', 0);
INSERT INTO `course` VALUES ('5003004', 'JAVA基础', 4, '2018-09-11', '2018-12-14', 0);
INSERT INTO `course` VALUES ('5003005', '计算机网络', 5, '2019-09-05', '2019-11-20', 1);
INSERT INTO `course` VALUES ('5003006', 'Linux基础', 4, '2019-09-09', '2019-11-11', 0);

-- ----------------------------
-- Table structure for lab
-- ----------------------------
DROP TABLE IF EXISTS `lab`;
CREATE TABLE `lab`  (
  `lab_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lab_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lab_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`lab_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of lab
-- ----------------------------
INSERT INTO `lab` VALUES ('6313', '6313机房', '六号楼三楼13号教室');
INSERT INTO `lab` VALUES ('6316', '6316机房', '六号楼三楼16号教室');

-- ----------------------------
-- Table structure for labclassschedule
-- ----------------------------
DROP TABLE IF EXISTS `labclassschedule`;
CREATE TABLE `labclassschedule`  (
  `lc_id` int(11) NOT NULL AUTO_INCREMENT,
  `lc_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lc_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `monday` int(11) NULL DEFAULT 0,
  `tuesday` int(11) NULL DEFAULT 0,
  `wednesday` int(11) NULL DEFAULT 0,
  `thursday` int(11) NULL DEFAULT 0,
  `friday` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`lc_id`) USING BTREE,
  INDEX `lc_num`(`lc_num`) USING BTREE,
  INDEX `lc_name`(`lc_name`) USING BTREE,
  CONSTRAINT `labclassschedule_ibfk_1` FOREIGN KEY (`lc_num`) REFERENCES `labcourse` (`lc_num`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `labclassschedule_ibfk_2` FOREIGN KEY (`lc_name`) REFERENCES `labcourse` (`lc_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of labclassschedule
-- ----------------------------
INSERT INTO `labclassschedule` VALUES (1, '5003002X', '数据库系统概论上机', 0, 8, 0, 4, 0);
INSERT INTO `labclassschedule` VALUES (2, '5003005X', '计算机网络上机', 1, 0, 16, 0, 2);

-- ----------------------------
-- Table structure for labcourse
-- ----------------------------
DROP TABLE IF EXISTS `labcourse`;
CREATE TABLE `labcourse`  (
  `lc_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实验课程号规定为课程号+X',
  `lc_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实验课程名',
  `lc_ccnum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应的课程号',
  `lc_ccname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应的课程名',
  `lc_classroomnumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实验室编号',
  PRIMARY KEY (`lc_num`) USING BTREE,
  INDEX `lc_ccnum`(`lc_ccnum`) USING BTREE,
  INDEX `lc_ccname`(`lc_ccname`) USING BTREE,
  INDEX `lc_classroomnumber`(`lc_classroomnumber`) USING BTREE,
  INDEX `lc_name`(`lc_name`) USING BTREE,
  CONSTRAINT `labcourse_ibfk_1` FOREIGN KEY (`lc_ccnum`) REFERENCES `course` (`c_num`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `labcourse_ibfk_2` FOREIGN KEY (`lc_ccname`) REFERENCES `course` (`c_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `labcourse_ibfk_3` FOREIGN KEY (`lc_classroomnumber`) REFERENCES `lab` (`lab_num`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of labcourse
-- ----------------------------
INSERT INTO `labcourse` VALUES ('5003002X', '数据库系统概论上机', '5003002', '数据库系统概论', '6313');
INSERT INTO `labcourse` VALUES ('5003005X', '计算机网络上机', '5003005', '计算机网络', '6316');

-- ----------------------------
-- Table structure for msboard
-- ----------------------------
DROP TABLE IF EXISTS `msboard`;
CREATE TABLE `msboard`  (
  `msid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mstitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言标题',
  `mskeyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言关键字',
  `mscontents` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言内容',
  PRIMARY KEY (`msid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `msboard_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of msboard
-- ----------------------------
INSERT INTO `msboard` VALUES (2, '201716040224', '刘文博', '请假申请', '请假', '想要请假一周');
INSERT INTO `msboard` VALUES (3, '201716040224', '刘文博', '通知', '紧急通知', '明天不上班');
INSERT INTO `msboard` VALUES (5, '201716040225', '郭睿哲', '出差申请', '出差', '出差一周');
INSERT INTO `msboard` VALUES (6, '201716040224', '刘文博', '休年假', '申请休假', '想要提前休年假');
INSERT INTO `msboard` VALUES (7, '1001', '1001', '管理员通知', '重要通知', '明天不上课,同学们,明天不上课!');
INSERT INTO `msboard` VALUES (35, '1001', '1001', '通知', '通知', '明天上课');
INSERT INTO `msboard` VALUES (37, '10010611', '费选', '教师通知', '重要通知', 'Linux停课一周');

-- ----------------------------
-- Table structure for stu_cours_sele
-- ----------------------------
DROP TABLE IF EXISTS `stu_cours_sele`;
CREATE TABLE `stu_cours_sele`  (
  `s_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_grade` int(11) NULL DEFAULT NULL,
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
INSERT INTO `stu_cours_sele` VALUES ('201716040222', '5003002', 85);
INSERT INTO `stu_cours_sele` VALUES ('201716040222', '5003003', 88);
INSERT INTO `stu_cours_sele` VALUES ('201716040222', '5003004', 80);
INSERT INTO `stu_cours_sele` VALUES ('201716040225', '5003003', 83);
INSERT INTO `stu_cours_sele` VALUES ('201716040225', '5003002', 88);
INSERT INTO `stu_cours_sele` VALUES ('201716040225', '5003004', 90);
INSERT INTO `stu_cours_sele` VALUES ('201716040224', '5003005', 90);
INSERT INTO `stu_cours_sele` VALUES ('201716040222', '5003005', 85);
INSERT INTO `stu_cours_sele` VALUES ('201716040225', '5003005', 90);

-- ----------------------------
-- Table structure for stu_labcours_sele
-- ----------------------------
DROP TABLE IF EXISTS `stu_labcours_sele`;
CREATE TABLE `stu_labcours_sele`  (
  `s_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lc_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lc_grade` int(11) NULL DEFAULT NULL,
  INDEX `s_num`(`s_num`) USING BTREE,
  INDEX `lc_num`(`lc_num`) USING BTREE,
  CONSTRAINT `stu_labcours_sele_ibfk_1` FOREIGN KEY (`s_num`) REFERENCES `student` (`s_num`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stu_labcours_sele_ibfk_2` FOREIGN KEY (`lc_num`) REFERENCES `labcourse` (`lc_num`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
INSERT INTO `student` VALUES ('201716040222', '王聪', '男', '13256478446', '四川省达州市', '1997-10-20');
INSERT INTO `student` VALUES ('201716040223', '韩旭', '男', '13253386935', '天津市大港区', '1998-07-10');
INSERT INTO `student` VALUES ('201716040224', '刘文博', '男', '18790588240', '河南省新乡市卫辉市', '1998-02-11');
INSERT INTO `student` VALUES ('201716040225', '郭睿哲', '男', '13256987535', '广东省揭阳市', '1998-06-22');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tea_cours_teach
-- ----------------------------
INSERT INTO `tea_cours_teach` VALUES (1, '10010610', '5003001');
INSERT INTO `tea_cours_teach` VALUES (2, '10010611', '5003003');
INSERT INTO `tea_cours_teach` VALUES (3, '10010610', '5003004');
INSERT INTO `tea_cours_teach` VALUES (4, '10010613', '5003002');
INSERT INTO `tea_cours_teach` VALUES (5, '10010612', '5003005');
INSERT INTO `tea_cours_teach` VALUES (6, '10010611', '5003006');

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
INSERT INTO `teacher` VALUES ('10010611', '费选', '男', '主任', '1982-08-16');
INSERT INTO `teacher` VALUES ('10010612', '赵玉娟', '女', '系主任', '1979-05-06');
INSERT INTO `teacher` VALUES ('10010613', '苏小玲', '女', '讲师', '1978-06-03');

-- ----------------------------
-- Table structure for timetable
-- ----------------------------
DROP TABLE IF EXISTS `timetable`;
CREATE TABLE `timetable`  (
  `tableid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `monday1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `monday2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `monday3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `monday4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `monday5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tuesday1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tuesday2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tuesday3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tuesday4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tuesday5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wednesday1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wednesday2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wednesday3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wednesday4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wednesday5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thursday1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thursday2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thursday3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thursday4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thursday5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `friday1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `friday2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `friday3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `friday4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `friday5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tableid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of timetable
-- ----------------------------
INSERT INTO `timetable` VALUES ('201716040222', '计算机网络上机', '数据库系统概论-3305', NULL, 'JAVA基础-4237', NULL, NULL, 'JAVA基础-4237', NULL, '数据库系统概论上机', NULL, '计算机网络-3212', NULL, NULL, '离散数学-3130', '计算机网络上机', NULL, NULL, '数据库系统概论上机', '计算机网络-3212', NULL, '数据库系统概论-3305', '计算机网络上机', '离散数学-3130', NULL, NULL);
INSERT INTO `timetable` VALUES ('201716040223', NULL, '数据库系统概论-3305', NULL, NULL, NULL, NULL, NULL, NULL, '数据库系统概论上机', NULL, NULL, NULL, NULL, '离散数学-3130', NULL, NULL, NULL, '数据库系统概论上机', NULL, NULL, '数据库系统概论-3305', NULL, '离散数学-3130', NULL, NULL);
INSERT INTO `timetable` VALUES ('201716040224', '计算机网络上机', '数据库系统概论-3305', NULL, NULL, NULL, 'JAVA进阶-4436', NULL, NULL, '数据库系统概论上机', NULL, '计算机网络-3212', NULL, NULL, '离散数学-3130', '计算机网络上机', NULL, 'JAVA进阶-4436', '数据库系统概论上机', '计算机网络-3212', NULL, '数据库系统概论-3305', '计算机网络上机', '离散数学-3130', NULL, NULL);
INSERT INTO `timetable` VALUES ('201716040225', '计算机网络上机', '数据库系统概论-3305', NULL, 'JAVA基础-4237', NULL, NULL, 'JAVA基础-4237', NULL, '数据库系统概论上机', NULL, '计算机网络-3212', NULL, NULL, '离散数学-3130', '计算机网络上机', NULL, NULL, '数据库系统概论上机', '计算机网络-3212', NULL, '数据库系统概论-3305', '计算机网络上机', '离散数学-3130', NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `u_pwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1001', '111');
INSERT INTO `user` VALUES ('10010610', '123');
INSERT INTO `user` VALUES ('10010611', '666');
INSERT INTO `user` VALUES ('10010612', '123');
INSERT INTO `user` VALUES ('201716040224', '123456');
INSERT INTO `user` VALUES ('201716040225', '123456');

SET FOREIGN_KEY_CHECKS = 1;
