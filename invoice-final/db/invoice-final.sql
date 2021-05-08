-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2021 at 03:51 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoice-final`
--

-- --------------------------------------------------------

--
-- Table structure for table `invoice_order`
--

CREATE TABLE `invoice_order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_receiver_name` varchar(250) NOT NULL,
  `order_receiver_address` text NOT NULL,
  `order_receiver_vehicle_brand` varchar(100) NOT NULL,
  `order_receiver_vehicle_model` varchar(100) NOT NULL,
  `order_total_before_tax` decimal(10,2) NOT NULL,
  `order_total_tax` decimal(10,2) NOT NULL,
  `order_tax_per` varchar(250) NOT NULL,
  `order_total_after_tax` double(10,2) NOT NULL,
  `order_amount_paid` decimal(10,2) NOT NULL,
  `order_total_amount_due` decimal(10,2) NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_order`
--

INSERT INTO `invoice_order` (`order_id`, `user_id`, `order_date`, `order_receiver_name`, `order_receiver_address`, `order_receiver_vehicle_brand`, `order_receiver_vehicle_model`, `order_total_before_tax`, `order_total_tax`, `order_tax_per`, `order_total_after_tax`, `order_amount_paid`, `order_total_amount_due`, `note`) VALUES
(7, 1, '2021-03-19 14:03:10', 'SuperBrand', 'SuperBrand Location', 'Nissan', 'GTR', '3000.00', '450.00', '15', 3450.00, '0.00', '3450.00', ''),
(8, 1, '2021-03-19 14:09:08', 'Toyota Ltd', 'Boksburg Street', 'Toyota', 'Corola', '1000.00', '150.00', '15', 1150.00, '0.00', '1150.00', ''),
(9, 1, '2021-03-19 14:16:30', 'Manuel Azevedo', 'Manuel Azevedos Address', 'Subaru', 'Impreza WRX', '45000.00', '150.00', '15', 1150.00, '0.00', '1150.00', ''),
(10, 1, '2021-03-19 14:31:02', 'Arturinho', 'Arturinhos address', 'BMW', 'GS 650 Byke', '2000.00', '300.00', '15', 2300.00, '0.00', '2300.00', ''),
(11, 1, '2021-03-20 10:59:40', 'Lamborghini PTY LTD', 'Presidential Street, street nr 47 Germiston SA', 'Lamborghini ', 'Aventador', '7000.00', '1050.00', '15', 8050.00, '0.00', '8050.00', ''),
(12, 1, '2021-03-20 11:03:21', 'Dalia Narane', 'Dalias Address', 'Toyota', 'Fortuner', '1350.00', '202.50', '15', 1552.50, '0.00', '1552.50', ''),
(13, 1, '2021-03-20 14:37:36', 'drrrrr', 'hhhhh', 'jghjghj', 'ghjgjg', '8000.00', '1200.00', '15', 9200.00, '0.00', '9200.00', ''),
(14, 1, '2021-03-24 14:38:15', 'asdasaaa', 'dsadasdd', 'New Vehicle 24', 'aasdsdad', '10350.00', '1552.50', '15', 11902.50, '0.00', '11902.50', ''),
(15, 1, '2021-03-25 11:27:30', 'Ricardo Santorini', 'Ricardo Santorini', 'Lexus ', 'IS 200 V6 2010', '2000.00', '300.00', '15', 2300.00, '0.00', '2300.00', '');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_order_item`
--

CREATE TABLE `invoice_order_item` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_name` varchar(250) NOT NULL,
  `order_item_quantity` decimal(10,2) NOT NULL DEFAULT '1.00',
  `order_item_price` decimal(10,2) NOT NULL,
  `order_item_final_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_order_item`
--

INSERT INTO `invoice_order_item` (`order_item_id`, `order_id`, `item_name`, `order_item_quantity`, `order_item_price`, `order_item_final_amount`) VALUES
(17, 7, 'ffffadadad', '0.00', '3000.00', '3000.00'),
(18, 7, '', '0.00', '0.00', '0.00'),
(19, 7, '', '0.00', '0.00', '0.00'),
(20, 8, 'dadadddadji', '0.00', '1000.00', '1000.00'),
(21, 8, '', '0.00', '0.00', '0.00'),
(22, 9, 'Body repaind and cleaning according to quotation nr4236 vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv', '0.00', '45000.00', '45000.00'),
(23, 9, '', '0.00', '0.00', '0.00'),
(24, 10, 'a', '1.00', '2000.00', '2000.00'),
(25, 10, '', '1.00', '0.00', '0.00'),
(26, 10, '', '1.00', '0.00', '0.00'),
(37, 11, 'aaaaaaaa', '1.00', '5000.00', '5000.00'),
(38, 11, 'bbbbbbb', '1.00', '5000.00', '5000.00'),
(42, 12, 'Full body Paint', '1.00', '1000.00', '1000.00'),
(43, 12, 'new Radiator Instalation', '1.00', '350.00', '350.00'),
(44, 12, 'All 4 New tires', '1.00', '9000.00', '9000.00'),
(50, 13, 'a', '1.00', '5000.00', '5000.00'),
(51, 13, 'b', '1.00', '3000.00', '3000.00'),
(52, 13, 'c', '1.00', '1000.00', '1000.00'),
(53, 14, 'dasd', '1.00', '9000.00', '9000.00'),
(54, 14, 'dds', '1.00', '1000.00', '1000.00'),
(55, 14, 'sad', '1.00', '350.00', '350.00'),
(59, 15, 'Full body painting and scraches repair', '1.00', '2000.00', '2000.00'),
(60, 15, 'second item', '1.00', '3000.00', '3000.00');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_user`
--

CREATE TABLE `invoice_user` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_user`
--

INSERT INTO `invoice_user` (`id`, `email`, `password`, `first_name`, `last_name`, `mobile`, `address`) VALUES
(1, 'kassamo.narane@gmail.com', '12345', 'C.O.C Autobody', ' Repairs', 110366555, '76-78 Knox street Germiston');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `invoice_order`
--
ALTER TABLE `invoice_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `invoice_order_item`
--
ALTER TABLE `invoice_order_item`
  ADD PRIMARY KEY (`order_item_id`);

--
-- Indexes for table `invoice_user`
--
ALTER TABLE `invoice_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `invoice_order`
--
ALTER TABLE `invoice_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `invoice_order_item`
--
ALTER TABLE `invoice_order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `invoice_user`
--
ALTER TABLE `invoice_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
