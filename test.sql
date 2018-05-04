--wyl   测试mysl
SET NAMES utf8;

DROP DATABASE IF EXISTS test;
CREATE DATABASE test CHARSET=UTF8;
USE test;


CREATE TABLE IF NOT EXISTS `test_users` (
  `user_id` int(11) PRIMARY KEY  AUTO_INCREMENT,
  `user_name` varchar(100),
  `user_pwd` varchar(100)
);
INSERT INTO `test_users` VALUES(NULL, '哆啦', '123456');


CREATE TABLE IF NOT EXISTS `test_products` (
  `product_id` int(11) PRIMARY KEY  AUTO_INCREMENT,
  `product_name` varchar(100) ,
  `product_url` varchar(100) ,
  `product_img` varchar(100) 
) ;

INSERT INTO `test_products` (`product_id`, `product_name`, `product_url`, `product_img`) VALUES
(1, 'ennnnnn', 'eeeeeeeeeeeee', 'img/dlamda0211.png'),
(2, 'ennnnnn', 'eeeeeeeeeeeee', 'img/dlamxiao020.png'),
(3, 'ennnnnn', 'eeeeeeeeeeeee', 'img/dlam003.png'),
(4, 'ennnnnn', 'eeeeeeeeeeeee', 'img/dlam002.png'),
(5, 'ennnnnn', 'eeeeeeeeeeeee', 'img/dlam003.png');


CREATE TABLE IF NOT EXISTS `test_orders` (
  `order_id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `order_num` varchar(10),
  `shop_name` varchar(40),
  `shop_url` varchar(100),
  `user_name` varchar(40),
  `price` decimal(16,2),
  `payment_mode` varchar(10),
  `submit_time` varchar(20),
  `order_state` int(1)
);

INSERT INTO `test_orders` (`order_id`, `order_num`, `shop_name`, `shop_url`, `user_name`, `price`, `payment_mode`, `submit_time`, `order_state`) VALUES
(1, 'mysql数据', 'ennnnnn', 'dd', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 2),
(2, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 3),
(3, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 1),
(4, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 3),
(5, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 4),
(6, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 3),
(7, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 2),
(8, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 3),
(9, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 2),
(10, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 3),
(11, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 1),
(12, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 3),
(13, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 2),
(14, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 3),
(15, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 4),
(16, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 4),
(17, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 3),
(18, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 3),
(19, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 3),
(20, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 4),
(21, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 2),
(22, 'mysql数据', 'ennnnnn', '', '哆啦', 'mysql数据', 'mysql数据', 'mysql数据', 3);


CREATE TABLE IF NOT EXISTS `test_order_product_detail` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `order_id` int(11),
  `product_id` int(11)
);


INSERT INTO `test_order_product_detail` (`id`, `order_id`, `product_id`) VALUES
(NULL, 1, 1),
(NULL, 1, 2),
(NULL, 2, 3),
(NULL, 3, 4),
(NULL, 4, 2),
(NULL, 4, 3),
(NULL, 4, 5),
(NULL, 5, 1),
(NULL, 6, 2),
(NULL, 6, 4),
(NULL, 7, 3),
(NULL, 8, 4),
(NULL, 8, 5),
(NULL, 9, 2),
(NULL, 10, 1),
(NULL, 11, 2),
(NULL, 11, 5),
(NULL, 12, 4),
(NULL, 13, 2),
(NULL, 14, 1),
(NULL, 14, 3),
(NULL, 15, 5),
(NULL, 16, 1),
(NULL, 17, 2),
(NULL, 17, 3),
(NULL, 18, 3),
(NULL, 19, 1),
(NULL, 20, 2),
(NULL, 21, 3),
(NULL, 22, 4),
(NULL, 22, 5);







