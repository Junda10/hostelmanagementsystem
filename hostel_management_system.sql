-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2023-01-24 14:56:01
-- 服务器版本： 10.4.22-MariaDB
-- PHP 版本： 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `hostel_management`
--

DELIMITER $$
--
-- 存储过程
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GETBLOCKREPORT` (IN `ID` VARCHAR(30))  SELECT ROOM_ID, Student_ID, HOSTEL.Block_ID, HOSTEL.Block_Type, HOSTEL.Room_Type
from ROOM inner join HOSTEL on HOSTEL.Block_ID = ROOM. Block_ID
Where ROOM.Block_ID =ID
Group by (ROOM_ID)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `cleaner`
--

CREATE TABLE `cleaner` (
  `Cleaner_ID` int(10) UNSIGNED NOT NULL,
  `Cleaner_Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `cleaner`
--

INSERT INTO `cleaner` (`Cleaner_ID`, `Cleaner_Name`) VALUES
(1101, 'Aima'),
(1102, 'Iman'),
(1103, 'Valia'),
(1104, 'Sastra'),
(1105, 'Yurra'),
(1106, 'Rocca'),
(1107, 'Rahim'),
(1108, 'Nadya'),
(1109, 'Jai'),
(1110, 'Isira');

-- --------------------------------------------------------

--
-- 表的结构 `cleaner_details`
--

