-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Jeu 07 Février 2013 à 22:41
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `kofaviv`
--

-- --------------------------------------------------------

--
-- Structure de la table `branchsite`
--

CREATE TABLE IF NOT EXISTS `branchsite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street_address` varchar(250) CHARACTER SET utf8 NOT NULL,
  `longitude` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `latitude` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `site_phone` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `branch_name` varchar(250) CHARACTER SET utf8 NOT NULL,
  `organisation` int(11) NOT NULL,
  `quartier` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_branchsite_organisation` (`organisation`),
  KEY `fk_branchsite_neighbourhood1` (`quartier`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `branchsite`
--

INSERT INTO `branchsite` (`id`, `street_address`, `longitude`, `latitude`, `url`, `site_phone`, `branch_name`, `organisation`, `quartier`) VALUES
(1, 'Rue Nicolas', '', '', '', '', 'MSF en Ville', 1, 115),
(3, 'Leogane Rue Anacaona', '', '', '', '', 'MSF Leogane', 1, 802);

-- --------------------------------------------------------

--
-- Structure de la table `branchsite_has_category`
--

CREATE TABLE IF NOT EXISTS `branchsite_has_category` (
  `category` int(11) NOT NULL,
  `branchsite` int(11) NOT NULL,
  PRIMARY KEY (`category`,`branchsite`),
  KEY `fk_category_has_branchsite_branchsite1` (`branchsite`),
  KEY `fk_category_has_branchsite_category1` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `branchsite_has_category`
--

INSERT INTO `branchsite_has_category` (`category`, `branchsite`) VALUES
(1, 1),
(2, 1),
(1, 3),
(2, 3),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name_UNIQUE` (`category_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`id`, `category_name`, `description`) VALUES
(1, 'Health', ''),
(2, 'Police', ''),
(3, 'Aide Psy', 'Any describtion');

-- --------------------------------------------------------

--
-- Structure de la table `commune`
--

CREATE TABLE IF NOT EXISTS `commune` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `longitude` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `latitude` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `departement` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_commune_departement1` (`departement`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=147 ;

--
-- Contenu de la table `commune`
--

INSERT INTO `commune` (`id`, `longitude`, `latitude`, `name`, `departement`) VALUES
(1, '18.53917', '-72.33917', 'Port-au-Prince', 1),
(2, '18.50583', '-72.28927', 'Pétion-Ville', 1),
(3, '18.583056', '-72.335', 'Cite Soleil', 1),
(4, '18.55583', '-72.33583', 'Delmas', 1),
(5, '18.576111', '-72.226944', 'Croix-des-bouquets', 1),
(6, '18.583333', '-72.266667', 'Tabarre', 1),
(7, '18.53917', '-72.50483', 'Carrefour', 1),
(8, '18.650071', '-74.306688', 'ABRICOT', 8),
(9, '19.680841', '-72.317793', 'ACUL-DU-NORD', 3),
(10, '18.500393', '-73.345816', 'ANSE A VEAU', 10),
(11, '18.48497', '-74.450737', 'ANSE D''HAINAULT', 8),
(12, '19.633333', '-73.05', 'ANSE ROUGE', 5),
(13, '18.833333', '-72.866667', 'ANSE-À-GALETS', 1),
(14, '18.05', '-71.75', 'ANSE-À-PITRE', 2),
(15, '18.27997', '-73.399582', 'AQUIN', 7),
(16, '18.770338', '-72.513088', 'ARCAHAIE', 1),
(17, '18.45', '-73.383333', 'ARNAUD', 10),
(18, '18.15', '-73.883333', 'ARNIQUET', 7),
(19, '19.469444', '-72.114722', 'BAHON', 3),
(20, '19.665981', '-73.212396', 'BAIE DE HENNE', 9),
(21, '18.185522', '-72.755525', 'BAINET', 2),
(22, '18.499854', '-73.65031', 'BARADÈRES', 10),
(23, '19.744444', '-72.350352', 'BAS LIMBÉ', 3),
(24, '19.783333', '-72.8', 'BASSIN BLEU', 9),
(25, '18.479861', '-73.952882', 'BEAUMONT', 8),
(26, '18.852469', '-71.81859', 'BELLADÈRE', 6),
(27, '18.238217', '-72.069037', 'BELLE-ANSE', 2),
(28, '19.687099', '-73.338951', 'BOMBARDOPOLIS', 9),
(29, '18.666332', '-74.24361', 'BONBON', 8),
(30, '19.85', '-72.533333', 'BORGNE', 3),
(31, '18.977691', '-72.235639', 'BOUCAN CARRÉ', 6),
(32, '18.733333', '-72.416667', 'CABARET', 1),
(33, '18.316667', '-73.866667', 'CAMP-PERRIN', 7),
(34, '19.75622', '-72.199669', 'CAP-HAITIEN', 3),
(35, '19.447602', '-71.692549', 'CAPOTILLE', 4),
(36, '19.692574', '-72.017927', 'CARACOL', 4),
(37, '19.378967', '-71.831932', 'CARICE', 4),
(38, '18.29961', '-73.658943', 'CAVAILLON', 7),
(39, '18.2', '-73.75', 'CAYES', 7),
(40, '18.266667', '-72.666667', 'CAYES-JACMEL', 2),
(41, '19.267771', '-71.933998', 'CERCA CARVAJAL', 6),
(42, '19.16415', '-71.788937', 'CERCA LA SOURCE', 6),
(43, '18.55432', '-74.373043', 'CHAMBELLAN', 8),
(44, '19.884072', '-72.826438', 'CHANSOLME', 9),
(45, '18.20286', '-73.88748', 'CHANTAL', 7),
(46, '18.274651', '-74.164365', 'CHARDONNIERES', 7),
(48, '18.568005', '-73.889685', 'CORAIL', 8),
(49, '18.679494', '-71.940875', 'CORNILLON', 1),
(50, '18.207261', '-74.040294', 'COTEAUX', 7),
(51, '18.19294', '-72.997101', 'CÔTE-DE-FER', 2),
(52, '18.561489', '-74.419586', 'DAME-MARIE', 8),
(53, '19.28935', '-72.641726', 'DESDUNES', 5),
(54, '19.261556', '-72.519004', 'DESSALINES', 5),
(55, '19.526965', '-72.243781', 'DONDON', 3),
(56, '19.483333', '-72.483333', 'ENNERY', 5),
(57, '19.616667', '-71.783333', 'FERRIER', 4),
(58, '19.616667', '-71.783333', 'FONDS-DES-NEGRES', 10),
(59, '18.39716', '-71.852686', 'FONDS-VERRETTES', 1),
(60, '19.666667', '-71.833333', 'FORT-LIBERTÉ', 4),
(61, '18.533333', '-71.066667', 'GANTHIER', 1),
(62, '19.45', '-72.683333', 'GONAIVES', 5),
(63, '18.55', '-73.6', 'GRAND BOUCAN', 10),
(64, '18.187434', '-71.920127', 'GRAND GOSIER', 2),
(65, '18.187434', '-71.920127', 'GRANDE SALINE', 5),
(66, '19.57973', '-72.16975', 'GRANDE-RIVIERE DU NORD', 3),
(67, '18.428889', '-72.770556', 'GRAND-GOÂVE', 1),
(68, '18.538282', '-72.529356', 'GRESSIER', 1),
(69, '19.671895', '-72.677776', 'GROS-MORNE', 5),
(70, '19.143431', '-72.003891', 'HINCHE', 6),
(71, '18.067608', '-73.63596', 'ÎLE-À-VACHE', 7),
(72, '18.238072', '-72.53405', 'JACMEL', 2),
(73, '19.869059', '-73.196173', 'JEAN-RABEL', 9),
(74, '18.65', '-74.116667', 'JEREMIE', 8),
(75, '18.45', '-72.283333', 'KENSCOFF', 1),
(76, '18.9097', '-72.309982', 'LA CHAPELLE', 5),
(77, '20.054868', '-72.792461', 'LA TORTUE', 9),
(78, '18.266667', '-72.666667', 'LA VALLÉE DE JACMEL', 2),
(79, '19.3353', '-72.021631', 'LA VICTOIRE', 3),
(80, '18.829444', '-71.936389', 'LASCAHOBAS', 6),
(81, '18.374889', '-73.424606', 'L''ASILE', 10),
(82, '18.510833', '-72.633889', 'LÉOGÂNE', 1),
(83, '18.30868', '-74.21489', 'LES ANGLAIS', 7),
(84, '18.405579', '-74.453295', 'LES IROIS', 8),
(85, '19.333333', '-72.666667', 'L''ESTÈRE', 5),
(86, '19.70594', '-72.402489', 'LIMBÉ', 3),
(87, '19.668603', '-72.126803', 'LIMONADE', 3),
(88, '19.176558', '-72.138651', 'MAÏSSADE', 6),
(89, '18.35', '-73.766667', 'MANICHE', 7),
(90, '18.233333', '-72.316667', 'MARIGOT', 2),
(91, '19.508381', '-72.344432', 'MARMELADE', 5),
(92, '19.604692', '-72.218596', 'MILOT', 3),
(93, '18.445833', '-73.09', 'MIRAGOÂNE', 10),
(94, '18.833333', '-72.105278', 'MIREBALAIS', 6),
(95, '19.804488', '-73.372343', 'MOLE SAINT-NICOLAS', 9),
(96, '19.366667', '-71.983333', 'MOMBIN CROCHU', 4),
(97, '19.406401', '-71.782112', 'MONT-ORGANISÉ', 4),
(98, '18.562361', '-74.267817', 'MORON', 8),
(99, '19.550989', '-71.724449', 'OUANAMINTHE', 4),
(100, '18.416667', '-73.15', 'PAILLANT', 10),
(101, '19.523059', '-71.923832', 'PERCHES', 4),
(102, '18.540403', '-73.796322', 'PESTEL', 8),
(103, '18.475124', '-73.233041', 'PETITE RIVIÈRE DE NIPPES', 10),
(104, '19.122592', '-72.47759', 'PETITE-RIVIÈRE DE L''ARTIBONITE', 5),
(105, '18.433519', '-72.861649', 'PETIT-GOÂVE', 1),
(106, '18.526416', '-73.507875', 'PETIT-TROU DE NIPPES', 10),
(107, '19.33769', '-72.116661', 'PIGNON', 3),
(108, '19.666667', '-72.55', 'PILATE', 3),
(109, '19.676047', '-72.270428', 'PLAINE DU NORD', 3),
(110, '19.598644', '-72.471674', 'PLAISANCE', 3),
(111, '18.433333', '-73.616667', 'PLAISANCE DU SUD', 10),
(112, '18.785557', '-73.061926', 'POINTE-À-RAQUETTE', 1),
(113, '18.093912', '-73.925695', 'PORT SALUT', 7),
(114, '18.250213', '-74.096834', 'PORT-À-PIMENT', 7),
(115, '19.939679', '-72.831214', 'PORT-DE-PAIX', 9),
(116, '19.751717', '-72.429513', 'PORT-MARGOT', 3),
(117, '18.798056', '-71.783611', 'QUARTIER DE BAPTISTE', 6),
(118, NULL, NULL, 'QUARTIER DE LA CAHÔANNE', 7),
(119, '19.141002', '-71.941616', 'QUARTIER DE LOS PALIS', 6),
(120, NULL, NULL, 'QUARTIER DE MARBIAL', 2),
(121, '19.412967', '-72.080888', 'RANQUITTE', 3),
(122, '18.183333', '-74', 'ROCHE A BATEAU', 7),
(123, '18.6', '-74.016667', 'ROSEAUX', 8),
(124, '19.933333', '-72.716667', 'SAINT LOUIS DU NORD', 9),
(125, '19.583333', '-72.083333', 'SAINTE SUZANNE', 4),
(126, '19.108931', '-72.697548', 'SAINT MARC', 5),
(127, '19.770596', '-72.353312', 'SAINT MICHEL', 5),
(128, '18.816667', '-72.2', 'SAUT D''EAU', 6),
(129, '18.083333', '-73.816667', 'SAINT JEAN DU SUD', 7),
(130, '18.261864', '-73.54837', 'SAINT LOUIS DU SUD', 7),
(131, '19.439167', '-72.199722', 'SAINT RAPHAEL', 3),
(132, '18.285378', '-73.55426', 'TERRE NEUVE', 5),
(133, '18.244671', '-71.840393', 'THIOTTE', 2),
(134, '19.083333', '-71.833333', 'THOMASSIQUE', 6),
(135, '18.652248', '-72.092737', 'THOMAZEAU', 1),
(136, '18.999689', '-71.95273', 'THOMONDE', 6),
(137, '18.324366', '-74.396133', 'TIBURON', 7),
(138, '18.16465', '-73.811028', 'TORBECK', 7),
(139, '19.612394', '-72.026076', 'TROU DU NORD', 4),
(140, '19.433333', '-71.916667', 'VALLIERRE', 4),
(141, '19.05', '-72.466667', 'VERRETTES', 5),
(142, '18.683333', '-72.05', 'SAVANETTE', 6),
(143, '19.63418', '-71.955559', 'TERRIER ROUGE', 4),
(144, '18.495996', '-73.00323', 'LA GONAVE', 1),
(146, '0', '0', 'MARCHAND-DESSALINES', 5);

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `organisation` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contact_organisation1` (`organisation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `contact`
--

INSERT INTO `contact` (`id`, `name`, `phone`, `email`, `organisation`) VALUES
(1, 'Jean Pierre', '50946012959', 'jcpoulard@gmail.com', 1);

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE IF NOT EXISTS `departement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `longitude` varchar(45) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `name` varchar(250) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `departement`
--

INSERT INTO `departement` (`id`, `longitude`, `latitude`, `name`) VALUES
(1, '18.54', '-72.34', 'OUEST'),
(2, '18.27836', '-72.354791', 'SUD''EST'),
(3, '19.568772', '-72.189', 'NORD'),
(4, '19.488972', '-71.857133', 'NORD''EST'),
(5, '19.362902', '-72.425814', 'ARTIBONITE'),
(6, '18.958274', '-72.046816', 'CENTRE'),
(7, '18.332', '-73.700709', 'SUD'),
(8, '18.548926', '-74.07701', 'GRAND''ANSE'),
(9, '19.837401', '-73.040528', 'NORD''OUEST'),
(10, '18.399074', '-73.418021', 'NIPPES');

-- --------------------------------------------------------

--
-- Structure de la table `organisation`
--

CREATE TABLE IF NOT EXISTS `organisation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `acronym` varchar(20) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `present_before_earthquake` tinyint(1) DEFAULT NULL,
  `coverage` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `organisation`
--

INSERT INTO `organisation` (`id`, `name`, `email`, `acronym`, `url`, `present_before_earthquake`, `coverage`) VALUES
(1, 'Medecin Sans Frontieres', '', 'MSF', '', 1, '');

-- --------------------------------------------------------

--
-- Structure de la table `partners`
--

CREATE TABLE IF NOT EXISTS `partners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `presence_before_earthquake` tinyint(1) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `organisation` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_partners_organisation1` (`organisation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `partners`
--

INSERT INTO `partners` (`id`, `presence_before_earthquake`, `name`, `organisation`) VALUES
(1, 1, 'USAID', 1);

-- --------------------------------------------------------

--
-- Structure de la table `quartier`
--

CREATE TABLE IF NOT EXISTS `quartier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `longitude` varchar(45) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `name` varchar(250) CHARACTER SET utf8 NOT NULL,
  `commune` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_neighbourhood_commune1` (`commune`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=803 ;

--
-- Contenu de la table `quartier`
--

INSERT INTO `quartier` (`id`, `longitude`, `latitude`, `name`, `commune`) VALUES
(101, '18.538463', '-72.434974', 'Mariani', 7),
(102, '18.546826', '-72.411886', 'Lamentin', 7),
(103, '18.543978', '-72.404692', 'Mon Repos', 7),
(104, '18.526584', '-72.410513', 'Brochette', 7),
(105, '18.529669', '-72.4045', 'Waney', 7),
(106, '18.528175', '-72.416111', 'Mahotiere', 7),
(107, '18.530247', '-72.389596', 'Thor', 7),
(108, '18.523623', '-72.387251', 'Diquini', 7),
(109, '18.526786', '-72.379632', 'Bizoton', 7),
(110, '18.526529', '-72.359101', 'Martissant', 1),
(111, '18.536111', '-72.345', 'Portail Leogane', 1),
(112, NULL, NULL, 'Les Cites', 1),
(113, '18.546833', '-72.342924', 'Centre Ville', 1),
(114, NULL, NULL, 'Morne-a-Tuff', 1),
(115, '18.534234', '-72.337205', 'Bas Peu de Chose', 1),
(116, '18.541315', '-72.335256', 'Champ-de-mars', 1),
(117, '18.539954', '-72.327838', 'Bois-Verna', 1),
(118, '18.535603', '-72.317036', 'Canape-Vert', 1),
(119, NULL, NULL, 'Saint Gerard', 1),
(120, '18.524018', '-72.351428', 'Bolosse Sous Dalle', 1),
(121, '18.523153', '-72.344973', 'Sanatorium', 1),
(122, NULL, NULL, 'Lelio', 1),
(123, NULL, NULL, 'Debussy', 1),
(124, '18.522766', '-72.338125', 'Carrefour-Feuilles', 1),
(125, '18.523698', '-72.331292', 'Desprez', 1),
(126, '18.535142', '-72.326176', 'Turgeau', 1),
(127, '18.528298', '-72.331274', 'Pacot', 1),
(128, '18.536137', '-72.30555', 'Bourdon', 1),
(129, '18.533087', '-72.291542', 'Musseau', 4),
(130, '18.534921', '-72.296769', 'Musseau', 1),
(131, '18.540633', '-72.301831', 'Delmas 40B', 1),
(132, '18.543793', '-72.307062', 'Delmas 33', 4),
(133, '18.548985', '-72.308491', 'Acra', 1),
(134, '18.541149', '-72.315655', 'Christ-Roi', 1),
(135, '18.545777', '-72.318725', 'Nazon', 1),
(136, '18.548184', '-72.312407', 'Delmas 30', 1),
(137, '18.544368', '-72.324572', 'Poupelard', 1),
(138, '18.542399', '-72.327609', 'Lalue', 1),
(139, '18.545139', '-72.332394', 'Poste-Marchand', 1),
(140, '18.547238', '-72.330031', 'Fort National', 1),
(141, '18.55086', '-72.335796', 'Bel-Air', 1),
(142, '18.557578', '-72.341382', 'Portail St-Joseph', 1),
(143, '18.557511', '-72.337427', 'Saint Martin', 1),
(144, '18.556956', '-72.344267', 'Croix des Bossales', 1),
(145, '18.5241', '-72.367293', 'Fontamara PAP', 1),
(146, '18.549521', '-72.329105', 'Sans Fil', 1),
(147, '18.548509', '-72.322862', 'Solino', 1),
(148, '18.526068', '-72.319628', 'Haut Turgeau', 1),
(149, '18.543776', '-72.398503', 'Arcachon', 7),
(150, '18.541045', '-72.395257', 'Cote plage', 7),
(151, '18.501414', '-72.30107', 'Pelerin', 2),
(152, '18.496312', '-72.318049', 'Laboule', 2),
(153, '18.479335', '-72.311193', 'Thomassin', 2),
(154, '18.509934', '-72.300192', 'Morne Calvaire', 2),
(155, '18.512948', '-72.29341', 'Jalousie', 2),
(156, '18.516058', '-72.302286', 'Deshermites', 2),
(157, '18.516538', '-72.295258', 'Sainte Therese', 2),
(158, '18.519819', '-72.294822', 'Bouc Champagne', 2),
(159, '18.522289', '-72.300218', 'Juvenat', 2),
(160, '18.528306', '-72.297249', 'Montana', 2),
(161, '18.525249', '-72.293563', 'Morne Lazarre', 2),
(162, '18.521063', '-72.2884', 'Nerrette', 2),
(163, '18.520568', '-72.286498', 'Morne Hercule', 2),
(164, '18.523599', '-72.284972', 'Haut Delmas', 2),
(165, '18.531368', '-72.279311', 'Jacquet', 2),
(166, '18.534663', '-72.284927', 'Fragneau-Ville', 2),
(167, '18.528009', '-72.291833', 'Delmas 60', 2),
(168, '18.51377', '-72.286942', 'Petion-Ville CV', 2),
(169, NULL, NULL, 'Berthe', 2),
(170, '18.516912', '-72.274339', 'Peguy-Ville', 2),
(171, '18.507929', '-72.281037', 'Morne Brun', 2),
(172, '18.4989', '-72.283906', 'Montagne Noire', 2),
(173, NULL, NULL, 'Tete-de-leau', 2),
(174, '18.520418', '-72.290645', 'Rue Panamericaine', 2),
(175, '18.526579', '-72.267785', 'Freres', 2),
(176, '18.536453', '-72.263584', 'Bony/Vivy-Mitchel', 2),
(177, '18.528215', '-72.25474', 'Belvil', 2),
(178, '18.538473', '-72.273385', 'Puits Blain', 2),
(179, '18.540533', '-72.256239', 'Bony/Vivy-Mitchel', 4),
(180, '18.547841', '-72.301085', 'Cite Saint Georges', 4),
(181, '18.547255', '-72.250576', 'Torcelle', 4),
(182, '18.541767', '-72.294998', 'Delmas 65', 4),
(183, '18.542071', '-72.291742', 'Delmas 75', 4),
(184, '18.534241', '-72.288154', 'Delmas 83', 4),
(185, '18.545823', '-72.278439', 'Puits Blain', 4),
(186, '18.549705', '-72.286622', 'Bois Caradeux', 4),
(187, '18.55417', '-72.294228', 'Zone Predailler', 4),
(188, '18.555161', '-72.30875', 'Village Lamothe', 4),
(189, '18.558688', '-72.299154', 'Delmas 31', 4),
(190, '18.556738', '-72.321243', 'Cite Saint Martin 2', 4),
(191, '18.554714', '-72.326096', 'Saint Martin', 4),
(192, '18.561041', '-72.330009', 'Aviation Boeing Field', 4),
(193, '18.565749', '-72.325505', 'Cite Militaire', 4),
(194, '18.56767', '-72.328584', 'Chancerelles', 4),
(195, '18.566551', '-72.334141', 'Chancerelles', 3),
(196, '18.579631', '-72.332534', 'Cite Soleil', 3),
(197, '18.584018', '-72.292962', 'Cazeau', 4),
(198, '18.588088', '-72.318823', 'Drouillard', 4),
(199, '18.592119', '-72.307947', 'Sarthe', 4),
(200, '18.592208', '-72.284012', 'Croix-des-Missions', 4),
(201, '18.523301', '-72.37437', 'Fontamara CAR', 7),
(202, '18.552517', '-72.238395', 'Tapage', 4),
(203, '18.539465', '-72.234879', 'Soisson', 2),
(204, NULL, NULL, 'Colofe', 4),
(205, NULL, NULL, 'Mais Gate TAB', 6),
(206, '18.567024', '-72.277453', 'Petite Place Cazeau TAB', 6),
(207, NULL, NULL, 'Mais Gate DEL', 4),
(208, '18.566684', '-72.261777', 'Chateau Blond', 6),
(209, '18.576347', '-72.255471', 'Tabarre', 6),
(210, '18.579562', '-72.291684', 'Zone Aeroport', 6),
(211, '18.598631', '-72.300644', 'Damien', 4),
(212, '18.590912', '-72.266923', 'Clercine', 6),
(213, '18.558228', '-72.260745', 'Caradeux', 6),
(214, '18.554351', '-72.312884', 'Carrefour Aeroport', 4),
(215, '18.546259', '-72.305046', 'Delmas 32', 4),
(216, '18.546619', '-72.310387', 'Acra', 4),
(217, NULL, NULL, 'La Saline / Warf Jeremie', 4),
(218, NULL, NULL, 'Village Democratie / Hasco', 4),
(219, '18.566882', '-72.309656', 'Route Aeroport', 4),
(220, '18.572652', '-72.3148', 'Varreux / Sonapi', 4),
(221, '18.528569', '-72.233649', 'Pernier / Platon', 2),
(222, '18.51839', '-72.232261', 'Pernier', 2),
(223, '18.542079', '-72.299702', 'Delmas 36-48', 4),
(224, '18.559371', '-72.276325', 'Petite Place Cazeau DEL', 4),
(225, '18.550624', '-72.27141', 'Dos Morne', 4),
(226, '18.553246', '-72.347348', 'Bord de Mer', 1),
(227, '18.600659', '-72.265916', 'Santo', 5),
(228, '18.589316', '-72.243247', 'Duval', 5),
(229, '18.581737', '-72.229045', 'Croix-des-Bouquets  CV', 5),
(230, '18.61243', '-72.255079', 'Seguy', 5),
(231, '18.638149', '-72.270055', 'Bon Repos', 5),
(232, '18.609064', '-72.283652', 'Marin', 5),
(233, '18.605982', '-72.222681', 'Beudet', 5),
(234, '18.61191', '-72.234169', 'Cesseles', 5),
(235, '18.624472', '-72.261672', 'Tilot', 5),
(236, '18.622763', '-72.24958', 'Lillavois', 5),
(238, NULL, NULL, '8ème Martissant', 1),
(239, NULL, NULL, '7ème Morne l''Hopital', 1),
(240, NULL, NULL, '6ème Turgeau', 1),
(242, NULL, NULL, '7ème Bellevue Chardonnière', 2),
(243, NULL, NULL, '1ère Montagne Noire', 2),
(244, NULL, NULL, '3ème Etang du Jong', 2),
(245, NULL, NULL, '6ème Aux Cadets', 2),
(246, NULL, NULL, '4ème Bellevue la Montagne', 2),
(248, NULL, NULL, '1ère Varreux', 3),
(250, NULL, NULL, '2ème Petit Bois', 5),
(251, NULL, NULL, '3ème Petit Bois', 5),
(253, NULL, NULL, '2ème Crochus', 5),
(254, NULL, NULL, '10ème des Orangers', 5),
(255, NULL, NULL, '1ère Petit Bois', 5),
(256, NULL, NULL, '3ème Belle Fontaine', 5),
(257, NULL, NULL, '1ère Belle Fontaine', 5),
(258, NULL, NULL, '2ème Belle Fontaine', 5),
(259, NULL, NULL, '2ème Varreux', 5),
(261, NULL, NULL, '1ère Saint martin', 5),
(262, NULL, NULL, '17ème Procy', 7),
(263, NULL, NULL, '9ème Bizoton', 7),
(264, NULL, NULL, '13ème Corail Thor', 7),
(265, NULL, NULL, '16ème Tanfer', 7),
(266, NULL, NULL, '18ème Coupeau', 7),
(267, NULL, NULL, '19ème Bouvier', 7),
(268, NULL, NULL, '10ème Thor', 7),
(269, NULL, NULL, '21ème Berly', 7),
(270, NULL, NULL, '14ème Morne Chandelle', 7),
(271, NULL, NULL, '15ème Platon Dufréné', 7),
(272, '18.521944', '-72.415', '11ème Rivière Froide', 7),
(273, NULL, NULL, '20ème Laval', 7),
(274, NULL, NULL, '22ème Malanga', 7),
(275, '18.649722', '-74.306667', '1e Anse du Clerc', 8),
(276, '18.649722', '-74.306667', '3e Danglise', 8),
(277, '18.649722', '-74.306667', '2e Balisiers', 8),
(278, '18.649722', '-74.306667', '4e La Seringue', 8),
(279, '19.680444', '-72.318683', '4ème Grande Ravine', 9),
(280, '19.680444', '-72.318683', '1ère Coupe à David', 9),
(281, '19.680444', '-72.318683', '1ère Camp louise', 9),
(282, '19.680444', '-72.318683', '2ème Bas de l''Acul', 9),
(283, '19.680444', '-72.318683', '3ème Mornet', 9),
(284, '19.680444', '-72.318683', '6ème Soufrière', 9),
(285, '18.500339', '-73.345647', '1ère Baconnois', 10),
(286, '18.500339', '-73.345647', '7ème Sault de Baril', 10),
(287, '18.500339', '-73.345647', '6ème Grande Rivière', 10),
(288, '18.484011', '-74.450514', '2ème Boudon', 11),
(289, '18.484011', '-74.450514', '1e Grandoit', 11),
(290, '18.484011', '-74.450514', '3e Ilet Pierre à Joseph', 11),
(291, '18.484011', '-74.450514', '4e Mandou', 11),
(292, '19.632167', '-73.055083', '1ère L''Arbre', 12),
(293, '19.632167', '-73.055083', '2ème Sources Chaudes', 12),
(294, '18.830181', '-72.863531', '3ème Grande Source', 13),
(295, '18.830181', '-72.863531', '1ère Palma', 13),
(296, '18.830181', '-72.863531', '10ème Pickmy', 13),
(297, '18.830181', '-72.863531', '2ème Petite Source', 13),
(298, '18.830181', '-72.863531', '11ème Petite Anse', 13),
(299, '18.830181', '-72.863531', '4ème Grand Lagon', 13),
(300, NULL, NULL, '2ème Bois d''Orme', 14),
(301, NULL, NULL, '1ère Boucan Guillaume', 14),
(302, '18.278203', '-73.397869', '6ème La Colline', 15),
(303, '18.278203', '-73.397869', '9ème Fonds des Blancs', 15),
(304, '18.278203', '-73.397869', '2ème Bellevue', 15),
(305, '18.278203', '-73.397869', '5ème Mare à Coiffe', 15),
(306, '18.278203', '-73.397869', '12ème Colline à Mongon', 15),
(307, NULL, NULL, '10ème Guirand', 15),
(308, NULL, NULL, '11ème Frangipane', 15),
(309, NULL, NULL, '3ème Brodequin', 15),
(310, NULL, NULL, '1ère Macéan', 15),
(311, NULL, NULL, '4ème Flamands', 15),
(312, '18.769806', '-72.513333', '2ème des Vases', 16),
(313, '18.769806', '-72.513333', '8ème Montrouis', 16),
(314, '18.769806', '-72.513333', '7ème Fonds Baptiste', 16),
(315, '18.769806', '-72.513333', '6ème des Matheux', 16),
(316, '18.769806', '-72.513333', '5ème Délices', 16),
(317, NULL, '-72.513333', '1ère Boucassin', 16),
(318, NULL, NULL, '3ème Barreau', 17),
(319, NULL, NULL, '1ère Arneau', 17),
(320, NULL, NULL, '2ème Baquet', 17),
(321, NULL, NULL, '3ème Arniquet', 18),
(322, NULL, NULL, '6ème Montagne Noire', 19),
(323, NULL, NULL, '4ème Bois Pin', 19),
(324, NULL, NULL, '5ème Bailly', 19),
(325, NULL, NULL, '2ème Dos d''Ane', 20),
(326, NULL, NULL, '1ère Citerne Rémy', 20),
(327, NULL, NULL, '3ème Réserve', 20),
(328, NULL, NULL, '4ème Estère Dérée', 20),
(329, '18.183878', NULL, '6ème Bas de Lacroix', 21),
(330, '18.183878', NULL, '7ème Bras Gauche', 21),
(331, '18.183878', NULL, '8ème Oranger', 21),
(332, '18.183878', NULL, '5ème Bas de Grandou', 21),
(333, '18.183878', NULL, '9ème Bas de Gris-gris', 21),
(334, '18.183878', NULL, '2ème Trou Mahot', 21),
(335, '18.183878', NULL, '1ère Brésilienne', 21),
(336, '18.183878', NULL, '4ème Haut Grandou', 21),
(337, NULL, NULL, '3ème Fonds Tortue', 22),
(338, NULL, NULL, '1ère Gérin', 22),
(339, NULL, NULL, '4e La Plaine', 22),
(340, NULL, NULL, '2ème TOte d''Eau', 22),
(341, NULL, NULL, '5ème Rivière Salée', 22),
(342, NULL, NULL, '2ème Petit Howars', 23),
(343, NULL, NULL, '1ère Garde ChampOtre', 23),
(344, NULL, NULL, '1ère La  Plate', 24),
(345, NULL, NULL, '3ème Haut des Moustiques', 24),
(346, NULL, NULL, '2ème Carreau Datty', 24),
(347, NULL, NULL, '3ème Chardonette', 25),
(348, NULL, NULL, '4ème Beaumont', 25),
(349, NULL, NULL, '2ème Mouline', 25),
(350, NULL, NULL, '3ème Riaribes', 26),
(351, NULL, NULL, '1ère Renth Mathe', 26),
(352, NULL, NULL, '2ème Roye sec', 26),
(353, NULL, NULL, '1ère Bais d''Orange', 27),
(354, NULL, NULL, '2ème Mabriol', 27),
(355, NULL, NULL, '3èmme Calumette', 27),
(356, NULL, NULL, '4ème Corail Lamothe', 27),
(357, NULL, NULL, '5ème Bel Air', 27),
(358, NULL, NULL, '6ème Pichon', 27),
(359, NULL, NULL, '7ème Mapou', 27),
(360, NULL, NULL, '3ème Plaine d''Oranges', 28),
(361, NULL, NULL, '2ème des Forges', 28),
(362, NULL, NULL, '1ère Plate Forme', 28),
(363, NULL, NULL, '10e de Désormeau', 29),
(364, '19.849247', '-72.547222', '6ème Molas', 30),
(365, '19.849247', '-72.547222', '3ème Petit Bourg Du Borgne', 30),
(366, '19.849247', '-72.547222', '7ème Fond Lagrange', 30),
(367, '19.849247', '-72.547222', '1ère Margot', 30),
(368, '19.849247', '-72.547222', '5ème Champagne', 30),
(369, '19.849247', '-72.547222', '4ème Trou d''Enfer', 30),
(370, '19.849247', '-72.547222', '2ème Boucan Michel', 30),
(371, NULL, NULL, '2ème Boucan Carré', 31),
(372, NULL, NULL, '1ère Petite Montagne', 31),
(373, NULL, NULL, '3ème des Bayes', 31),
(374, NULL, NULL, '1ère Boucassin', 32),
(375, NULL, NULL, '9ème Source Matelas', 32),
(376, NULL, NULL, '2ème Boucassin', 32),
(377, NULL, NULL, '4ème Fonds des Blancs', 32),
(378, NULL, NULL, '3ème Tibi Davezac', 33),
(379, NULL, NULL, '1ère Lévy', 33),
(380, NULL, NULL, '2ème Champlois', 33),
(381, '19.760833', '-72.203611', '2ème Haut du Cap', 34),
(382, '19.760833', '-72.203611', '3ème Petite Anse', 34),
(383, '19.760833', '-72.203611', '1ère Bande du Nord', 34),
(384, NULL, NULL, '4ème Capotille', 35),
(385, NULL, NULL, '6ème Lamine', 35),
(386, NULL, NULL, '1ère Champin', 36),
(387, NULL, NULL, '2ème Claudine', 36),
(388, NULL, NULL, '1ère Bois Gamelle', 37),
(389, NULL, NULL, '2ème Rose Bonite', 37),
(390, NULL, NULL, '3ème Gros Marin', 38),
(391, NULL, NULL, '4ème Mare Henry', 38),
(392, NULL, NULL, '2ème Martineau', 38),
(393, NULL, NULL, '1ère Boileau', 38),
(394, NULL, NULL, '5ème Laroque', 38),
(395, '18.190117', '-73.750556', '3ème Laborde', 39),
(396, '18.190117', '-73.750556', '2ème Fonfrède', 39),
(397, '18.190117', '-73.750556', '9ème Mercy', 39),
(398, '18.190117', '-73.750556', '12ème Boulmier', 39),
(399, '18.190117', '-73.750556', '7ème Laurent', 39),
(400, NULL, '-73.750556', '1ère Bourdet', 39),
(401, NULL, NULL, '1ère Ravine Normande', 40),
(402, NULL, NULL, '2ème Gaillard', 40),
(403, NULL, NULL, '3ème Haut Cap Rouge', 40),
(404, NULL, NULL, 'Rang', 41),
(405, NULL, NULL, '3ème Lamielle', 42),
(406, NULL, NULL, '2ème Acajou Bruler', 42),
(407, NULL, NULL, '1er Acajou Bruler', 42),
(408, NULL, NULL, '1e  Déjean', 43),
(409, NULL, NULL, '2e Boucan', 43),
(410, NULL, NULL, '1ère Chansolme', 44),
(411, NULL, NULL, '2ème Source Beauvoir', 44),
(412, NULL, NULL, '3ème Carrefour Canon', 45),
(413, NULL, NULL, '1ère Fond Palmiste', 45),
(414, NULL, NULL, '2ème Melonière', 45),
(415, NULL, NULL, '3ème Bony', 46),
(416, NULL, NULL, '1ère Randel', 46),
(417, NULL, NULL, '2ème Déjoie', 46),
(418, NULL, NULL, '2e Fonds d'' Icaque', 48),
(419, NULL, NULL, '3e Champy', 48),
(420, NULL, NULL, '1ere Duquillon', 48),
(421, NULL, NULL, '2ème Plaine Céleste', 49),
(422, NULL, NULL, '2ème Boucan Bois Pin', 49),
(423, NULL, NULL, '5ème Génipailler', 49),
(424, NULL, NULL, '1ère Boucan Bois Pin', 49),
(425, NULL, NULL, '1ère Plaine Céleste', 49),
(426, NULL, NULL, '6ème Quentin', 50),
(427, NULL, NULL, '5ème Des Pas', 50),
(428, NULL, NULL, '4ème Condé', 50),
(429, NULL, NULL, '4ème Amazone', 51),
(430, NULL, NULL, '3ème Bras Gauche', 51),
(431, NULL, NULL, '6ème Jamais Vu', 51),
(432, NULL, NULL, '5ème Boucan Bélier', 51),
(433, NULL, NULL, '1ère Gris-gris', 51),
(434, NULL, NULL, '2ème La Biche', 51),
(435, NULL, NULL, '3e Désormeau', 52),
(436, NULL, NULL, '6e Petite Rivière', 52),
(437, NULL, NULL, '5e Baliverne', 52),
(438, NULL, NULL, '1ere Bariadelle', 52),
(439, NULL, NULL, '2eme  Dallier', 52),
(440, NULL, NULL, '2ème Desdunes', 53),
(441, '19.260833', '-72.519167', '2ème Fossé Naboth', 54),
(442, '19.260833', '-72.519167', '5ème Fiéfé', 54),
(443, '19.260833', '-72.519167', '1ère Villars', 54),
(444, '19.260833', '-72.519167', '3ème Ogé', 54),
(445, '19.260833', '-72.519167', '4ème Poste Pierrot', 54),
(446, NULL, '-72.519167', '6ème La Croix', 54),
(447, '19.526539', '-72.243697', '3ème Matador', 55),
(448, '19.526539', '-72.243697', '1ère Brostage', 55),
(449, '19.526539', '-72.243697', '5ème Haut du Trou', 55),
(450, '19.526539', '-72.243697', '2ème Bassin Caiman', 55),
(451, '19.526539', '-72.243697', '4ème Laguille', 55),
(452, '19.483056', '-72.483333', '4ème Puiloreau', 56),
(453, '19.483056', '-72.483333', '3ème Chemin Neuf', 56),
(454, '19.483056', '-72.483333', '2ème Passe Reine', 56),
(455, '19.483056', '-72.483333', '1ère Savane Carrée', 56),
(456, NULL, NULL, '3ème Bas Maribahoux', 57),
(457, NULL, NULL, '4ème Pemerle', 58),
(458, NULL, NULL, '2ème Fonds des Nègres', 58),
(459, NULL, NULL, '1ère Bouzi', 58),
(461, NULL, NULL, '5ème Cocoyers', 58),
(462, NULL, NULL, '4ème Fonds-Verrettes', 59),
(463, NULL, NULL, '2ème Haut Madeleine', 60),
(464, NULL, NULL, '1ère Dumas', 60),
(465, NULL, NULL, '2ème Bayaha', 60),
(466, NULL, NULL, '1ère L''Oiseau', 60),
(467, NULL, NULL, '1ère Galette Chambon', 61),
(468, NULL, NULL, '2ème Balan', 61),
(469, NULL, NULL, '3ème Fonds Parisien', 61),
(470, NULL, NULL, '6ème Mare Roseaux', 61),
(471, NULL, NULL, '5ème Pays Pourri', 61),
(472, '19.446111', '-72.683056', '5ème Labranle', 62),
(473, '19.446111', '-72.683056', '3ème Rivière de Bayonnais', 62),
(474, '19.446111', '-72.683056', '4ème Poteaux', 62),
(475, '19.446111', '-72.683056', '6ème Bassin', 62),
(476, '19.446111', '-72.683056', '1ère Pont Tamarin', 62),
(477, NULL, NULL, '2ème Eaux Basses', 63),
(478, NULL, NULL, '1ère Grand Boucan', 63),
(479, NULL, NULL, '1ère Colline des Chènes', 64),
(480, NULL, NULL, '1ère Poteneau', 65),
(481, '19.578611', '-72.169722', '1ère Grand Gilles', 66),
(482, '19.578611', '-72.169722', '9ème Cormiers', 66),
(483, '19.578611', '-72.169722', '2ème Solon', 66),
(484, '19.578611', '-72.169722', '8ème Jolitrou', 66),
(485, '19.578611', '-72.169722', '3ème Caracol', 66),
(486, '19.578611', '-72.169722', '7ème Gambade', 66),
(487, '18.424739', '-72.711003', '1ère TOte à Boeuf', 67),
(488, NULL, '-72.711003', '7ème Gérard', 67),
(489, NULL, NULL, '2ème TOte à Boeuf', 67),
(490, NULL, NULL, '5ème Grande Colline', 67),
(491, NULL, NULL, '6ème Grande Colline', 67),
(492, NULL, NULL, '4ème Moussambe', 67),
(493, NULL, NULL, '3ème Moussambe', 67),
(494, '18.538472', NULL, '24ème Petit Boucan', 68),
(495, '18.538472', '-72.595172', '23ème Morne Chandelle', 68),
(496, '18.538472', '-72.595172', '1ère Morne à Bateau', 68),
(497, '19.670833', '-72.678333', '7ème Moulin', 69),
(498, '19.670833', NULL, '6ème Savane Carrée', 69),
(499, '19.670833', '-72.678333', '3ème Rivière Blanche', 69),
(500, '19.670833', '-72.678333', '2ème Rivière Mancelle', 69),
(501, '19.670833', '-72.678333', '8ème Ravine Gros Morne', 69),
(502, '19.670833', '-72.678333', '4ème L''Acul', 69),
(503, '19670833', '-72.678333', '1ère Boucan Richard', 69),
(504, '19.670833', '-72.67833', '5ème Pendu', 69),
(505, NULL, NULL, '2ème Marmont', 70),
(506, NULL, NULL, '4ème Aguahedionde', 70),
(507, NULL, NULL, '3ème Aguahedionde', 70),
(508, NULL, NULL, '1ère Juanaria', 70),
(509, NULL, NULL, 'Ile à Vache', 71),
(510, '18.238514', '-72.5325', '3ème Cochon Gras', 72),
(511, '18.238514', '-72.5325', '5ème Marbial', 72),
(512, '18.238514', '-72.5325', '8ème Bas Coq Chante', 72),
(513, '18.238514', '-72.5325', '7ème Grande Rivière de Jacmel', 72),
(514, '18.238514', '-72.5325', '6ème Montagne La Voute', 72),
(515, '18.238514', '-72.5325', '1ère Bas Cap Rouge', 72),
(516, '18.238514', '-72.5325', '2ème Fond Melon', 72),
(517, '18.238514', '-72.5325', '4ème Fond Melon Michineau', 72),
(518, '18.238514', '-72.5325', '4ème La Gosseline', 72),
(519, '18.238514', '-72.5325', '10ème Morne à Bruler', 72),
(520, '18.238514', '-72.5325', '12ème La vanneau', 72),
(521, '18.238514', '-72.5325', '13ème La Montagne', 72),
(522, NULL, '-72.5325', '9ème Haut Coq Chante', 72),
(523, NULL, NULL, '3ème Vielle Hatte', 73),
(524, NULL, NULL, '2ème Guinaudée', 73),
(525, NULL, NULL, '6ème Grande Source', 73),
(526, NULL, NULL, '1ère Lacoma', 73),
(527, NULL, NULL, '7ème Diondion', 73),
(528, NULL, NULL, '5ème Dessources', 73),
(529, NULL, NULL, '4ème La Montagne', 73),
(530, '18.649722', '-74.116667', '8e Fonds Rouge Dahere', 74),
(531, '18.649722', '-74.116667', '9e Fonds Rouge Torberck', 74),
(532, '18.649722', '-74.116667', '7e Marfranc', 74),
(533, '18.649722', '-74.116667', '4e Basse Guinaudée', 74),
(534, '18.649722', '-74.116667', '1ère Basse Voldrogue', 74),
(535, '18.649722', '-74.116667', '5e Ravine à Charles', 74),
(536, '18.649722', '-74.116667', '6e Iles Blanches', 74),
(537, '18.649722', '-74.116667', '3e Haute Guinaudée', 74),
(538, NULL, '-74.116667', '2ème Haute Voldrogue', 74),
(539, NULL, NULL, '4ème Belle Fontaine', 75),
(540, NULL, NULL, '2ème Nouvelle Tourraine', 75),
(541, NULL, NULL, '4ème Grand Fond', 75),
(542, NULL, NULL, '2ème Bongars', 75),
(543, NULL, NULL, '3ème Sourcailles', 75),
(544, NULL, NULL, '2ème Bossous', 76),
(545, NULL, NULL, '1ère Martineau', 76),
(546, NULL, NULL, '2ème Mare Rouge', 77),
(547, NULL, NULL, '1ère Pointe des Oiseaux', 77),
(551, NULL, NULL, '3ème La Vallée', 78),
(552, NULL, NULL, '1ère La Victoire', 79),
(553, NULL, NULL, '1ère Petit Fond', 80),
(554, NULL, NULL, '2ème Juampas', 80),
(555, NULL, NULL, '3ème La Hoye', 80),
(556, NULL, NULL, '3ème Tournade', 81),
(557, NULL, NULL, '4ème Morisseau', 81),
(558, NULL, NULL, '8ème Changeux', 81),
(559, NULL, NULL, '1ère l''Asile', 81),
(560, '18.524917', '-72.627947', '13ème Petit Harpon', 82),
(561, '18.524917', '-72.627947', '6ème Oranger', 82),
(562, '18.524917', '-72.627947', '2ème Petite Rivière', 82),
(563, '18.524917', '-72.627947', '1ère Dessources', 82),
(564, '18.524917', '-72.627947', '7ème Parques', 82),
(565, '18.524917', '-72.627947', '3ème Grande Rivère', 82),
(566, '18.524917', '-72.627947', '11ème Gros Morne', 82),
(567, '18.524917', '-72.627947', '15ème Palmiste à Vins', 82),
(568, '18.524917', '-72.627947', '12ème Cormiers', 82),
(569, '18.524917', '-72.627947', '8ème Beauséjour', 82),
(570, '18.524917', '-72.627947', '10ème Fonds d''Oie', 82),
(571, '18.524917', '-72.627947', '9ème Citronniers', 82),
(572, '18.524917', '-72.627947', '14ème Fond de Boudin', 82),
(573, NULL, NULL, '1ère Vérone', 83),
(574, NULL, NULL, '2ème Edelin', 83),
(575, NULL, NULL, '3ème Cosse', 83),
(576, NULL, NULL, '5e Matador', 84),
(577, NULL, NULL, '6e Bélair', 84),
(578, NULL, NULL, '7e Garcasse', 84),
(579, NULL, NULL, '2ème Petites Desdunes', 85),
(580, NULL, NULL, '1ère Lacroix Perisse', 85),
(581, NULL, NULL, '4ème Chabotte', 86),
(582, NULL, NULL, '7ème Ravine Desroches', 86),
(583, NULL, NULL, '5ème Camp Coq', 86),
(584, NULL, NULL, '3ème Acul Jeannot', 86),
(585, NULL, NULL, '6ème Soufrière', 86),
(586, NULL, NULL, '8ème Ilot à Cornes', 86),
(587, NULL, NULL, '3ème Roucou', 87),
(588, NULL, NULL, '2ème Bois de Lance', 87),
(589, NULL, NULL, '1ère Basse Plaine', 87),
(590, NULL, NULL, '3ème Hatty', 88),
(591, NULL, NULL, '2ème Narang', 88),
(592, NULL, NULL, '1ère Savane Grande', 88),
(593, NULL, NULL, '10ème Dory', 89),
(594, NULL, NULL, '11ème Melon', 89),
(595, NULL, NULL, '1ère Maniche', 89),
(596, NULL, NULL, '1ère Corail Soult', 90),
(597, NULL, NULL, '3ème Macary', 90),
(598, NULL, NULL, '4ème Fond Jean Noel', 90),
(599, NULL, NULL, '2ème Grande Rivière Fesle', 90),
(600, NULL, NULL, '5ème Savane Dubois', 90),
(601, NULL, NULL, '1ère CrOte à Pins', 91),
(602, NULL, NULL, '3ème Platon', 91),
(603, NULL, NULL, '2ème Bassin', 91),
(604, NULL, NULL, '1ère Perches du Bonnet', 92),
(605, NULL, NULL, '3ème Génipailler', 92),
(606, NULL, NULL, '2ème Bonnet à l''EvOque', 92),
(607, NULL, NULL, '4ème Pemerle', 93),
(608, NULL, NULL, '3ème Dessources', 93),
(609, NULL, NULL, '1ère Chalon', 93),
(610, NULL, NULL, '2ème Belle Rivière', 93),
(611, NULL, NULL, '5ème Gascogne', 94),
(612, NULL, NULL, '6ème Sarazin', 94),
(613, NULL, NULL, '3ème Grand Boucan', 94),
(614, NULL, NULL, '4ème CrOte Brvlée', 94),
(615, NULL, NULL, '1ère Cote de Fer', 95),
(616, NULL, NULL, '3ème Damé', 95),
(617, NULL, NULL, '2ème Mare Rouge', 95),
(618, NULL, NULL, '1ère Sans Souci', 96),
(619, NULL, NULL, '2ème Bois Laurence', 96),
(620, NULL, NULL, '2ème Bois Poux', 97),
(621, NULL, NULL, '1ère Savanette', 97),
(622, NULL, NULL, '1e Anotte', 98),
(623, NULL, NULL, '2e Sources Chaudes', 98),
(624, NULL, NULL, '3e L''Assive', 98),
(625, NULL, NULL, '5ème Gens de Nantes', 99),
(626, NULL, NULL, '1ère Haut Maribahoux', 99),
(627, NULL, NULL, '2ème Acul des Pins', 99),
(628, NULL, NULL, '3ème Savane Longue', 99),
(629, NULL, NULL, '7ème Savanne Au Lait', 99),
(630, NULL, NULL, '2ème Bouzi', 100),
(631, NULL, NULL, '1ère Salagnac', 100),
(632, NULL, NULL, '2ème Haut des Perches', 101),
(633, NULL, NULL, '1ère Haut des Perches', 101),
(634, NULL, NULL, '3e Jn Belune', 102),
(635, NULL, NULL, '1ere Bernagousse', 102),
(636, NULL, NULL, '2e Espere', 102),
(637, NULL, NULL, '4e Tozia', 102),
(638, NULL, NULL, '5e Duchity', 102),
(639, NULL, NULL, '6ème Les Cayemites', 102),
(640, NULL, NULL, '3ème Silegue', 103),
(641, NULL, NULL, '1ère Fonds de Lianes', 103),
(642, NULL, NULL, '2ème Cholette', 103),
(643, NULL, NULL, '4ème Bezin', 103),
(644, NULL, NULL, '2ème Bas Coursin', 104),
(645, NULL, NULL, '1ère Bas Coursin', 104),
(646, NULL, NULL, '5ème Pérodin', 104),
(647, NULL, NULL, '3ème Labady', 104),
(648, NULL, NULL, '6ème Médor', 104),
(649, NULL, NULL, '4ème Savane à Roche', 104),
(650, NULL, NULL, '5ème Trou Canari', 105),
(651, NULL, NULL, '7ème des Platons', 105),
(652, NULL, NULL, '1ère Bino', 105),
(653, NULL, NULL, '4ème Fonds Arabie', 105),
(654, NULL, NULL, '6ème Trou Canari', 105),
(655, NULL, NULL, '3ème Trou Chouchou', 105),
(656, NULL, NULL, '11ème  Ravine Sèche', 105),
(657, NULL, NULL, '8ème des Platons', 105),
(658, NULL, NULL, '10ème des Palmes', 105),
(659, NULL, NULL, '9ème des Palmes', 105),
(660, NULL, NULL, '12ème des Fouques', 105),
(661, NULL, NULL, '2ème Delatre', 105),
(662, NULL, NULL, '3ème Liève', 106),
(663, NULL, NULL, '2ème Tiby', 106),
(664, NULL, NULL, '1ère Raymond', 106),
(665, NULL, NULL, '1ère Savannette', 107),
(666, NULL, NULL, '2ème La Belle Mère', 107),
(667, NULL, NULL, '7ème Rivière La Porte', 108),
(668, NULL, NULL, '3ème Ravine Trompette', 108),
(669, NULL, NULL, '5ème Dubourgs', 108),
(670, NULL, NULL, '6ème Piment', 108),
(671, NULL, NULL, '1ère Ballon', 108),
(672, NULL, NULL, '4ème Joly', 108),
(673, NULL, NULL, '8ème Margot', 108),
(674, NULL, NULL, '2ème Baudin', 108),
(675, NULL, NULL, '3ème Grand Boucan', 109),
(676, NULL, NULL, '1ère Morne rouge', 109),
(677, NULL, NULL, '4ème Bassin Diamant', 109),
(678, NULL, NULL, '2ème Basse Plaine', 109),
(679, NULL, NULL, '7ème Bassin', 110),
(680, NULL, NULL, '8ème Grande Rivière', 110),
(681, NULL, NULL, '2ème Champagne', 110),
(682, NULL, NULL, '1ère Gobert', 110),
(683, NULL, NULL, '3ème Haut Martineau', 110),
(684, NULL, NULL, '6ème La Ville', 110),
(685, NULL, NULL, '5ème La trouble', 110),
(686, NULL, NULL, '4ème Mapou', 110),
(687, NULL, NULL, '5ème Anse à Pins', 111),
(688, NULL, NULL, '6ème Plaisance', 111),
(689, NULL, NULL, '4ème Vassale', 111),
(690, NULL, NULL, '5ème Gros Mangle', 112),
(691, NULL, NULL, '6ème La Source', 112),
(692, NULL, NULL, '7ème Grand Vide', 112),
(693, NULL, NULL, '8ème Trou Louis', 112),
(694, NULL, NULL, '9ème Pointe à Raquette', 112),
(695, NULL, NULL, '1ère Lazare', 113),
(696, NULL, NULL, '2ème Anse à Drick', 113),
(697, NULL, NULL, '5ème Dumont', 113),
(698, NULL, NULL, '4ème Barbois', 113),
(699, NULL, NULL, '2ème Balais', 114),
(700, NULL, NULL, '1ère Paricot', 114),
(701, NULL, NULL, '3ème Aubert', 115),
(702, NULL, NULL, '2ème La Pointe', 115),
(703, NULL, NULL, '1ère Baudin', 115),
(704, NULL, NULL, '6ème La Corne', 115),
(705, NULL, NULL, '7ème Mahotière', 115),
(706, NULL, NULL, '8ème Bas des Moustiques', 115),
(707, NULL, NULL, '4ème Haut Petit Borgne', 116),
(708, NULL, NULL, '1ère Grande Plaine', 116),
(709, NULL, NULL, '6ème Bras Gauche', 116),
(710, NULL, NULL, '2ème Bas Petit Borgne', 116),
(711, NULL, NULL, '3ème Corail', 116),
(712, NULL, NULL, '5ème Bas Quartier', 116),
(713, NULL, NULL, '3ème Beauclos', 122),
(714, NULL, NULL, '1ère Beaulieu', 122),
(715, NULL, NULL, '2ème Renaudin', 122),
(716, NULL, NULL, '4e les Gomiers', 123),
(717, NULL, NULL, '3e Grand Vicent', 123),
(718, NULL, NULL, '1ere Carrefour Charles', 123),
(719, NULL, NULL, '2e Fonds Cochon', 123),
(720, NULL, NULL, '1ère Rivière des Nègres', 124),
(721, NULL, NULL, '2ème Derouvray', 124),
(722, NULL, NULL, '3ème des Granges', 124),
(723, NULL, NULL, '6ème Chamoise', 124),
(724, NULL, NULL, '4ème Rivière de Barre', 124),
(725, NULL, NULL, '5ème Bonneau', 124),
(726, NULL, NULL, '1ère Foulon', 125),
(727, NULL, NULL, '2ème Bois Blanc', 125),
(728, NULL, NULL, '4ème Sarazin', 125),
(729, NULL, NULL, '3ème C(telette', 125),
(730, NULL, NULL, '5ème Moka-Neuf', 125),
(731, NULL, NULL, '6ème Fond Bleu', 125),
(732, NULL, NULL, '3ème Goyavier', 126),
(733, NULL, NULL, '6ème Charrette', 126),
(734, NULL, NULL, '5ème Bocozelle', 126),
(735, NULL, NULL, '4ème Lalouère', 126),
(736, NULL, NULL, '2ème Bois Neuf', 126),
(737, NULL, NULL, '1ère Délugé', 126),
(738, NULL, NULL, '5ème L''Ermite', 127),
(739, NULL, NULL, '1ère Platana', 127),
(740, NULL, NULL, '2ème Camathe', 127),
(741, NULL, NULL, '4ème Lalomas', 127),
(742, NULL, NULL, '3ème Bas de Sault', 127),
(743, NULL, NULL, '8ème l''Attalaye', 127),
(744, NULL, NULL, '7ème manon', 127),
(745, NULL, NULL, '6ème Lacedras', 127),
(746, NULL, NULL, '4ème Montagne Terrible', 128),
(747, NULL, NULL, '2ème La Selle', 128),
(748, NULL, NULL, '3ème Coupe Mardi Gras', 128),
(749, NULL, NULL, '1ère Rivière Canot', 128),
(750, NULL, NULL, '1ère Tapion', 129),
(751, NULL, NULL, '2ème Débouchette', 129),
(752, NULL, NULL, '3ème Trichet', 129),
(753, NULL, NULL, '8ème Corail-Henry', 130),
(754, NULL, NULL, '1ère Grands Fonds', 130),
(755, NULL, NULL, '7ème Cherette', 130),
(756, NULL, NULL, '5ème Sucrerie-Henry', 130),
(757, NULL, NULL, '6ème Solon', 130),
(758, NULL, NULL, '4ème Zanglais', 130),
(759, NULL, NULL, '3ème Grenodière', 130),
(760, NULL, NULL, '2ème Baie Dumesle', 130),
(761, NULL, NULL, '2ème Mathurin', 131),
(762, NULL, NULL, '1ère Bois Neuf', 131),
(763, NULL, NULL, '4ème Sanyago', 131),
(764, NULL, NULL, '3ème Bouyaha', 131),
(765, NULL, NULL, '1ère Dolan', 132),
(766, NULL, NULL, '3ème Lagon', 132),
(767, NULL, NULL, '3ème Bois Neuf', 132),
(768, NULL, NULL, '1ère Matelgate', 134),
(769, NULL, NULL, '2ème Lociane', 134),
(770, NULL, NULL, '2ème Grande Plaine', 135),
(771, NULL, NULL, '6ème Trou d''Eau', 135),
(772, NULL, NULL, '1ère Crochus', 135),
(773, NULL, NULL, '1ère Grande Plaine', 135),
(774, NULL, NULL, '2ème Tierra Muscady', 136),
(775, NULL, NULL, '3ème Baille Tourrible', 136),
(776, NULL, NULL, '1ère Cabral', 136),
(777, NULL, NULL, '4ème Dalmette', 137),
(778, NULL, NULL, '2ème Nan Sevré', 137),
(779, NULL, NULL, '3ème Loby', 137),
(780, NULL, NULL, '1ère Blactote', 137),
(781, NULL, NULL, '4ème Moreau', 138),
(782, NULL, NULL, '3ème Solon', 138),
(783, NULL, NULL, '2ème Bérault', 138),
(784, NULL, NULL, '1ère Bourry', 138),
(785, NULL, NULL, '1ère Garcin', 139),
(786, NULL, NULL, '2ème Roucou', 139),
(787, NULL, NULL, '3ème Roche Plate', 139),
(788, NULL, NULL, '2ème Grosse Roche', 140),
(789, NULL, NULL, '1ère Trois Palmistes', 140),
(790, NULL, NULL, '3ème Corosse', 140),
(791, NULL, NULL, '6ème Terre Natte', 141),
(792, NULL, NULL, '1ère Liancourt', 141),
(793, NULL, NULL, '2ème Bélanger', 141),
(794, NULL, NULL, '5ème Bastien', 141),
(795, NULL, NULL, '3ème Guillaume Mogé', 141),
(796, NULL, NULL, '4ème Désarmes', 141),
(797, '0', '0', 'Cite L''Eternel', 1),
(798, '0', '0', 'Cité Numero Un', 1),
(799, '0', '0', 'Cité Numero Deux', 1),
(800, '0', '0', 'Gerardeau', 1),
(801, '0', '0', 'Village de Dieu', 1),
(802, '', '', 'Flon', 82);

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(45) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_name_UNIQUE` (`service_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `services`
--

INSERT INTO `services` (`id`, `service_name`, `description`) VALUES
(1, 'Legal followup', 'Help victim with legal affair'),
(2, 'Acompagnement Psy', 'This a description for test purpose');

-- --------------------------------------------------------

--
-- Structure de la table `site_price`
--

CREATE TABLE IF NOT EXISTS `site_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prix_service` float DEFAULT NULL,
  `referral_necessary` tinyint(1) NOT NULL,
  `branchsite` int(11) NOT NULL,
  `services` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_site_price_branchsite1` (`branchsite`),
  KEY `fk_site_price_services1` (`services`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `site_price`
--

INSERT INTO `site_price` (`id`, `prix_service`, `referral_necessary`, `branchsite`, `services`) VALUES
(1, 500, 1, 1, 1),
(2, 1000, 1, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(150) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `level` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `password`, `email`, `level`) VALUES
(1, 'Jean Came Poulard', 'admin', '098f6bcd4621d373cade4e832627b4f6', 'jcpoulard@gmail.com', 'Admin'),
(2, 'Simple User', 'simple', '098f6bcd4621d373cade4e832627b4f6', 'simple@user.com', 'Basic');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `branchsite`
--
ALTER TABLE `branchsite`
  ADD CONSTRAINT `fk_branchsite_neighbourhood1` FOREIGN KEY (`quartier`) REFERENCES `quartier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_branchsite_organisation` FOREIGN KEY (`organisation`) REFERENCES `organisation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `branchsite_has_category`
--
ALTER TABLE `branchsite_has_category`
  ADD CONSTRAINT `fk_category_has_branchsite_branchsite1` FOREIGN KEY (`branchsite`) REFERENCES `branchsite` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_category_has_branchsite_category1` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commune`
--
ALTER TABLE `commune`
  ADD CONSTRAINT `fk_commune_departement1` FOREIGN KEY (`departement`) REFERENCES `departement` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `fk_contact_organisation1` FOREIGN KEY (`organisation`) REFERENCES `organisation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `partners`
--
ALTER TABLE `partners`
  ADD CONSTRAINT `fk_partners_organisation1` FOREIGN KEY (`organisation`) REFERENCES `organisation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `quartier`
--
ALTER TABLE `quartier`
  ADD CONSTRAINT `fk_neighbourhood_commune1` FOREIGN KEY (`commune`) REFERENCES `commune` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `site_price`
--
ALTER TABLE `site_price`
  ADD CONSTRAINT `fk_site_price_branchsite1` FOREIGN KEY (`branchsite`) REFERENCES `branchsite` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_site_price_services1` FOREIGN KEY (`services`) REFERENCES `services` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
