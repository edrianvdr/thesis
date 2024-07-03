-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2024 at 01:31 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thesis`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `home_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `region_id`, `province_id`, `city_id`, `home_address`) VALUES
(1, 1, 3, 17, 291, '#273 Col. Castro Street, Brgy. Longos'),
(2, 2, 15, 50, 982, '420 Brgy. Holy Spirit'),
(3, 3, 15, 50, 982, '42 Air Force Road, Btgy. Holy Spirit'),
(4, 4, 15, 50, 980, '100 Brgy. Pinagbuhatan'),
(5, 5, 15, 50, 981, '143 Pag-asa'),
(6, 6, 15, 50, 982, '#341 Poblacion,'),
(7, 7, 15, 50, 982, '#96 Air Force, Holy Spirit'),
(8, 8, 3, 17, 291, '1217 Emily Ville, Malhacan,'),
(9, 9, 15, 50, 985, '717 St. Martin'),
(10, 10, 15, 50, 969, '999 Hamronica'),
(11, 13, 15, 50, 984, '777 St. Peter,'),
(12, 14, 3, 8, 114, '#37 Iba,'),
(17, 19, 4, 42, 773, '#114 Bahay Biyaya,'),
(18, 20, 4, 42, 773, '#728 Bahay Biyaya'),
(19, 21, 3, 17, 291, '273 Longos Meycauayan Bulacan'),
(20, 22, 15, 50, 982, '#51 AFP Road, Brgy. Holy Spirit');

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(11) NOT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `app_logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `app_name`, `app_logo`) VALUES
(1, 'Serbisyorist', 'public/app_settings/def2nNvtmc9iHqc8CXQtsEsgQzLZaG1zLK6Sy4x2.png');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `specific_service_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `booked_datetime` datetime DEFAULT NULL,
  `cancelled_datetime` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `accepted_datetime` datetime DEFAULT NULL,
  `completed_datetime` datetime DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT NULL,
  `review` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `worker_id`, `specific_service_id`, `date`, `time`, `notes`, `status`, `booked_datetime`, `cancelled_datetime`, `cancelled_by`, `accepted_datetime`, `completed_datetime`, `rating`, `review`) VALUES
