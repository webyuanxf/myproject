#设置客户端连接服务器使用UTF8字符集
SET NAMES UTF8;
#丢弃数据库xz如果存在的话
DROP DATABASE IF EXISTS qz;
#创建数据库xz使用UTF8字符集
CREATE DATABASE qz CHARSET=UTF8;
#进入数据库qz
USE qz;

/****产品模块相关的表****/
#产品类别表
CREATE TABLE qz_product_type(
    tid INT PRIMARY KEY AUTO_INCREMENT,
    name varchar(32),
    txt varchar(1024)
);

INSERT INTO qz_product_type (tid,name,txt) VALUES(null,'APP开发','APP软件开发指的是手机应用软件的开发与服务。这里的APP指的是应用程序application的意思。APP技术原本是对软件进行加速运算或进行大型科学运算的技术，基于Paas开发平台开发出的APP，直接部署在云环境上，为企业进行集成，形成一种租用云服务的模式。同时，APP技术还可以应用于移动互联网中。在移动时代的大背景下，个人应用率先走进云时代。'),
(null,'网站建设','网站建设是指使用标识语言（markup language)，通过一系列设计、建模、和执行的过程将电子格式的信息通过互联网传输，最终以图形用户界面（GUI）的形式被用户所浏览。简单的信息如文字，图片（GIF，JPEG，PNG）和表格，都可以通过使超文件标示语言、可扩展超文本标记语言等标示语言放置到网站页面上。'),
(null,'平面设计','平面设计（graphic design），也称为视觉传达设计，是以“视觉”作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。平面设计师可能会利用字体排印、视觉艺术、版面（page layout）、电脑软件等方面的专业技巧，来达成创作计划的目的。平面设计通常可指制作（设计）时的过程。');
#产品表
CREATE TABLE qz_product (
    pid INT PRIMARY KEY AUTO_INCREMENT,
    tid INT,
    FOREIGN KEY(tid) REFERENCES qz_product_type(tid),
    title varchar(32),
    isRecommend INT,
    updateTime BIGINT,
    click INT,
    spec varchar(1024)
);
INSERT INTO qz_product (pid,tid,title,isRecommend,updateTime,click,spec) VALUES
(null,1,'手机钱包应用',1,1526472244794,10,'APP软件开发指的是手机应用软件的开发与服务。这里的APP指的是应用程序application的意思。APP技术原本是对软件进行加速运算或进行大型科学运算的技术，基于Paas开发平台开发出的APP，直接部署在云环境上，为企业进行集成，形成一种租用云服务的模式。同时，APP技术还可以应用于移动互联网中。在移动时代的大背景下，个人应用率先走进云时代，基于云平台的企业APP在移动互联网领域迎来了发展良机。'),
(null,1,'股市买卖应用',1,1526472244794,10,'APP软件开发指的是手机应用软件的开发与服务。这里的APP指的是应用程序application的意思。APP技术原本是对软件进行加速运算或进行大型科学运算的技术，基于Paas开发平台开发出的APP，直接部署在云环境上，为企业进行集成，形成一种租用云服务的模式。同时，APP技术还可以应用于移动互联网中。在移动时代的大背景下，个人应用率先走进云时代，基于云平台的企业APP在移动互联网领域迎来了发展良机。'),
(null,1,'音乐播放器',1,1526472244794,10,'APP软件开发指的是手机应用软件的开发与服务。这里的APP指的是应用程序application的意思。APP技术原本是对软件进行加速运算或进行大型科学运算的技术，基于Paas开发平台开发出的APP，直接部署在云环境上，为企业进行集成，形成一种租用云服务的模式。同时，APP技术还可以应用于移动互联网中。在移动时代的大背景下，个人应用率先走进云时代，基于云平台的企业APP在移动互联网领域迎来了发展良机。'),
(null,1,'桌面主题应用',1,1526472244794,10,'APP软件开发指的是手机应用软件的开发与服务。这里的APP指的是应用程序application的意思。APP技术原本是对软件进行加速运算或进行大型科学运算的技术，基于Paas开发平台开发出的APP，直接部署在云环境上，为企业进行集成，形成一种租用云服务的模式。同时，APP技术还可以应用于移动互联网中。在移动时代的大背景下，个人应用率先走进云时代，基于云平台的企业APP在移动互联网领域迎来了发展良机。'),
(null,1,'手机商场应用',0,1526472244794,10,'APP软件开发指的是手机应用软件的开发与服务。这里的APP指的是应用程序application的意思。APP技术原本是对软件进行加速运算或进行大型科学运算的技术，基于Paas开发平台开发出的APP，直接部署在云环境上，为企业进行集成，形成一种租用云服务的模式。同时，APP技术还可以应用于移动互联网中。在移动时代的大背景下，个人应用率先走进云时代，基于云平台的企业APP在移动互联网领域迎来了发展良机。'),
(null,1,'天气预报应用',0,1526472244794,10,'APP软件开发指的是手机应用软件的开发与服务。这里的APP指的是应用程序application的意思。APP技术原本是对软件进行加速运算或进行大型科学运算的技术，基于Paas开发平台开发出的APP，直接部署在云环境上，为企业进行集成，形成一种租用云服务的模式。同时，APP技术还可以应用于移动互联网中。在移动时代的大背景下，个人应用率先走进云时代，基于云平台的企业APP在移动互联网领域迎来了发展良机。'),
(null,2,'品牌网站建设',1,1526472244794,10,'APP软件开发指的是手机应用软件的开发与服务。这里的APP指的是应用程序application的意思。APP技术原本是对软件进行加速运算或进行大型科学运算的技术，基于Paas开发平台开发出的APP，直接部署在云环境上，为企业进行集成，形成一种租用云服务的模式。同时，APP技术还可以应用于移动互联网中。在移动时代的大背景下，个人应用率先走进云时代，基于云平台的企业APP在移动互联网领域迎来了发展良机。'),
(null,2,'响应式建站',1,1526472244794,10,'APP软件开发指的是手机应用软件的开发与服务。这里的APP指的是应用程序application的意思。APP技术原本是对软件进行加速运算或进行大型科学运算的技术，基于Paas开发平台开发出的APP，直接部署在云环境上，为企业进行集成，形成一种租用云服务的模式。同时，APP技术还可以应用于移动互联网中。在移动时代的大背景下，个人应用率先走进云时代，基于云平台的企业APP在移动互联网领域迎来了发展良机。'),
(null,2,'商城购物网站',0,1526472244794,10,'APP软件开发指的是手机应用软件的开发与服务。这里的APP指的是应用程序application的意思。APP技术原本是对软件进行加速运算或进行大型科学运算的技术，基于Paas开发平台开发出的APP，直接部署在云环境上，为企业进行集成，形成一种租用云服务的模式。同时，APP技术还可以应用于移动互联网中。在移动时代的大背景下，个人应用率先走进云时代，基于云平台的企业APP在移动互联网领域迎来了发展良机。'),
(null,2,'精美网页设计',0,1526472244794,10,'APP软件开发指的是手机应用软件的开发与服务。这里的APP指的是应用程序application的意思。APP技术原本是对软件进行加速运算或进行大型科学运算的技术，基于Paas开发平台开发出的APP，直接部署在云环境上，为企业进行集成，形成一种租用云服务的模式。同时，APP技术还可以应用于移动互联网中。在移动时代的大背景下，个人应用率先走进云时代，基于云平台的企业APP在移动互联网领域迎来了发展良机。'),
(null,3,'UI扁平化设计',1,1526472244794,10,'APP软件开发指的是手机应用软件的开发与服务。这里的APP指的是应用程序application的意思。APP技术原本是对软件进行加速运算或进行大型科学运算的技术，基于Paas开发平台开发出的APP，直接部署在云环境上，为企业进行集成，形成一种租用云服务的模式。同时，APP技术还可以应用于移动互联网中。在移动时代的大背景下，个人应用率先走进云时代，基于云平台的企业APP在移动互联网领域迎来了发展良机。'),
(null,3,'名片设计',0,1526472244794,10,'APP软件开发指的是手机应用软件的开发与服务。这里的APP指的是应用程序application的意思。APP技术原本是对软件进行加速运算或进行大型科学运算的技术，基于Paas开发平台开发出的APP，直接部署在云环境上，为企业进行集成，形成一种租用云服务的模式。同时，APP技术还可以应用于移动互联网中。在移动时代的大背景下，个人应用率先走进云时代，基于云平台的企业APP在移动互联网领域迎来了发展良机。'),
(null,3,'画册设计',0,1526472244794,10,'APP软件开发指的是手机应用软件的开发与服务。这里的APP指的是应用程序application的意思。APP技术原本是对软件进行加速运算或进行大型科学运算的技术，基于Paas开发平台开发出的APP，直接部署在云环境上，为企业进行集成，形成一种租用云服务的模式。同时，APP技术还可以应用于移动互联网中。在移动时代的大背景下，个人应用率先走进云时代，基于云平台的企业APP在移动互联网领域迎来了发展良机。'),
(null,3,'形象设计',0,1526472244794,10,'APP软件开发指的是手机应用软件的开发与服务。这里的APP指的是应用程序application的意思。APP技术原本是对软件进行加速运算或进行大型科学运算的技术，基于Paas开发平台开发出的APP，直接部署在云环境上，为企业进行集成，形成一种租用云服务的模式。同时，APP技术还可以应用于移动互联网中。在移动时代的大背景下，个人应用率先走进云时代，基于云平台的企业APP在移动互联网领域迎来了发展良机。');

