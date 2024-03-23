-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2023 at 08:19 AM
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
-- Database: `esupermarket`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `o_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `o_quantity` int(11) NOT NULL,
  `o_date` varchar(450) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`o_id`, `p_id`, `u_id`, `o_quantity`, `o_date`) VALUES
(27, 7, 0, 1, '2023-12-21'),
(28, 9, 0, 1, '2023-12-21'),
(29, 7, 0, 1, '2023-12-21'),
(30, 9, 0, 1, '2023-12-21'),
(31, 7, 0, 1, '2023-12-21'),
(32, 9, 0, 1, '2023-12-21');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip_code` varchar(50) NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(450) NOT NULL,
  `category` varchar(450) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(450) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `image`) VALUES
(10, 'Finagle Sandwich Bread', 'Food', 1.5, 'img/finagle.jpg'),
(11, 'Anchor 400mg', 'Food', 3, 'img/anchor.png'),
(12, 'Maliban Gold Marie 330g', 'Food', 1, 'img/marie330.png'),
(13, 'Pork', 'Food', 4, 'img/pork.jpg'),
(14, 'Revello Suprise Pack', 'Food', 5, 'img/revello-3.jpg'),
(15, 'Kotmale Set Youghurt', 'Food', 3, 'img/yoghurt.jpeg'),
(16, 'Chunky Choc', 'Food', 4, 'img/chunkychoc.jpg'),
(17, 'Happy Cow Cheese', 'Food', 8, 'img/happycow.jpg'),
(18, 'Munchee Milk Short Cake', 'Food', 2, 'img/milkbiscuit.jpeg'),
(19, 'Revello Cashew Chocolate', 'Food', 4.5, 'img/revello-1.jpg'),
(20, 'Sausages Buddy Pack', 'Food', 5.6, 'img/sausage.jpeg'),
(21, 'Signal Toothbrush', 'Home-Appliances', 2, 'img/brush.png'),
(22, 'Kotmale Fresh Milk', 'Food', 6, 'img/freshmilk.jpg'),
(23, 'Prima Kottume', 'Food', 1.4, 'img/kottume.png'),
(24, 'Pasta 500g', 'Food', 7, 'img/pasta.jpg'),
(25, 'Sun Crush Red Apple Drink', 'Food', 0.6, 'img/scrapple.png'),
(26, 'Baby Oil Baby Ceramy', 'Beauty', 2, 'img/baby-oil.jpg'),
(27, 'Dettol Soap', 'Beauty', 0.8, 'img/dettol.jpeg'),
(28, 'MDK Kottu Roti', 'Foods', 8, 'img/kotturoti.jpg'),
(29, 'Scan Jumbo Peanut', 'Food', 6, 'img/peanut.jpg'),
(30, 'Signal Toothpaste', 'Beauty', 2.2, 'img/signal.jpeg'),
(31, 'Bahira chicken 1KG', 'Food', 9, 'img/chicken.jpg'),
(32, 'Coca-cola 2L', 'Drink', 3, 'img/cola.jpg'),
(33, 'Maliban Chocolate Cream Biscuit', 'Food', 2.3, 'img/maliban-2.jpeg'),
(34, 'Revello Almond Chocolate', 'Food', 4, 'img/revello-2.jpg'),
(35, 'Sun Crush Chocolate Drink', 'Drink', 0.9, 'img/scchoco.jpg'),
(36, 'Astra 100g', 'Food', 0.4, 'img/astra.jpeg'),
(37, 'EGB 1L', 'Drink', 2.2, 'img/egb.png'),
(38, 'KREST Chicken Meatballs 500g', 'Food', 9.5, 'img/meatballs.jpeg'),
(39, 'Wijaya Pepper Powder 100g', 'Food', 0.8, 'img/pepper.jpeg'),
(40, 'Sunsilk Long & Strong Shampoo 350g', 'Beauty', 2.1, 'img/shampoo.jpg'),
(41, 'Baby Ceramy Baby Soap', 'Beauty', 0.3, 'img/babysoap.jpeg'),
(42, 'Creamsoda 1L', 'Drink', 3, 'img/creamsoda.jpg'),
(43, 'Maliban Lemon Puff', 'Food', 1, 'img/maliban-3.webp'),
(44, 'Mortein Fly & Mosquito Killer 350g', 'Chemical', 3.4, 'img/mortien.jpg'),
(45, 'Sun Crush Green Apple ', 'Drink', 1, 'img/scgapple.jpg'),
(46, 'Kraft Cheese 500g', 'Food', 10, 'img/cheese.jpg'),
(47, 'Harpic Stain Removal', 'Chemical', 3.1, 'img/harpic.jpg'),
(48, 'Nestle Milkmaid', 'Food', 5, 'img/milkmaid.jpg'),
(49, 'Tomato Sause 400g', 'Food', 2.5, 'img/sause.png'),
(50, 'Sprite 2L', 'Drink', 2.3, 'img/sprite.jpeg'),
(51, 'Uswatte Tipitip', 'Food', 0.5, 'img/tipitip.jpeg'),
(52, 'Sunlight Lemon', 'Beauty', 0.4, 'img/sunlight.jpg'),
(53, 'Sera Chilli Powder 500g', 'Food', 2.6, 'img/chilli.jpg'),
(54, 'Ginger Biscuit', 'Food', 0.8, 'img/ginger.jpg'),
(55, 'Swadeshi Khomba Soap', 'Beauty', 0.7, 'img/khomba.jpeg'),
(56, 'Lysol Surface Cleaner', 'Chemical', 3.2, 'img/lysol.jpeg'),
(57, 'Maliban Classique', 'Food', 4.6, 'img/maliban-1.jpeg'),
(58, 'Mixture Bite Spicy', 'Food', 2, 'img/mixture.jpeg'),
(59, 'Bringal 1KG', 'Food', 3, 'img/bringal.jpg'),
(60, 'Carrot 1KG', 'Food', 4.1, 'img/Carrot.jpg'),
(61, 'Garlic 1KG', 'Food', 6.7, 'img/garlic.jpeg'),
(62, 'Leeks 1KG', 'Food', 2.8, 'img/leeks.jpg'),
(63, 'Onion 1KG', 'Food', 2, 'img/onion.jpg'),
(64, 'Potato 1KG', 'Food', 2.5, 'img/potato.jpg'),
(65, 'Pumpkin 1KG', 'Food', 1.8, 'img/Pumpkin.jpg'),
(66, 'Tomato 1KG', 'Food', 8.2, 'img/Tomato.jpg'),
(67, 'Apple 1KG ', 'Fruits', 10.6, 'img/apple.jpg'),
(68, 'Grapes 1KG', 'Fruits', 12.3, 'img/grapes.jpeg'),
(69, 'Orange 1KG', 'Fruit', 9, 'img/orange.jpg'),
(70, 'Pineapple 1KG', 'Fruit', 12.9, 'img/pineapple.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `username` varchar(100) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `upwd` varchar(50) NOT NULL,
  `uemail` varchar(50) NOT NULL,
  `umobile` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `uname`, `upwd`, `uemail`, `umobile`) VALUES
