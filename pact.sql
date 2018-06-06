/*
Navicat MySQL Data Transfer

Source Server         : 58.213.91.96-dev
Source Server Version : 50637
Source Host           : 58.213.91.96:29002
Source Database       : gxs_pact

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2018-05-07 13:56:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`qrtz_blob_triggers`;
CREATE TABLE `gxs_pact`.`qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`qrtz_calendars`;
CREATE TABLE `gxs_pact`.`qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`qrtz_cron_triggers`;
CREATE TABLE `gxs_pact`.`qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `gxs_pact`.`qrtz_cron_triggers` VALUES ('GclfaxScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `gxs_pact`.`qrtz_cron_triggers` VALUES ('GclfaxScheduler', 'TASK_2', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`qrtz_fired_triggers`;
CREATE TABLE `gxs_pact`.`qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`qrtz_job_details`;
CREATE TABLE `gxs_pact`.`qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `gxs_pact`.`qrtz_job_details` VALUES ('GclfaxScheduler', 'TASK_1', 'DEFAULT', null, 'com.gclfax.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400B67B226A6F624964223A312C226265616E4E616D65223A22746573745461736B222C226D6574686F644E616D65223A2274657374222C22706172616D73223A2267636C666178222C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C22737461747573223A302C2272656D61726B223A22E69C89E58F82E695B0E6B58BE8AF95222C2263726561746554696D65223A2244656320312C20323031362031313A31363A343620504D227D7800);
INSERT INTO `gxs_pact`.`qrtz_job_details` VALUES ('GclfaxScheduler', 'TASK_2', 'DEFAULT', null, 'com.gclfax.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400A47B226A6F624964223A322C226265616E4E616D65223A22746573745461736B222C226D6574686F644E616D65223A227465737432222C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C22737461747573223A312C2272656D61726B223A22E697A0E58F82E695B0E6B58BE8AF95222C2263726561746554696D65223A2244656320332C203230313620323A35353A353620504D227D7800);

-- ----------------------------
-- Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`qrtz_locks`;
CREATE TABLE `gxs_pact`.`qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `gxs_pact`.`qrtz_locks` VALUES ('GclfaxScheduler', 'STATE_ACCESS');
INSERT INTO `gxs_pact`.`qrtz_locks` VALUES ('GclfaxScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`qrtz_paused_trigger_grps`;
CREATE TABLE `gxs_pact`.`qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`qrtz_scheduler_state`;
CREATE TABLE `gxs_pact`.`qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `gxs_pact`.`qrtz_scheduler_state` VALUES ('GclfaxScheduler', 'DESKTOP-QINSEN1525671903264', '1525672574752', '15000');

-- ----------------------------
-- Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`qrtz_simple_triggers`;
CREATE TABLE `gxs_pact`.`qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`qrtz_simprop_triggers`;
CREATE TABLE `gxs_pact`.`qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`qrtz_triggers`;
CREATE TABLE `gxs_pact`.`qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `gxs_pact`.`qrtz_triggers` VALUES ('GclfaxScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1525672800000', '1524907800000', '5', 'WAITING', 'CRON', '1516957586000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400B67B226A6F624964223A312C226265616E4E616D65223A22746573745461736B222C226D6574686F644E616D65223A2274657374222C22706172616D73223A2267636C666178222C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C22737461747573223A302C2272656D61726B223A22E69C89E58F82E695B0E6B58BE8AF95222C2263726561746554696D65223A2244656320312C20323031362031313A31363A343620504D227D7800);
INSERT INTO `gxs_pact`.`qrtz_triggers` VALUES ('GclfaxScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1516959000000', '-1', '5', 'PAUSED', 'CRON', '1516957586000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400A47B226A6F624964223A322C226265616E4E616D65223A22746573745461736B222C226D6574686F644E616D65223A227465737432222C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C22737461747573223A312C2272656D61726B223A22E697A0E58F82E695B0E6B58BE8AF95222C2263726561746554696D65223A2244656320332C203230313620323A35353A353620504D227D7800);

-- ----------------------------
-- Table structure for `schedule_job`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`schedule_job`;
CREATE TABLE `gxs_pact`.`schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `gxs_pact`.`schedule_job` VALUES ('1', 'testTask', 'test', 'gclfax', '0 0/30 * * * ?', '0', '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `gxs_pact`.`schedule_job` VALUES ('2', 'testTask', 'test2', null, '0 0/30 * * * ?', '1', '无参数测试', '2016-12-03 14:55:56');

-- ----------------------------
-- Table structure for `schedule_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`schedule_job_log`;
CREATE TABLE `gxs_pact`.`schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('1', '1', 'testTask', 'test', 'gclfax', '0', null, '1072', '2018-01-26 17:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('2', '1', 'testTask', 'test', 'gclfax', '0', null, '1106', '2018-01-29 17:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('3', '1', 'testTask', 'test', 'gclfax', '0', null, '1079', '2018-01-29 18:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('4', '1', 'testTask', 'test', 'gclfax', '0', null, '1040', '2018-01-29 18:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('5', '1', 'testTask', 'test', 'gclfax', '0', null, '1037', '2018-01-29 19:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('6', '1', 'testTask', 'test', 'gclfax', '0', null, '1040', '2018-01-29 19:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('7', '1', 'testTask', 'test', 'gclfax', '0', null, '1040', '2018-01-29 20:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('8', '1', 'testTask', 'test', 'gclfax', '0', null, '1042', '2018-01-29 20:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('9', '1', 'testTask', 'test', 'gclfax', '0', null, '1095', '2018-01-30 09:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('10', '1', 'testTask', 'test', 'gclfax', '0', null, '1065', '2018-01-30 11:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('11', '1', 'testTask', 'test', 'gclfax', '0', null, '1101', '2018-01-30 16:30:01');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('12', '1', 'testTask', 'test', 'gclfax', '0', null, '1033', '2018-01-30 17:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('13', '1', 'testTask', 'test', 'gclfax', '0', null, '1030', '2018-01-30 17:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('14', '1', 'testTask', 'test', 'gclfax', '0', null, '1056', '2018-01-30 18:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('15', '1', 'testTask', 'test', 'gclfax', '0', null, '1043', '2018-01-30 19:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('16', '1', 'testTask', 'test', 'gclfax', '0', null, '1045', '2018-01-30 19:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('17', '1', 'testTask', 'test', 'gclfax', '0', null, '1049', '2018-01-30 20:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('18', '1', 'testTask', 'test', 'gclfax', '0', null, '1044', '2018-01-30 20:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('19', '1', 'testTask', 'test', 'gclfax', '0', null, '1071', '2018-01-31 19:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('20', '1', 'testTask', 'test', 'gclfax', '0', null, '1093', '2018-02-01 10:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('21', '1', 'testTask', 'test', 'gclfax', '0', null, '1077', '2018-02-01 11:00:01');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('22', '1', 'testTask', 'test', 'gclfax', '0', null, '1052', '2018-02-01 11:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('23', '1', 'testTask', 'test', 'gclfax', '0', null, '1072', '2018-02-01 12:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('24', '1', 'testTask', 'test', 'gclfax', '0', null, '1044', '2018-02-01 12:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('25', '1', 'testTask', 'test', 'gclfax', '0', null, '1060', '2018-02-01 13:00:00');
INSERT INTO `gxs_pact`.`gxs_pact`.`schedule_job_log` VALUES ('26', '1', 'testTask', 'test', 'gclfax', '0', null, '1033', '2018-02-01 13:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('27', '1', 'testTask', 'test', 'gclfax', '0', null, '1039', '2018-02-01 14:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('28', '1', 'testTask', 'test', 'gclfax', '0', null, '1046', '2018-02-01 14:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('29', '1', 'testTask', 'test', 'gclfax', '0', null, '1040', '2018-02-01 15:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('30', '1', 'testTask', 'test', 'gclfax', '0', null, '1034', '2018-02-01 15:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('31', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-01 16:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('32', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-01 16:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('33', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-01 17:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('34', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-01 17:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('35', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-01 18:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('36', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-01 18:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('37', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-01 19:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('38', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-01 19:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('39', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-01 20:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('40', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-01 20:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('41', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-01 21:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('42', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-01 21:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('43', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-01 22:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('44', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-01 22:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('45', '1', 'testTask', 'test', 'gclfax', '0', null, '1008', '2018-02-01 23:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('46', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-01 23:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('47', '1', 'testTask', 'test', 'gclfax', '0', null, '1008', '2018-02-02 00:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('48', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 00:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('49', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-02 01:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('50', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-02 01:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('51', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 02:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('52', '1', 'testTask', 'test', 'gclfax', '0', null, '1005', '2018-02-02 02:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('53', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 03:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('54', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 03:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('55', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-02 04:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('56', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 04:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('57', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 05:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('58', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 05:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('59', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 06:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('60', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 06:30:42');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('61', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 07:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('62', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-02 07:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('63', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 08:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('64', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-02 08:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('65', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 09:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('66', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-02 09:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('67', '1', 'testTask', 'test', 'gclfax', '0', null, '1043', '2018-02-02 10:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('68', '1', 'testTask', 'test', 'gclfax', '0', null, '1267', '2018-02-02 10:30:01');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('69', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 11:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('70', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 11:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('71', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 12:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('72', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-02 12:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('73', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 13:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('74', '1', 'testTask', 'test', 'gclfax', '0', null, '1028', '2018-02-02 13:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('75', '1', 'testTask', 'test', 'gclfax', '0', null, '1029', '2018-02-02 14:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('76', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-02 14:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('77', '1', 'testTask', 'test', 'gclfax', '0', null, '1097', '2018-02-02 15:00:01');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('78', '1', 'testTask', 'test', 'gclfax', '0', null, '1037', '2018-02-02 15:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('79', '1', 'testTask', 'test', 'gclfax', '0', null, '1063', '2018-02-02 16:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('80', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-02 16:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('81', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 17:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('82', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 17:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('83', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 18:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('84', '1', 'testTask', 'test', 'gclfax', '0', null, '1058', '2018-02-02 18:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('85', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 19:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('86', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 19:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('87', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-02 20:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('88', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 20:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('89', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 21:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('90', '1', 'testTask', 'test', 'gclfax', '0', null, '1060', '2018-02-02 21:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('91', '1', 'testTask', 'test', 'gclfax', '0', null, '1060', '2018-02-02 22:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('92', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 22:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('93', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 23:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('94', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-02 23:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('95', '1', 'testTask', 'test', 'gclfax', '0', null, '1010', '2018-02-03 00:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('96', '1', 'testTask', 'test', 'gclfax', '0', null, '1005', '2018-02-03 00:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('97', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 01:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('98', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 01:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('99', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-03 02:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('100', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-03 02:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('101', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 03:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('102', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-03 03:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('103', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 04:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('104', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-03 04:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('105', '1', 'testTask', 'test', 'gclfax', '0', null, '1005', '2018-02-03 05:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('106', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-03 05:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('107', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 06:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('108', '1', 'testTask', 'test', 'gclfax', '0', null, '1014', '2018-02-03 06:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('109', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-03 07:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('110', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-03 07:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('111', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-03 08:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('112', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 08:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('113', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 09:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('114', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-03 09:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('115', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-03 10:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('116', '1', 'testTask', 'test', 'gclfax', '0', null, '1032', '2018-02-03 10:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('117', '1', 'testTask', 'test', 'gclfax', '0', null, '1118', '2018-02-03 11:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('118', '1', 'testTask', 'test', 'gclfax', '0', null, '1059', '2018-02-03 11:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('119', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 12:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('120', '1', 'testTask', 'test', 'gclfax', '0', null, '1047', '2018-02-03 12:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('121', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-03 13:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('122', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 13:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('123', '1', 'testTask', 'test', 'gclfax', '0', null, '1058', '2018-02-03 14:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('124', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 14:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('125', '1', 'testTask', 'test', 'gclfax', '0', null, '1061', '2018-02-03 15:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('126', '1', 'testTask', 'test', 'gclfax', '0', null, '1085', '2018-02-03 15:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('127', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 16:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('128', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 16:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('129', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-03 17:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('130', '1', 'testTask', 'test', 'gclfax', '0', null, '1034', '2018-02-03 17:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('131', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 18:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('132', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 18:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('133', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 19:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('134', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 19:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('135', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-03 20:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('136', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-03 20:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('137', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-03 21:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('138', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 21:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('139', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 22:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('140', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-03 22:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('141', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 23:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('142', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-03 23:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('143', '1', 'testTask', 'test', 'gclfax', '0', null, '1008', '2018-02-04 00:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('144', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 00:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('145', '1', 'testTask', 'test', 'gclfax', '0', null, '1005', '2018-02-04 01:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('146', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-04 01:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('147', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 02:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('148', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-04 02:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('149', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 03:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('150', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 03:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('151', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 04:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('152', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 04:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('153', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-04 05:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('154', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-04 05:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('155', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-04 06:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('156', '1', 'testTask', 'test', 'gclfax', '0', null, '1024', '2018-02-04 06:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('157', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 07:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('158', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 07:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('159', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-04 08:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('160', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-04 08:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('161', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-04 09:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('162', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-04 09:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('163', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 10:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('164', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 10:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('165', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 11:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('166', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-04 11:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('167', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 12:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('168', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-04 12:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('169', '1', 'testTask', 'test', 'gclfax', '0', null, '1030', '2018-02-04 13:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('170', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 13:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('171', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 14:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('172', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-04 14:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('173', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 15:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('174', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-04 15:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('175', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-04 16:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('176', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 16:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('177', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 17:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('178', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 17:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('179', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 18:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('180', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 18:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('181', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 19:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('182', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 19:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('183', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-04 20:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('184', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 20:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('185', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 21:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('186', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 21:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('187', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 22:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('188', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-04 22:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('189', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-04 23:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('190', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-04 23:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('191', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-05 00:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('192', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-05 00:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('193', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-05 01:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('194', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-05 01:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('195', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-05 02:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('196', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-05 02:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('197', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-05 03:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('198', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-05 03:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('199', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-05 04:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('200', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-05 04:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('201', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-05 05:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('202', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-05 05:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('203', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-05 06:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('204', '1', 'testTask', 'test', 'gclfax', '0', null, '1014', '2018-02-05 06:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('205', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-05 07:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('206', '1', 'testTask', 'test', 'gclfax', '0', null, '1004', '2018-02-05 07:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('207', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-05 08:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('208', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-05 08:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('209', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-05 09:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('210', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-05 09:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('211', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-05 10:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('212', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-05 10:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('213', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-05 11:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('214', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-05 11:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('215', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-05 12:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('216', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-05 12:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('217', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-05 13:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('218', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-05 13:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('219', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-05 14:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('220', '1', 'testTask', 'test', 'gclfax', '0', null, '1008', '2018-02-05 14:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('221', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-05 15:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('222', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-05 15:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('223', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-05 16:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('224', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-05 16:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('225', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-05 17:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('226', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-05 17:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('227', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-05 18:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('228', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-05 18:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('229', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-05 19:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('230', '1', 'testTask', 'test', 'gclfax', '0', null, '1002', '2018-02-05 19:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('231', '1', 'testTask', 'test', 'gclfax', '0', null, '1003', '2018-02-05 20:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('232', '1', 'testTask', 'test', 'gclfax', '0', null, '1034', '2018-04-25 13:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('233', '1', 'testTask', 'test', 'gclfax', '0', null, '1028', '2018-04-25 13:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('234', '1', 'testTask', 'test', 'gclfax', '0', null, '1011', '2018-04-25 14:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('235', '1', 'testTask', 'test', 'gclfax', '0', null, '1017', '2018-04-25 14:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('236', '1', 'testTask', 'test', 'gclfax', '0', null, '1079', '2018-04-25 17:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('237', '1', 'testTask', 'test', 'gclfax', '0', null, '1048', '2018-04-26 09:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('238', '1', 'testTask', 'test', 'gclfax', '0', null, '1041', '2018-04-26 10:00:01');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('239', '1', 'testTask', 'test', 'gclfax', '0', null, '1258', '2018-04-26 10:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('240', '1', 'testTask', 'test', 'gclfax', '0', null, '1058', '2018-04-26 11:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('241', '1', 'testTask', 'test', 'gclfax', '0', null, '1036', '2018-04-26 11:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('242', '1', 'testTask', 'test', 'gclfax', '0', null, '1032', '2018-04-26 12:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('243', '1', 'testTask', 'test', 'gclfax', '0', null, '1059', '2018-04-26 12:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('244', '1', 'testTask', 'test', 'gclfax', '0', null, '1038', '2018-04-26 13:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('245', '1', 'testTask', 'test', 'gclfax', '0', null, '1037', '2018-04-26 13:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('246', '1', 'testTask', 'test', 'gclfax', '0', null, '1082', '2018-04-26 14:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('247', '1', 'testTask', 'test', 'gclfax', '0', null, '1046', '2018-04-26 14:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('248', '1', 'testTask', 'test', 'gclfax', '0', null, '1071', '2018-04-26 15:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('249', '1', 'testTask', 'test', 'gclfax', '0', null, '1043', '2018-04-26 15:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('250', '1', 'testTask', 'test', 'gclfax', '0', null, '1050', '2018-04-26 16:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('251', '1', 'testTask', 'test', 'gclfax', '0', null, '1052', '2018-04-26 16:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('252', '1', 'testTask', 'test', 'gclfax', '0', null, '1051', '2018-04-26 17:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('253', '1', 'testTask', 'test', 'gclfax', '0', null, '1043', '2018-04-26 17:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('254', '1', 'testTask', 'test', 'gclfax', '0', null, '1046', '2018-04-26 18:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('255', '1', 'testTask', 'test', 'gclfax', '0', null, '1033', '2018-04-26 18:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('256', '1', 'testTask', 'test', 'gclfax', '0', null, '1071', '2018-04-27 09:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('257', '1', 'testTask', 'test', 'gclfax', '0', null, '1077', '2018-04-27 09:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('258', '1', 'testTask', 'test', 'gclfax', '0', null, '1037', '2018-04-27 10:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('259', '1', 'testTask', 'test', 'gclfax', '0', null, '1043', '2018-04-27 10:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('260', '1', 'testTask', 'test', 'gclfax', '0', null, '1083', '2018-04-27 11:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('261', '1', 'testTask', 'test', 'gclfax', '0', null, '1063', '2018-04-27 11:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('262', '1', 'testTask', 'test', 'gclfax', '0', null, '1035', '2018-04-27 12:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('263', '1', 'testTask', 'test', 'gclfax', '0', null, '1035', '2018-04-27 14:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('264', '1', 'testTask', 'test', 'gclfax', '0', null, '1038', '2018-04-27 14:30:01');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('265', '1', 'testTask', 'test', 'gclfax', '0', null, '1044', '2018-04-27 15:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('266', '1', 'testTask', 'test', 'gclfax', '0', null, '1061', '2018-04-27 15:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('267', '1', 'testTask', 'test', 'gclfax', '0', null, '1051', '2018-04-27 16:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('268', '1', 'testTask', 'test', 'gclfax', '0', null, '1051', '2018-04-27 16:30:01');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('269', '1', 'testTask', 'test', 'gclfax', '0', null, '1051', '2018-04-27 17:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('270', '1', 'testTask', 'test', 'gclfax', '0', null, '1049', '2018-04-27 17:30:01');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('271', '1', 'testTask', 'test', 'gclfax', '0', null, '1054', '2018-04-27 18:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('272', '1', 'testTask', 'test', 'gclfax', '0', null, '1051', '2018-04-27 18:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('273', '1', 'testTask', 'test', 'gclfax', '0', null, '1040', '2018-04-27 19:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('274', '1', 'testTask', 'test', 'gclfax', '0', null, '1033', '2018-04-27 19:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('275', '1', 'testTask', 'test', 'gclfax', '0', null, '1043', '2018-04-27 20:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('276', '1', 'testTask', 'test', 'gclfax', '0', null, '1053', '2018-04-27 20:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('277', '1', 'testTask', 'test', 'gclfax', '0', null, '1037', '2018-04-27 21:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('278', '1', 'testTask', 'test', 'gclfax', '0', null, '1050', '2018-04-28 09:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('279', '1', 'testTask', 'test', 'gclfax', '0', null, '1049', '2018-04-28 09:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('280', '1', 'testTask', 'test', 'gclfax', '0', null, '1033', '2018-04-28 10:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('281', '1', 'testTask', 'test', 'gclfax', '0', null, '1038', '2018-04-28 10:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('282', '1', 'testTask', 'test', 'gclfax', '0', null, '1043', '2018-04-28 11:00:01');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('283', '1', 'testTask', 'test', 'gclfax', '0', null, '1029', '2018-04-28 11:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('284', '1', 'testTask', 'test', 'gclfax', '0', null, '1118', '2018-04-28 12:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('285', '1', 'testTask', 'test', 'gclfax', '0', null, '1106', '2018-04-28 12:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('286', '1', 'testTask', 'test', 'gclfax', '0', null, '1044', '2018-04-28 13:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('287', '1', 'testTask', 'test', 'gclfax', '0', null, '1039', '2018-04-28 13:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('288', '1', 'testTask', 'test', 'gclfax', '0', null, '1040', '2018-04-28 14:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('289', '1', 'testTask', 'test', 'gclfax', '0', null, '1107', '2018-04-28 14:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('290', '1', 'testTask', 'test', 'gclfax', '0', null, '1296', '2018-04-28 15:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('291', '1', 'testTask', 'test', 'gclfax', '0', null, '1038', '2018-04-28 15:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('292', '1', 'testTask', 'test', 'gclfax', '0', null, '1084', '2018-04-28 16:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('293', '1', 'testTask', 'test', 'gclfax', '0', null, '1043', '2018-04-28 16:30:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('294', '1', 'testTask', 'test', 'gclfax', '0', null, '1037', '2018-04-28 17:00:00');
INSERT INTO `gxs_pact`.`schedule_job_log` VALUES ('295', '1', 'testTask', 'test', 'gclfax', '0', null, '1090', '2018-04-28 17:30:01');

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`sys_config`;
CREATE TABLE `gxs_pact`.`sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `gxs_pact`.`sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`sys_log`;
CREATE TABLE `gxs_pact`.`sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `gxs_pact`.`sys_log` VALUES ('1', 'admin', '保存菜单', 'com.gclfax.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"协议管理\",\"type\":0,\"orderNum\":1}', '33', '0:0:0:0:0:0:0:1', '2018-04-26 09:13:48');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('2', 'admin', '保存菜单', 'com.gclfax.modules.sys.controller.SysMenuController.save()', '{\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板管理\",\"url\":\"pactmanage\",\"perms\":\"user:list,user:create\",\"type\":1,\"orderNum\":1}', '65', '0:0:0:0:0:0:0:1', '2018-04-26 09:23:51');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('3', 'admin', '修改菜单', 'com.gclfax.modules.sys.controller.SysMenuController.update()', '{\"menuId\":32,\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板管理\",\"url\":\"pactmanage\",\"perms\":\"\",\"type\":1,\"icon\":\"fa fa-file-image-o\",\"orderNum\":1}', '51', '0:0:0:0:0:0:0:1', '2018-04-26 09:26:01');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('4', 'admin', '修改菜单', 'com.gclfax.modules.sys.controller.SysMenuController.update()', '{\"menuId\":32,\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板管理\",\"url\":\"modules/pact/pactManage.html\",\"perms\":\"\",\"type\":1,\"icon\":\"fa fa-file-image-o\",\"orderNum\":1}', '55', '0:0:0:0:0:0:0:1', '2018-04-26 09:38:33');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('5', 'admin', '保存菜单', 'com.gclfax.modules.sys.controller.SysMenuController.save()', '{\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板字典\",\"url\":\"pactDict/list\",\"perms\":\"pactDict:list\",\"type\":1,\"orderNum\":2}', '52', '0:0:0:0:0:0:0:1', '2018-04-26 10:00:33');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('6', 'admin', '修改菜单', 'com.gclfax.modules.sys.controller.SysMenuController.update()', '{\"menuId\":33,\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板字典\",\"url\":\"modules/pactDict/list.html\",\"perms\":\"pactDict:list\",\"type\":1,\"orderNum\":2}', '46', '0:0:0:0:0:0:0:1', '2018-04-26 10:13:56');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('7', 'admin', '修改菜单', 'com.gclfax.modules.sys.controller.SysMenuController.update()', '{\"menuId\":33,\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板字典\",\"url\":\"modules/pact/pactDict/list.html\",\"perms\":\"pactDict:list\",\"type\":1,\"orderNum\":2}', '46', '0:0:0:0:0:0:0:1', '2018-04-26 10:15:58');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('8', 'admin', '修改菜单', 'com.gclfax.modules.sys.controller.SysMenuController.update()', '{\"menuId\":33,\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板字典\",\"url\":\"modules/pact/pactDict.html\",\"perms\":\"pactDict:list\",\"type\":1,\"orderNum\":2}', '47', '0:0:0:0:0:0:0:1', '2018-04-26 10:16:34');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('9', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524710412858\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524710412782\"}', '38', '0:0:0:0:0:0:0:1', '2018-04-26 10:40:13');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('10', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524710460786\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524710460736\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-26 10:41:01');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('11', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524710472730\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524710472676\"}', '12064', '0:0:0:0:0:0:0:1', '2018-04-26 10:41:25');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('12', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524710540875\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524710540824\"}', '35692', '0:0:0:0:0:0:0:1', '2018-04-26 10:42:57');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('13', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524711261726\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524711261678\"}', '11024', '0:0:0:0:0:0:0:1', '2018-04-26 10:54:33');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('14', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524711277845\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524711277788\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-26 10:54:38');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('15', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524711356382\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524711356322\"}', '39838', '0:0:0:0:0:0:0:1', '2018-04-26 10:56:36');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('16', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524711446266\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524711446221\"}', '28', '0:0:0:0:0:0:0:1', '2018-04-26 10:57:26');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('17', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524711448530\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524711448483\"}', '29', '0:0:0:0:0:0:0:1', '2018-04-26 10:57:29');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('18', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524711592546\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524711592458\"}', '38', '0:0:0:0:0:0:0:1', '2018-04-26 10:59:53');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('19', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524713313373\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524713313303\"}', '44', '0:0:0:0:0:0:0:1', '2018-04-26 11:28:34');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('20', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524713323467\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524713323431\"}', '25', '0:0:0:0:0:0:0:1', '2018-04-26 11:28:44');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('21', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524713366890\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524713366857\"}', '25', '0:0:0:0:0:0:0:1', '2018-04-26 11:29:27');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('22', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524713382134\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524713382053\"}', '23', '0:0:0:0:0:0:0:1', '2018-04-26 11:29:42');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('23', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524713409096\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524713409024\"}', '24', '0:0:0:0:0:0:0:1', '2018-04-26 11:30:09');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('24', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524713435432\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524713435349\"}', '24', '0:0:0:0:0:0:0:1', '2018-04-26 11:30:36');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('25', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524713522431\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524713522346\"}', '38', '0:0:0:0:0:0:0:1', '2018-04-26 11:32:03');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('26', 'admin', '修改菜单', 'com.gclfax.modules.sys.controller.SysMenuController.update()', '{\"menuId\":33,\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板字典\",\"url\":\"modules/pact/pactDict.html\",\"perms\":\"pactDict:list,pactDict:save,pactDict:update,pactDict:delete\",\"type\":1,\"orderNum\":2}', '50', '0:0:0:0:0:0:0:1', '2018-04-26 11:33:54');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('27', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524713652873\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524713652816\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-26 11:34:13');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('28', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524721507384\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524721507322\"}', '30', '0:0:0:0:0:0:0:1', '2018-04-26 13:45:07');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('29', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524721767524\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524721767458\"}', '197', '0:0:0:0:0:0:0:1', '2018-04-26 13:49:28');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('30', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524721774128\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524721774062\"}', '242', '0:0:0:0:0:0:0:1', '2018-04-26 13:49:34');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('31', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524721786243\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524721774063\"}', '24', '0:0:0:0:0:0:0:1', '2018-04-26 13:49:46');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('32', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524722077851\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524722077795\"}', '23', '0:0:0:0:0:0:0:1', '2018-04-26 13:54:38');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('33', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524722111428\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524722111322\"}', '40', '0:0:0:0:0:0:0:1', '2018-04-26 13:55:12');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('34', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524722150314\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524722150243\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-26 13:55:50');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('35', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524722494180\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524722494084\"}', '288', '0:0:0:0:0:0:0:1', '2018-04-26 14:01:35');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('36', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524722652480\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524722652408\"}', '41', '0:0:0:0:0:0:0:1', '2018-04-26 14:04:13');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('37', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524722812830\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524722812744\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-26 14:06:53');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('38', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524723064269\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524723064161\"}', '39', '0:0:0:0:0:0:0:1', '2018-04-26 14:11:04');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('39', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524723069040\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524723064162\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-26 14:11:09');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('40', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524723073953\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524723064163\"}', '25', '0:0:0:0:0:0:0:1', '2018-04-26 14:11:14');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('41', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524723590070\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524723590022\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-26 14:19:50');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('42', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524723638529\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524723638470\"}', '25', '0:0:0:0:0:0:0:1', '2018-04-26 14:20:39');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('43', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524723723932\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524723723880\"}', '39', '0:0:0:0:0:0:0:1', '2018-04-26 14:22:04');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('44', 'admin', '修改模板字典', 'com.gclfax.modules.pact.controller.PactDictController.update()', '{\"id\":1,\"dictKey\":\"title\",\"dictValue\":\"select title from t_bids where id \\u003d ?;\"}', '19024', '0:0:0:0:0:0:0:1', '2018-04-26 14:22:27');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('45', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524723822179\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524723822120\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-26 14:23:42');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('46', 'admin', '保存模板', 'com.gclfax.modules.pact.controller.PactTemplateController.save()', '{\"id\":2,\"name\":\"测试模板名称\",\"platform\":\"gxs_cg\"}', '10370', '0:0:0:0:0:0:0:1', '2018-04-26 14:27:42');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('47', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524724069682\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524724069629\"}', '41', '0:0:0:0:0:0:0:1', '2018-04-26 14:27:50');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('48', 'admin', '保存模板字典', 'com.gclfax.modules.pact.controller.PactDictController.save()', '{\"id\":2,\"dictKey\":\"name\",\"dictValue\":\"select name from t_bids where id \\u003d ?;\"}', '53', '0:0:0:0:0:0:0:1', '2018-04-26 14:28:14');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('49', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524724095196\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524724069630\"}', '29', '0:0:0:0:0:0:0:1', '2018-04-26 14:28:15');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('50', 'admin', '保存模板', 'com.gclfax.modules.pact.controller.PactTemplateController.save()', '{\"id\":3,\"name\":\"222222\",\"createTime\":\"Apr 26, 2018 2:31:09 PM\",\"platform\":\"gxs_cg\"}', '36', '0:0:0:0:0:0:0:1', '2018-04-26 14:31:09');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('51', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524724318846\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524724318798\"}', '28', '0:0:0:0:0:0:0:1', '2018-04-26 14:31:59');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('52', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524724322018\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524724318799\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-26 14:32:02');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('53', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524724325921\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524724318800\"}', '29', '0:0:0:0:0:0:0:1', '2018-04-26 14:32:06');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('54', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524724328129\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524724318801\"}', '31', '0:0:0:0:0:0:0:1', '2018-04-26 14:32:08');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('55', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524724338897\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524724318802\"}', '14583', '0:0:0:0:0:0:0:1', '2018-04-26 14:32:34');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('56', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524724458018\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524724457955\"}', '5181', '0:0:0:0:0:0:0:1', '2018-04-26 14:34:23');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('57', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524724470154\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524724457956\"}', '34332', '0:0:0:0:0:0:0:1', '2018-04-26 14:35:05');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('58', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524724817012\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524724816975\"}', '25', '0:0:0:0:0:0:0:1', '2018-04-26 14:40:17');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('59', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524724821954\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524724816976\"}', '24', '0:0:0:0:0:0:0:1', '2018-04-26 14:40:22');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('60', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524724823506\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524724816977\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-26 14:40:24');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('61', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524724851413\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524724851349\"}', '39', '0:0:0:0:0:0:0:1', '2018-04-26 14:40:52');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('62', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524724941892\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524724941804\"}', '39', '0:0:0:0:0:0:0:1', '2018-04-26 14:42:22');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('63', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524724949475\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"dictKey\":\"name\",\"_\":\"1524724941805\"}', '28', '0:0:0:0:0:0:0:1', '2018-04-26 14:42:30');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('64', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524724964113\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"dictKey\":\"\",\"_\":\"1524724941806\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-26 14:42:44');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('65', 'admin', '保存模板字典', 'com.gclfax.modules.pact.controller.PactDictController.save()', '{\"id\":3,\"dictKey\":\"adfhdzfgz\",\"dictValue\":\"fgzgfzdgzd\"}', '30', '0:0:0:0:0:0:0:1', '2018-04-26 14:42:52');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('66', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524724972665\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"dictKey\":\"\",\"_\":\"1524724941807\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-26 14:42:53');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('67', 'admin', '保存模板字典', 'com.gclfax.modules.pact.controller.PactDictController.save()', '{\"id\":4,\"dictKey\":\"sgzfgzdgzg\",\"dictValue\":\"zdfgzdfbzfS\"}', '29', '0:0:0:0:0:0:0:1', '2018-04-26 14:43:03');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('68', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524724984105\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"dictKey\":\"\",\"_\":\"1524724941808\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-26 14:43:04');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('69', 'admin', '修改模板字典', 'com.gclfax.modules.pact.controller.PactDictController.update()', '{\"id\":3,\"dictKey\":\"adfhdzfgz\",\"dictValue\":\"ghkjdhadfhfhssfgsrtsd\"}', '31', '0:0:0:0:0:0:0:1', '2018-04-26 14:43:13');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('70', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524724993595\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"dictKey\":\"\",\"_\":\"1524724941809\"}', '24', '0:0:0:0:0:0:0:1', '2018-04-26 14:43:14');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('71', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524725349256\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524725349178\"}', '36', '0:0:0:0:0:0:0:1', '2018-04-26 14:49:09');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('72', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524725658299\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524725658182\"}', '34', '0:0:0:0:0:0:0:1', '2018-04-26 14:54:18');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('73', 'admin', '删除模板字典', 'com.gclfax.modules.pact.controller.PactDictController.delete()', '[3,4]', '191', '0:0:0:0:0:0:0:1', '2018-04-26 14:56:54');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('74', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524725815242\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"dictKey\":\"\",\"_\":\"1524725658183\"}', '34', '0:0:0:0:0:0:0:1', '2018-04-26 14:56:55');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('75', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524725818479\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524725818367\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-26 14:56:59');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('76', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524726133811\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"dictKey\":\"name\",\"_\":\"1524725818368\"}', '38', '0:0:0:0:0:0:0:1', '2018-04-26 15:02:14');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('77', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524726136842\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"dictKey\":\"\",\"_\":\"1524725818369\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-26 15:02:17');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('78', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524726141256\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524726141180\"}', '49', '0:0:0:0:0:0:0:1', '2018-04-26 15:02:21');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('79', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524726166075\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524726165979\"}', '58', '0:0:0:0:0:0:0:1', '2018-04-26 15:02:46');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('80', 'admin', '保存模板字典', 'com.gclfax.modules.pact.controller.PactDictController.save()', '{\"id\":5,\"dictKey\":\"awretehsdfg\",\"dictValue\":\"ahetfsgadfga\"}', '49', '0:0:0:0:0:0:0:1', '2018-04-26 15:02:57');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('81', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524726177764\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"dictKey\":\"\",\"_\":\"1524726165980\"}', '45', '0:0:0:0:0:0:0:1', '2018-04-26 15:02:58');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('82', 'admin', '修改模板字典', 'com.gclfax.modules.pact.controller.PactDictController.update()', '{\"id\":5,\"dictKey\":\"awretehsdfg\",\"dictValue\":\"ahyqetrtrytuyhsadfhdgjfh\"}', '54', '0:0:0:0:0:0:0:1', '2018-04-26 15:03:13');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('83', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524726193690\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"dictKey\":\"\",\"_\":\"1524726165981\"}', '44', '0:0:0:0:0:0:0:1', '2018-04-26 15:03:14');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('84', 'admin', '保存模板字典', 'com.gclfax.modules.pact.controller.PactDictController.save()', '{\"id\":6,\"dictKey\":\"waettjuasd\",\"dictValue\":\"awrshdfhs123346\"}', '37', '0:0:0:0:0:0:0:1', '2018-04-26 15:03:28');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('85', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524726209473\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"dictKey\":\"\",\"_\":\"1524726165982\"}', '42', '0:0:0:0:0:0:0:1', '2018-04-26 15:03:30');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('86', 'admin', '删除模板字典', 'com.gclfax.modules.pact.controller.PactDictController.delete()', '[6,5]', '52', '0:0:0:0:0:0:0:1', '2018-04-26 15:03:35');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('87', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524726215993\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"dictKey\":\"\",\"_\":\"1524726165983\"}', '43', '0:0:0:0:0:0:0:1', '2018-04-26 15:03:36');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('88', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524726219089\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524726218997\"}', '47', '0:0:0:0:0:0:0:1', '2018-04-26 15:03:39');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('89', 'admin', '保存模板', 'com.gclfax.modules.pact.controller.PactTemplateController.save()', '{\"id\":4,\"name\":\"测试模板名称2\",\"createTime\":\"Apr 26, 2018 3:08:23 PM\",\"platform\":\"gxs_cg\"}', '37', '0:0:0:0:0:0:0:1', '2018-04-26 15:08:24');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('90', 'admin', '保存用户', 'com.gclfax.modules.sys.controller.SysUserController.save()', '{\"userId\":2,\"username\":\"chenmy\",\"password\":\"36a8fbca221d3954d50b03ddfa656532a54f1f2afd48798f8896675f8c2fbd36\",\"salt\":\"Zv5gv0ivuHls0Sw8MKCt\",\"email\":\"chenmy@qq.com\",\"mobile\":\"123456789000\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Apr 26, 2018 3:20:13 PM\"}', '149', '0:0:0:0:0:0:0:1', '2018-04-26 15:20:14');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('91', 'admin', '保存角色', 'com.gclfax.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1,\"roleName\":\"协议管理\",\"remark\":\"协议管理\",\"createUserId\":1,\"menuIdList\":[31,32,33],\"createTime\":\"Apr 26, 2018 3:21:12 PM\"}', '137', '0:0:0:0:0:0:0:1', '2018-04-26 15:21:13');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('92', 'admin', '修改用户', 'com.gclfax.modules.sys.controller.SysUserController.update()', '{\"userId\":2,\"username\":\"chenmy\",\"salt\":\"Zv5gv0ivuHls0Sw8MKCt\",\"email\":\"chenmy@qq.com\",\"mobile\":\"123456789000\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Apr 26, 2018 3:20:13 PM\"}', '138', '0:0:0:0:0:0:0:1', '2018-04-26 15:21:40');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('93', 'admin', '修改模板', 'com.gclfax.modules.pact.controller.PactTemplateController.update()', '{\"id\":4,\"name\":\"测试模板名称23\",\"createTime\":\"Apr 26, 2018 3:08:24 PM\",\"platform\":\"gxs_cg\"}', '12619', '0:0:0:0:0:0:0:1', '2018-04-26 15:33:38');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('94', 'admin', '保存模板', 'com.gclfax.modules.pact.controller.PactTemplateController.save()', '{\"id\":5,\"name\":\"cccc\",\"createTime\":\"Apr 26, 2018 3:35:10 PM\",\"newVersionId\":22,\"platform\":\"cc\"}', '33', '0:0:0:0:0:0:0:1', '2018-04-26 15:35:11');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('95', 'admin', '修改模板', 'com.gclfax.modules.pact.controller.PactTemplateController.update()', '{\"id\":5,\"name\":\"cccc\",\"createTime\":\"Apr 26, 2018 3:35:11 PM\",\"newVersionId\":223,\"platform\":\"cc\"}', '40', '0:0:0:0:0:0:0:1', '2018-04-26 15:49:17');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('96', 'admin', '修改模板', 'com.gclfax.modules.pact.controller.PactTemplateController.update()', '{\"id\":4,\"name\":\"测试模板名称23\",\"createTime\":\"Apr 26, 2018 3:32:31 PM\",\"newVersionId\":23,\"platform\":\"gxs_cg\"}', '43', '0:0:0:0:0:0:0:1', '2018-04-26 15:49:25');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('97', 'admin', '修改模板', 'com.gclfax.modules.pact.controller.PactTemplateController.update()', '{\"id\":1,\"name\":\"应收账款转让合同（代发标）模板\",\"createTime\":\"Apr 26, 2018 10:04:19 AM\",\"newVersionId\":11,\"platform\":\"gxs_cg\"}', '33', '0:0:0:0:0:0:0:1', '2018-04-26 15:49:32');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('98', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524729062938\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524729062858\"}', '28', '0:0:0:0:0:0:0:1', '2018-04-26 15:51:03');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('99', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524729086809\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"dictKey\":\"name\",\"_\":\"1524729062859\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-26 15:51:27');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('100', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524729243789\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524729243707\"}', '28', '0:0:0:0:0:0:0:1', '2018-04-26 15:54:04');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('101', 'admin', '删除模板', 'com.gclfax.modules.pact.controller.PactTemplateController.delete()', '[5]', '52', '0:0:0:0:0:0:0:1', '2018-04-26 16:00:08');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('102', 'admin', '删除模板', 'com.gclfax.modules.pact.controller.PactTemplateController.delete()', '[4,3]', '33', '0:0:0:0:0:0:0:1', '2018-04-26 16:00:27');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('103', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524729842735\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524729842630\"}', '34', '0:0:0:0:0:0:0:1', '2018-04-26 16:04:03');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('104', 'admin', '保存模板', 'com.gclfax.modules.pact.controller.PactTemplateController.save()', '{\"id\":6,\"name\":\"测试模板222\",\"createTime\":\"Apr 26, 2018 4:07:46 PM\",\"newVersionId\":1,\"platform\":\"gxs_hf\"}', '35', '0:0:0:0:0:0:0:1', '2018-04-26 16:07:46');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('105', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524730394793\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524730394717\"}', '35', '0:0:0:0:0:0:0:1', '2018-04-26 16:13:15');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('106', 'admin', '保存菜单', 'com.gclfax.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"模板协议和字典关系\",\"url\":\"modules/pact/pactDictRelation.html\",\"perms\":\"pactDictRelation:save,pactDictRelation:update,pactDictRelation:delete,pactDictRelation:list\",\"type\":1,\"orderNum\":3}', '30', '0:0:0:0:0:0:0:1', '2018-04-26 16:29:00');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('107', 'admin', '修改菜单', 'com.gclfax.modules.sys.controller.SysMenuController.update()', '{\"menuId\":34,\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板协议和字典关系\",\"url\":\"modules/pact/pactDictRelation.html\",\"perms\":\"pactDictRelation:save,pactDictRelation:update,pactDictRelation:delete,pactDictRelation:list\",\"type\":1,\"orderNum\":3}', '50', '0:0:0:0:0:0:0:1', '2018-04-26 16:29:19');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('108', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524731498158\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524731498043\"}', '39', '0:0:0:0:0:0:0:1', '2018-04-26 16:31:38');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('109', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524732523997\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524732523917\"}', '40', '0:0:0:0:0:0:0:1', '2018-04-26 16:48:44');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('110', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524732585195\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524732523919\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-26 16:49:45');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('111', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524732602624\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524732523921\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-26 16:50:03');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('112', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524732610983\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524732523922\"}', '25', '0:0:0:0:0:0:0:1', '2018-04-26 16:50:11');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('113', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524732640939\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524732640847\"}', '25', '0:0:0:0:0:0:0:1', '2018-04-26 16:50:41');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('114', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524732822332\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524732640849\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-26 16:53:42');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('115', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524732989580\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524732989488\"}', '24', '0:0:0:0:0:0:0:1', '2018-04-26 16:56:30');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('116', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524733051449\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524733051344\"}', '39', '0:0:0:0:0:0:0:1', '2018-04-26 16:57:32');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('117', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524733690383\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524733690278\"}', '39', '0:0:0:0:0:0:0:1', '2018-04-26 17:08:11');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('118', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524733972829\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524733972728\"}', '41', '0:0:0:0:0:0:0:1', '2018-04-26 17:12:53');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('119', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524734028252\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524734028157\"}', '38', '0:0:0:0:0:0:0:1', '2018-04-26 17:13:48');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('120', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524734102425\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524734102325\"}', '38', '0:0:0:0:0:0:0:1', '2018-04-26 17:15:03');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('121', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524734135278\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524734135142\"}', '39', '0:0:0:0:0:0:0:1', '2018-04-26 17:15:35');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('122', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524734281944\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524734281852\"}', '43', '127.0.0.1', '2018-04-26 17:18:02');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('123', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524734342745\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524734342622\"}', '39', '127.0.0.1', '2018-04-26 17:19:03');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('124', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524734348595\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524734348496\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-26 17:19:09');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('125', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524734356589\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524734356499\"}', '917', '0:0:0:0:0:0:0:1', '2018-04-26 17:19:18');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('126', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524734358350\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524734358260\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-26 17:19:18');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('127', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524734364132\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524734364033\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-26 17:19:24');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('128', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524734500180\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524734500052\"}', '40', '127.0.0.1', '2018-04-26 17:21:40');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('129', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524734592684\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524734592598\"}', '39', '0:0:0:0:0:0:0:1', '2018-04-26 17:23:13');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('130', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524734705191\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524734705071\"}', '40', '0:0:0:0:0:0:0:1', '2018-04-26 17:25:05');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('131', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524734772495\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524734772377\"}', '39', '127.0.0.1', '2018-04-26 17:26:13');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('132', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524734821284\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524734821183\"}', '41', '127.0.0.1', '2018-04-26 17:27:01');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('133', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524734853374\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524734853252\"}', '42', '0:0:0:0:0:0:0:1', '2018-04-26 17:27:34');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('134', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524735407172\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524735407080\"}', '38', '0:0:0:0:0:0:0:1', '2018-04-26 17:36:47');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('135', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524735991972\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524735991868\"}', '38', '0:0:0:0:0:0:0:1', '2018-04-26 17:46:32');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('136', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524736310877\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524736310773\"}', '40', '0:0:0:0:0:0:0:1', '2018-04-26 17:51:51');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('137', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524736398812\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524736398716\"}', '50', '0:0:0:0:0:0:0:1', '2018-04-26 17:53:19');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('138', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524736521934\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524736521838\"}', '42', '0:0:0:0:0:0:0:1', '2018-04-26 17:55:22');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('139', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524736632037\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524736631933\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-26 17:57:12');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('140', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524736662408\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524736662328\"}', '42', '0:0:0:0:0:0:0:1', '2018-04-26 17:57:43');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('141', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524736680758\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524736680641\"}', '7010', '0:0:0:0:0:0:0:1', '2018-04-26 17:58:08');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('142', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524736688001\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524736687905\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-26 17:58:08');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('143', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524736849468\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524736849368\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-26 18:00:50');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('144', 'admin', '保存模板', 'com.gclfax.modules.pact.controller.PactTemplateController.save()', '{\"id\":7,\"name\":\"rrr\",\"createTime\":\"Apr 26, 2018 6:33:36 PM\",\"newVersionId\":22,\"platform\":\"rrr\"}', '36', '0:0:0:0:0:0:0:1', '2018-04-26 18:33:37');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('145', 'admin', '删除模板', 'com.gclfax.modules.pact.controller.PactTemplateController.delete()', '[7]', '39', '0:0:0:0:0:0:0:1', '2018-04-26 18:33:51');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('146', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524791303510\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524791303430\"}', '38', '0:0:0:0:0:0:0:1', '2018-04-27 09:08:24');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('147', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524791309422\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524791303432\"}', '5890', '0:0:0:0:0:0:0:1', '2018-04-27 09:08:35');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('148', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524791670182\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524791670086\"}', '37', '0:0:0:0:0:0:0:1', '2018-04-27 09:14:30');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('149', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524791678164\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524791670088\"}', '28', '0:0:0:0:0:0:0:1', '2018-04-27 09:14:38');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('150', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524792080056\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524791670089\"}', '25', '0:0:0:0:0:0:0:1', '2018-04-27 09:21:20');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('151', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524792322362\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524792322254\"}', '40', '0:0:0:0:0:0:0:1', '2018-04-27 09:25:22');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('152', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524792325146\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524792322256\"}', '33', '0:0:0:0:0:0:0:1', '2018-04-27 09:25:25');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('153', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524792394338\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524792394246\"}', '36', '0:0:0:0:0:0:0:1', '2018-04-27 09:26:34');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('154', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524792396508\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524792394248\"}', '28', '0:0:0:0:0:0:0:1', '2018-04-27 09:26:37');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('155', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524792449162\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524792449068\"}', '48', '0:0:0:0:0:0:0:1', '2018-04-27 09:27:29');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('156', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524792451392\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524792449070\"}', '30', '0:0:0:0:0:0:0:1', '2018-04-27 09:27:32');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('157', 'admin', '保存菜单', 'com.gclfax.modules.sys.controller.SysMenuController.save()', '{\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板版本管理\",\"url\":\"modules/pact/pactManageVersion.html\",\"type\":1,\"orderNum\":4}', '53', '0:0:0:0:0:0:0:1', '2018-04-27 09:32:39');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('158', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524792776659\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524792776564\"}', '50', '0:0:0:0:0:0:0:1', '2018-04-27 09:32:57');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('159', 'admin', '修改菜单', 'com.gclfax.modules.sys.controller.SysMenuController.update()', '{\"menuId\":32,\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板管理\",\"url\":\"modules/pact/pactManage.html\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":1}', '55', '0:0:0:0:0:0:0:1', '2018-04-27 09:33:30');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('160', 'admin', '修改菜单', 'com.gclfax.modules.sys.controller.SysMenuController.update()', '{\"menuId\":32,\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板管理\",\"url\":\"modules/pact/pactManage.html\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":1}', '51', '0:0:0:0:0:0:0:1', '2018-04-27 09:34:04');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('161', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524792855429\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524792855389\"}', '30', '0:0:0:0:0:0:0:1', '2018-04-27 09:34:16');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('162', 'admin', '修改菜单', 'com.gclfax.modules.sys.controller.SysMenuController.update()', '{\"menuId\":32,\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板管理\",\"url\":\"modules/pact/pactManage.html\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":5}', '50', '0:0:0:0:0:0:0:1', '2018-04-27 09:38:09');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('163', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524793094084\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524793093969\"}', '34', '0:0:0:0:0:0:0:1', '2018-04-27 09:38:14');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('164', 'admin', '修改菜单', 'com.gclfax.modules.sys.controller.SysMenuController.update()', '{\"menuId\":33,\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板字典\",\"url\":\"modules/pact/pactDict.html\",\"perms\":\"pactDict:list,pactDict:save,pactDict:update,pactDict:delete\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":1}', '50', '0:0:0:0:0:0:0:1', '2018-04-27 09:38:37');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('165', 'admin', '修改菜单', 'com.gclfax.modules.sys.controller.SysMenuController.update()', '{\"menuId\":32,\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板管理\",\"url\":\"modules/pact/pactManage.html\",\"perms\":\"\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":5}', '54', '0:0:0:0:0:0:0:1', '2018-04-27 09:39:10');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('166', 'admin', '修改菜单', 'com.gclfax.modules.sys.controller.SysMenuController.update()', '{\"menuId\":35,\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板版本管理\",\"url\":\"modules/pact/pactManageVersion.html\",\"type\":1,\"orderNum\":3}', '47', '0:0:0:0:0:0:0:1', '2018-04-27 09:39:30');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('167', 'admin', '修改菜单', 'com.gclfax.modules.sys.controller.SysMenuController.update()', '{\"menuId\":32,\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板管理\",\"url\":\"modules/pact/pactManage.html\",\"perms\":\"\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":4}', '48', '0:0:0:0:0:0:0:1', '2018-04-27 09:39:37');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('168', 'admin', '修改菜单', 'com.gclfax.modules.sys.controller.SysMenuController.update()', '{\"menuId\":35,\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板版本管理\",\"url\":\"modules/pact/pactManageVersion.html\",\"type\":1,\"orderNum\":5}', '49', '0:0:0:0:0:0:0:1', '2018-04-27 09:39:58');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('169', 'admin', '修改菜单', 'com.gclfax.modules.sys.controller.SysMenuController.update()', '{\"menuId\":32,\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板管理\",\"url\":\"modules/pact/pactManage.html\",\"perms\":\"\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":3}', '54', '0:0:0:0:0:0:0:1', '2018-04-27 09:40:06');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('170', 'admin', '修改菜单', 'com.gclfax.modules.sys.controller.SysMenuController.update()', '{\"menuId\":35,\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板版本管理\",\"url\":\"modules/pact/pactManageVersion.html\",\"type\":1,\"orderNum\":4}', '51', '0:0:0:0:0:0:0:1', '2018-04-27 09:40:13');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('171', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524793343656\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524793343572\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-27 09:42:24');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('172', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524793461808\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524793343574\"}', '28', '0:0:0:0:0:0:0:1', '2018-04-27 09:44:22');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('173', 'admin', '修改模板', 'com.gclfax.modules.pact.controller.PactTemplateController.update()', '{\"id\":6,\"name\":\"测试模板222\",\"createTime\":\"Apr 26, 2018 4:07:46 PM\",\"newVersionId\":2,\"platform\":\"gxs_hf\"}', '33', '0:0:0:0:0:0:0:1', '2018-04-27 09:49:02');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('174', 'admin', '修改模板', 'com.gclfax.modules.pact.controller.PactTemplateController.update()', '{\"id\":6,\"name\":\"测试模板\",\"createTime\":\"Apr 27, 2018 9:47:53 AM\",\"newVersionId\":2,\"platform\":\"gxs_hf\"}', '36', '0:0:0:0:0:0:0:1', '2018-04-27 09:50:19');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('175', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524793906956\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524793906874\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-27 09:51:47');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('176', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524793908952\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524793906876\"}', '28', '0:0:0:0:0:0:0:1', '2018-04-27 09:51:49');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('177', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524794410378\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524794410294\"}', '38', '0:0:0:0:0:0:0:1', '2018-04-27 10:00:11');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('178', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524794421012\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524794410296\"}', '31', '0:0:0:0:0:0:0:1', '2018-04-27 10:00:21');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('179', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524794539674\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"dictKey\":\"name\",\"_\":\"1524794410297\"}', '28', '0:0:0:0:0:0:0:1', '2018-04-27 10:02:20');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('180', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524794546508\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"dictKey\":\"\",\"_\":\"1524794410298\"}', '28', '0:0:0:0:0:0:0:1', '2018-04-27 10:02:27');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('181', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524794613506\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524794613428\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-27 10:03:34');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('182', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524794651902\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524794651818\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-27 10:04:12');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('183', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524794666682\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524794651820\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-27 10:04:27');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('184', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524794695494\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524794695400\"}', '39', '0:0:0:0:0:0:0:1', '2018-04-27 10:04:56');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('185', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524794699446\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524794695402\"}', '31', '0:0:0:0:0:0:0:1', '2018-04-27 10:05:00');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('186', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524794819936\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524794819832\"}', '35', '0:0:0:0:0:0:0:1', '2018-04-27 10:07:00');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('187', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524794824558\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524794819834\"}', '323', '0:0:0:0:0:0:0:1', '2018-04-27 10:07:05');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('188', 'admin', '保存模板协议和字典关系', 'com.gclfax.modules.pact.controller.PactDictRelationController.save()', '{\"id\":2,\"pactVersionId\":1,\"pactDictId\":2,\"resultType\":\"S\",\"isMust\":true}', '11613', '0:0:0:0:0:0:0:1', '2018-04-27 10:07:23');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('189', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524794844840\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524794819835\"}', '29', '0:0:0:0:0:0:0:1', '2018-04-27 10:07:25');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('190', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524794859416\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524794819836\"}', '24', '0:0:0:0:0:0:0:1', '2018-04-27 10:07:40');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('191', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524796934616\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524796934536\"}', '38', '0:0:0:0:0:0:0:1', '2018-04-27 10:42:15');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('192', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524796956490\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524796956414\"}', '15976', '0:0:0:0:0:0:0:1', '2018-04-27 10:42:53');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('193', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524797222948\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524797222858\"}', '9108', '0:0:0:0:0:0:0:1', '2018-04-27 10:47:12');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('194', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524797259434\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524797222859\"}', '28', '0:0:0:0:0:0:0:1', '2018-04-27 10:47:40');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('195', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524797262486\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524797222860\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-27 10:47:43');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('196', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524797268058\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524797222861\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-27 10:47:48');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('197', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524797473410\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524797473314\"}', '42', '0:0:0:0:0:0:0:1', '2018-04-27 10:51:14');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('198', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524797493300\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524797473315\"}', '31', '0:0:0:0:0:0:0:1', '2018-04-27 10:51:33');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('199', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524797537676\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524797537584\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-27 10:52:18');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('200', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524797546664\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524797537585\"}', '25', '0:0:0:0:0:0:0:1', '2018-04-27 10:52:27');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('201', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524797551266\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524797537586\"}', '28', '0:0:0:0:0:0:0:1', '2018-04-27 10:52:31');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('202', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524798557148\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524797537588\"}', '32', '0:0:0:0:0:0:0:1', '2018-04-27 11:09:17');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('203', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524798574316\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524797537589\"}', '31', '0:0:0:0:0:0:0:1', '2018-04-27 11:09:34');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('204', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524798628882\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524797537591\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-27 11:10:29');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('205', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524798666086\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524798665998\"}', '25', '0:0:0:0:0:0:0:1', '2018-04-27 11:11:06');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('206', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524798673382\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524798673278\"}', '25', '0:0:0:0:0:0:0:1', '2018-04-27 11:11:13');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('207', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524798682012\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524798673280\"}', '24', '0:0:0:0:0:0:0:1', '2018-04-27 11:11:22');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('208', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524798754914\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524798754824\"}', '25', '0:0:0:0:0:0:0:1', '2018-04-27 11:12:35');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('209', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524798757288\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524798757208\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-27 11:12:37');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('210', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524798775724\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524798775644\"}', '23', '0:0:0:0:0:0:0:1', '2018-04-27 11:12:56');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('211', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524798780720\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524798780634\"}', '28', '0:0:0:0:0:0:0:1', '2018-04-27 11:13:01');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('212', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524798811136\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524798780636\"}', '25', '0:0:0:0:0:0:0:1', '2018-04-27 11:13:31');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('213', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524798843494\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524798843418\"}', '24', '0:0:0:0:0:0:0:1', '2018-04-27 11:14:04');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('214', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524799266620\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524799266530\"}', '43', '0:0:0:0:0:0:0:1', '2018-04-27 11:21:07');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('215', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524799270178\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524799266532\"}', '25', '0:0:0:0:0:0:0:1', '2018-04-27 11:21:10');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('216', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524799273432\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524799266533\"}', '25', '0:0:0:0:0:0:0:1', '2018-04-27 11:21:14');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('217', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524799365994\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524799365904\"}', '49', '0:0:0:0:0:0:0:1', '2018-04-27 11:22:46');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('218', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524799417808\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524799417704\"}', '46', '0:0:0:0:0:0:0:1', '2018-04-27 11:23:38');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('219', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524799430452\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524799417705\"}', '29', '0:0:0:0:0:0:0:1', '2018-04-27 11:23:51');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('220', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524799618976\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524799618892\"}', '41', '0:0:0:0:0:0:0:1', '2018-04-27 11:26:59');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('221', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524799623544\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524799618893\"}', '28', '0:0:0:0:0:0:0:1', '2018-04-27 11:27:04');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('222', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524799628818\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"username\":\"\",\"_\":\"1524799618894\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-27 11:27:09');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('223', 'admin', '保存模板', 'com.gclfax.modules.pact.controller.PactTemplateController.save()', '{\"id\":8,\"name\":\"护肤测试\",\"createTime\":\"Apr 27, 2018 2:11:53 PM\",\"version\":0,\"platform\":\"gxs_hf\"}', '35233', '0:0:0:0:0:0:0:1', '2018-04-27 14:12:29');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('224', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524809603650\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524809603564\"}', '32', '0:0:0:0:0:0:0:1', '2018-04-27 14:13:24');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('225', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524809617196\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524809603565\"}', '31', '0:0:0:0:0:0:0:1', '2018-04-27 14:13:37');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('226', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524809625764\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524809603566\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-27 14:13:46');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('227', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524809631356\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524809603567\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-27 14:13:51');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('228', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524809831924\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524809831840\"}', '29', '0:0:0:0:0:0:0:1', '2018-04-27 14:17:12');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('229', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524809925923\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524809925829\"}', '55', '0:0:0:0:0:0:0:1', '2018-04-27 14:18:46');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('230', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524809931862\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524809925830\"}', '40', '0:0:0:0:0:0:0:1', '2018-04-27 14:18:52');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('231', 'admin', '修改菜单', 'com.gclfax.modules.sys.controller.SysMenuController.update()', '{\"menuId\":34,\"parentId\":31,\"parentName\":\"协议管理\",\"name\":\"模板字典关系\",\"url\":\"modules/pact/pactDictRelation.html\",\"perms\":\"pactDictRelation:save,pactDictRelation:update,pactDictRelation:delete,pactDictRelation:list\",\"type\":1,\"orderNum\":2}', '47', '0:0:0:0:0:0:0:1', '2018-04-27 14:24:13');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('232', 'admin', '保存菜单', 'com.gclfax.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"sss\",\"url\":\"aaaa\",\"type\":1,\"orderNum\":0}', '32', '0:0:0:0:0:0:0:1', '2018-04-27 15:11:08');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('233', 'admin', '删除菜单', 'com.gclfax.modules.sys.controller.SysMenuController.delete()', '36', '119', '0:0:0:0:0:0:0:1', '2018-04-27 15:11:34');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('234', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524821794331\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524821794221\"}', '71', '0:0:0:0:0:0:0:1', '2018-04-27 17:36:35');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('235', 'admin', '保存模板', 'com.gclfax.modules.pact.controller.PactTemplateController.save()', '{\"id\":9,\"name\":\"gg\",\"createTime\":\"Apr 27, 2018 5:55:16 PM\",\"version\":0,\"filePath\":\"D:/data/gg/baseTempd777cc24-8d5b-4057-b06f-840b47739531.docx\",\"platform\":\"gg\"}', '16715', '0:0:0:0:0:0:0:1', '2018-04-27 17:55:17');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('236', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524823367103\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524823367000\"}', '41', '0:0:0:0:0:0:0:1', '2018-04-27 18:02:47');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('237', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524823369949\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524823367001\"}', '31', '0:0:0:0:0:0:0:1', '2018-04-27 18:02:50');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('238', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524823421423\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524823421366\"}', '37', '0:0:0:0:0:0:0:1', '2018-04-27 18:03:42');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('239', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524823437228\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524823421367\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-27 18:03:57');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('240', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524823439883\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524823421368\"}', '28', '0:0:0:0:0:0:0:1', '2018-04-27 18:04:00');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('241', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524828712770\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524828712684\"}', '36', '0:0:0:0:0:0:0:1', '2018-04-27 19:31:53');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('242', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524828717984\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524828717892\"}', '29', '0:0:0:0:0:0:0:1', '2018-04-27 19:31:58');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('243', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524828725716\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524828717893\"}', '27', '0:0:0:0:0:0:0:1', '2018-04-27 19:32:06');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('244', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524828733466\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524828733376\"}', '25', '0:0:0:0:0:0:0:1', '2018-04-27 19:32:14');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('245', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524828737962\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524828737860\"}', '29', '0:0:0:0:0:0:0:1', '2018-04-27 19:32:18');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('246', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524828740346\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524828737861\"}', '24', '0:0:0:0:0:0:0:1', '2018-04-27 19:32:20');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('247', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524829378436\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524829378348\"}', '24', '0:0:0:0:0:0:0:1', '2018-04-27 19:42:59');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('248', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524829389388\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524829389310\"}', '24', '0:0:0:0:0:0:0:1', '2018-04-27 19:43:10');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('249', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524829391890\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524829391806\"}', '26', '0:0:0:0:0:0:0:1', '2018-04-27 19:43:12');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('250', 'admin', '修改模板', 'com.gclfax.modules.pact.controller.PactTemplateController.update()', '{\"id\":10,\"name\":\"存管业务系统2.0接口规范1\",\"createTime\":\"Apr 27, 2018 8:09:50 PM\",\"platform\":\"gxs_cg\"}', '39', '0:0:0:0:0:0:0:1', '2018-04-27 20:11:20');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('251', 'admin', '保存模板', 'com.gclfax.modules.pact.controller.PactVersionController.save()', '{\"id\":7,\"createTime\":\"Apr 27, 2018 8:47:48 PM\",\"version\":0,\"name\":\"gg\",\"platform\":\"gg\"}', '292956', '0:0:0:0:0:0:0:1', '2018-04-27 20:47:49');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('252', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524833268619\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524833268507\"}', '37', '0:0:0:0:0:0:0:1', '2018-04-27 20:47:50');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('253', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524833274488\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524833274434\"}', '45', '0:0:0:0:0:0:0:1', '2018-04-27 20:47:55');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('254', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524833278197\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524833278158\"}', '64', '0:0:0:0:0:0:0:1', '2018-04-27 20:47:58');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('255', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524833278917\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524833278850\"}', '35', '0:0:0:0:0:0:0:1', '2018-04-27 20:47:59');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('256', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524834142745\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524834142647\"}', '61', '0:0:0:0:0:0:0:1', '2018-04-27 21:02:23');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('257', 'admin', '保存模板', 'com.gclfax.modules.pact.controller.PactVersionController.save()', '{\"id\":8,\"pactPath\":\"D:/data/gxs_cg/baseTemp/ca1e85a5-01ce-4bc4-93ff-254c2d718bbf.docx\",\"createTime\":\"Apr 28, 2018 9:18:39 AM\",\"pactTemplateId\":10,\"pactName\":\"存管业务系统2.0接口规范1\",\"version\":3,\"platform\":\"gxs_cg\"}', '30583', '0:0:0:0:0:0:0:1', '2018-04-28 09:18:42');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('258', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524894852003\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524894851883\"}', '90', '0:0:0:0:0:0:0:1', '2018-04-28 13:54:12');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('259', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524894854984\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524894854851\"}', '44', '0:0:0:0:0:0:0:1', '2018-04-28 13:54:15');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('260', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524894861629\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524894861528\"}', '36', '0:0:0:0:0:0:0:1', '2018-04-28 13:54:22');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('261', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1524894865766\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524894865682\"}', '39', '0:0:0:0:0:0:0:1', '2018-04-28 13:54:26');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('262', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1524894868576\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1524894865683\"}', '34', '0:0:0:0:0:0:0:1', '2018-04-28 13:54:29');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('263', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1525672090724\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1525672090645\"}', '45', '0:0:0:0:0:0:0:1', '2018-05-07 13:48:11');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('264', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1525672092341\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1525672092262\"}', '42', '0:0:0:0:0:0:0:1', '2018-05-07 13:48:12');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('265', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1525672098372\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1525672098308\"}', '31', '0:0:0:0:0:0:0:1', '2018-05-07 13:48:19');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('266', 'admin', '模板字典列表', 'com.gclfax.modules.pact.controller.PactDictController.list()', '{\"_search\":\"false\",\"nd\":\"1525672099184\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1525672099127\"}', '83', '0:0:0:0:0:0:0:1', '2018-05-07 13:48:20');
INSERT INTO `gxs_pact`.`sys_log` VALUES ('267', 'admin', '模板协议和字典关系列表', 'com.gclfax.modules.pact.controller.PactDictRelationController.list()', '{\"_search\":\"false\",\"nd\":\"1525672104729\",\"limit\":\"10\",\"page\":\"1\",\"sidx\":\"\",\"order\":\"asc\",\"_\":\"1525672104689\"}', '58', '0:0:0:0:0:0:0:1', '2018-05-07 13:48:25');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`sys_menu`;
CREATE TABLE `gxs_pact`.`sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('2', '1', '管理员列表', 'modules/sys/user.html', null, '1', 'fa fa-user', '1');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('3', '1', '角色管理', 'modules/sys/role.html', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', null, '1', 'fa fa-th-list', '3');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('6', '1', '定时任务', 'modules/job/schedule.html', null, '1', 'fa fa-tasks', '5');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('27', '1', '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('29', '1', '系统日志', 'modules/sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('30', '1', '文件上传', 'modules/oss/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('31', '0', '协议管理', null, null, '0', null, '1');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('32', '31', '模板管理', 'modules/pact/pactManage.html', '', '1', 'fa fa-file-text-o', '3');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('33', '31', '模板字典', 'modules/pact/pactDict.html', 'pactDict:list,pactDict:save,pactDict:update,pactDict:delete', '1', 'fa fa-file-text-o', '1');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('34', '31', '模板字典关系', 'modules/pact/pactDictRelation.html', 'pactDictRelation:save,pactDictRelation:update,pactDictRelation:delete,pactDictRelation:list', '1', null, '2');
INSERT INTO `gxs_pact`.`sys_menu` VALUES ('35', '31', '模板版本管理', 'modules/pact/pactManageVersion.html', null, '1', null, '4');

-- ----------------------------
-- Table structure for `sys_oss`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`sys_oss`;
CREATE TABLE `gxs_pact`.`sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`sys_role`;
CREATE TABLE `gxs_pact`.`sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `gxs_pact`.`sys_role` VALUES ('1', '协议管理', '协议管理', '1', '2018-04-26 15:21:13');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`sys_role_menu`;
CREATE TABLE `gxs_pact`.`sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `gxs_pact`.`sys_role_menu` VALUES ('1', '1', '31');
INSERT INTO `gxs_pact`.`sys_role_menu` VALUES ('2', '1', '32');
INSERT INTO `gxs_pact`.`sys_role_menu` VALUES ('3', '1', '33');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`sys_user`;
CREATE TABLE `gxs_pact`.`sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `gxs_pact`.`sys_user` VALUES ('1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'cwj@chinaredsun.com', '13612345678', '1', '1', '2016-11-11 11:11:11');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`sys_user_role`;
CREATE TABLE `gxs_pact``sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `gxs_pact`.`sys_user_role` VALUES ('1', '2', '1');

-- ----------------------------
-- Table structure for `sys_user_token`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`sys_user_token`;
CREATE TABLE `gxs_pact`.`sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `gxs_pact`.`sys_user_token` VALUES ('1', '02e4099d985782fbd13595f20e15d563', '2018-05-08 01:48:07', '2018-05-07 13:48:07');

-- ----------------------------
-- Table structure for `t_pact_dict`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`t_pact_dict`;
CREATE TABLE `gxs_pact`.`t_pact_dict` (
  `id` bigint(40) NOT NULL AUTO_INCREMENT,
  `dict_key` varchar(20) DEFAULT NULL COMMENT '参数key',
  `dict_value` varchar(100) DEFAULT NULL COMMENT '参数sql',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pact_dict
-- ----------------------------
INSERT INTO `gxs_pact`.`t_pact_dict` VALUES ('1', 'title', 'select title from xiaofeng.t_bids where id = ?');
INSERT INTO `gxs_pact`.`t_pact_dict` VALUES ('2', 'name', 'select name from t_bids where id = ?;');

-- ----------------------------
-- Table structure for `t_pact_dict_relation`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`t_pact_dict_relation`;
CREATE TABLE `gxs_pact`.`t_pact_dict_relation` (
  `id` bigint(40) NOT NULL AUTO_INCREMENT,
  `pact_template_id` bigint(40) DEFAULT NULL COMMENT '模板版本id',
  `pact_dict_id` bigint(40) DEFAULT NULL COMMENT '字典id',
  `result_type` varchar(20) DEFAULT NULL COMMENT '返回参数类型',
  `is_must` bit(1) DEFAULT NULL COMMENT '是否必输0:否 1:是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `t_pact_record`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`t_pact_record`;
CREATE TABLE `gxs_pact`.`t_pact_record` (
  `id` bigint(40) NOT NULL AUTO_INCREMENT,
  `platform` varchar(20) DEFAULT NULL COMMENT '平台标识',
  `business_id` bigint(40) DEFAULT NULL COMMENT '业务Id',
  `invest_id` bigint(40) DEFAULT NULL COMMENT '转让人的投资Id',
  `pact_flag` varchar(40) DEFAULT NULL COMMENT '阶段标识',
  `pact_path` varchar(200) DEFAULT NULL COMMENT '模板路径',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='协议记录表';


-- ----------------------------
-- Table structure for `t_pact_template`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`t_pact_template`;
CREATE TABLE `gxs_pact`.`t_pact_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `platform` varchar(20) DEFAULT NULL COMMENT '平台标识',
  `name` varchar(255) DEFAULT NULL COMMENT '模板名称',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='协议模板表';


-- ----------------------------
-- Table structure for `t_pact_version`
-- ----------------------------
DROP TABLE IF EXISTS `gxs_pact`.`t_pact_version`;
CREATE TABLE `gxs_pact`.`t_pact_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pact_name` varchar(255) DEFAULT NULL COMMENT '模板名称',
  `pact_template_id` bigint(20) DEFAULT NULL COMMENT '模板id',
  `pact_path` varchar(255) DEFAULT NULL COMMENT '模板路径',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期',
  `version` int(20) DEFAULT NULL COMMENT '最新版本号',
  `params` varchar(2000) DEFAULT NULL COMMENT '模板占位参数，逗号“，”隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='协议版本表';

