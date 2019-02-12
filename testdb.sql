-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2019 at 06:46 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `parkinglots`
--

CREATE TABLE `parkinglots` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `calle1` varchar(255) NOT NULL,
  `calle2` varchar(255) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `costo` double NOT NULL,
  `techo` varchar(50) NOT NULL,
  `horaApertura` varchar(5) NOT NULL,
  `horaCierre` varchar(5) NOT NULL,
  `Funcionamiento` varchar(255) NOT NULL,
  `Coordenadas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parkinglots`
--

INSERT INTO `parkinglots` (`id`, `nombre`, `calle1`, `calle2`, `capacidad`, `costo`, `techo`, `horaApertura`, `horaCierre`, `Funcionamiento`, `Coordenadas`) VALUES
(1, 'Universitaria', 'Universitaria', 'Mercadillo', 10, 0.5, 'si', '8h00', '22h00', 'Monday to Saturday', '-4,0008028, -79,2043612'),
(2, 'Patu-Cell Parqueadero', 'Universitaria', 'Mercadillo', 20, 0.5, 'no', '8h00', '22h00', 'Monday to Saturday', '-4,0009258, -79,2044587'),
(3, 'los Reyes', 'Universitaria', 'Azuay', 45, 0.4, 'si', '8h00', '22h00', 'Monday to Saturday', '-4,0010322, -79,2043119'),
(4, 'Lourdes', 'Universitaria', 'Lourdes', 24, 0.4, 'no', '6h00', '22h00', 'Monday to Saturday', '-4,0018443, -79,2044581'),
(5, 'Parqueadero privado', '18 of November', 'Lourdes', 14, 0.5, 'no', '6h00', '6h00', 'Monday to Saturday', '-4,0020326, -79,2034623'),
(6, 'Mercadillo', 'Mercadillo', '18 de Noviembre', 18, 0.5, 'no', '7h00', '21h30', 'Monday to Saturday', '-4,0014670, -79,2033899'),
(7, 'M & S', 'Mercadillo', 'Sucre', 6, 0.5, 'no', '8h30', '21h00', 'Monday to Friday', '-4,0014078, -79,2031180'),
(8, 'San Sebastiá', 'Bolivar', 'Mercadillo', 24, 0.5, 'si', '6h00', '22h00', 'Monday to Saturday', '-4,0020148, -79,2016639'),
(9, 'San Francisco', 'Bolivar', 'Mercadillo', 25, 0.5, 'no', '7h30', '21h00', 'Monday to Saturday', '-4.000935, -79.201820'),
(10, 'Kiaby Club', 'Bolivar', 'Mercadillo', 14, 0.5, 'si', '6h00', '22h00', 'Monday to Saturday', '-4.000753, -79.201820'),
(11, 'Azuay', 'Azuay', 'Bolivar', 30, 0.5, 'si', '8h00', '21h00', 'Monday to Saturday', '-4.000338, -79.201388'),
(12, 'B & A', 'Bernardo', 'Azuay', 14, 0.5, 'no', '8h00', '23h00', 'Monday to Saturday', '-3,9998579, -79,2009638'),
(13, 'J & C', 'Bernardo', 'Miguel Riofrío', 29, 0.75, 'no', '7h30', '20h00', 'Monday to Saturday', '-3,9985097, -79,2010949'),
(14, 'GC', 'Miguel Riofrío', 'Olmedo', 20, 0.75, 'si', '8h00', '19h00', 'Monday to Friday', '-3,9991870, -79,2003918'),
(15, 'Bolívar', 'Bolivar', 'Azuay', 28, 0.75, 'si', '7h00', '20h00', 'Monday to Saturday', '-4,0003486, -79,2021933'),
(16, 'Village', 'Azuay', 'Sucre', 30, 0.5, 'no', '7h30', '20h30', 'Monday to Saturday', '-4,0003439, -79,2025738'),
(17, 'Sucre', 'Sucre', 'Azuay', 20, 0.6, 'no', '8h00', '20h30', 'Monday to Saturday', '-4,0006272, -79,2028588'),
(18, 'Parqueadero Médic', 'Sucre', 'Miguel Riofrío', 20, 0.5, 'no', '7h00', '19h00', 'Monday to Saturday', '-3.999886, -79.202820'),
(19, 'Bachita', 'Universitaria', 'Miguel Riofrío', 35, 0.5, 'si', '6h30', '22h00', 'Monday to Sunday', '-3,9998368, -79,2047236'),
(20, 'Status', 'Miguel Riofrío', 'Sucre', 12, 0.5, 'si', '8h00', '19h00', 'Monday to Friday', '-3,9993231, -79,2026322'),
(21, 'Don Daniel', 'Miguel Riofrío', 'Sucre', 25, 0.5, 'si', '7h45', '19h15', 'Monday to Saturday', '-3,9992355, -79,2022781'),
(22, 'San Francisco', 'Sucre', 'Miguel Riofrío', 17, 0.5, 'no', '7h00', '21h00', 'Monday to Saturday', '-3,9990469, -79,2029513'),
(23, 'Parqueadero Municipal Sur', 'Rocafuerte', '18 de Noviembre', 34, 0.75, 'si', '6h00', '22h00', 'Monday to Saturday', '-3,9983545, -79,2042921'),
(24, 'Parqueadero Municipal Norte', '10 de Agosto', '18 de Noviembre', 130, 0.75, 'si', '6h00', '22h00', 'Monday to Saturday', '-3,9973705, -79,2047283'),
(25, 'Miguel Riofrío', 'Miguel Riofrío', 'Lauro Guerrero', 28, 0.5, 'no', '8h00', '19h00', 'Monday to Saturday', '-3,9996081, -79,2055246');

