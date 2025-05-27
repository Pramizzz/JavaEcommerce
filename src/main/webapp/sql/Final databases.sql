-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2025 at 12:15 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kicksole`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_name`) VALUES
(5, 'Adidas'),
(6, 'Nike'),
(7, 'Levis'),
(8, 'Puma');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`) VALUES
(7, 1),
(8, 20);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_item_id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`cart_item_id`, `cart_id`, `variant_id`, `quantity`) VALUES
(43, 7, 52, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Sneakers'),
(2, 'Running Shoes'),
(3, 'Treking Shoes'),
(4, 'Daily wear'),
(5, 'Mens'),
(7, 'Party wear'),
(10, 'Kids'),
(11, 'Monk strap shoes');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `shipping_address` text DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `payment_method` varchar(50) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `last_updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_date`, `shipping_address`, `status`, `payment_method`, `total_amount`, `last_updated_date`) VALUES
(35, 1, '2025-05-21 18:23:34', 'pokhara', 'Shipped', 'PayPal', 10000.00, '2025-05-22 01:57:25'),
(36, 1, '2025-05-21 18:31:31', 'nepal', 'Pending', 'Debit Card', 100000.00, '2025-05-22 00:16:31'),
(37, 20, '2025-05-21 18:46:35', 'pokhara', 'Pending', 'Debit Card', 10000.00, '2025-05-22 00:31:35'),
(38, 20, '2025-05-21 18:47:05', 'nepal', 'Pending', 'Debit Card', 290221.00, '2025-05-22 00:32:05'),
(39, 20, '2025-05-21 18:49:37', 'pokh', 'Pending', 'Credit Card', 0.00, '2025-05-22 00:34:37');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `variant_id`, `quantity`, `price`) VALUES
(35, 35, 52, 1, 10000),
(36, 36, 62, 1, 100000),
(37, 37, 52, 1, 10000),
(38, 38, 56, 1, 1000),
(39, 38, 65, 1, 54654),
(40, 38, 66, 1, 234567);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(150) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `brand_id`, `category_id`, `price`) VALUES
(55, 'good one', 5, 2, 10000.00),
(56, 'PramitKabiPremi', 8, 1, 1000.00),
(59, 'Nike shoes', 5, 1, 1000.00),
(61, 'Nike shoes', 5, 1, 1000.00),
(63, 'susmarika', NULL, 1, 1000000.00),
(64, 'Adidas Shoes', NULL, 4, 25000.00),
(65, 'shoesgf', NULL, 1, 1000.00),
(66, 'abin gaida', NULL, 1, 100000.00),
(68, 'adityaChhetriShrestha', NULL, 1, 1.00),
(69, 'asdfghj', NULL, 1, 54654.00),
(70, 'adityaChhetriShrestha', NULL, 1, 234567.00),
(71, 'sdfxghjkl', 5, 1, 2345678.00),
(72, 'Nike shoes', NULL, 4, 125444.00),
(74, 'dfghjkl', 7, 5, 11111.00);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`image_id`, `product_id`, `image_path`) VALUES
(22, 55, 'resources/images/1747844268459_Screenshot 2025-05-19 144734.png'),
(23, 56, 'resources/images/1747864712084_Screenshot 2025-05-22 002736.png'),
(26, 59, 'resources/images/1747864778038_Abin.png'),
(28, 61, 'images/1747865649864_Abin.png'),
(29, 63, 'resources/images/1747637317049_finalllllascoiannnnnnnnnnnnnnnnnn.drawio.png'),
(30, 64, 'resources/images/1747637303950_social-issues.jpg'),
(31, 65, 'resources/images/1747634083531_social-issues.jpg'),
(32, 66, 'resources/images/1747634674497_social-issues.jpg'),
(34, 68, 'resources/images/1747655339797_social-issues.jpg'),
(35, 69, 'resources/images/1747657457929_social-issues.jpg'),
(36, 70, 'resources/images/1747657885951_143510.webp'),
(37, 71, 'resources/images/1747658704188_MacBook Pro 16_ - 6.png'),
(38, 72, 'resources/images/1747717352332_social-issues.jpg'),
(40, 74, 'resources/images/1747717742683_TA1k4x8KRYAG_uyJ1d6RQCxN5SuuiBJigcuK22M2tUgAdbodcRnhl3A2RyZ4OkcuVkgX0Y9Yd9yFtJK0rM9M7A.webp');

-- --------------------------------------------------------

--
-- Table structure for table `product_variant`
--

CREATE TABLE `product_variant` (
  `variant_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(20) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_variant`
--

INSERT INTO `product_variant` (`variant_id`, `product_id`, `size`, `color`, `stock_quantity`) VALUES
(52, 55, '12', 'red', 28),
(53, 56, '7', 'red', 2),
(56, 59, '10', 'black', 65),
(58, 61, '7', 'red', 98),
(59, 63, '7', 'green', 5),
(60, 64, '7', 'black', 9),
(61, 65, '7', 'black', 10),
(62, 66, '7', 'black', 8),
(64, 68, '7', 'red', 10),
(65, 69, '1', 'black', 544),
(66, 70, '23', 'black', 73),
(67, 71, '7', 'red', 1212),
(68, 72, '7', 'black', 10),
(70, 74, '7', 'black', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `birthday`, `password`, `phone`, `role`) VALUES
(1, 'Susmarika Koirala', 'susmarika', 'susmarikakoirala@gmail.com', '2004-08-13', '9b71b9ccf0044a1d9788ce5d1827411b80c84965d67e90b8f9bc0d958c414329', '9816171310', 'admin'),
(4, 'susmarika Koirala', 'susmarika Koirala', 'susmarika@gmail.com', '2000-04-17', '7d3533a18bac314a73f923beaa1cd02a3293ab1fc20feba869d0893434eae3f9', '9816151210', 'customer'),
(5, 'Krishna Karki', 'krishna', 'krishnakarki@gmail.com', '2004-02-04', '4bef7f698505db976ba0fa6e85a6c7310334ea2694c56213b7f3af26de2d8ad3', '9805857405', 'customer'),
(6, 'Abin Udash', 'Abin Udash', 'abinudash123@gmail.com', '1990-04-18', '98d561f9853213efc7e83ee7077e38c4eadff7120c5659df7abbce2e4d194045', '9869044466', 'customer'),
(7, 'swarnim', 'swarnim', 'swarnim@gmail.com', '2009-04-18', '82741e79ebc57f337aa8578b5baa9a73a7b1b56fd91f8edb204a56d6eb69d832', '9816151210', 'customer'),
(8, 'alina', 'alina', 'alina@gmail.com', '2000-04-18', '12bde188f2538101397bc44362eaf65240cff483637f9d8149806ceaf005f2e8', '9578014567', 'customer'),
(9, 'ram gurung', 'ram', 'ramgurung@gmail.com', '1995-04-19', '45f876f1dfd0d6cb728bd390ea3ce0a7e5d0d6335cbb93d6feb93cf518602e0c', '9845703814', 'customer'),
(10, 'Sijan Koirala', 'sijan123', 'sijan@gmail.com', '2007-04-19', 'cb77eb9312adb47293522c2da9f20097d64fc48e34b02596816e0bd7e3e1a76f', '9584562710', 'customer'),
(11, 'Aditya Karki', 'aditya123', 'aditya@gmail.com', '2005-04-21', 'cb9cd9c7bcaf03cd5dde24077485c353c8cad2b5c2a394a578e142c35ec706bf', '9842037914', 'customer'),
(12, 'Pramit Gurung', 'kabipremi', 'kabipremi@gmail.com', '2005-04-21', '117b5900069d55b02d95d622f22c1e60b62b03fd01605428bf9900d5873aee7e', '9824756014', 'customer'),
(13, 'Reshal Shrestha', 'reshal', 'reshal@gmail.com', '2005-04-21', '957bf90e8afee66b23359d4f65457459ee581a6fc2393af4e10ea29401b960f0', '9840376214', 'customer'),
(14, 'Shnea Shresha', 'shnea123', 'shnea@gmail.com', '2006-04-21', 'e358862f5f0c7813517a1f888379c1334eee55ba5f80b5b502ccede24db984cf', '9850473000', 'customer'),
(15, 'Rhes Shresha', 'rhea123', 'rhea@gmail.com', '2006-04-21', '122fe5782806ea6df162792fa3648019e5474458c412ca200e201dc844717c38', '9803279046', 'customer'),
(16, 'Ssndeep Dhakal', 'sandeep123', 'sandeep123@gmail.com', '1990-04-21', '695e74a498b7c2f44cc992204fa684b955f3d27c601a9edba0630b18174f949f', '9845214090', 'customer'),
(18, 'swarnim', 'swarnuim', 'swarnum111@gmail.com', '2000-05-03', 'fc5011306f51db6cb0e4309c3805ccbeaef3070c2ee3ff99f641eaef1fc911ba', '9584545454', 'customer'),
(20, 'abinshakya', 'abinshakya', 'abinudash12@gmail.com', '2004-01-10', 'eff8035f77d4971ace1426c77ade9759c21754564dca6c053bdf79e6c6d933b8', '9869044466', 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `fk_cart_user` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `fk_cart_items_cart` (`cart_id`),
  ADD KEY `fk_cart_items_variant` (`variant_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_orders_user` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `fk_order_items_order` (`order_id`),
  ADD KEY `fk_order_items_variant` (`variant_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_brand` (`brand_id`),
  ADD KEY `fk_product_category` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_variant`
--
ALTER TABLE `product_variant`
  ADD PRIMARY KEY (`variant_id`),
  ADD KEY `fk_variant_product` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `product_variant`
--
ALTER TABLE `product_variant`
  MODIFY `variant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `fk_cart_items_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cart_items_variant` FOREIGN KEY (`variant_id`) REFERENCES `product_variant` (`variant_id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_items_variant` FOREIGN KEY (`variant_id`) REFERENCES `product_variant` (`variant_id`) ON DELETE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE SET NULL;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `fk_images_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variant`
--
ALTER TABLE `product_variant`
  ADD CONSTRAINT `fk_variant_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