(1, 1, 2, 2, '2024-06-01', '08:00:00', 'Pa-reformat po ako ng PC ko po sa bahay. May virus na po ata kasi e. Need po ASAP. Thank you po.', 'Cancelled', '2024-05-19 13:49:22', '2024-05-19 15:35:11', 0, NULL, NULL, NULL, NULL),
(2, 5, 2, 2, '2024-06-02', '08:00:00', 'Pabuild po bagong pc', 'Completed', '2024-05-19 14:50:10', NULL, NULL, '2024-05-19 15:55:34', '2024-05-19 16:05:40', '5.00', 'Ang ganda po ng PC na binuo. 5 out of 5 stars po.'),
(3, 5, 1, 1, '2024-06-03', '08:00:00', 'Mini renovation lang po ng kwarto ko sana', 'Completed', '2024-05-19 16:14:58', NULL, NULL, '2024-05-23 07:35:44', '2024-05-23 07:36:53', '1.00', 'Not satisfied sa gawa'),
(4, 3, 1, 9, '2024-06-04', '09:00:00', 'Renovation of cr po sana', 'Completed', '2024-05-20 14:39:11', NULL, NULL, '2024-05-23 07:35:42', '2024-05-23 07:36:51', '2.00', 'Minadali po kasi e'),
(5, 3, 5, 5, '2024-07-01', '08:00:00', '10 pc com shop po sana', 'Completed', '2024-05-27 16:29:38', NULL, NULL, '2024-05-27 16:32:28', '2024-05-27 16:32:35', NULL, NULL),
(6, 7, 6, 6, '2024-07-02', '09:00:00', '100 pc na internet cafe for gaming', 'Cancelled', '2024-05-27 16:30:53', '2024-05-27 16:31:22', NULL, NULL, NULL, NULL, NULL),
(7, 7, 5, 5, '2024-07-02', '10:00:00', '100 pc po para sa internet cafe gusto ko po pang gaming lahat', 'Completed', '2024-05-27 16:31:49', NULL, NULL, '2024-05-27 16:32:24', '2024-05-27 16:32:33', NULL, NULL),
(8, 3, 1, 1, '2024-07-01', '08:00:00', 'Help me in bedroom renovation po', 'Pending', '2024-06-01 01:12:12', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 3, 1, 9, '2024-07-02', '09:00:00', 'living room reno din po', 'Completed', '2024-06-01 01:22:50', NULL, NULL, '2024-06-01 18:23:31', '2024-06-01 18:23:36', NULL, NULL),
(10, 21, 15, 15, '2024-06-07', '04:00:00', 'I need to exercise before my reporting on junior high.', 'Completed', '2024-06-06 23:38:20', NULL, NULL, '2024-06-06 23:40:18', '2024-06-06 23:40:58', '1.00', 'Did not assist me carefully.');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`) VALUES
(1, 'Air Conditioning'),
(2, 'Automotive Repair and Maintenance'),
(3, 'Cleaning'),
(4, 'Construction and Carpentry'),
(5, 'Electrical'),
(6, 'Electronic'),
(9, 'Personal Care');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `region_id`, `province_id`, `city`) VALUES
(1, 16, 1, 'Bangued'),
(2, 16, 1, 'Boliney'),
(3, 16, 1, 'Bucay'),
(4, 16, 1, 'Bucloc'),
(5, 16, 1, 'Daguioman'),
(6, 16, 1, 'Danglas'),
(7, 16, 1, 'Dolores'),
(8, 16, 1, 'La Paz'),
(9, 16, 1, 'Lacub'),
(10, 16, 1, 'Lagangilang'),
(11, 16, 1, 'Lagayan'),
(12, 16, 1, 'Langiden'),
(13, 16, 1, 'Licuan-Baay'),
(14, 16, 1, 'Luba'),
(15, 16, 1, 'Malibcong'),
(16, 16, 1, 'Manabo'),
(17, 16, 1, 'Peñarrubia'),
(18, 16, 1, 'Pidigan'),
(19, 16, 1, 'Pilar'),
(20, 16, 1, 'Sallapadan'),
(21, 16, 1, 'San Isidro'),
(22, 16, 1, 'San Juan'),
(23, 16, 1, 'San Quintin'),
(24, 16, 1, 'Tayum'),
(25, 16, 1, 'Tineg'),
(26, 16, 1, 'Tubo'),
(27, 16, 1, 'Villaviciosa'),
(28, 14, 2, 'Buenavista'),
(29, 14, 2, 'Butuan'),
(30, 14, 2, 'Cabadbaran'),
(31, 14, 2, 'Carmen'),
(32, 14, 2, 'Jabonga'),
(33, 14, 2, 'Kitcharao'),
(34, 14, 2, 'Las Nieves'),
(35, 14, 2, 'Magallanes'),
(36, 14, 2, 'Nasipit'),
(37, 14, 2, 'Remedios T. Romualdez'),
(38, 14, 2, 'Santiago'),
(39, 14, 2, 'Tubay'),
(40, 14, 3, 'Bayugan'),
(41, 14, 3, 'Bunawan'),
(42, 14, 3, 'Esperanza'),
(43, 14, 3, 'La Paz'),
(44, 14, 3, 'Loreto'),
(45, 14, 3, 'Prosperidad'),
(46, 14, 3, 'Rosario'),
(47, 14, 3, 'San Francisco'),
(48, 14, 3, 'San Luis'),
(49, 14, 3, 'Santa Josefa'),
(50, 14, 3, 'Sibagat'),
(51, 14, 3, 'Talacogon'),
(52, 14, 3, 'Trento'),
(53, 14, 3, 'Veruela'),
(54, 7, 4, 'Altavas'),
(55, 7, 4, 'Balete'),
(56, 7, 4, 'Banga'),
(57, 7, 4, 'Batan'),
(58, 7, 4, 'Buruanga'),
(59, 7, 4, 'Ibajay'),
(60, 7, 4, 'Kalibo'),
(61, 7, 4, 'Lezo'),
(62, 7, 4, 'Libacao'),
(63, 7, 4, 'Madalag'),
(64, 7, 4, 'Makato'),
(65, 7, 4, 'Malay'),
(66, 7, 4, 'Malinao'),
(67, 7, 4, 'Nabas'),
(68, 7, 4, 'New Washington'),
(69, 7, 4, 'Numancia'),
(70, 7, 4, 'Tangalan'),
(71, 6, 5, 'Bacacay'),
(72, 6, 5, 'Camalig'),
(73, 6, 5, 'Daraga'),
(74, 6, 5, 'Guinobatan'),
(75, 6, 5, 'Jovellar'),
(76, 6, 5, 'Legazpi'),
(77, 6, 5, 'Libon'),
(78, 6, 5, 'Ligao'),
(79, 6, 5, 'Malilipot'),
(80, 6, 5, 'Malinao'),
(81, 6, 5, 'Manito'),
(82, 6, 5, 'Oas'),
(83, 6, 5, 'Pio Duran'),
(84, 6, 5, 'Polangui'),
(85, 6, 5, 'Rapu-Rapu'),
(86, 6, 5, 'Santo Domingo'),
(87, 6, 5, 'Tabaco'),
(88, 6, 5, 'Tiwi'),
(89, 7, 6, 'Anini-y'),
(90, 7, 6, 'Barbaza'),
(91, 7, 6, 'Belison'),
(92, 7, 6, 'Bugasong'),
(93, 7, 6, 'Caluya'),
(94, 7, 6, 'Culasi'),
(95, 7, 6, 'Hamtic'),
(96, 7, 6, 'Laua-an'),
(97, 7, 6, 'Libertad'),
(98, 7, 6, 'Pandan'),
(99, 7, 6, 'Patnongon'),
(100, 7, 6, 'San Jose'),
(101, 7, 6, 'San Remigio'),
(102, 7, 6, 'Sebaste'),
(103, 7, 6, 'Sibalom'),
(104, 7, 6, 'Tibiao'),
(105, 7, 6, 'Tobias Fornier'),
(106, 7, 6, 'Valderrama'),
(107, 16, 7, 'Calanasan'),
(108, 16, 7, 'Conner'),
(109, 16, 7, 'Flora'),
(110, 16, 7, 'Kabugao'),
(111, 16, 7, 'Luna'),
(112, 16, 7, 'Pudtol'),
(113, 16, 7, 'Santa Marcela'),
(114, 3, 8, 'Baler'),
(115, 3, 8, 'Casiguran'),
(116, 3, 8, 'Dilasag'),
(117, 3, 8, 'Dinalungan'),
(118, 3, 8, 'Dingalan'),
(119, 3, 8, 'Dipaculao'),
(120, 3, 8, 'Maria Aurora'),
(121, 3, 8, 'San Luis'),
(122, 17, 9, 'Akbar'),
(123, 17, 9, 'Al-Barka'),
(124, 17, 9, 'Hadji Mohammad Ajul'),
(125, 17, 9, 'Hadji Muhtamad'),
(126, 17, 9, 'Isabela'),
(127, 17, 9, 'Lamitan'),
(128, 17, 9, 'Lantawan'),
(129, 17, 9, 'Maluso'),
(130, 17, 9, 'Sumisip'),
(131, 17, 9, 'Tabuan-Lasa'),
(132, 17, 9, 'Tipo-Tipo'),
(133, 17, 9, 'Tuburan'),
(134, 17, 9, 'Ungkaya Pukan'),
(135, 3, 10, 'Abucay'),
(136, 3, 10, 'Bagac'),
(137, 3, 10, 'Balanga'),
(138, 3, 10, 'Dinalupihan'),
(139, 3, 10, 'Hermosa'),
(140, 3, 10, 'Limay'),
(141, 3, 10, 'Mariveles'),
(142, 3, 10, 'Morong'),
(143, 3, 10, 'Orani'),
(144, 3, 10, 'Orion'),
(145, 3, 10, 'Pilar'),
(146, 3, 10, 'Samal'),
(147, 2, 11, 'Basco'),
(148, 2, 11, 'Itbayat'),
(149, 2, 11, 'Ivana'),
(150, 2, 11, 'Mahatao'),
(151, 2, 11, 'Sabtang'),
(152, 2, 11, 'Uyugan'),
(153, 4, 12, 'Agoncillo'),
(154, 4, 12, 'Alitagtag'),
(155, 4, 12, 'Balayan'),
(156, 4, 12, 'Balete'),
(157, 4, 12, 'Batangas City'),
(158, 4, 12, 'Bauan'),
(159, 4, 12, 'Calaca'),
(160, 4, 12, 'Calatagan'),
(161, 4, 12, 'Cuenca'),
(162, 4, 12, 'Ibaan'),
(163, 4, 12, 'Laurel'),
(164, 4, 12, 'Lemery'),
(165, 4, 12, 'Lian'),
(166, 4, 12, 'Lipa'),
(167, 4, 12, 'Lobo'),
(168, 4, 12, 'Mabini'),
(169, 4, 12, 'Malvar'),
(170, 4, 12, 'Mataasnakahoy'),
(171, 4, 12, 'Nasugbu'),
(172, 4, 12, 'Padre Garcia'),
(173, 4, 12, 'Rosario'),
(174, 4, 12, 'San Jose'),
(175, 4, 12, 'San Juan'),
(176, 4, 12, 'San Luis'),
(177, 4, 12, 'San Nicolas'),
(178, 4, 12, 'San Pascual'),
(179, 4, 12, 'Santa Teresita'),
(180, 4, 12, 'Santo Tomas'),
(181, 4, 12, 'Taal'),
(182, 4, 12, 'Talisay'),
(183, 4, 12, 'Tanauan'),
(184, 4, 12, 'Taysan'),
(185, 4, 12, 'Tingloy'),
(186, 4, 12, 'Tuy'),
(187, 16, 13, 'Atok'),
(188, 16, 13, 'Baguio'),
(189, 16, 13, 'Bakun'),
(190, 16, 13, 'Bokod'),
(191, 16, 13, 'Buguias'),
(192, 16, 13, 'Itogon'),
(193, 16, 13, 'Kabayan'),
(194, 16, 13, 'Kapangan'),
(195, 16, 13, 'Kibungan'),
(196, 16, 13, 'La Trinidad'),
(197, 16, 13, 'Mankayan'),
(198, 16, 13, 'Sablan'),
(199, 16, 13, 'Tuba'),
(200, 16, 13, 'Tublay'),
(201, 9, 14, 'Almeria'),
(202, 9, 14, 'Biliran'),
(203, 9, 14, 'Cabucgayan'),
(204, 9, 14, 'Caibiran'),
(205, 9, 14, 'Culaba'),
(206, 9, 14, 'Kawayan'),
(207, 9, 14, 'Maripipi'),
(208, 9, 14, 'Naval'),
(209, 8, 15, 'Alburquerque'),
(210, 8, 15, 'Alicia'),
(211, 8, 15, 'Anda'),
(212, 8, 15, 'Antequera'),
(213, 8, 15, 'Baclayon'),
(214, 8, 15, 'Balilihan'),
(215, 8, 15, 'Batuan'),
(216, 8, 15, 'Bien Unido'),
(217, 8, 15, 'Bilar'),
(218, 8, 15, 'Buenavista'),
(219, 8, 15, 'Calape'),
(220, 8, 15, 'Candijay'),
(221, 8, 15, 'Carmen'),
(222, 8, 15, 'Catigbian'),
(223, 8, 15, 'Clarin'),
(224, 8, 15, 'Corella'),
(225, 8, 15, 'Cortes'),
(226, 8, 15, 'Dagohoy'),
(227, 8, 15, 'Danao'),
(228, 8, 15, 'Dauis'),
(229, 8, 15, 'Dimiao'),
(230, 8, 15, 'Duero'),
(231, 8, 15, 'Garcia Hernandez'),
(232, 8, 15, 'Getafe'),
(233, 8, 15, 'Guindulman'),
(234, 8, 15, 'Inabanga'),
(235, 8, 15, 'Jagna'),
(236, 8, 15, 'Lila'),
(237, 8, 15, 'Loay'),
(238, 8, 15, 'Loboc'),
(239, 8, 15, 'Loon'),
(240, 8, 15, 'Mabini'),
(241, 8, 15, 'Maribojoc'),
(242, 8, 15, 'Panglao'),
(243, 8, 15, 'Pilar'),
(244, 8, 15, 'President Carlos P. Garcia'),
(245, 8, 15, 'Sagbayan'),
(246, 8, 15, 'San Isidro'),
(247, 8, 15, 'San Miguel'),
(248, 8, 15, 'Sevilla'),
(249, 8, 15, 'Sierra Bullones'),
(250, 8, 15, 'Sikatuna'),
(251, 8, 15, 'Tagbilaran'),
(252, 8, 15, 'Talibon'),
(253, 8, 15, 'Trinidad'),
(254, 8, 15, 'Tubigon'),
(255, 8, 15, 'Ubay'),
(256, 8, 15, 'Valencia'),
(257, 11, 16, 'Baungon'),
(258, 11, 16, 'Cabanglasan'),
(259, 11, 16, 'Damulog'),
(260, 11, 16, 'Dangcagan'),
(261, 11, 16, 'Don Carlos'),
(262, 11, 16, 'Impasugong'),
(263, 11, 16, 'Kadingilan'),
(264, 11, 16, 'Kalilangan'),
(265, 11, 16, 'Kibawe'),
(266, 11, 16, 'Kitaotao'),
(267, 11, 16, 'Lantapan'),
(268, 11, 16, 'Libona'),
(269, 11, 16, 'Malaybalay'),
(270, 11, 16, 'Malitbog'),
(271, 11, 16, 'Manolo Fortich'),
(272, 11, 16, 'Maramag'),
(273, 11, 16, 'Pangantucan'),
(274, 11, 16, 'Quezon'),
(275, 11, 16, 'San Fernando'),
(276, 11, 16, 'Sumilao'),
(277, 11, 16, 'Talakag'),
(278, 11, 16, 'Valencia'),
(279, 3, 17, 'Angat'),
(280, 3, 17, 'Balagtas'),
(281, 3, 17, 'Baliwag'),
(282, 3, 17, 'Bocaue'),
(283, 3, 17, 'Bulakan'),
(284, 3, 17, 'Bustos'),
(285, 3, 17, 'Calumpit'),
(286, 3, 17, 'Doña Remedios Trinidad'),
(287, 3, 17, 'Guiguinto'),
(288, 3, 17, 'Hagonoy'),
(289, 3, 17, 'Malolos'),
(290, 3, 17, 'Marilao'),
(291, 3, 17, 'Meycauayan'),
(292, 3, 17, 'Norzagaray'),
(293, 3, 17, 'Obando'),
(294, 3, 17, 'Pandi'),
(295, 3, 17, 'Paombong'),
(296, 3, 17, 'Plaridel'),
(297, 3, 17, 'Pulilan'),
(298, 3, 17, 'San Ildefonso'),
(299, 3, 17, 'San Jose del Monte'),
(300, 3, 17, 'San Miguel'),
(301, 3, 17, 'San Rafael'),
(302, 3, 17, 'Santa Maria'),
(303, 2, 18, 'Abulug'),
(304, 2, 18, 'Alcala'),
(305, 2, 18, 'Allacapan'),
(306, 2, 18, 'Amulung'),
(307, 2, 18, 'Aparri'),
(308, 2, 18, 'Baggao'),
(309, 2, 18, 'Ballesteros'),
(310, 2, 18, 'Buguey'),
(311, 2, 18, 'Calayan'),
(312, 2, 18, 'Camalaniugan'),
(313, 2, 18, 'Claveria'),
(314, 2, 18, 'Enrile'),
(315, 2, 18, 'Gattaran'),
(316, 2, 18, 'Gonzaga'),
(317, 2, 18, 'Iguig'),
(318, 2, 18, 'Lal-lo'),
(319, 2, 18, 'Lasam'),
(320, 2, 18, 'Pamplona'),
(321, 2, 18, 'Peñablanca'),
(322, 2, 18, 'Piat'),
(323, 2, 18, 'Rizal'),
(324, 2, 18, 'Sanchez-Mira'),
(325, 2, 18, 'Santa Ana'),
(326, 2, 18, 'Santa Praxedes'),
(327, 2, 18, 'Santa Teresita'),
(328, 2, 18, 'Santo Niño'),
(329, 2, 18, 'Solana'),
(330, 2, 18, 'Tuao'),
(331, 2, 18, 'Tuguegarao'),
(332, 6, 19, 'Basud'),
(333, 6, 19, 'Capalonga'),
(334, 6, 19, 'Daet'),
(335, 6, 19, 'Jose Panganiban'),
(336, 6, 19, 'Labo'),
(337, 6, 19, 'Mercedes'),
(338, 6, 19, 'Paracale'),
(339, 6, 19, 'San Lorenzo Ruiz'),
(340, 6, 19, 'San Vicente'),
(341, 6, 19, 'Santa Elena'),
(342, 6, 19, 'Talisay'),
(343, 6, 19, 'Vinzons'),
(344, 6, 20, 'Baao'),
(345, 6, 20, 'Balatan'),
(346, 6, 20, 'Bato'),
(347, 6, 20, 'Bombon'),
(348, 6, 20, 'Buhi'),
(349, 6, 20, 'Bula'),
(350, 6, 20, 'Cabusao'),
(351, 6, 20, 'Calabanga'),
(352, 6, 20, 'Camaligan'),
(353, 6, 20, 'Canaman'),
(354, 6, 20, 'Caramoan'),
(355, 6, 20, 'Del Gallego'),
(356, 6, 20, 'Gainza'),
(357, 6, 20, 'Garchitorena'),
(358, 6, 20, 'Goa'),
(359, 6, 20, 'Iriga'),
(360, 6, 20, 'Lagonoy'),
(361, 6, 20, 'Libmanan'),
(362, 6, 20, 'Lupi'),
(363, 6, 20, 'Magarao'),
(364, 6, 20, 'Milaor'),
(365, 6, 20, 'Minalabac'),
(366, 6, 20, 'Nabua'),
(367, 6, 20, 'Naga'),
(368, 6, 20, 'Ocampo'),
(369, 6, 20, 'Pamplona'),
(370, 6, 20, 'Pasacao'),
(371, 6, 20, 'Pili'),
(372, 6, 20, 'Presentacion'),
(373, 6, 20, 'Ragay'),
(374, 6, 20, 'Sagñay'),
(375, 6, 20, 'San Fernando'),
(376, 6, 20, 'San Jose'),
(377, 6, 20, 'Sipocot'),
(378, 6, 20, 'Siruma'),
(379, 6, 20, 'Tigaon'),
(380, 6, 20, 'Tinambac'),
(381, 11, 21, 'Catarman'),
(382, 11, 21, 'Guinsiliban'),
(383, 11, 21, 'Mahinog'),
(384, 11, 21, 'Mambajao'),
(385, 11, 21, 'Sagay'),
(386, 7, 22, 'Cuartero'),
(387, 7, 22, 'Dao'),
(388, 7, 22, 'Dumalag'),
(389, 7, 22, 'Dumarao'),
(390, 7, 22, 'Ivisan'),
(391, 7, 22, 'Jamindan'),
(392, 7, 22, 'Ma-ayon'),
(393, 7, 22, 'Mambusao'),
(394, 7, 22, 'Panay'),
(395, 7, 22, 'Panitan'),
(396, 7, 22, 'Pilar'),
(397, 7, 22, 'Pontevedra'),
(398, 7, 22, 'President Roxas'),
(399, 7, 22, 'Roxas'),
(400, 7, 22, 'Sapian'),
(401, 7, 22, 'Sigma'),
(402, 7, 22, 'Tapaz'),
(403, 6, 23, 'Bagamanoc'),
(404, 6, 23, 'Baras'),
(405, 6, 23, 'Bato'),
(406, 6, 23, 'Caramoran'),
(407, 6, 23, 'Gigmoto'),
(408, 6, 23, 'Pandan'),
(409, 6, 23, 'Panganiban'),
(410, 6, 23, 'San Andres'),
(411, 6, 23, 'San Miguel'),
(412, 6, 23, 'Viga'),
(413, 6, 23, 'Virac'),
(414, 4, 24, 'Alfonso'),
(415, 4, 24, 'Amadeo'),
(416, 4, 24, 'Bacoor'),
(417, 4, 24, 'Carmona'),
(418, 4, 24, 'Cavite City'),
(419, 4, 24, 'Dasmariñas'),
(420, 4, 24, 'Bailen (General Emilio Aguinaldo)'),
(421, 4, 24, 'General Mariano Alvarez'),
(422, 4, 24, 'General Trias'),
(423, 4, 24, 'Imus'),
(424, 4, 24, 'Indang'),
(425, 4, 24, 'Kawit'),
(426, 4, 24, 'Magallanes'),
(427, 4, 24, 'Maragondon'),
(428, 4, 24, 'Mendez'),
(429, 4, 24, 'Naic'),
(430, 4, 24, 'Noveleta'),
(431, 4, 24, 'Rosario'),
(432, 4, 24, 'Silang'),
(433, 4, 24, 'Tagaytay'),
(434, 4, 24, 'Tanza'),
(435, 4, 24, 'Ternate'),
(436, 4, 24, 'Trece Martires'),
(437, 8, 25, 'Alcantara'),
(438, 8, 25, 'Alcoy'),
(439, 8, 25, 'Alegria'),
(440, 8, 25, 'Aloguinsan'),
(441, 8, 25, 'Argao'),
(442, 8, 25, 'Asturias'),
(443, 8, 25, 'Badian'),
(444, 8, 25, 'Balamban'),
(445, 8, 25, 'Bantayan'),
(446, 8, 25, 'Barili'),
(447, 8, 25, 'Bogo'),
(448, 8, 25, 'Boljoon'),
(449, 8, 25, 'Borbon'),
(450, 8, 25, 'Carcar'),
(451, 8, 25, 'Carmen'),
(452, 8, 25, 'Catmon'),
(453, 8, 25, 'Cebu City'),
(454, 8, 25, 'Compostela'),
(455, 8, 25, 'Consolacion'),
(456, 8, 25, 'Cordova'),
(457, 8, 25, 'Daanbantayan'),
(458, 8, 25, 'Dalaguete'),
(459, 8, 25, 'Danao'),
(460, 8, 25, 'Dumanjug'),
(461, 8, 25, 'Ginatilan'),
(462, 8, 25, 'Lapu-Lapu'),
(463, 8, 25, 'Liloan'),
(464, 8, 25, 'Madridejos'),
(465, 8, 25, 'Malabuyoc'),
(466, 8, 25, 'Mandaue'),
(467, 8, 25, 'Medellin'),
(468, 8, 25, 'Minglanilla'),
(469, 8, 25, 'Moalboal'),
(470, 8, 25, 'Naga'),
(471, 8, 25, 'Oslob'),
(472, 8, 25, 'Pilar'),
(473, 8, 25, 'Pinamungajan'),
(474, 8, 25, 'Poro'),
(475, 8, 25, 'Ronda'),
(476, 8, 25, 'Samboan'),
(477, 8, 25, 'San Fernando'),
(478, 8, 25, 'San Francisco'),
(479, 8, 25, 'San Remigio'),
(480, 8, 25, 'Santa Fe'),
(481, 8, 25, 'Santander'),
(482, 8, 25, 'Sibonga'),
(483, 8, 25, 'Sogod'),
(484, 8, 25, 'Tabogon'),
(485, 8, 25, 'Tabuelan'),
(486, 8, 25, 'Talisay'),
(487, 8, 25, 'Toledo'),
(488, 8, 25, 'Tuburan'),
(489, 8, 25, 'Tudela'),
(490, 13, 26, 'Alamada'),
(491, 13, 26, 'Aleosan'),
(492, 13, 26, 'Antipas'),
(493, 13, 26, 'Arakan'),
(494, 13, 26, 'Banisilan'),
(495, 13, 26, 'Carmen'),
(496, 13, 26, 'Kabacan'),
(497, 13, 26, 'Kidapawan'),
(498, 13, 26, 'Libungan'),
(499, 13, 26, 'M\'lang'),
(500, 13, 26, 'Magpet'),
(501, 13, 26, 'Makilala'),
(502, 13, 26, 'Matalam'),
(503, 13, 26, 'Midsayap'),
(504, 13, 26, 'Pigcawayan'),
(505, 13, 26, 'Pikit'),
(506, 13, 26, 'President Roxas'),
(507, 13, 26, 'Tulunan'),
(508, 12, 27, 'Compostela'),
(509, 12, 27, 'Laak'),
(510, 12, 27, 'Mabini'),
(511, 12, 27, 'Maco'),
(512, 12, 27, 'Maragusan'),
(513, 12, 27, 'Mawab'),
(514, 12, 27, 'Monkayo'),
(515, 12, 27, 'Montevista'),
(516, 12, 27, 'Nabunturan'),
(517, 12, 27, 'New Bataan'),
(518, 12, 27, 'Pantukan'),
(519, 12, 28, 'Asuncion'),
(520, 12, 28, 'Braulio E. Dujali'),
(521, 12, 28, 'Carmen'),
(522, 12, 28, 'Kapalong'),
(523, 12, 28, 'New Corella'),
(524, 12, 28, 'Panabo'),
(525, 12, 28, 'Samal'),
(526, 12, 28, 'San Isidro'),
(527, 12, 28, 'Santo Tomas'),
(528, 12, 28, 'Tagum'),
(529, 12, 28, 'Talaingod'),
(530, 12, 29, 'Bansalan'),
(531, 12, 29, 'Davao City'),
(532, 12, 29, 'Digos'),
(533, 12, 29, 'Hagonoy'),
(534, 12, 29, 'Kiblawan'),
(535, 12, 29, 'Magsaysay'),
(536, 12, 29, 'Malalag'),
(537, 12, 29, 'Matanao'),
(538, 12, 29, 'Padada'),
(539, 12, 29, 'Santa Cruz'),
(540, 12, 29, 'Sulop'),
(541, 12, 30, 'Don Marcelino'),
(542, 12, 30, 'Jose Abad Santos'),
(543, 12, 30, 'Malita'),
(544, 12, 30, 'Santa Maria'),
(545, 12, 30, 'Sarangani'),
(546, 12, 31, 'Baganga'),
(547, 12, 31, 'Banaybanay'),
(548, 12, 31, 'Boston'),
(549, 12, 31, 'Caraga'),
(550, 12, 31, 'Cateel'),
(551, 12, 31, 'Governor Generoso'),
(552, 12, 31, 'Lupon'),
(553, 12, 31, 'Manay'),
(554, 12, 31, 'Mati'),
(555, 12, 31, 'San Isidro'),
(556, 12, 31, 'Tarragona'),
(557, 14, 32, 'Basilisa'),
(558, 14, 32, 'Cagdianao'),
(559, 14, 32, 'Dinagat'),
(560, 14, 32, 'Libjo'),
(561, 14, 32, 'Loreto'),
(562, 14, 32, 'San Jose'),
(563, 14, 32, 'Tubajon'),
(564, 9, 33, 'Arteche'),
(565, 9, 33, 'Balangiga'),
(566, 9, 33, 'Balangkayan'),
(567, 9, 33, 'Borongan'),
(568, 9, 33, 'Can-avid'),
(569, 9, 33, 'Dolores'),
(570, 9, 33, 'General MacArthur'),
(571, 9, 33, 'Giporlos'),
(572, 9, 33, 'Guiuan'),
(573, 9, 33, 'Hernani'),
(574, 9, 33, 'Jipapad'),
(575, 9, 33, 'Lawaan'),
(576, 9, 33, 'Llorente'),
(577, 9, 33, 'Maslog'),
(578, 9, 33, 'Maydolong'),
(579, 9, 33, 'Mercedes'),
(580, 9, 33, 'Oras'),
(581, 9, 33, 'Quinapondan'),
(582, 9, 33, 'Salcedo'),
(583, 9, 33, 'San Julian'),
(584, 9, 33, 'San Policarpo'),
(585, 9, 33, 'Sulat'),
(586, 9, 33, 'Taft'),
(587, 7, 34, 'Buenavista'),
(588, 7, 34, 'Jordan'),
(589, 7, 34, 'Nueva Valencia'),
(590, 7, 34, 'San Lorenzo'),
(591, 7, 34, 'Sibunag'),
(592, 16, 35, 'Aguinaldo'),
(593, 16, 35, 'Alfonso Lista'),
(594, 16, 35, 'Asipulo'),
(595, 16, 35, 'Banaue'),
(596, 16, 35, 'Hingyon'),
(597, 16, 35, 'Hungduan'),
(598, 16, 35, 'Kiangan'),
(599, 16, 35, 'Lagawe'),
(600, 16, 35, 'Lamut'),
(601, 16, 35, 'Mayoyao'),
(602, 16, 35, 'Tinoc'),
(603, 1, 36, 'Adams'),
(604, 1, 36, 'Bacarra'),
(605, 1, 36, 'Badoc'),
(606, 1, 36, 'Bangui'),
(607, 1, 36, 'Banna'),
(608, 1, 36, 'Batac'),
(609, 1, 36, 'Burgos'),
(610, 1, 36, 'Carasi'),
(611, 1, 36, 'Currimao'),
(612, 1, 36, 'Dingras'),
(613, 1, 36, 'Dumalneg'),
(614, 1, 36, 'Laoag'),
(615, 1, 36, 'Marcos'),
(616, 1, 36, 'Nueva Era'),
(617, 1, 36, 'Pagudpud'),
(618, 1, 36, 'Paoay'),
(619, 1, 36, 'Pasuquin'),
(620, 1, 36, 'Piddig'),
(621, 1, 36, 'Pinili'),
(622, 1, 36, 'San Nicolas'),
(623, 1, 36, 'Sarrat'),
(624, 1, 36, 'Solsona'),
(625, 1, 36, 'Vintar'),
(626, 1, 37, 'Alilem'),
(627, 1, 37, 'Banayoyo'),
(628, 1, 37, 'Bantay'),
(629, 1, 37, 'Burgos'),
(630, 1, 37, 'Cabugao'),
(631, 1, 37, 'Candon'),
(632, 1, 37, 'Caoayan'),
(633, 1, 37, 'Cervantes'),
(634, 1, 37, 'Galimuyod'),
(635, 1, 37, 'Gregorio del Pilar'),
(636, 1, 37, 'Lidlidda'),
(637, 1, 37, 'Magsingal'),
(638, 1, 37, 'Nagbukel'),
(639, 1, 37, 'Narvacan'),
(640, 1, 37, 'Quirino'),
(641, 1, 37, 'Salcedo'),
(642, 1, 37, 'San Emilio'),
(643, 1, 37, 'San Esteban'),
(644, 1, 37, 'San Ildefonso'),
(645, 1, 37, 'San Juan'),
(646, 1, 37, 'San Vicente'),
(647, 1, 37, 'Santa Catalina'),
(648, 1, 37, 'Santa Cruz'),
(649, 1, 37, 'Santa Lucia'),
(650, 1, 37, 'Santa Maria'),
(651, 1, 37, 'Santa'),
(652, 1, 37, 'Santiago'),
(653, 1, 37, 'Santo Domingo'),
(654, 1, 37, 'Sigay'),
(655, 1, 37, 'Sinait'),
(656, 1, 37, 'Sugpon'),
(657, 1, 37, 'Suyo'),
(658, 1, 37, 'Tagudin'),
(659, 1, 37, 'Vigan'),
(660, 7, 38, 'Ajuy'),
(661, 7, 38, 'Alimodian'),
(662, 7, 38, 'Anilao'),
(663, 7, 38, 'Badiangan'),
(664, 7, 38, 'Balasan'),
(665, 7, 38, 'Banate'),
(666, 7, 38, 'Barotac Nuevo'),
(667, 7, 38, 'Barotac Viejo'),
(668, 7, 38, 'Batad'),
(669, 7, 38, 'Bingawan'),
(670, 7, 38, 'Cabatuan'),
(671, 7, 38, 'Calinog'),
(672, 7, 38, 'Carles'),
(673, 7, 38, 'Concepcion'),
(674, 7, 38, 'Dingle'),
(675, 7, 38, 'Dueñas'),
(676, 7, 38, 'Dumangas'),
(677, 7, 38, 'Estancia'),
(678, 7, 38, 'Guimbal'),
(679, 7, 38, 'Igbaras'),
(680, 7, 38, 'Iloilo City'),
(681, 7, 38, 'Janiuay'),
(682, 7, 38, 'Lambunao'),
(683, 7, 38, 'Leganes'),
(684, 7, 38, 'Lemery'),
(685, 7, 38, 'Leon'),
(686, 7, 38, 'Maasin'),
(687, 7, 38, 'Miagao'),
(688, 7, 38, 'Mina'),
(689, 7, 38, 'New Lucena'),
(690, 7, 38, 'Oton'),
(691, 7, 38, 'Passi'),
(692, 7, 38, 'Pavia'),
(693, 7, 38, 'Pototan'),
(694, 7, 38, 'San Dionisio'),
(695, 7, 38, 'San Enrique'),
(696, 7, 38, 'San Joaquin'),
(697, 7, 38, 'San Miguel'),
(698, 7, 38, 'San Rafael'),
(699, 7, 38, 'Santa Barbara'),
(700, 7, 38, 'Sara'),
(701, 7, 38, 'Tigbauan'),
(702, 7, 38, 'Tubungan'),
(703, 7, 38, 'Zarraga'),
(704, 2, 39, 'Alicia'),
(705, 2, 39, 'Angadanan'),
(706, 2, 39, 'Aurora'),
(707, 2, 39, 'Benito Soliven'),
(708, 2, 39, 'Burgos'),
(709, 2, 39, 'Cabagan'),
(710, 2, 39, 'Cabatuan'),
(711, 2, 39, 'Cauayan'),
(712, 2, 39, 'Cordon'),
(713, 2, 39, 'Delfin Albano'),
(714, 2, 39, 'Dinapigue'),
(715, 2, 39, 'Divilacan'),
(716, 2, 39, 'Echague'),
(717, 2, 39, 'Gamu'),
(718, 2, 39, 'Ilagan'),
(719, 2, 39, 'Jones'),
(720, 2, 39, 'Luna'),
(721, 2, 39, 'Maconacon'),
(722, 2, 39, 'Mallig'),
(723, 2, 39, 'Naguilian'),
(724, 2, 39, 'Palanan'),
(725, 2, 39, 'Quezon'),
(726, 2, 39, 'Quirino'),
(727, 2, 39, 'Ramon'),
(728, 2, 39, 'Reina Mercedes'),
(729, 2, 39, 'Roxas'),
(730, 2, 39, 'San Agustin'),
(731, 2, 39, 'San Guillermo'),
(732, 2, 39, 'San Isidro'),
(733, 2, 39, 'San Manuel'),
(734, 2, 39, 'San Mariano'),
(735, 2, 39, 'San Mateo'),
(736, 2, 39, 'San Pablo'),
(737, 2, 39, 'Santa Maria'),
(738, 2, 39, 'Santiago'),
(739, 2, 39, 'Santo Tomas'),
(740, 2, 39, 'Tumauini'),
(741, 16, 40, 'Balbalan'),
(742, 16, 40, 'Lubuagan'),
(743, 16, 40, 'Pasil'),
(744, 16, 40, 'Pinukpuk'),
(745, 16, 40, 'Rizal'),
(746, 16, 40, 'Tabuk'),
(747, 16, 40, 'Tanudan'),
(748, 16, 40, 'Tinglayan'),
(749, 1, 41, 'Agoo'),
(750, 1, 41, 'Aringay'),
(751, 1, 41, 'Bacnotan'),
(752, 1, 41, 'Bagulin'),
(753, 1, 41, 'Balaoan'),
(754, 1, 41, 'Bangar'),
(755, 1, 41, 'Bauang'),
(756, 1, 41, 'Burgos'),
(757, 1, 41, 'Caba'),
(758, 1, 41, 'Luna'),
(759, 1, 41, 'Naguilian'),
(760, 1, 41, 'Pugo'),
(761, 1, 41, 'Rosario'),
(762, 1, 41, 'San Fernando'),
(763, 1, 41, 'San Gabriel'),
(764, 1, 41, 'San Juan'),
(765, 1, 41, 'Santo Tomas'),
(766, 1, 41, 'Santol'),
(767, 1, 41, 'Sudipen'),
(768, 1, 41, 'Tubao'),
(769, 4, 42, 'Alaminos'),
(770, 4, 42, 'Bay'),
(771, 4, 42, 'Biñan'),
(772, 4, 42, 'Cabuyao'),
(773, 4, 42, 'Calamba'),
(774, 4, 42, 'Calauan'),
(775, 4, 42, 'Cavinti'),
(776, 4, 42, 'Famy'),
(777, 4, 42, 'Kalayaan'),
(778, 4, 42, 'Liliw'),
(779, 4, 42, 'Los Baños'),
(780, 4, 42, 'Luisiana'),
(781, 4, 42, 'Lumban'),
(782, 4, 42, 'Mabitac'),
(783, 4, 42, 'Magdalena'),
(784, 4, 42, 'Majayjay'),
(785, 4, 42, 'Nagcarlan'),
(786, 4, 42, 'Paete'),
(787, 4, 42, 'Pagsanjan'),
(788, 4, 42, 'Pakil'),
(789, 4, 42, 'Pangil'),
(790, 4, 42, 'Pila'),
(791, 4, 42, 'Rizal'),
(792, 4, 42, 'San Pablo'),
(793, 4, 42, 'San Pedro'),
(794, 4, 42, 'Santa Cruz'),
(795, 4, 42, 'Santa Maria'),
(796, 4, 42, 'Santa Rosa'),
(797, 4, 42, 'Siniloan'),
(798, 4, 42, 'Victoria'),
(799, 11, 43, 'Bacolod'),
(800, 11, 43, 'Balo-i'),
(801, 11, 43, 'Baroy'),
(802, 11, 43, 'Iligan'),
(803, 11, 43, 'Kapatagan'),
(804, 11, 43, 'Kauswagan'),
(805, 11, 43, 'Kolambugan'),
(806, 11, 43, 'Lala'),
(807, 11, 43, 'Linamon'),
(808, 11, 43, 'Magsaysay'),
(809, 11, 43, 'Maigo'),
(810, 11, 43, 'Matungao'),
(811, 11, 43, 'Munai'),
(812, 11, 43, 'Nunungan'),
(813, 11, 43, 'Pantao Ragat'),
(814, 11, 43, 'Pantar'),
(815, 11, 43, 'Poona Piagapo'),
(816, 11, 43, 'Salvador'),
(817, 11, 43, 'Sapad'),
(818, 11, 43, 'Sultan Naga Dimaporo'),
(819, 11, 43, 'Tagoloan'),
(820, 11, 43, 'Tangcal'),
(821, 11, 43, 'Tubod'),
(822, 17, 44, 'Amai Manabilang'),
(823, 17, 44, 'Bacolod-Kalawi'),
(824, 17, 44, 'Balabagan'),
(825, 17, 44, 'Balindong'),
(826, 17, 44, 'Bayang'),
(827, 17, 44, 'Binidayan'),
(828, 17, 44, 'Buadiposo-Buntong'),
(829, 17, 44, 'Bubong'),
(830, 17, 44, 'Butig'),
(831, 17, 44, 'Calanogas'),
(832, 17, 44, 'Ditsaan-Ramain'),
(833, 17, 44, 'Ganassi'),
(834, 17, 44, 'Kapai'),
(835, 17, 44, 'Kapatagan'),
(836, 17, 44, 'Lumba-Bayabao'),
(837, 17, 44, 'Lumbaca-Unayan'),
(838, 17, 44, 'Lumbatan'),
(839, 17, 44, 'Lumbayanague'),
(840, 17, 44, 'Madalum'),
(841, 17, 44, 'Madamba'),
(842, 17, 44, 'Maguing'),
(843, 17, 44, 'Malabang'),
(844, 17, 44, 'Marantao'),
(845, 17, 44, 'Islamic City of Marawi'),
(846, 17, 44, 'Marogong'),
(847, 17, 44, 'Masiu'),
(848, 17, 44, 'Mulondo'),
(849, 17, 44, 'Pagayawan'),
(850, 17, 44, 'Piagapo'),
(851, 17, 44, 'Picong'),
(852, 17, 44, 'Poona Bayabao'),
(853, 17, 44, 'Pualas'),
(854, 17, 44, 'Saguiaran'),
(855, 17, 44, 'Sultan Dumalondong'),
(856, 17, 44, 'Tagoloan II'),
(857, 17, 44, 'Tamparan'),
(858, 17, 44, 'Taraka'),
(859, 17, 44, 'Tubaran'),
(860, 17, 44, 'Tugaya'),
(861, 17, 44, 'Wao'),
(862, 9, 45, 'Abuyog'),
(863, 9, 45, 'Alangalang'),
(864, 9, 45, 'Albuera'),
(865, 9, 45, 'Babatngon'),
(866, 9, 45, 'Barugo'),
(867, 9, 45, 'Bato'),
(868, 9, 45, 'Baybay'),
(869, 9, 45, 'Burauen'),
(870, 9, 45, 'Calubian'),
(871, 9, 45, 'Capoocan'),
(872, 9, 45, 'Carigara'),
(873, 9, 45, 'Dagami'),
(874, 9, 45, 'Dulag'),
(875, 9, 45, 'Hilongos'),
(876, 9, 45, 'Hindang'),
(877, 9, 45, 'Inopacan'),
(878, 9, 45, 'Isabel'),
(879, 9, 45, 'Jaro'),
(880, 9, 45, 'Javier'),
(881, 9, 45, 'Julita'),
(882, 9, 45, 'Kananga'),
(883, 9, 45, 'La Paz'),
(884, 9, 45, 'Leyte'),
(885, 9, 45, 'MacArthur'),
(886, 9, 45, 'Mahaplag'),
(887, 9, 45, 'Matag-ob'),
(888, 9, 45, 'Matalom'),
(889, 9, 45, 'Mayorga'),
(890, 9, 45, 'Merida'),
(891, 9, 45, 'Ormoc'),
(892, 9, 45, 'Palo'),
(893, 9, 45, 'Palompon'),
(894, 9, 45, 'Pastrana'),
(895, 9, 45, 'San Isidro'),
(896, 9, 45, 'San Miguel'),
(897, 9, 45, 'Santa Fe'),
(898, 9, 45, 'Tabango'),
(899, 9, 45, 'Tabontabon'),
(900, 9, 45, 'Tacloban'),
(901, 9, 45, 'Tanauan'),
(902, 9, 45, 'Tolosa'),
(903, 9, 45, 'Tunga'),
(904, 9, 45, 'Villaba'),
(905, 17, 46, 'Barira'),
(906, 17, 46, 'Buldon'),
(907, 17, 46, 'Cotabato City'),
(908, 17, 46, 'Datu Blah T. Sinsuat'),
(909, 17, 46, 'Datu Odin Sinsuat'),
(910, 17, 46, 'Kabuntalan'),
(911, 17, 46, 'Matanog'),
(912, 17, 46, 'Northern Kabuntalan'),
(913, 17, 46, 'Parang'),
(914, 17, 46, 'Sultan Kudarat'),
(915, 17, 46, 'Sultan Mastura'),
(916, 17, 46, 'Talitay'),
(917, 17, 46, 'Upi'),
(918, 17, 47, 'Ampatuan'),
(919, 17, 47, 'Buluan'),
(920, 17, 47, 'Datu Abdullah Sangki'),
(921, 17, 47, 'Datu Anggal Midtimbang'),
(922, 17, 47, 'Datu Hoffer Ampatuan'),
(923, 17, 47, 'Datu Montawal'),
(924, 17, 47, 'Datu Paglas'),
(925, 17, 47, 'Datu Piang'),
(926, 17, 47, 'Datu Salibo'),
(927, 17, 47, 'Datu Saudi-Ampatuan'),
(928, 17, 47, 'Datu Unsay'),
(929, 17, 47, 'General Salipada K. Pendatun'),
(930, 17, 47, 'Guindulungan'),
(931, 17, 47, 'Mamasapano'),
(932, 17, 47, 'Mangudadatu'),
(933, 17, 47, 'Pagalungan'),
(934, 17, 47, 'Paglat'),
(935, 17, 47, 'Pandag'),
(936, 17, 47, 'Rajah Buayan'),
(937, 17, 47, 'Shariff Aguak'),
(938, 17, 47, 'Shariff Saydona Mustapha'),
(939, 17, 47, 'South Upi'),
(940, 17, 47, 'Sultan sa Barongis'),
(941, 17, 47, 'Talayan'),
(942, 5, 48, 'Boac'),
(943, 5, 48, 'Buenavista'),
(944, 5, 48, 'Gasan'),
(945, 5, 48, 'Mogpog'),
(946, 5, 48, 'Santa Cruz'),
(947, 5, 48, 'Torrijos'),
(948, 6, 49, 'Aroroy'),
(949, 6, 49, 'Baleno'),
(950, 6, 49, 'Balud'),
(951, 6, 49, 'Batuan'),
(952, 6, 49, 'Cataingan'),
(953, 6, 49, 'Cawayan'),
(954, 6, 49, 'Claveria'),
(955, 6, 49, 'Dimasalang'),
(956, 6, 49, 'Esperanza'),
(957, 6, 49, 'Mandaon'),
(958, 6, 49, 'Masbate City'),
(959, 6, 49, 'Milagros'),
(960, 6, 49, 'Mobo'),
(961, 6, 49, 'Monreal'),
(962, 6, 49, 'Palanas'),
(963, 6, 49, 'Pio V. Corpuz'),
(964, 6, 49, 'Placer'),
(965, 6, 49, 'San Fernando'),
(966, 6, 49, 'San Jacinto'),
(967, 6, 49, 'San Pascual'),
(968, 6, 49, 'Uson'),
(969, 15, 50, 'Caloocan'),
(970, 15, 50, 'Las Piñas'),
(971, 15, 50, 'Makati'),
(972, 15, 50, 'Malabon'),
(973, 15, 50, 'Mandaluyong'),
(974, 15, 50, 'Manila'),
(975, 15, 50, 'Marikina'),
(976, 15, 50, 'Muntinlupa'),
(977, 15, 50, 'Navotas'),
(978, 15, 50, 'Parañaque'),
(979, 15, 50, 'Pasay'),
(980, 15, 50, 'Pasig'),
(981, 15, 50, 'Pateros'),
(982, 15, 50, 'Quezon City'),
(983, 15, 50, 'San Juan'),
(984, 15, 50, 'Taguig'),
(985, 15, 50, 'Valenzuela'),
(986, 11, 51, 'Aloran'),
(987, 11, 51, 'Baliangao'),
(988, 11, 51, 'Bonifacio'),
(989, 11, 51, 'Calamba'),
(990, 11, 51, 'Clarin'),
(991, 11, 51, 'Concepcion'),
(992, 11, 51, 'Don Victoriano Chiongbian'),
(993, 11, 51, 'Jimenez'),
(994, 11, 51, 'Lopez Jaena'),
(995, 11, 51, 'Oroquieta'),
(996, 11, 51, 'Ozamiz'),
(997, 11, 51, 'Panaon'),
(998, 11, 51, 'Plaridel'),
(999, 11, 51, 'Sapang Dalaga'),
(1000, 11, 51, 'Sinacaban'),
(1001, 11, 51, 'Tangub'),
(1002, 11, 51, 'Tudela'),
(1003, 11, 52, 'Alubijid'),
(1004, 11, 52, 'Balingasag'),
(1005, 11, 52, 'Balingoan'),
(1006, 11, 52, 'Binuangan'),
(1007, 11, 52, 'Cagayan de Oro'),
(1008, 11, 52, 'Claveria'),
(1009, 11, 52, 'El Salvador'),
(1010, 11, 52, 'Gingoog'),
(1011, 11, 52, 'Gitagum'),
(1012, 11, 52, 'Initao'),
(1013, 11, 52, 'Jasaan'),
(1014, 11, 52, 'Kinoguitan'),
(1015, 11, 52, 'Lagonglong'),
(1016, 11, 52, 'Laguindingan'),
(1017, 11, 52, 'Libertad'),
(1018, 11, 52, 'Lugait'),
(1019, 11, 52, 'Magsaysay'),
(1020, 11, 52, 'Manticao'),
(1021, 11, 52, 'Medina'),
(1022, 11, 52, 'Naawan'),
(1023, 11, 52, 'Opol'),
(1024, 11, 52, 'Salay'),
(1025, 11, 52, 'Sugbongcogon'),
(1026, 11, 52, 'Tagoloan'),
(1027, 11, 52, 'Talisayan'),
(1028, 11, 52, 'Villanueva'),
(1029, 16, 53, 'Barlig'),
(1030, 16, 53, 'Bauko'),
(1031, 16, 53, 'Besao'),
(1032, 16, 53, 'Bontoc'),
(1033, 16, 53, 'Natonin'),
(1034, 16, 53, 'Paracelis'),
(1035, 16, 53, 'Sabangan'),
(1036, 16, 53, 'Sadanga'),
(1037, 16, 53, 'Sagada'),
(1038, 16, 53, 'Tadian'),
(1039, 7, 54, 'Bacolod'),
(1040, 7, 54, 'Bago'),
(1041, 7, 54, 'Binalbagan'),
(1042, 7, 54, 'Cadiz'),
(1043, 7, 54, 'Calatrava'),
(1044, 7, 54, 'Candoni'),
(1045, 7, 54, 'Cauayan'),
(1046, 7, 54, 'Enrique B. Magalona'),
(1047, 7, 54, 'Escalante'),
(1048, 7, 54, 'Himamaylan'),
(1049, 7, 54, 'Hinigaran'),
(1050, 7, 54, 'Hinoba-an'),
(1051, 7, 54, 'Ilog'),
(1052, 7, 54, 'Isabela'),
(1053, 7, 54, 'Kabankalan'),
(1054, 7, 54, 'La Carlota'),
(1055, 7, 54, 'La Castellana'),
(1056, 7, 54, 'Manapla'),
(1057, 7, 54, 'Moises Padilla'),
(1058, 7, 54, 'Murcia'),
(1059, 7, 54, 'Pontevedra'),
(1060, 7, 54, 'Pulupandan'),
(1061, 7, 54, 'Sagay'),
(1062, 7, 54, 'Salvador Benedicto'),
(1063, 7, 54, 'San Carlos'),
(1064, 7, 54, 'San Enrique'),
(1065, 7, 54, 'Silay'),
(1066, 7, 54, 'Sipalay'),
(1067, 7, 54, 'Talisay'),
(1068, 7, 54, 'Toboso'),
(1069, 7, 54, 'Valladolid'),
(1070, 7, 54, 'Victorias'),
(1071, 8, 55, 'Amlan'),
(1072, 8, 55, 'Ayungon'),
(1073, 8, 55, 'Bacong'),
(1074, 8, 55, 'Bais'),
(1075, 8, 55, 'Basay'),
(1076, 8, 55, 'Bayawan'),
(1077, 8, 55, 'Bindoy'),
(1078, 8, 55, 'Canlaon'),
(1079, 8, 55, 'Dauin'),
(1080, 8, 55, 'Dumaguete'),
(1081, 8, 55, 'Guihulngan'),
(1082, 8, 55, 'Jimalalud'),
(1083, 8, 55, 'La Libertad'),
(1084, 8, 55, 'Mabinay'),
(1085, 8, 55, 'Manjuyod'),
(1086, 8, 55, 'Pamplona'),
(1087, 8, 55, 'San Jose'),
(1088, 8, 55, 'Santa Catalina'),
(1089, 8, 55, 'Siaton'),
(1090, 8, 55, 'Sibulan'),
(1091, 8, 55, 'Tanjay'),
(1092, 8, 55, 'Tayasan'),
(1093, 8, 55, 'Valencia'),
(1094, 8, 55, 'Vallehermoso'),
(1095, 8, 55, 'Zamboanguita'),
(1096, 9, 56, 'Allen'),
(1097, 9, 56, 'Biri'),
(1098, 9, 56, 'Bobon'),
(1099, 9, 56, 'Capul'),
(1100, 9, 56, 'Catarman'),
(1101, 9, 56, 'Catubig'),
(1102, 9, 56, 'Gamay'),
(1103, 9, 56, 'Laoang'),
(1104, 9, 56, 'Lapinig'),
(1105, 9, 56, 'Las Navas'),
(1106, 9, 56, 'Lavezares'),
(1107, 9, 56, 'Lope de Vega'),
(1108, 9, 56, 'Mapanas'),
(1109, 9, 56, 'Mondragon'),
(1110, 9, 56, 'Palapag'),
(1111, 9, 56, 'Pambujan'),
(1112, 9, 56, 'Rosario'),
(1113, 9, 56, 'San Antonio'),
(1114, 9, 56, 'San Isidro'),
(1115, 9, 56, 'San Jose'),
(1116, 9, 56, 'San Roque'),
(1117, 9, 56, 'San Vicente'),
(1118, 9, 56, 'Silvino Lobos'),
(1119, 9, 56, 'Victoria'),
(1120, 3, 57, 'Aliaga'),
(1121, 3, 57, 'Bongabon'),
(1122, 3, 57, 'Cabanatuan'),
(1123, 3, 57, 'Cabiao'),
(1124, 3, 57, 'Carranglan'),
(1125, 3, 57, 'Cuyapo'),
(1126, 3, 57, 'Gabaldon'),
(1127, 3, 57, 'Gapan'),
(1128, 3, 57, 'General Mamerto Natividad'),
(1129, 3, 57, 'General Tinio'),
(1130, 3, 57, 'Guimba'),
(1131, 3, 57, 'Jaen'),
(1132, 3, 57, 'Laur'),
(1133, 3, 57, 'Licab'),
(1134, 3, 57, 'Llanera'),
(1135, 3, 57, 'Lupao'),
(1136, 3, 57, 'Muñoz'),
(1137, 3, 57, 'Nampicuan'),
(1138, 3, 57, 'Palayan'),
(1139, 3, 57, 'Pantabangan'),
(1140, 3, 57, 'Peñaranda'),
(1141, 3, 57, 'Quezon'),
(1142, 3, 57, 'Rizal'),
(1143, 3, 57, 'San Antonio'),
(1144, 3, 57, 'San Isidro'),
(1145, 3, 57, 'San Jose'),
(1146, 3, 57, 'San Leonardo'),
(1147, 3, 57, 'Santa Rosa'),
(1148, 3, 57, 'Santo Domingo'),
(1149, 3, 57, 'Talavera'),
(1150, 3, 57, 'Talugtug'),
(1151, 3, 57, 'Zaragoza'),
(1152, 2, 58, 'Alfonso Castañeda'),
(1153, 2, 58, 'Ambaguio'),
(1154, 2, 58, 'Aritao'),
(1155, 2, 58, 'Bagabag'),
(1156, 2, 58, 'Bambang'),
(1157, 2, 58, 'Bayombong'),
(1158, 2, 58, 'Diadi'),
(1159, 2, 58, 'Dupax del Norte'),
(1160, 2, 58, 'Dupax del Sur'),
(1161, 2, 58, 'Kasibu'),
(1162, 2, 58, 'Kayapa'),
(1163, 2, 58, 'Quezon'),
(1164, 2, 58, 'Santa Fe'),
(1165, 2, 58, 'Solano'),
(1166, 2, 58, 'Villaverde'),
(1167, 5, 59, 'Abra de Ilog'),
(1168, 5, 59, 'Calintaan'),
(1169, 5, 59, 'Looc'),
(1170, 5, 59, 'Lubang'),
(1171, 5, 59, 'Magsaysay'),
(1172, 5, 59, 'Mamburao'),
(1173, 5, 59, 'Paluan'),
(1174, 5, 59, 'Rizal'),
(1175, 5, 59, 'Sablayan'),
(1176, 5, 59, 'San Jose'),
(1177, 5, 59, 'Santa Cruz'),
(1178, 5, 60, 'Baco'),
(1179, 5, 60, 'Bansud'),
(1180, 5, 60, 'Bongabong'),
(1181, 5, 60, 'Bulalacao'),
(1182, 5, 60, 'Calapan'),
(1183, 5, 60, 'Gloria'),
(1184, 5, 60, 'Mansalay'),
(1185, 5, 60, 'Naujan'),
(1186, 5, 60, 'Pinamalayan'),
(1187, 5, 60, 'Pola'),
(1188, 5, 60, 'Puerto Galera'),
(1189, 5, 60, 'Roxas'),
(1190, 5, 60, 'San Teodoro'),
(1191, 5, 60, 'Socorro'),
(1192, 5, 60, 'Victoria'),
(1193, 5, 61, 'Aborlan'),
(1194, 5, 61, 'Agutaya'),
(1195, 5, 61, 'Araceli'),
(1196, 5, 61, 'Balabac'),
(1197, 5, 61, 'Bataraza'),
(1198, 5, 61, 'Brooke\'s Point'),
(1199, 5, 61, 'Busuanga'),
(1200, 5, 61, 'Cagayancillo'),
(1201, 5, 61, 'Coron'),
(1202, 5, 61, 'Culion'),
(1203, 5, 61, 'Cuyo'),
(1204, 5, 61, 'Dumaran'),
(1205, 5, 61, 'El Nido'),
(1206, 5, 61, 'Kalayaan'),
(1207, 5, 61, 'Linapacan'),
(1208, 5, 61, 'Magsaysay'),
(1209, 5, 61, 'Narra'),
(1210, 5, 61, 'Puerto Princesa'),
(1211, 5, 61, 'Quezon'),
(1212, 5, 61, 'Rizal'),
(1213, 5, 61, 'Roxas'),
(1214, 5, 61, 'San Vicente'),
(1215, 5, 61, 'Sofronio Española'),
(1216, 5, 61, 'Taytay'),
(1217, 3, 62, 'Angeles'),
(1218, 3, 62, 'Apalit'),
(1219, 3, 62, 'Arayat'),
(1220, 3, 62, 'Bacolor'),
(1221, 3, 62, 'Candaba'),
(1222, 3, 62, 'Floridablanca'),
(1223, 3, 62, 'Guagua'),
(1224, 3, 62, 'Lubao'),
(1225, 3, 62, 'Mabalacat'),
(1226, 3, 62, 'Macabebe'),
(1227, 3, 62, 'Magalang'),
(1228, 3, 62, 'Masantol'),
(1229, 3, 62, 'Mexico'),
(1230, 3, 62, 'Minalin'),
(1231, 3, 62, 'Porac'),
(1232, 3, 62, 'San Fernando'),
(1233, 3, 62, 'San Luis'),
(1234, 3, 62, 'San Simon'),
(1235, 3, 62, 'Santa Ana'),
(1236, 3, 62, 'Santa Rita'),
(1237, 3, 62, 'Santo Tomas'),
(1238, 3, 62, 'Sasmuan'),
(1239, 1, 63, 'Agno'),
(1240, 1, 63, 'Aguilar'),
(1241, 1, 63, 'Alaminos'),
(1242, 1, 63, 'Alcala'),
(1243, 1, 63, 'Anda'),
(1244, 1, 63, 'Asingan'),
(1245, 1, 63, 'Balungao'),
(1246, 1, 63, 'Bani'),
(1247, 1, 63, 'Basista'),
(1248, 1, 63, 'Bautista'),
(1249, 1, 63, 'Bayambang'),
(1250, 1, 63, 'Binalonan'),
(1251, 1, 63, 'Binmaley'),
(1252, 1, 63, 'Bolinao'),
(1253, 1, 63, 'Bugallon'),
(1254, 1, 63, 'Burgos'),
(1255, 1, 63, 'Calasiao'),
(1256, 1, 63, 'Dagupan'),
(1257, 1, 63, 'Dasol'),
(1258, 1, 63, 'Infanta'),
(1259, 1, 63, 'Labrador'),
(1260, 1, 63, 'Laoac'),
(1261, 1, 63, 'Lingayen'),
(1262, 1, 63, 'Mabini'),
(1263, 1, 63, 'Malasiqui'),
(1264, 1, 63, 'Manaoag'),
(1265, 1, 63, 'Mangaldan'),
(1266, 1, 63, 'Mangatarem'),
(1267, 1, 63, 'Mapandan'),
(1268, 1, 63, 'Natividad'),
(1269, 1, 63, 'Pozorrubio'),
(1270, 1, 63, 'Rosales'),
(1271, 1, 63, 'San Carlos'),
(1272, 1, 63, 'San Fabian'),
(1273, 1, 63, 'San Jacinto'),
(1274, 1, 63, 'San Manuel'),
(1275, 1, 63, 'San Nicolas'),
(1276, 1, 63, 'San Quintin'),
(1277, 1, 63, 'Santa Barbara'),
(1278, 1, 63, 'Santa Maria'),
(1279, 1, 63, 'Santo Tomas'),
(1280, 1, 63, 'Sison'),
(1281, 1, 63, 'Sual'),
(1282, 1, 63, 'Tayug'),
(1283, 1, 63, 'Umingan'),
(1284, 1, 63, 'Urbiztondo'),
(1285, 1, 63, 'Urdaneta'),
(1286, 1, 63, 'Villasis'),
(1287, 4, 64, 'Agdangan'),
(1288, 4, 64, 'Alabat'),
(1289, 4, 64, 'Atimonan'),
(1290, 4, 64, 'Buenavista'),
(1291, 4, 64, 'Burdeos'),
(1292, 4, 64, 'Calauag'),
(1293, 4, 64, 'Candelaria'),
(1294, 4, 64, 'Catanauan'),
(1295, 4, 64, 'Dolores'),
(1296, 4, 64, 'General Luna'),
(1297, 4, 64, 'General Nakar'),
(1298, 4, 64, 'Guinayangan'),
(1299, 4, 64, 'Gumaca'),
(1300, 4, 64, 'Infanta'),
(1301, 4, 64, 'Jomalig'),
(1302, 4, 64, 'Lopez'),
(1303, 4, 64, 'Lucban'),
(1304, 4, 64, 'Lucena'),
(1305, 4, 64, 'Macalelon'),
(1306, 4, 64, 'Mauban'),
(1307, 4, 64, 'Mulanay'),
(1308, 4, 64, 'Padre Burgos'),
(1309, 4, 64, 'Pagbilao'),
(1310, 4, 64, 'Panukulan'),
(1311, 4, 64, 'Patnanungan'),
(1312, 4, 64, 'Perez'),
(1313, 4, 64, 'Pitogo'),
(1314, 4, 64, 'Plaridel'),
(1315, 4, 64, 'Polillo'),
(1316, 4, 64, 'Quezon'),
(1317, 4, 64, 'Real'),
(1318, 4, 64, 'Sampaloc'),
(1319, 4, 64, 'San Andres'),
(1320, 4, 64, 'San Antonio'),
(1321, 4, 64, 'San Francisco'),
(1322, 4, 64, 'San Narciso'),
(1323, 4, 64, 'Sariaya'),
(1324, 4, 64, 'Tagkawayan'),
(1325, 4, 64, 'Tayabas'),
(1326, 4, 64, 'Tiaong'),
(1327, 4, 64, 'Unisan'),
(1328, 2, 65, 'Aglipay'),
(1329, 2, 65, 'Cabarroguis'),
(1330, 2, 65, 'Diffun'),
(1331, 2, 65, 'Maddela'),
(1332, 2, 65, 'Nagtipunan'),
(1333, 2, 65, 'Saguday'),
(1334, 4, 66, 'Angono'),
(1335, 4, 66, 'Antipolo'),
(1336, 4, 66, 'Baras'),
(1337, 4, 66, 'Binangonan'),
(1338, 4, 66, 'Cainta'),
(1339, 4, 66, 'Cardona'),
(1340, 4, 66, 'Jalajala'),
(1341, 4, 66, 'Morong'),
(1342, 4, 66, 'Pililla'),
(1343, 4, 66, 'Rodriguez'),
(1344, 4, 66, 'San Mateo'),
(1345, 4, 66, 'Tanay'),
(1346, 4, 66, 'Taytay'),
(1347, 4, 66, 'Teresa'),
(1348, 5, 67, 'Alcantara'),
(1349, 5, 67, 'Banton'),
(1350, 5, 67, 'Cajidiocan'),
(1351, 5, 67, 'Calatrava'),
(1352, 5, 67, 'Concepcion'),
(1353, 5, 67, 'Corcuera'),
(1354, 5, 67, 'Ferrol'),
(1355, 5, 67, 'Looc'),
(1356, 5, 67, 'Magdiwang'),
(1357, 5, 67, 'Odiongan'),
(1358, 5, 67, 'Romblon'),
(1359, 5, 67, 'San Agustin'),
(1360, 5, 67, 'San Andres'),
(1361, 5, 67, 'San Fernando'),
(1362, 5, 67, 'San Jose'),
(1363, 5, 67, 'Santa Fe'),
(1364, 5, 67, 'Santa Maria'),
(1365, 9, 68, 'Almagro'),
(1366, 9, 68, 'Basey'),
(1367, 9, 68, 'Calbayog'),
(1368, 9, 68, 'Calbiga'),
(1369, 9, 68, 'Catbalogan'),
(1370, 9, 68, 'Daram'),
(1371, 9, 68, 'Gandara'),
(1372, 9, 68, 'Hinabangan'),
(1373, 9, 68, 'Jiabong'),
(1374, 9, 68, 'Marabut'),
(1375, 9, 68, 'Matuguinao'),
(1376, 9, 68, 'Motiong'),
(1377, 9, 68, 'Pagsanghan'),
(1378, 9, 68, 'Paranas'),
(1379, 9, 68, 'Pinabacdao'),
(1380, 9, 68, 'San Jorge'),
(1381, 9, 68, 'San Jose de Buan'),
(1382, 9, 68, 'San Sebastian'),
(1383, 9, 68, 'Santa Margarita'),
(1384, 9, 68, 'Santa Rita'),
(1385, 9, 68, 'Santo Niño'),
(1386, 9, 68, 'Tagapul-an'),
(1387, 9, 68, 'Talalora'),
(1388, 9, 68, 'Tarangnan'),
(1389, 9, 68, 'Villareal'),
(1390, 9, 68, 'Zumarraga'),
(1391, 13, 69, 'Alabel'),
(1392, 13, 69, 'Glan'),
(1393, 13, 69, 'Kiamba'),
(1394, 13, 69, 'Maasim'),
(1395, 13, 69, 'Maitum'),
(1396, 13, 69, 'Malapatan'),
(1397, 13, 69, 'Malungon'),
(1398, 8, 70, 'Enrique Villanueva'),
(1399, 8, 70, 'Larena'),
(1400, 8, 70, 'Lazi'),
(1401, 8, 70, 'Maria'),
(1402, 8, 70, 'San Juan'),
(1403, 8, 70, 'Siquijor'),
(1404, 6, 71, 'Barcelona'),
(1405, 6, 71, 'Bulan'),
(1406, 6, 71, 'Bulusan'),
(1407, 6, 71, 'Casiguran'),
(1408, 6, 71, 'Castilla'),
(1409, 6, 71, 'Donsol'),
(1410, 6, 71, 'Gubat'),
(1411, 6, 71, 'Irosin'),
(1412, 6, 71, 'Juban'),
(1413, 6, 71, 'Magallanes'),
(1414, 6, 71, 'Matnog'),
(1415, 6, 71, 'Pilar'),
(1416, 6, 71, 'Prieto Diaz'),
(1417, 6, 71, 'Santa Magdalena'),
(1418, 6, 71, 'Sorsogon City'),
(1419, 13, 72, 'Banga'),
(1420, 13, 72, 'General Santos'),
(1421, 13, 72, 'Koronadal'),
(1422, 13, 72, 'Lake Sebu'),
(1423, 13, 72, 'Norala'),
(1424, 13, 72, 'Polomolok'),
(1425, 13, 72, 'Santo Niño'),
(1426, 13, 72, 'Surallah'),
(1427, 13, 72, 'T\'Boli'),
(1428, 13, 72, 'Tampakan'),
(1429, 13, 72, 'Tantangan'),
(1430, 13, 72, 'Tupi'),
(1431, 9, 73, 'Anahawan'),
(1432, 9, 73, 'Bontoc'),
(1433, 9, 73, 'Hinunangan'),
(1434, 9, 73, 'Hinundayan'),
(1435, 9, 73, 'Libagon'),
(1436, 9, 73, 'Liloan'),
(1437, 9, 73, 'Limasawa'),
(1438, 9, 73, 'Maasin'),
(1439, 9, 73, 'Macrohon'),
(1440, 9, 73, 'Malitbog'),
(1441, 9, 73, 'Padre Burgos'),
(1442, 9, 73, 'Pintuyan'),
(1443, 9, 73, 'Saint Bernard'),
(1444, 9, 73, 'San Francisco'),
(1445, 9, 73, 'San Juan'),
(1446, 9, 73, 'San Ricardo'),
(1447, 9, 73, 'Silago'),
(1448, 9, 73, 'Sogod'),
(1449, 9, 73, 'Tomas Oppus'),
(1450, 13, 74, 'Bagumbayan'),
(1451, 13, 74, 'Columbio'),
(1452, 13, 74, 'Esperanza'),
(1453, 13, 74, 'Isulan'),
(1454, 13, 74, 'Kalamansig'),
(1455, 13, 74, 'Lambayong'),
(1456, 13, 74, 'Lebak'),
(1457, 13, 74, 'Lutayan'),
(1458, 13, 74, 'Palimbang'),
(1459, 13, 74, 'President Quirino'),
(1460, 13, 74, 'Senator Ninoy Aquino'),
(1461, 13, 74, 'Tacurong'),
(1462, 17, 75, 'Banguingui'),
(1463, 17, 75, 'Hadji Panglima Tahil'),
(1464, 17, 75, 'Indanan'),
(1465, 17, 75, 'Jolo'),
(1466, 17, 75, 'Kalingalan Caluang'),
(1467, 17, 75, 'Lugus'),
(1468, 17, 75, 'Luuk'),
(1469, 17, 75, 'Maimbung'),
(1470, 17, 75, 'Omar'),
(1471, 17, 75, 'Old Panamao'),
(1472, 17, 75, 'Pandami'),
(1473, 17, 75, 'Panglima Estino (New Panamao)'),
(1474, 17, 75, 'Pangutaran'),
(1475, 17, 75, 'Parang'),
(1476, 17, 75, 'Pata'),
(1477, 17, 75, 'Patikul'),
(1478, 17, 75, 'Siasi'),
(1479, 17, 75, 'Talipao'),
(1480, 17, 75, 'Tapul'),
(1481, 14, 76, 'Alegria'),
(1482, 14, 76, 'Bacuag'),
(1483, 14, 76, 'Burgos'),
(1484, 14, 76, 'Claver'),
(1485, 14, 76, 'Dapa'),
(1486, 14, 76, 'Del Carmen'),
(1487, 14, 76, 'General Luna'),
(1488, 14, 76, 'Gigaquit'),
(1489, 14, 76, 'Mainit'),
(1490, 14, 76, 'Malimono'),
(1491, 14, 76, 'Pilar'),
(1492, 14, 76, 'Placer'),
(1493, 14, 76, 'San Benito'),
(1494, 14, 76, 'San Francisco'),
(1495, 14, 76, 'San Isidro'),
(1496, 14, 76, 'Santa Monica'),
(1497, 14, 76, 'Sison'),
(1498, 14, 76, 'Socorro'),
(1499, 14, 76, 'Surigao City'),
(1500, 14, 76, 'Tagana-an'),
(1501, 14, 76, 'Tubod'),
(1502, 14, 77, 'Barobo'),
(1503, 14, 77, 'Bayabas'),
(1504, 14, 77, 'Bislig'),
(1505, 14, 77, 'Cagwait'),
(1506, 14, 77, 'Cantilan'),
(1507, 14, 77, 'Carmen'),
(1508, 14, 77, 'Carrascal'),
(1509, 14, 77, 'Cortes'),
(1510, 14, 77, 'Hinatuan'),
(1511, 14, 77, 'Lanuza'),
(1512, 14, 77, 'Lianga'),
(1513, 14, 77, 'Lingig'),
(1514, 14, 77, 'Madrid'),
(1515, 14, 77, 'Marihatag'),
(1516, 14, 77, 'San Agustin'),
(1517, 14, 77, 'San Miguel'),
(1518, 14, 77, 'Tagbina'),
(1519, 14, 77, 'Tago'),
(1520, 14, 77, 'Tandag'),
(1521, 3, 78, 'Anao'),
(1522, 3, 78, 'Bamban'),
(1523, 3, 78, 'Camiling'),
(1524, 3, 78, 'Capas'),
(1525, 3, 78, 'Concepcion'),
(1526, 3, 78, 'Gerona'),
(1527, 3, 78, 'La Paz'),
(1528, 3, 78, 'Mayantoc'),
(1529, 3, 78, 'Moncada'),
(1530, 3, 78, 'Paniqui'),
(1531, 3, 78, 'Pura'),
(1532, 3, 78, 'Ramos'),
(1533, 3, 78, 'San Clemente'),
(1534, 3, 78, 'San Jose'),
(1535, 3, 78, 'San Manuel'),
(1536, 3, 78, 'Santa Ignacia'),
(1537, 3, 78, 'Tarlac City'),
(1538, 3, 78, 'Victoria'),
(1539, 17, 79, 'Bongao'),
(1540, 17, 79, 'Languyan'),
(1541, 17, 79, 'Mapun'),
(1542, 17, 79, 'Panglima Sugala'),
(1543, 17, 79, 'Sapa-Sapa'),
(1544, 17, 79, 'Sibutu'),
(1545, 17, 79, 'Simunul'),
(1546, 17, 79, 'Sitangkai'),
(1547, 17, 79, 'South Ubian'),
(1548, 17, 79, 'Tandubas'),
(1549, 17, 79, 'Turtle Islands'),
(1550, 3, 80, 'Botolan'),
(1551, 3, 80, 'Cabangan'),
(1552, 3, 80, 'Candelaria'),
(1553, 3, 80, 'Castillejos'),
(1554, 3, 80, 'Iba'),
(1555, 3, 80, 'Masinloc'),
(1556, 3, 80, 'Olongapo'),
(1557, 3, 80, 'Palauig'),
(1558, 3, 80, 'San Antonio'),
(1559, 3, 80, 'San Felipe'),
(1560, 3, 80, 'San Marcelino'),
(1561, 3, 80, 'San Narciso'),
(1562, 3, 80, 'Santa Cruz'),
(1563, 3, 80, 'Subic'),
(1564, 10, 81, 'Baliguian'),
(1565, 10, 81, 'Dapitan'),
(1566, 10, 81, 'Dipolog'),
(1567, 10, 81, 'Godod'),
(1568, 10, 81, 'Gutalac'),
(1569, 10, 81, 'Jose Dalman'),
(1570, 10, 81, 'Kalawit'),
(1571, 10, 81, 'Katipunan'),
(1572, 10, 81, 'La Libertad'),
(1573, 10, 81, 'Labason'),
(1574, 10, 81, 'Leon B. Postigo'),
(1575, 10, 81, 'Liloy'),
(1576, 10, 81, 'Manukan'),
(1577, 10, 81, 'Mutia'),
(1578, 10, 81, 'Piñan'),
(1579, 10, 81, 'Polanco'),
(1580, 10, 81, 'Rizal'),
(1581, 10, 81, 'Pres. Manuel Roxas'),
(1582, 10, 81, 'Salug'),
(1583, 10, 81, 'Sergio Osmeña'),
(1584, 10, 81, 'Siayan'),
(1585, 10, 81, 'Sibuco'),
(1586, 10, 81, 'Sibutad'),
(1587, 10, 81, 'Sindangan'),
(1588, 10, 81, 'Siocon'),
(1589, 10, 81, 'Sirawai'),
(1590, 10, 81, 'Tampilisan'),
(1591, 10, 82, 'Aurora'),
(1592, 10, 82, 'Bayog'),
(1593, 10, 82, 'Dimataling'),
(1594, 10, 82, 'Dinas'),
(1595, 10, 82, 'Dumalinao'),
(1596, 10, 82, 'Dumingag'),
(1597, 10, 82, 'Guipos'),
(1598, 10, 82, 'Josefina'),
(1599, 10, 82, 'Kumalarang'),
(1600, 10, 82, 'Labangan'),
(1601, 10, 82, 'Lakewood'),
(1602, 10, 82, 'Lapuyan'),
(1603, 10, 82, 'Mahayag'),
(1604, 10, 82, 'Margosatubig'),
(1605, 10, 82, 'Midsalip'),
(1606, 10, 82, 'Molave'),
(1607, 10, 82, 'Pagadian'),
(1608, 10, 82, 'Pitogo'),
(1609, 10, 82, 'Ramon Magsaysay'),
(1610, 10, 82, 'San Miguel'),
(1611, 10, 82, 'San Pablo'),
(1612, 10, 82, 'Sominot'),
(1613, 10, 82, 'Tabina'),
(1614, 10, 82, 'Tambulig'),
(1615, 10, 82, 'Tigbao'),
(1616, 10, 82, 'Tukuran'),
(1617, 10, 82, 'Vincenzo A. Sagun'),
(1618, 10, 82, 'Zamboanga City'),
(1619, 10, 83, 'Alicia'),
(1620, 10, 83, 'Buug'),
(1621, 10, 83, 'Diplahan'),
(1622, 10, 83, 'Imelda'),
(1623, 10, 83, 'Ipil'),
(1624, 10, 83, 'Kabasalan'),
(1625, 10, 83, 'Mabuhay'),
(1626, 10, 83, 'Malangas'),
(1627, 10, 83, 'Naga'),
(1628, 10, 83, 'Olutanga'),
(1629, 10, 83, 'Payao'),
(1630, 10, 83, 'Roseller Lim'),
(1631, 10, 83, 'Siay'),
(1632, 10, 83, 'Talusan'),
(1633, 10, 83, 'Titay'),
(1634, 10, 83, 'Tungawan');

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` int(11) NOT NULL,
  `requested_at` datetime DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `is_paid` int(11) DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `proof_of_payment` varchar(255) DEFAULT NULL,
  `is_verified` int(11) DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `commissions`
