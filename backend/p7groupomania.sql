-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 18 déc. 2020 à 12:24
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `p7groupomania`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` int(10) UNSIGNED NOT NULL,
  `postId` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comContent` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_postId` (`postId`),
  KEY `fk_comments_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `userId`, `postId`, `date`, `comContent`) VALUES
(9, 2, 8, '2020-12-05 11:57:37', 'Une rando oui sympatoche !');

-- --------------------------------------------------------

--
-- Structure de la table `gifs`
--

DROP TABLE IF EXISTS `gifs`;
CREATE TABLE IF NOT EXISTS `gifs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `gifs`
--

INSERT INTO `gifs` (`id`, `userId`, `name`, `title`, `url`, `date`) VALUES
(8, 2, 'Nelly', 'Un peu d\'humour !', 'https://media.toucharger.com/web/toucharger/upload/image_domain/7/5/75510/75510.gif', '2020-12-03 17:47:17'),
(11, 3, 'Jean Noel', 'Chute', 'https://b3ta.hnldesign.nl/beta324.gif', '2020-12-03 18:23:02'),
(13, 2, 'Nelly', 'La faim', 'https://www.gifimili.com/gif/2018/02/taz-j-ai-faim.gif', '2020-12-04 11:28:59'),
(14, 6, 'Jérôme', 'Bon week end à tous !', 'https://p6.storage.canalblog.com/62/50/922142/118768292.gif', '2020-12-05 10:08:14'),
(18, 13, 'J\'ai réussi ma soutenance !', 'Mercredi', 'https://www.welovebuzz.com/wp-content/uploads/2017/06/1.gif', '2020-12-08 15:29:24');

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `postId` int(10) UNSIGNED NOT NULL,
  `userId` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `fk_like_postId` (`postId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `likes`
--

INSERT INTO `likes` (`id`, `postId`, `userId`) VALUES
(13, 8, 2);

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL,
  `likes` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `userId`, `title`, `content`, `date`, `likes`) VALUES
(8, 6, 'Besoin de se défouler !', 'Une randonnée dans le secteur : 20 kms, ça vous tente...', '2020-12-05 10:09:25', 3),
(9, 2, 'Bonne après midi', 'Nous allons faire le sapin.', '2020-12-05 14:15:56', 0),
(10, 2, 'Ma soutenance de recherche emploi', 'Cette après midi, ma première soutenance de recherche d\'emploi, avec un nouveau mentor, j\'ai terminé le premier projet.', '2020-12-16 13:13:44', 0),
(11, 2, 'Vendredi', 'Il y a du soleil, j\'ai commencé mon projet de recherche d\'emploi.', '2020-12-18 13:23:20', 0);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lastName` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `moderation` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `lastName`, `firstName`, `email`, `password`, `moderation`) VALUES
(2, 'LAB', 'Nelly', 'nelly@gmail.com', '$2b$10$xzJAQgW2uATxAW.SJ6aHOOOpzH9fK/JntvVJ5GFJzy16dZa.755Zu', 1),
(4, 'Test', 'Bertrand', 'bertrand@gmail.com', '$2b$10$hV5ax81Rvnf7bTjwddfX4O9eMv1QJuok8mZVT/TM9YFXP6iLUhWuK', NULL),
(5, 'TEST', 'Thomas', 'thomas@gmail.com', '$2b$10$xtGHBcf7JSyAtbGLYBnH6eFGRDOKpt8wCyh4sX298/JgKD5Ddib.a', 1),
(6, 'Test', 'Jérôme', 'jerome@gmail.com', '$2b$10$OIl9SoGKooU.KzSuELaCo.2pSw3UiR3kyflRvTzvWM0Xfd8sX3VM.', NULL),
(13, 'TEST', 'Sophia', 'sophia@gmail.com', '$2b$10$bbIdk9ogG3mHxP8QG80UF.E/JLP/X8Io01x09p5J6SEjMipFwI1Ga', NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_postId` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comments_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_like_postId` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_like_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_likes_postId` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_likes_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
