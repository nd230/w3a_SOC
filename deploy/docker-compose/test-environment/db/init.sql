CREATE DATABASE w3a_soc;
USE w3a_soc;
/*
 Navicat MySQL Data Transfer

 Source Server Type    : MariaDB
 Source Server Version : 50568
 Source Schema         : w3a_soc

 Target Server Type    : MariaDB
 Target Server Version : 50568
 File Encoding         : 65001

 Date: 13/05/2022 02:38:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `w3_alter_channel`;
CREATE TABLE `w3_alter_channel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `alter_id` bigint(20) NOT NULL COMMENT 'id',
  `alter_source_id` bigint(20) NOT NULL COMMENT '告警渠道id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='告警渠道表';

-- ----------------------------
-- Table structure for w3_alter_config
-- ----------------------------
DROP TABLE IF EXISTS `w3_alter_config`;
CREATE TABLE `w3_alter_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `alter_source_createtime` datetime NOT NULL COMMENT '创建时间',
  `alter_source_name` varchar(50) NOT NULL COMMENT '告警源名称',
  `alter_source_updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `alter_source_type` tinyint(1) DEFAULT '0' COMMENT '告警源，0：企业微信、1：钉钉、2：邮件',
  `alter_config_status` tinyint(1) DEFAULT '0' COMMENT '配置状态，0：启用、1：不启用',
  `alter_config_email_username` varchar(255) DEFAULT '' COMMENT '邮箱账号',
  `alter_config_email_password` varchar(255) DEFAULT '' COMMENT '邮箱密码',
  `alter_config_token` varchar(255) DEFAULT '' COMMENT '企业微信、钉钉的TOKEN',
  `alter_config_delete` tinyint(1) DEFAULT '1' COMMENT '逻辑删除,0：已删除，1：启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='告警配置表';

-- ----------------------------
-- Table structure for w3_alter_logs
-- ----------------------------
DROP TABLE IF EXISTS `w3_alter_logs`;
CREATE TABLE `w3_alter_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `alter_id` bigint(20) NOT NULL COMMENT '规则id',
  `alter_createtime` datetime NOT NULL COMMENT '创建时间',
  `alter_info` longtext NOT NULL COMMENT '告警内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='告警记录表';

-- ----------------------------
-- Table structure for w3_alter_master
-- ----------------------------
DROP TABLE IF EXISTS `w3_alter_master`;
CREATE TABLE `w3_alter_master` (
  `alter_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `alter_name` text NOT NULL COMMENT '告警内容',
  `alter_scenes` tinyint(1) DEFAULT '1' COMMENT '场景：1:攻击流量场景观测，2:统计报表场景',
  `alter_trigger` bigint(20) DEFAULT '0' COMMENT '告警触发',
  `alter_createtime` datetime NOT NULL COMMENT '创建时间',
  `alter_updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `alter_status` tinyint(1) DEFAULT '1' COMMENT '告警状态,0：关闭，1：开启',
  `alter_delete` tinyint(1) DEFAULT '1' COMMENT '告警状态,0：删除，1：启用',
  PRIMARY KEY (`alter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='告警主表';

-- ----------------------------
-- Table structure for w3_alter_paramets
-- ----------------------------
DROP TABLE IF EXISTS `w3_alter_paramets`;
CREATE TABLE `w3_alter_paramets` (
  `alter_id` bigint(20) NOT NULL COMMENT 'id',
  `alter_url` text COMMENT '配置URL内容',
  `alter_useragent` text COMMENT '配置USERAGENT',
  `alter_ipaddr` text COMMENT '配置IP地址',
  `alter_referer` text COMMENT '配置Referer',
  `alter_frequency` bigint(20) DEFAULT '0' COMMENT '访问频率',
  `alter_statistics_type` tinyint(1) DEFAULT '0' COMMENT '统计类型,0:巡检统计数据,1:报表处理数据',
  `alter_time` tinyint(1) DEFAULT '1' COMMENT '时间类型,1：每分钟，2：每小时,3:每天,4:每周',
  PRIMARY KEY (`alter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='告警参数表';

-- ----------------------------
-- Table structure for w3_license
-- ----------------------------
DROP TABLE IF EXISTS `w3_license`;
CREATE TABLE `w3_license` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `license_type` tinyint(1) DEFAULT '1' COMMENT '类型,1:License版本,2:License内容',
  `lincese_info` char(32) DEFAULT '' COMMENT 'License内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='License管理';

-- ----------------------------
-- Table structure for w3_statistics
-- ----------------------------
DROP TABLE IF EXISTS `w3_statistics`;
CREATE TABLE `w3_statistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `statis_uptime` datetime DEFAULT NULL COMMENT '创建/更新时间',
  `statis_type` tinyint(1) DEFAULT '0' COMMENT '类型，0：审计日志数、1：识别攻击数、2：审计网络请求数,3:识别网络风险数',
  `statis_counts` bigint(20) DEFAULT '0' COMMENT '统计数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='数据统计表';

-- ----------------------------
-- Table structure for w3_users
-- ----------------------------
DROP TABLE IF EXISTS `w3_users`;
CREATE TABLE `w3_users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(25) NOT NULL COMMENT '用户名',
  `user_password` char(32) NOT NULL COMMENT '密码',
  `user_createtime` datetime NOT NULL COMMENT '创建时间',
  `user_updatetime` datetime DEFAULT NULL COMMENT '最后更新/登录时间',
  `user_status` tinyint(1) DEFAULT '1' COMMENT '规则状态,0：禁用，1：启用',
  `user_delete` tinyint(1) DEFAULT '1' COMMENT '逻辑删除状态,0：已删除，1：启用',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Table structure for w3_vuls_circulation
-- ----------------------------
DROP TABLE IF EXISTS `w3_vuls_circulation`;
CREATE TABLE `w3_vuls_circulation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `vid` bigint(20) NOT NULL COMMENT 'id',
  `vul_circulation_createtime` datetime NOT NULL COMMENT '流转时间',
  `vul_dispose_status` tinyint(1) DEFAULT '0' COMMENT '处置状态,0:待处理,1:解决中,2:误报忽略,3:已解决,4:白名单,5:无效单,6:修改',
  `vul_circulation_info` varchar(255) DEFAULT '暂无' COMMENT '流转信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='漏洞管理.流转单';

-- ----------------------------
-- Table structure for w3_vuls_service
-- ----------------------------
DROP TABLE IF EXISTS `w3_vuls_service`;
CREATE TABLE `w3_vuls_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `vul_id` varchar(25) NOT NULL COMMENT '漏洞编号',
  `vul_name` varchar(255) DEFAULT '' COMMENT '漏洞名称',
  `vul_createtime` datetime NOT NULL COMMENT '创建时间',
  `vul_updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `vul_solvetime` datetime DEFAULT NULL COMMENT '解决时间',
  `vul_info` longtext NOT NULL COMMENT '漏洞信息',
  `vul_suggestion` longtext COMMENT '解决建议',
  `vul_referer` longtext COMMENT '引用参考',
  `vul_level` tinyint(1) DEFAULT '0' COMMENT '漏洞级别,0:低危,1:中危,2:高危',
  `vul_source` tinyint(1) DEFAULT '0' COMMENT '漏洞来源,0:内部,1:第三方',
  `vul_source_object` tinyint(1) DEFAULT '0' COMMENT '漏洞来源对象,0:人工,1:工具检测,2:公司名,3:白帽子',
  `vul_source_info` varchar(255) DEFAULT NULL COMMENT '漏洞来源对象内容',
  `vul_dispose_status` tinyint(1) DEFAULT '0' COMMENT '处置状态,0:待处理,1:解决中,2:误报忽略,3:已解决,4:白名单',
  `vul_circulation` tinyint(1) DEFAULT '0' COMMENT '内部流转,0:未接入,1:接入',
  `vul_delete` tinyint(1) DEFAULT '1' COMMENT '逻辑删除,0:已删除,1:正常',
  `vul_tags` varchar(255) DEFAULT '' COMMENT '漏洞标签,用,号分开',
  `vul_uuid` bigint(20) DEFAULT '0' COMMENT '漏洞创建人，如果是工具，默认为0',
  `vul_hosts` bigint(20) NOT NULL COMMENT '漏洞归属站点的ID',
  PRIMARY KEY (`id`,`vul_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='漏洞管理';

-- ----------------------------
-- Table structure for w3_vuls_tags
-- ----------------------------
DROP TABLE IF EXISTS `w3_vuls_tags`;
CREATE TABLE `w3_vuls_tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `vul_tags` varchar(30) NOT NULL COMMENT '漏洞标签',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='漏洞管理.风险标签';

-- ----------------------------
-- Table structure for w3_web_attack_rules
-- ----------------------------
DROP TABLE IF EXISTS `w3_web_attack_rules`;
CREATE TABLE `w3_web_attack_rules` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '规则id',
  `rules_name` varchar(50) NOT NULL COMMENT '规则名称',
  `rules_level` tinyint(1) DEFAULT '0' COMMENT '风险级别,0:低危,1:中危,2:高危',
  `rules_trigger_count` bigint(20) DEFAULT '0' COMMENT '触发量',
  `rules_createtime` datetime NOT NULL COMMENT '创建时间',
  `rules_updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `rules_status` tinyint(1) DEFAULT '0' COMMENT '规则状态,0：待启用，1：启用，2：禁用，3：异常',
  `rules_delete` tinyint(1) DEFAULT '1' COMMENT '逻辑删除状态,0：已删除，1：启用',
  `rules_regex` longtext NOT NULL COMMENT '规则内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='web检测规则';

-- ----------------------------
-- Table structure for w3_web_attacks
-- ----------------------------
DROP TABLE IF EXISTS `w3_web_attacks`;
CREATE TABLE `w3_web_attacks` (
  `attack_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `attack_createtime` datetime NOT NULL COMMENT '事件时间',
  `attack_method` tinyint(1) NOT NULL COMMENT '事件请求类型,0:GET,1:POST,2:PUT,3:DELETE,4:HEAD,5:OPTIONS,6:TRACE,7:CONNECT,8:PATCH',
  `attack_source_ip` varchar(15) NOT NULL COMMENT '事件源IP',
  `attack_risk_level` tinyint(1) NOT NULL COMMENT '风险等级,0:低危,1:中危,2:高危,3:严重',
  `attack_hosts` varchar(255) DEFAULT '' COMMENT '目标业务',
  `attack_rules_id` bigint(20) NOT NULL COMMENT '攻击规则的ID',
  `attack_http_code` varchar(4) NOT NULL COMMENT '响应头',
  `attack_referer` varchar(255) DEFAULT '' COMMENT '请求referer来源',
  `attack_ua` text COMMENT 'Useragent',
  `attack_path` text COMMENT '攻击路径',
  `attack_body` text COMMENT 'POST请求的内容',
  `attack_sent_bytes` int(11) DEFAULT '0' COMMENT '报文大小',
  `attack_sent_time` varchar(15) DEFAULT '0.000' COMMENT '请求耗时',
  `attack_effective` tinyint(1) DEFAULT '0' COMMENT '处置状态,0:待处置,1:确认攻击,2:确认误报',
  `attack_area` varchar(10) DEFAULT '未知' COMMENT '归属地区',
  `attack_judge` varchar(255) DEFAULT '暂无' COMMENT '判定备注',
  PRIMARY KEY (`attack_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5539 DEFAULT CHARSET=utf8 COMMENT='攻击日志信息';

-- ----------------------------
-- Table structure for w3_web_attacks_circulation
-- ----------------------------
DROP TABLE IF EXISTS `w3_web_attacks_circulation`;
CREATE TABLE `w3_web_attacks_circulation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `attack_id` bigint(20) NOT NULL COMMENT 'id',
  `attack_circulation_createtime` datetime NOT NULL COMMENT '流转时间',
  `attack_circulation_logs` varchar(255) DEFAULT '暂无' COMMENT '流转信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5549 DEFAULT CHARSET=utf8 COMMENT='攻击日志信息.流转单';

-- ----------------------------
-- Table structure for w3_website
-- ----------------------------
DROP TABLE IF EXISTS `w3_website`;
CREATE TABLE `w3_website` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `website_name` char(100) NOT NULL COMMENT '站点应用名称',
  `website_domain` char(100) NOT NULL COMMENT '站点域名',
  `website_info` char(100) DEFAULT NULL COMMENT '站点应用备注',
  `website_createtime` datetime NOT NULL COMMENT '创建时间',
  `website_updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `website_delete` tinyint(1) DEFAULT '1' COMMENT '逻辑删除,0:删除，1:可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='站点管理';

-- ----------------------------
-- Table structure for w3_website_config
-- ----------------------------
DROP TABLE IF EXISTS `w3_website_config`;
CREATE TABLE `w3_website_config` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `website_log_ipdomain` varchar(100) NOT NULL COMMENT 'ES的IP或域名',
  `website_log_port` int(11) DEFAULT '0' COMMENT 'ES的端口',
  `website_log_protype` tinyint(1) DEFAULT '0' COMMENT 'ES的协议，HTTP/HTTPS',
  `website_log_idslog_index` varchar(100) DEFAULT NULL COMMENT 'ids日志索引',
  `website_log_weblog_index` varchar(100) DEFAULT NULL COMMENT 'web日志索引',
  `website_createtime` datetime NOT NULL COMMENT '创建时间',
  `website_updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`,`website_log_ipdomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点管理.配置站点';

-- ----------------------------
-- Table structure for w3_website_service
-- ----------------------------
DROP TABLE IF EXISTS `w3_website_service`;
CREATE TABLE `w3_website_service` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `website_types` tinyint(1) NOT NULL DEFAULT '0' COMMENT '服务开启类型,0:可用性监控,1:流量监控,2:篡改监控,3:Web日志监控',
  `website_createtime` datetime NOT NULL COMMENT '创建时间',
  `website_updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`,`website_types`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点管理.服务配置';

/**
 * 初始化数据
 */
