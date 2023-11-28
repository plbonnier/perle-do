-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 21 nov. 2023 à 15:55
-- Version du serveur : 8.0.34
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `perle_do`
--

DROP DATABASE IF EXISTS `perle_do`;
CREATE DATABASE IF NOT EXISTS `perle_do`;
USE `perle_do`; 

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `picture`) VALUES
(1, 'BRACELET', NULL),
(2, 'COLLIER', NULL),
(3, 'PENDENTIF', NULL),
(4, 'LAMPE', NULL),
(5, 'BOUGEOIR', NULL),
(6, 'ANIMAUX', NULL),
(7, 'OEUF / BOULE', NULL),
(8, 'PIERRES ROULÉES', NULL),
(9, 'ARBRE DE VIE', NULL),
(10, 'BOUGIE', NULL),
(11, 'DECO', NULL),
(12, 'MINERAUX', NULL),
(13, 'FOSSILE', NULL),
(14, 'POINTE', NULL),
(15, 'AGATE TRANCHE', NULL),
(16, 'SELENITE', NULL),
(17, 'GÉODE', NULL),
(18, 'JEUX', NULL),
(19, 'BOIS', NULL),
(20, 'PIERRES POLIES', NULL),
(21, 'AUTRES', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` date NOT NULL,
  `civility` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lastname` varchar(100) NOT NULL,
  `firstname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `reference` int NOT NULL,
  `adress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `zipcode` mediumint DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_type` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_type` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `customer_workshop`
--

DROP TABLE IF EXISTS `customer_workshop`;
CREATE TABLE IF NOT EXISTS `customer_workshop` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_customer` int NOT NULL,
  `id_workshop` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_customer` (`id_customer`),
  KEY `id_workshop` (`id_workshop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num_invoice` int NOT NULL,
  `date` date NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `discount` float(5,2) NOT NULL,
  `payment_type_id` int NOT NULL,
  `id_customer` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_customer` (`id_customer`),
  KEY `payment_type_id` (`payment_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `invoice_workshop`
--

DROP TABLE IF EXISTS `invoice_workshop`;
CREATE TABLE IF NOT EXISTS `invoice_workshop` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_invoice` int NOT NULL,
  `id_workshop` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id_invoice`,`id_workshop`),
  KEY `id_workshop` (`id_workshop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `material`
--

DROP TABLE IF EXISTS `material`;
CREATE TABLE IF NOT EXISTS `material` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `material`
--

INSERT INTO `material` (`id`, `name`) VALUES
(1, 'UNAKITE'),
(2, 'LABRADORITE'),
(3, 'CALCITE'),
(4, 'MALACHITE'),
(5, 'OEIL DE TIGRE'),
(6, 'ONYX'),
(7, 'AMETHYSTE'),
(8, 'ANGELITE'),
(9, 'QUARTZ ROSE'),
(10, 'TOURMALINE NOIRE'),
(11, 'LAPIS LAZULI'),
(12, 'CRISTAL DE ROCHE'),
(13, 'AGATE'),
(14, 'AGATE DU BOTSWANA'),
(15, 'JADE SERPENTINE'),
(16, 'RHODONITE'),
(17, 'AMETHYSTE ZONEE'),
(18, 'AVENTURINE VERTE'),
(19, 'JASPE'),
(20, 'DUMORTIERITE'),
(21, 'HOWLITE'),
(22, 'OBSIDIENNE DES NEIGES'),
(23, 'OPALE'),
(24, 'HEMATITE'),
(25, 'QUARTZ'),
(26, 'PIERRE DE LUNE'),
(27, 'CHRYSOCOLLE'),
(28, 'OEIL DE LUCIE'),
(29, 'FELDSPATH'),
(32, 'AUTRES');

-- --------------------------------------------------------

--
-- Structure de la table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
CREATE TABLE IF NOT EXISTS `payment_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `payment_type`
--

INSERT INTO `payment_type` (`id`, `name`) VALUES
(1, 'Carte Bancaire'),
(2, 'AMEX'),
(3, 'Chèque'),
(4, 'Virement'),
(5, 'Espèces'),
(6, 'Offert');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `reference` int NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `origin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `quantity` int NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_category` int NOT NULL,
  `id_material` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id_category`,`id_material`),
  KEY `id_material` (`id_material`)
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `reference`, `price`, `description`, `origin`, `quantity`, `picture`, `id_category`, `id_material`) VALUES
(1, 'LABRADORITE', '0001', '80.00', '869g', NULL, 2, NULL, 20, 2),
(2, 'LABRADORITE', '0002', '42.00', '416g et 417g', NULL, 0, NULL, 20, 2),
(3, 'LABRADORITE', '0003', '38.00', '373g', NULL, 1, NULL, 20, 2),
(4, 'PIERRE DE LUNE', '0004', '50.00', '467g', NULL, 1, NULL, 20, 26),
(5, 'PIERRE DE LUNE', '0005', '72.00', NULL, NULL, 1, NULL, 20, 26),
(6, 'PIERRE DE LUNE ORANGÉE', '0006', '90.00', '933g', NULL, 1, NULL, 20, 26),
(11, 'OPALE', '0007', '60.00', NULL, NULL, 1, NULL, 21, 23),
(12, 'OPALE', '0008', '80.00', NULL, NULL, 1, NULL, 21, 23),
(13, 'OPALE', '0009', '100.00', NULL, NULL, 1, NULL, 21, 23),
(14, 'OPALE', '0010', '120.00', NULL, NULL, 1, NULL, 21, 23),
(15, 'PENDENTIF ROND CHRYSOCOLLE', '0011', '30.00', 'pendentif + bélière + cordon jonc', NULL, 0, NULL, 3, 27),
(16, 'PENDENTIF COEUR OEUIL DE LUCIE', '0012', '33.00', 'pendentif + bélière + cordon jonc', NULL, 1, NULL, 3, 28),
(17, 'PENDENTIF ROND MULTI', '0013', '30.00', 'pendentif + bélière + cordon jonc', NULL, 1, NULL, 3, 19),
(18, 'PENDENTIF ROND OPALE BLEUE', '0014', '30.00', 'pendentif + bélière + cordon jonc', NULL, 1, NULL, 3, 23),
(19, 'PENDENTIF TRIANGLE JASPE K2', '0015', '30.00', 'pendentif + bélière + cordon jonc', NULL, 1, NULL, 3, 19),
(20, 'PENDENTIF MARQUISE FELDSPATH', '0016', '30.00', 'pendentif + bélière + cordon jonc', NULL, 1, NULL, 3, 29),
(21, 'PENDENTIF GOUTTE MOOKAITE', '0017', '30.00', 'pendentif + bélière + cordon jonc', NULL, 1, NULL, 3, 13),
(22, 'PENDENTIF ROND AGATE DENTRITE', '0018', '18.00', 'pendentif + bélière + cordon jonc', NULL, 2, NULL, 3, 13),
(23, 'PENDENTIF ROND OPALE DENTRITE', '0019', '15.00', 'pendentif + bélière + cordon jonc', NULL, 2, NULL, 3, 23),
(24, 'QUARTZ ROSE BRUT', '0020', '2.00', 'lot de 9 minéraux', NULL, 9, NULL, 12, 25),
(25, 'QUARTZ BLANC BRUT', '0021', '2.00', 'lot de 11 minéraux', NULL, 11, NULL, 12, 25),
(26, 'AVENTURINE VERTE', '0022', '2.00', 'lot de 6 minéraux', NULL, 6, NULL, 12, 18),
(27, 'JASPE ZEBRE', '0023', '2.00', 'lot de 3 minéraux', NULL, 3, NULL, 12, 19),
(28, 'LAPIS LAZULI', '0024', '75.00', '646g petit', NULL, 1, NULL, 20, 11),
(29, 'LAPIS LAZULI', '0025', '130.00', '1189g grand', NULL, 1, NULL, 20, 11),
(30, 'SELENITE CASCADE S', '0026', '12.00', 'sélénite cascade S lot de 7', NULL, 8, NULL, 16, 32),
(32, 'SELENITE CASCADE M', '0027', '16.00', 'sélénite cascade M lot de 3', NULL, 1, NULL, 16, 32),
(33, 'SPHERE SELENITE', '0028', '25.00', 'sphère sélénite + 1 support', NULL, 1, NULL, 16, 32),
(34, 'PALET SELENITE METATRON', '0029', '20.00', 'palet sélénite (métatron) lot de 3', NULL, 3, NULL, 16, 32),
(35, 'PALET SELENITE', '0030', '17.00', 'palet sélénite lot de 10', NULL, 10, NULL, 16, 32),
(36, 'BOUGEOIR SELENITE', '0031', '20.00', 'bougeoir sélénite lot de 2', NULL, 2, NULL, 5, 32),
(37, 'POINTE CALCITE', '0032', '22.00', '237g', NULL, 1, NULL, 14, 3),
(38, 'POINTE CALCITE', '0033', '20.00', 'pointe calcite Brésil 218g', NULL, 1, NULL, 14, 3),
(39, 'POINTE CALCITE', '0034', '25.00', 'pointe calcite Brésil 280g', NULL, 1, NULL, 14, 3),
(40, 'POINTE QUARTZ', '0035', '35.00', '347g', NULL, 1, NULL, 14, 25),
(41, 'AMETHYSTE', '0036', '75.00', '991g géode coupé (comptoir)', NULL, 1, NULL, 17, 7),
(42, 'AMETHYSTE', '0037', '40.00', '429g géode coupé (comptoir)', NULL, 1, NULL, 17, 7),
(43, 'AMETHYSTE', '0038', '60.00', '694g géode coupé (comptoir)', NULL, 1, NULL, 17, 7),
(44, 'AMETHYSTE', '0039', '50.00', '495g géode coupé (comptoir)', NULL, 1, NULL, 17, 7),
(45, 'AMETHYSTE', '0040', '48.00', '460g géode coupé (comptoir)', NULL, 1, NULL, 17, 7),
(46, 'AMETHYSTE', '0041', '55.00', '549g géode coupé (comptoir)', NULL, 1, NULL, 17, 7),
(47, 'AMETHYSTE SOCLE', '0042', '15.00', 'petite', NULL, 1, NULL, 17, 7),
(48, 'AMETHYSTE SOCLE', '0043', '25.00', 'grande', NULL, 1, NULL, 17, 7),
(49, 'PLAQUE AMETHYSTE', '0044', '10.00', '79g géode plaque', NULL, 1, NULL, 17, 7),
(50, 'PLAQUE AMETHYSTE', '0045', '15.00', '106g géode plaque', NULL, 1, NULL, 17, 7),
(51, 'PLAQUE AMETHYSTE', '0046', '13.00', '86g géode plaque', NULL, 1, NULL, 17, 7),
(52, 'PLAQUE AMETHYSTE', '0047', '20.00', '123g géode plaque', NULL, 1, NULL, 17, 7),
(53, 'PLAQUE AMETHYSTE', '0048', '20.00', '130g géode plaque', NULL, 1, NULL, 17, 7),
(54, 'PLAQUE AMETHYSTE', '0049', '13.00', '103g géode plaque', NULL, 1, NULL, 17, 7),
(55, 'PLAQUE AMETHYSTE', '0050', '15.00', '114g géode plaque', NULL, 1, NULL, 17, 7),
(56, 'PLAQUE AMETHYSTE', '0051', '15.00', '117g géode plaque', NULL, 1, NULL, 17, 7),
(57, 'SOCLE QUARTZ ROSE', '0052', '12.00', 'socle quartz rose lot de 2', NULL, 1, NULL, 11, 9),
(58, 'SOCLE AVENTURINE VERTE', '0053', '12.00', 'socle aventurine verte lot de 2', NULL, 1, NULL, 11, 18),
(59, 'BOUGEOIR AGATE', '0054', '30.00', 'rose', NULL, 1, NULL, 5, 13),
(60, 'BOUGEOIR AGATE', '0055', '30.00', 'bleu', NULL, 1, NULL, 5, 13),
(61, 'SPHERE QUARTZ ROSE', '0056', '130.00', '1.18Kg + 1 support', NULL, 1, NULL, 7, 9),
(62, 'SPHERE CHRYSOCOLLE', '0057', '90.00', '350g + support', NULL, 1, NULL, 7, 27),
(63, 'SPHERE CHRYSOCOLLE', '0058', '50.00', '190g + support', NULL, 1, NULL, 7, 27),
(64, 'BRACELET PERLE', '0059', '30.00', 'lot de 10', NULL, 1, NULL, 1, 32),
(65, 'BRACELET JADE NEPHRITE', '0060', '30.00', 'lot de 10', NULL, 1, NULL, 1, 15),
(66, 'BRACELET QUARTZ ROSE ENFANT', '0061', '12.00', 'lot de 10', NULL, 1, NULL, 1, 9),
(67, 'BRACELET OEIL DE TIGRE', '0062', '16.00', 'lot de 10 petit', NULL, 1, NULL, 1, 5),
(68, 'BRACELET AMETHYSTE ENFANT', '0063', '13.00', 'lot de 10', NULL, 1, NULL, 1, 7),
(69, 'BRACELET OEIL DE TAUREAU', '0064', '20.00', 'lot de 10', NULL, 1, NULL, 1, 32),
(70, 'BRACELET CALCITE', '0065', '22.00', 'lot de 10', NULL, 1, NULL, 1, 3),
(71, 'BRACELET CORNALINE', '0066', '20.00', 'lot de 10', NULL, 1, NULL, 1, 32),
(72, 'BRACELET OEIL DE TIGRE GROS', '0067', '22.00', 'lot de 10 gros', NULL, 1, NULL, 1, 32),
(73, 'BRACELET QUARTZ ROSE', '0068', '16.00', 'lot de 10', NULL, 1, NULL, 1, 9),
(74, 'BRACELET NACRE', '0069', '25.00', 'lot de 10', NULL, 1, NULL, 1, 32),
(75, 'BRACELET PRENITE - 6mm', '0070', '30.00', 'lot de 10', NULL, 1, NULL, 1, 32),
(76, 'BRACELET TURQUOISE PÉROU', '0071', '48.00', 'lot de 10', NULL, 1, NULL, 1, 32),
(77, 'BRACELET LABRADORITE BLANCHE / PIERRE', '0072', '30.00', 'lot de 10', NULL, 1, NULL, 1, 2),
(78, 'BRACELET AMAZONITE', '0073', '35.00', 'lot de 10', NULL, 1, NULL, 1, 32),
(79, 'COEUR COUPLE', '0074', '30.00', 'bois', NULL, 1, NULL, 19, 32),
(80, 'PLATEAU OM', '0075', '35.00', 'bois', NULL, 1, NULL, 19, 32),
(81, 'BOUDDHA RELAX A GENOU', '0076', '40.00', 'bois', NULL, 1, NULL, 19, 32),
(82, 'PIERRE ROULÉE CHRYSTAL DE ROCHE', '0077', '5.00', 'lot de 63', NULL, 1, NULL, 8, 12),
(83, 'COLLIER CALCITE ORANGE 6mm', '0078', '30.00', NULL, NULL, 1, NULL, 2, 3),
(84, 'PIERRE ROULÉE ONYX', '0079', '5.00', 'lot de 46', NULL, 1, NULL, 8, 6),
(85, 'PIERRE ROULÉE ONYX', '0080', '6.00', 'lot de 10', NULL, 1, NULL, 8, 6),
(86, 'PIERRE ROULÉE OEIL DE TIGRE - S', '0081', '3.00', 'lot de 22', NULL, 1, NULL, 8, 5),
(87, 'PIERRE ROULÉE OEIL DE TIGRE - L', '0082', '5.00', '', NULL, 1, NULL, 8, 5),
(88, 'PIERRE ROULÉE OEIL DE TIGRE -L', '0083', '6.00', 'lot de 11', NULL, 1, NULL, 8, 5),
(89, 'PIERRE ROULÉE OEIL DE TIGRE - L', '0084', '7.00', 'lot de 9', NULL, 1, NULL, 8, 5),
(90, 'BOUGEOIR EN SEL FER FORGÉ', '0085', '30.00', NULL, NULL, 1, NULL, 5, 32),
(91, 'PIERRE ROULÉE AGATE BOTSWANA', '0086', '6.00', 'lot de 45', NULL, 1, NULL, 8, 14),
(92, 'PIERRE ROULÉE AGATE DU BOTSWANA', '0087', '3.00', 'lot de 39', NULL, 1, NULL, 8, 14),
(93, 'PIERRE ROULÉE LABRADORITE', '0088', '10.00', 'lot de 63', NULL, 1, NULL, 8, 2),
(94, 'PIERRE ROULÉE CALCITE', '0089', '6.00', 'lot de 16', NULL, 1, NULL, 8, 3),
(95, 'PIERRE ROULÉE CALCITE', '0090', '5.00', 'lot de 23', NULL, 1, NULL, 8, 3),
(96, 'PIERRE ROULÉE CALCITE', '0091', '3.00', 'lot de 18', NULL, 1, NULL, 8, 3),
(97, 'PIERRE ROULÉE UNAKITE', '0092', '7.00', 'lot de 23', NULL, 1, NULL, 8, 1),
(98, 'PIERRE ROULÉE UNAKITE', '0093', '6.00', 'lot de 26', NULL, 1, NULL, 8, 1),
(99, 'PIERRE ROULÉE UNAKITE', '0094', '4.00', 'lot de 24', NULL, 1, NULL, 8, 1),
(100, 'PIERRE ROULÉE AGATE MARRON', '0095', '4.00', 'lot de 59', NULL, 1, NULL, 8, 13),
(101, 'PIERRE ROULÉE QUARTZ ROSE MADAGASCAR', '0096', '7.00', 'lot de 40', NULL, 1, NULL, 8, 9),
(102, 'PIERRE ROULÉE ANGELITE', '00997', '8.00', 'lot de 14', NULL, 1, NULL, 8, 8),
(103, 'PIERRE ROULÉE TOURMALINE NOIR', '0098', '6.00', 'lot de 35', NULL, 1, NULL, 8, 10),
(104, 'PIERRE ROULÉE TOURMALINE NOIR', '0099', '7.00', 'lot de 12', NULL, 1, NULL, 8, 10),
(105, 'PIERRE ROULÉE LAPIS LAZULI', '0100', '10.00', 'lot de 2', NULL, 1, NULL, 8, 11),
(106, 'PIERRE ROULÉE LAPIS LAZULI', '0101', '7.00', 'lot de 13', NULL, 1, NULL, 8, 11),
(107, 'PIERRE ROULÉE LAPIS LAZULI', '0102', '6.00', 'lot de 2', NULL, 1, NULL, 8, 11),
(108, 'PIERRE ROULÉE LAPIS LAZULI', '0103', '4.00', 'lot de 5', NULL, 1, NULL, 8, 11),
(109, 'TRANCHE D\'AGATE', '0104', '1.00', 'lot de 216', NULL, 211, NULL, 15, 13),
(110, 'CALCITE BRUT', '0105', '300.00', '', NULL, 6, NULL, 12, 3),
(111, 'LAMPE CALCITE', '0106', '47.00', NULL, NULL, 1, NULL, 4, 3),
(112, 'LAMPE SELENITE PM', '0107', '55.00', NULL, NULL, 1, NULL, 4, 32),
(113, 'BOUDDHA DEBOUT LOTUS', '0108', '130.00', NULL, NULL, 1, NULL, 19, 32),
(114, 'FONTAINE QUARTZ ROSE', '0109', '250.00', 'vasque, grande pierre, 2 sacs de pierres déco, pompe, lampe, alimentation', NULL, 1, NULL, 11, 9),
(115, 'FONTAINE CHRISTAL DE ROCHE', '0110', '250.00', 'vasque, grande pierre, 2 sacs de pierres déco, pompe, lampe, alimentation', NULL, 1, NULL, 11, 12),
(116, 'GEODE AMETHYSTE 18,48Kg', '0111', '1200.00', 'petite 18,48kG', NULL, 1, NULL, 17, 7),
(117, 'GEODE AMETHYSTE 23,74Kg', '0112', '1500.00', 'grande 23,74Kg', NULL, 1, NULL, 17, 7),
(118, 'QUARTZ CORINTO BRESIL', '0113', '6.00', 'lot de 11', NULL, 11, NULL, 14, 25),
(119, 'QUARTZ CORINTO BRESIL', '0114', '4.00', 'lot de 4', NULL, 4, NULL, 14, 25),
(120, 'MINI BOUTEILLE', '0115', '5.00', 'lot de 10', NULL, 10, NULL, 11, 32),
(121, 'BOUGIE AMRTHYSTE', '0116', '12.00', 'lot de 2', NULL, 2, NULL, 10, 7),
(122, 'BOUGIE QUARTZ ROSE', '0117', '12.00', 'lot de 2', NULL, 2, NULL, 10, 9),
(123, 'BOUGIE CELESTITE', '0118', '12.00', 'lot de 2', NULL, 2, NULL, 10, 32),
(124, 'COUPE ONYX 10CM', '0119', '19.00', 'lot de 7', NULL, 7, NULL, 11, 6),
(125, 'COUPE ONYX 15CM', '0120', '30.00', 'lot de 5', NULL, 5, NULL, 11, 6),
(126, 'BOULE 30mm', '0121', '8.00', 'lot de 38 différentes', NULL, 38, NULL, 7, 32),
(127, 'OEUF ONYX', '0122', '10.00', 'lot de 12', NULL, 12, NULL, 7, 6),
(128, 'BATON DE MASSAGE EN SELENITE', '0123', '12.00', '2', NULL, 1, NULL, 16, 32),
(129, 'OPALE VERTE POLIE', '0124', '35.00', NULL, NULL, 1, NULL, 20, 23),
(130, 'CHRYSOPRASE', '0125', '90.00', NULL, NULL, 1, NULL, 20, 32),
(131, 'AGATE SUR SOCLE', '0126', '25.00', 'lot de 2', NULL, 1, NULL, 15, 13),
(132, 'AGATE SUR SOCLE', '0127', '20.00', NULL, NULL, 1, NULL, 15, 13),
(133, 'QUARTZ ROSE TOUT POLIE', '0128', '40.00', 'lot de 2', NULL, 1, NULL, 20, 9),
(134, 'BOUGEOIR EN SEL (PETIT)', '0129', '10.00', 'lot de 18', NULL, 18, NULL, 5, 32),
(135, 'AMETHYSTE POINTE BRESIL', '0130', '6.00', 'lot de 36', NULL, 1, NULL, 14, 7),
(136, 'AMETHYSTE POINTE BRESIL', '0131', '7.00', '', NULL, 1, NULL, 14, 7),
(137, 'LABRADORITE', '0132', '30.00', NULL, NULL, 1, NULL, 20, 2),
(138, 'ANIMAL PIERRE DES ANDES TORTUES', '0133', '5.00', 'lot de 10', NULL, 10, NULL, 6, 32),
(139, 'ANIMAL PIERRE DES ANDES CHIEN', '0134', '5.00', 'lot de 10', NULL, 8, NULL, 6, 32),
(140, 'ANIMAL PIERRE DES ANDES DIPLODOCUS', '0135', '5.00', 'lot de 10', NULL, 8, NULL, 6, 32),
(141, 'ANIMAL PIERRE DES ANDES CHEVAL', '0136', '5.00', 'lot de 10', NULL, 7, NULL, 6, 32),
(142, 'ANIMAL PIERRE DES ANDES LICORNE', '0137', '5.00', 'lot de 10', NULL, 10, NULL, 6, 32),
(143, 'ANIMAL PIERRE DES ANDES CHAT', '0138', '5.00', 'lot de 10', NULL, 9, NULL, 6, 32),
(144, 'ANIMAL PIERRE DES ANDES TRICERATOPS', '0139', '5.00', 'lot de 10', NULL, 9, NULL, 6, 32),
(145, 'PIERRE ROULÉE AMETHYSTE ZONÉE NAMBIE', '0140', '6.00', 'lot de 26', NULL, 26, NULL, 8, 17),
(146, 'PIERRE ROULÉE AMETHYSTE ZONÉE NAMBIE', '0141', '5.00', 'lot de 50', NULL, 47, NULL, 8, 17),
(147, 'PIERRE ROULÉE AMETHYSTE ZONÉE NAMBIE', '0142', '4.00', 'lot de 2', NULL, 2, NULL, 8, 17),
(148, 'ZEOLITE INDE (APOPHYLITTE ET STIBITE)', '0143', '40.00', 'lot de 6', NULL, 5, NULL, 12, 32),
(149, 'RUTILE HEMATITE', '0144', '14.00', '', NULL, 1, NULL, 12, 32),
(150, 'AZURITE', '0145', '10.00', NULL, NULL, 1, NULL, 12, 32),
(151, 'CYANITE ROUGE', '0146', '10.00', 'lot de 2', NULL, 1, NULL, 12, 32),
(152, 'AUGUES MARINE', '0147', '10.00', 'lot de 2', NULL, 1, NULL, 12, 32),
(153, 'CORDIERITE', '0148', '7.00', NULL, NULL, 1, NULL, 12, 32),
(154, 'FLUORITE', '0149', '8.00', NULL, NULL, 1, NULL, 12, 32),
(155, 'AZURITE', '0150', '10.00', NULL, NULL, 1, NULL, 12, 32),
(156, 'TOPAZE BRESIL', '0151', '9.00', NULL, NULL, 1, NULL, 12, 32),
(157, 'TOPAZE USA', '0152', '15.00', NULL, NULL, 1, NULL, 12, 32),
(158, 'DISTHENE', '0153', '8.00', NULL, NULL, 1, NULL, 12, 32),
(159, 'ARAGONITE', '0154', '16.00', 'lot de 2', NULL, 1, NULL, 12, 32),
(160, 'ARAGONITE', '0155', '10.00', NULL, NULL, 1, NULL, 12, 32),
(161, 'VANADINITE', '0156', '8.00', 'lot de 2', NULL, 1, NULL, 12, 32),
(162, 'FLACON D\'OR', '0157', '10.00', 'lot de 4', NULL, 1, NULL, 11, 32),
(163, 'PYROMORPHITE CHINE', '0158', '12.00', NULL, NULL, 1, NULL, 12, 32),
(164, 'ORPIMENT PÉROU', '0159', '40.00', NULL, NULL, 1, NULL, 12, 32),
(165, 'METEORITE ARGENTINE', '0160', '25.00', 'lot de 4', NULL, 1, NULL, 12, 32),
(166, 'MANGANOCALCITE BULGARIE', '0161', '68.00', NULL, NULL, 1, NULL, 12, 32),
(167, 'GRANDE TRANCHE D\'AGATE', '0162', '10.00', 'lot de 10', NULL, 1, NULL, 15, 13),
(168, 'CARILLON CRISTAL DE ROCHE', '0163', '25.00', NULL, NULL, 1, NULL, 11, 12),
(169, 'CARILLON AGATE', '0164', '25.00', NULL, NULL, 1, NULL, 11, 13),
(170, 'PIERRE ROULÉE MALACHITE', '0165', '10.00', 'lot de 22', NULL, 1, NULL, 8, 4),
(171, 'PIERRE ROULÉE MALACHITE', '0166', '7.00', 'lot de 14', NULL, 1, NULL, 8, 4),
(172, 'PIERRE ROULÉE MALACHITE', '0167', '5.00', 'lot de 2', NULL, 1, NULL, 8, 4),
(173, 'PIERRE ROULÉE GALET AMETHYSTE', '0168', '7.00', 'lot de 5', NULL, 1, NULL, 8, 7),
(174, 'PIERRE ROULÉE GALET AMETHYSTE', '0169', '6.00', 'lot de 24', NULL, 1, NULL, 8, 7),
(175, 'PIERRE ROULÉE GALET AMETHYSTE', '0170', '5.00', 'lot de 7', NULL, 1, NULL, 8, 7),
(176, 'PIERRE ROULÉE RHODONITE PÉROU', '0171', '5.00', 'lot de 18', NULL, 1, NULL, 8, 16),
(177, 'PIERRE ROULÉE RHODONITE PÉROU', '0172', '3.00', 'lot de 7', NULL, 1, NULL, 8, 16),
(178, 'PIERRE ROULÉE \"JADE\" SERPENTINE CHINE', '0173', '5.00', 'lot de 11', NULL, 1, NULL, 8, 15),
(179, 'PIERRE ROULÉE \"JADE\" SERPENTINE CHINE', '0174', '4.00', 'lot de 10', NULL, 1, NULL, 8, 15),
(180, 'PIERRE ROULÉE JASPE MOKAITE', '0175', '5.00', 'lot de 12', NULL, 1, NULL, 8, 19),
(181, 'PIERRE ROULÉE JASPE MOKAITE', '0176', '4.00', 'lot de 11', NULL, 1, NULL, 8, 19),
(182, 'PIERRE ROULÉE HOWLITE', '0177', '3.00', 'lot de 14', NULL, 1, NULL, 8, 21),
(183, 'PIERRE ROULÉE HOWLITE', '0178', '4.00', 'lot de 17', NULL, 1, NULL, 8, 21),
(184, 'PIERRE ROULÉE HOWLITE', '0179', '5.00', 'lot de 8', NULL, 1, NULL, 8, 21),
(185, 'PIERRE ROULÉE AVENTURINE VERTE', '0180', '2.00', 'lot de 15', NULL, 1, NULL, 8, 18),
(186, 'PIERRE ROULÉE AVENTURINE VERTE', '0181', '1.00', 'lot de 71', NULL, 1, NULL, 8, 18),
(187, 'PIERRE ROULÉE DUMORTIERITE', '0182', '4.00', 'lot de 25', NULL, 1, NULL, 8, 20),
(188, 'PIERRE ROULÉE DUMORTIERITE', '0183', '3.00', 'lot de 21', NULL, 1, NULL, 8, 20),
(189, 'PIERRE ROULÉE HEMATITE', '0184', '4.00', 'lot de 11', NULL, 1, NULL, 8, 24),
(190, 'PIERRE ROULÉE HEMATITE', '0185', '3.00', 'lot de 22', NULL, 1, NULL, 8, 24),
(191, 'PIERRE ROULÉE OBSIDIENNE DES NEIGES', '0186', '5.00', 'lot de 10', NULL, 1, NULL, 8, 22),
(192, 'PIERRE ROULÉE OBSIDIENNE DES NEIGES', '0187', '3.00', 'lot de 40', NULL, 1, NULL, 8, 22),
(193, 'GALET LABRADORITE', '0188', '8.00', 'lot de 2', NULL, 1, NULL, 8, 2),
(194, 'GALET LABRADORITE', '0189', '7.00', 'lot de 7', NULL, 1, NULL, 8, 2),
(195, 'GALET LABRADORITE', '0190', '6.00', 'lot de 4', NULL, 1, NULL, 8, 2),
(196, 'GALET LABRADORITE', '0191', '5.00', 'lot de 2', NULL, 1, NULL, 8, 2),
(197, 'GALET OPALE VERT', '0192', '14.00', 'lot de 4', NULL, 1, NULL, 8, 23),
(198, 'GALET OPALE VERT', '0193', '10.00', 'lot de 7', NULL, 1, NULL, 8, 23),
(199, 'NAUTILE GRAND', '0194', '30.00', NULL, NULL, 1, NULL, 13, 32),
(200, 'NAUTILE PETIT', '0195', '12.00', NULL, NULL, 1, NULL, 13, 32),
(201, 'NAUTILE POLIE MADAGASCAR BRUT', '0196', '4.00', 'lot de 10', NULL, 1, NULL, 13, 32),
(202, 'AMMONITE MADAGASCAR BRUT MOYEN', '0197', '5.00', NULL, NULL, 1, NULL, 13, 32),
(203, 'AMMONITE MADAGASCAR GRAND', '0198', '15.00', NULL, NULL, 1, NULL, 13, 32),
(204, 'AMMONITE TRACTEUR DOUVILLEICERAS MADAGASCAR', '0199', '10.00', NULL, NULL, 1, NULL, 13, 32),
(205, 'DENTRITE PETITE', '0200', '36.00', NULL, NULL, 1, NULL, 13, 32),
(206, 'DENTRITE GRANDE', '0201', '44.00', NULL, NULL, 1, NULL, 13, 32),
(207, 'POINTE QUARTZ MADAGASCAR', '0202', '15.00', 'lot de 4', NULL, 1, NULL, 14, 25),
(208, 'POINTE QUARTZ MADAGASCAR', '0203', '12.00', 'lot de 21', NULL, 1, NULL, 14, 25),
(209, 'POINTE QUARTZ MADAGASCAR', '0204', '10.00', 'lot de 9', NULL, 1, NULL, 14, 25),
(210, 'POINTE QUARTZ', '0205', '6.00', 'lot de 41', NULL, 1, NULL, 14, 25),
(211, 'POINTE QUARTZ', '0206', '4.00', 'lot de 45', NULL, 1, NULL, 14, 25),
(212, 'POINTE QUARTZ', '0207', '2.00', 'lot de 19', NULL, 1, NULL, 14, 25),
(213, 'MOLDAVITE', '0208', '65.00', NULL, NULL, 1, NULL, 12, 32),
(214, 'MOLDAVITE', '0209', '40.00', NULL, NULL, 1, NULL, 12, 32),
(215, 'MOLDAVITE', '0210', '25.00', NULL, NULL, 1, NULL, 12, 32),
(216, 'METEORITE ARGENTINE', '0211', '25.00', 'lot de 4', NULL, 1, NULL, 12, 32),
(217, 'FOSSILE PLAQUE POISSON', '0212', '110.00', NULL, NULL, 1, NULL, 13, 32),
(218, 'ANIMAL CHOUETTE ONYX', '0213', '5.00', 'lot de 12', NULL, 1, NULL, 6, 6),
(219, 'ANIMAL HIBOU ONYX', '0214', '5.00', 'lot de 12', NULL, 1, NULL, 6, 6),
(220, 'GRENAT SPESSARTITE', '0215', '35.00', NULL, NULL, 1, NULL, 12, 32),
(221, 'MIMETITE MEXIQUE', '0216', '13.00', NULL, NULL, 1, NULL, 12, 32),
(222, 'SANIDITE ORTHOSE (GEMME)', '0217', '10.00', NULL, NULL, 1, NULL, 12, 32),
(223, 'RHODIZITE', '0218', '10.00', NULL, NULL, 1, NULL, 12, 32),
(224, 'LAMPE EN SEL 2-3Kg', '0219', '30.00', 'lot de 2', NULL, 1, NULL, 4, 32),
(225, 'COLLIER CALCITE ORANGE 8mm', '0220', '45.00', NULL, NULL, 1, NULL, 2, 3),
(226, 'COLLIER PIERRE DE SOLEIL 8mm', '0221', '62.00', '', NULL, 1, NULL, 2, 3),
(227, 'COLLIER 42cm PIERRE DE SOLEIL 6mm', '0222', '50.00', NULL, NULL, 1, NULL, 2, 3),
(228, 'BRACELET MULTI RANG GRENAT', '0223', '24.00', 'lot de 2', NULL, 1, NULL, 1, 32),
(229, 'BRACELET KUNZITE', '0224', '39.00', NULL, NULL, 1, NULL, 1, 32),
(230, 'BRACELET PHRENITE', '0225', '38.00', NULL, NULL, 1, NULL, 1, 32),
(231, 'COLLIER 45cm-5mm LABRADORITE ARGENT 0,925', '0226', '48.00', 'lot de 2', NULL, 1, NULL, 2, 2),
(232, 'PENDENTIF QUARTZ RUTILE GOUTE ARGENT 0,925', '0227', '37.00', 'lot de 2', NULL, 1, NULL, 3, 25),
(233, 'PENDENTIF AMETHYSTE TRAPICHE(AFS) ARGENT 0,925', '0228', '30.00', NULL, NULL, 1, NULL, 3, 7),
(234, 'PENDENTIF LABRADORITE GOUTTE ARGENT 0,925', '0229', '82.00', 'lot de 2', NULL, 1, NULL, 3, 2),
(235, 'PENDENTIF CHRYSOCOLLE GOUTTE ARGENT 0,925', '0230', '39.00', NULL, NULL, 1, NULL, 3, 27),
(236, 'PENDENTIF PHRENITE GOUTTE ARGENT 0,925', '0231', '49.00', NULL, NULL, 1, NULL, 3, 32),
(237, 'PENDENTIF RUBIS GOUTTE ARGENT 0,925', '0232', '58.00', NULL, NULL, 1, NULL, 3, 32),
(238, 'JEU ECHEC ONYX', '0233', '150.00', NULL, NULL, 1, NULL, 18, 6),
(239, 'VEUILLEUSE EN SEL', '0234', '24.00', NULL, NULL, 1, NULL, 4, 32),
(240, 'BONZAI AMETHYSTE PETIT', '0235', '35.00', NULL, NULL, 1, NULL, 9, 7),
(241, 'BONZAI AMETHYSTE GRAND BRESIL', '0236', '95.00', NULL, NULL, 1, NULL, 9, 7),
(242, 'COLLIER AMAZONITE 4mm', '0237', '60.00', NULL, NULL, 1, NULL, 2, 32),
(243, 'COLLIER APATITE BLEU 4mm', '0238', '45.00', NULL, NULL, 1, NULL, 2, 32),
(244, 'COLLIER AMETHYSTE 4mm', '0239', '25.00', NULL, NULL, 1, NULL, 2, 7),
(245, 'CHAINE ARGENT + BILLE LABRADORITE', '0240', '45.00', NULL, NULL, 1, NULL, 2, 2),
(246, 'CHAINE ARGENT + BILLE AMETHYSTE', '0241', '50.00', NULL, NULL, 1, NULL, 2, 7),
(247, 'BRACELET 6mm CHAINE DOUBLE + 7 PERLES LABRADORITE', '0242', '50.00', NULL, NULL, 1, NULL, 1, 2),
(248, 'BRACELET 3 RANG AMETHYSTE ARGENT 0,925', '043', '50.00', NULL, NULL, 1, NULL, 1, 7),
(249, 'BONZAI PYRITE', '0244', '20.00', NULL, NULL, 1, NULL, 9, 32),
(250, 'DÉ A JOUER', '0245', '35.00', 'lot de 2x12', NULL, 1, NULL, 18, 32),
(251, 'GEODE CITRINE', '0246', '500.00', NULL, NULL, 1, NULL, 17, 32),
(252, 'LAMPE SEL ROND', '0247', '70.00', NULL, NULL, 1, NULL, 4, 32),
(253, 'BONZAI AMBRE', '0248', '65.00', 'lot de 2', NULL, 1, NULL, 9, 32),
(254, 'SOCLE LED EN BOIS', '0249', '25.00', 'lot de 2', NULL, 1, NULL, 19, 32),
(255, 'PENDENTIF RUBIS GOUTTE ARGENT 0,925', '0250', '48.00', NULL, NULL, 1, NULL, 3, 32),
(256, 'TRANCHE D\'AGATE', '0251', '2.00', 'lot de 78', NULL, 1, NULL, 15, 13),
(257, 'DÉ A JOUER - UNITÉ', '0252', '5.00', NULL, NULL, 1, NULL, 18, 32),
(258, 'PIERRE ROULÉE LABRADORITE', '0253', '8.00', NULL, NULL, 1, NULL, 8, 2),
(259, 'BRACELET PHRENITE - 8mm', '0254', '38.00', NULL, NULL, 1, NULL, 1, 32),
(260, 'PENDENTIF RHODONITE', '0255', '6.00', NULL, NULL, 1, NULL, 3, 16),
(261, 'PENDENTIF LAPIS LAZULI', '0256', '9.00', NULL, NULL, 1, NULL, 3, 11);

-- --------------------------------------------------------

--
-- Structure de la table `product_invoice`
--

DROP TABLE IF EXISTS `product_invoice`;
CREATE TABLE IF NOT EXISTS `product_invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `id_product` int NOT NULL,
  `id_invoice` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_invoice` (`id_invoice`),
  KEY `id` (`id_product`,`id_invoice`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'administrateur'),
(2, 'employé'),
(3, 'stagiaire');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `discount` float(3,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `type`, `discount`) VALUES
(1, 'particulier', 0.00),
(2, 'commercants', 0.10),
(3, 'police', 0.10),
(4, 'pompier', 0.10),
(5, 'Famille', 0.20),
(6, 'amis', 0.20),
(7, 'Carte Fidélité', 0.10);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lastname` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `pseudo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `lastname`, `name`, `pseudo`, `password`, `role_id`) VALUES
(1, 'BONNIER', 'Pierre-Louis', 'plb', '$2y$10$5itlGNcicK3l560yylSYcupE2dAvwcvlsHqGxMWmols.DAHwraE3K', 1);

-- --------------------------------------------------------

--
-- Structure de la table `workshop`
--

DROP TABLE IF EXISTS `workshop`;
CREATE TABLE IF NOT EXISTS `workshop` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `max_place` int NOT NULL,
  `price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type` (`id`);

--
-- Contraintes pour la table `customer_workshop`
--
ALTER TABLE `customer_workshop`
  ADD CONSTRAINT `customer_workshop_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `customer_workshop_ibfk_2` FOREIGN KEY (`id_workshop`) REFERENCES `workshop` (`id`);

--
-- Contraintes pour la table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `invoice_workshop`
--
ALTER TABLE `invoice_workshop`
  ADD CONSTRAINT `invoice_workshop_ibfk_1` FOREIGN KEY (`id_workshop`) REFERENCES `workshop` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_4` FOREIGN KEY (`id_material`) REFERENCES `material` (`id`);

--
-- Contraintes pour la table `product_invoice`
--
ALTER TABLE `product_invoice`
  ADD CONSTRAINT `product_invoice_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_invoice_ibfk_2` FOREIGN KEY (`id_invoice`) REFERENCES `invoice` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
