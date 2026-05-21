-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2026 at 01:12 PM
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
-- Database: `the_espot`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_ID` int(11) NOT NULL,
  `Admin_Name` varchar(100) NOT NULL,
  `Admin_Email` varchar(150) NOT NULL,
  `Admin_Password` varchar(255) NOT NULL,
  `Admin_Permission` varchar(100) DEFAULT NULL,
  `Admin_Username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Admin_ID`, `Admin_Name`, `Admin_Email`, `Admin_Password`, `Admin_Permission`, `Admin_Username`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2a$10$lkLn3aNeM/lM/7g13sDbh.5ejD7BHzwWFhr4/3ghaDxO3BwZ14sQC', 'Moderator', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `Cart_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `Created_At` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`Cart_ID`, `Member_ID`, `Created_At`) VALUES
(1, 1, '2026-05-01 09:00:00'),
(2, 2, '2026-05-02 10:00:00'),
(3, 3, '2026-05-03 11:00:00'),
(4, 4, '2026-05-04 12:00:00'),
(5, 5, '2026-05-05 13:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `Cart_Items_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Cart_ID` int(11) NOT NULL,
  `Cart_Quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`Cart_Items_ID`, `Product_ID`, `Cart_ID`, `Cart_Quantity`) VALUES
(1, 1, 1, 1),
(2, 3, 1, 2),
(3, 4, 2, 1),
(4, 5, 2, 1),
(7, 1, 4, 1),
(8, 4, 4, 2),
(9, 5, 5, 3),
(10, 6, 5, 1),
(11, 12, 3, 1),
(12, 3, 3, 2),
(13, 7, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Category_ID` int(11) NOT NULL,
  `Category_Name` varchar(100) NOT NULL,
  `Category_Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Category_ID`, `Category_Name`, `Category_Description`) VALUES
(1, 'Electronics', 'Electronic devices and gadgets'),
(2, 'Shoes', 'Footwear for all occasions'),
(3, 'Audio', 'Speakers, headphones and accessories'),
(4, 'Accessories', 'Fashion and tech accessories'),
(5, 'Wearables', 'Smartwatches and wearable tech'),
(6, 'Miscellaneous', 'All other itens');

-- --------------------------------------------------------

--
-- Table structure for table `contacted`
--

