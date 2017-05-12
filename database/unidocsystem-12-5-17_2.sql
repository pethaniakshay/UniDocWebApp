-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2017 at 04:05 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unidocsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `uid` varchar(12) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `house_no` varchar(250) DEFAULT NULL,
  `street` varchar(250) DEFAULT NULL,
  `area` varchar(250) DEFAULT NULL,
  `village` varchar(250) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT 'India',
  `pincode` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`uid`, `title`, `house_no`, `street`, `area`, `village`, `city`, `district`, `state`, `country`, `pincode`) VALUES
('123412341234', 'S/O Dilipbhai Pethani,', 'BLock-D, RajLakshmi Bunglows,', 'Janta Nagar Main Road,', 'TakudiPara,', NULL, 'Jetpur', 'Rajkot', 'Gujarat', 'India', '360370'),
('655', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `bank_account_no` varchar(15) NOT NULL,
  `uid` varchar(12) NOT NULL,
  `bankname` varchar(50) DEFAULT NULL,
  `ifsc` varchar(10) DEFAULT NULL,
  `branchname` varchar(50) DEFAULT NULL,
  `actype` varchar(50) DEFAULT NULL,
  `isverified` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`bank_account_no`, `uid`, `bankname`, `ifsc`, `branchname`, `actype`, `isverified`) VALUES
('12345678', '123412341234', 'Bank of India', 'ASD3456', 'Jetpour', 'Saving', 1),
('455675675', '123412341234', 'Satate Bank OF India', 'sdf34', 'BapuNagar', 'Cureent', 1);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `district` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`district`, `city`) VALUES
('Rajkot', 'Jetpur'),
('Rajkot', 'Gondal'),
('Rajkot', 'Morbi'),
('Surat', 'Bardoli'),
('Surat', 'Vapi'),
('Junagadh', 'Mangrol'),
('Junagadh', 'Junadadh'),
('Rajkot', 'Rajkot');

-- --------------------------------------------------------

--
-- Table structure for table `contact_email`
--

CREATE TABLE `contact_email` (
  `uid` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_email`
--

INSERT INTO `contact_email` (`uid`, `email`) VALUES
('123412341234', 'patelaksh412@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `contact_mobile`
--

CREATE TABLE `contact_mobile` (
  `uid` varchar(12) NOT NULL,
  `mboile` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_mobile`
--

INSERT INTO `contact_mobile` (`uid`, `mboile`) VALUES
('123412341234', '7698760080');

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `state` varchar(20) NOT NULL,
  `district` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`state`, `district`) VALUES
('Gujarat', 'Rajkot'),
('Gujarat', 'Surat'),
('Gujarat', 'Porbandar'),
('Gujarat', 'Junagadh'),
('Gujarat', 'Morbi'),
('Manipur', 'Birla'),
('Manipur', 'Zansi'),
('Manipur', 'Sarkira'),
('Rajasthan', 'Abu'),
('Rajasthan', 'Jaipur');

-- --------------------------------------------------------

--
-- Table structure for table `driving_licence`
--