--

INSERT INTO `commissions` (`id`, `requested_at`, `worker_id`, `amount`, `is_paid`, `paid_at`, `proof_of_payment`, `is_verified`, `verified_at`) VALUES
(11, '2024-06-01 19:12:22', 1, '145.00', 1, '2024-06-01 19:12:49', 'proof_of_payments/eTplCtMZzM2qyRwJzeGWzhGSGgxSHI3HDhCaHlcL.png', 1, '2024-06-01 19:14:54'),
(12, '2024-06-01 19:12:22', 2, '75.00', 1, '2024-06-01 19:13:13', 'proof_of_payments/C0cY0MsYK1CWxKceK3GYrXPOwLvz5hS7GdlfslMA.jpg', 0, NULL),
(13, '2024-06-01 19:12:22', 5, '100.00', 0, NULL, NULL, 0, NULL),
(14, '2024-06-06 23:53:09', 15, '500.00', 1, '2024-06-06 23:56:45', 'proof_of_payments/dLHgKW3iBb45fIlGwvVRBLxaPjBikh7xJHYkFkiE.jpg', 1, '2024-06-06 23:57:38');

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `id` int(11) NOT NULL,
  `gender` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `gender`) VALUES
(1, 'Female'),
(2, 'Male'),
(3, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `marital_statuses`
--

CREATE TABLE `marital_statuses` (
  `id` int(11) NOT NULL,
  `marital_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `marital_statuses`
--

INSERT INTO `marital_statuses` (`id`, `marital_status`) VALUES
(1, 'Single'),
(2, 'Married'),
(3, 'Divorced'),
(4, 'Widowed'),
(5, 'Separated');

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` int(11) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `province` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `region_id`, `province`) VALUES
(1, 16, 'Abra'),
(2, 14, 'Agusan del Norte'),
(3, 14, 'Agusan del Sur'),
(4, 7, 'Aklan'),
(5, 6, 'Albay'),
(6, 7, 'Antique'),
(7, 16, 'Apayao'),
(8, 3, 'Aurora'),
(9, 17, 'Basilan'),
(10, 3, 'Bataan'),
(11, 2, 'Batanes'),
(12, 4, 'Batangas'),
(13, 16, 'Benguet'),
(14, 9, 'Biliran'),
(15, 8, 'Bohol'),
(16, 11, 'Bukidnon'),
(17, 3, 'Bulacan'),
(18, 2, 'Cagayan'),
(19, 6, 'Camarines Norte'),
(20, 6, 'Camarines Sur'),
(21, 11, 'Camiguin'),
(22, 7, 'Capiz'),
(23, 6, 'Catanduanes'),
(24, 4, 'Cavite'),
(25, 8, 'Cebu'),
(26, 13, 'Cotabato'),
(27, 12, 'Davao de Oro'),
(28, 12, 'Davao del Norte'),
(29, 12, 'Davao del Sur'),
(30, 12, 'Davao Occidental'),
(31, 12, 'Davao Oriental'),
(32, 14, 'Dinagat Islands'),
(33, 9, 'Eastern Samar'),
(34, 7, 'Guimaras'),
(35, 16, 'Ifugao'),
(36, 1, 'Ilocos Norte'),
(37, 1, 'Ilocos Sur'),
(38, 7, 'Iloilo'),
(39, 2, 'Isabela'),
(40, 16, 'Kalinga'),
(41, 1, 'LaUnion'),
(42, 4, 'Laguna'),
(43, 11, 'Lanaodel Norte'),
(44, 17, 'Lanao del Sur'),
(45, 9, 'Leyte'),
(46, 17, 'Maguindanao del Norte'),
(47, 17, 'Maguindanao del Sur'),
(48, 5, 'Marinduque'),
(49, 6, 'Masbate'),
(50, 15, 'Metro Manila'),
(51, 11, 'Misamis Occidental'),
(52, 11, 'Misamis Oriental'),
(53, 16, 'Mountain Province'),
(54, 7, 'Negros Occidental'),
(55, 8, 'Negros Oriental'),
(56, 9, 'Northern Samar'),
(57, 3, 'Nueva Ecija'),
(58, 2, 'Nueva Vizcaya'),
(59, 5, 'Occidental Mindoro'),
(60, 5, 'Oriental Mindoro'),
(61, 5, 'Palawan'),
(62, 3, 'Pampanga'),
(63, 1, 'Pangasinan'),
(64, 4, 'Quezon'),
(65, 2, 'Quirino'),
(66, 4, 'Rizal'),
(67, 5, 'Romblon'),
(68, 9, 'Samar'),
(69, 13, 'Sarangani'),
(70, 8, 'Siquijor'),
(71, 6, 'Sorsogon'),
(72, 13, 'South Cotabato'),
(73, 9, 'Southern Leyte'),
(74, 13, 'Sultan Kudarat'),
(75, 17, 'Sulu'),
(76, 14, 'Surigao del Norte'),
(77, 14, 'Surigao del Sur'),
(78, 3, 'Tarlac'),
(79, 17, 'Tawi-Tawi'),
(80, 3, 'Zambales'),
(81, 10, 'Zamboanga del Norte'),
(82, 10, 'Zamboanga del Sur'),
(83, 10, 'Zamboanga Sibugay');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(11) NOT NULL,
  `region` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `region`) VALUES
