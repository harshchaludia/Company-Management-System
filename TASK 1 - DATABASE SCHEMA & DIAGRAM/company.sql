-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2020 at 01:44 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `company`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dname` varchar(25) NOT NULL,
  `dnumber` int(10) NOT NULL,
  `mgr_ssn` int(9) DEFAULT 888665555,
  `mgr_start_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dname`, `dnumber`, `mgr_ssn`, `mgr_start_date`) VALUES
('Developers', 1, 708674444, '1975-06-01'),
('Marketing', 4, 321654987, '1990-07-07'),
('Testers', 5, 888776666, '1980-12-22'),
('Customers', 12, 333445555, '2013-02-02');

-- --------------------------------------------------------

--
-- Table structure for table `dependent`
--

CREATE TABLE `dependent` (
  `essn` int(9) NOT NULL,
  `dependent_name` varchar(25) NOT NULL,
  `sex` varchar(25) DEFAULT NULL,
  `bdate` date DEFAULT NULL,
  `relationship` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dependent`
--

INSERT INTO `dependent` (`essn`, `dependent_name`, `sex`, `bdate`, `relationship`) VALUES
(321654987, 'Rinkiya', 'M', '1948-07-28', 'Spouse'),
(888776666, 'Jennice', 'F', '1989-01-05', 'Daughter'),
(888776666, 'Jessica', 'F', '1960-12-03', 'Spouse'),
(888776666, 'Otto', 'M', '1988-11-25', 'Son'),
(987654321, 'Avril', 'F', '1969-09-05', 'Spouse'),
(987654321, 'Jennice', 'F', '0000-00-00', 'Daughter'),
(987654321, 'Mikkel', 'M', '1986-06-04', 'Son');

-- --------------------------------------------------------

--
-- Table structure for table `dept_locations`
--