#产品详情表
CREATE TABLE qz_product_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  pid INT ,
  FOREIGN KEY(pid) REFERENCES qz_product(pid),
  detail VARCHAR (128)
);
INSERT INTO qz_product_detail(did,pid,detail) VALUES
(null,1,'image/product/01_pro_details.jpg'),
(null,1,'image/product/01_pro_details2.jpg'),
(null,1,'image/product/01_pro_details3.jpg'),
(null,2,'image/product/01_pro_details.jpg'),
(null,2,'image/product/01_pro_details2.jpg'),
(null,2,'image/product/01_pro_details3.jpg'),
(null,3,'image/product/01_pro_details.jpg'),
(null,3,'image/product/01_pro_details2.jpg'),
(null,3,'image/product/01_pro_details3.jpg'),
(null,4,'image/product/01_pro_details.jpg'),
(null,4,'image/product/01_pro_details2.jpg'),
(null,4,'image/product/01_pro_details3.jpg'),
(null,5,'image/product/01_pro_details.jpg'),
(null,5,'image/product/01_pro_details2.jpg'),
(null,5,'image/product/01_pro_details3.jpg'),
(null,6,'image/product/01_pro_details.jpg'),
(null,6,'image/product/01_pro_details2.jpg'),
(null,6,'image/product/01_pro_details3.jpg'),
(null,7,'image/product/01_pro_details.jpg'),
(null,7,'image/product/01_pro_details2.jpg'),
(null,7,'image/product/01_pro_details3.jpg'),
(null,8,'image/product/01_pro_details.jpg'),
(null,8,'image/product/01_pro_details2.jpg'),
(null,8,'image/product/01_pro_details3.jpg'),
(null,9,'image/product/01_pro_details.jpg'),
(null,9,'image/product/01_pro_details2.jpg'),
(null,9,'image/product/01_pro_details3.jpg'),
(null,10,'image/product/01_pro_details.jpg'),
(null,10,'image/product/01_pro_details2.jpg'),
(null,10,'image/product/01_pro_details3.jpg'),
(null,11,'image/product/01_pro_details.jpg'),
(null,11,'image/product/01_pro_details2.jpg'),
(null,11,'image/product/01_pro_details3.jpg'),
(null,12,'image/product/01_pro_details.jpg'),
(null,12,'image/product/01_pro_details2.jpg'),
(null,12,'image/product/01_pro_details3.jpg'),
(null,13,'image/product/01_pro_details.jpg'),
(null,13,'image/product/01_pro_details2.jpg'),
(null,13,'image/product/01_pro_details3.jpg'),
(null,14,'image/product/01_pro_details.jpg'),
(null,14,'image/product/01_pro_details2.jpg'),
(null,14,'image/product/01_pro_details3.jpg');

