-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2025 at 02:14 PM
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
-- Database: `evidence`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_manufecture` (IN `name` VARCHAR(100), IN `contact` VARCHAR(12))   BEGIN
INSERT INTO manufecture(name,contact)VALUES(name,contact); 

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manufecture`
--

CREATE TABLE `manufecture` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `manufecture`
--

INSERT INTO `manufecture` (`id`, `name`, `contact`) VALUES
(4, 'sony', '5346'),
(5, 'LG', '904812785');

--
-- Triggers `manufecture`
--
DELIMITER $$
CREATE TRIGGER `delete_product` AFTER DELETE ON `manufecture` FOR EACH ROW BEGIN
DELETE FROM products WHERE manufacture_id=old.id;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `manufacture_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `contact`, `manufacture_id`) VALUES
(3, 'TV', '2345', '57487', 4),
(4, 'AC', '34567', '34637', 4),
(5, 'Mobile', '4236478', '', 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_product_list`
-- (See below for the actual view)
--
CREATE TABLE `v_product_list` (
`id` int(11)
,`product_name` varchar(100)
,`mfg_Name` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure for view `v_product_list`
--
DROP TABLE IF EXISTS `v_product_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_product_list`  AS SELECT `p`.`id` AS `id`, `p`.`name` AS `product_name`, `m`.`name` AS `mfg_Name` FROM (`products` `p` join `manufecture` `m`) WHERE `m`.`id` = `p`.`manufacture_id` AND `p`.`price` > 5000 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `manufecture`
--
ALTER TABLE `manufecture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `manufecture`
--
ALTER TABLE `manufecture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
