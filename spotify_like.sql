-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 28 juil. 2023 à 12:54
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `spotify_like`
--

-- --------------------------------------------------------

--
-- Structure de la table `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE IF NOT EXISTS `album` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `launched_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `album`
--

INSERT INTO `album` (`id`, `title`, `launched_at`) VALUES
(1, 'Stadium Arcadia', '2006-01-01'),
(2, 'Californication', '1999-01-01'),
(3, 'Made in Heaven', '1985-01-01'),
(4, 'Revolver', '1966-01-01');

-- --------------------------------------------------------

--
-- Structure de la table `music_group`
--

DROP TABLE IF EXISTS `music_group`;
CREATE TABLE IF NOT EXISTS `music_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `music_group`
--

INSERT INTO `music_group` (`id`, `name`, `created_at`) VALUES
(1, 'Red Hot Chili Peppers\r\n', '1982-01-01'),
(2, 'Queen', '1970-01-01'),
(3, 'Beatles', '1960-01-01'),
(4, 'Téléphone', '1976-01-01');

-- --------------------------------------------------------

--
-- Structure de la table `song`
--

DROP TABLE IF EXISTS `song`;
CREATE TABLE IF NOT EXISTS `song` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `time` int NOT NULL,
  `music_group_id` int NOT NULL,
  `album_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_song_album` (`album_id`),
  KEY `fk_song_music_group` (`music_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `song`
--

INSERT INTO `song` (`id`, `title`, `time`, `music_group_id`, `album_id`) VALUES
(1, 'Charlie', 350, 1, 1),
(2, '21st Century', 321, 1, 1),
(3, 'I like it dirt', 256, 1, 2),
(4, 'It\'s a beautiful Day', 456, 2, 3),
(5, 'I Was Born To Love You', 189, 2, 3),
(6, 'Made In Heaven', 426, 2, 3),
(7, 'Mother Love', 752, 2, 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `song`
--
ALTER TABLE `song`
  ADD CONSTRAINT `fk_song_album` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`),
  ADD CONSTRAINT `fk_song_music_group` FOREIGN KEY (`music_group_id`) REFERENCES `music_group` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