#产品图片表
CREATE TABLE qz_product_img(
    mid INT PRIMARY KEY AUTO_INCREMENT,
    pid INT,
    FOREIGN KEY(pid) REFERENCES qz_product(pid),
    hpic VARCHAR (128),
    sm varchar(128),
    lg varchar(128)
);
INSERT INTO qz_product_img(mid,pid,hpic,sm,lg) VALUES
(null,1,'image/product/01_pro_hpic.jpg','image/product/01_pro_01sm.jpg','image/product/01_pro_01lg.jpg'),
 (null,1,'image/product/01_pro_hpic.jpg','image/product/01_pro_02sm.jpg','image/product/01_pro_02lg.jpg'),
 (null,1,'image/product/01_pro_hpic.jpg','image/product/01_pro_03sm.jpg','image/product/01_pro_03lg.jpg'),
 (null,2,'image/product/02_pro_hpic.jpg','image/product/02_pro_01sm.jpg','image/product/01_pro_01lg.jpg'),
(null,2,'image/product/02_pro_hpic.jpg','image/product/02_pro_02sm.jpg','image/product/02_pro_02lg.jpg'),
(null,2,'image/product/02_pro_hpic.jpg','image/product/02_pro_03sm.jpg','image/product/02_pro_03lg.jpg'),
(null,3,'image/product/03_pro_hpic.jpg','image/product/03_pro_01sm.jpg','image/product/03_pro_01lg.jpg'),
(null,3,'image/product/03_pro_hpic.jpg','image/product/03_pro_02sm.jpg','image/product/03_pro_02lg.jpg'),
(null,3,'image/product/03_pro_hpic.jpg','image/product/03_pro_03sm.jpg','image/product/03_pro_03lg.jpg'),
(null,4,'image/product/04_pro_hpic.jpg','image/product/04_pro_01sm.jpg','image/product/04_pro_01lg.jpg'),
(null,4,'image/product/04_pro_hpic.jpg','image/product/04_pro_02sm.jpg','image/product/04_pro_02lg.jpg'),
(null,4,'image/product/04_pro_hpic.jpg','image/product/04_pro_03sm.jpg','image/product/04_pro_03lg.jpg'),
(null,5,'image/product/05_pro_hpic.jpg','image/product/05_pro_01sm.jpg','image/product/05_pro_01lg.jpg'),
(null,5,'image/product/05_pro_hpic.jpg','image/product/05_pro_02sm.jpg','image/product/05_pro_02lg.jpg'),
(null,5,'image/product/05_pro_hpic.jpg','image/product/05_pro_03sm.jpg','image/product/05_pro_03lg.jpg'),
(null,6,'image/product/03_pro_hpic.jpg','image/product/03_pro_01sm.jpg','image/product/03_pro_01lg.jpg'),
(null,6,'image/product/03_pro_hpic.jpg','image/product/03_pro_02sm.jpg','image/product/03_pro_02lg.jpg'),
(null,6,'image/product/03_pro_hpic.jpg','image/product/03_pro_03sm.jpg','image/product/03_pro_03lg.jpg'),
 (null,7,'image/product/02_pro_hpic.jpg','image/product/02_pro_01sm.jpg','image/product/01_pro_01lg.jpg'),