(1, 'Region I - Ilocos Region'),
(2, 'Region II - Cagayan Valley'),
(3, 'Region III - Central Luzon'),
(4, 'Region IV-A - CALABARZON'),
(5, 'MIMAROPA Region'),
(6, 'Region V - Bicol Region'),
(7, 'Region VI - Western Visayas'),
(8, 'Region VII - Central Visayas'),
(9, 'Region VIII - Eastern Visayas'),
(10, 'Region IX - Zamboanga Peninsula'),
(11, 'Region X - Northern Mindanao'),
(12, 'Region XI - Davao Region'),
(13, 'Region XII - SOCCSKSARGEN'),
(14, 'Region XIII - Caraga'),
(15, 'NCR - National Capital Region'),
(16, 'CAR - Cordillera Administrative Region'),
(17, 'BARMM - Bangsamoro Autonomous Region in Muslim Mindanao');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'Admin'),
(2, 'Client'),
(3, 'Worker');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `service` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `category_id`, `service`) VALUES
(1, 1, 'Air Conditioner Technician'),
(2, 6, 'Computer Technician'),
(3, 6, 'Mobile Device Technician'),
(4, 2, 'Motorcycle Technician'),
(5, 4, 'Furniture Maker'),
(6, 2, 'Car Technician'),
(7, 3, 'House Cleaner'),
(9, 3, 'Commercial Cleaning'),
(10, 6, 'Audio-visual Technician'),
(11, 6, 'Smart Home Technician'),
(13, 4, 'Plumber'),
(14, 3, 'All around Cleaner'),
(16, 5, 'Electrician'),
(23, 9, 'Haircut and Styling'),
(24, 4, 'Home Renovation'),
(25, 6, 'Home Theater Installation'),
(32, 9, 'Nail Artist'),
(33, 9, 'Massage Therapy'),
(37, 6, 'Mobile Device Repair'),
(40, 9, 'Personal Training'),
(42, 6, 'Security System Installation'),
(43, 9, 'Skincare and Facials'),
(45, 2, 'Bicycle Technician');

