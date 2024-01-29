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
(21, 'AUTRES', NULL),
(22, 'COEUR', NULL),
(23, 'BAGUE', NULL),
(24, 'BIEN ETRE', NULL),
(25, 'BOUCLE OREILLES', NULL);

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

INSERT INTO `customer` (`id`, `created_date`, `civility`, `lastname`, `firstname`, `reference`, `adress`, `zipcode`, `city`, `phone`, `email`, `description`, `id_type`) VALUES
(1, '2024-01-29', 'Madame', 'WANG', 'Peibei', 1, NULL, 69340, 'FRANCHEVILLE', NULL, NULL, '', 6),
(2, '2024-01-29', NULL, 'Client particulier', '', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(3, '2024-01-29', NULL, 'DO', 'Nhu Ngoc', 3, NULL, 69160, 'TASSIN LA DEMI-LUNE', NULL, NULL, 'patron', 5),
(4, '2024-01-29', 'Madame', 'JOURDAN', 'Charlotte', 4, NULL, NULL, NULL, NULL, NULL, 'Shiva', 2),
(5, '2024-01-29', 'Madame', '', 'Sylvie', 5, NULL, NULL, NULL, NULL, NULL, NULL, 6),
(6, '2024-01-29', 'Monsieur et Madame', 'LACROUX', '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 5),
(7, '2024-01-29', NULL, 'Client particulier', '', 7, NULL, NULL, NULL, NULL, NULL, 'carte de fidélité', 7),
(8, '2024-01-29', 'Madame', 'POPESCU', 'Andrea', 8, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(9, '2024-01-29', 'Madame', 'PETIT', 'Isabelle', 9, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(10, '2024-01-29', NULL, 'Famille', '', 10, NULL, NULL, NULL, NULL, NULL, NULL, 5),
(11, '2024-01-29', 'Monsieur', 'MERLIN', '', 11, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(12, '2024-01-29', NULL, 'Commerçant de Tassin', '', 12, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(13, '2024-01-29', 'Madame', '', 'NAIMA', 13, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(14, '2024-01-29', NULL, '', 'Hsin Yi', 14, NULL, NULL, NULL, NULL, NULL, NULL, 6);

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
(15, 'SERPENTINE'),
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
(30, 'CELESTINE'),
(31, 'SELENITE'),
(32, 'AUTRES'),
(33, 'CORNALINE'),
(34, 'SEL HIMALAYA'),
(35, 'PERLE'),
(36, 'OEIL DE TAUREAU'),
(37, 'NACRE'),
(38, 'PHRENITE'),
(39, 'TURQUOISE'),
(40, 'AMAZONITE'),
(41, 'GRENAT'),
(42, 'KUNZITE'),
(43, 'SODALITE'),
(44, 'CITRINE'),
(45, 'AIGUE MARINE'),
(46, 'JADE'),
(47, 'MULTIPIERRES'),
(48, 'APATITE'),
(49, 'PIERRE DE SOLEIL'),
(50, 'ONYX INDIEN'),
(51, 'AMBRE'),
(52, 'LAVE');

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
(7, 'OPALE', '0007', '60.00', NULL, NULL, 1, NULL, 21, 23),
(8, 'OPALE', '0008', '80.00', NULL, NULL, 1, NULL, 21, 23),
(9, 'OPALE', '0009', '100.00', NULL, NULL, 1, NULL, 21, 23),
(10, 'OPALE', '0010', '120.00', NULL, NULL, 1, NULL, 21, 23),
(11, 'PENDENTIF ROND CHRYSOCOLLE', '0011', '30.00', 'pendentif + bélière + cordon jonc', NULL, 0, NULL, 3, 27),
(12, 'PENDENTIF COEUR OEUIL DE LUCIE', '0012', '33.00', 'pendentif + bélière + cordon jonc', NULL, 1, NULL, 3, 28),
(13, 'PENDENTIF ROND MULTI', '0013', '30.00', 'pendentif + bélière + cordon jonc', NULL, 1, NULL, 3, 19),
(14, 'PENDENTIF ROND OPALE BLEUE', '0014', '30.00', 'pendentif + bélière + cordon jonc', NULL, 1, NULL, 3, 23),
(15, 'PENDENTIF TRIANGLE JASPE K2', '0015', '30.00', 'pendentif + bélière + cordon jonc', NULL, 1, NULL, 3, 19),
(16, 'PENDENTIF MARQUISE FELDSPATH', '0016', '30.00', 'pendentif + bélière + cordon jonc', NULL, 1, NULL, 3, 29),
(17, 'PENDENTIF GOUTTE MOOKAITE', '0017', '30.00', 'pendentif + bélière + cordon jonc', NULL, 1, NULL, 3, 13),
(18, 'PENDENTIF ROND AGATE DENTRITE', '0018', '18.00', 'pendentif + bélière + cordon jonc', NULL, 2, NULL, 3, 13),
(19, 'PENDENTIF ROND OPALE DENTRITE', '0019', '15.00', 'pendentif + bélière + cordon jonc', NULL, 2, NULL, 3, 23),
(20, 'QUARTZ ROSE BRUT', '0020', '2.00', 'lot de 9 minéraux', NULL, 9, NULL, 12, 25),
(21, 'QUARTZ BLANC BRUT', '0021', '2.00', 'lot de 11 minéraux', NULL, 11, NULL, 12, 25),
(22, 'AVENTURINE VERTE', '0022', '2.00', 'lot de 6 minéraux', NULL, 6, NULL, 12, 18),
(23, 'JASPE ZEBRE', '0023', '2.00', 'lot de 3 minéraux', NULL, 3, NULL, 12, 19),
(24, 'LAPIS LAZULI', '0024', '75.00', '646g petit', NULL, 1, NULL, 20, 11),
(25, 'LAPIS LAZULI', '0025', '130.00', '1189g grand', NULL, 1, NULL, 20, 11),
(26, 'SELENITE CASCADE S', '0026', '12.00', 'sélénite cascade S lot de 7', NULL, 8, NULL, 16, 31),
(27, 'SELENITE CASCADE M', '0027', '16.00', 'sélénite cascade M lot de 3', NULL, 1, NULL, 16, 31),
(28, 'SPHERE SELENITE', '0028', '25.00', 'sphère sélénite + 1 support', NULL, 1, NULL, 16, 31),
(29, 'PALET SELENITE METATRON', '0029', '20.00', 'palet sélénite (métatron) lot de 3', NULL, 3, NULL, 16, 31),
(30, 'PALET SELENITE', '0030', '17.00', 'palet sélénite lot de 10', NULL, 10, NULL, 16, 31),
(31, 'BOUGEOIR SELENITE', '0031', '20.00', 'bougeoir sélénite lot de 2', NULL, 2, NULL, 5, 31),
(32, 'POINTE CALCITE', '0032', '22.00', '237g', NULL, 1, NULL, 14, 3),
(33, 'POINTE CALCITE', '0033', '20.00', 'pointe calcite Brésil 218g', NULL, 1, NULL, 14, 3),
(34, 'POINTE CALCITE', '0034', '25.00', 'pointe calcite Brésil 280g', NULL, 1, NULL, 14, 3),
(35, 'POINTE QUARTZ', '0035', '35.00', '347g', NULL, 1, NULL, 14, 25),
(36, 'AMETHYSTE', '0036', '75.00', '991g géode coupé (comptoir)', NULL, 1, NULL, 17, 7),
(37, 'AMETHYSTE', '0037', '40.00', '429g géode coupé (comptoir)', NULL, 1, NULL, 17, 7),
(38, 'AMETHYSTE', '0038', '60.00', '694g géode coupé (comptoir)', NULL, 1, NULL, 17, 7),
(39, 'AMETHYSTE', '0039', '50.00', '495g géode coupé (comptoir)', NULL, 1, NULL, 17, 7),
(40, 'AMETHYSTE', '0040', '48.00', '460g géode coupé (comptoir)', NULL, 1, NULL, 17, 7),
(41, 'AMETHYSTE', '0041', '55.00', '549g géode coupé (comptoir)', NULL, 1, NULL, 17, 7),
(42, 'AMETHYSTE SOCLE', '0042', '15.00', 'petite', NULL, 1, NULL, 17, 7),
(43, 'AMETHYSTE SOCLE', '0043', '25.00', 'grande', NULL, 1, NULL, 17, 7),
(44, 'PLAQUE AMETHYSTE', '0044', '10.00', '79g géode plaque', NULL, 1, NULL, 17, 7),
(45, 'PLAQUE AMETHYSTE', '0045', '15.00', '106g géode plaque', NULL, 1, NULL, 17, 7),
(46, 'PLAQUE AMETHYSTE', '0046', '13.00', '86g géode plaque', NULL, 1, NULL, 17, 7),
(47, 'PLAQUE AMETHYSTE', '0047', '20.00', '123g géode plaque', NULL, 1, NULL, 17, 7),
(48, 'PLAQUE AMETHYSTE', '0048', '20.00', '130g géode plaque', NULL, 1, NULL, 17, 7),
(49, 'PLAQUE AMETHYSTE', '0049', '13.00', '103g géode plaque', NULL, 1, NULL, 17, 7),
(50, 'PLAQUE AMETHYSTE', '0050', '15.00', '114g géode plaque', NULL, 1, NULL, 17, 7),
(51, 'PLAQUE AMETHYSTE', '0051', '15.00', '117g géode plaque', NULL, 1, NULL, 17, 7),
(52, 'SOCLE QUARTZ ROSE', '0052', '12.00', 'socle quartz rose lot de 2', NULL, 1, NULL, 11, 9),
(53, 'SOCLE AVENTURINE VERTE', '0053', '12.00', 'socle aventurine verte lot de 2', NULL, 1, NULL, 11, 18),
(54, 'BOUGEOIR AGATE', '0054', '30.00', 'rose', NULL, 1, NULL, 5, 13),
(55, 'BOUGEOIR AGATE', '0055', '30.00', 'bleu', NULL, 1, NULL, 5, 13),
(56, 'SPHERE QUARTZ ROSE', '0056', '130.00', '1.18Kg + 1 support', NULL, 1, NULL, 7, 9),
(57, 'SPHERE CHRYSOCOLLE', '0057', '90.00', '350g + support', NULL, 1, NULL, 7, 27),
(58, 'SPHERE CHRYSOCOLLE', '0058', '50.00', '190g + support', NULL, 1, NULL, 7, 27),
(59, 'BRACELET PERLE', '0059', '30.00', 'lot de 10', NULL, 1, NULL, 1, 35),
(60, 'BRACELET JADE NEPHRITE', '0060', '30.00', 'lot de 10', NULL, 1, NULL, 1, 46),
(61, 'BRACELET QUARTZ ROSE ENFANT', '0061', '12.00', 'lot de 10', NULL, 1, NULL, 1, 9),
(62, 'BRACELET OEIL DE TIGRE 6MM', '0062', '16.00', 'lot de 10 petit', NULL, 1, NULL, 1, 5),
(63, 'BRACELET AMETHYSTE ENFANT', '0063', '13.00', 'lot de 10', NULL, 1, NULL, 1, 7),
(64, 'BRACELET OEIL DE TAUREAU', '0064', '20.00', 'lot de 10', NULL, 1, NULL, 1, 36),
(65, 'BRACELET CALCITE', '0065', '22.00', 'lot de 10', NULL, 1, NULL, 1, 3),
(66, 'BRACELET CORNALINE', '0066', '20.00', 'lot de 10', NULL, 1, NULL, 1, 33),
(67, 'BRACELET OEIL DE TIGRE 8MM', '0067', '22.00', 'lot de 10 gros', NULL, 1, NULL, 1, 5),
(68, 'BRACELET QUARTZ ROSE', '0068', '16.00', 'lot de 10', NULL, 1, NULL, 1, 9),
(69, 'BRACELET NACRE', '0069', '25.00', 'lot de 10', NULL, 1, NULL, 1, 37),
(70, 'BRACELET PHRENITE - 6mm', '0070', '30.00', 'lot de 10', NULL, 1, NULL, 1, 38),
(71, 'BRACELET TURQUOISE PÉROU', '0071', '48.00', 'lot de 10', NULL, 1, NULL, 1, 39),
(72, 'BRACELET LABRADORITE BLANCHE / PIERRE', '0072', '30.00', 'lot de 10', NULL, 1, NULL, 1, 2),
(73, 'BRACELET AMAZONITE', '0073', '35.00', 'lot de 10', NULL, 1, NULL, 1, 40),
(74, 'COEUR COUPLE', '0074', '30.00', 'bois', NULL, 1, NULL, 19, 32),
(75, 'PLATEAU OM', '0075', '35.00', 'bois', NULL, 1, NULL, 19, 32),
(76, 'BOUDDHA RELAX A GENOU', '0076', '40.00', 'bois', NULL, 1, NULL, 19, 32),
(77, 'PIERRE ROULÉE CHRYSTAL DE ROCHE', '0077', '5.00', 'lot de 63', NULL, 1, NULL, 8, 12),
(78, 'COLLIER CALCITE ORANGE 6mm', '0078', '30.00', NULL, NULL, 1, NULL, 2, 3),
(79, 'PIERRE ROULÉE ONYX', '0079', '5.00', 'lot de 46', NULL, 1, NULL, 8, 6),
(80, 'PIERRE ROULÉE ONYX', '0080', '6.00', 'lot de 10', NULL, 1, NULL, 8, 6),
(81, 'PIERRE ROULÉE OEIL DE TIGRE - S', '0081', '3.00', 'lot de 22', NULL, 1, NULL, 8, 5),
(82, 'PIERRE ROULÉE OEIL DE TIGRE - L', '0082', '5.00', '', NULL, 1, NULL, 8, 5),
(83, 'PIERRE ROULÉE OEIL DE TIGRE -L', '0083', '6.00', 'lot de 11', NULL, 1, NULL, 8, 5),
(84, 'PIERRE ROULÉE OEIL DE TIGRE - L', '0084', '7.00', 'lot de 9', NULL, 1, NULL, 8, 5),
(85, 'BOUGEOIR EN SEL FER FORGÉ', '0085', '30.00', NULL, NULL, 1, NULL, 5, 34),
(86, 'PIERRE ROULÉE AGATE BOTSWANA', '0086', '6.00', 'lot de 45', NULL, 1, NULL, 8, 14),
(87, 'PIERRE ROULÉE AGATE DU BOTSWANA', '0087', '3.00', 'lot de 39', NULL, 1, NULL, 8, 14),
(88, 'PIERRE ROULÉE LABRADORITE', '0088', '10.00', 'lot de 63', NULL, 1, NULL, 8, 2),
(89, 'PIERRE ROULÉE CALCITE', '0089', '6.00', 'lot de 16', NULL, 1, NULL, 8, 3),
(90, 'PIERRE ROULÉE CALCITE', '0090', '5.00', 'lot de 23', NULL, 1, NULL, 8, 3),
(91, 'PIERRE ROULÉE CALCITE', '0091', '3.00', 'lot de 18', NULL, 1, NULL, 8, 3),
(92, 'PIERRE ROULÉE UNAKITE', '0092', '7.00', 'lot de 23', NULL, 1, NULL, 8, 1),
(93, 'PIERRE ROULÉE UNAKITE', '0093', '6.00', 'lot de 26', NULL, 1, NULL, 8, 1),
(94, 'PIERRE ROULÉE UNAKITE', '0094', '4.00', 'lot de 24', NULL, 1, NULL, 8, 1),
(95, 'PIERRE ROULÉE CORNALINE', '0095', '4.00', 'lot de 59', NULL, 1, NULL, 8, 33),
(96, 'PIERRE ROULÉE QUARTZ ROSE MADAGASCAR', '0096', '7.00', 'lot de 40', NULL, 1, NULL, 8, 9),
(97, 'PIERRE ROULÉE ANGELITE', '0097', '8.00', 'lot de 14', NULL, 1, NULL, 8, 8),
(98, 'PIERRE ROULÉE TOURMALINE NOIR', '0098', '6.00', 'lot de 35', NULL, 1, NULL, 8, 10),
(99, 'PIERRE ROULÉE TOURMALINE NOIR', '0099', '7.00', 'lot de 12', NULL, 1, NULL, 8, 10),
(100, 'PIERRE ROULÉE LAPIS LAZULI', '0100', '10.00', 'lot de 2', NULL, 1, NULL, 8, 11),
(101, 'PIERRE ROULÉE LAPIS LAZULI', '0101', '7.00', 'lot de 13', NULL, 1, NULL, 8, 11),
(102, 'PIERRE ROULÉE LAPIS LAZULI', '0102', '6.00', 'lot de 2', NULL, 1, NULL, 8, 11),
(103, 'PIERRE ROULÉE LAPIS LAZULI', '0103', '4.00', 'lot de 5', NULL, 1, NULL, 8, 11),
(104, 'TRANCHE D\'AGATE', '0104', '1.00', 'lot de 216', NULL, 211, NULL, 15, 13),
(105, 'CALCITE BRUT', '0105', '300.00', '', NULL, 6, NULL, 12, 3),
(106, 'LAMPE CALCITE', '0106', '47.00', NULL, NULL, 1, NULL, 4, 3),
(107, 'LAMPE SELENITE PM', '0107', '55.00', NULL, NULL, 1, NULL, 4, 31),
(108, 'BOUDDHA DEBOUT LOTUS', '0108', '130.00', NULL, NULL, 1, NULL, 19, 32),
(109, 'FONTAINE QUARTZ ROSE', '0109', '250.00', 'vasque, grande pierre, 2 sacs de pierres déco, pompe, lampe, alimentation', NULL, 1, NULL, 11, 9),
(110, 'FONTAINE CHRISTAL DE ROCHE', '0110', '250.00', 'vasque, grande pierre, 2 sacs de pierres déco, pompe, lampe, alimentation', NULL, 1, NULL, 11, 12),
(111, 'GEODE AMETHYSTE 18,48Kg', '0111', '1200.00', 'petite 18,48kG', NULL, 1, NULL, 17, 7),
(112, 'GEODE AMETHYSTE 23,74Kg', '0112', '1500.00', 'grande 23,74Kg', NULL, 1, NULL, 17, 7),
(113, 'QUARTZ CORINTO BRESIL', '0113', '6.00', 'lot de 11', NULL, 11, NULL, 14, 25),
(114, 'QUARTZ CORINTO BRESIL', '0114', '4.00', 'lot de 4', NULL, 4, NULL, 14, 25),
(115, 'MINI BOUTEILLE', '0115', '5.00', 'lot de 10', NULL, 10, NULL, 11, 32),
(116, 'BOUGIE AMRTHYSTE', '0116', '12.00', 'lot de 2', NULL, 2, NULL, 10, 7),
(117, 'BOUGIE QUARTZ ROSE', '0117', '12.00', 'lot de 2', NULL, 2, NULL, 10, 9),
(118, 'BOUGIE CELESTITE', '0118', '12.00', 'lot de 2', NULL, 2, NULL, 10, 30),
(119, 'COUPE ONYX 10CM', '0119', '19.00', 'lot de 7', NULL, 7, NULL, 11, 6),
(120, 'COUPE ONYX 15CM', '0120', '30.00', 'lot de 5', NULL, 5, NULL, 11, 6),
(121, 'BOULE 30mm', '0121', '8.00', 'lot de 38 différentes', NULL, 38, NULL, 7, 32),
(122, 'OEUF ONYX', '0122', '10.00', 'lot de 12', NULL, 12, NULL, 7, 6),
(123, 'BATON DE MASSAGE EN SELENITE', '0123', '12.00', '2', NULL, 1, NULL, 16, 31),
(124, 'OPALE VERTE POLIE', '0124', '35.00', NULL, NULL, 1, NULL, 20, 23),
(125, 'CHRYSOPRASE', '0125', '90.00', NULL, NULL, 1, NULL, 20, 32),
(126, 'AGATE SUR SOCLE', '0126', '25.00', 'lot de 2', NULL, 1, NULL, 15, 13),
(127, 'AGATE SUR SOCLE', '0127', '20.00', NULL, NULL, 1, NULL, 15, 13),
(128, 'QUARTZ ROSE TOUT POLIE', '0128', '40.00', 'lot de 2', NULL, 1, NULL, 20, 9),
(129, 'BOUGEOIR EN SEL (PETIT)', '0129', '10.00', 'lot de 18', NULL, 18, NULL, 5, 34),
(130, 'AMETHYSTE POINTE BRESIL', '0130', '6.00', 'lot de 36', NULL, 1, NULL, 14, 7),
(131, 'AMETHYSTE POINTE BRESIL', '0131', '7.00', '', NULL, 1, NULL, 14, 7),
(132, 'LABRADORITE', '0132', '30.00', NULL, NULL, 1, NULL, 20, 2),
(133, 'ANIMAL PIERRE DES ANDES TORTUES', '0133', '5.00', 'lot de 10', NULL, 10, NULL, 6, 32),
(134, 'ANIMAL PIERRE DES ANDES CHIEN', '0134', '5.00', 'lot de 10', NULL, 8, NULL, 6, 32),
(135, 'ANIMAL PIERRE DES ANDES DIPLODOCUS', '0135', '5.00', 'lot de 10', NULL, 8, NULL, 6, 32),
(136, 'ANIMAL PIERRE DES ANDES CHEVAL', '0136', '5.00', 'lot de 10', NULL, 7, NULL, 6, 32),
(137, 'ANIMAL PIERRE DES ANDES LICORNE', '0137', '5.00', 'lot de 10', NULL, 10, NULL, 6, 32),
(138, 'ANIMAL PIERRE DES ANDES CHAT', '0138', '5.00', 'lot de 10', NULL, 9, NULL, 6, 32),
(139, 'ANIMAL PIERRE DES ANDES TRICERATOPS', '0139', '5.00', 'lot de 10', NULL, 9, NULL, 6, 32),
(140, 'PIERRE ROULÉE AMETHYSTE ZONÉE NAMBIE', '0140', '6.00', 'lot de 26', NULL, 26, NULL, 8, 17),
(141, 'PIERRE ROULÉE AMETHYSTE ZONÉE NAMBIE', '0141', '5.00', 'lot de 50', NULL, 47, NULL, 8, 17),
(142, 'PIERRE ROULÉE AMETHYSTE ZONÉE NAMBIE', '0142', '4.00', 'lot de 2', NULL, 2, NULL, 8, 17),
(143, 'ZEOLITE INDE (APOPHYLITTE ET STIBITE)', '0143', '40.00', 'lot de 6', NULL, 5, NULL, 12, 32),
(144, 'RUTILE HEMATITE', '0144', '14.00', '', NULL, 1, NULL, 12, 32),
(145, 'AZURITE', '0145', '10.00', NULL, NULL, 1, NULL, 12, 32),
(146, 'CYANITE ROUGE', '0146', '10.00', 'lot de 2', NULL, 1, NULL, 12, 32),
(147, 'AUGUES MARINE', '0147', '10.00', 'lot de 2', NULL, 1, NULL, 12, 32),
(148, 'CORDIERITE', '0148', '7.00', NULL, NULL, 1, NULL, 12, 32),
(149, 'FLUORITE', '0149', '8.00', NULL, NULL, 1, NULL, 12, 32),
(150, 'AZURITE', '0150', '10.00', NULL, NULL, 1, NULL, 12, 32),
(151, 'TOPAZE BRESIL', '0151', '9.00', NULL, NULL, 1, NULL, 12, 32),
(152, 'TOPAZE USA', '0152', '15.00', NULL, NULL, 1, NULL, 12, 32),
(153, 'DISTHENE', '0153', '8.00', NULL, NULL, 1, NULL, 12, 32),
(154, 'ARAGONITE', '0154', '16.00', 'lot de 2', NULL, 1, NULL, 12, 32),
(155, 'ARAGONITE', '0155', '10.00', NULL, NULL, 1, NULL, 12, 32),
(156, 'VANADINITE', '0156', '8.00', 'lot de 2', NULL, 1, NULL, 12, 32),
(157, 'FLACON D\'OR', '0157', '10.00', 'lot de 4', NULL, 1, NULL, 11, 32),
(158, 'PYROMORPHITE CHINE', '0158', '12.00', NULL, NULL, 1, NULL, 12, 32),
(159, 'ORPIMENT PÉROU', '0159', '40.00', NULL, NULL, 1, NULL, 12, 32),
(160, 'METEORITE ARGENTINE', '0160', '25.00', 'lot de 4', NULL, 1, NULL, 12, 32),
(161, 'MANGANOCALCITE BULGARIE', '0161', '68.00', NULL, NULL, 1, NULL, 12, 32),
(162, 'GRANDE TRANCHE D\'AGATE', '0162', '10.00', 'lot de 10', NULL, 1, NULL, 15, 13),
(163, 'CARILLON CRISTAL DE ROCHE', '0163', '25.00', NULL, NULL, 1, NULL, 11, 12),
(164, 'CARILLON AGATE', '0164', '25.00', NULL, NULL, 1, NULL, 11, 13),
(165, 'PIERRE ROULÉE MALACHITE', '0165', '10.00', 'lot de 22', NULL, 1, NULL, 8, 4),
(166, 'PIERRE ROULÉE MALACHITE', '0166', '7.00', 'lot de 14', NULL, 1, NULL, 8, 4),
(167, 'PIERRE ROULÉE MALACHITE', '0167', '5.00', 'lot de 2', NULL, 1, NULL, 8, 4),
(168, 'PIERRE ROULÉE GALET AMETHYSTE', '0168', '7.00', 'lot de 5', NULL, 1, NULL, 8, 7),
(169, 'PIERRE ROULÉE GALET AMETHYSTE', '0169', '6.00', 'lot de 24', NULL, 1, NULL, 8, 7),
(170, 'PIERRE ROULÉE GALET AMETHYSTE', '0170', '5.00', 'lot de 7', NULL, 1, NULL, 8, 7),
(171, 'PIERRE ROULÉE RHODONITE PÉROU', '0171', '5.00', 'lot de 18', NULL, 1, NULL, 8, 16),
(172, 'PIERRE ROULÉE RHODONITE PÉROU', '0172', '3.00', 'lot de 7', NULL, 1, NULL, 8, 16),
(173, 'PIERRE ROULÉE SERPENTINE CHINE', '0173', '5.00', 'lot de 11', NULL, 1, NULL, 8, 15),
(174, 'PIERRE ROULÉE SERPENTINE CHINE', '0174', '4.00', 'lot de 10', NULL, 1, NULL, 8, 15),
(175, 'PIERRE ROULÉE JASPE MOKAITE', '0175', '5.00', 'lot de 12', NULL, 1, NULL, 8, 19),
(176, 'PIERRE ROULÉE JASPE MOKAITE', '0176', '4.00', 'lot de 11', NULL, 1, NULL, 8, 19),
(177, 'PIERRE ROULÉE HOWLITE', '0177', '3.00', 'lot de 14', NULL, 1, NULL, 8, 21),
(178, 'PIERRE ROULÉE HOWLITE', '0178', '4.00', 'lot de 17', NULL, 1, NULL, 8, 21),
(179, 'PIERRE ROULÉE HOWLITE', '0179', '5.00', 'lot de 8', NULL, 1, NULL, 8, 21),
(180, 'PIERRE ROULÉE AVENTURINE VERTE', '0180', '2.00', 'lot de 15', NULL, 1, NULL, 8, 18),
(181, 'PIERRE ROULÉE AVENTURINE VERTE', '0181', '1.00', 'lot de 71', NULL, 1, NULL, 8, 18),
(182, 'PIERRE ROULÉE DUMORTIERITE', '0182', '4.00', 'lot de 25', NULL, 1, NULL, 8, 20),
(183, 'PIERRE ROULÉE DUMORTIERITE', '0183', '3.00', 'lot de 21', NULL, 1, NULL, 8, 20),
(184, 'PIERRE ROULÉE HEMATITE', '0184', '4.00', 'lot de 11', NULL, 1, NULL, 8, 24),
(185, 'PIERRE ROULÉE HEMATITE', '0185', '3.00', 'lot de 22', NULL, 1, NULL, 8, 24),
(186, 'PIERRE ROULÉE OBSIDIENNE DES NEIGES', '0186', '5.00', 'lot de 10', NULL, 1, NULL, 8, 22),
(187, 'PIERRE ROULÉE OBSIDIENNE DES NEIGES', '0187', '3.00', 'lot de 40', NULL, 1, NULL, 8, 22),
(188, 'GALET LABRADORITE', '0188', '8.00', 'lot de 2', NULL, 1, NULL, 8, 2),
(189, 'GALET LABRADORITE', '0189', '7.00', 'lot de 7', NULL, 1, NULL, 8, 2),
(190, 'GALET LABRADORITE', '0190', '6.00', 'lot de 4', NULL, 1, NULL, 8, 2),
(191, 'GALET LABRADORITE', '0191', '5.00', 'lot de 2', NULL, 1, NULL, 8, 2),
(192, 'GALET OPALE VERT', '0192', '14.00', 'lot de 4', NULL, 1, NULL, 8, 23),
(193, 'GALET OPALE VERT', '0193', '10.00', 'lot de 7', NULL, 1, NULL, 8, 23),
(194, 'NAUTILE GRAND', '0194', '30.00', NULL, NULL, 1, NULL, 13, 32),
(195, 'NAUTILE PETIT', '0195', '12.00', NULL, NULL, 1, NULL, 13, 32),
(196, 'NAUTILE POLIE MADAGASCAR BRUT', '0196', '4.00', 'lot de 10', NULL, 1, NULL, 13, 32),
(197, 'AMMONITE MADAGASCAR BRUT MOYEN', '0197', '5.00', NULL, NULL, 1, NULL, 13, 32),
(198, 'AMMONITE MADAGASCAR GRAND', '0198', '15.00', NULL, NULL, 1, NULL, 13, 32),
(199, 'AMMONITE TRACTEUR DOUVILLEICERAS MADAGASCAR', '0199', '10.00', NULL, NULL, 1, NULL, 13, 32),
(200, 'DENTRITE PETITE', '0200', '36.00', NULL, NULL, 1, NULL, 13, 32),
(201, 'DENTRITE GRANDE', '0201', '44.00', NULL, NULL, 1, NULL, 13, 32),
(202, 'POINTE QUARTZ MADAGASCAR', '0202', '15.00', 'lot de 4', NULL, 1, NULL, 14, 25),
(203, 'POINTE QUARTZ MADAGASCAR', '0203', '12.00', 'lot de 21', NULL, 1, NULL, 14, 25),
(204, 'POINTE QUARTZ MADAGASCAR', '0204', '10.00', 'lot de 9', NULL, 1, NULL, 14, 25),
(205, 'POINTE QUARTZ', '0205', '6.00', 'lot de 41', NULL, 1, NULL, 14, 25),
(206, 'POINTE QUARTZ', '0206', '4.00', 'lot de 45', NULL, 1, NULL, 14, 25),
(207, 'POINTE QUARTZ', '0207', '2.00', 'lot de 19', NULL, 1, NULL, 14, 25),
(208, 'MOLDAVITE', '0208', '65.00', NULL, NULL, 1, NULL, 12, 32),
(209, 'MOLDAVITE', '0209', '40.00', NULL, NULL, 1, NULL, 12, 32),
(210, 'MOLDAVITE', '0210', '25.00', NULL, NULL, 1, NULL, 12, 32),
(211, 'METEORITE ARGENTINE', '0211', '25.00', 'lot de 4', NULL, 1, NULL, 12, 32),
(212, 'FOSSILE PLAQUE POISSON', '0212', '110.00', NULL, NULL, 1, NULL, 13, 32),
(213, 'ANIMAL CHOUETTE ONYX', '0213', '5.00', 'lot de 12', NULL, 1, NULL, 6, 6),
(214, 'ANIMAL HIBOU ONYX', '0214', '5.00', 'lot de 12', NULL, 1, NULL, 6, 6),
(215, 'GRENAT SPESSARTITE', '0215', '35.00', NULL, NULL, 1, NULL, 12, 41),
(216, 'MIMETITE MEXIQUE', '0216', '13.00', NULL, NULL, 1, NULL, 12, 32),
(217, 'SANIDITE ORTHOSE (GEMME)', '0217', '10.00', NULL, NULL, 1, NULL, 12, 32),
(218, 'RHODIZITE', '0218', '10.00', NULL, NULL, 1, NULL, 12, 32),
(219, 'LAMPE EN SEL 2-3Kg', '0219', '30.00', 'lot de 2', NULL, 1, NULL, 4, 34),
(220, 'COLLIER CALCITE ORANGE 8mm', '0220', '45.00', NULL, NULL, 1, NULL, 2, 3),
(221, 'COLLIER PIERRE DE SOLEIL 8mm', '0221', '62.00', '', NULL, 1, NULL, 2, 3),
(222, 'COLLIER 42cm PIERRE DE SOLEIL 6mm', '0222', '50.00', NULL, NULL, 1, NULL, 2, 3),
(223, 'BRACELET MULTI RANG GRENAT', '0223', '24.00', 'lot de 2', NULL, 1, NULL, 1, 41),
(224, 'BRACELET KUNZITE', '0224', '39.00', NULL, NULL, 1, NULL, 1, 42),
(225, 'BRACELET PHRENITE', '0225', '38.00', NULL, NULL, 1, NULL, 1, 38),
(226, 'COLLIER 45cm-5mm LABRADORITE ARGENT 0,925', '0226', '48.00', 'lot de 2', NULL, 1, NULL, 2, 2),
(227, 'PENDENTIF QUARTZ RUTILE GOUTE ARGENT 0,925', '0227', '37.00', 'lot de 2', NULL, 1, NULL, 3, 25),
(228, 'PENDENTIF AMETHYSTE TRAPICHE(AFS) ARGENT 0,925', '0228', '30.00', NULL, NULL, 1, NULL, 3, 7),
(229, 'PENDENTIF LABRADORITE GOUTTE ARGENT 0,925', '0229', '82.00', 'lot de 2', NULL, 1, NULL, 3, 2),
(230, 'PENDENTIF CHRYSOCOLLE GOUTTE ARGENT 0,925', '0230', '39.00', NULL, NULL, 1, NULL, 3, 27),
(231, 'PENDENTIF PHRENITE GOUTTE ARGENT 0,925', '0231', '49.00', NULL, NULL, 1, NULL, 3, 38),
(232, 'PENDENTIF RUBIS GOUTTE ARGENT 0,925', '0232', '58.00', NULL, NULL, 1, NULL, 3, 32),
(233, 'JEU ECHEC ONYX', '0233', '150.00', NULL, NULL, 1, NULL, 18, 6),
(234, 'VEUILLEUSE EN SEL', '0234', '24.00', NULL, NULL, 1, NULL, 4, 34),
(235, 'BONZAI AMETHYSTE PETIT', '0235', '35.00', NULL, NULL, 1, NULL, 9, 7),
(236, 'BONZAI AMETHYSTE GRAND BRESIL', '0236', '95.00', NULL, NULL, 1, NULL, 9, 7),
(237, 'COLLIER AMAZONITE 4mm', '0237', '60.00', NULL, NULL, 1, NULL, 2, 40),
(238, 'BRACELET APATITE BLEU 4mm', '0238', '45.00', NULL, NULL, 1, NULL, 1, 48),
(239, 'COLLIER AMETHYSTE 4mm', '0239', '25.00', NULL, NULL, 1, NULL, 2, 7),
(240, 'CHAINE ARGENT + BILLE LABRADORITE', '0240', '45.00', NULL, NULL, 1, NULL, 2, 2),
(241, 'CHAINE ARGENT + BILLE AMETHYSTE', '0241', '50.00', NULL, NULL, 1, NULL, 2, 7),
(242, 'BRACELET 6mm CHAINE DOUBLE + 7 PERLES LABRADORITE', '0242', '50.00', NULL, NULL, 1, NULL, 1, 2),
(243, 'BRACELET 3 RANG AMETHYSTE ARGENT 0,925', '043', '50.00', NULL, NULL, 1, NULL, 1, 7),
(244, 'BONZAI PYRITE', '0244', '20.00', NULL, NULL, 1, NULL, 9, 32),
(245, 'DÉ A JOUER', '0245', '35.00', 'lot de 2x12', NULL, 1, NULL, 18, 32),
(246, 'GEODE CITRINE', '0246', '500.00', NULL, NULL, 1, NULL, 17, 44),
(247, 'LAMPE SEL ROND', '0247', '70.00', NULL, NULL, 1, NULL, 4, 34),
(248, 'BONZAI AMBRE', '0248', '65.00', 'lot de 2', NULL, 1, NULL, 9, 32),
(249, 'SOCLE LED EN BOIS', '0249', '25.00', 'lot de 2', NULL, 1, NULL, 19, 32),
(250, 'PENDENTIF RUBIS GOUTTE ARGENT 0,925', '0250', '48.00', NULL, NULL, 1, NULL, 3, 32),
(251, 'TRANCHE D\'AGATE', '0251', '2.00', 'lot de 78', NULL, 1, NULL, 15, 13),
(252, 'DÉ A JOUER - UNITÉ', '0252', '5.00', NULL, NULL, 1, NULL, 18, 32),
(253, 'PIERRE ROULÉE LABRADORITE', '0253', '8.00', NULL, NULL, 1, NULL, 8, 2),
(254, 'BRACELET PHRENITE - 8mm', '0254', '38.00', NULL, NULL, 1, NULL, 1, 38),
(255, 'PENDENTIF RHODONITE', '0255', '6.00', NULL, NULL, 1, NULL, 3, 16),
(256, 'PENDENTIF LAPIS LAZULI', '0256', '9.00', NULL, NULL, 1, NULL, 3, 11),
(257, 'PENDENTIF QUARTZ', '0257', '8.00', NULL, NULL, 1, NULL, 3, 25),
(258, 'PENDENTIF LAPIS LAZULI', '0258', '4.00', NULL, NULL, 1, NULL, 3, 11),
(259, 'PENDENTIF QUARTZ', '0259', '5.00', NULL, NULL, 1, NULL, 3, 25),
(260, 'PENDENTIF MALACHITE', '0260', '11.00', NULL, NULL, 1, NULL, 3, 4),
(261, 'LAPIN QUARTZ ROSE', '0261', '16.00', NULL, NULL, 1, NULL, 6, 9),
(262, 'BRACELET CELESTINE', '0262', '32.00', NULL, NULL, 1, NULL, 1, 30),
(263, 'COEUR SELENITE', '0263', '8.00', NULL, NULL, 1, NULL, 16, 31),
(264, 'ARBRE DE VIE CORNALINE', '0264', '15.00', NULL, NULL, 1, NULL, 9, 33),
(265, 'DAUPHIN ONYX', '0265', '14.00', NULL, NULL, 1, NULL, 6, 6),
(266, 'PIERRE ROULEE CORNALINE', '0266', '5.00', NULL, NULL, 1, NULL, 8, 33),
(267, 'PENDENTIF AMETHYSTE 2 TROUS', '0267', '10.00', NULL, NULL, 1, NULL, 3, 7),
(268, 'PENDENTIF QUARTZ ROSE + PORTE PIERRE', '0268', '10.00', NULL, NULL, 1, NULL, 3, 9),
(269, 'ARBRE DE VIE', '0269', '15.00', NULL, NULL, 1, NULL, 9, 32),
(270, 'PENDENTIF QUARTZ', 270, 8.00, NULL, NULL, 1, NULL, 3, 25),
(271, 'PENDENTIF RHODONITE', 271, 11.00, NULL, NULL, 1, NULL, 3, 16),
(272, 'CHAINE ARGENT', 272, 28.00, NULL, NULL, 1, NULL, 21, 32),
(273, 'PENDENTIF LABRADORITE', 273, 9.00, NULL, NULL, 1, NULL, 3, 2),
(274, 'COLLIER QUARTZ ROSE', 274, 29.00, NULL, NULL, 1, NULL, 2, 9),
(275, 'COLLIER AMETHYSTE', 275, 49.00, NULL, NULL, 1, NULL, 3, 18),
(276, 'AMETHYSTE', 276, 25.00, NULL, NULL, 1, NULL, 17, 7),
(277, 'PENDENTIF AVENTURINE VERTE', 277, 8.00, NULL, NULL, 1, NULL, 3, 18),
(278, 'POT DE SEL S', 278, 2.00, NULL, NULL, 1, NULL, 21, 34),
(279, 'PENDENTIF CAGE CALCITE', 279, 10.00, NULL, NULL, 1, NULL, 3, 3),
(280, 'OISEAU', 280, 100.00, NULL, NULL, 1, NULL, 11, 32),
(281, 'ANGE', 281, 49.00, NULL, NULL, 1, NULL, 11, 32),
(282, 'MASSEUR', 282, 34.00, NULL, NULL, 1, NULL, 24, 32),
(283, 'PLAQUE SPIRALE', 283, 5.00, NULL, NULL, 1, NULL, 3, 32),
(284, 'BRACELET APATITE', 284, 23.00, NULL, NULL, 1, NULL, 1, 48),
(285, 'COEUR S', 285, 6.00, NULL, NULL, 1, NULL, 22, 32),
(286, 'COEUR SELENITE', 286, 8.00, NULL, NULL, 1, NULL, 22, 31),
(287, 'PENDENTIF SPIRALE', 287, 10.00, NULL, NULL, 1, NULL, 3, 32),
(288, 'BRACELET AMETHYSTE', 288, 16.00, NULL, NULL, 1, NULL, 1, 7),
(289, 'PETIT DAUPHIN', 289, 5.00, NULL, NULL, 1, NULL, 6, 50),
(290, 'BAGUE HEMATITE', 290, 4.00, NULL, NULL, 1, NULL, 23, 24),
(291, 'GEODE QUARTZ', 291, 15.00, NULL, NULL, 1, NULL, 17, 25),
(292, 'COEUR SELENITE', 292, 11.00, NULL, NULL, 1, NULL, 22, 31),
(293, 'BRACELET LABRADORITE', 293, 40.00, NULL, NULL, 1, NULL, 1, 2),
(294, 'BRACELET AMAZONITE - PIERRE DE LUNE', 294, 35.00, NULL, NULL, 1, NULL, 1, 47),
(295, 'PENDENTIF CAGE', 295, 11.00, NULL, NULL, 1, NULL, 3, 32),
(296, 'PENDENTIF AMETHYSTE', 296, 15.00, NULL, NULL, 1, NULL, 3, 7),
(297, 'POT DE SEL L', 297, 4.00, NULL, NULL, 1, NULL, 21, 34),
(298, 'POT DE SEL M', 298, 2.50, NULL, NULL, 1, NULL, 21, 34),
(299, 'PENDENTIF CAGE', 299, 10.00, NULL, NULL, 1, NULL, 3, 32),
(300, 'BRACELET LAPIS LAZULI', 300, 23.00, NULL, NULL, 1, NULL, 1, 11),
(301, 'PENDENTIF CAGE', 301, 6.00, NULL, NULL, 1, NULL, 3, 32),
(302, 'PENDENTIF CAGE', 302, 4.00, NULL, NULL, 1, NULL, 3, 32),
(303, 'BRACELET TOURMALINE', 303, 24.00, NULL, NULL, 1, NULL, 1, 10),
(304, 'BRACELET AVENTURINE', 304, 18.00, NULL, NULL, 1, NULL, 1, 18),
(305, 'COEUR', 305, 7.00, NULL, NULL, 1, NULL, 22, 32),
(306, 'PENDENTIF ANGE', 306, 17.00, NULL, NULL, 1, NULL, 3, 32),
(307, 'COEUR SELENITE', 307, 12.00, NULL, NULL, 1, NULL, 16, 31),
(308, 'PLAQUE SELENITE 7 CHAKRAS', 308, 15.00, NULL, NULL, 1, NULL, 16, 31),
(309, 'PENDENTIF CAGE', 309, 9.00, NULL, NULL, 1, NULL, 3, 32),
(310, 'GUA SHA', 310, 19.00, NULL, NULL, 1, NULL, 24, 32),
(311, 'GUA SHA', 311, 22.00, NULL, NULL, 1, NULL, 24, 32),
(312, 'PENDENTIF COEUR AMETHYSTE', 312, 13.00, NULL, NULL, 1, NULL, 3, 7),
(313, 'POINTE QUARTZ', 313, 5.00, NULL, NULL, 1, NULL, 14, 25),
(314, 'PENDENTIF CROIX', 314, 12.00, NULL, NULL, 1, NULL, 3, 32),
(315, 'COEUR OPALE VERTE', 315, 18.00, NULL, NULL, 1, NULL, 22, 23),
(316, 'PETIT ANGE', 316, 16.50, NULL, NULL, 1, NULL, 11, 32),
(317, 'PENDENTIF AMBRE', 317, 6.00, NULL, NULL, 1, NULL, 3, 51),
(318, 'BOUCLE OREILLES QUARTZ', 318, 12.00, NULL, NULL, 1, NULL, 25, 25),
(319, 'BRACELET AGATE BOSTWANA', 319, 12.00, NULL, NULL, 1, NULL, 1, 14),
(320, 'COEUR OPALE VERTE', 320, 9.00, NULL, NULL, 1, NULL, 22, 23),
(321, 'BOUCLE OREILLES AMETHYSTE', 321, 51.00, NULL, NULL, 1, NULL, 25, 7),
(322, 'AMBRE MINERAL INSECTE', 322, 34.00, NULL, NULL, 1, NULL, 21, 51),
(323, 'COLLIER AMBRE', 318, 12.00, NULL, NULL, 1, NULL, 2, 51),
(324, 'CHAINE ARGENT', 324, 25.00, NULL, NULL, 1, NULL, 21, 32),
(325, 'BRACELET QUARTZ', 325, 25.00, NULL, NULL, 1, NULL, 1, 25),
(326, 'BOUCLE OREILLES PIERRE DE SOLEIL', 326, 14.00, NULL, NULL, 1, NULL, 25, 49),
(327, 'AGATE TRANCHE', 327, 3.00, NULL, NULL, 1, NULL, 15, 13),
(328, 'CORNALINE', 328, 4.00, NULL, NULL, 1, NULL, 8, 33),
(329, 'CORNALINE', 329, 3.00, NULL, NULL, 1, NULL, 8, 33),
(330, 'PENDULE CRISTAL DE ROCHE', 330, 9.00, NULL, NULL, 1, NULL, 21, 12),
(331, 'PENDENTIF TOURMALINE', 331, 14.00, NULL, NULL, 1, NULL, 3, 10),
(332, 'ARBRE DE VIE AMETHYSTE', 332, 95.00, NULL, NULL, 1, NULL, 9, 7),
(333, 'CORDON', 333, 1.00, NULL, NULL, 1, NULL, 21, 32),
(334, 'CORNALINE', 334, 1.00, NULL, NULL, 1, NULL, 8, 33),
(335, 'AMETHYSTE', 335, 9.00, NULL, NULL, 1, NULL, 8, 7),
(336, 'METEORITE', 336, 45.00, NULL, NULL, 1, NULL, 12, 32),
(337, 'BRACELET PHRENITE', 337, 25.00, NULL, NULL, 1, NULL, 1, 38),
(338, 'COEUR AGATE FLEUR', 338, 31.00, NULL, NULL, 1, NULL, 22, 13),
(339, 'COEUR SEPTARIA', 339, 15.00, NULL, NULL, 1, NULL, 22, 32),
(340, 'CALCITE', 340, 3.00, NULL, NULL, 1, NULL, 8, 3),
(341, 'CORNALINE', 341, 2.00, NULL, NULL, 1, NULL, 8, 33),
(342, 'CRISTAL DE ROCHE', 342, 1.00, NULL, NULL, 1, NULL, 8, 12),
(343, 'COLLIER AVENTURINE VERTE', 343, 27.00, NULL, NULL, 1, NULL, 2, 18),
(344, 'BRACELET NACRE', 344, 27.00, NULL, NULL, 1, NULL, 1, 37),
(345, 'BRACELET MALACHITE', 345, 36.00, NULL, NULL, 1, NULL, 1, 4),
(346, 'LAMPE ARBRE DE VIE', 346, 65.00, NULL, NULL, 1, NULL, 4, 34),
(347, 'BRACELET LAPIS LAZULI', 347, 18.00, NULL, NULL, 1, NULL, 1, 11),
(348, 'BRACELET AGATE', 348, 29.00, NULL, NULL, 1, NULL, 1, 13),
(349, 'BRACELET QUARTZ ROSE HEMATOIDE', 349, 10.00, NULL, NULL, 1, NULL, 1, 9),
(350, 'ANGE', 350, 15.00, NULL, NULL, 1, NULL, 11, 32),
(351, 'HEMATITE', 351, 5.00, NULL, NULL, 1, NULL, 8, 24),
(352, 'BRACELET LABRADORITE', 352, 24.00, NULL, NULL, 1, NULL, 1, 2),
(353, 'AMETHYSTE', 353, 2.00, NULL, NULL, 1, NULL, 8, 7),
(354, 'PRESENTOIR OEUF', 354, 1.50, NULL, NULL, 1, NULL, 21, 32),
(355, 'BRACELET ORIL DE TIGRE / TAUREAU', 355, 21.00, NULL, NULL, 1, NULL, 1, 47),
(356, 'COEUR CALCITE BLEU', 356, 24.00, NULL, NULL, 1, NULL, 22, 3),
(357, 'LAMPE SEL FLAMME', 357, 33.00, NULL, NULL, 1, NULL, 4, 34),
(358, 'BRACELET LAVE', 358, 12.00, NULL, NULL, 1, NULL, 1, 52),
(359, 'ELEPHANT', 359, 6.00, NULL, NULL, 1, NULL, 6, 50),
(360, 'BRACELET AGATE MOUSSE + AGATE', 360, 26.00, NULL, NULL, 1, NULL, 1, 13),
(361, 'BRACELET QUARTZ TOURMALINE', 361, 15.00, NULL, NULL, 1, NULL, 1, 47),
(362, 'BRACELET MOKAITE', 362, 12.00, NULL, NULL, 1, NULL, 1, 19),
(363, 'PENDENTIF AIGUE MARINE', 363, 50.00, NULL, NULL, 1, NULL, 3, 45),
(364, 'COEUR QUARTZ ROSE', 364, 7.00, NULL, NULL, 1, NULL, 22, 9),
(365, 'COEUR LABRADORITE', 365, 7.00, NULL, NULL, 1, NULL, 22, 2);





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
(1, 'BONNIER', 'Pierre-Louis', 'plb', '$2y$10$GPQXZTxzx.tVDxrAgeHf7uiAGJBNIoVWrZ24rIlAGxNl3iO/3bkjC', 1);

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
