-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 24 avr. 2022 à 16:50
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_repas`
--

-- --------------------------------------------------------

--
-- Structure de la table `comprend`
--

DROP TABLE IF EXISTS `comprend`;
CREATE TABLE IF NOT EXISTS `comprend` (
  `idRecette` int(11) NOT NULL,
  `idRepas` varchar(50) NOT NULL,
  PRIMARY KEY (`idRecette`,`idRepas`),
  KEY `idRepas` (`idRepas`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE IF NOT EXISTS `ingredients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  `prix` double DEFAULT NULL,
  `poids` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ingredients`
--

INSERT INTO `ingredients` (`id`, `Nom`, `prix`, `poids`) VALUES
(1, 'tomate', 1, '100'),
(2, 'farine', 1.5, '250'),
(3, 'banane', 3, '1'),
(5, 'Oeuf', 1.5, '3'),
(6, 'sucre', 1, '500');

-- --------------------------------------------------------

--
-- Structure de la table `recette`
--

DROP TABLE IF EXISTS `recette`;
CREATE TABLE IF NOT EXISTS `recette` (
  `idRecette` int(11) NOT NULL AUTO_INCREMENT,
  `NomRecette` varchar(50) DEFAULT NULL,
  `Deroule` varchar(255) DEFAULT NULL,
  `nbConvives` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRecette`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `recette`
--

INSERT INTO `recette` (`idRecette`, `NomRecette`, `Deroule`, `nbConvives`) VALUES
(4, 'Pates a la bolo', 'Faire des pates à la bolo', 4),
(2, 'Couscous', 'Faire un couscous', 5);

-- --------------------------------------------------------

--
-- Structure de la table `repas`
--

DROP TABLE IF EXISTS `repas`;
CREATE TABLE IF NOT EXISTS `repas` (
  `idRepas` int(11) NOT NULL AUTO_INCREMENT,
  `nbConvives` int(11) DEFAULT NULL,
  `DateRepas` date DEFAULT NULL,
  PRIMARY KEY (`idRepas`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `repas`
--

INSERT INTO `repas` (`idRepas`, `nbConvives`, `DateRepas`) VALUES
(1, 5, NULL),
(2, 5, NULL),
(3, 4, NULL),
(4, 4, '2022-04-08');

-- --------------------------------------------------------

--
-- Structure de la table `utiliser`
--

DROP TABLE IF EXISTS `utiliser`;
CREATE TABLE IF NOT EXISTS `utiliser` (
  `idRecette` int(11) NOT NULL,
  `id` varchar(50) NOT NULL,
  `quantiteNecessaire` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`idRecette`,`id`),
  KEY `idIngredient` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
