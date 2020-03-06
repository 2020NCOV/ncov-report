-- MySQL dump 10.13  Distrib 5.7.12, for osx10.11 (x86_64)
--
-- Host: localhost    Database: ncov_oss
-- ------------------------------------------------------
-- Server version	5.7.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_ope_type`
--

DROP TABLE IF EXISTS `admin_ope_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_ope_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '操作名',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_ope_type`
--

LOCK TABLES `admin_ope_type` WRITE;
/*!40000 ALTER TABLE `admin_ope_type` DISABLE KEYS */;
INSERT INTO `admin_ope_type` VALUES (1,'登录',0),(2,'修改密码',0),(3,'导出上报数据',0),(4,'添加白名单数据',0),(5,'批量导入白名单数据',0),(6,'删除白名单数据',0),(7,'添加部门',0),(8,'修改部门',0),(9,'部门管理员添加',0),(10,'修改管理员信息',0),(11,'添加标签',0),(12,'修改标签',0);
/*!40000 ALTER TABLE `admin_ope_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role`
--

DROP TABLE IF EXISTS `admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '角色名',
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role`
--

LOCK TABLES `admin_role` WRITE;
/*!40000 ALTER TABLE `admin_role` DISABLE KEYS */;
INSERT INTO `admin_role` VALUES (1,'超级管理员','可开通多租户权限'),(2,'机构管理员','可以管理机构内的部门'),(3,'部门管理员','部门内管理员，可以管理部门数据');
/*!40000 ALTER TABLE `admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(10) NOT NULL COMMENT '机构id',
  `dep_id` int(11) NOT NULL COMMENT '所管理部门的id',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `name` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` int(11) NOT NULL DEFAULT '0',
  `is_admin` int(11) NOT NULL DEFAULT '0' COMMENT '内置机构管理员',
  `is_del` int(11) NOT NULL DEFAULT '0',
  `need_m_pass` int(11) NOT NULL DEFAULT '1',
  `remarks` varchar(200) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_unique` (`username`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES (1,0,0,'admin','管理员','076c1c8c99492e2aeac2481b1de7c527',1,0,0,1,'平台总管理员','2020-02-29 13:58:39');
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_log`
--

DROP TABLE IF EXISTS `admin_user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'user表ID',
  `name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `ope_type` int(11) NOT NULL COMMENT '操作类别',
  `path` varchar(100) NOT NULL COMMENT 'URL',
  `content` varchar(1000) CHARACTER SET utf8 NOT NULL COMMENT '操作内容',
  `ip` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT 'IP地址',
  `agent` varchar(1000) CHARACTER SET utf8 NOT NULL COMMENT '浏览器数据',
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_log`
--

LOCK TABLES `admin_user_log` WRITE;
/*!40000 ALTER TABLE `admin_user_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_district`
--

DROP TABLE IF EXISTS `com_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `com_district` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '	行政区划标识id',
  `name` varchar(255) NOT NULL COMMENT '行政区划名称',
  `value` int(11) NOT NULL COMMENT '行政区划字典值（不重复）',
  `level_id` int(11) NOT NULL COMMENT '行政区划级别（关联行政区划级别id）',
  `parent_id` int(11) NOT NULL COMMENT '父级行政区划id（最顶级为0）',
  `seq` int(11) NOT NULL DEFAULT '0' COMMENT '排序号（数值大的在前）',
  `short_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-关联行政区划级别_idx` (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7214089 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_district`
--

LOCK TABLES `com_district` WRITE;
/*!40000 ALTER TABLE `com_district` DISABLE KEYS */;
INSERT INTO `com_district` VALUES (1100000,'北京市',1100000,1,0,1,NULL),(1101000,'直辖区',1101000,2,1100000,2,NULL),(1200000,'天津市',1200000,1,0,3,NULL),(1201000,'直辖区',1201000,2,1200000,4,NULL),(1300000,'河北省',1300000,1,0,5,NULL),(1301000,'石家庄市',1301000,2,1300000,6,NULL),(1302000,'唐山市',1302000,2,1300000,7,NULL),(1303000,'秦皇岛市',1303000,2,1300000,8,NULL),(1304000,'邯郸市',1304000,2,1300000,9,NULL),(1305000,'邢台市',1305000,2,1300000,10,NULL),(1306000,'保定市',1306000,2,1300000,11,NULL),(1307000,'张家口市',1307000,2,1300000,12,NULL),(1308000,'承德市',1308000,2,1300000,13,NULL),(1309000,'沧州市',1309000,2,1300000,14,NULL),(1310000,'廊坊市',1310000,2,1300000,15,NULL),(1311000,'衡水市',1311000,2,1300000,16,NULL),(1400000,'山西省',1400000,1,0,17,NULL),(1401000,'太原市',1401000,2,1400000,18,NULL),(1402000,'大同市',1402000,2,1400000,19,NULL),(1403000,'阳泉市',1403000,2,1400000,20,NULL),(1404000,'长治市',1404000,2,1400000,21,NULL),(1405000,'晋城市',1405000,2,1400000,22,NULL),(1406000,'朔州市',1406000,2,1400000,23,NULL),(1407000,'晋中市',1407000,2,1400000,24,NULL),(1408000,'运城市',1408000,2,1400000,25,NULL),(1409000,'忻州市',1409000,2,1400000,26,NULL),(1410000,'临汾市',1410000,2,1400000,27,NULL),(1411000,'吕梁市',1411000,2,1400000,28,NULL),(1500000,'内蒙古自治区',1500000,1,0,29,NULL),(1501000,'呼和浩特市',1501000,2,1500000,30,NULL),(1502000,'包头市',1502000,2,1500000,31,NULL),(1503000,'乌海市',1503000,2,1500000,32,NULL),(1504000,'赤峰市',1504000,2,1500000,33,NULL),(1505000,'通辽市',1505000,2,1500000,34,NULL),(1506000,'鄂尔多斯市',1506000,2,1500000,35,NULL),(1507000,'呼伦贝尔市',1507000,2,1500000,36,NULL),(1508000,'巴彦淖尔市',1508000,2,1500000,37,NULL),(1509000,'乌兰察布市',1509000,2,1500000,38,NULL),(1522000,'兴安盟',1522000,2,1500000,39,NULL),(1525000,'锡林郭勒盟',1525000,2,1500000,40,NULL),(1529000,'阿拉善盟',1529000,2,1500000,41,NULL),(2100000,'辽宁省',2100000,1,0,42,NULL),(2101000,'沈阳市',2101000,2,2100000,43,NULL),(2102000,'大连市',2102000,2,2100000,44,NULL),(2103000,'鞍山市',2103000,2,2100000,45,NULL),(2104000,'抚顺市',2104000,2,2100000,46,NULL),(2105000,'本溪市',2105000,2,2100000,47,NULL),(2106000,'丹东市',2106000,2,2100000,48,NULL),(2107000,'锦州市',2107000,2,2100000,49,NULL),(2108000,'营口市',2108000,2,2100000,50,NULL),(2109000,'阜新市',2109000,2,2100000,51,NULL),(2110000,'辽阳市',2110000,2,2100000,52,NULL),(2111000,'盘锦市',2111000,2,2100000,53,NULL),(2112000,'铁岭市',2112000,2,2100000,54,NULL),(2113000,'朝阳市',2113000,2,2100000,55,NULL),(2114000,'葫芦岛市',2114000,2,2100000,56,NULL),(2200000,'吉林省',2200000,1,0,57,NULL),(2201000,'长春市',2201000,2,2200000,58,NULL),(2202000,'吉林市',2202000,2,2200000,59,NULL),(2203000,'四平市',2203000,2,2200000,60,NULL),(2204000,'辽源市',2204000,2,2200000,61,NULL),(2205000,'通化市',2205000,2,2200000,62,NULL),(2206000,'白山市',2206000,2,2200000,63,NULL),(2207000,'松原市',2207000,2,2200000,64,NULL),(2208000,'白城市',2208000,2,2200000,65,NULL),(2224000,'延边朝鲜族自治州',2224000,2,2200000,66,NULL),(2300000,'黑龙江省',2300000,1,0,67,NULL),(2301000,'哈尔滨市',2301000,2,2300000,68,NULL),(2302000,'齐齐哈尔市',2302000,2,2300000,69,NULL),(2303000,'鸡西市',2303000,2,2300000,70,NULL),(2304000,'鹤岗市',2304000,2,2300000,71,NULL),(2305000,'双鸭山市',2305000,2,2300000,72,NULL),(2306000,'大庆市',2306000,2,2300000,73,NULL),(2307000,'伊春市',2307000,2,2300000,74,NULL),(2308000,'佳木斯市',2308000,2,2300000,75,NULL),(2309000,'七台河市',2309000,2,2300000,76,NULL),(2310000,'牡丹江市',2310000,2,2300000,77,NULL),(2311000,'黑河市',2311000,2,2300000,78,NULL),(2312000,'绥化市',2312000,2,2300000,79,NULL),(2327000,'大兴安岭地区',2327000,2,2300000,80,NULL),(3100000,'上海市',3100000,1,0,81,NULL),(3101000,'直辖区',3101000,2,3100000,82,NULL),(3200000,'江苏省',3200000,1,0,83,NULL),(3201000,'南京市',3201000,2,3200000,84,NULL),(3202000,'无锡市',3202000,2,3200000,85,NULL),(3203000,'徐州市',3203000,2,3200000,86,NULL),(3204000,'常州市',3204000,2,3200000,87,NULL),(3205000,'苏州市',3205000,2,3200000,88,NULL),(3206000,'南通市',3206000,2,3200000,89,NULL),(3207000,'连云港市',3207000,2,3200000,90,NULL),(3208000,'淮安市',3208000,2,3200000,91,NULL),(3209000,'盐城市',3209000,2,3200000,92,NULL),(3210000,'扬州市',3210000,2,3200000,93,NULL),(3211000,'镇江市',3211000,2,3200000,94,NULL),(3212000,'泰州市',3212000,2,3200000,95,NULL),(3213000,'宿迁市',3213000,2,3200000,96,NULL),(3300000,'浙江省',3300000,1,0,97,NULL),(3301000,'杭州市',3301000,2,3300000,98,NULL),(3302000,'宁波市',3302000,2,3300000,99,NULL),(3303000,'温州市',3303000,2,3300000,100,NULL),(3304000,'嘉兴市',3304000,2,3300000,101,NULL),(3305000,'湖州市',3305000,2,3300000,102,NULL),(3306000,'绍兴市',3306000,2,3300000,103,NULL),(3307000,'金华市',3307000,2,3300000,104,NULL),(3308000,'衢州市',3308000,2,3300000,105,NULL),(3309000,'舟山市',3309000,2,3300000,106,NULL),(3310000,'台州市',3310000,2,3300000,107,NULL),(3311000,'丽水市',3311000,2,3300000,108,NULL),(3400000,'安徽省',3400000,1,0,109,NULL),(3401000,'合肥市',3401000,2,3400000,110,NULL),(3402000,'芜湖市',3402000,2,3400000,111,NULL),(3403000,'蚌埠市',3403000,2,3400000,112,NULL),(3404000,'淮南市',3404000,2,3400000,113,NULL),(3405000,'马鞍山市',3405000,2,3400000,114,NULL),(3406000,'淮北市',3406000,2,3400000,115,NULL),(3407000,'铜陵市',3407000,2,3400000,116,NULL),(3408000,'安庆市',3408000,2,3400000,117,NULL),(3410000,'黄山市',3410000,2,3400000,118,NULL),(3411000,'滁州市',3411000,2,3400000,119,NULL),(3412000,'阜阳市',3412000,2,3400000,120,NULL),(3413000,'宿州市',3413000,2,3400000,121,NULL),(3415000,'六安市',3415000,2,3400000,122,NULL),(3416000,'亳州市',3416000,2,3400000,123,NULL),(3417000,'池州市',3417000,2,3400000,124,NULL),(3418000,'宣城市',3418000,2,3400000,125,NULL),(3500000,'福建省',3500000,1,0,126,NULL),(3501000,'福州市',3501000,2,3500000,127,NULL),(3502000,'厦门市',3502000,2,3500000,128,NULL),(3503000,'莆田市',3503000,2,3500000,129,NULL),(3504000,'三明市',3504000,2,3500000,130,NULL),(3505000,'泉州市',3505000,2,3500000,131,NULL),(3506000,'漳州市',3506000,2,3500000,132,NULL),(3507000,'南平市',3507000,2,3500000,133,NULL),(3508000,'龙岩市',3508000,2,3500000,134,NULL),(3509000,'宁德市',3509000,2,3500000,135,NULL),(3600000,'江西省',3600000,1,0,136,NULL),(3601000,'南昌市',3601000,2,3600000,137,NULL),(3602000,'景德镇市',3602000,2,3600000,138,NULL),(3603000,'萍乡市',3603000,2,3600000,139,NULL),(3604000,'九江市',3604000,2,3600000,140,NULL),(3605000,'新余市',3605000,2,3600000,141,NULL),(3606000,'鹰潭市',3606000,2,3600000,142,NULL),(3607000,'赣州市',3607000,2,3600000,143,NULL),(3608000,'吉安市',3608000,2,3600000,144,NULL),(3609000,'宜春市',3609000,2,3600000,145,NULL),(3610000,'抚州市',3610000,2,3600000,146,NULL),(3611000,'上饶市',3611000,2,3600000,147,NULL),(3700000,'山东省',3700000,1,0,148,NULL),(3701000,'济南市',3701000,2,3700000,149,NULL),(3702000,'青岛市',3702000,2,3700000,150,NULL),(3703000,'淄博市',3703000,2,3700000,151,NULL),(3704000,'枣庄市',3704000,2,3700000,152,NULL),(3705000,'东营市',3705000,2,3700000,153,NULL),(3706000,'烟台市',3706000,2,3700000,154,NULL),(3707000,'潍坊市',3707000,2,3700000,155,NULL),(3708000,'济宁市',3708000,2,3700000,156,NULL),(3709000,'泰安市',3709000,2,3700000,157,NULL),(3710000,'威海市',3710000,2,3700000,158,NULL),(3711000,'日照市',3711000,2,3700000,159,NULL),(3712000,'莱芜市',3712000,2,3700000,160,NULL),(3713000,'临沂市',3713000,2,3700000,161,NULL),(3714000,'德州市',3714000,2,3700000,162,NULL),(3715000,'聊城市',3715000,2,3700000,163,NULL),(3716000,'滨州市',3716000,2,3700000,164,NULL),(3717000,'菏泽市',3717000,2,3700000,165,NULL),(4100000,'河南省',4100000,1,0,166,NULL),(4101000,'郑州市',4101000,2,4100000,167,NULL),(4102000,'开封市',4102000,2,4100000,168,NULL),(4103000,'洛阳市',4103000,2,4100000,169,NULL),(4104000,'平顶山市',4104000,2,4100000,170,NULL),(4105000,'安阳市',4105000,2,4100000,171,NULL),(4106000,'鹤壁市',4106000,2,4100000,172,NULL),(4107000,'新乡市',4107000,2,4100000,173,NULL),(4108000,'焦作市',4108000,2,4100000,174,NULL),(4109000,'濮阳市',4109000,2,4100000,175,NULL),(4110000,'许昌市',4110000,2,4100000,176,NULL),(4111000,'漯河市',4111000,2,4100000,177,NULL),(4112000,'三门峡市',4112000,2,4100000,178,NULL),(4113000,'南阳市',4113000,2,4100000,179,NULL),(4114000,'商丘市',4114000,2,4100000,180,NULL),(4115000,'信阳市',4115000,2,4100000,181,NULL),(4116000,'周口市',4116000,2,4100000,182,NULL),(4117000,'驻马店市',4117000,2,4100000,183,NULL),(4190000,'直辖县',4190000,2,4100000,184,NULL),(4200000,'湖北省',4200000,1,0,185,NULL),(4201000,'武汉市',4201000,2,4200000,186,NULL),(4202000,'黄石市',4202000,2,4200000,187,NULL),(4203000,'十堰市',4203000,2,4200000,188,NULL),(4205000,'宜昌市',4205000,2,4200000,189,NULL),(4206000,'襄阳市',4206000,2,4200000,190,NULL),(4207000,'鄂州市',4207000,2,4200000,191,NULL),(4208000,'荆门市',4208000,2,4200000,192,NULL),(4209000,'孝感市',4209000,2,4200000,193,NULL),(4210000,'荆州市',4210000,2,4200000,194,NULL),(4211000,'黄冈市',4211000,2,4200000,195,NULL),(4212000,'咸宁市',4212000,2,4200000,196,NULL),(4213000,'随州市',4213000,2,4200000,197,NULL),(4228000,'恩施土家族苗族自治州',4228000,2,4200000,198,NULL),(4290000,'直辖县',4290000,2,4200000,199,NULL),(4300000,'湖南省',4300000,1,0,200,NULL),(4301000,'长沙市',4301000,2,4300000,201,NULL),(4302000,'株洲市',4302000,2,4300000,202,NULL),(4303000,'湘潭市',4303000,2,4300000,203,NULL),(4304000,'衡阳市',4304000,2,4300000,204,NULL),(4305000,'邵阳市',4305000,2,4300000,205,NULL),(4306000,'岳阳市',4306000,2,4300000,206,NULL),(4307000,'常德市',4307000,2,4300000,207,NULL),(4308000,'张家界市',4308000,2,4300000,208,NULL),(4309000,'益阳市',4309000,2,4300000,209,NULL),(4310000,'郴州市',4310000,2,4300000,210,NULL),(4311000,'永州市',4311000,2,4300000,211,NULL),(4312000,'怀化市',4312000,2,4300000,212,NULL),(4313000,'娄底市',4313000,2,4300000,213,NULL),(4331000,'湘西土家族苗族自治州',4331000,2,4300000,214,NULL),(4400000,'广东省',4400000,1,0,215,NULL),(4401000,'广州市',4401000,2,4400000,216,NULL),(4402000,'韶关市',4402000,2,4400000,217,NULL),(4403000,'深圳市',4403000,2,4400000,218,NULL),(4404000,'珠海市',4404000,2,4400000,219,NULL),(4405000,'汕头市',4405000,2,4400000,220,NULL),(4406000,'佛山市',4406000,2,4400000,221,NULL),(4407000,'江门市',4407000,2,4400000,222,NULL),(4408000,'湛江市',4408000,2,4400000,223,NULL),(4409000,'茂名市',4409000,2,4400000,224,NULL),(4412000,'肇庆市',4412000,2,4400000,225,NULL),(4413000,'惠州市',4413000,2,4400000,226,NULL),(4414000,'梅州市',4414000,2,4400000,227,NULL),(4415000,'汕尾市',4415000,2,4400000,228,NULL),(4416000,'河源市',4416000,2,4400000,229,NULL),(4417000,'阳江市',4417000,2,4400000,230,NULL),(4418000,'清远市',4418000,2,4400000,231,NULL),(4419000,'东莞市',4419000,2,4400000,232,NULL),(4420000,'中山市',4420000,2,4400000,233,NULL),(4451000,'潮州市',4451000,2,4400000,234,NULL),(4452000,'揭阳市',4452000,2,4400000,235,NULL),(4453000,'云浮市',4453000,2,4400000,236,NULL),(4500000,'广西壮族自治区',4500000,1,0,237,NULL),(4501000,'南宁市',4501000,2,4500000,238,NULL),(4502000,'柳州市',4502000,2,4500000,239,NULL),(4503000,'桂林市',4503000,2,4500000,240,NULL),(4504000,'梧州市',4504000,2,4500000,241,NULL),(4505000,'北海市',4505000,2,4500000,242,NULL),(4506000,'防城港市',4506000,2,4500000,243,NULL),(4507000,'钦州市',4507000,2,4500000,244,NULL),(4508000,'贵港市',4508000,2,4500000,245,NULL),(4509000,'玉林市',4509000,2,4500000,246,NULL),(4510000,'百色市',4510000,2,4500000,247,NULL),(4511000,'贺州市',4511000,2,4500000,248,NULL),(4512000,'河池市',4512000,2,4500000,249,NULL),(4513000,'来宾市',4513000,2,4500000,250,NULL),(4514000,'崇左市',4514000,2,4500000,251,NULL),(4600000,'海南省',4600000,1,0,252,NULL),(4601000,'海口市',4601000,2,4600000,253,NULL),(4602000,'三亚市',4602000,2,4600000,254,NULL),(4603000,'三沙市',4603000,2,4600000,255,NULL),(4604000,'儋州市',4604000,2,4600000,256,NULL),(4690000,'直辖县',4690000,2,4600000,257,NULL),(5000000,'重庆市',5000000,1,0,258,NULL),(5001000,'直辖区',5001000,2,5000000,259,NULL),(5002000,'直辖县',5002000,2,5000000,260,NULL),(5100000,'四川省',5100000,1,0,261,NULL),(5101000,'成都市',5101000,2,5100000,262,NULL),(5103000,'自贡市',5103000,2,5100000,263,NULL),(5104000,'攀枝花市',5104000,2,5100000,264,NULL),(5105000,'泸州市',5105000,2,5100000,265,NULL),(5106000,'德阳市',5106000,2,5100000,266,NULL),(5107000,'绵阳市',5107000,2,5100000,267,NULL),(5108000,'广元市',5108000,2,5100000,268,NULL),(5109000,'遂宁市',5109000,2,5100000,269,NULL),(5110000,'内江市',5110000,2,5100000,270,NULL),(5111000,'乐山市',5111000,2,5100000,271,NULL),(5113000,'南充市',5113000,2,5100000,272,NULL),(5114000,'眉山市',5114000,2,5100000,273,NULL),(5115000,'宜宾市',5115000,2,5100000,274,NULL),(5116000,'广安市',5116000,2,5100000,275,NULL),(5117000,'达州市',5117000,2,5100000,276,NULL),(5118000,'雅安市',5118000,2,5100000,277,NULL),(5119000,'巴中市',5119000,2,5100000,278,NULL),(5120000,'资阳市',5120000,2,5100000,279,NULL),(5132000,'阿坝藏族羌族自治州',5132000,2,5100000,280,NULL),(5133000,'甘孜藏族自治州',5133000,2,5100000,281,NULL),(5134000,'凉山彝族自治州',5134000,2,5100000,282,NULL),(5200000,'贵州省',5200000,1,0,283,NULL),(5201000,'贵阳市',5201000,2,5200000,284,NULL),(5202000,'六盘水市',5202000,2,5200000,285,NULL),(5203000,'遵义市',5203000,2,5200000,286,NULL),(5204000,'安顺市',5204000,2,5200000,287,NULL),(5205000,'毕节市',5205000,2,5200000,288,NULL),(5206000,'铜仁市',5206000,2,5200000,289,NULL),(5223000,'黔西南布依族苗族自治州',5223000,2,5200000,290,NULL),(5226000,'黔东南苗族侗族自治州',5226000,2,5200000,291,NULL),(5227000,'黔南布依族苗族自治州',5227000,2,5200000,292,NULL),(5300000,'云南省',5300000,1,0,293,NULL),(5301000,'昆明市',5301000,2,5300000,294,NULL),(5303000,'曲靖市',5303000,2,5300000,295,NULL),(5304000,'玉溪市',5304000,2,5300000,296,NULL),(5305000,'保山市',5305000,2,5300000,297,NULL),(5306000,'昭通市',5306000,2,5300000,298,NULL),(5307000,'丽江市',5307000,2,5300000,299,NULL),(5308000,'普洱市',5308000,2,5300000,300,NULL),(5309000,'临沧市',5309000,2,5300000,301,NULL),(5323000,'楚雄彝族自治州',5323000,2,5300000,302,NULL),(5325000,'红河哈尼族彝族自治州',5325000,2,5300000,303,NULL),(5326000,'文山壮族苗族自治州',5326000,2,5300000,304,NULL),(5328000,'西双版纳傣族自治州',5328000,2,5300000,305,NULL),(5329000,'大理白族自治州',5329000,2,5300000,306,NULL),(5331000,'德宏傣族景颇族自治州',5331000,2,5300000,307,NULL),(5333000,'怒江傈僳族自治州',5333000,2,5300000,308,NULL),(5334000,'迪庆藏族自治州',5334000,2,5300000,309,NULL),(5400000,'西藏自治区',5400000,1,0,310,NULL),(5401000,'拉萨市',5401000,2,5400000,311,NULL),(5402000,'日喀则市',5402000,2,5400000,312,NULL),(5403000,'昌都市',5403000,2,5400000,313,NULL),(5404000,'林芝市',5404000,2,5400000,314,NULL),(5405000,'山南市',5405000,2,5400000,315,NULL),(5406000,'那曲市',5406000,2,5400000,316,NULL),(5425000,'阿里地区',5425000,2,5400000,317,NULL),(6100000,'陕西省',6100000,1,0,318,NULL),(6101000,'西安市',6101000,2,6100000,319,NULL),(6102000,'铜川市',6102000,2,6100000,320,NULL),(6103000,'宝鸡市',6103000,2,6100000,321,NULL),(6104000,'咸阳市',6104000,2,6100000,322,NULL),(6105000,'渭南市',6105000,2,6100000,323,NULL),(6106000,'延安市',6106000,2,6100000,324,NULL),(6107000,'汉中市',6107000,2,6100000,325,NULL),(6108000,'榆林市',6108000,2,6100000,326,NULL),(6109000,'安康市',6109000,2,6100000,327,NULL),(6110000,'商洛市',6110000,2,6100000,328,NULL),(6200000,'甘肃省',6200000,1,0,329,NULL),(6201000,'兰州市',6201000,2,6200000,330,NULL),(6202000,'嘉峪关市',6202000,2,6200000,331,NULL),(6203000,'金昌市',6203000,2,6200000,332,NULL),(6204000,'白银市',6204000,2,6200000,333,NULL),(6205000,'天水市',6205000,2,6200000,334,NULL),(6206000,'武威市',6206000,2,6200000,335,NULL),(6207000,'张掖市',6207000,2,6200000,336,NULL),(6208000,'平凉市',6208000,2,6200000,337,NULL),(6209000,'酒泉市',6209000,2,6200000,338,NULL),(6210000,'庆阳市',6210000,2,6200000,339,NULL),(6211000,'定西市',6211000,2,6200000,340,NULL),(6212000,'陇南市',6212000,2,6200000,341,NULL),(6229000,'临夏回族自治州',6229000,2,6200000,342,NULL),(6230000,'甘南藏族自治州',6230000,2,6200000,343,NULL),(6300000,'青海省',6300000,1,0,344,NULL),(6301000,'西宁市',6301000,2,6300000,345,NULL),(6302000,'海东市',6302000,2,6300000,346,NULL),(6322000,'海北藏族自治州',6322000,2,6300000,347,NULL),(6323000,'黄南藏族自治州',6323000,2,6300000,348,NULL),(6325000,'海南藏族自治州',6325000,2,6300000,349,NULL),(6326000,'果洛藏族自治州',6326000,2,6300000,350,NULL),(6327000,'玉树藏族自治州',6327000,2,6300000,351,NULL),(6328000,'海西蒙古族藏族自治州',6328000,2,6300000,352,NULL),(6400000,'宁夏回族自治区',6400000,1,0,353,NULL),(6401000,'银川市',6401000,2,6400000,354,NULL),(6402000,'石嘴山市',6402000,2,6400000,355,NULL),(6403000,'吴忠市',6403000,2,6400000,356,NULL),(6404000,'固原市',6404000,2,6400000,357,NULL),(6405000,'中卫市',6405000,2,6400000,358,NULL),(6500000,'新疆维吾尔自治区',6500000,1,0,359,NULL),(6501000,'乌鲁木齐市',6501000,2,6500000,360,NULL),(6502000,'克拉玛依市',6502000,2,6500000,361,NULL),(6504000,'吐鲁番市',6504000,2,6500000,362,NULL),(6505000,'哈密市',6505000,2,6500000,363,NULL),(6523000,'昌吉回族自治州',6523000,2,6500000,364,NULL),(6527000,'博尔塔拉蒙古自治州',6527000,2,6500000,365,NULL),(6528000,'巴音郭楞蒙古自治州',6528000,2,6500000,366,NULL),(6529000,'阿克苏地区',6529000,2,6500000,367,NULL),(6530000,'克孜勒苏柯尔克孜自治州',6530000,2,6500000,368,NULL),(6531000,'喀什地区',6531000,2,6500000,369,NULL),(6532000,'和田地区',6532000,2,6500000,370,NULL),(6540000,'伊犁哈萨克自治州',6540000,2,6500000,371,NULL),(6542000,'塔城地区',6542000,2,6500000,372,NULL),(6543000,'阿勒泰地区',6543000,2,6500000,373,NULL),(6590000,'直辖县',6590000,2,6500000,374,NULL),(7011559,'香港岛',7011559,2,7013135,376,NULL),(7012837,'九龙',7012837,2,7013135,377,NULL),(7013135,'香港特别行政区',7013135,1,0,375,NULL),(7013591,'新界',7013591,2,7013135,378,NULL),(7110196,'氹仔岛',7110196,2,7112407,381,NULL),(7111217,'澳门半岛',7111217,2,7112407,380,NULL),(7112407,'澳门特别行政区',7112407,1,0,379,NULL),(7113878,'路环岛',7113878,2,7112407,382,NULL),(7210006,'苗栗县',7210006,2,7212684,394,NULL),(7210341,'桃园市',7210341,2,7212684,404,NULL),(7210496,'宜兰县',7210496,2,7212684,405,NULL),(7210628,'新竹市',7210628,2,7212684,387,NULL),(7210683,'台东县',7210683,2,7212684,403,NULL),(7210805,'云林县',7210805,2,7212684,406,NULL),(7210872,'新竹县',7210872,2,7212684,388,NULL),(7210941,'嘉义县',7210941,2,7212684,386,NULL),(7211135,'台北市',7211135,2,7212684,402,NULL),(7211363,'彰化县',7211363,2,7212684,384,NULL),(7211448,'澎湖县',7211448,2,7212684,398,NULL),(7211810,'台南市',7211810,2,7212684,401,NULL),(7212569,'南海岛',7212569,2,7212684,395,NULL),(7212684,'台湾省',7212684,1,0,383,NULL),(7212732,'高雄市',7212732,2,7212684,390,NULL),(7212735,'嘉义市',7212735,2,7212684,385,NULL),(7213169,'金门县',7213169,2,7212684,392,NULL),(7213286,'南投县',7213286,2,7212684,396,NULL),(7213368,'屏东县',7213368,2,7212684,399,NULL),(7213392,'台中市',7213392,2,7212684,400,NULL),(7213431,'新北市',7213431,2,7212684,397,NULL),(7213494,'连江县',7213494,2,7212684,393,NULL),(7213659,'花莲县',7213659,2,7212684,389,NULL),(7214088,'基隆市',7214088,2,7212684,391,NULL);
/*!40000 ALTER TABLE `com_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_district_level`
--

DROP TABLE IF EXISTS `com_district_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `com_district_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '级别名称',
  `level` int(11) NOT NULL COMMENT '级别序号（数值大的在前，不应重复）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_district_level`
--

LOCK TABLES `com_district_level` WRITE;
/*!40000 ALTER TABLE `com_district_level` DISABLE KEYS */;
INSERT INTO `com_district_level` VALUES (1,'省',1),(2,'市',2);
/*!40000 ALTER TABLE `com_district_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_provincial`
--

DROP TABLE IF EXISTS `com_provincial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `com_provincial` (
  `pid` int(11) NOT NULL DEFAULT '0',
  `Provincial` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_provincial`
--

LOCK TABLES `com_provincial` WRITE;
/*!40000 ALTER TABLE `com_provincial` DISABLE KEYS */;
INSERT INTO `com_provincial` VALUES (1,'北京'),(2,'天津'),(3,'上海'),(4,'重庆'),(5,'河北'),(6,'山西'),(7,'辽宁'),(8,'吉林'),(9,'黑龙江'),(10,'江苏'),(11,'浙江'),(12,'安徽'),(13,'福建'),(14,'江西'),(15,'山东'),(16,'河南'),(17,'湖北(武汉)'),(18,'湖北(其他地区)'),(19,'湖南'),(20,'广东'),(21,'甘肃'),(22,'四川'),(23,'贵州'),(24,'海南'),(25,'云南'),(26,'青海'),(27,'陕西'),(28,'广西'),(29,'西藏'),(30,'宁夏'),(31,'新疆'),(32,'内蒙'),(35,'大陆以外（香港）'),(36,'大陆以外（澳门）'),(37,'大陆以外（台湾）'),(38,'大陆以外（其他国家地区）');
/*!40000 ALTER TABLE `com_provincial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_dep`
--

DROP TABLE IF EXISTS `org_dep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_dep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL,
  `dep_name` varchar(100) NOT NULL,
  `level` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(100) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_dep`
--

LOCK TABLES `org_dep` WRITE;
/*!40000 ALTER TABLE `org_dep` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_dep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_tag`
--

DROP TABLE IF EXISTS `org_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(100) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_tag`
--

LOCK TABLES `org_tag` WRITE;
/*!40000 ALTER TABLE `org_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_tag_admin`
--

DROP TABLE IF EXISTS `org_tag_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_tag_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(100) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_tag_admin`
--

LOCK TABLES `org_tag_admin` WRITE;
/*!40000 ALTER TABLE `org_tag_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_tag_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_tag_user`
--

DROP TABLE IF EXISTS `org_tag_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_tag_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `userID` varchar(100) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(100) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_tag_user`
--

LOCK TABLES `org_tag_user` WRITE;
/*!40000 ALTER TABLE `org_tag_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_tag_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_user_info_company`
--

DROP TABLE IF EXISTS `org_user_info_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_user_info_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cor_id` int(11) NOT NULL COMMENT '机构id',
  `cor_name` varchar(100) NOT NULL COMMENT '机构名称',
  `userID` varchar(100) NOT NULL COMMENT '用户标识',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `school` varchar(100) DEFAULT NULL COMMENT '学院',
  `grade` varchar(20) DEFAULT NULL COMMENT '年级',
  `source_place` varchar(30) DEFAULT NULL COMMENT '生源地',
  `telphone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `is_left_bj` varchar(10) DEFAULT NULL COMMENT '是否离京',
  `left_date` varchar(10) DEFAULT NULL COMMENT '离开日期',
  `left_transport` varchar(20) DEFAULT NULL COMMENT '离开使用交通工具',
  `left_transport_info` varchar(100) DEFAULT NULL COMMENT '具体交通信息',
  `goto_hubei` varchar(20) DEFAULT NULL COMMENT '去湖北情况',
  `goto_hubei_date1` varchar(10) DEFAULT NULL COMMENT '湖北日期起',
  `goto_hubei_date2` varchar(10) DEFAULT NULL COMMENT '湖北日期止',
  `goto_hubei_info` varchar(1000) DEFAULT NULL COMMENT '去湖北详情',
  `is_touch_hubei_person` varchar(10) DEFAULT NULL COMMENT '是否接触过湖北地区活动的人员',
  `touch_hubei_date1` varchar(10) DEFAULT NULL COMMENT '接触时间1',
  `touch_hubei_date2` varchar(10) DEFAULT NULL COMMENT '接触时间2',
  `is_return` varchar(50) DEFAULT NULL COMMENT '是否返京',
  `return_date` varchar(10) DEFAULT NULL COMMENT '返京日期',
  `return_transport` varchar(50) DEFAULT NULL COMMENT '交通工具',
  `return_transport_info` varchar(100) DEFAULT NULL COMMENT '交通工具详细信息',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP',
  `agent` varchar(500) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_user_info_company`
--

LOCK TABLES `org_user_info_company` WRITE;
/*!40000 ALTER TABLE `org_user_info_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_user_info_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_user_info_school`
--

DROP TABLE IF EXISTS `org_user_info_school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_user_info_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cor_id` int(11) NOT NULL COMMENT '机构id',
  `cor_name` varchar(100) NOT NULL COMMENT '机构名称',
  `userID` varchar(100) NOT NULL COMMENT '用户标识',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `school` varchar(100) DEFAULT NULL COMMENT '学院',
  `grade` varchar(20) DEFAULT NULL COMMENT '年级',
  `source_place` varchar(30) DEFAULT NULL COMMENT '生源地',
  `telphone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `is_left_bj` varchar(10) DEFAULT NULL COMMENT '是否离京',
  `left_date` varchar(10) DEFAULT NULL COMMENT '离开日期',
  `left_transport` varchar(20) DEFAULT NULL COMMENT '离开使用交通工具',
  `left_transport_info` varchar(100) DEFAULT NULL COMMENT '具体交通信息',
  `goto_hubei` varchar(20) DEFAULT NULL COMMENT '去湖北情况',
  `goto_hubei_date1` varchar(10) DEFAULT NULL COMMENT '湖北日期起',
  `goto_hubei_date2` varchar(10) DEFAULT NULL COMMENT '湖北日期止',
  `goto_hubei_info` varchar(1000) DEFAULT NULL COMMENT '去湖北详情',
  `is_touch_hubei_person` varchar(10) DEFAULT NULL COMMENT '是否接触过湖北地区活动的人员',
  `touch_hubei_date1` varchar(10) DEFAULT NULL COMMENT '接触时间1',
  `touch_hubei_date2` varchar(10) DEFAULT NULL COMMENT '接触时间2',
  `is_return` varchar(50) DEFAULT NULL COMMENT '是否返京',
  `return_date` varchar(10) DEFAULT NULL COMMENT '返京日期',
  `return_transport` varchar(50) DEFAULT NULL COMMENT '交通工具',
  `return_transport_info` varchar(100) DEFAULT NULL COMMENT '交通工具详细信息',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP',
  `agent` varchar(500) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_user_info_school`
--

LOCK TABLES `org_user_info_school` WRITE;
/*!40000 ALTER TABLE `org_user_info_school` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_user_info_school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_whitelist`
--

DROP TABLE IF EXISTS `org_whitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL COMMENT '机构id',
  `userID` varchar(100) CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL COMMENT '用户标识',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `gender` varchar(10) DEFAULT NULL COMMENT '性别',
  `sub1_department_id` int(10) DEFAULT NULL COMMENT '一级子部门id',
  `sub2_department_id` int(10) DEFAULT NULL COMMENT '二级子部门',
  `tag1` varchar(100) DEFAULT NULL COMMENT '类型1（学生类型）',
  `tag2` varchar(100) DEFAULT NULL,
  `tag3` varchar(100) DEFAULT NULL,
  `tag4` varchar(100) DEFAULT NULL,
  `add_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `add_remark` varchar(200) NOT NULL COMMENT '添加备注',
  `dep_name` varchar(100) DEFAULT NULL COMMENT '用户录入数据，为了便于核对',
  `report_id` int(11) DEFAULT '0' COMMENT '报告编号',
  `report_date` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后报告时间',
  `status` int(10) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_whitelist`
--

LOCK TABLES `org_whitelist` WRITE;
/*!40000 ALTER TABLE `org_whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_whitelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `corpname` varchar(200) NOT NULL COMMENT '单位名称',
  `corpname_full` varchar(200) NOT NULL,
  `access_type` varchar(10) DEFAULT 'mp' COMMENT 'mp 小程序   qw 企业微信',
  `template_code` varchar(50) NOT NULL COMMENT '单位模板',
  `corp_code` varchar(100) NOT NULL COMMENT '单位编号',
  `type_corpname` varchar(100) NOT NULL COMMENT '公司名称/学校名称',
  `type_username` varchar(100) NOT NULL COMMENT '学号/职工号等内容提示语',
  `admin_name` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(1000) DEFAULT NULL,
  `add_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `编码唯一` (`corp_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'缺省学校名称','缺省学校名称','mp','default','100000001','学校','学号',NULL,NULL,0,0,NULL,'2020-02-22 21:47:18'),(2,'缺省公司名称','缺省公司名称','mp','company','100000002','单位','职工号',NULL,NULL,0,0,NULL,'2020-02-22 21:47:53');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_record_company`
--

DROP TABLE IF EXISTS `report_record_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_record_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `wxuid` int(11) DEFAULT NULL COMMENT '微信小程序用户id',
  `org_id` int(11) DEFAULT NULL COMMENT '机构id',
  `org_name` varchar(100) DEFAULT NULL COMMENT '机构名称',
  `userID` varchar(100) DEFAULT NULL COMMENT '用户标识码',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `is_return_school` int(11) NOT NULL COMMENT '	是否返校（选项值）',
  `return_dorm_num` varchar(255) DEFAULT NULL COMMENT '所在宿舍号',
  `return_time` date DEFAULT NULL COMMENT '返校时间（Unix时间戳-UTC时间）',
  `return_district_value` int(11) DEFAULT NULL COMMENT '从哪里返回学校（行政区划字典值）',
  `return_district_path` varchar(255) DEFAULT NULL COMMENT '从哪里返回学校（从上级到下级按逗号分隔的字典值）',
  `return_traffic_info` varchar(4000) DEFAULT NULL COMMENT '返校过程的交通信息',
  `current_district_value` int(11) DEFAULT NULL COMMENT '目前所在地',
  `current_district_path` varchar(255) DEFAULT NULL COMMENT '目前所在地（从上级到下级按逗号分隔的字典值）',
  `current_health_value` int(11) DEFAULT NULL COMMENT '目前本人身体状况（选项值）',
  `current_contagion_risk_value` int(11) DEFAULT NULL COMMENT '被传染风险（选项值）',
  `current_temperature` float DEFAULT NULL COMMENT '当前体温（摄氏度）',
  `psy_status` int(11) DEFAULT NULL,
  `psy_demand` int(11) DEFAULT NULL,
  `psy_knowledge` int(11) DEFAULT NULL,
  `return_company_date` varchar(100) DEFAULT NULL,
  `plan_company_date` varchar(100) DEFAULT NULL,
  `template_code` varchar(100) DEFAULT NULL,
  `remarks` varchar(4000) DEFAULT NULL COMMENT '其它信息',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_record_company`
--

LOCK TABLES `report_record_company` WRITE;
/*!40000 ALTER TABLE `report_record_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_record_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_record_default`
--

DROP TABLE IF EXISTS `report_record_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_record_default` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `wxuid` int(11) DEFAULT NULL COMMENT '微信小程序用户id',
  `org_id` int(11) DEFAULT NULL COMMENT '机构id',
  `org_name` varchar(100) DEFAULT NULL COMMENT '机构名称',
  `userID` varchar(100) DEFAULT NULL COMMENT '用户标识码',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `is_return_school` int(11) NOT NULL COMMENT '	是否返校（选项值）',
  `return_dorm_num` varchar(255) DEFAULT NULL COMMENT '所在宿舍号',
  `return_time` date DEFAULT NULL COMMENT '返校时间（Unix时间戳-UTC时间）',
  `return_district_value` int(11) DEFAULT NULL COMMENT '从哪里返回学校（行政区划字典值）',
  `return_district_path` varchar(255) DEFAULT NULL COMMENT '从哪里返回学校（从上级到下级按逗号分隔的字典值）',
  `return_traffic_info` varchar(4000) DEFAULT NULL COMMENT '返校过程的交通信息',
  `current_district_value` int(11) DEFAULT NULL COMMENT '目前所在地',
  `current_district_path` varchar(255) DEFAULT NULL COMMENT '目前所在地（从上级到下级按逗号分隔的字典值）',
  `current_health_value` int(11) DEFAULT NULL COMMENT '目前本人身体状况（选项值）',
  `current_contagion_risk_value` int(11) DEFAULT NULL COMMENT '被传染风险（选项值）',
  `current_temperature` float DEFAULT NULL COMMENT '当前体温（摄氏度）',
  `psy_status` int(11) DEFAULT NULL,
  `psy_demand` int(11) DEFAULT NULL,
  `psy_knowledge` int(11) DEFAULT NULL,
  `return_company_date` varchar(100) DEFAULT NULL,
  `plan_company_date` varchar(100) DEFAULT NULL,
  `template_code` varchar(100) DEFAULT NULL,
  `remarks` varchar(4000) DEFAULT NULL COMMENT '其它信息',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_record_default`
--

LOCK TABLES `report_record_default` WRITE;
/*!40000 ALTER TABLE `report_record_default` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_record_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_template`
--

DROP TABLE IF EXISTS `report_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `is_visable` int(11) NOT NULL DEFAULT '0',
  `is_del` int(11) NOT NULL DEFAULT '0',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_template`
--

LOCK TABLES `report_template` WRITE;
/*!40000 ALTER TABLE `report_template` DISABLE KEYS */;
INSERT INTO `report_template` VALUES (1,'高校缺省模板','default','高校缺省',1,0,'2020-03-01 13:29:25'),(2,'公司缺省模板','company','公司缺省',1,0,'2020-03-01 13:30:02');
/*!40000 ALTER TABLE `report_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_mp_bind_info`
--

DROP TABLE IF EXISTS `wx_mp_bind_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wx_mp_bind_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL COMMENT 'department_id',
  `wx_uid` int(11) NOT NULL COMMENT 'weixin_id',
  `username` varchar(100) NOT NULL COMMENT '用户唯一表示',
  `isbind` int(11) NOT NULL DEFAULT '1' COMMENT '是否绑定',
  `bind_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `unbind_date` datetime DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wx_mp_bind_info`
--

LOCK TABLES `wx_mp_bind_info` WRITE;
/*!40000 ALTER TABLE `wx_mp_bind_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_mp_bind_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_mp_log`
--

DROP TABLE IF EXISTS `wx_mp_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wx_mp_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wx_mp_log`
--

LOCK TABLES `wx_mp_log` WRITE;
/*!40000 ALTER TABLE `wx_mp_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_mp_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_mp_user`
--

DROP TABLE IF EXISTS `wx_mp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wx_mp_user` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(512) DEFAULT NULL,
  `token` varchar(200) NOT NULL,
  `time_out` int(11) NOT NULL,
  `session_key` varchar(512) DEFAULT NULL,
  `nickname` varchar(512) DEFAULT NULL,
  `gender` varchar(512) DEFAULT NULL,
  `city` varchar(512) DEFAULT NULL,
  `avatar_url` varchar(512) DEFAULT NULL,
  `login_time` varchar(512) DEFAULT NULL,
  `userid` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone_num` varchar(30) DEFAULT NULL,
  `reg_date` date DEFAULT NULL COMMENT '注册时间',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`wid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wx_mp_user`
--

LOCK TABLES `wx_mp_user` WRITE;
/*!40000 ALTER TABLE `wx_mp_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_mp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_qy_access_token`
--

DROP TABLE IF EXISTS `wx_qy_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wx_qy_access_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` varchar(20) NOT NULL,
  `access_token` varchar(300) NOT NULL,
  `expires_in` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wx_qy_access_token`
--

LOCK TABLES `wx_qy_access_token` WRITE;
/*!40000 ALTER TABLE `wx_qy_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_qy_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_qy_log`
--

DROP TABLE IF EXISTS `wx_qy_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wx_qy_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(300) NOT NULL,
  `response` varchar(3300) NOT NULL,
  `type` varchar(100) NOT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `agent` varchar(1000) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wx_qy_log`
--

LOCK TABLES `wx_qy_log` WRITE;
/*!40000 ALTER TABLE `wx_qy_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_qy_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-06  9:08:48