(null,7,'image/product/02_pro_hpic.jpg','image/product/02_pro_02sm.jpg','image/product/02_pro_02lg.jpg'),
(null,7,'image/product/02_pro_hpic.jpg','image/product/02_pro_03sm.jpg','image/product/02_pro_03lg.jpg'),
(null,8,'image/product/03_pro_hpic.jpg','image/product/03_pro_01sm.jpg','image/product/03_pro_01lg.jpg'),
(null,8,'image/product/03_pro_hpic.jpg','image/product/03_pro_02sm.jpg','image/product/03_pro_02lg.jpg'),
(null,8,'image/product/03_pro_hpic.jpg','image/product/03_pro_03sm.jpg','image/product/03_pro_03lg.jpg'),
(null,9,'image/product/04_pro_hpic.jpg','image/product/04_pro_01sm.jpg','image/product/04_pro_01lg.jpg'),
(null,9,'image/product/04_pro_hpic.jpg','image/product/04_pro_02sm.jpg','image/product/04_pro_02lg.jpg'),
(null,9,'image/product/04_pro_hpic.jpg','image/product/04_pro_03sm.jpg','image/product/04_pro_03lg.jpg'),
(null,10,'image/product/05_pro_hpic.jpg','image/product/05_pro_01sm.jpg','image/product/05_pro_01lg.jpg'),
(null,10,'image/product/05_pro_hpic.jpg','image/product/05_pro_02sm.jpg','image/product/05_pro_02lg.jpg'),
(null,10,'image/product/05_pro_hpic.jpg','image/product/05_pro_03sm.jpg','image/product/05_pro_03lg.jpg'),
(null,11,'image/product/01_pro_hpic.jpg','image/product/01_pro_01sm.jpg','image/product/01_pro_01lg.jpg'),
 (null,11,'image/product/01_pro_hpic.jpg','image/product/01_pro_02sm.jpg','image/product/01_pro_02lg.jpg'),
 (null,11,'image/product/01_pro_hpic.jpg','image/product/01_pro_03sm.jpg','image/product/01_pro_03lg.jpg'),
 (null,12,'image/product/04_pro_hpic.jpg','image/product/04_pro_01sm.jpg','image/product/04_pro_01lg.jpg'),
