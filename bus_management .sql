-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 08, 2022 at 06:54 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking_ticket`
--

DROP TABLE IF EXISTS `booking_ticket`;
CREATE TABLE IF NOT EXISTS `booking_ticket` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `number_of_seats` int(2) NOT NULL,
  `fare_amount` float NOT NULL,
  `total_amount` float NOT NULL,
  `date_of_booking` datetime NOT NULL,
  `booking_status` int(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `schedule_id` (`schedule_id`,`customer_id`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
CREATE TABLE IF NOT EXISTS `bus` (
  `bus_id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_number` varchar(15) NOT NULL,
  `bus_plate_number` varchar(15) NOT NULL,
  `bus_type` int(2) NOT NULL,
  `seat_capacity` int(5) NOT NULL,
  `user_id` int(20) NOT NULL,
  PRIMARY KEY (`bus_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bus_schedule`
--

DROP TABLE IF EXISTS `bus_schedule`;
CREATE TABLE IF NOT EXISTS `bus_schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `starting_point` varchar(30) NOT NULL,
  `destination` varchar(30) NOT NULL,
  `schedule_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `estimated_arrival_time` time NOT NULL,
  `fare_amount` float NOT NULL,
  `remarks` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `bus_id` (`bus_id`,`driver_id`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `driver_id` (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) NOT NULL,
  `customer_contact` varchar(15) NOT NULL,
  `customer_email` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `account_status` int(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
CREATE TABLE IF NOT EXISTS `driver` (
  `driver_id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_name` varchar(50) NOT NULL,
  `driver_contact` varchar(15) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`driver_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `amount_paid` float NOT NULL,
  `payment_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `booking_id` (`booking_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `email_address` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `userpassword` varchar(30) NOT NULL,
  `account_category` int(1) NOT NULL,
  `account_status` int(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_ticket`
--
ALTER TABLE `booking_ticket`
  ADD CONSTRAINT `booking_ticket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ticket_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ticket_ibfk_3` FOREIGN KEY (`schedule_id`) REFERENCES `bus_schedule` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bus_schedule`
--
ALTER TABLE `bus_schedule`
  ADD CONSTRAINT `bus_schedule_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bus_schedule_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bus_schedule_ibfk_3` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `booking_ticket` (`booking_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