-- --------------------------------------------------------

--
-- Table structure for table `specific_services`
--

CREATE TABLE `specific_services` (
  `id` int(11) NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `specific_service` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specific_services`
--

INSERT INTO `specific_services` (`id`, `worker_id`, `specific_service`, `description`, `price`, `duration`) VALUES
(1, 1, 'Bedroom Renovation', 'Assisting you in personalizing your bedroom. I can do carpentry, move heavy furnitures, and more.', '550.00', 480),
(2, 2, 'Smart Home Installation', 'Everything about smart home devices, I can setup. Pricing does not include the devices.', '750.00', 480),
(3, 3, 'Haircut and Styling', 'Your all-around hair stylist', '900.00', 420),
(4, 4, 'Electrical Wiring Repair', 'Safe electrical wiring setup and repair for your home', '600.00', 480),
(5, 5, 'Audio-Visual System Setup', 'Speakers, camera, name anything about audio and visual technicalities, I can handle.', '500.00', 360),
(6, 6, 'Sound proof Installation', 'Making your room soundproof', '700.00', 300),
(7, 7, 'CCTV Installation', 'Let\'s install CCTV for your home', '450.00', 480),
(8, 8, 'Android LCD Repair', 'Repair and change LCD screens of Android. Price does not cover the LCD screen itself.', '200.00', 30),
(9, 1, 'Living Room Renovation', 'Let\'s do your living room renovation together', '450.00', 300),
(10, 1, 'Garden Renovation', 'Gate, cement, gardening, I can renovate.', '650.00', 480),
(11, 2, 'Smart Speaker Installation', 'Let\'s setup your smark speakerrs with your phone either Anroid or iOS.', '300.00', 120),
(13, 13, 'Head Massage', 'Head massage anywhere as long as there\'s a chair', '150.00', 30),
(14, 14, 'Full-body massage', 'For relaxation and refreshment', '300.00', 60),
(15, 15, 'Gym Instructor', '10-session training with 2 hours per session for you to get used to being physically fit at home', '5000.00', 1200),
(16, 20, 'Full-body massage', 'Gentle, and caring massage therapist.', '2000.00', 60);

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'edrian', '$2y$12$cej7HPm9q9aqtMk.F.gGs.6C8p77JFNwp5jjumWm1kJNqFMsDUlpS'),
(2, 'remie', '$2y$12$CNXEYTaj4mhrkdbzqZr5peKUJ3zh23gHKIPVNd3rGCndmGgq.6/Ga'),
(3, 'emmanuel', '$2y$12$v2DcppTyZdpn7D2u1DsovuMhp8QKu72FMui642Jcwn8aZ/TG0xBmq'),
(4, 'anthony', '$2y$12$NT.3.uDuGp0SJcS0uTEs4ushh0BFtiVrvOel4.dlJge3eaSxmT0Ge'),
(5, 'sean', '$2y$12$qry29ptWlLqq64XH0IveVucUvIkGrV.ywN/yPLRPGqNpvNVHHBzu2'),
(6, 'cruz', '$2y$12$mexxIO8Qx2aRcIJMtpZz6eOppseB1A6erH0ddG0lQ77Ce6...LX0K'),
(7, 'kiel', '$2y$12$QbD8sVDBYi8lvhqbagQ.8uUoy1JQDB62yYZ6iRY4BcP/r59CMGyA2'),
(8, 'joseph', '$2y$12$NSF.OnO5cogQf3pviCSdEetlXfMua2Trcg2iviDMruCI1QxHOFjH6'),
(9, 'francis', '$2y$12$dDry9xdljwlZrV2hDfT8Ku/k2FcjWEIBjMIe/CmjIB5zRu3PpoWtG'),
(10, 'zeus', '$2y$12$yzm3e5HvyPIE4j5LP9LVPuPb0PrmjSgtz9Vc4u1PHaSyBbCw.Ydb.'),
(13, 'jm', '$2y$12$Di3pPd.lMvu5h8QFjA.7Z.g4svD3LSXQCRY8AJEMxBFTk8hEN.xLm'),
(14, 'james', '$2y$12$YOEbNStDbXK/TXgdEnY5SuFAE59ngZRLMSBgUl7Bj.2RLrjewlY2m'),
(19, 'paolo', '$2y$12$WJJlrSEzC0Lo.00LaUyo/eBzEbSfYGx.vDla4OEde/kpcigNsaChK'),
(20, 'josephine', '$2y$12$PIhyV8rkeArlFGagJY0voOJzD9rU3BawlsBRtV3NmXdx4g.k8hf.e'),
(21, 'cyrilvincentsarmiento@gmail.com', '$2y$12$M47Ybb.74tZR3XcnG2jqSecFrMz8k2kn/1a9AHQwBohtmQo7IaFY6'),
(22, 'edrianvdr', '$2y$12$sdLgeLAIH8MaboSYX6GoY.4He8jO62lPdYZokppNwbqEAtM0P6AFe');

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `suffix` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender_id` int(11) DEFAULT NULL,
  `marital_status_id` int(11) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `valid_id` varchar(255) DEFAULT NULL,
  `selfie_with_valid_id` varchar(255) DEFAULT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL,
  `is_verified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `user_id`, `first_name`, `middle_name`, `last_name`, `suffix`, `birthdate`, `gender_id`, `marital_status_id`, `email_address`, `mobile_number`, `profile_picture`, `role_id`, `valid_id`, `selfie_with_valid_id`, `submitted_at`, `verified_at`, `is_verified`) VALUES
(1, 1, 'Edrian', 'Villados', 'Delos Reyes', '', '1999-02-25', 2, 1, 'edrianvdr21@gmail.com', '9292259697', 'profile_pictures/Default Profile Picture.png', 1, NULL, NULL, NULL, NULL, NULL),
(2, 2, 'Remie', 'Cruz', 'De Leon', 'Jr.', '2000-10-17', 3, 2, 'remie@gmail.com', '9282452425', 'profile_pictures/PhthAUPiYhebxUJIVe9uoGCBBWGv3ouc7QGZ3Siq.png', 3, NULL, NULL, NULL, NULL, NULL),
(3, 3, 'Emmanuel', 'King', 'Elmido', NULL, '1998-07-08', 2, 3, 'emmanuel@gmail.com', '9141141516', 'profile_pictures/goqzLHPAxGFQna6ZJmHcIuvRldJ1tlrYb20ndIG0.png', 3, 'valid_ids/iNuf8xUxcjza63P4EvKRf2wk3syGa24Sb0PqOZ1o.png', 'selfie_with_valid_ids/TJashqP13D8pq3eRL3S9dK5AJeN30r4svixSkCaB.jpg', '2024-06-21 16:10:06', NULL, 0),
(4, 4, 'Anthony', NULL, 'Sacueza', 'Sr.', '2001-06-12', 2, 4, 'anthony@gmail.com', '9142251415', 'profile_pictures/kSmRZZJm4Ii7vtqnRvZQECsAc6MNlUIEWKqweZZX.png', 3, NULL, NULL, NULL, NULL, NULL),
(5, 5, 'Sean', NULL, 'Bagalacsa', NULL, '1989-07-11', 2, 5, 'sean@gmail.com', '9787754849', 'profile_pictures/hYiEhePl05kevxxU3ihxGlXM3vq9QU9str1Dtumh.png', 3, NULL, NULL, NULL, NULL, NULL),
(6, 6, 'Mark', 'Salamat', 'Cruz', NULL, '1992-05-06', 2, 1, 'mark@gmail.com', '9457784512', 'profile_pictures/Default Profile Picture.png', 3, NULL, NULL, NULL, NULL, NULL),
(7, 7, 'Kiel', 'Ponce', 'Chu', NULL, '1998-11-26', 2, 2, 'kiel@gmail.com', '9789989596', 'profile_pictures/7wDr7k2Iluhz2Sx89Va6GfWL94JAICGDDTNsZObC.png', 3, 'valid_ids/Oivd8ytFLJ9k78KGQQwvUTPQcTv65yQKCVULW6HS.png', 'selfie_with_valid_ids/NIIBHT7j9BUJpA3EH0cygDdKR9kfNlXk3Fh1sypK.jpg', '2024-06-21 17:20:26', NULL, 0),
(8, 8, 'Joseph', 'Concepcion', 'Cortez', NULL, '1998-12-17', 2, 2, 'joseph@gmail.com', '9121151415', 'profile_pictures/Default Profile Picture.png', 3, NULL, NULL, NULL, NULL, NULL),
(9, 9, 'Francis', 'Rubio', 'Dimasin', NULL, '1997-06-24', 2, 1, 'francis@gmail.com', '9787475744', 'profile_pictures/Default Profile Picture.png', 3, NULL, NULL, NULL, NULL, NULL),
(10, 10, 'Zeus', 'Sanchez', 'Belmonte', NULL, '1996-12-04', 2, 3, 'zeus@gmail.com', '9895596968', 'profile_pictures/ky1FW7z5bNGqPvOrxs3MxnFNKEPSli9tmzDZ81GF.png', 2, NULL, NULL, NULL, NULL, NULL),
(11, 13, 'JM', 'Nicolas', 'Manongsong', NULL, '1977-10-27', 2, 2, 'jm@gmail.com', '9487757478', 'profile_pictures/Default Profile Picture.png', 2, NULL, NULL, NULL, NULL, NULL),
(12, 14, 'James', 'Raza', 'Jimena', NULL, '1999-02-04', 2, 1, 'james@gmail.com', '9595585758', 'profile_pictures/Default Profile Picture.png', 3, NULL, NULL, NULL, NULL, NULL),
(17, 19, 'Paolo', '', 'Sales', NULL, '1997-07-28', 2, 4, 'paolo@gmail.com', '9484251156', 'profile_pictures/Default Profile Picture.png', 3, NULL, NULL, NULL, NULL, NULL),
(18, 20, 'Josephine', 'Sales', 'Carillaga', '', '1980-11-04', 1, 2, 'josephine@gmail.com', '9718817181', 'profile_pictures/Default Profile Picture.png', 3, NULL, NULL, NULL, NULL, 1),
(19, 21, 'Cyril Vincent', 'Delos Reyes ', 'Sarmiento', '', '2010-02-25', 2, 1, 'cyrilvincentsarmiento@gmail.com', '9458344274', 'profile_pictures/Default Profile Picture.png', 3, NULL, NULL, NULL, NULL, NULL),
(20, 22, 'Edrian', 'Villados', 'Delos Reyes', '', '1999-10-21', 2, 1, 'edrianvdr@gmail.com', '9292259697', 'profile_pictures/5dYuXi6IT5Uj1UEZLz0VctNVp9Je0XM9kEWPYs24.jpg', 2, 'valid_ids/RbKCjSeHvXiuJNklDaDrJ1CVmZ99VDsma1RGkbM7.png', 'selfie_with_valid_ids/JLsHxdUeE7R0bd6NCjZliWtyQD11rbXNqmJz9shd.jpg', '2024-06-21 17:59:45', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `worker_profiles`
--

CREATE TABLE `worker_profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `working_days` varchar(255) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `valid_id` int(11) DEFAULT NULL,
  `resume` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `worker_profiles`
--

INSERT INTO `worker_profiles` (`id`, `user_id`, `category_id`, `service_id`, `working_days`, `start_time`, `end_time`, `valid_id`, `resume`, `status`) VALUES
(1, 2, 4, 24, '1,1,1,0,0,0,0', '06:00:00', '18:00:00', NULL, NULL, 1),
(2, 3, 6, 11, '1,0,0,0,0,0,1', '08:00:00', '17:00:00', NULL, NULL, 1),
(3, 4, 9, 23, '1,1,1,1,1,1,1', '04:00:00', '22:00:00', NULL, NULL, 1),
(4, 5, 5, 16, '0,1,1,1,1,1,0', '09:00:00', '18:00:00', NULL, NULL, 1),
(5, 6, 6, 10, '1,1,1,1,1,1,1', '00:00:00', '23:59:00', NULL, NULL, 1),
(6, 7, 6, 25, '0,1,0,1,0,1,0', '06:00:00', '20:00:00', NULL, NULL, 1),
(7, 8, 6, 42, '1,1,1,1,1,1,1', '08:00:00', '21:00:00', NULL, NULL, 1),
(8, 9, 6, 37, '1,0,0,0,0,0,1', '06:00:00', '18:00:00', NULL, NULL, 1),
(13, 19, 9, 33, '1,1,1,1,1,1,1', '08:00:00', '20:00:00', NULL, NULL, 1),
(14, 20, 9, 33, '1,0,0,0,0,0,1', '06:00:00', '22:00:00', NULL, NULL, 1),
(15, 14, 9, 40, '1,1,1,1,1,1,1', '08:00:00', '18:00:00', NULL, NULL, 1),
(20, 21, 3, 14, '0,0,0,0,0,0,1', '08:00:00', '00:00:00', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `worker_profile_views`
--

CREATE TABLE `worker_profile_views` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `viewed_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `worker_profile_views`
--

INSERT INTO `worker_profile_views` (`id`, `user_id`, `worker_id`, `category_id`, `service_id`, `viewed_at`) VALUES
(7, 3, 6, 6, 25, '2024-05-23 19:53:51'),
(8, 3, 1, 4, 24, '2024-05-23 20:00:58'),
(9, 3, 2, 6, 11, '2024-05-23 20:02:04'),
(10, 3, 3, 9, 23, '2024-05-23 20:02:42'),
(11, 3, 4, 5, 16, '2024-05-23 20:02:43'),
(12, 2, 2, 6, 11, '2024-05-27 15:25:39'),
(13, 3, 5, 6, 10, '2024-05-27 16:29:07'),
(14, 7, 1, 4, 24, '2024-05-27 16:30:09'),
(15, 7, 2, 6, 11, '2024-05-27 16:30:16'),
(16, 7, 6, 6, 25, '2024-05-27 16:30:19'),
(17, 7, 5, 6, 10, '2024-05-27 16:31:27'),
(18, 3, 5, 6, 10, '2024-05-27 18:53:53'),
(19, 3, 5, 6, 10, '2024-05-27 19:25:36'),
(20, 3, 5, 6, 10, '2024-05-27 21:06:24'),
(21, 3, 2, 6, 11, '2024-05-31 21:44:53'),
(22, 3, 5, 6, 10, '2024-05-31 23:16:20'),
(23, 3, 2, 6, 11, '2024-05-31 23:16:23'),
(24, 3, 2, 6, 11, '2024-05-31 23:33:11'),
(25, 3, 5, 6, 10, '2024-05-31 23:36:39'),
(26, 3, 1, 4, 24, '2024-05-31 23:58:13'),
(27, 3, 1, 4, 24, '2024-06-01 01:01:23'),
(28, 3, 1, 4, 24, '2024-06-01 01:22:33'),
(29, 2, 1, 4, 24, '2024-06-01 01:48:35'),
(30, 2, 5, 6, 10, '2024-06-01 02:16:11'),
(31, 3, 1, 4, 24, '2024-06-01 14:04:31'),
(32, 3, 2, 6, 11, '2024-06-01 22:08:24'),
(33, 3, 1, 4, 24, '2024-06-04 16:49:04'),
(34, 3, 2, 6, 11, '2024-06-04 17:33:05'),
(35, 21, 15, 9, 40, '2024-06-06 23:35:29'),
(36, 21, 20, 3, 14, '2024-06-06 23:47:49'),
(37, 14, 15, 9, 40, '2024-06-06 23:56:12'),
(38, 3, 2, 6, 11, '2024-06-07 18:02:04'),
(39, 3, 2, 6, 11, '2024-06-07 18:19:21'),
(40, 2, 2, 6, 11, '2024-06-13 21:14:33'),
(41, 3, 2, 6, 11, '2024-06-21 16:59:20'),
(42, 3, 6, 6, 25, '2024-06-21 16:59:23'),
(48, 3, 1, 4, 24, '2024-06-22 21:46:12'),
(49, 3, 6, 6, 25, '2024-06-22 21:46:17'),
(50, 22, 2, 6, 11, '2024-06-22 21:46:39'),
(51, 3, 2, 6, 11, '2024-06-22 22:18:43'),
(52, 3, 1, 4, 24, '2024-06-22 22:18:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `region_id` (`region_id`),
  ADD KEY `province_id` (`province_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `worker_id` (`worker_id`),
  ADD KEY `fk_bookings_specific_service` (`specific_service_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`),
  ADD KEY `province_id` (`province_id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `worker_id` (`worker_id`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marital_statuses`
--
ALTER TABLE `marital_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `specific_services`
--
ALTER TABLE `specific_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `worker_id` (`worker_id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `gender_id` (`gender_id`),
  ADD KEY `marital_status_id` (`marital_status_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `worker_profiles`
--
ALTER TABLE `worker_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `valid_id` (`valid_id`),
  ADD KEY `resume` (`resume`);

--
-- Indexes for table `worker_profile_views`
--
ALTER TABLE `worker_profile_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `worker_id` (`worker_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `service_id` (`service_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1661;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `marital_statuses`
--
ALTER TABLE `marital_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `specific_services`
--
ALTER TABLE `specific_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `worker_profiles`
--
ALTER TABLE `worker_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `worker_profile_views`
--
ALTER TABLE `worker_profile_views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `addresses_ibfk_2` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`),
  ADD CONSTRAINT `addresses_ibfk_3` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`),
  ADD CONSTRAINT `addresses_ibfk_4` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`worker_id`) REFERENCES `worker_profiles` (`id`),
  ADD CONSTRAINT `fk_bookings_specific_service` FOREIGN KEY (`specific_service_id`) REFERENCES `specific_services` (`id`);

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`),
  ADD CONSTRAINT `cities_ibfk_2` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`);

--
-- Constraints for table `commissions`
--
ALTER TABLE `commissions`
  ADD CONSTRAINT `commissions_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `worker_profiles` (`id`);

--
-- Constraints for table `provinces`
--
ALTER TABLE `provinces`
  ADD CONSTRAINT `provinces_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`);

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `specific_services`
--
ALTER TABLE `specific_services`
  ADD CONSTRAINT `specific_services_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `worker_profiles` (`id`);

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_profiles_ibfk_2` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`),
  ADD CONSTRAINT `user_profiles_ibfk_3` FOREIGN KEY (`marital_status_id`) REFERENCES `marital_statuses` (`id`),
  ADD CONSTRAINT `user_profiles_ibfk_4` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `worker_profiles`
--
ALTER TABLE `worker_profiles`
  ADD CONSTRAINT `worker_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `worker_profiles_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `worker_profiles_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `worker_profiles_ibfk_4` FOREIGN KEY (`valid_id`) REFERENCES `uploads` (`id`),
  ADD CONSTRAINT `worker_profiles_ibfk_5` FOREIGN KEY (`resume`) REFERENCES `uploads` (`id`);

--
-- Constraints for table `worker_profile_views`
--
ALTER TABLE `worker_profile_views`
  ADD CONSTRAINT `worker_profile_views_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `worker_profile_views_ibfk_2` FOREIGN KEY (`worker_id`) REFERENCES `worker_profiles` (`id`),
  ADD CONSTRAINT `worker_profile_views_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `worker_profile_views_ibfk_4` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