CREATE TABLE `contacted` (
  `contact_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `subject` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacted`
--

INSERT INTO `contacted` (`contact_id`, `name`, `email`, `phone`, `subject`, `message`, `created_at`) VALUES
(1, 'Aditya Pudasaini', 'member2@gmail.com', '9812121214', 'order', 'dfasds', '2026-05-20 15:08:06'),
(2, 'Aditya Pudasaini', 'member2@gmail.com', NULL, 'order', 'sadasd', '2026-05-21 09:57:59');

-- --------------------------------------------------------

--
-- Table structure for table `export_history`
--

CREATE TABLE `export_history` (
  `Export_ID` int(11) NOT NULL,
  `Report_Type` varchar(50) DEFAULT NULL,
  `Exported_By` varchar(100) DEFAULT NULL,
  `Export_Date` datetime DEFAULT current_timestamp(),
  `Row_Count` int(11) DEFAULT NULL,
  `Status` varchar(20) DEFAULT 'Success'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `export_history`
--

INSERT INTO `export_history` (`Export_ID`, `Report_Type`, `Exported_By`, `Export_Date`, `Row_Count`, `Status`) VALUES
(1, 'Revenue', 'admin', '2026-05-19 19:19:57', 5, 'Success'),
(2, 'Revenue', 'admin', '2026-05-20 18:54:03', 6, 'Success'),
(3, 'Revenue', 'admin', '2026-05-21 14:33:05', 9, 'Success');

-- --------------------------------------------------------

--
-- Table structure for table `flag_report`
--

CREATE TABLE `flag_report` (
  `Flag_ID` int(11) NOT NULL,
  `Product_ID` int(11) DEFAULT NULL,
  `Reported_By_Member` int(11) DEFAULT NULL,
  `Reported_By_Admin` int(11) DEFAULT NULL,
  `Reason` varchar(255) DEFAULT NULL,
  `Date_Reported` datetime DEFAULT NULL,
  `Flag_Status` varchar(30) DEFAULT 'Under Review'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flag_report`
--

INSERT INTO `flag_report` (`Flag_ID`, `Product_ID`, `Reported_By_Member`, `Reported_By_Admin`, `Reason`, `Date_Reported`, `Flag_Status`) VALUES
(6, 6, NULL, 1, 'Flagged by Admin', '2026-05-18 15:54:33', 'Dismissed'),
(7, 6, NULL, 1, 'Flagged by Admin', '2026-05-18 20:33:44', 'Dismissed'),
(8, 6, NULL, 1, 'Flagged by Admin', '2026-05-19 19:26:46', 'Resolved'),
(9, 11, NULL, 1, 'Flagged by Admin', '2026-05-20 09:03:14', 'Under Review'),
(10, 10, NULL, 1, 'Flagged by Admin', '2026-05-20 09:07:27', 'Under Review'),
(11, 14, NULL, 1, 'Flagged by Admin', '2026-05-21 14:30:03', 'Dismissed'),
(12, 14, NULL, 1, 'Flagged by Admin', '2026-05-21 14:30:10', 'Dismissed');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `Member_ID` int(11) NOT NULL,
  `Member_Name` varchar(100) NOT NULL,
  `Member_Email` varchar(150) NOT NULL,
  `Member_Password` varchar(255) NOT NULL,
  `Member_DOB` date DEFAULT NULL,
  `Member_Phone` varchar(20) DEFAULT NULL,
  `Account_Status` varchar(20) NOT NULL DEFAULT 'active',
  `Created_At` datetime NOT NULL DEFAULT current_timestamp(),
  `Member_Role` varchar(50) NOT NULL DEFAULT 'Buyer',
  `Member_Username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`Member_ID`, `Member_Name`, `Member_Email`, `Member_Password`, `Member_DOB`, `Member_Phone`, `Account_Status`, `Created_At`, `Member_Role`, `Member_Username`) VALUES
(1, 'First Entry', 'firstUser@gmail.com', '$2a$10$GfF3iyIT6Q7SpQrZtP5NH.JmmOL5lzxMXyEE1IQlKbS0gc3YCZ.pm', '2026-04-07', '9812121212', 'Banned', '2026-04-08 00:00:00', 'Buyer', 'first'),
(2, 'Second one', 'member@gmail.com', '$2a$10$mv8wO3T5DBHqaCZ6qkw6N.P8dx6rrssGk4ZPx.kiVRsI2riZMDHmu', '2026-04-02', '9812121213', 'Active', '2026-04-22 00:00:00', 'Buyer', 'second'),
(3, 'Third oned', 'member2@gmail.com', '$2a$10$0CRmhM3zp3Dsw0qrT6DQ3O5RlWt8WGdHGnOrsPhtN.N2a6rnZnHdS', '2010-02-02', '9812121214', 'Active', '2026-04-23 00:00:00', 'Buyer', 'third'),
(4, 'Fourth User', 'fourth@gmail.com', '$2a$10$LhFkL7dXP7hIcgwlZhtccu6FcJBK6ZdlpxeNeVic6esPgJTau3wXS', '2026-04-29', '9812121215', 'Active', '2026-05-02 00:00:00', 'Buyer', 'fourth'),
(5, 'Fifth User', 'fifth@gmail.com', '$2a$10$ILrqg8gLvXz.1xttogT2T.sHgAn7dOkZQd2g7/jiwUcWFG7zj.6j2', '2026-04-28', '9812121216', 'Active', '2026-05-02 00:00:00', 'Seller', 'fifth'),
(9, 'Sixth user', 'adityapudasaini13@gmail.com', '$2a$10$BcGJWQgqvwN.Q5f.mAAL/.PL2Ut6gOvIqmZpdyuJXCdliIYxrD2fG', '2009-02-03', '9876556789', 'Banned', '2026-05-19 00:00:00', 'Buyer', 'sixth'),
(10, 'Again Register', 'again@gmail.com', '$2a$10$bVxu9t8h1PYmbVTT7YPdF.qqonOMHypiGH0PWPkEY5de4cT8a6tsy', '2002-02-27', '9876556782', 'Active', '2026-05-20 00:00:00', 'Buyer', 'again'),
(11, 'Again Registe', 'again1@gmail.com', '$2a$10$MsE9a6L0npt8IiyuTL.9ruD7sNvMMHnq3LHruTfc9Vfq.sG8NDPh.', '2002-02-27', '9876556783', 'Active', '2026-05-20 00:00:00', 'Buyer', 'agai'),
(13, 'Full Name', 'agai@gmail.com', '$2a$10$Kabz/kZk0bClTznt1Yyt4eSRPTlXrztk0DdoGVOcMbJOz3q8jh0GG', '2005-01-11', '9812121234', 'Active', '2026-05-21 00:00:00', 'Buyer', 'aga');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `Order_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `Order_Date` datetime NOT NULL DEFAULT current_timestamp(),
  `Order_Status` varchar(30) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`Order_ID`, `Member_ID`, `Order_Date`, `Order_Status`) VALUES
(1, 1, '2025-04-01 10:00:00', 'Completed'),
(2, 2, '2025-04-03 11:30:00', 'Pending'),
(3, 3, '2025-04-05 14:00:00', 'Completed'),
(4, 4, '2025-04-08 09:15:00', 'Refunded'),
(5, 5, '2025-04-10 16:45:00', 'Completed'),
(6, 1, '2026-05-18 11:29:55', 'Completed'),
(7, 2, '2026-05-18 11:29:55', 'Completed'),
(8, 1, '2026-05-10 10:00:00', 'Completed'),
(9, 3, '2026-05-20 11:07:31', 'Pending'),
(10, 3, '2026-05-20 14:42:05', 'Pending'),
(11, 3, '2026-05-20 18:57:34', 'Completed'),
(12, 3, '2026-05-21 06:51:13', 'Completed'),
(13, 3, '2026-05-21 14:15:40', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `Order_Item_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Item_Quantity` int(11) NOT NULL,
  `Item_Price` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`Order_Item_ID`, `Order_ID`, `Product_ID`, `Item_Quantity`, `Item_Price`) VALUES
(1, 1, 3, 1, 129.00),
(2, 2, 1, 1, 2499.00),
(3, 3, 4, 1, 349.00),
(4, 4, 6, 1, 399.00),
(5, 5, 5, 1, 99.00),
(6, 6, 1, 1, 2499.00),
(7, 7, 2, 1, 1199.00),
(10, 8, 7, 1, 179.00),
(11, 9, 12, 1, 11.00),
(12, 10, 3, 2, 129.00),
(13, 11, 3, 1, 129.00),
(14, 12, 1, 5, 2499.00),
(15, 13, 3, 1, 129.00);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Payment_Method` varchar(50) NOT NULL,
  `Payment_Date` datetime NOT NULL DEFAULT current_timestamp(),
  `Payment_Amount` decimal(12,2) NOT NULL,
  `Payment_Status` varchar(30) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Payment_ID`, `Order_ID`, `Payment_Method`, `Payment_Date`, `Payment_Amount`, `Payment_Status`) VALUES
(1, 1, 'Credit Card', '2025-04-01 10:05:00', 129.00, 'Completed'),
(2, 2, 'PayPal', '2025-04-03 11:35:00', 2499.00, 'Pending'),
(3, 3, 'Credit Card', '2025-04-05 14:05:00', 349.00, 'Completed'),
(4, 4, 'Debit Card', '2025-04-08 09:20:00', 399.00, 'Refunded'),
(5, 5, 'Credit Card', '2025-04-10 16:50:00', 99.00, 'Completed'),
(6, 6, 'Credit Card', '2026-05-18 11:29:55', 2499.00, 'Completed'),
(7, 7, 'Credit Card', '2026-05-18 11:29:55', 1199.00, 'Completed'),
(10, 8, 'Credit Card', '2026-05-10 10:05:00', 179.00, 'Completed'),
(11, 11, 'Online', '2026-05-20 18:57:34', 129.00, 'Completed'),
(12, 12, 'Online', '2026-05-21 06:51:13', 12495.00, 'Completed'),
(13, 13, 'Online', '2026-05-21 14:15:40', 129.00, 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` int(11) NOT NULL,
  `Category_ID` int(11) NOT NULL,
  `Seller_ID` int(11) NOT NULL,
  `Product_Name` varchar(150) NOT NULL,
  `Product_Description` text DEFAULT NULL,
  `Product_Price` decimal(12,2) NOT NULL,
  `Stock_Quantity` int(11) NOT NULL DEFAULT 0,
  `Listed_Date` date DEFAULT NULL,
  `Active_Status` varchar(20) NOT NULL DEFAULT 'active',
  `isFlagged` varchar(255) NOT NULL DEFAULT 'FLagged'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Category_ID`, `Seller_ID`, `Product_Name`, `Product_Description`, `Product_Price`, `Stock_Quantity`, `Listed_Date`, `Active_Status`, `isFlagged`) VALUES
(1, 1, 5, 'MacBook Pro M3', 'Latest Apple MacBook Pro', 2499.00, 0, '2025-04-10', 'Active', '0'),
(2, 1, 5, 'Samsung Galaxy S24 Ultra', 'Latest Samsung flagship', 1199.00, 18, '2025-03-28', 'Banned', '1'),
(3, 2, 5, 'Nike Air Max 270', 'Comfortable running shoes', 129.00, 30, '2025-04-12', 'Active', '0'),
(4, 3, 5, 'Sony WH-1000XM5', 'Noise cancelling headphones', 349.00, 120, '2025-04-08', 'Active', '0'),
(5, 4, 5, 'Logitech MX Master 3S', 'Wireless productivity mouse', 99.00, 200, '2025-04-02', 'Active', '0'),
(6, 5, 5, 'Apple Watch Series 9', 'Latest Apple smartwatch', 399.00, 52, '2025-04-05', 'Banned', '1'),
(7, 2, 3, 'Adidas Ultraboost 22', 'High performance running shoes', 179.00, 15, '2025-04-10', 'Active', '0'),
(10, 4, 3, 'Product', 'asdasd', 1.00, 1, '2026-05-20', 'Banned', '1'),
(11, 3, 3, 'Earbud', 'Second hand eartbuds', 100.00, 1, '2026-05-20', 'Banned', '1'),
(12, 4, 3, 'Earbuddddd', 'sadas', 11.00, 0, '2026-05-20', 'Active', '0'),
(13, 2, 3, 'Shoes Brands', 'asdas', 5.00, 1, '2026-05-20', 'Banned', '0'),
(14, 4, 3, 'Product AI', 'adfsada', 5.10, 1, '2026-05-21', 'Active', '0');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `Review_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `Review_Rating` tinyint(4) NOT NULL CHECK (`Review_Rating` between 1 and 5),
  `Review_Comment` text DEFAULT NULL,
  `Review_Date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`Review_ID`, `Product_ID`, `Member_ID`, `Review_Rating`, `Review_Comment`, `Review_Date`) VALUES
(1, 12, 3, 4, 'Try rating', '2026-05-20 11:29:44'),
(2, 3, 3, 4, 'ramro', '2026-05-20 18:55:26');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `Wishlist_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `Created_At` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`Wishlist_ID`, `Member_ID`, `Created_At`) VALUES
(1, 1, '2026-04-15 08:00:00'),
(2, 2, '2026-04-16 09:00:00'),
(3, 3, '2026-04-17 10:00:00'),
(4, 4, '2026-04-18 11:00:00'),
(5, 5, '2026-04-19 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_item`
--

CREATE TABLE `wishlist_item` (
  `Wishlist_Item_ID` int(11) NOT NULL,
  `Wishlist_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Added_Date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist_item`
--

INSERT INTO `wishlist_item` (`Wishlist_Item_ID`, `Wishlist_ID`, `Product_ID`, `Added_Date`) VALUES
(1, 1, 4, '2026-04-15 08:10:00'),
(2, 1, 5, '2026-04-16 09:00:00'),
(3, 1, 6, '2026-04-17 10:00:00'),
(4, 2, 1, '2026-04-18 11:00:00'),
(5, 2, 3, '2026-04-19 12:00:00'),
(8, 4, 3, '2026-04-22 15:00:00'),
(9, 4, 6, '2026-04-23 16:00:00'),
(10, 5, 4, '2026-04-24 17:00:00'),
(11, 5, 1, '2026-04-25 18:00:00'),
(12, 1, 4, '2026-05-20 02:21:49'),
(13, 1, 5, '2026-05-20 02:21:49'),
(14, 1, 6, '2026-05-20 02:21:49'),
(15, 3, 12, '2026-05-20 11:07:33'),
(16, 3, 1, '2026-05-21 06:51:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_ID`),
  ADD UNIQUE KEY `Admin_Email` (`Admin_Email`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Cart_ID`),
  ADD KEY `fk_cart_member` (`Member_ID`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`Cart_Items_ID`),
  ADD KEY `fk_cartitems_product` (`Product_ID`),
  ADD KEY `fk_cartitems_cart` (`Cart_ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_ID`);

--
-- Indexes for table `contacted`
--
ALTER TABLE `contacted`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `export_history`
--
ALTER TABLE `export_history`
  ADD PRIMARY KEY (`Export_ID`);

--
-- Indexes for table `flag_report`
--
ALTER TABLE `flag_report`
  ADD PRIMARY KEY (`Flag_ID`),
  ADD KEY `Product_ID` (`Product_ID`),
  ADD KEY `Reported_By_Member` (`Reported_By_Member`),
  ADD KEY `Reported_By_Admin` (`Reported_By_Admin`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`Member_ID`),
  ADD UNIQUE KEY `Member_Email` (`Member_Email`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `fk_order_member` (`Member_ID`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`Order_Item_ID`),
  ADD KEY `fk_orderitem_order` (`Order_ID`),
  ADD KEY `fk_orderitem_product` (`Product_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `fk_payment_order` (`Order_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `fk_product_category` (`Category_ID`),
  ADD KEY `fk_product_seller` (`Seller_ID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`Review_ID`),
  ADD KEY `fk_review_product` (`Product_ID`),
  ADD KEY `fk_review_member` (`Member_ID`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`Wishlist_ID`),
  ADD KEY `fk_wishlist_member` (`Member_ID`);

--
-- Indexes for table `wishlist_item`
--
ALTER TABLE `wishlist_item`
  ADD PRIMARY KEY (`Wishlist_Item_ID`),
  ADD KEY `fk_wishlistitem_wishlist` (`Wishlist_ID`),
  ADD KEY `fk_wishlistitem_product` (`Product_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Admin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `Cart_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `Cart_Items_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `Category_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contacted`
--
ALTER TABLE `contacted`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `export_history`
--
ALTER TABLE `export_history`
  MODIFY `Export_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `flag_report`
--
ALTER TABLE `flag_report`
  MODIFY `Flag_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `Member_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `Order_Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `Review_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `Wishlist_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wishlist_item`
--
ALTER TABLE `wishlist_item`
  MODIFY `Wishlist_Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_member` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `fk_cartitems_cart` FOREIGN KEY (`Cart_ID`) REFERENCES `cart` (`Cart_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cartitems_product` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `flag_report`
--
ALTER TABLE `flag_report`
  ADD CONSTRAINT `flag_report_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`),
  ADD CONSTRAINT `flag_report_ibfk_2` FOREIGN KEY (`Reported_By_Member`) REFERENCES `member` (`Member_ID`),
  ADD CONSTRAINT `flag_report_ibfk_3` FOREIGN KEY (`Reported_By_Admin`) REFERENCES `admin` (`Admin_ID`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_member` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `fk_orderitem_order` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_orderitem_product` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_order` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`),
  ADD CONSTRAINT `fk_product_seller` FOREIGN KEY (`Seller_ID`) REFERENCES `member` (`Member_ID`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fk_review_member` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`),
  ADD CONSTRAINT `fk_review_product` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `fk_wishlist_member` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist_item`
--
ALTER TABLE `wishlist_item`
  ADD CONSTRAINT `fk_wishlistitem_product` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`),
  ADD CONSTRAINT `fk_wishlistitem_wishlist` FOREIGN KEY (`Wishlist_ID`) REFERENCES `wishlist` (`Wishlist_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