(1, 'Thisara Madusanka', '123', 'janakawedamulla01@gmail.com', '0740563227'),
(16, 'Thisara Madusanka', '456', 'thisaramadusanka059@gmail.com', '0740563227'),
(17, 'Thisara Madusanka', '456', 'thisaramadusanka059@gmail.com', '0740563227'),
(18, 'Thisara Madusanka', '456', 'janakawedamulla01@gmail.com', '0740563227'),
(19, 'Thisara Madusanka', '456', 'janakawedamulla01@gmail.com', '0740563227'),
(20, 'Thisara Madusanka', '456', 'thisaramadusanka002@gmail.com', '0740563227'),
(21, 'Thisara Madusanka', '456', 'thisaramadusanka002@gmail.com', '0740563227'),
(22, 'Thisara Madusanka', '456', 'thisaramadusanka059@gmail.com', '0740563227'),
(23, 'Thisara Madusanka', '456', 'thisaramadusanka059@gmail.com', '0740563227'),
(24, 'Thisara Madusanka', '789', 'thisaramadusanka059@gmail.com', '0740563227'),
(25, 'Thisara Madusanka', '789', 'thisaramadusanka059@gmail.com', '0740563227'),
(26, 'Thisara Madusanka', '789', 'thisaramadusanka059@gmail.com', '0740563227'),
(27, 'Thisara Madusanka', '123', 'thisaramadusanka002@gmail.com', '0740563227'),
(28, 'Thisara Madusanka', '123', 'thisaramadusanka002@gmail.com', '0740563227'),
(29, 'Thisara Madusanka', '123', 'thisaramadusanka002@gmail.com', '0740563227'),
(30, 'Thisara Madusanka', '156', 'janakawedamulla01@gmail.com', '0740563227'),
(31, 'Thisara Madusanka', '156', 'janakawedamulla01@gmail.com', '0740563227');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`o_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