-- --------------------------------------------------------

--
-- Table structure for table `parks`
--

CREATE TABLE `parks` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `website` varchar(255) NOT NULL,
  `parking` varchar(3) NOT NULL,
  `disabilityaccess` varchar(3) NOT NULL,
  `playground` varchar(3) NOT NULL,
  `adultexercise` varchar(3) NOT NULL,
  `rosegarden` varchar(3) NOT NULL,
  `cycletrack` varchar(3) NOT NULL,
  `fishery` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parks`
--

INSERT INTO `parks` (`id`, `name`, `address`, `telephone`, `website`, `parking`, `disabilityaccess`, `playground`, `adultexercise`, `rosegarden`, `cycletrack`, `fishery`) VALUES
(1, 'Rathcoole Park', 'Rathcoole, Co. Dublin ', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'No'),
(2, 'Elkwood Open Space ', 'Knocklyon, Dublin 16 ', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(3, 'The Green Boden Park', ' Rathfarnham, Dublin 14', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(4, 'Beechdale Estate Open Space', ' Firhouse, Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(5, 'Quarryvale Park ', 'Clondalkin, Dublin 22', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'No', 'No'),
(6, 'Killinarden Park', 'Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'Yes', 'No', 'No', 'No', 'No'),
(7, 'Collinstown Park', 'Clondalkin, Dublin 22', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(8, 'Saint Cutbert\'s Park', 'Clondalkin, Dublin 22', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(9, 'Sean Walsh Park', 'Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'No'),
(10, 'Waterstown Park', 'Palmerstown, Dublin 20', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'No'),
(11, 'Ballycragh Park', 'Firhouse, Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'Yes', 'No', 'No', 'No', 'No'),
(12, 'Hermitage Park', 'Lucan, Co. Dublin ', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'No', 'No'),
(13, 'Lucan Weir Open Space', 'Lucan, Co. Dublin ', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(14, 'Willsbrook Park ', 'Lucan, Co. Dublin', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(15, 'Corkagh Park', 'Clondalkin, Dublin 22', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
(16, 'Tymon Park East', 'Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'No', 'Yes', 'No', 'No', 'No'),
(17, 'Tymon Park West', 'Templeogue', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'No'),
(18, 'Griffeen Valley Park', 'Lucan, Co. Dublin', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'No', 'No'),
(19, 'Knocklyon Park', 'Ballycullen, Knocklyon, Dublin 16', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(20, 'Glenlyon Park', 'Knocklyon, Dublin 16 ', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(21, 'Firhouse Community Centre Open Space', ' Firhouse, Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(22, 'Dodder Valley Park Firhouse ', 'Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'Yes', 'No'),
(23, 'Dodder Valley Park Cherryfield', 'Templeogue', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'No', 'No', 'No', 'Yes', 'No'),
(24, ' Clondalkin Park', ' Clondalkin, Dublin 22', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'Yes', 'No', 'No', 'No', 'No'),
(25, 'Fettercairn Park', 'Fettercairn, Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(26, 'Old Bawn Park Brady\'s Field', 'Oldbawn, Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(27, 'Aylesbury Park', 'Aylesbury, Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'Yes', 'No', 'No', 'No', 'No'),
(28, 'Dodder Valley Park Kilvere', 'Rathfarnham, Dublin 14', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(29, 'Ballymount Park', 'Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'No', 'Yes', 'No', 'No', ''),
(30, 'Woodlawn Park', ' Firhouse, Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(31, 'Glenaulin Park', 'Palmerstown, Dublin 20', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(32, 'Greenhills Park', 'Greenhills, Walkinstown. Dublin 12', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'No', 'Yes', 'No', 'No', 'No'),
(33, 'Beechfield Park', 'Walkinstown, Dublin 12', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'Yes', 'Yes', 'No', 'No', 'No'),
(34, 'Kennedy\'s Field Open Space', 'Templeogue', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(35, 'Ballyowen Park', 'Clondalkin, Dublin 22', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'Yes', 'No', 'No', 'No', 'No'),
(36, 'Kiltalown Park', 'Jobstown, Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'Yes', 'No', 'No', 'No', 'No'),
(37, 'Bancroft Park', 'Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(38, 'Liffey Valley Park Mill Lane', 'Palmerstown, Dublin 20', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(39, 'Kilnamanagh Park', 'Tallaght, Dublin 24 ', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(40, 'Rathfarnham Castle Park', 'Rathfarnham, Dublin 14', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'Yes', 'No', 'No', 'No', 'No'),
(41, ' Griffeen Valley Park', ' Lucan, Co. Dublin', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(42, 'Griffeen Valley Park Running Park', 'Lucan, Co. Dublin', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(43, 'Letts Field Open Space ', 'Clondalkin, Dublin 22 ', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(44, 'Clondalkin Skate Park', 'Old Nangor Rd, Clondalkin, Dublin 22', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(45, 'Delaford Open Space ', 'Knocklyon, Co Dublin', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(46, 'Tymon Open Space', 'Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(47, 'Allenton Open Space', 'Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(48, 'Castle Estate Open Space', 'Clondalkin, Dublin 22 ', '01-4149000', 'www.sdcc..ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(49, 'Dodsboro Open Space ', ' Lucan, Co. Dublin', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(50, 'Ashwood Open Space ', ' Clondalkin, Dublin 22', '01-419000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(51, 'Glendown Open Space', 'Templeogue, Dublin 6w', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'Yes', 'No', 'No', 'No'),
(52, ' Lucan Village Park', ' Lucan, Co. Dublin', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(53, 'Firhouse Village Park', 'Firhouse, Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(54, 'Beech Park Open Space ', 'Lucan, Co. Dublin', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(55, 'Kiltipper Park ', 'Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'Yes', ''),
(56, 'Tallaght Stadium ', 'Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'No', 'No', 'No', 'No', ''),
(57, 'Dodder Valley Park Oldbawn', 'Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'Yes', 'No'),
(58, 'Glendoher Park ', 'Rathfarnham, Dublin 16', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(59, 'Camac Valley Caravan Park', 'Clondalkin, Dublin 22 ', '01-4640644', 'www.sdcc.ie', 'Yes', 'Yes', 'Yes', 'No', 'No', 'No', 'No'),
(60, 'Greentrees Park Eight Acres', 'Walkinstown, Dublin 12', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(61, 'Greentrees Park Five Acres ', 'Walkinstown, Dublin 12', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(62, 'Whitechurch Open Space', 'Rathfarnham, Dublin 16', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(63, 'Yellow Meadow/Monksfield Open Space', 'Clondalkin, Dublin 22', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(64, 'Kingswood Open Space', 'Tallaght, Dublin 24', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'Yes', 'No', 'No', 'No'),
(65, 'Hillcrest Open Space ', 'Lucan, Co. Dublin ', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(66, 'Vessy Park', 'Lucan, Co. Dublin', '01-4149000', 'www.sdcc.ie', 'No', 'Yes', 'No', 'No', 'No', 'No', ''),
(67, ' Griffeen Valley Skate Park', ' Lucan, Co.Dublin', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(68, 'Glenshane Skate Park', 'Glenshane, Tallaght, Dublin 24 ', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'No', 'No', 'No', 'No', 'No'),
(69, ' Lucan Demese', ' Lucan, Co.Dublin', '01-4149000', 'www.sdcc.ie', 'Yes', 'Yes', 'No', 'No', 'No', 'No', 'No');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `parkinglots`
--
ALTER TABLE `parkinglots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parks`
--
ALTER TABLE `parks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `parkinglots`
--
ALTER TABLE `parkinglots`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `parks`
--
ALTER TABLE `parks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
