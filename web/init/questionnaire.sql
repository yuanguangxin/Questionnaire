/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Version : 50549
 Source Host           : localhost
 Source Database       : questionnaire

 Target Server Version : 50549
 File Encoding         : utf-8

 Date: 12/15/2018 23:36:30 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `admin`
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES ('1', 'admin', 'admin');
COMMIT;

-- ----------------------------
--  Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sex` int(11) NOT NULL,
  `format` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `question`
-- ----------------------------
BEGIN;
INSERT INTO `question` VALUES ('13', '3', '<div id=\"div1\" class=\"question\" style=\"height: 70px;\"><div id=\"table_test\" class=\"\"></div>    <div><br></div><div>A2. 被访者姓名：<input type=\"hidden\" id=\"hidden\" value=\"13\" class=\"\" style=\"cursor: inherit;\"><div id=\"table_test\" ondrop=\"drop(event)\" ondragover=\"allowDrop(event)\">\n    </div>\n<input id=\"u2\" type=\"text\" class=\"size_2 under\" style=\"cursor: inherit; left: 124px; top: 24px; position: absolute;\"></div><div><br></div>\n\n<script>\n    $(function(){\n        var div = document.getElementById(\"div1\");\n        div.style.height =\"auto\";\n        div.setAttribute(\"contenteditable\",\"true\");\n        div.setAttribute(\"ondrop\",\"drop(event)\");\n        div.setAttribute(\"ondragover\",\"allowDrop(event)\");\n        document.getElementById(\"table_test\").setAttribute(\"ondrop\",\"drop(event)\");\n        document.getElementById(\"table_test\").setAttribute(\"ondragover\",\"allowDrop(event)\");\n        $(\"#table_test\").addClass(\"draggable\");\n        var input = document.getElementsByTagName(\"input\");\n        for(let i=0;i<input.length;i++){\n            input[i].style.cursor = \"inherit\";\n            input[i].setAttribute(\"ondragstart\",\"drag(event)\");\n            input[i].setAttribute(\"draggable\",\"true\");\n            $(input[i]).addClass(\"draggable\",\"true\");\n        }\n        var ofTop = window.getComputedStyle(document.getElementsByClassName(\"question\")[0],null)[\"height\"];\n        document.getElementById(\"div1\").style.height = ofTop;\n        var div = document.getElementById(\"div1\").outerHTML;\n        if(false){\n            window.location.href=\"login.html\";\n        }\n    });\n    function allowDrop(ev)\n    {\n        ev.preventDefault();\n    }\n\n    function drag(ev)\n    {\n        ev.dataTransfer.setData(\"Text\",ev.target.id);\n    }\n\n    function drop(ev)\n    {\n        ev.preventDefault();\n        var data=ev.dataTransfer.getData(\"Text\");\n        var a = document.getElementById(data).cloneNode(true);\n        a.style.position = \"absolute\";\n        a.style.left=\"10px\";\n        $(a).addClass(\"draggable\");\n        a.setAttribute(\"draggable\",\"false\");\n        ev.target.appendChild(a);\n    }\n</script>\n\n</div>'), ('14', '3', '<div id=\"div1\" class=\"question\" style=\"height: 114px;\"><div id=\"table_test\"></div>\n    <div><br></div><div>A1. 病例号： &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; A1.2 病床号及床号： &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;病房 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;床</div><div>&nbsp;&nbsp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; A1.1回答问卷者与被调查者的关系： &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1. &nbsp;.....本人 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2. .....直系亲属 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;3. .....其他亲属<br><input id=\"u4\" type=\"text\" class=\"size_4 under\" style=\"position: absolute; left: 295px; top: 66px; cursor: inherit;\"></div><div><input id=\"u2\" type=\"text\" class=\"size_2 under\" style=\"position: absolute; left: 566px; top: 21px; cursor: inherit;\"></div></div>'), ('16', '3', '<div id=\"div1\" class=\"question\" style=\"height: 70px;\"><div><br></div>A3. 您的出生日期？ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 年 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 月 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 日（尽量用阳历计，阴历要标清）<div id=\"table_test\"></div>\n    <div><br></div><input id=\"u2\" type=\"text\" class=\"size_2 under\" style=\"position: absolute; left: 141px; top: 25px; cursor: inherit;\"><input id=\"u2\" type=\"text\" class=\"size_2 under\" style=\"position: absolute; left: 246px; top: 26px; cursor: inherit;\"><input id=\"u1\" type=\"text\" class=\"size_1 under\" style=\"position: absolute; left: 354px; top: 26px; cursor: inherit;\"></div>'), ('18', '3', '<div id=\"div1\" class=\"question\" style=\"height: 752px;\"><div id=\"table_test\"><br>E3.2 各类水果<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><table style=\"border: 5px; position: absolute; top: 82px; left: 2px;\" id=\"table_able\" contenteditable=\"true\" class=\"table-bordered draggable able_del\"><tbody><tr><td rowspan=\"2\" width=\"120px\" height=\"50px\">水果名称</td><td width=\"120px\" height=\"50px\" colspan=\"3\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 旺季</td><td width=\"120px\" height=\"50px\" colspan=\"3\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 淡季</td></tr><tr><td width=\"120px\" height=\"50px\">&nbsp; &nbsp;每周频次</td><td width=\"120px\" height=\"50px\">&nbsp; 每次食用量</td><td width=\"120px\" height=\"50px\">&nbsp;每周总量</td><td width=\"120px\" height=\"50px\">&nbsp; &nbsp;每周频次</td><td width=\"120px\" height=\"50px\">&nbsp; 每次食用量</td><td width=\"120px\" height=\"50px\">&nbsp; &nbsp;每周总量</td></tr><tr><td width=\"120px\" height=\"50px\">苹果</td><td width=\"120px\" height=\"50px\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 次/周&nbsp;<input id=\"u1\" type=\"text\" class=\"size_1 under\" style=\"position: absolute; left: 116px; top: 170px; cursor: inherit;\"><input id=\"u1\" type=\"text\" class=\"size_1 under\" style=\"position: absolute; left: 113px; top: 114px; cursor: inherit;\"></td><td width=\"120px\" height=\"50px\">..</td><td width=\"120px\" height=\"50px\">..</td><td width=\"120px\" height=\"50px\">..</td><td width=\"120px\" height=\"50px\">..</td><td width=\"120px\" height=\"50px\">..</td></tr><tr><td width=\"120px\" height=\"50px\">梨</td><td width=\"120px\" height=\"50px\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 次/周</td><td width=\"120px\" height=\"50px\">..</td><td width=\"120px\" height=\"50px\">..</td><td width=\"120px\" height=\"50px\">..</td><td width=\"120px\" height=\"50px\">..</td><td width=\"120px\" height=\"50px\">..</td></tr><tr><td width=\"120px\" height=\"50px\">柑/橘/橙</td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td></tr><tr><td width=\"120px\" height=\"50px\">香蕉</td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td></tr><tr><td width=\"120px\" height=\"50px\">葡萄</td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td></tr><tr><td width=\"120px\" height=\"50px\">西瓜</td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td></tr><tr><td width=\"120px\" height=\"50px\">桃</td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td></tr><tr><td width=\"120px\" height=\"50px\">猕猴桃</td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td></tr><tr><td width=\"120px\" height=\"50px\">木瓜</td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td></tr><tr><td width=\"120px\" height=\"50px\">草莓</td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td></tr><tr><td width=\"120px\" height=\"50px\">香瓜</td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td><td width=\"120px\" height=\"50px\"></td></tr></tbody></table></div>\n    </div>');
COMMIT;

-- ----------------------------
--  Table structure for `result`
-- ----------------------------
DROP TABLE IF EXISTS `result`;
CREATE TABLE `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `sex` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `format` text NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `survey`
-- ----------------------------
DROP TABLE IF EXISTS `survey`;
CREATE TABLE `survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `survey`
-- ----------------------------
BEGIN;
INSERT INTO `survey` VALUES ('20', '14,13,16,18', '基本情况', '1');
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', '1', '1', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