(null,12,'image/product/04_pro_hpic.jpg','image/product/04_pro_02sm.jpg','image/product/04_pro_02lg.jpg'),
(null,12,'image/product/04_pro_hpic.jpg','image/product/04_pro_03sm.jpg','image/product/04_pro_03lg.jpg'),
(null,13,'image/product/05_pro_hpic.jpg','image/product/05_pro_01sm.jpg','image/product/05_pro_01lg.jpg'),
(null,13,'image/product/05_pro_hpic.jpg','image/product/05_pro_02sm.jpg','image/product/05_pro_02lg.jpg'),
(null,13,'image/product/05_pro_hpic.jpg','image/product/05_pro_03sm.jpg','image/product/05_pro_03lg.jpg'),
(null,14,'image/product/05_pro_hpic.jpg','image/product/05_pro_01sm.jpg','image/product/05_pro_01lg.jpg'),
(null,14,'image/product/05_pro_hpic.jpg','image/product/05_pro_02sm.jpg','image/product/05_pro_02lg.jpg'),
(null,14,'image/product/05_pro_hpic.jpg','image/product/05_pro_03sm.jpg','image/product/05_pro_03lg.jpg');



/****新闻模块相关表******/
#新闻栏目表
CREATE TABLE qz_news_class(
    tid INT PRIMARY KEY AUTO_INCREMENT,
    name varchar(32)
);
INSERT INTO qz_news_class(tid,name) VALUES (null,'公司新闻'),
(null,'新闻资讯'),
(null,'行业资讯');

