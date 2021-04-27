/*
 Navicat Premium Data Transfer

 Source Server         : yuan
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : travel

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 25/04/2021 12:26:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bookhotel
-- ----------------------------
DROP TABLE IF EXISTS `bookhotel`;
CREATE TABLE `bookhotel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userId` int(11) NOT NULL,
  `hotelId` int(11) NOT NULL,
  `liveTime` date NOT NULL,
  `leaveTime` date NOT NULL,
  `peopleCount` int(11) NOT NULL,
  `price` double NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `payType` int(11) NOT NULL DEFAULT 0,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `num`(`num`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `hotelId`(`hotelId`) USING BTREE,
  CONSTRAINT `bookhotel_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bookhotel_ibfk_2` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookhotel
-- ----------------------------
INSERT INTO `bookhotel` VALUES (1, 'd3faac9a5bce4b7eab321693a99791f4', 1, 2, '2021-04-27', '2021-04-28', 1, 137, 0, 0, '2021-04-27 19:03:29');
INSERT INTO `bookhotel` VALUES (2, '81e578232e304b1c9139241f13960237', 1, 12, '2021-04-27', '2021-04-30', 3, 438, 0, 0, '2021-04-27 19:03:29');
INSERT INTO `bookhotel` VALUES (3, '0a4b382513fe4c64bfcec61c0dec2ec7', 1, 8, '2021-05-02', '2021-05-05', 2, 2994, 0, 0, '2021-04-27 19:03:29');
INSERT INTO `bookhotel` VALUES (4, 'd9dc252ed81046d9b55376d16d8ee355', 1, 11, '2021-04-27', '2021-04-29', 3, 760, 0, 0, '2021-04-27 19:03:29');
INSERT INTO `bookhotel` VALUES (5, '81a2b8d62b1e4231abd840fc8f16bb4d', 1, 3, '2021-05-03', '2021-05-05', 4, 270, 0, 0, '2021-04-27 19:03:29');
-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chinese` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `english` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createTime` date NOT NULL,
  `carDesc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (1, '中国', 'China', '2021-05-01', '我醉在这里，不止为酒', '../../images/carousel/zhongguo.jpg');
INSERT INTO `carousel` VALUES (2, '日本', 'Japan', '2021-05-01', '与山明水秀的风土相得益彰', '../../images/carousel/riben.jpg');
INSERT INTO `carousel` VALUES (3, '济州岛', 'Jizhou Island', '2021-05-01', '三级海风偶有雨', '../../images/carousel/jizhou.jpeg');
INSERT INTO `carousel` VALUES (4, '梅里雪山', 'Meri Snow Mountain', '2021-05-01', '这是属于我的梅里往事', '../../images/carousel/meri.jpeg');
INSERT INTO `carousel` VALUES (5, '贝尔加湖', 'Baikal lake', '2021-05-01', '贝加尔湖畔❄️ 邂逅蓝冰 | 那些很冒险的梦，我们一起去疯', '../../images/carousel/baikal.jpeg');
INSERT INTO `carousel` VALUES (6, '西安', 'Xian', '2021-05-01', '古今明月曾照我，相逢有缘与长安', '../../images/carousel/xian.jpeg');

-- ----------------------------
-- Table structure for cates
-- ----------------------------
DROP TABLE IF EXISTS `cates`;
CREATE TABLE `cates`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `catesDesc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `destId` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `name_2`(`name`) USING BTREE,
  INDEX `destId`(`destId`) USING BTREE,
  CONSTRAINT `cates_ibfk_1` FOREIGN KEY (`destId`) REFERENCES `destination` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cates
-- ----------------------------
INSERT INTO `cates` VALUES (1, '和萌牛肉牛肠日式炭烧', '../../images/cate/cate_1.jpg', '中山北路417号', '牛肉', 3);
INSERT INTO `cates` VALUES (2, '哥老官重庆美蛙鱼头', '../../images/cate/cate_2.jpg', '上城区吴山商圈红门局1号', '火锅，牛肚', 3);
INSERT INTO `cates` VALUES (3, '川川川•大川先生', '../../images/cate/cate_4.jpg', '莫干山路763号', '大川火锅、大川麻辣鱼、大川五味虾', 3);
INSERT INTO `cates` VALUES (4, '聚乐园', '../../images/cate/cate_3.jpg', '下城区河东路151号', '松鼠桂鱼', 3);
INSERT INTO `cates` VALUES (5, '西安饭庄', '../../images/cate/cate_5.jpg', '繁华市区－东大街', '葫芦鸡', 4);
INSERT INTO `cates` VALUES (6, '西安烤鸭店', '../../images/cate/cate_6.jpg', '高新区高新一路40号', '烤鸭', 4);
INSERT INTO `cates` VALUES (7, '清真·定家小酥肉', '../../images/cate/cate_7.jpg', '回民街', '小酥肉', 4);
INSERT INTO `cates` VALUES (8, '陕拾叁', '../../images/cate/cate_8.jpg', '鼓楼', '甜品，冰激凌', 4);
INSERT INTO `cates` VALUES (9, '椰语堂', '../../images/cate/cate_9.jpg', '海坡开发区三亚湾路国光滨海花园负二层', '清凉补', 1);
INSERT INTO `cates` VALUES (10, '人字拖茶饮', '../../images/cate/cate_10.jpg', '解放路明珠七楼', '柠檬，水果茶', 1);
INSERT INTO `cates` VALUES (11, '成都吃客', '../../images/cate/cate_11.jpg', '成都', '糖醋排骨，特色烤鱼片，捞汁花甲', 2);
INSERT INTO `cates` VALUES (12, '豪虾传龙虾馆', '../../images/cate/cate_12.jpg', '下东大街段36号附37号', '龙虾', 2);
INSERT INTO `cates` VALUES (13, '林氏鱼丸', '../../images/cate/cate_13.jpg', '思明区曾厝垵国办街曾厝垵社178号', '鱼丸', 6);
INSERT INTO `cates` VALUES (14, '巷深扁食店', '../../images/cate/cate_14.jpg', '思明区教堂街172号', '馄饨，云吞', 6);
INSERT INTO `cates` VALUES (15, '千贺酒馆烧烤', '../../images/cate/cate_15.jpg', '道里区哈药路110号', '烧烤', 5);

-- ----------------------------
-- Table structure for destination
-- ----------------------------
DROP TABLE IF EXISTS `destination`;
CREATE TABLE `destination`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `href` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `destiDesc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of destination
-- ----------------------------
INSERT INTO `destination` VALUES (1, '三亚', '/travel/destination/sanya', '../../images/destination/sanya.jpg', '三亚是具有热带海滨风景特色的国际旅游城市  ，又被称为“东方夏威夷”。三亚也是同时入选中国特色魅力城市200强及世界特色魅力城市200强。', 1);
INSERT INTO `destination` VALUES (2, '成都', '/travel/destination/chengdu', '../../images/destination/chengdu.jpg', '成都是全国十大古都和首批国家历史文化名城  ，古蜀文明发祥地  。境内金沙遗址有3000年历史   ，周太王以“一年成聚，二年成邑，三年成都”   ，故名成都  ', 1);
INSERT INTO `destination` VALUES (3, '杭州', '/travel/destination/hangzhou', '../../images/destination/hangzhou.jpg', '杭州人文古迹众多，西湖及其周边有大量的自然及人文景观遗迹，具代表性的有西湖文化、良渚文化、丝绸文化、茶文化，以及流传下来的许多故事传说', 1);
INSERT INTO `destination` VALUES (4, '西安', '/travel/destination/xian', '../../images/destination/xian.jpg', '西安是中国最佳旅游目的地、中国国际形象最佳城市之一   ，有两项六处遗产被列入《世界遗产名录》, 是联合国教科文组织于1981年确定的“世界历史名城”', 1);
INSERT INTO `destination` VALUES (5, '哈尔滨', '/travel/destination/haerbin', '../../images/destination/haerbin.jpg', '哈尔滨是国家历史文化名城，是“一国两朝”发祥地，是热点旅游城市和国际冰雪文化名城，素有“冰城”“东方莫斯科”“东方小巴黎”之称。', 1);
INSERT INTO `destination` VALUES (6, '厦门', '/travel/destination/xiamen', '../../images/destination/xiamen.jpg', '厦门是东南沿海重要的中心城市、港口及风景旅游城市，2020年1月22日，被住房和城乡建设部命名为国家生态园林城市', 1);
INSERT INTO `destination` VALUES (10, '张家界', '/travel/destination/zhangjiajie', '../../images/destination/zhangjiajie.jpg', '俗话说“九寨沟看水，张家界看山”。武陵源核心景区中三千座石峰拨地而起，八百条溪流蜿蜒曲折，来张家界旅游观光的人，无不被武陵源奇特的砂岩峰林地貌和壮丽的喀斯特景观所倾倒，仿佛置身于神山仙境之中，故而张家界有“中国山水画的原本”、“缩小的仙境，放大的盆景”的美誉。2010年首部3D电影《阿凡达》，更是让其中的电影取景地——张家界的美景享誉世界。', 0);
INSERT INTO `destination` VALUES (11, '长沙', '/travel/destination/changsha', '../../images/destination/changsha.jpg', '长沙是湖南省省会，山清水秀、气候宜人，有风景独秀“霜叶红于二月花”的岳麓山，有水洲相拥“春来江水绿如蓝”的湘江；有在海内外享有盛名的“世界第八大奇迹”马王堆汉墓、“千年学府”岳麓书院及“三国东吴”简牍。古有云：“惟楚有才，于斯为盛”，在中国近现代史上，长沙更涌现了一批著名的政治家、军事家和文学家。这座有着2000余年悠久文化历史的古城，早在春秋时期，就是楚国雄踞南方的战略要地之一。', 0);
INSERT INTO `destination` VALUES (12, '凤凰古城', '/travel/destination/fenghuanggucheng', '../../images/destination/fenghuanggucheng.jpg', '气势磅礴的古城墙、整齐划一的吊脚楼、青灰光滑的石板路、沱江边的苗家少女……这些是凤凰古城给人的第一印象。凤凰位于湖南湘西，是一座以苗族、土家族为主的少数民族聚集县，这里历史悠久，曾经被称作“蛮夷之地”，然而一部《边城》将这座古城推向了全世界。', 0);

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` float NOT NULL,
  `foodDesc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `url`(`url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES (1, '龙井虾仁', 68.8, '龙井虾仁将茶饮与虾仁融合，整体清新软嫩，虾仁玉白，鲜嫩，芽叶清香，色泽雅丽，虾中有茶香，茶中有虾鲜，食后清口开胃，回味无穷', '../../images/food/food_1.jpg');
INSERT INTO `food` VALUES (2, '西湖醋鱼', 38.8, '西湖醋鱼主以草鱼等食材用料烹制，色泽红亮，肉质鲜嫩，酸甜清香，口感软嫩，带有蟹味', '../../images/food/food_2.jpg');
INSERT INTO `food` VALUES (3, '东坡肉', 28.8, '东坡肉的主料和造型大同小异，主料都是半肥半瘦的猪肉，成品菜都是码得整整齐齐的麻将块儿，红得透亮，色如玛瑙，夹起一块尝尝，软而不烂，肥而不腻。', '../../images/food/food_3.jpg');
INSERT INTO `food` VALUES (4, '鱼头豆腐', 16.5, '鱼头豆腐是由鱼头、豆腐等主要食材做成的一道菜品，属于苏菜。沙锅鱼头豆腐是浙江杭州著名的菜肴之一。鱼头豆腐，味道鲜美，营养价值非常丰富。', '../../images/food/food_4.jpg');
INSERT INTO `food` VALUES (5, '牛羊肉泡馍', 16.5, '牛羊肉泡馍是陕西的风味美馔，尤以西安最享盛名。', '../../images/food/food_5.jpg');
INSERT INTO `food` VALUES (6, '肉夹馍', 12, '其馍外观焦黄，条纹清晰，内部呈层状，饼体发胀，皮酥里嫩，火功到家，食用时温度以烫手为佳', '../../images/food/food_6.jpg');
INSERT INTO `food` VALUES (7, '担担面', 9.8, '成菜面条细薄，卤汁酥香，咸鲜微辣，香气扑鼻，十分入味。', '../../images/food/food_7.jpg');
INSERT INTO `food` VALUES (8, '冒菜', 28.8, '冒菜是一道以肉类、豆制品、青菜、海鲜、菌菇类作为主要食材制作而成的菜品', '../../images/food/food_8.jpg');
INSERT INTO `food` VALUES (9, '夫妻肺片', 16.8, '夫妻肺片是四川省成都市的一道传统名菜，属于川菜系', '../../images/food/food_9.jpg');
INSERT INTO `food` VALUES (10, '哈尔滨熏鸡', 39.8, '东北天气比较冷，熏制作食品较多，哈尔滨熏鸡是哈尔滨的一大特色美食。', '../../images/food/food_10.jpg');
INSERT INTO `food` VALUES (11, '和乐蟹', 22.5, '其膏满肉肥为其它蟹种罕见，特别是脂膏，金黄油亮，如咸鸭蛋黄，富含营养。', '../../images/food/food_11.jpg');
INSERT INTO `food` VALUES (12, '清凉补', 8.8, '清补凉被誉为“舌尖上的清凉”。曾被苏轼誉为“椰树之上采琼浆，捧来一碗白玉香”', '../../images/food/food_12.jpg');
INSERT INTO `food` VALUES (13, '椰子饭', 13.8, '椰子饭是一种极为独特的食品，是由海南优质糯米、天然椰肉和椰汁一同蒸熟而成，是海南传统农家小吃。', '../../images/food/food_13.jpg');
INSERT INTO `food` VALUES (14, '文昌鸡', 49.8, '具有皮薄嫩滑、肉味馥香的特点。', '../../images/food/food_14.jpg');
INSERT INTO `food` VALUES (15, '桂花糖', 22.5, '桂花糖是一种甜点，中国传统名点。', '../../images/food/food_15.jpg');
INSERT INTO `food` VALUES (16, '蚵仔煎', 16.8, '是一道常见的家常菜，起源于福建泉州，是福建沿海，台湾，潮汕等地区经典的传统小吃之一。', '../../images/food/food_16.jpg');

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `english` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hotelDesc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `destId` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `destId`(`destId`) USING BTREE,
  CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`destId`) REFERENCES `destination` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES (1, '三亚哈曼度假酒店', 'Harman Hotel Sanya', '酒店离机场半小时车程，位于大东海的黄金地段', '大东海旅游度假区榆亚路136号', 499, '../../images/hotel/hotel_1.jpg', 1);
INSERT INTO `hotel` VALUES (2, '三亚康年酒店', 'Sanya Conifer Resort', '酒店拥有1200㎡顶层无边际，独特刺激的70米高空悬挑透明泳池，尽享南中国海迷人海景，以及舒适的室内恒温泳池', '三亚湾路189号', 670, '../../images/hotel/hotel_2.jpg', 1);
INSERT INTO `hotel` VALUES (3, '三亚情景海湾海景度假酒店式公寓', 'Haixiang Seaview Holiday Apartment', '公寓所处小区内部有泳池、健身设施、儿童乐园等公共设施，居家旅行皆宜，给您带来温馨的家居式海滨度假体验。', '三亚湾路蓝色海岸小区E栋1单元203', 148, '../../images/hotel/hotel_3.jpg', 1);
INSERT INTO `hotel` VALUES (4, '杭州马可波罗滨湖酒店', 'Merchant Marco Edgelake Hotel', '酒店设空中花园，让您可沐浴“吴山天风”，远眺“三潭印月”，冬赏“断桥残雪”，夏寻“曲院风荷”', '浣纱路99号', 571, '../../images/hotel/hotel_4.jpg', 3);
INSERT INTO `hotel` VALUES (5, '维也纳国际酒店', 'Vienna International Hotel', '距离地铁1号线西湖文化广场站约200米，毗邻西湖名胜风景区、吴山广场美食街和胜利河美食街', '文晖路348号金鹰大厦', 266, '../../images/hotel/hotel_5.jpg', 3);
INSERT INTO `hotel` VALUES (6, '杭州西湖柳莺里酒店', 'Hangzhou West Lake Liuyingli Hotel', '与“三潭印月”隔湖相望，“柳浪闻莺”隔墙相邻', '南山路清波桥河下6号', 1047, '../../images/hotel/hotel_6.jpg', 3);
INSERT INTO `hotel` VALUES (7, '全季酒店', 'Ji Hotel', '全季酒店（杭州西湖店）的客房舒适整洁，更有景观房可以观赏保俶塔及西湖的优美精致，是您商务、休闲、旅游的上佳选择。', '武林路76号', 290, '../../images/hotel/hotel_7.jpg', 3);
INSERT INTO `hotel` VALUES (8, '艾斯汀酒店', 'Aisiting Hotel', '酒店整体风格将古典奢华融合现代简约风格，以波普文化为一体的主题式酒店', ' 东大街大差市十字万达新天地1号楼', 303, '../../images/hotel/hotel_8.jpg', 4);
INSERT INTO `hotel` VALUES (9, '锦江之星', 'Jinjiang Inn', '酒店位于市中心钟鼓广场西北侧。地处市中心黄金地段', '社会路1号', 198, '../../images/hotel/hotel_9.jpg', 4);
INSERT INTO `hotel` VALUES (10, '厦门良栖居', 'Xiamen micro  hotel', '客房舒适整洁，以蓝、白为主色调的简约风，感受大海般的清爽与宁静', '黄厝村塔头社6号', 216, '../../images/hotel/hotel_10.jpg', 6);
INSERT INTO `hotel` VALUES (11, '鼓浪屿聆感末凡酒店', 'Yueya Kongqu Music Boutique Hotel Gulangyu', '鼓浪屿末凡酒店位于鼓浪屿复兴路，分别始建于 1928 年,1908年，为鼓浪屿历史风貌建筑之一', '鼓浪屿复兴路86号', 384, '../../images/hotel/hotel_11.jpg', 6);
INSERT INTO `hotel` VALUES (12, '雪谷丁子涵时尚家庭旅馆', 'Xuegu Dingzihan Shishang Guest House', '五常雪谷丁子涵时尚家庭旅馆地处五常市山河屯林业局、中国雪谷，临近龙爪沟，如同银装素裹的冰雪世界，吸引着游人的到来', '山河屯林业局中国雪谷', 20, '../../images/hotel/hotel_12.jpg', 5);

-- ----------------------------
-- Table structure for leaveword
-- ----------------------------
DROP TABLE IF EXISTS `leaveword`;
CREATE TABLE `leaveword`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `routeId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `txt` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `routeId`(`routeId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `leaveword_ibfk_1` FOREIGN KEY (`routeId`) REFERENCES `route` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `leaveword_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of leaveword
-- ----------------------------
INSERT INTO `leaveword` VALUES (1, 1, 1, '这是一条留言测试', '2020-03-07 18:25:09');
INSERT INTO `leaveword` VALUES (2, 1, 5, '再见了，魅力杭州', '2021-04-21 16:08:59');
INSERT INTO `leaveword` VALUES (3, 2, 7, '西安是一座历史古城', '2021-04-21 19:23:57');
INSERT INTO `leaveword` VALUES (4, 3, 11, '玉龙雪山真好玩！！！！！！！！！', '2021-04-21 19:24:45');
INSERT INTO `leaveword` VALUES (6, 2, 5, '这条路线很好，我很喜欢', '2021-04-21 16:11:23');
INSERT INTO `leaveword` VALUES (7, 2, 12, '真棒!!!!!!!', '2021-04-21 16:11:36');
INSERT INTO `leaveword` VALUES (12, 2, 1, '留言成功', '2021-04-21 16:12:09');
INSERT INTO `leaveword` VALUES (14, 3, 1, '冰川公园海拔较高且温度较低，所以上山前要做好防寒和防高原反应的准备', '2021-04-21 16:12:34');
INSERT INTO `leaveword` VALUES (15, 3, 4, '建议返回丽江古城住宿，五一街是一条充满小资情调的街巷，各种特色小店、咖啡吧、文艺气息浓郁，建议选择该区域入住。', '2021-04-21 16:13:43');
INSERT INTO `leaveword` VALUES (16, 3, 6, '云端精品度假庭院（丽江纳西风情店）同样位于五一街，客栈是根据纳西传统四合院进行装修和布置，保留了纳西小院的特有风格，房间全部采用纳西雕花实木式家具，庭院更有假山流水摇椅凉亭。', '2021-04-21 16:14:03');
INSERT INTO `leaveword` VALUES (17, 3, 1, '啦啦啦啦', '2021-04-21 16:14:16');
INSERT INTO `leaveword` VALUES (19, 1, 1, '去杭州的人一定会去一次西湖，所以要选择离西湖稍微近点的地方', '2021-04-21 16:14:32');
INSERT INTO `leaveword` VALUES (20, 1, 10, '去杭州玩的时候，一定要先做足攻略', '2021-04-21 16:16:34');
INSERT INTO `leaveword` VALUES (21, 1, 4, '夜晚的西湖特别美', '2021-04-21 16:17:53');
INSERT INTO `leaveword` VALUES (22, 1, 6, '已到过杭州五次，著名景点都曾驻足，第六次决定去博物馆。杭州自古人杰地灵，是我国七大古都之一，一定有很多有趣的东东值得一看。', '2021-04-21 16:19:25');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `routeId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `orderTime` datetime(0) NULL DEFAULT NULL,
  `reserveTime` date NOT NULL,
  `adult` int(11) NOT NULL,
  `child` int(11) NOT NULL,
  `totalPrice` double NOT NULL,
  `orderStatus` int(11) NOT NULL DEFAULT 0,
  `payType` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderNum`(`orderNum`) USING BTREE,
  INDEX `routeId`(`routeId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`routeId`) REFERENCES `route` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 'beb77e0e9c72406792afe02b4079b26e', 1, 1, '2021-04-21 16:24:10', '2021-05-01', 1, 0, 5999, 0, 0);
INSERT INTO `orders` VALUES (2, 'e58aa8a0009b48b7aab4d1031e176590', 1, 1, '2021-04-21 16:25:22', '2021-06-18', 1, 0, 6999, 0, 0);
INSERT INTO `orders` VALUES (3, '1c5546f30f4f4a12867f9575de697529', 1, 1, '2021-04-21 16:25:52', '2021-05-01', 2, 0, 11998, 0, 0);
INSERT INTO `orders` VALUES (4, 'c84dee11c6994ef69105e354208675e2', 1, 1, '2021-04-21 16:26:10', '2021-04-21', 2, 1, 14997.5, 0, 0);
INSERT INTO `orders` VALUES (5, 'b4da6816a1ef4ed4b31f4563d30088b9', 1, 1, '2021-04-21 16:34:28', '2021-04-27', 2, 2, 16995.5, 0, 0);
INSERT INTO `orders` VALUES (6, '8a5b529f797a4a3abf0896e09a4c2fda', 1, 2, '2021-04-21 16:34:16', '2021-04-30', 1, 0, 5999, 0, 0);
INSERT INTO `orders` VALUES (7, '9eb83b4e6df74853a8a9908087af9a92', 1, 3, '2021-04-21 16:34:06', '2021-04-27', 1, 0, 4997.5, 0, 0);
INSERT INTO `orders` VALUES (8, 'b62ac082cbdc4486b773e39d51f9453f', 1, 1, '2021-04-21 16:33:54', '2021-05-01', 3, 0, 16998, 0, 0);
INSERT INTO `orders` VALUES (9, 'b7d02ba6c9c44f6bb874d61d62c9ca1e', 2, 1, '2021-04-21 16:33:41', '2021-04-24', 1, 1, 7498.5, 0, 0);
INSERT INTO `orders` VALUES (10, '1f79aadaba7a452da644b2f5ed75ae5f', 3, 1, '2021-04-21 08:33:17', '2021-04-22', 1, 0, 4995, 0, 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleDesc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roleName`(`roleName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ADMIN', '管理员，可以进行一切操作。');
INSERT INTO `role` VALUES (2, 'VIP', '会员，只能进行旅游网站的操作。');
INSERT INTO `role` VALUES (3, 'USER', '游客，只能看看旅游网站。');

-- ----------------------------
-- Table structure for route
-- ----------------------------
DROP TABLE IF EXISTS `route`;
CREATE TABLE `route`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double NOT NULL,
  `time` int(11) NOT NULL,
  `season` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `routeDesc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `heat` int(11) NULL DEFAULT 0,
  `status` int(11) NOT NULL,
  `href` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `Num`(`num`) USING BTREE,
  UNIQUE INDEX `Name`(`name`) USING BTREE,
  UNIQUE INDEX `num_2`(`num`) USING BTREE,
  UNIQUE INDEX `name_2`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of route
-- ----------------------------
INSERT INTO `route` VALUES (1, 'itcast-001', '杭州5日游路线', 4999, 5, '3-4', '杭州、Mar、Apr', 1314, 1, '/travel/route/001');
INSERT INTO `route` VALUES (2, 'itcast-002', '西安7日游线路', 7999, 7, '9-10', '西安、Sept、Oct', 1234, 1, '/travel/route/002');
INSERT INTO `route` VALUES (3, 'itcast-003', '丽江+玉龙雪山4日线路', 3999, 4, '7-10', '丽江、玉龙雪山、Jul、Aug、Sep、Oct', 1208, 0, '');
INSERT INTO `route` VALUES (4, 'itcast-004', '大理3日线路', 1888, 3, '3-4', '大理、Mar、Apr', 666, 0, '');
INSERT INTO `route` VALUES (5, 'itcast-005', '厦门经典三日游', 1999, 3, '12-2', '厦门、Dec、Jan、Feb', 1033, 0, '');
INSERT INTO `route` VALUES (6, 'itcast-006', '三亚五日游', 6999, 5, '12-2', '三亚、Dec、Jan、Feb', 666, 0, '');
INSERT INTO `route` VALUES (7, 'itcast-007', '厦门，三亚八日游', 12399, 8, '12-2', '三亚、厦门、Dec、Jan、Feb', 512, 0, '');
INSERT INTO `route` VALUES (8, 'itcast-008', '哈尔滨六日游', 6599, 6, '6-9', '哈尔滨、Jun、Jul、Aug、Sept', 512, 0, '');
INSERT INTO `route` VALUES (9, 'itcast-009', '桂林经典二日游', 1468, 2, '1-3', '桂林、Jan、Feb、Mar', 288, 0, '');
INSERT INTO `route` VALUES (10, 'itcast-010', '昆明4日城市经典路线', 2899, 5, '1-12', '昆明、Jan、Feb、Mar、Apr、May、Jun、Jul、Aug、Sep、Oct、Nov、Dec', 453, 0, '');

-- ----------------------------
-- Table structure for rp
-- ----------------------------
DROP TABLE IF EXISTS `rp`;
CREATE TABLE `rp`  (
  `rid` int(11) NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`rid`, `url`) USING BTREE,
  CONSTRAINT `rp_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `route` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rp
-- ----------------------------
INSERT INTO `rp` VALUES (1, '../../images/rp/rp_1.jpg');
INSERT INTO `rp` VALUES (1, '../../images/rp/rp_2.jpg');
INSERT INTO `rp` VALUES (1, '../../images/rp/rp_3.jpg');
INSERT INTO `rp` VALUES (1, '../../images/rp/rp_4.jpg');
INSERT INTO `rp` VALUES (2, '../../images/rp/rp_5.jpg');
INSERT INTO `rp` VALUES (2, '../../images/rp/rp_6.jpg');
INSERT INTO `rp` VALUES (2, '../../images/rp/rp_7.jpg');
INSERT INTO `rp` VALUES (2, '../../images/rp/rp_8.jpg');
INSERT INTO `rp` VALUES (3, '../../images/rp/rp_10.jpg');
INSERT INTO `rp` VALUES (3, '../../images/rp/rp_11.jpg');
INSERT INTO `rp` VALUES (3, '../../images/rp/rp_12.jpg');
INSERT INTO `rp` VALUES (3, '../../images/rp/rp_9.jpg');
INSERT INTO `rp` VALUES (4, '../../images/rp/rp_13.jpg');
INSERT INTO `rp` VALUES (4, '../../images/rp/rp_14.jpg');
INSERT INTO `rp` VALUES (4, '../../images/rp/rp_15.jpg');
INSERT INTO `rp` VALUES (4, '../../images/rp/rp_16.jpg');
INSERT INTO `rp` VALUES (5, '../../images/rp/rp_17.jpg');
INSERT INTO `rp` VALUES (5, '../../images/rp/rp_18.jpg');
INSERT INTO `rp` VALUES (5, '../../images/rp/rp_19.jpg');
INSERT INTO `rp` VALUES (5, '../../images/rp/rp_20.jpg');
INSERT INTO `rp` VALUES (6, '../../images/rp/rp_21.jpg');
INSERT INTO `rp` VALUES (6, '../../images/rp/rp_22.jpg');
INSERT INTO `rp` VALUES (6, '../../images/rp/rp_23.jpg');
INSERT INTO `rp` VALUES (6, '../../images/rp/rp_24.jpg');
INSERT INTO `rp` VALUES (7, '../../images/rp/rp_25.jpg');
INSERT INTO `rp` VALUES (7, '../../images/rp/rp_26.jpg');
INSERT INTO `rp` VALUES (7, '../../images/rp/rp_27.jpg');
INSERT INTO `rp` VALUES (7, '../../images/rp/rp_28.jpg');
INSERT INTO `rp` VALUES (8, '../../images/rp/rp_29.jpg');
INSERT INTO `rp` VALUES (8, '../../images/rp/rp_30.jpg');
INSERT INTO `rp` VALUES (8, '../../images/rp/rp_31.jpg');
INSERT INTO `rp` VALUES (8, '../../images/rp/rp_32.jpg');
INSERT INTO `rp` VALUES (9, '../../images/rp/rp_33.jpg');
INSERT INTO `rp` VALUES (9, '../../images/rp/rp_34.jpg');
INSERT INTO `rp` VALUES (9, '../../images/rp/rp_35.jpg');
INSERT INTO `rp` VALUES (9, '../../images/rp/rp_36.jpg');
INSERT INTO `rp` VALUES (10, '../../images/rp/rp_37.jpg');
INSERT INTO `rp` VALUES (10, '../../images/rp/rp_38.jpg');
INSERT INTO `rp` VALUES (10, '../../images/rp/rp_39.jpg');
INSERT INTO `rp` VALUES (10, '../../images/rp/rp_40.jpg');

-- ----------------------------
-- Table structure for scenery
-- ----------------------------
DROP TABLE IF EXISTS `scenery`;
CREATE TABLE `scenery`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `openTime` date NOT NULL,
  `price` float NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `destId` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `destId`(`destId`) USING BTREE,
  CONSTRAINT `scenery_ibfk_1` FOREIGN KEY (`destId`) REFERENCES `destination` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scenery
-- ----------------------------
INSERT INTO `scenery` VALUES (1, '天涯海角', '海南省三亚市西南方向23千米处', 'AAAA景区', '2021-04-21', 100, '../../images/scenery/sanya_2.jpg', 1);
INSERT INTO `scenery` VALUES (2, '大小洞天', '海南省三亚市区以西40公里的南山西南隅', 'AAAAA景区', '2021-04-21', 50, '../../images/scenery/sanya_3.jpg', 1);
INSERT INTO `scenery` VALUES (3, '亚龙湾', '海湾距离市中心区约10公里', 'AAAA景区', '2021-04-21', 60, '../../images/scenery/sanya_4.jpg', 1);
INSERT INTO `scenery` VALUES (4, '都江堰', '位于四川省成都市都江堰市城西', 'AAAAA景区', '2021-04-21', 100, '../../images/scenery/chengdu_2.jpg', 2);
INSERT INTO `scenery` VALUES (5, '九寨沟', '阿坝藏族羌族自治州', 'AAAAA景区', '2021-04-21', 30, '../../images/scenery/chengdu_3.jpg', 2);
INSERT INTO `scenery` VALUES (6, '雷峰塔', '杭州市西湖风景区', 'AAAA景区', '2021-04-21', 70, '../../images/scenery/hangzhou_2.jpg', 3);
INSERT INTO `scenery` VALUES (7, '秦始皇陵兵马俑', '西安市临潼区', '世界第八大奇迹', '2021-04-21', 90, '../../images/scenery/xian_2.jpg', 4);
INSERT INTO `scenery` VALUES (8, '大唐不夜城', '西安市雁塔区', '全国示范步行街', '2021-04-21', 10, '../../images/scenery/xian_3.jpg', 4);
INSERT INTO `scenery` VALUES (9, '大雁塔', '西安市雁塔区大慈恩寺内', 'AAAAA景区', '2021-04-21', 30, '../../images/scenery/xian_4.jpg', 4);
INSERT INTO `scenery` VALUES (10, '雪谷', '哈尔滨市', '', '2021-04-21', 10, '../../images/scenery/haerbin_2.jpg', 5);
INSERT INTO `scenery` VALUES (11, '鼓浪屿', '鼓浪屿街道', 'AAAAA景区', '2021-04-21', 200, '../../images/scenery/xiamen_4.jpg', 6);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phoneNum` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '../../images/header/默认头像.jpg',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` int(11) NULL DEFAULT 0,
  `intro` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `phoneNum`(`phoneNum`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'aaaaaaaaaa', '123456', '13600000000', '../../images/header/image_1.jpg', '1', 0, '用户测试', '1111111111@qq.com');
INSERT INTO `user` VALUES (2, 'bbbbbbbbbb', '123456', '13611111111', '../../images/header/image_Z.jpg', '1', 0, '用户测试', '1111111111@qq.com');
INSERT INTO `user` VALUES (3, 'cccccccccc', '123456', '13622222222', '../../images/header/image_Z.jpg', '1', 0, '用户测试', '1111111111@qq.com');
INSERT INTO `user` VALUES (4, 'test1', '123456', '13633333333', '../../images/header/image_2.jpg', '1', 0, NULL, '1111111111@qq.com');
INSERT INTO `user` VALUES (5, 'test01', '123456', '13644444444', '../../images/header/image_3.jpg', '1', 0, '', '1111111111@qq.com');
INSERT INTO `user` VALUES (6, 'test02', '123456', '13655555555', '../../images/header/image_4.jpg', '1', 0, NULL, '1111111111@qq.com');
INSERT INTO `user` VALUES (7, 'test03', '123456', '13666666666', '../../images/header/默认头像.jpg', '1', 0, NULL, '1111111111@qq.com');
INSERT INTO `user` VALUES (9, 'test04', '123456', '13677777777', '../../images/header/默认头像.jpg', '1', 0, NULL, '1111111111@qq.com');
INSERT INTO `user` VALUES (10, 'test05', '123456', '13688888888', '../../images/header/默认头像.jpg', '1', 0, NULL, '1111111111@qq.com');
INSERT INTO `user` VALUES (11, 'test06', '123456', '13699999999', '../../images/header/默认头像.jpg', '1', 0, NULL, '1111111111@qq.com');
INSERT INTO `user` VALUES (12, 'test07', '123456', '13211111111', '../../images/header/默认头像.jpg', '1', 0, NULL, '1111111111@qq.com');
INSERT INTO `user` VALUES (14, 'test08', '123456', '13222222222', '../../images/header/d默认头像.jpg', '1', 0, NULL, '1111111111@qq.com');
INSERT INTO `user` VALUES (16, 'test09', '123456', '13233333333', '../../images/header/默认头像.jpg', '1', 0, NULL, '1111111111@qq.com');
INSERT INTO `user` VALUES (17, 'test10', '123456', '13244444444', '../../images/header/默认头像.jpg', '1', 0, NULL, '1111111111@qq.com');
INSERT INTO `user` VALUES (18, 'test11', '123456', '13255555555', '../../images/header/默认头像.jpg', '1', 0, NULL, '1111111111@qq.com');
INSERT INTO `user` VALUES (19, 'test12', '123456', '13266666666', '../../images/header/默认头像.jpg', '1', 0, NULL, '1111111111@qq.com');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`, `roleId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (2, 1);
INSERT INTO `user_role` VALUES (3, 1);
INSERT INTO `user_role` VALUES (1, 2);
INSERT INTO `user_role` VALUES (2, 2);
INSERT INTO `user_role` VALUES (3, 2);
INSERT INTO `user_role` VALUES (4, 2);
INSERT INTO `user_role` VALUES (5, 2);
INSERT INTO `user_role` VALUES (6, 2);
INSERT INTO `user_role` VALUES (7, 3);
INSERT INTO `user_role` VALUES (9, 3);
INSERT INTO `user_role` VALUES (10, 3);
INSERT INTO `user_role` VALUES (11, 3);
INSERT INTO `user_role` VALUES (12, 3);
INSERT INTO `user_role` VALUES (14, 3);

SET FOREIGN_KEY_CHECKS = 1;