CREATE TABLE `cleaner_details` (
  `Working_Slot` int(20) NOT NULL,
  `Cleaner_ID` int(10) UNSIGNED NOT NULL,
  `Room_ID` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `cleaner_details`
--

INSERT INTO `cleaner_details` (`Working_Slot`, `Cleaner_ID`, `Room_ID`) VALUES
(700, 1101, 'A0101'),
(730, 1102, 'A0102'),
(800, 1103, 'A0201'),
(830, 1104, 'A0202'),
(900, 1105, 'B0101'),
(930, 1106, 'B0102'),
(1000, 1107, 'B0201'),
(1030, 1108, 'B0202'),
(1100, 1109, 'B0301'),
(1130, 1110, 'B0302'),
(1200, 1101, 'B0401'),
(1230, 1102, 'B0402'),
(1300, 1103, 'C0101'),
(1330, 1104, 'C0102'),
(1400, 1105, 'C0201'),
(1430, 1106, 'C0202'),
(1500, 1107, 'D0101'),
(1530, 1108, 'D0102'),
(1600, 1109, 'D0201'),
(1630, 1110, 'D0202'),
(1700, 1101, 'D0301'),
(1730, 1102, 'D0302'),
(1800, 1103, 'D0401'),
(1830, 1104, 'D0402');

-- --------------------------------------------------------

--
-- 表的结构 `hostel`
--

CREATE TABLE `hostel` (
  `Block_ID` varchar(30) NOT NULL,
  `Block_Type` varchar(30) NOT NULL,
  `Room_Type` varchar(30) NOT NULL,
  `Capacity` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `hostel`
--

INSERT INTO `hostel` (`Block_ID`, `Block_Type`, `Room_Type`, `Capacity`) VALUES
('Block A', 'Male Block', 'Single Room', '4'),
('Block B', 'Male Block', 'Single Room', '8'),
('Block C', 'Female Block', 'Single Room', '4'),
('Block D', 'Female Block', 'Single Room', '8');

-- --------------------------------------------------------

--
-- 表的结构 `room`
--

CREATE TABLE `room` (
  `Room_ID` varchar(30) NOT NULL,
  `Block_ID` varchar(30) NOT NULL,
  `Student_ID` varchar(30) NOT NULL,
  `Fee_per_sem` varchar(30) NOT NULL,
  `Floor` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `room`
--

INSERT INTO `room` (`Room_ID`, `Block_ID`, `Student_ID`, `Fee_per_sem`, `Floor`) VALUES
('A0101', 'Block A', '9007', '1500', '1'),
('A0102', 'Block A', '9008', '1500', '1'),
('A0201', 'Block A', '9009', '1500', '2'),
('A0202', 'Block A', '9017', '1600', '1'),
('B0101', 'Block B', '9010', '1600', '1'),
('B0102', 'Block B', '9011', '1600', '1'),
('B0201', 'Block B', '9012', '1600', '2'),
('B0202', 'Block B', '9013', '1600', '2'),
('B0301', 'Block B', '9014', '1600', '3'),
('B0302', 'Block B', '9015', '1600', '3'),
('B0401', 'Block B', '9016', '1600', '4'),
('B0402', 'Block B', '', '1600', '4'),
('C0101', 'Block C', '9001', '1500', '1'),
('C0102', 'Block C', '9002', '1500', '1'),
('C0201', 'Block C', '9003', '1500', '2'),
('C0202', 'Block C', '', '1600', '2'),
('D0101', 'Block D', '9004', '1500', '1'),
('D0102', 'Block D', '9005', '1500', '1'),
('D0201', 'Block D', '9006', '1600', '2'),
('D0202', 'Block D', '', '1600', '2'),
('D0301', 'Block D', '', '1600', '3'),
('D0302', 'Block D', '', '1600', '3'),
('D0401', 'Block D', '', '1600', '4'),
('D0402', 'Block D', '', '1600', '4');

--
-- 触发器 `room`
--
DELIMITER $$
CREATE TRIGGER `Room_Add` AFTER INSERT ON `room` FOR EACH ROW UPDATE HOSTEL SET CAPACITY = CAPACITY +1
WHERE Block_ID = NEW.Block_ID
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Room_Decreased` AFTER DELETE ON `room` FOR EACH ROW UPDATE HOSTEL SET CAPACITY = CAPACITY -1
WHERE Block_ID = OLD.Block_ID
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `student`
--

CREATE TABLE `student` (
  `Student_ID` varchar(30) NOT NULL,
  `Student_FirstName` varchar(30) NOT NULL,
  `Student_LastName` varchar(30) NOT NULL,
  `Age` varchar(30) NOT NULL,
  `Gender` varchar(30) NOT NULL,
  `Contact` int(30) NOT NULL,
  `Course` varchar(50) NOT NULL,
  `Study_year` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `student`
--

INSERT INTO `student` (`Student_ID`, `Student_FirstName`, `Student_LastName`, `Age`, `Gender`, `Contact`, `Course`, `Study_year`) VALUES
('9001', 'Khor', 'Yu Ping', '19', 'Female', 11, 'Bachelor of Business Intelligent', 'Year 1'),
('9002', 'Yap', 'Yee Sze', '20', 'Female', 14, 'Bachelor of Business Intelligent', 'Year 1'),
('9003', 'Soon', 'Jing Ting', '20', 'Female', 16, 'Bachelor of Business Intelligent', 'Year 1'),
('9004', 'Pee', 'Rou Xuan', '22', 'Female', 16, 'Bachelor of Electrical Engineering', 'Year 3'),
('9005', 'Gan', 'Rou Xuan', '21', 'Female', 13, 'Bachelor of Law', 'Year 2'),
('9006', 'Oii', 'li Shi', '23', 'Female', 12, 'Bachelor of Multimedia Design', 'Year 3'),
('9007', 'Law', 'Hao Wen', '20', 'Male', 13, 'Bachelor of Security Technology', 'Year 1'),
('9008', 'Tham', 'Kevin', '23', 'Male', 18, 'Bachelor of Electrical Engineering', 'Year 3'),
('9009', 'Kong', 'Calvin', '24', 'Male', 12, 'Bachelor of Electrical Engineering', 'Year 4'),
('9010', 'Chia', 'Chin Tat', '20', 'Male', 16, 'Bachelor of Artificial Intelligent', 'Year 1'),
('9011', 'Ong', 'Winwey', '20', 'Male', 10, 'Bachelor of Law', 'Year 1'),
('9012', 'Goo', 'Yu Fan', '21', 'Male', 11, 'Bachelor of Multimedia Technology', 'Year 2'),
('9013', 'Poon', 'Feng Feng', '22', 'Male', 17, 'Bachelor of Artificial Intelligent', 'Year 3'),
('9014', 'Khoo', 'An Zi', '22', 'Male', 19, 'Bachelor of Law', 'Year 2'),
('9015', 'Gan', 'Zheng Cheng', '19', 'Male', 18, 'Bachelor of Multimedia Technology', 'Year 1'),
('9016', 'Teo', 'Yee Ngee', '21', 'Male', 18, 'Bachelor of Law', 'Year 2');

--
-- 转储表的索引
--

--
-- 表的索引 `cleaner`
--
ALTER TABLE `cleaner`
  ADD PRIMARY KEY (`Cleaner_ID`);

--
-- 表的索引 `cleaner_details`
--
ALTER TABLE `cleaner_details`
  ADD PRIMARY KEY (`Working_Slot`);

--
-- 表的索引 `hostel`
--
ALTER TABLE `hostel`
  ADD PRIMARY KEY (`Block_ID`);

--
-- 表的索引 `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`Room_ID`);

--
-- 表的索引 `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Student_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