#新闻表
CREATE TABLE qz_news(
    nid INT PRIMARY KEY AUTO_INCREMENT,
    tid INT,
    FOREIGN KEY(tid) REFERENCES qz_news_class(tid),
    title varchar(128),
    author varchar(32),
    updateTime BIGINT,
    click INT,
    isRecommend INT,
    isTop INT,
    content TEXT

);
INSERT INTO qz_news(nid,tid,title,author,updateTime,click,isRecommend,isTop,content) VALUES
(null,1,'是时候改变你对微服务的认知了！','qz',1526472244794,20,1,0,''),
(null,1,'如何成为一个优秀的工程师？“看到问题也不要去问别人，就把它Fix。”！','qz',1526472244794,20,1,1,''),
(null,1,'精选！15 个必备的 VSCode 插件（前端类）','qz',1526472244794,20,1,0,''),
(null,1,'Zdal分库分表：支付宝是如何在分布式环境下完爆数据库压力的？','qz',1526472244794,20,0,0,''),
(null,1,'ECMAScript 8都发布了，你还没有用上ECMAScript 6？','qz',1526472244794,20,0,0,''),
(null,1,'是时候改变你对微服务的认知了！','qz',1526472244794,20,1,0,''),
(null,1,'如何成为一个优秀的工程师？“看到问题也不要去问别人，就把它Fix。”！','qz',1526472244794,20,1,1,''),
(null,1,'精选！15 个必备的 VSCode 插件（前端类）','qz',1526472244794,20,1,0,''),
(null,1,'Zdal分库分表：支付宝是如何在分布式环境下完爆数据库压力的？','qz',1526472244794,20,0,0,''),
(null,1,'ECMAScript 8都发布了，你还没有用上ECMAScript 6？','qz',1526472244794,20,0,0,''),
(null,2,'是时候改变你对微服务的认知了！','qz',1526472244794,20,1,1,''),
(null,2,'如何成为一个优秀的工程师？“看到问题也不要去问别人，就把它Fix。”！','qz',1526472244794,20,1,0,''),
(null,2,'精选！15 个必备的 VSCode 插件（前端类）','qz',1526472244794,20,1,0,''),
(null,2,'Zdal分库分表：支付宝是如何在分布式环境下完爆数据库压力的？','qz',1526472244794,20,0,0,''),
(null,2,'ECMAScript 8都发布了，你还没有用上ECMAScript 6？','qz',1526472244794,20,0,0,''),
(null,3,'是时候改变你对微服务的认知了！','qz','1526472244794',20,1,1,''),
(null,3,'如何成为一个优秀的工程师？“看到问题也不要去问别人，就把它Fix。”！','qz',1526472244794,20,1,0,''),
(null,3,'精选！15 个必备的 VSCode 插件（前端类）','qz',1526472244794,20,1,0,''),
(null,3,'Zdal分库分表：支付宝是如何在分布式环境下完爆数据库压力的？','qz',1526472244794,20,0,0,''),
(null,3,'ECMAScript 8都发布了，你还没有用上ECMAScript 6？','qz',1526472244794,20,0,0,'');

#新闻标签表
CREATE TABLE qz_news_tag(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  nid INT ,
  FOREIGN KEY(nid) REFERENCES qz_news(nid),
  tid INT,
  FOREIGN KEY(tid) REFERENCES qz_news_class(tid),
  tag VARCHAR (64)
);
INSERT INTO qz_news_tag(iid,nid,tid,tag) VALUES
(null,1,1,'微服务'),
(null,1,1,'请求和响应'),
(null,1,1,'事件流'),
(null,2,1,'异步机制'),
(null,2,1,'微服务'),
(null,2,1,'请求和响应'),
(null,3,1,'事件流'),
(null,3,1,'异步机制'),
(null,3,1,'微服务'),
(null,4,1,'请求和响应'),
(null,4,1,'事件流'),
(null,4,1,'异步机制'),
(null,5,1,'微服务'),
(null,5,1,'请求和响应'),
(null,5,1,'事件流'),
(null,6,1,'微服务'),
(null,6,1,'请求和响应'),
(null,6,1,'事件流'),
(null,7,1,'异步机制'),
(null,7,1,'微服务'),
(null,7,1,'请求和响应'),
(null,8,1,'事件流'),
(null,8,1,'异步机制'),
(null,8,1,'微服务'),
(null,9,1,'请求和响应'),
(null,9,1,'事件流'),
(null,9,1,'异步机制'),
(null,10,1,'微服务'),
(null,10,1,'请求和响应'),
(null,10,1,'事件流'),
(null,11,2,'异步机制'),
(null,11,2,'微服务'),
(null,11,2,'请求和响应'),
(null,12,2,'事件流'),
(null,12,2,'异步机制'),
(null,12,2,'微服务'),
(null,13,2,'请求和响应'),
(null,13,2,'事件流'),
(null,13,2,'异步机制'),
(null,14,2,'微服务'),
(null,14,2,'请求和响应'),
(null,14,2,'事件流'),
(null,15,2,'异步机制'),
(null,15,2,'微服务'),
(null,15,2,'请求和响应'),
(null,16,3,'事件流'),
(null,16,3,'异步机制'),
(null,16,3,'微服务'),
(null,17,3,'请求和响应'),
(null,17,3,'事件流'),
(null,17,3,'异步机制'),
(null,18,3,'微服务'),
(null,18,3,'请求和响应'),
(null,18,3,'事件流'),
(null,19,3,'异步机制'),
(null,19,3,'微服务'),
(null,19,3,'请求和响应'),
(null,20,3,'事件流'),
(null,20,3,'异步机制'),
(null,20,3,'微服务');




