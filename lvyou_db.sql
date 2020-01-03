-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- �������汾: 5.1.29
-- PHP �汾: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_userInfo` (
  `user_name` varchar(20)  NOT NULL COMMENT 'user_name',
  `password` varchar(20)  NOT NULL COMMENT '��¼����',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `sex` varchar(4)  NOT NULL COMMENT '�Ա�',
  `userPhoto` varchar(60)  NOT NULL COMMENT '�û���Ƭ',
  `birthday` varchar(20)  NULL COMMENT '��������',
  `telephone` varchar(20)  NOT NULL COMMENT '��ϵ�绰',
  `address` varchar(50)  NOT NULL COMMENT '��ͥ��ַ',
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_scenicType` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `typeName` varchar(20)  NOT NULL COMMENT '�������',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_city` (
  `cityNo` varchar(20)  NOT NULL COMMENT 'cityNo',
  `cityName` varchar(20)  NOT NULL COMMENT '��������',
  PRIMARY KEY (`cityNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_scenic` (
  `scenicId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `cityObj` varchar(20)  NOT NULL COMMENT '���ڳ���',
  `scenicTypeObj` int(11) NOT NULL COMMENT '��������',
  `dengji` varchar(20)  NOT NULL COMMENT '����ȼ�',
  `scenicName` varchar(30)  NOT NULL COMMENT '��������',
  `scenicPhoto` varchar(60)  NOT NULL COMMENT '����ͼƬ',
  `scenicDesc` varchar(2000)  NOT NULL COMMENT '�������',
  `price` float NOT NULL COMMENT '��Ʊ�۸�',
  `openTime` varchar(30)  NOT NULL COMMENT '����ʱ��',
  `address` varchar(60)  NOT NULL COMMENT '�����ַ',
  PRIMARY KEY (`scenicId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `scenicObj` int(11) NOT NULL COMMENT '��������',
  `commentContent` varchar(30)  NOT NULL COMMENT '��������',
  `userObj` varchar(20)  NOT NULL COMMENT '������',
  `commentTime` varchar(20)  NULL COMMENT '����ʱ��',
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_orderInfo` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `scenicObj` int(11) NOT NULL COMMENT 'Ԥ������',
  `orderDate` varchar(20)  NULL COMMENT 'Ԥ������',
  `price` float NOT NULL COMMENT 'Ԥ���۸�',
  `userObj` varchar(20)  NOT NULL COMMENT 'Ԥ���û�',
  `orderTime` varchar(20)  NULL COMMENT '�µ�ʱ��',
  `shState` varchar(20)  NOT NULL COMMENT '���״̬',
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_leaveWord` (
  `leaveWordId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `title` varchar(40)  NOT NULL COMMENT '����',
  `leaveContent` varchar(2000)  NOT NULL COMMENT '��������',
  `addTime` varchar(20)  NULL COMMENT '����ʱ��',
  `userObj` varchar(20)  NOT NULL COMMENT '������',
  `replyContent` varchar(2000)  NULL COMMENT '�ظ�����',
  `replyTime` varchar(20)  NULL COMMENT '�ظ�ʱ��',
  PRIMARY KEY (`leaveWordId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

ALTER TABLE t_scenic ADD CONSTRAINT FOREIGN KEY (cityObj) REFERENCES t_city(cityNo);
ALTER TABLE t_scenic ADD CONSTRAINT FOREIGN KEY (scenicTypeObj) REFERENCES t_scenicType(typeId);
ALTER TABLE t_comment ADD CONSTRAINT FOREIGN KEY (scenicObj) REFERENCES t_scenic(scenicId);
ALTER TABLE t_comment ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_orderInfo ADD CONSTRAINT FOREIGN KEY (scenicObj) REFERENCES t_scenic(scenicId);
ALTER TABLE t_orderInfo ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_leaveWord ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);