-- ----------------------------
-- 创建测试账号密码
-- ----------------------------
INSERT INTO `w3a_soc`.`w3_users`(`user_name`,`user_password`,`user_createtime`)VALUES('admin','385ba8ba360a0efbf17c93784323f655', now());
-- ----------------------------
-- ----------------------------
-- 创建统计数据
-- ----------------------------
INSERT INTO `w3a_soc`.`w3_statistics`(`id`, `statis_uptime`, `statis_type`, `statis_counts`) VALUES (1, NULL, 0, 0);
INSERT INTO `w3a_soc`.`w3_statistics`(`id`, `statis_uptime`, `statis_type`, `statis_counts`) VALUES (2, NULL, 1, 0);
INSERT INTO `w3a_soc`.`w3_statistics`(`id`, `statis_uptime`, `statis_type`, `statis_counts`) VALUES (3, NULL, 2, 0);
INSERT INTO `w3a_soc`.`w3_statistics`(`id`, `statis_uptime`, `statis_type`, `statis_counts`) VALUES (4, NULL, 3, 0);
-- ----------------------------
-- 创建测试规则数据
-- ----------------------------
INSERT INTO `w3a_soc`.`w3_web_attack_rules`(`id`, `rules_name`, `rules_level`, `rules_trigger_count`, `rules_createtime`, `rules_updatetime`, `rules_status`, `rules_delete`, `rules_regex`) VALUES (1, 'SQL注入-探测', 2, 0, now(), NULL, 1, 1, 'KD9pKShhbmR8b3IpKC4qKVxkPVxk');
INSERT INTO `w3a_soc`.`w3_web_attack_rules`(`id`, `rules_name`, `rules_level`, `rules_trigger_count`, `rules_createtime`, `rules_updatetime`, `rules_status`, `rules_delete`, `rules_regex`) VALUES (2, 'PHP敏感目录扫描', 0, 0, now(), NULL, 1, 1, 'KD9pKSh3cC1sb2dpbnxjbWR8YWRtaW58cGhwaW5mbylcLnBocA==');
INSERT INTO `w3a_soc`.`w3_web_attack_rules`(`id`, `rules_name`, `rules_level`, `rules_trigger_count`, `rules_createtime`, `rules_updatetime`, `rules_status`, `rules_delete`, `rules_regex`) VALUES (3, '链路跟踪探针探测', 0, 0, now(), NULL, 1, 1, 'KD9pKSh0cmFjZXx0cmFjZWluZyk=');
INSERT INTO `w3a_soc`.`w3_web_attack_rules`(`id`, `rules_name`, `rules_level`, `rules_trigger_count`, `rules_createtime`, `rules_updatetime`, `rules_status`, `rules_delete`, `rules_regex`) VALUES (4, 'SQL注入-UNION', 2, 0, now(), NULL, 1, 1, 'KC4qKSg/aSkodW5pb24pKC4qKSg/aSkoc2VsZWN0KQ==');
INSERT INTO `w3a_soc`.`w3_web_attack_rules`(`id`, `rules_name`, `rules_level`, `rules_trigger_count`, `rules_createtime`, `rules_updatetime`, `rules_status`, `rules_delete`, `rules_regex`) VALUES (5, 'composer文件泄露探测', 0, 0, now(), NULL, 1, 1, 'KD9pKVwuKGNvbXBvc2VyXC9jb21wb3NlclwuanNvbik=');
INSERT INTO `w3a_soc`.`w3_web_attack_rules`(`id`, `rules_name`, `rules_level`, `rules_trigger_count`, `rules_createtime`, `rules_updatetime`, `rules_status`, `rules_delete`, `rules_regex`) VALUES (6, 'Jira版本探测', 0, 0, now(), NULL, 1, 1, 'XC8oP2kpc2VjdXJlXC8oP2kpRGFzaGJvYXJkXC5qc3Bh');
INSERT INTO `w3a_soc`.`w3_web_attack_rules`(`id`, `rules_name`, `rules_level`, `rules_trigger_count`, `rules_createtime`, `rules_updatetime`, `rules_status`, `rules_delete`, `rules_regex`) VALUES (7, '后门地址', 1, 0, now(), NULL, 1, 1, 'KD9pKShjbWR8YmFja2Rvb3J8MXx0ZXN0fHBocGluZm98cGhwfGpzcClcLihwaHB8anNwfGFzcHh8YXNwKQ==');
INSERT INTO `w3a_soc`.`w3_web_attack_rules`(`id`, `rules_name`, `rules_level`, `rules_trigger_count`, `rules_createtime`, `rules_updatetime`, `rules_status`, `rules_delete`, `rules_regex`) VALUES (8, '本地文件包含', 2, 0, now(), NULL, 1, 1, 'XC8oP2kpKGV0Y3xwYXNzd2R8d2luZG93c1wvd2luKQ==');
INSERT INTO `w3a_soc`.`w3_web_attack_rules`(`id`, `rules_name`, `rules_level`, `rules_trigger_count`, `rules_createtime`, `rules_updatetime`, `rules_status`, `rules_delete`, `rules_regex`) VALUES (9, '远程命令执行', 2, 0, now(), NULL, 1, 1, 'KD9pKShkZWZpbmV8ZXZhbHxmaWxlX2dldF9jb250ZW50c3xpbmNsdWRlfHJlcXVpcmV8cmVxdWlyZV9vbmNlfHNoZWxsX2V4ZWN8cGhwaW5mb3xzeXN0ZW18cGFzc3RocnV8Y2hhcnxjaHJ8ZXhlY3V0ZXxlY2hvfHByaW50fHByaW50X3J8dmFyX2R1bXB8b3BlbikoLiop');
INSERT INTO `w3a_soc`.`w3_web_attack_rules`(`id`, `rules_name`, `rules_level`, `rules_trigger_count`, `rules_createtime`, `rules_updatetime`, `rules_status`, `rules_delete`, `rules_regex`) VALUES (10, '弱口令探测', 2, 0, now(), NULL, 1, 1, 'KD9pKShwYXNzd29yZHxwYXNzfHBhc3N3ZHxwd2R8cGR8dXNlcnB3ZHx1c2VycGFzc3x1c2VycGFzc3dkfHVzZXJwYXNzd29yZHxwYXNzX3dvcmR8dXNlcl9wYXNzd29yZHx1c2VyX3Bhc3MpXD0oP2kpKGFkbWlufGFkbWluMTIzfGFkbWluMTIzNDU2fDEyMzQ1NnxhZG1pbjg4OHxhZG1pbjg4ODh8dGVzdHwxMjM0fDEyM3x0ZXN0MTIzKQ==');
INSERT INTO `w3a_soc`.`w3_web_attack_rules`(`id`, `rules_name`, `rules_level`, `rules_trigger_count`, `rules_createtime`, `rules_updatetime`, `rules_status`, `rules_delete`, `rules_regex`) VALUES (11, 'XSS跨站脚本攻击', 2, 0, now(), NULL, 1, 1, 'XDwoP2kpc2NyaXB0XD4oP2kpYWxlcnRcKCguKilcKVw8XC8oP2kpc2NyaXB0XD4=');

SET FOREIGN_KEY_CHECKS = 1;