CREATE TABLE `driving_licence` (
  `dl_no` varchar(15) NOT NULL,
  `uid` varchar(12) NOT NULL,
  `cdoi` date NOT NULL,
  `doi` date NOT NULL,
  `exp_date` date NOT NULL,
  `isverified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driving_licence`
--

INSERT INTO `driving_licence` (`dl_no`, `uid`, `cdoi`, `doi`, `exp_date`, `isverified`) VALUES
('DL8787DF', '123412341234', '2017-05-11', '2017-05-09', '2017-05-31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `eci_id`
--

CREATE TABLE `eci_id` (
  `Eci_card_no` varchar(10) NOT NULL,
  `uid` varchar(12) NOT NULL,
  `isverified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eci_id`
--

INSERT INTO `eci_id` (`Eci_card_no`, `uid`, `isverified`) VALUES
('67FGDS', '123412341234', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ekycprovider`
--

CREATE TABLE `ekycprovider` (
  `ekyc_id` int(5) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `permissionindex` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `isalive`
--

CREATE TABLE `isalive` (
  `uid` varchar(12) NOT NULL,
  `IsAlive` tinyint(1) NOT NULL DEFAULT '1',
  `datoefdeath` date DEFAULT NULL,
  `cause` varchar(150) DEFAULT NULL,
  `uidinformed` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `isalive`
--

INSERT INTO `isalive` (`uid`, `IsAlive`, `datoefdeath`, `cause`, `uidinformed`) VALUES
('123412341234', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `uid` varchar(12) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `maritaldeatials`
--

CREATE TABLE `maritaldeatials` (
  `uid` varchar(12) NOT NULL,
  `uidpartner` varchar(12) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `marriagedate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maritaldeatials`
--

INSERT INTO `maritaldeatials` (`uid`, `uidpartner`, `status`, `marriagedate`) VALUES
('123412341234', NULL, NULL, '2017-05-10');

-- --------------------------------------------------------

--
-- Table structure for table `newregistereddata`
--

CREATE TABLE `newregistereddata` (
  `firstname` varchar(99) DEFAULT NULL,
  `middlename` varchar(99) DEFAULT NULL,
  `lastname` varchar(99) DEFAULT NULL,
  `fullname` varchar(99) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `regbase` varchar(20) DEFAULT NULL,
  `uidmother` varchar(12) DEFAULT NULL,
  `uidfather` varchar(12) DEFAULT NULL,
  `uidgaurdian` varchar(12) DEFAULT NULL,
  `uidother` varchar(12) DEFAULT NULL,
  `mstatus` varchar(20) DEFAULT NULL,
  `uidpartner` varchar(12) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `uidtakefrom` varchar(12) DEFAULT NULL,
  `house` varchar(250) DEFAULT NULL,
  `street` varchar(250) DEFAULT NULL,
  `area` varchar(250) DEFAULT NULL,
  `village` varchar(250) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `poi` varchar(250) DEFAULT NULL,
  `poin` varchar(50) DEFAULT NULL,
  `pob` varchar(250) DEFAULT NULL,
  `pobn` varchar(50) DEFAULT NULL,
  `poa` varchar(250) DEFAULT NULL,
  `poan` varchar(250) DEFAULT NULL,
  `isprocessed` varchar(10) NOT NULL DEFAULT 'no',
  `pre_enroll` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newregistereddata`
--

INSERT INTO `newregistereddata` (`firstname`, `middlename`, `lastname`, `fullname`, `gender`, `dob`, `regbase`, `uidmother`, `uidfather`, `uidgaurdian`, `uidother`, `mstatus`, `uidpartner`, `title`, `uidtakefrom`, `house`, `street`, `area`, `village`, `pincode`, `city`, `district`, `state`, `country`, `email`, `mobile`, `poi`, `poin`, `pob`, `pobn`, `poa`, `poan`, `isprocessed`, `pre_enroll`) VALUES
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pan_number`
--

CREATE TABLE `pan_number` (
  `pan_number` varchar(10) NOT NULL,
  `uid` varchar(12) NOT NULL,
  `isverified` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pan_number`
--

INSERT INTO `pan_number` (`pan_number`, `uid`, `isverified`) VALUES
('Qsde234', '123412341234', 1);

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `uid` varchar(12) NOT NULL,
  `mother_uid` varchar(12) DEFAULT NULL,
  `father_uid` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`uid`, `mother_uid`, `father_uid`) VALUES
('655', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_manager`
--

CREATE TABLE `permission_manager` (
  `uid` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registrarlogin`
--

CREATE TABLE `registrarlogin` (
  `uid` varchar(12) NOT NULL,
  `passwd` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resident`
--

CREATE TABLE `resident` (
  `uid` varchar(12) NOT NULL,
  `full_name` varchar(99) DEFAULT NULL,
  `first_name` varchar(99) DEFAULT NULL,
  `middle_name` varchar(99) DEFAULT NULL,
  `last_name` varchar(99) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `photo` blob,
  `sign` blob,
  `pre_enroll` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resident`
--

INSERT INTO `resident` (`uid`, `full_name`, `first_name`, `middle_name`, `last_name`, `gender`, `dob`, `photo`, `sign`, `pre_enroll`) VALUES
('123', 'Raj patel', 'ARaj', 'asd', 'dssdf', 'male', '2017-05-08', NULL, NULL, NULL),
('123412341234', 'Akshay Pethani', 'Akshay', 'Dilipbhai', 'Pethani', 'Male', '1995-12-04', NULL, NULL, 567567567),
('134', 'qasasa', 'asas', 'asaaa', 'asaa', 'asas', '2017-05-03', NULL, NULL, NULL),
('145', 'sds', 'dsdds', 'sdsddsd', 'sdsdd', 'sdssds', '2017-05-24', NULL, NULL, NULL),
('156', 'sdssds', 'ssdsds', 'dsdsd', 'dsdsdssds', 'fffff', '2017-05-03', NULL, NULL, NULL),
('655', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `residentlogin`
--

CREATE TABLE `residentlogin` (
  `uid` varchar(12) NOT NULL,
  `passwd` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `residentlogin`
--

INSERT INTO `residentlogin` (`uid`, `passwd`) VALUES
('123412341234', 'qazwsxedc');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `uid` varchar(12) NOT NULL,
  `school_id` int(5) NOT NULL,
  `std` varchar(50) DEFAULT NULL,
  `rslt` varchar(50) DEFAULT NULL,
  `year` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `addmission_number` int(16) NOT NULL,
  `uid` varchar(12) NOT NULL,
  `school_id` varchar(10) DEFAULT NULL,
  `joine_date` date DEFAULT NULL,
  `leave_date` date DEFAULT NULL,
  `study_detail` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `country` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`country`, `state`) VALUES
('India', 'Gujarat'),
('India', 'Maharatra'),
('India', 'Rajasthan'),
('India', 'Manipur');

-- --------------------------------------------------------

--
-- Table structure for table `super_admin`
--

CREATE TABLE `super_admin` (
  `username` varchar(50) NOT NULL,
  `passwd` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `super_admin`
--

INSERT INTO `super_admin` (`username`, `passwd`) VALUES
('pethaniakshay', '123');

-- --------------------------------------------------------

--
-- Table structure for table `uidbuffered`
--

CREATE TABLE `uidbuffered` (
  `snumber` varchar(16) NOT NULL,
  `uid` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uidbuffered`
--

INSERT INTO `uidbuffered` (`snumber`, `uid`) VALUES
('123', '34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`bank_account_no`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `contact_email`
--
ALTER TABLE `contact_email`
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `contact_mobile`
--
ALTER TABLE `contact_mobile`
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `driving_licence`
--
ALTER TABLE `driving_licence`
  ADD PRIMARY KEY (`dl_no`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `eci_id`
--
ALTER TABLE `eci_id`
  ADD PRIMARY KEY (`Eci_card_no`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `ekycprovider`
--
ALTER TABLE `ekycprovider`
  ADD PRIMARY KEY (`ekyc_id`);

--
-- Indexes for table `isalive`
--
ALTER TABLE `isalive`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `maritaldeatials`
--
ALTER TABLE `maritaldeatials`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `uidpartner` (`uidpartner`);

--
-- Indexes for table `newregistereddata`
--
ALTER TABLE `newregistereddata`
  ADD PRIMARY KEY (`pre_enroll`);

--
-- Indexes for table `pan_number`
--
ALTER TABLE `pan_number`
  ADD PRIMARY KEY (`pan_number`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `mother_uid` (`mother_uid`),
  ADD KEY `father_uid` (`father_uid`);

--
-- Indexes for table `registrarlogin`
--
ALTER TABLE `registrarlogin`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `resident`
--
ALTER TABLE `resident`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `pre_enroll` (`pre_enroll`);

--
-- Indexes for table `residentlogin`
--
ALTER TABLE `residentlogin`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`addmission_number`),
  ADD KEY `uid` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ekycprovider`
--
ALTER TABLE `ekycprovider`
  MODIFY `ekyc_id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `newregistereddata`
--
ALTER TABLE `newregistereddata`
  MODIFY `pre_enroll` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `school`
--
ALTER TABLE `school`
  MODIFY `addmission_number` int(16) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD CONSTRAINT `bank_accounts_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `resident` (`uid`);

--
-- Constraints for table `contact_email`
--
ALTER TABLE `contact_email`
  ADD CONSTRAINT `contact_email_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `resident` (`uid`);

--
-- Constraints for table `contact_mobile`
--
ALTER TABLE `contact_mobile`
  ADD CONSTRAINT `contact_mobile_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `resident` (`uid`);

--
-- Constraints for table `driving_licence`
--
ALTER TABLE `driving_licence`
  ADD CONSTRAINT `driving_licence_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `resident` (`uid`);

--
-- Constraints for table `eci_id`
--
ALTER TABLE `eci_id`
  ADD CONSTRAINT `eci_id_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `resident` (`uid`);

--
-- Constraints for table `isalive`
--
ALTER TABLE `isalive`
  ADD CONSTRAINT `isalive_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `resident` (`uid`);

--
-- Constraints for table `maritaldeatials`
--
ALTER TABLE `maritaldeatials`
  ADD CONSTRAINT `maritaldeatials_ibfk_1` FOREIGN KEY (`uidpartner`) REFERENCES `resident` (`uid`),
  ADD CONSTRAINT `maritaldeatials_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `resident` (`uid`);

--
-- Constraints for table `pan_number`
--
ALTER TABLE `pan_number`
  ADD CONSTRAINT `pan_number_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `resident` (`uid`);

--
-- Constraints for table `parents`
--
ALTER TABLE `parents`
  ADD CONSTRAINT `parents_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `resident` (`uid`),
  ADD CONSTRAINT `parents_ibfk_2` FOREIGN KEY (`mother_uid`) REFERENCES `resident` (`uid`),
  ADD CONSTRAINT `parents_ibfk_3` FOREIGN KEY (`father_uid`) REFERENCES `resident` (`uid`);

--
-- Constraints for table `registrarlogin`
--
ALTER TABLE `registrarlogin`
  ADD CONSTRAINT `registrarlogin_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `resident` (`uid`);

--
-- Constraints for table `residentlogin`
--
ALTER TABLE `residentlogin`
  ADD CONSTRAINT `residentlogin_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `resident` (`uid`);

--
-- Constraints for table `school`
--
ALTER TABLE `school`
  ADD CONSTRAINT `school_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `resident` (`uid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
