/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1-3306
Source Server Version : 50622
Source Host           : 127.0.0.1:3306
Source Database       : adminlte

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2017-04-19 10:53:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '组织名',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `code` varchar(64) NOT NULL COMMENT '编号',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `pid` bigint(19) DEFAULT NULL COMMENT '父级主键',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('1', '管理员', '', '01', ' fa fa-user', null, '0', '2017-04-19 09:23:22');
INSERT INTO `organization` VALUES ('2', '企业用户', '', '02', ' fa fa-user', null, '0', '2017-04-19 09:23:22');
INSERT INTO `organization` VALUES ('3', '个人用户', '', '03', ' fa fa-user', null, '0', '2017-04-19 09:23:22');

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(19) NOT NULL,
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别',
  `age` tinyint(2) DEFAULT '0' COMMENT '年龄',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `address` varchar(100) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户信息';

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('1', '1', '0', '25', '18707173376', '', null);
INSERT INTO `profile` VALUES ('2', '2', '0', '25', '18707173376', null, null);
INSERT INTO `profile` VALUES ('3', '3', '0', '25', '18707173376', null, null);

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '资源名称',
  `url` varchar(100) DEFAULT NULL COMMENT '资源路径',
  `open_mode` varchar(32) DEFAULT NULL COMMENT '打开方式 ajax,iframe',
  `description` varchar(255) DEFAULT NULL COMMENT '资源介绍',
  `icon` varchar(32) DEFAULT NULL COMMENT '资源图标',
  `pid` bigint(19) DEFAULT NULL COMMENT '父级资源id',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `opened` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打开状态',
  `resource_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '资源类别',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '权限管理', '', null, '系统管理', 'fa fa-calendar-check-o', null, '0', '0', '1', '0', '2017-04-19 09:23:23');
INSERT INTO `resource` VALUES ('13', '用户管理', 'user/manager', 'ajax', '用户管理', 'fa fa-user', '1', '3', '0', '1', '0', '2017-04-19 09:23:23');
INSERT INTO `resource` VALUES ('111', '列表', '/resource/treeGrid', 'ajax', '资源列表', '', '11', '0', '0', '1', '1', '2017-04-19 09:23:23');
INSERT INTO `resource` VALUES ('131', '列表', '/user/dataGrid', 'ajax', '用户列表', '', '13', '0', '0', '1', '1', '2017-04-19 09:23:23');
INSERT INTO `resource` VALUES ('132', '添加', '/user/add', 'ajax', '用户添加', '', '13', '0', '0', '1', '1', '2017-04-19 09:23:23');
INSERT INTO `resource` VALUES ('133', '编辑', '/user/edit', 'ajax', '用户编辑', '', '13', '0', '0', '1', '1', '2017-04-19 09:23:23');
INSERT INTO `resource` VALUES ('134', '删除', '/user/delete', 'ajax', '用户删除', '', '13', '0', '0', '1', '1', '2017-04-19 09:23:23');
INSERT INTO `resource` VALUES ('221', '日志监控', '', null, null, 'fa fa-sticky-note', null, '2', '0', '0', '0', '2017-04-19 09:23:23');
INSERT INTO `resource` VALUES ('226', '修改密码', '/user/editPwdPage', 'ajax', null, '', null, '3', '0', '1', '1', '2017-04-19 09:23:23');
INSERT INTO `resource` VALUES ('227', '登录日志', 'sysLog/manager', 'ajax', null, 'fa fa-sticky-note-o', '221', '0', '0', '1', '0', '2017-04-19 09:23:23');
INSERT INTO `resource` VALUES ('230', '个人信息', 'profile', 'ajax', null, 'fa fa-user', '1', '0', '0', '1', '0', '2017-04-19 09:23:23');
INSERT INTO `resource` VALUES ('250', '地图', '', 'ajax', null, 'fa fa-map', null, '0', '0', '1', '0', '2017-04-19 09:23:23');
INSERT INTO `resource` VALUES ('251', '地图', 'map/monitor', 'ajax', null, 'fa fa-map-o', '250', '0', '0', '1', '0', '2017-04-19 09:23:23');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '角色名',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序号',
  `description` varchar(255) DEFAULT NULL COMMENT '简介',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', '0', '超级管理员', '0');
INSERT INTO `role` VALUES ('2', 'pm', '0', '企业用户', '0');
INSERT INTO `role` VALUES ('3', 'test', '0', '个人用户', '0');

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  `resource_id` bigint(19) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=451 DEFAULT CHARSET=utf8 COMMENT='角色资源';

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES ('1', '1', '1');
INSERT INTO `role_resource` VALUES ('2', '1', '13');
INSERT INTO `role_resource` VALUES ('3', '1', '111');
INSERT INTO `role_resource` VALUES ('4', '1', '131');
INSERT INTO `role_resource` VALUES ('5', '1', '132');
INSERT INTO `role_resource` VALUES ('6', '1', '133');
INSERT INTO `role_resource` VALUES ('7', '1', '134');
INSERT INTO `role_resource` VALUES ('9', '1', '221');
INSERT INTO `role_resource` VALUES ('10', '1', '226');
INSERT INTO `role_resource` VALUES ('11', '1', '227');
INSERT INTO `role_resource` VALUES ('12', '1', '230');
INSERT INTO `role_resource` VALUES ('13', '1', '250');
INSERT INTO `role_resource` VALUES ('14', '1', '251');
INSERT INTO `role_resource` VALUES ('15', '2', '1');
INSERT INTO `role_resource` VALUES ('16', '2', '13');
INSERT INTO `role_resource` VALUES ('17', '2', '111');
INSERT INTO `role_resource` VALUES ('18', '2', '131');
INSERT INTO `role_resource` VALUES ('19', '2', '132');
INSERT INTO `role_resource` VALUES ('20', '2', '133');
INSERT INTO `role_resource` VALUES ('21', '2', '134');
INSERT INTO `role_resource` VALUES ('23', '2', '221');
INSERT INTO `role_resource` VALUES ('24', '2', '226');
INSERT INTO `role_resource` VALUES ('25', '2', '227');
INSERT INTO `role_resource` VALUES ('26', '2', '230');
INSERT INTO `role_resource` VALUES ('27', '2', '250');
INSERT INTO `role_resource` VALUES ('28', '2', '251');
INSERT INTO `role_resource` VALUES ('29', '3', '1');
INSERT INTO `role_resource` VALUES ('30', '3', '13');
INSERT INTO `role_resource` VALUES ('31', '3', '111');
INSERT INTO `role_resource` VALUES ('32', '3', '131');
INSERT INTO `role_resource` VALUES ('33', '3', '132');
INSERT INTO `role_resource` VALUES ('34', '3', '133');
INSERT INTO `role_resource` VALUES ('35', '3', '134');
INSERT INTO `role_resource` VALUES ('36', '3', '221');
INSERT INTO `role_resource` VALUES ('37', '3', '226');
INSERT INTO `role_resource` VALUES ('38', '3', '227');
INSERT INTO `role_resource` VALUES ('39', '3', '230');
INSERT INTO `role_resource` VALUES ('40', '3', '250');
INSERT INTO `role_resource` VALUES ('41', '3', '251');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `login_name` varchar(255) DEFAULT NULL COMMENT '登陆名',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `opt_content` varchar(1024) DEFAULT NULL COMMENT '内容',
  `client_ip` varchar(255) DEFAULT NULL COMMENT '客户端ip',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('42', 'admin', '超级管理员', '[类名]:com.adminlte.controller.LoginController,[方法]:logout,[参数]:', null, '2017-04-19 09:23:24');
INSERT INTO `sys_log` VALUES ('43', 'test', '个人用户', '[类名]:com.adminlte.controller.LoginController,[方法]:logout,[参数]:', null, '2017-04-19 09:23:24');
INSERT INTO `sys_log` VALUES ('44', 'pm', '企业用户', '[类名]:com.adminlte.controller.LoginController,[方法]:logout,[参数]:', null, '2017-04-19 09:23:24');
INSERT INTO `sys_log` VALUES ('45', 'admin', '超级管理员', '[类名]:com.adminlte.controller.LoginController,[方法]:logout,[参数]:', null, '2017-04-19 09:23:24');
INSERT INTO `sys_log` VALUES ('46', 'test', '个人用户', '[类名]:com.adminlte.controller.LoginController,[方法]:loginGet,[参数]:', null, '2017-04-19 09:24:01');
INSERT INTO `sys_log` VALUES ('47', 'test', '个人用户', '[类名]:com.adminlte.controller.LoginController,[方法]:loginPost,[参数]:loginName=admin&passWord=123456&validCode=ww5g&', '127.0.0.1', '2017-04-19 09:24:11');
INSERT INTO `sys_log` VALUES ('48', 'admin', '超级管理员', '[类名]:com.adminlte.controller.LoginController,[方法]:loginGet,[参数]:', null, '2017-04-19 09:36:48');
INSERT INTO `sys_log` VALUES ('49', 'admin', '超级管理员', '[类名]:com.adminlte.controller.LoginController,[方法]:loginPost,[参数]:loginName=admin&passWord=123456&validCode=8rdt&', '127.0.0.1', '2017-04-19 09:36:56');
INSERT INTO `sys_log` VALUES ('50', 'admin', '超级管理员', '[类名]:com.adminlte.controller.LoginController,[方法]:loginGet,[参数]:', null, '2017-04-19 09:40:04');
INSERT INTO `sys_log` VALUES ('51', 'admin', '超级管理员', '[类名]:com.adminlte.controller.LoginController,[方法]:loginPost,[参数]:loginName=admin&passWord=123456&validCode=4mfw&', '127.0.0.1', '2017-04-19 09:40:13');
INSERT INTO `sys_log` VALUES ('52', 'admin', '超级管理员', '[类名]:com.adminlte.controller.LoginController,[方法]:loginGet,[参数]:', null, '2017-04-19 09:41:28');
INSERT INTO `sys_log` VALUES ('53', 'admin', '超级管理员', '[类名]:com.adminlte.controller.LoginController,[方法]:loginPost,[参数]:loginName=admin&passWord=123456&validCode=6jg6&', '127.0.0.1', '2017-04-19 09:41:59');
INSERT INTO `sys_log` VALUES ('54', 'admin', '超级管理员', '[类名]:com.adminlte.controller.LoginController,[方法]:loginGet,[参数]:', null, '2017-04-19 09:53:40');
INSERT INTO `sys_log` VALUES ('55', 'admin', '超级管理员', '[类名]:com.adminlte.controller.LoginController,[方法]:loginPost,[参数]:loginName=admin&passWord=123456&validCode=n8uw&', '127.0.0.1', '2017-04-19 09:53:48');
INSERT INTO `sys_log` VALUES ('56', 'admin', '超级管理员', '[类名]:com.adminlte.controller.LoginController,[方法]:loginGet,[参数]:', null, '2017-04-19 09:55:42');
INSERT INTO `sys_log` VALUES ('57', 'admin', '超级管理员', '[类名]:com.adminlte.controller.LoginController,[方法]:loginPost,[参数]:loginName=admin&passWord=123456&validCode=rp4j&', '127.0.0.1', '2017-04-19 09:55:53');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `login_name` varchar(64) NOT NULL COMMENT '登陆名',
  `name` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `user_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户类别',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `organization_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属机构',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '1', '2017-04-19 09:23:24');
INSERT INTO `user` VALUES ('2', 'pm', '企业用户', 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '2', '2017-04-19 09:23:24');
INSERT INTO `user` VALUES ('3', 'test', '个人用户', 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '3', '2017-04-19 09:23:24');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(19) NOT NULL COMMENT '用户id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('53', '1', '1');
INSERT INTO `user_role` VALUES ('60', '2', '3');
INSERT INTO `user_role` VALUES ('61', '3', '3');