CREATE TABLE `dept_locations` (
  `dnumber` int(10) NOT NULL,
  `dlocation` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dept_locations`
--

INSERT INTO `dept_locations` (`dnumber`, `dlocation`) VALUES
(1, 'Allen'),
(4, 'Atlanta'),
(5, 'Allen'),
(5, 'Houston'),
(5, 'Mckinney');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `fname` varchar(15) NOT NULL,
  `minit` tinytext DEFAULT NULL,
  `lname` varchar(15) NOT NULL,
  `ssn` int(9) NOT NULL,
  `bdate` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `sex` tinytext DEFAULT NULL,
  `salary` int(20) DEFAULT NULL,
  `super_ssn` int(9) DEFAULT NULL,
  `dno` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`fname`, `minit`, `lname`, `ssn`, `bdate`, `address`, `sex`, `salary`, `super_ssn`, `dno`) VALUES
('Alex', 'T', 'Sabre', 123456789, '1970-10-20', '5672 Benge Drive Austin TX', 'M', 55000, NULL, 4),
('Jennifer', 'R', 'Goodwin', 321654987, '1940-12-17', '741 Berry Frisco TX', 'F', 44000, 708674444, 5),
('Roger', 'G', 'Stevens', 333445555, '1960-05-05', '483 Vintage Drive Austin TX', 'M', 90000, NULL, 5),
('Hamil', 'V', 'Jiden', 444444444, '1965-01-16', '4555 Guilib Allen TX', 'M', 55000, 708674444, 5),
('Randy', 'O', 'Molly', 453453453, '1971-08-14', '6543 Rice Allen TX', 'F', 24000, 888776666, 5),
('Richie', 'W', 'Jones', 666666603, '1985-02-17', '345 Levnie Frisco TX', 'M', 28000, NULL, 5),
('Jane', 'B', 'Smith', 666666606, '1980-03-01', '3556 W Second Street, Miami, FL', 'F', 85000, 666666603, 12),
('Wilson', 'L', 'Michaels', 666666608, '1970-07-09', '7142 Patel, McKinney TX', 'F', 65000, NULL, NULL),
('Utkarsh', 'P', 'Shanatanu', 666884444, '1961-01-15', '786 Fire Oak Humble TX', 'M', 37000, 888776666, 5),
('David', 'Q', 'Jorg', 708674444, '1936-01-16', '258 Stone Allen TX', 'M', 56000, NULL, 1),
('Chaplin', 'N', 'Hong', 888776666, '1954-11-13', '123 Voss, Allen TX', 'M', 38000, 708674444, 5),
('Jordan', 'M', 'Smolders', 987654321, '1964-02-12', '456 Fondren, Allen TX', 'M', 45000, 888776666, 5),
('Mohammed', 'S', 'Farriya', 987987987, '1968-10-18', '369 Dallas Allen TX', 'M', 28000, 321654987, 4),
('Kim', 'T', 'Keys', 999887777, '1967-09-19', '5693 Castle Spring TX', 'F', 30000, 321654987, 4);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `pname` tinytext NOT NULL,
  `pnumber` int(10) NOT NULL,
  `plocation` tinytext DEFAULT NULL,
  `dnum` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`pname`, `pnumber`, `plocation`, `dnum`) VALUES
('Chasis', 1, 'Houston', 5),
('Brakes', 2, 'Mckinney', 5),
('Vinyl', 3, 'Allen', 5),
('Fender', 4, 'Atlanta', 4),
('Bonet', 5, 'Allen', 1),
('Engine', 6, 'Atlanta', 4);

-- --------------------------------------------------------

--
-- Table structure for table `works_on`
--

CREATE TABLE `works_on` (
  `essn` int(9) NOT NULL,
  `pno` int(5) NOT NULL,
  `hours` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `works_on`
--

INSERT INTO `works_on` (`essn`, `pno`, `hours`) VALUES
(321654987, 5, 18),
(321654987, 6, 25),
(453453453, 1, 25),
(453453453, 2, 25),
(666884444, 1, 25),
(666884444, 3, 42),
(708674444, 5, NULL),
(888776666, 2, 12),
(888776666, 3, 10),
(888776666, 4, 11),
(888776666, 5, 14),
(987654321, 1, 30),
(987654321, 2, 6),
(987987987, 4, 34),
(987987987, 6, 9),
(999887777, 4, 12),
(999887777, 6, 35);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dnumber`),
  ADD KEY `mgr_ssn` (`mgr_ssn`);

--
-- Indexes for table `dependent`
--
ALTER TABLE `dependent`
  ADD PRIMARY KEY (`essn`,`dependent_name`);

--
-- Indexes for table `dept_locations`
--
ALTER TABLE `dept_locations`
  ADD PRIMARY KEY (`dnumber`,`dlocation`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ssn`),
  ADD KEY `super_ssn` (`super_ssn`),
  ADD KEY `dno` (`dno`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`pnumber`),
  ADD KEY `dnum` (`dnum`);

--			
-- Indexes for table `works_on`
--
ALTER TABLE `works_on`
  ADD PRIMARY KEY (`essn`,`pno`),
  ADD KEY `essn` (`essn`),
  ADD KEY `pno` (`pno`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`mgr_ssn`) REFERENCES `employee` (`ssn`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `dependent`
--
ALTER TABLE `dependent`
  ADD CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`essn`) REFERENCES `employee` (`ssn`);

--
-- Constraints for table `dept_locations`
--
ALTER TABLE `dept_locations`
  ADD CONSTRAINT `dept_locations_ibfk_1` FOREIGN KEY (`dnumber`) REFERENCES `department` (`dnumber`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`super_ssn`) REFERENCES `employee` (`ssn`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`dno`) REFERENCES `department` (`dnumber`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`dnum`) REFERENCES `department` (`dnumber`);

--
-- Constraints for table `works_on`
--
ALTER TABLE `works_on`
  ADD CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`essn`) REFERENCES `employee` (`ssn`),
  ADD CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`pno`) REFERENCES `project` (`pnumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
