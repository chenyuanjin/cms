-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2016-01-11 10:24:33
-- 服务器版本： 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cms`
--
CREATE DATABASE IF NOT EXISTS `cms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cms`;

-- --------------------------------------------------------

--
-- 表的结构 `sys_authorities`
--

DROP TABLE IF EXISTS `sys_authorities`;
CREATE TABLE IF NOT EXISTS `sys_authorities` (
  `id` char(32) NOT NULL,
  `authority_name` varchar(45) NOT NULL COMMENT '权限名称',
  `authority_desc` varchar(45) DEFAULT NULL COMMENT '权限排序',
  `authority_code` varchar(45) NOT NULL COMMENT '权限编码',
  `is_enabled` tinyint(1) NOT NULL COMMENT '是否可用',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user_id` char(32) DEFAULT NULL COMMENT '创建用户ID',
  `is_sys` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统权限';

--
-- 转存表中的数据 `sys_authorities`
--

INSERT INTO `sys_authorities` (`id`, `authority_name`, `authority_desc`, `authority_code`, `is_enabled`, `create_date`, `create_user_id`, `is_sys`) VALUES
('297ee8ae3b9bb8e5013b9bbc9efc0002', '登陆权限', '登陆权限', 'AUTH_LOGIN', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bb8e5013b9bc297b40003', '用户管理', '用户管理', 'AUTH_USER_LIST', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bb8e5013b9bc321a40004', '添加用户', '添加用户', 'AUTH_USER_ADD', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bc6f9700000', '删除用户', '删除用户', 'AUTH_USER_DELETE', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bc7673e0001', '用户角色', '用户角色', 'AUTH_USER_ROLE_LIST', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bc82d580002', '添加用户角色', '添加用户角色', 'AUTH_USER_ROLE_ADD', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bc892900003', '删除用户角色', '删除用户角色', 'AUTH_USER_ROLE_DELETE', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bc935f00004', '角色管理', '角色管理', 'AUTH_ROLE_LIST', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bc993d10005', '添加角色', '添加角色', 'AUTH_ROLE_ADD', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bc9f3b20006', '删除角色', '删除角色', 'AUTH_ROLE_DELETE', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bca6a290007', '修改角色', '修改角色', 'AUTH_ROLE_EDIT', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bcb38900008', '角色权限', '角色权限', 'AUTH_ROLE_AUTHORITY_LIST', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bcbd69d0009', '添加角色权限', '添加角色权限', 'AUTH_ROLE_AUTHORITY_ADD', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bcc55a8000a', '删除角色权限', '删除角色权限', 'AUTH_ROLE_AUTHORITY_DELETE', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bcf7d43000b', '权限管理', '权限管理', 'AUTH_AUTH_LIST', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bd02004000c', '添加权限', '添加权限', 'AUTH_AUTH_ADD', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bd072f3000d', '删除权限', '删除权限', 'AUTH_AUTH_DELETE', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bd0e77d000e', '修改权限', '修改权限', 'AUTH_AUTH_EDIT', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bd1427c000f', '权限资源管理', '权限资源管理', 'AUTH_AUTH_RESOUCES_LIST', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bd189e20010', '权限资源添加', '权限资源添加', 'AUTH_AUTH_RESOUCES_ADD', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bd1e6c20011', '权限资源删除', '权限资源删除', 'AUTH_AUTH_RESOUCES_DELETE', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bd246980012', '资源管理', '资源管理', 'AUTH_RESOUCES_LIST', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bd299d30013', '添加资源', '添加资源', 'AUTH_RESOUCES_ADD', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bd352030014', '删除资源', '删除资源', 'AUTH_RESOUCES_DELETE', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bd3af6f0015', '修改资源', '修改资源', 'AUTH_RESOUCES_EDIT', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('297ee8ae3ba0f16d013ba0f466ec0000', '用户编辑', '用户编辑', 'AUTH_USER_EDIT', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('2c9ec083513efdb401513f03a18a0002', '需求发布审核', '需求发布审核', 'AUTH_REQUIREMENT_AUDIT', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('402881e43cf29f70013cf2c169580022', '图标展示', '', 'AUTH_SYS_ICON_VIEW', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('4028d1813bc263ac013bc2686c8b0007', '菜单管理', '菜单管理', 'AUTH_MENU_LIST', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('4028d1813bc263ac013bc268c36b0008', '添加菜单', '添加菜单', 'AUTH_MENU_ADD', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('4028d1813bc263ac013bc26949800009', '删除菜单', '删除菜单', 'AUTH_MENU_DELETE', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('4028d1813bc263ac013bc2699e41000a', '角色菜单管理', '角色菜单管理', 'AUTH_ROLEMENU_LIST', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('4028d1813bc263ac013bc26a04a5000b', '创建角色菜单', '创建角色菜单', 'AUTH_ROLEMENU_CREATE', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('4028d1813bc263ac013bc26ba6a6000c', '修改菜单', '修改菜单', 'AUTH_MENU_EDIT', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0),
('4028d1813bdc7bde013bdc7e95f80002', '登陆日志查看', '登陆日志查看', 'AUTH_LOGINLOG_LIST', 1, '2016-01-11 17:19:54', '11111111111111111111111111111111', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_authorities_resources`
--

DROP TABLE IF EXISTS `sys_authorities_resources`;
CREATE TABLE IF NOT EXISTS `sys_authorities_resources` (
  `authority_id` char(32) NOT NULL,
  `resource_id` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sys_authorities_resources`
--

INSERT INTO `sys_authorities_resources` (`authority_id`, `resource_id`) VALUES
('297ee8ae3b9bc620013b9bc7673e0001', '297ee8ae3b996071013b996150cb0000'),
('297ee8ae3b9bc620013b9bc82d580002', '297ee8ae3b996071013b9962379b0001'),
('297ee8ae3b9bc620013b9bc892900003', '297ee8ae3b996071013b9962a0470002'),
('297ee8ae3b9bc620013b9bc935f00004', '297ee8ae3b996949013b996f92290000'),
('297ee8ae3b9bc620013b9bc993d10005', '297ee8ae3b996949013b996fe0150001'),
('297ee8ae3b9bc620013b9bc9f3b20006', '297ee8ae3b996949013b997047c40002'),
('297ee8ae3b9bc620013b9bcb38900008', '297ee8ae3b996949013b9971b4240003'),
('297ee8ae3b9bc620013b9bcbd69d0009', '297ee8ae3b996949013b9975393c0005'),
('297ee8ae3b9bc620013b9bcc55a8000a', '297ee8ae3b996949013b997489ad0004'),
('297ee8ae3b9bc620013b9bcf7d43000b', '297ee8ae3b996949013b9979e1230007'),
('297ee8ae3b9bc620013b9bd02004000c', '297ee8ae3b996949013b997a6f210008'),
('297ee8ae3b9bc620013b9bd072f3000d', '297ee8ae3b996949013b997ae9bf0009'),
('297ee8ae3b9bc620013b9bd1427c000f', '297ee8ae3b996949013b997c1316000a'),
('297ee8ae3b9bc620013b9bd189e20010', '297ee8ae3b996949013b997cdcb8000c'),
('297ee8ae3b9bc620013b9bd1e6c20011', '297ee8ae3b996949013b997c74f6000b'),
('297ee8ae3b9bc620013b9bd246980012', '297ee8ae3b996949013b997dc178000d'),
('297ee8ae3b9bc620013b9bd299d30013', '297ee8ae3b996949013b997e44c6000e'),
('297ee8ae3b9bc620013b9bd352030014', '297ee8ae3b996949013b997eae5a000f'),
('4028d1813bc263ac013bc2686c8b0007', '4028d1813bc263ac013bc264183b0000'),
('4028d1813bc263ac013bc268c36b0008', '4028d1813bc263ac013bc264ac690001'),
('4028d1813bc263ac013bc26949800009', '4028d1813bc263ac013bc2660fee0004'),
('4028d1813bc263ac013bc2699e41000a', '4028d1813bc263ac013bc26714580005'),
('4028d1813bc263ac013bc26a04a5000b', '4028d1813bc263ac013bc267b48f0006'),
('4028d1813bc263ac013bc26ba6a6000c', '4028d1813bc263ac013bc2659cae0003'),
('4028d1813bdc7bde013bdc7e95f80002', '4028d1813bdc7bde013bdc7dda250001'),
('297ee8ae3b9bb8e5013b9bc297b40003', '11111111111111111111111111111113'),
('297ee8ae3b9bb8e5013b9bc321a40004', '11111111111111111111111111111111'),
('297ee8ae3b9bc620013b9bc6f9700000', '11111111111111111111111111111112');

-- --------------------------------------------------------

--
-- 表的结构 `sys_menus`
--

DROP TABLE IF EXISTS `sys_menus`;
CREATE TABLE IF NOT EXISTS `sys_menus` (
  `id` char(32) NOT NULL,
  `name` varchar(45) DEFAULT NULL COMMENT '名称',
  `icon_style` varchar(45) DEFAULT NULL COMMENT '图标',
  `code` varchar(45) DEFAULT NULL COMMENT '编码',
  `parent_id` char(32) DEFAULT NULL COMMENT '父节点ID',
  `source_id` char(32) DEFAULT NULL COMMENT '资源ID',
  `menu_index` int(11) DEFAULT NULL COMMENT '排序',
  `deep` int(11) DEFAULT NULL COMMENT '深度',
  `role_id` char(32) DEFAULT NULL COMMENT '角色ID',
  `sys` tinyint(1) DEFAULT NULL COMMENT '是否是系统资源',
  `url` varchar(200) DEFAULT NULL COMMENT '请求路径'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单';

--
-- 转存表中的数据 `sys_menus`
--

INSERT INTO `sys_menus` (`id`, `name`, `icon_style`, `code`, `parent_id`, `source_id`, `menu_index`, `deep`, `role_id`, `sys`, `url`) VALUES
('402881e43bbdad6e013bbdae52bc0000', '系统管理', 'm-sys-manger', NULL, NULL, NULL, 1, 1, NULL, 0, NULL),
('402881e43bbdc946013bbdca29670000', '用户管理', 'm-user-mananger', NULL, '402881e43bbdad6e013bbdae52bc0000', '11111111111111111111111111111113', 1, 2, NULL, 0, NULL),
('402881e43bbdc946013bbde0b9820001', '角色管理', 'm-role-manager', NULL, '402881e43bbdad6e013bbdae52bc0000', '297ee8ae3b996949013b996f92290000', 2, 2, NULL, 0, NULL),
('402881e43bbdc946013bbde0ef750002', '权限管理', 'm-authority', NULL, '402881e43bbdad6e013bbdae52bc0000', '297ee8ae3b996949013b9979e1230007', 3, 2, NULL, 0, NULL),
('402881e43bbdc946013bbde132220003', '资源管理', 'm-module', NULL, '402881e43bbdad6e013bbdae52bc0000', '297ee8ae3b996949013b997dc178000d', 4, 2, NULL, 0, NULL),
('4028d1813bc263ac013bc26e9c540017', '菜单管理', 'm-menu-manager', NULL, '402881e43bbdad6e013bbdae52bc0000', '4028d1813bc263ac013bc264183b0000', 5, 2, NULL, 0, NULL),
('4028d1813bc263ac013bc26edb220018', '角色菜单管理', 'm-role-menu-manager', NULL, '402881e43bbdad6e013bbdae52bc0000', '4028d1813bc263ac013bc26714580005', 6, 2, NULL, 0, NULL),
('4028d1813bdc7bde013bdc802c560003', '登陆日志查看', 'm-sys-log', NULL, '402881e43bbdad6e013bbdae52bc0000', '4028d1813bdc7bde013bdc7dda250001', 8, 2, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sys_resources`
--

DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE IF NOT EXISTS `sys_resources` (
  `id` char(32) NOT NULL,
  `resource_name` varchar(45) NOT NULL COMMENT '资源名称',
  `resource_desc` varchar(45) DEFAULT NULL COMMENT '资源排序',
  `resource_type` int(11) DEFAULT NULL COMMENT '资源类型',
  `resource_path` varchar(255) NOT NULL COMMENT '资源路径',
  `is_enabled` tinyint(1) DEFAULT NULL COMMENT '是否可用',
  `priority` varchar(45) DEFAULT NULL,
  `is_sys` tinyint(1) NOT NULL,
  `parent_id` char(32) DEFAULT NULL,
  `creator_id` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统资源表';

--
-- 转存表中的数据 `sys_resources`
--

INSERT INTO `sys_resources` (`id`, `resource_name`, `resource_desc`, `resource_type`, `resource_path`, `is_enabled`, `priority`, `is_sys`, `parent_id`, `creator_id`) VALUES
('11111111111111111111111111111111', '添加用户', '添加用户', NULL, '/admin/user/add', 1, NULL, 0, '11111111111111111111111111111113', NULL),
('11111111111111111111111111111112', '删除用户', '删除用户', NULL, '/admin/user/delete', 1, NULL, 0, '11111111111111111111111111111113', NULL),
('11111111111111111111111111111113', '用户管理', '用户信息列表', NULL, '/admin/user/list', 1, NULL, 0, NULL, NULL),
('297ee8ae3b996071013b996150cb0000', '用户角色列表', '用户角色列表', NULL, '/admin/user/role/list', 1, NULL, 0, NULL, NULL),
('297ee8ae3b996071013b9962379b0001', '添加用户角色', '添加用户角色', NULL, '/admin/user/role/add', 1, NULL, 0, '297ee8ae3b996071013b996150cb0000', NULL),
('297ee8ae3b996071013b9962a0470002', '删除用户角色', '删除用户角色', NULL, '/admin/user/role/delete', 1, NULL, 0, '297ee8ae3b996071013b996150cb0000', NULL),
('297ee8ae3b996949013b996f92290000', '角色列表', '角色列表', NULL, '/admin/role/list', 1, NULL, 0, NULL, NULL),
('297ee8ae3b996949013b996fe0150001', '添加角色', '添加角色', NULL, '/admin/role/add', 1, NULL, 0, '297ee8ae3b996949013b996f92290000', NULL),
('297ee8ae3b996949013b997047c40002', '删除角色', '删除角色', NULL, '/admin/role/delete', 1, NULL, 0, '297ee8ae3b996949013b996f92290000', NULL),
('297ee8ae3b996949013b9971b4240003', '角色权限列表', '角色权限列表', NULL, '/admin/use/authority', 1, NULL, 0, '297ee8ae3b996949013b996f92290000', NULL),
('297ee8ae3b996949013b997489ad0004', '删除角色权限', '删除角色权限', NULL, '/admin/use/authority/delete', 1, NULL, 0, '297ee8ae3b996949013b9971b4240003', NULL),
('297ee8ae3b996949013b9975393c0005', '添加角色权限', '添加角色权限', NULL, '/admin/use/authority/add', 1, NULL, 0, '297ee8ae3b996949013b9971b4240003', NULL),
('297ee8ae3b996949013b9979e1230007', '权限管理-列表', '权限列表', NULL, '/admin/authority/list', 1, NULL, 0, NULL, NULL),
('297ee8ae3b996949013b997a6f210008', '添加权限', '添加权限', NULL, '/admin/authority/add', 1, NULL, 0, '297ee8ae3b996949013b9979e1230007', NULL),
('297ee8ae3b996949013b997ae9bf0009', '删除权限', '删除权限', NULL, '/admin/authority/delete', 1, NULL, 0, '297ee8ae3b996949013b9979e1230007', NULL),
('297ee8ae3b996949013b997c1316000a', '权限资源', '权限资源', NULL, '/admin/authority/resouces', 1, NULL, 0, '297ee8ae3b996949013b9979e1230007', NULL),
('297ee8ae3b996949013b997c74f6000b', '删除权限资源', '删除权限资源', NULL, '/admin/authority/resouces/delete', 1, NULL, 0, '297ee8ae3b996949013b997c1316000a', NULL),
('297ee8ae3b996949013b997cdcb8000c', '添加权限资源', '添加权限资源', NULL, '/admin/authority/resouces/add', 1, NULL, 0, '297ee8ae3b996949013b997c1316000a', NULL),
('297ee8ae3b996949013b997dc178000d', '系统资源管理', '系统资源管理', NULL, '/admin/resouces/list', 1, NULL, 0, NULL, NULL),
('297ee8ae3b996949013b997e44c6000e', '添加资源', '添加资源', NULL, '/admin/resouces/add', 1, NULL, 0, '297ee8ae3b996949013b997dc178000d', NULL),
('297ee8ae3b996949013b997eae5a000f', '删除资源', '删除资源', NULL, '/admin/resouces/delete', 1, NULL, 0, '297ee8ae3b996949013b997dc178000d', NULL),
('4028d1813bc263ac013bc264183b0000', '菜单管理', '菜单管理', NULL, '/admin/menu/list', 1, NULL, 0, NULL, NULL),
('4028d1813bc263ac013bc264ac690001', '添加菜单', '添加菜单', NULL, '/admin/menu/add', 1, NULL, 0, '4028d1813bc263ac013bc264183b0000', NULL),
('4028d1813bc263ac013bc2659cae0003', '修改菜单', '修改菜单', NULL, '/admin/menu/edit', 1, NULL, 0, '4028d1813bc263ac013bc264183b0000', NULL),
('4028d1813bc263ac013bc2660fee0004', '删除菜单', '删除菜单', NULL, '/admin/menu/delete', 1, NULL, 0, '4028d1813bc263ac013bc264183b0000', NULL),
('4028d1813bc263ac013bc26714580005', '角色菜单管理', '角色菜单管理', NULL, '/admin/rolemenu/list', 1, NULL, 0, NULL, NULL),
('4028d1813bc263ac013bc267b48f0006', '生成角色菜单', '生成角色菜单', NULL, '/admin/rolemenu/autocreate', 1, NULL, 0, '4028d1813bc263ac013bc26714580005', NULL),
('4028d1813bdc7bde013bdc7dda250001', '登陆日志管理', '登陆日志管理', NULL, '/admin/loginlog/list', 1, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sys_roles`
--

DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE IF NOT EXISTS `sys_roles` (
  `id` char(32) NOT NULL,
  `role_name` varchar(45) DEFAULT NULL COMMENT '角色名称',
  `role_desc` varchar(45) NOT NULL COMMENT '角色排序',
  `data_level` int(11) NOT NULL COMMENT '数据权限',
  `is_enabled` tinyint(1) NOT NULL COMMENT '是否可用',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` char(32) DEFAULT NULL COMMENT '创建人',
  `is_sys` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色';

--
-- 转存表中的数据 `sys_roles`
--

INSERT INTO `sys_roles` (`id`, `role_name`, `role_desc`, `data_level`, `is_enabled`, `create_date`, `create_user_id`, `is_sys`) VALUES
('297ee8ae3b84c24b013b84c71fd60000', '用户管理员', '用户管理员', 0, 1, '2016-01-11 17:20:30', '11111111111111111111111111111111', 0),
('297ee8ae3b9bc620013b9bd98fd00016', '超级管理员', '超级管理员', 1, 1, '2016-01-11 17:20:30', '11111111111111111111111111111111', 0),
('297eeea940b831c10140b833152f0001', '超级用户', '', 1, 1, '2016-01-11 17:20:30', '4028d1813c705372013c705aac010005', 0),
('4028d1813c8c02ab013c8c030b6a0001', '系统管理', '', 1, 1, '2016-01-11 17:20:30', '11111111111111111111111111111111', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sys_roles_anthorities`
--

DROP TABLE IF EXISTS `sys_roles_anthorities`;
CREATE TABLE IF NOT EXISTS `sys_roles_anthorities` (
  `role_id` char(32) NOT NULL,
  `authority_id` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sys_roles_anthorities`
--

INSERT INTO `sys_roles_anthorities` (`role_id`, `authority_id`) VALUES
('297ee8ae3b84c24b013b84c71fd60000', '297ee8ae3b9bb8e5013b9bbc9efc0002'),
('297ee8ae3b84c24b013b84c71fd60000', '297ee8ae3b9bb8e5013b9bc297b40003'),
('297ee8ae3b84c24b013b84c71fd60000', '297ee8ae3b9bc620013b9bc935f00004'),
('297ee8ae3b84c24b013b84c71fd60000', '297ee8ae3b9bc620013b9bcf7d43000b'),
('297ee8ae3b84c24b013b84c71fd60000', '297ee8ae3b9bc620013b9bd246980012'),
('297ee8ae3b84c24b013b84c71fd60000', '4028d1813bdc7bde013bdc7e95f80002'),
('297eeea940b831c10140b833152f0001', '297ee8ae3b9bb8e5013b9bbc9efc0002'),
('4028d1813c8c02ab013c8c030b6a0001', '297ee8ae3b9bb8e5013b9bbc9efc0002'),
('4028d1813c8c02ab013c8c030b6a0001', '297ee8ae3b9bb8e5013b9bc297b40003'),
('4028d1813c8c02ab013c8c030b6a0001', '297ee8ae3b9bb8e5013b9bc321a40004'),
('4028d1813c8c02ab013c8c030b6a0001', '297ee8ae3b9bc620013b9bc6f9700000'),
('4028d1813c8c02ab013c8c030b6a0001', '297ee8ae3b9bc620013b9bc7673e0001'),
('4028d1813c8c02ab013c8c030b6a0001', '297ee8ae3b9bc620013b9bc82d580002'),
('4028d1813c8c02ab013c8c030b6a0001', '297ee8ae3b9bc620013b9bc892900003'),
('4028d1813c8c02ab013c8c030b6a0001', '297ee8ae3b9bc620013b9bc935f00004'),
('4028d1813c8c02ab013c8c030b6a0001', '297ee8ae3b9bc620013b9bc993d10005'),
('4028d1813c8c02ab013c8c030b6a0001', '297ee8ae3b9bc620013b9bc9f3b20006'),
('4028d1813c8c02ab013c8c030b6a0001', '297ee8ae3b9bc620013b9bca6a290007'),
('4028d1813c8c02ab013c8c030b6a0001', '297ee8ae3b9bc620013b9bcb38900008'),
('4028d1813c8c02ab013c8c030b6a0001', '297ee8ae3b9bc620013b9bcbd69d0009'),
('4028d1813c8c02ab013c8c030b6a0001', '297ee8ae3b9bc620013b9bcc55a8000a'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bb8e5013b9bbc9efc0002'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bb8e5013b9bc297b40003'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bb8e5013b9bc321a40004'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bc6f9700000'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bc7673e0001'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bc82d580002'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bc892900003'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bc935f00004'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bc993d10005'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bc9f3b20006'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bca6a290007'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bcb38900008'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bcbd69d0009'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bcc55a8000a'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bcf7d43000b'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bd02004000c'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bd072f3000d'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bd0e77d000e'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bd1427c000f'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bd189e20010'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bd1e6c20011'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bd246980012'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bd299d30013'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bd352030014'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3b9bc620013b9bd3af6f0015'),
('297ee8ae3b9bc620013b9bd98fd00016', '4028d1813bc263ac013bc2686c8b0007'),
('297ee8ae3b9bc620013b9bd98fd00016', '4028d1813bc263ac013bc268c36b0008'),
('297ee8ae3b9bc620013b9bd98fd00016', '4028d1813bc263ac013bc26949800009'),
('297ee8ae3b9bc620013b9bd98fd00016', '4028d1813bc263ac013bc2699e41000a'),
('297ee8ae3b9bc620013b9bd98fd00016', '4028d1813bc263ac013bc26a04a5000b'),
('297ee8ae3b9bc620013b9bd98fd00016', '4028d1813bc263ac013bc26ba6a6000c'),
('297ee8ae3b9bc620013b9bd98fd00016', '297ee8ae3ba0f16d013ba0f466ec0000'),
('297ee8ae3b9bc620013b9bd98fd00016', '4028d1813bdc7bde013bdc7e95f80002'),
('297ee8ae3b9bc620013b9bd98fd00016', '402881e43cf29f70013cf2c169580022'),
('297ee8ae3b9bc620013b9bd98fd00016', '2c9ec083513efdb401513f03a18a0002');

-- --------------------------------------------------------

--
-- 表的结构 `sys_role_menus`
--

DROP TABLE IF EXISTS `sys_role_menus`;
CREATE TABLE IF NOT EXISTS `sys_role_menus` (
  `id` char(32) NOT NULL,
  `ind` int(11) DEFAULT NULL COMMENT '排序',
  `menu_id` char(32) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT '1',
  `role_id` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sys_role_menus`
--

INSERT INTO `sys_role_menus` (`id`, `ind`, `menu_id`, `enable`, `role_id`) VALUES
('402881e7522ff25101522ff665880017', 4, '402881e43bbdc946013bbde132220003', 0, '297ee8ae3b9bc620013b9bd98fd00016'),
('402881e7522ff25101522ff665960018', 3, '402881e43bbdc946013bbde0ef750002', 0, '297ee8ae3b9bc620013b9bd98fd00016'),
('402881e7522ff25101522ff665a30019', 1, '402881e43bbdc946013bbdca29670000', 0, '297ee8ae3b9bc620013b9bd98fd00016'),
('402881e7522ff25101522ff665b1001a', 8, '4028d1813bdc7bde013bdc802c560003', 0, '297ee8ae3b9bc620013b9bd98fd00016'),
('402881e7522ff25101522ff665be001b', 5, '4028d1813bc263ac013bc26e9c540017', 0, '297ee8ae3b9bc620013b9bd98fd00016'),
('402881e7522ff25101522ff665cb001c', 6, '4028d1813bc263ac013bc26edb220018', 0, '297ee8ae3b9bc620013b9bd98fd00016'),
('402881e7522ff25101522ff665d7001d', 2, '402881e43bbdc946013bbde0b9820001', 0, '297ee8ae3b9bc620013b9bd98fd00016'),
('402881e7522ff25101522ff665d7001e', 1, '402881e43bbdad6e013bbdae52bc0000', 0, '297ee8ae3b9bc620013b9bd98fd00016'),
('8a4da8f0514f183801514f49e6960004', 4, '402881e43bbdc946013bbde132220003', 0, '297ee8ae3b84c24b013b84c71fd60000'),
('8a4da8f0514f183801514f49e6b00005', 3, '402881e43bbdc946013bbde0ef750002', 0, '297ee8ae3b84c24b013b84c71fd60000'),
('8a4da8f0514f183801514f49e6c90006', 1, '402881e43bbdc946013bbdca29670000', 0, '297ee8ae3b84c24b013b84c71fd60000'),
('8a4da8f0514f183801514f49e6de0007', 8, '4028d1813bdc7bde013bdc802c560003', 0, '297ee8ae3b84c24b013b84c71fd60000'),
('8a4da8f0514f183801514f49e6f50008', 2, '402881e43bbdc946013bbde0b9820001', 0, '297ee8ae3b84c24b013b84c71fd60000'),
('8a4da8f0514f183801514f49e6f50009', 1, '402881e43bbdad6e013bbdae52bc0000', 0, '297ee8ae3b84c24b013b84c71fd60000'),
('8a4da8f0514f183801514f4a054a0015', 1, '402881e43bbdc946013bbdca29670000', 0, '4028d1813c8c02ab013c8c030b6a0001'),
('8a4da8f0514f183801514f4a05680016', 2, '402881e43bbdc946013bbde0b9820001', 0, '4028d1813c8c02ab013c8c030b6a0001'),
('8a4da8f0514f183801514f4a05680017', 1, '402881e43bbdad6e013bbdae52bc0000', 0, '4028d1813c8c02ab013c8c030b6a0001');

-- --------------------------------------------------------

--
-- 表的结构 `sys_users`
--

DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE IF NOT EXISTS `sys_users` (
  `id` char(32) NOT NULL,
  `user_name` varchar(45) NOT NULL COMMENT '用户名',
  `user_account` varchar(60) NOT NULL COMMENT '帐号',
  `user_password` varchar(45) NOT NULL COMMENT '密码',
  `user_type` int(11) DEFAULT NULL COMMENT '类型',
  `is_account_non_expired` tinyint(1) DEFAULT NULL,
  `is_account_non_locked` tinyint(1) DEFAULT NULL,
  `is_credentials_non_expired` tinyint(1) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `is_sys` tinyint(1) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `creator_id` char(32) DEFAULT NULL,
  `job` char(32) DEFAULT NULL,
  `owner` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sys_users`
--

INSERT INTO `sys_users` (`id`, `user_name`, `user_account`, `user_password`, `user_type`, `is_account_non_expired`, `is_account_non_locked`, `is_credentials_non_expired`, `is_enabled`, `is_sys`, `create_date`, `creator_id`, `job`, `owner`) VALUES
('11111111111111111111111111111111', 'admini', 'admini', 'JdVa0oOqQAr0ZMdtcTwHrQ==', 1, 1, 1, 1, 1, 1, '2016-01-11 17:21:26', '11111111111111111111111111111111', '1', NULL),
('4028d1813c705372013c705aac010005', 'admin1', 'admin1', '4QrcOUm6Wau+VuBX8g+IPg==', 0, 1, 1, 1, 1, 0, '2016-01-11 17:21:26', '11111111111111111111111111111111', '2', NULL),
('8a52b16f511628cd0151162b2d4b0004', 'test', 'testAudit', 'huoqKvyBayFOb/q87qxvSw==', 1, 1, 1, 1, 1, 0, '2016-01-11 17:21:26', '11111111111111111111111111111111', '1', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sys_users_roles`
--

DROP TABLE IF EXISTS `sys_users_roles`;
CREATE TABLE IF NOT EXISTS `sys_users_roles` (
  `user_id` char(32) NOT NULL,
  `role_id` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sys_users_roles`
--

INSERT INTO `sys_users_roles` (`user_id`, `role_id`) VALUES
('11111111111111111111111111111111', '297ee8ae3b9bc620013b9bd98fd00016'),
('4028d1813c705372013c705aac010005', '297ee8ae3b9bc620013b9bd98fd00016');

-- --------------------------------------------------------

--
-- 表的结构 `user_login_log`
--

DROP TABLE IF EXISTS `user_login_log`;
CREATE TABLE IF NOT EXISTS `user_login_log` (
  `id` char(32) NOT NULL,
  `user_id` char(32) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(45) DEFAULT NULL COMMENT '登陆账号',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `logout_time` datetime DEFAULT NULL COMMENT '退出时间',
  `login_ip` varchar(15) DEFAULT NULL COMMENT '登陆端口',
  `user_agent` varchar(200) DEFAULT NULL COMMENT '浏览器信息',
  `login_port` int(11) DEFAULT NULL COMMENT '登陆端口',
  `login_local_port` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user_login_log`
--

INSERT INTO `user_login_log` (`id`, `user_id`, `user_name`, `login_time`, `logout_time`, `login_ip`, `user_agent`, `login_port`, `login_local_port`) VALUES
('402881e7522ff25101522ff6ca6b001f', '11111111111111111111111111111111', 'tim', '2016-01-11 17:14:09', '2016-01-11 17:15:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/601.3.9 (KHTML, like Gecko) Version/9.0.2 Safari/601.3.9', 58802, 8080),
('402881e7522ff25101522ff8a0a00020', '11111111111111111111111111111111', 'tim', '2016-01-11 17:16:09', '2016-01-11 17:20:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/601.3.9 (KHTML, like Gecko) Version/9.0.2 Safari/601.3.9', 58855, 8080),
('402881e7522ff25101522ffca60f0021', '11111111111111111111111111111111', 'admini', '2016-01-11 17:20:33', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/601.3.9 (KHTML, like Gecko) Version/9.0.2 Safari/601.3.9', 58936, 8080);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sys_authorities`
--
ALTER TABLE `sys_authorities`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD UNIQUE KEY `authority_name_UNIQUE` (`authority_name`), ADD UNIQUE KEY `authority_code_UNIQUE` (`authority_code`);

--
-- Indexes for table `sys_authorities_resources`
--
ALTER TABLE `sys_authorities_resources`
 ADD KEY `fk_sys_authorities_resources_sys_authorities1_idx` (`authority_id`), ADD KEY `fk_sys_authorities_resources_sys_authorities_resources1_idx` (`resource_id`);

--
-- Indexes for table `sys_menus`
--
ALTER TABLE `sys_menus`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_sys_menus_menus` (`parent_id`), ADD KEY `fk_sys_menu_resouces` (`source_id`);

--
-- Indexes for table `sys_resources`
--
ALTER TABLE `sys_resources`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD UNIQUE KEY `resource_path` (`resource_path`), ADD UNIQUE KEY `resource_name` (`resource_name`), ADD KEY `fk_sys_resources_1_idx` (`parent_id`), ADD KEY `fk_sys_resouces_resouces` (`parent_id`), ADD KEY `id` (`id`);

--
-- Indexes for table `sys_roles`
--
ALTER TABLE `sys_roles`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `sys_roles_anthorities`
--
ALTER TABLE `sys_roles_anthorities`
 ADD KEY `fk_sys_roles_anthorities_1_idx` (`role_id`), ADD KEY `fk_sys_roles_anthorities_1_idx1` (`authority_id`);

--
-- Indexes for table `sys_role_menus`
--
ALTER TABLE `sys_role_menus`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_role_menus_menus` (`menu_id`), ADD KEY `fk_role_menus_role` (`role_id`);

--
-- Indexes for table `sys_users`
--
ALTER TABLE `sys_users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD UNIQUE KEY `user_account` (`user_account`);

--
-- Indexes for table `sys_users_roles`
--
ALTER TABLE `sys_users_roles`
 ADD KEY `fk_sys_users_roles_1_idx` (`user_id`), ADD KEY `fk_sys_users_roles_1_idx1` (`role_id`);

--
-- Indexes for table `user_login_log`
--
ALTER TABLE `user_login_log`
 ADD PRIMARY KEY (`id`);

--
-- 限制导出的表
--

--
-- 限制表 `sys_authorities_resources`
--
ALTER TABLE `sys_authorities_resources`
ADD CONSTRAINT `fk_sys_authorities_resources_sys_authorities1` FOREIGN KEY (`authority_id`) REFERENCES `sys_authorities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_sys_authorities_resources_sys_authorities_resources1` FOREIGN KEY (`resource_id`) REFERENCES `sys_resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `sys_menus`
--
ALTER TABLE `sys_menus`
ADD CONSTRAINT `fk_sys_menu_resouces` FOREIGN KEY (`source_id`) REFERENCES `sys_resources` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `fk_sys_menus_menus` FOREIGN KEY (`parent_id`) REFERENCES `sys_menus` (`id`) ON DELETE CASCADE;

--
-- 限制表 `sys_resources`
--
ALTER TABLE `sys_resources`
ADD CONSTRAINT `sys_resources_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `sys_resources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- 限制表 `sys_roles_anthorities`
--
ALTER TABLE `sys_roles_anthorities`
ADD CONSTRAINT `fk_sys_roles_anthorities_authority_id` FOREIGN KEY (`authority_id`) REFERENCES `sys_authorities` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_sys_roles_anthorities_role_id` FOREIGN KEY (`role_id`) REFERENCES `sys_roles` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- 限制表 `sys_role_menus`
--
ALTER TABLE `sys_role_menus`
ADD CONSTRAINT `fk_role_menus_menus` FOREIGN KEY (`menu_id`) REFERENCES `sys_menus` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_role_menus_role` FOREIGN KEY (`role_id`) REFERENCES `sys_roles` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `sys_role_menus_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `sys_menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `sys_users_roles`
--
ALTER TABLE `sys_users_roles`
ADD CONSTRAINT `fk_sys_users_roles_role_id` FOREIGN KEY (`role_id`) REFERENCES `sys_roles` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_sys_users_roles_user_id` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