#新闻图片表
CREATE TABLE qz_news_img(
    mid INT PRIMARY KEY AUTO_INCREMENT,
    nid INT,
    FOREIGN KEY(nid) REFERENCES qz_news(nid),
    sm varchar(128),
    md varchar(128),
    lg varchar(128)
);
INSERT  INTO qz_news_img(mid,nid,sm,md,lg) VALUES (null,1,'image/news/01_news_sm.jpg','image/news/01_news_md.jpg',''),
(null,2,'image/news/02_news_sm.jpg','image/news/02_news_md.jpg',''),
(null,3,'image/news/03_news_sm.jpg','image/news/03_news_md.jpg',''),
(null,4,'image/news/04_news_sm.jpg','image/news/04_news_md.jpg',''),
(null,5,'image/news/05_news_sm.jpg','image/news/05_news_md.jpg',''),
(null,6,'image/news/06_news_sm.jpg','image/news/06_news_md.jpg',''),
(null,7,'image/news/07_news_sm.jpg','image/news/07_news_md.jpg',''),
(null,8,'image/news/08_news_sm.jpg','image/news/08_news_md.jpg',''),
(null,9,'image/news/09_news_sm.jpg','image/news/09_news_md.jpg',''),
(null,10,'image/news/10_news_sm.jpg','image/news/10_news_md.jpg',''),
(null,11,'image/news/11_news_sm.jpg','image/news/11_news_md.jpg',''),
(null,12,'image/news/12_news_sm.jpg','image/news/12_news_md.jpg',''),
(null,13,'image/news/13_news_sm.jpg','image/news/13_news_md.jpg',''),
(null,14,'image/news/14_news_sm.jpg','image/news/14_news_md.jpg',''),
(null,15,'image/news/15_news_sm.jpg','image/news/15_news_md.jpg',''),
(null,16,'image/news/11_news_sm.jpg','image/news/11_news_md.jpg',''),
(null,17,'image/news/12_news_sm.jpg','image/news/12_news_md.jpg',''),
(null,18,'image/news/13_news_sm.jpg','image/news/13_news_md.jpg',''),
(null,19,'image/news/14_news_sm.jpg','image/news/14_news_md.jpg',''),
(null,20,'image/news/15_news_sm.jpg','image/news/15_news_md.jpg','');
/****案例模块相关列表****/
#案例表
CREATE TABLE qz_case(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    title varchar(128),
    updateTime BIGINT,
    click INT,
    isRecommend INT,
    content varchar(128)
);
INSERT INTO qz_case(cid,title,updateTime,click,isRecommend,content) VALUES (null,'多功能应用开发',1526472244794,20,1,'image/case/01_case_cot.jpg'),
(null,'超级音乐播放器',1526472244794,23,1,'image/case/02_case_cot.png'),
(null,'万能日历',1526472244794,45,1,'image/case/03_case_cot.png'),
(null,'数据监控应用',1526472244794,20,1,'image/case/04_case_cot.png'),
(null,'网速检查器',1526472244794,16,1,'image/case/05_case_cot.png'),
(null,'人肉搜索',1526472244794,78,0,'image/case/06_case_cot.png'),
(null,'定时提醒应用',1526472244794,20,0,'image/case/07_case_cot.png'),
(null,'远程聊天工具',1526472244794,220,0,'image/case/08_case_cot.png'),
(null,'用户界面设计',1526472244794,20,0,'image/case/09_case_cot.png'),
(null,'画册封面',1526472244794,10,0,'image/case/10_case_cot.png'),
(null,'时间轴介绍',1526472244794,20,0,'image/case/11_case_cot.png'),
(null,'音乐播放器',1526472244794,11,0,'image/case/12_case_cot.png');

