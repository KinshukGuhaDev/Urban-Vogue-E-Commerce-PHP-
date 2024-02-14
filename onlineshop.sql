-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2024 at 07:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineshop`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)   SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'motorolla'),
(5, 'LG'),
(6, 'Cloth Brand');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `ip_add` char(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(0, 10, '::1', 26, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Electronics'),
(2, 'Ladies Wears'),
(3, 'Mens Wear'),
(4, 'Kids Wear'),
(5, 'Furnitures'),
(6, 'Home Appliances'),
(7, 'Electronics Gadgets');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 26, 'Kinshuk guha guha', 'biswajitguha2002@gmail.com', 'b21/865 garia govt colony post garia kolkata-700084', 'Kolkata', 'West Bengal', 700084, '', '', '', 5, 124213, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(98, 1, 6, 1, 35000),
(99, 1, 8, 1, 55555),
(100, 1, 10, 1, 1000),
(101, 1, 11, 1, 658),
(102, 1, 83, 1, 32000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_mrp` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_mrp`, `product_desc`, `product_image`, `product_keywords`) VALUES
(2, 1, 3, 'iPhone 5s', 15000, 40000, 'iphone 5s', 'http___pluspng.com_img-png_iphone-hd-png-iphone-apple-png-file-550.png', 'mobile iphone apple'),
(3, 1, 3, 'iPad air 2', 32000, 40000, 'ipad apple brand', 'da4371ffa192a115f922b1c0dff88193.png', 'apple ipad tablet'),
(4, 1, 3, 'iPhone 6s', 32000, 60000, 'Apple iPhone ', 'http___pluspng.com_img-png_iphone-6s-png-iphone-6s-gold-64gb-1000.png', 'iphone apple mobile'),
(5, 1, 2, 'iPad 2', 10000, 0, 'samsung ipad', 'iPad-air.png', 'ipad tablet samsung'),
(6, 1, 1, 'samsung Laptop r series', 35000, 0, 'samsung Black combination Laptop', 'laptop_PNG5939.png', 'samsung laptop '),
(7, 1, 1, 'Laptop Pavillion', 50000, 0, 'Laptop Hp Pavillion', 'laptop_PNG5930.png', 'Laptop Hp Pavillion'),
(8, 1, 4, 'Sony', 55555, 60000, 'Sony Mobile', '530201353846AM_635_sony_xperia_z.png', 'sony mobile'),
(9, 1, 3, 'iPhone New', 12000, 0, 'iphone', 'iphone-hd-png-iphone-apple-png-file-550.png', 'iphone apple mobile'),
(10, 2, 6, 'Red Ladies dress', 1000, 0, 'red dress for girls', 'red dress.jpg', 'red dress '),
(11, 2, 6, 'Blue Heave dress', 658, 1500, 'Blue dress', 'images.jpg', 'blue dress cloths'),
(12, 2, 6, 'Ladies Casual Cloths', 1500, 2000, 'ladies casual summer two colors pleted', '7475-ladies-casual-dresses-summer-two-colors-pleated.jpg', 'girl dress cloths casual'),
(13, 2, 6, 'SpringAutumnDress', 689, 2000, 'girls dress', 'Spring-Autumn-Winter-Young-Ladies-Casual-Wool-Dress-Women-s-One-Piece-Dresse-Dating-Clothes-Medium.jpg_640x640.jpg', 'girl dress'),
(14, 2, 6, 'Casual Dress', 1400, 0, 'girl dress', 'download.jpg', 'ladies cloths girl'),
(15, 2, 6, 'Formal Look', 1500, 0, 'girl dress', 'shutterstock_203611819.jpg', 'ladies wears dress girl'),
(16, 3, 6, 'Sweter for men', 600, 0, '2012-Winter-Sweater-for-Men-for-better-outlook', '2012-Winter-Sweater-for-Men-for-better-outlook.jpg', 'black sweter cloth winter'),
(17, 3, 6, 'Gents formal', 1000, 3000, 'gents formal look', 'gents-formal-250x250.jpg', 'gents wear cloths'),
(19, 3, 6, 'Formal Coat', 3000, 0, 'ad', 'images (1).jpg', 'coat blazer gents'),
(20, 3, 6, 'Mens Sweeter', 118032, 2000, 'jg', 'Winter-fashion-men-burst-sweater.png', 'sweeter gents '),
(21, 3, 6, 'T shirt', 800, 0, 'ssds', 'IN-Mens-Apparel-Voodoo-Tiles-09._V333872612_.jpg', 'formal t shirt black'),
(22, 4, 6, 'Yellow T shirt ', 1300, 0, 'yello t shirt with pant', '1.0x0.jpg', 'kids yellow t shirt'),
(23, 4, 6, 'Girls cloths', 1900, 0, 'sadsf', 'GirlsClothing_Widgets.jpg', 'formal kids wear dress'),
(24, 4, 6, 'Blue T shirt', 700, 0, 'g', 'images.jpg', 'kids dress'),
(25, 4, 6, 'Yellow girls dress', 750, 0, 'as', 'images (3).jpg', 'yellow kids dress'),
(27, 4, 6, 'Formal look', 690, 0, 'sd', 'image28.jpg', 'formal kids dress'),
(32, 5, 0, 'Book Shelf', 2500, 0, 'book shelf', 'furniture-book-shelf-250x250.jpg', 'book shelf furniture'),
(33, 6, 2, 'Refrigerator', 35000, 0, 'Refrigerator', 'CT_WM_BTS-BTC-AppliancesHome_20150723.jpg', 'refrigerator samsung'),
(34, 6, 4, 'Emergency Light', 1000, 0, 'Emergency Light', 'emergency light.JPG', 'emergency light'),
(35, 6, 0, 'Vaccum Cleaner', 6000, 0, 'Vaccum Cleaner', 'images (2).jpg', 'Vaccum Cleaner'),
(36, 6, 5, 'Iron', 1500, 0, 'gj', 'iron.JPG', 'iron'),
(37, 6, 5, 'LED TV', 20000, 0, 'LED TV', 'images (4).jpg', 'led tv lg'),
(38, 6, 4, 'Microwave Oven', 3500, 0, 'Microwave Oven', 'images.jpg', 'Microwave Oven'),
(39, 6, 5, 'Mixer Grinder', 2500, 0, 'Mixer Grinder', 'singer-mixer-grinder-mg-46-medium_4bfa018096c25dec7ba0af40662856ef.jpg', 'Mixer Grinder'),
(40, 2, 6, 'Formal girls dress', 3000, 0, 'Formal girls dress', 'girl-walking.jpg', 'ladies'),
(45, 1, 2, 'Samsung Galaxy Note 3', 10000, 0, '0', 'samsung_galaxy_note3_note3neo.JPG', 'samsung galaxy Note 3 neo'),
(46, 1, 2, 'Samsung Galaxy Note 3', 10000, 0, '', 'samsung_galaxy_note3_note3neo.JPG', 'samsung galxaxy note 3 neo'),
(47, 4, 6, 'Laptop', 650, 0, 'nbk', 'product01.png', 'Dell Laptop'),
(48, 1, 7, 'Headphones', 250, 0, 'Headphones', 'product05.png', 'Headphones Sony'),
(49, 1, 7, 'Headphones', 250, 0, 'Headphones', 'product05.png', 'Headphones Sony'),
(50, 3, 6, 'boys shirts', 350, 1000, 'shirts', 'pm1.JPG', 'suit boys shirts'),
(51, 3, 6, 'boys shirts', 270, 1000, 'shirts', 'pm2.JPG', 'suit boys shirts'),
(52, 3, 6, 'boys shirts', 453, 1000, 'shirts', 'pm3.JPG', 'suit boys shirts'),
(53, 3, 6, 'boys shirts', 220, 1000, 'shirts', 'ms1.JPG', 'suit boys shirts'),
(54, 3, 6, 'boys shirts', 290, 1000, 'shirts', 'ms2.JPG', 'suit boys shirts'),
(55, 3, 6, 'boys shirts', 259, 1000, 'shirts', 'ms3.JPG', 'suit boys shirts'),
(56, 3, 6, 'boys shirts', 299, 1000, 'shirts', 'pm7.JPG', 'suit boys shirts'),
(57, 3, 6, 'boys shirts', 260, 1000, 'shirts', 'i3.JPG', 'suit boys shirts'),
(58, 3, 6, 'boys shirts', 350, 1000, 'shirts', 'pm9.JPG', 'suit boys shirts'),
(59, 3, 6, 'boys shirts', 855, 1000, 'shirts', 'a2.JPG', 'suit boys shirts'),
(60, 3, 6, 'boys shirts', 150, 1000, 'shirts', 'pm11.JPG', 'suit boys shirts'),
(61, 3, 6, 'boys shirts', 215, 1000, 'shirts', 'pm12.JPG', 'suit boys shirts'),
(62, 3, 6, 'boys shirts', 299, 1000, 'shirts', 'pm13.JPG', 'suit boys shirts'),
(63, 3, 6, 'boys Jeans Pant', 550, 1000, 'Pants', 'pt1.JPG', 'boys Jeans Pant'),
(64, 3, 6, 'boys Jeans Pant', 460, 1000, 'pants', 'pt2.JPG', 'boys Jeans Pant'),
(65, 3, 6, 'boys Jeans Pant', 470, 1000, 'pants', 'pt3.JPG', 'boys Jeans Pant'),
(66, 3, 6, 'boys Jeans Pant', 480, 1000, 'pants', 'pt4.JPG', 'boys Jeans Pant'),
(67, 3, 6, 'boys Jeans Pant', 360, 1000, 'pants', 'pt5.JPG', 'boys Jeans Pant'),
(68, 3, 6, 'boys Jeans Pant', 550, 1000, 'pants', 'pt6.JPG', 'boys Jeans Pant'),
(69, 3, 6, 'boys Jeans Pant', 390, 1000, 'pants', 'pt7.JPG', 'boys Jeans Pant'),
(70, 3, 6, 'boys Jeans Pant', 399, 1000, 'pants', 'pt8.JPG', 'boys Jeans Pant'),
(71, 1, 2, 'Samsung galaxy s7', 5000, 0, 'Samsung galaxy s7', 'product07.png', 'samsung mobile electronics'),
(72, 7, 2, 'sony Headphones', 3500, 0, 'sony Headphones', 'product02.png', 'sony Headphones electronics gadgets'),
(73, 7, 2, 'samsung Headphones', 3500, 0, 'samsung Headphones', 'product05.png', 'samsung Headphones electronics gadgets'),
(74, 1, 1, 'HP i5 laptop', 5500, 0, 'HP i5 laptop', 'product01.png', 'HP i5 laptop electronics'),
(75, 1, 1, 'HP i7 laptop 8gb ram', 5500, 0, 'HP i7 laptop 8gb ram', 'product03.png', 'HP i7 laptop 8gb ram electronics'),
(76, 1, 5, 'sony note 6gb ram', 4500, 0, 'sony note 6gb ram', 'product04.png', 'sony note 6gb ram mobile electronics'),
(77, 1, 4, 'MSV laptop 16gb ram NVIDEA Graphics', 5499, 0, 'MSV laptop 16gb ram', 'product06.png', 'MSV laptop 16gb ram NVIDEA Graphics electronics'),
(78, 1, 5, 'dell laptop 8gb ram intel integerated Graphics', 4579, 0, 'dell laptop 8gb ram intel integerated Graphics', 'product08.png', 'dell laptop 8gb ram intel integerated Graphics electronics'),
(79, 7, 2, 'camera with 3D pixels', 2569, 0, 'camera with 3D pixels', 'product09.png', 'camera with 3D pixels camera electronics gadgets'),
(80, 1, 1, 'ytrfdkjsd', 12343, 0, 'sdfhgh', '1542455446_thythtf .jpeg', 'dfgh'),
(81, 4, 6, 'Kids blue dress', 300, 0, 'blue dress', '1543993724_pg4.jpg', 'kids blue dress'),
(83, 1, 3, 'IPHONE 15 PRO MAX', 32000, 40000, 'IPHONE 15 PRO MAX', '1707925981_download (1).jpeg', 'ABC'),
(84, 1, 3, 'aaaa', 22131, 150000, 'asd', '1707926119_download.jpeg', 'asd');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `review` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL,
  `rating` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(26, 'Kinshuk guha', 'guha', 'kinshukguha2002@gmail.com', 'FragGOD2002', '9163104280', 'Boral main road', 'kolkata'),
(27, 'Biswajit', 'Guha', 'abc@gmail.com', 'FragGOD2002', '1234567890', 'Kolkata', 'India');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneet', '1234446576', 'New York', 'Kumbalagodu'),
(26, 'Kinshuk guha', 'guha', 'kinshukguha2002@gmail.com', 'FragGOD2002', '9163104280', 'Boral main road', 'kolkata'),
(27, 'Biswajit', 'Guha', 'abc@gmail.com', 'FragGOD2002', '1234567890', 'Kolkata', 'India');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `ip_add` char(200) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `p_id`, `ip_add`, `user_id`) VALUES
(0, 0, '::1', 26);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`,`p_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`user_id`,`id`,`p_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
