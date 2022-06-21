-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 20, 2022 at 11:07 AM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `company_website_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_profile`
--

DROP TABLE IF EXISTS `admin_profile`;
CREATE TABLE IF NOT EXISTS `admin_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_profile`
--

INSERT INTO `admin_profile` (`id`, `full_name`, `email`, `mobile`, `address`, `password`, `status`, `created_at`) VALUES
(1, 'IAM Admin', 'psgajanan@corenttech.com', '8939812121', 'Chennai', 'cd84d683cc5612c69efe115c80d0b7dc', 1, '2020-06-17 18:39:52.830541'),
(10, 'Super Admin', 'superadmin@gmail.com', '1234567890', 'Noida', '0192023a7bbd73250516f069df18b500', 1, '2020-06-17 18:38:43.432266'),
(11, 'Test admin', 'testadmin@gmail.com', '1234567890', 'New Delhi', '0192023a7bbd73250516f069df18b500', 1, '2020-06-17 18:39:14.874271');

-- --------------------------------------------------------

--
-- Table structure for table `azure_password`
--

DROP TABLE IF EXISTS `azure_password`;
CREATE TABLE IF NOT EXISTS `azure_password` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Team` varchar(255) NOT NULL,
  `ManagerEmailID` varchar(255) NOT NULL,
  `SenderName` varchar(255) NOT NULL,
  `SenderEmailID` varchar(255) NOT NULL,
  `IAM_User_Email` varchar(255) NOT NULL,
  `IAM_User_Password` varchar(255) NOT NULL,
  `created_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `azure_password`
--

INSERT INTO `azure_password` (`id`, `Team`, `ManagerEmailID`, `SenderName`, `SenderEmailID`, `IAM_User_Email`, `IAM_User_Password`) VALUES
(1, 'QA', 'gajananps@yahoo.com', 'GajananPS', 'psgajanan@corenttech.com', 'test@corenttech.com', 'EeY7f2WDxboMvtj#!UZJA'),
(2, 'Dev', 'igajananps@gmail.com', 'GopalakrishnanM', 'mgopalakrishnan@corenttech.com', 'test1@corenttech.com', 'pEmjhrOZH99=X@JiaXVpR'),
(3, 'POC', 'gajananps.gps@gmail.com', 'SaravananTK', 'tksaravanan@corenttech.com', 'test2@corenttech.com', '03fAVb$VO@aoOwnEkRBBz');

-- --------------------------------------------------------

--
-- Table structure for table `color_setting`
--

DROP TABLE IF EXISTS `color_setting`;
CREATE TABLE IF NOT EXISTS `color_setting` (
  `id` int NOT NULL,
  `navbar_background` varchar(255) NOT NULL,
  `sidebar_background` varchar(255) NOT NULL,
  `text_color` varchar(255) NOT NULL,
  `save_button_color` varchar(255) NOT NULL,
  `edit_button_color` varchar(255) NOT NULL,
  `delete_button_color` varchar(255) NOT NULL,
  `view_button_color` varchar(255) NOT NULL,
  `label_text_color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `color_setting`
--

INSERT INTO `color_setting` (`id`, `navbar_background`, `sidebar_background`, `text_color`, `save_button_color`, `edit_button_color`, `delete_button_color`, `view_button_color`, `label_text_color`) VALUES
(1, '#0763c5', '#0f40b3', '#dad7d7', '#049a2a', '#11ac2b', '#c60c0c', '#6c6a6a', '#434242');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