#案例图片表
CREATE TABLE qz_case_img(
    mid INT PRIMARY KEY AUTO_INCREMENT,
    cid INT,
    FOREIGN KEY(cid) REFERENCES qz_case(cid),
    sm varchar(128),
    md varchar(128),
    lg varchar(128)
);
INSERT INTO qz_case_img(mid,cid,sm,md,lg) VALUES
(null,1,'image/case/01_case_sm.jpg','image/case/01_case_md.jpg',''),
(null,2,'image/case/02_case_sm.png','image/case/02_case_md.png',''),
(null,3,'image/case/03_case_sm.png','image/case/03_case_md.png',''),
(null,4,'image/case/04_case_sm.png','image/case/04_case_md.png',''),
(null,5,'image/case/05_case_sm.png','image/case/05_case_md.png',''),
(null,6,'image/case/06_case_sm.png','image/case/06_case_md.png',''),
(null,7,'image/case/07_case_sm.png','image/case/07_case_md.png',''),
(null,8,'image/case/08_case_sm.png','image/case/08_case_md.png',''),
(null,9,'image/case/09_case_sm.png','image/case/09_case_md.png',''),
(null,10,'image/case/10_case_sm.png','image/case/10_case_md.png',''),
(null,11,'image/case/11_case_sm.png','image/case/11_case_md.png',''),
(null,12,'image/case/12_case_sm.png','image/case/12_case_md.png','');


#视频模块
#视频表
CREATE TABLE qz_video(
    vid INT PRIMARY KEY AUTO_INCREMENT,
    title varchar(128),
    src varchar(128),
    img varchar(128),
    updateTime BIGINT,
    sources varchar(64),
    lang varchar(64),
    type varchar(64),
    spec varchar(1024)
);
INSERT INTO qz_video(vid,title,src,img,updateTime,sources,lang,type,spec) VALUES
(null,"什么是响应式","video/video1.mp4","image/video/video1.jpg",1526472244794,"ortotra","中文","mp4视频",""),
(null,"什么是响应式","video/video2.mp4","image/video/video2.jpg",1526472244794,"ortotra","英语","mp4视频",""),
(null,"什么是响应式","video/video1.mp4","image/video/video3.jpg",1526472244794,"ortotra","法语","mp4视频",""),
(null,"什么是响应式","video/video1.mp4","image/video/video4.jpg",1526472244794,"ortotra","俄语","mp4视频","");

#留言模块
#留言板
CREATE TABLE qz_question(
    mid INT PRIMARY KEY AUTO_INCREMENT,
    uname varchar(128),
    email varchar(128),
    phone INT,
    address varchar(128),
    updateTime BIGINT,
    cot varchar(1024)
);
INSERT INTO qz_question(mid,uname,email,phone,address,updateTime,cot) VALUES
(null,"权哲","qqqzz@163.com","15888888888","北京海淀万寿路",1526472244794,"如何购买模板网站？"),
(null,"张三","qqqzz@163.com","15888888888","北京海淀万寿路",1526472244794,"如何购买模板网站？"),
(null,"李四","qqqzz@163.com","15888888888","北京海淀万寿路",1526472244794,"如何购买模板网站？");



#管理员回复
CREATE TABLE qz_answer(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    mid INT,
    FOREIGN KEY(mid) REFERENCES qz_question(mid),
    ansTime BIGINT,
    ans varchar(1024)
);
INSERT INTO qz_answer(aid,mid,ansTime,ans) VALUES
(null,1,1526472244794,"请登录我们的官网www.xxxx.cn选择你喜欢的模板，购买后你可以直接下载源代码或一键安装"),
(null,2,1526472244794,"请登录我们的官网www.xxxx.cn选择你喜欢的模板，购买后你可以直接下载源代码或一键安装"),
(null,3,1526472244794,"请登录我们的官网www.xxxx.cn选择你喜欢的模板，购买后你可以直接下载源代码或一键安装");