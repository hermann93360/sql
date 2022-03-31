-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 15 déc. 2021 à 13:57
-- Version du serveur :  8.0.27-0ubuntu0.20.04.1
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `smartbd`
--

-- --------------------------------------------------------

--
-- Structure de la table `booking`
--

CREATE TABLE `booking` (
  `id_booking` int NOT NULL,
  `start` timestamp NOT NULL,
  `end` timestamp NOT NULL,
  `subject` text NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `booking`
--

INSERT INTO `booking` (`id_booking`, `start`, `end`, `subject`, `status`) VALUES
(1, '2021-12-13 23:00:00', '2021-12-13 23:00:00', 'Cinéma avec mes élèves', 0),
(2, '2021-12-13 23:00:00', '2021-12-13 23:00:00', 'Projet tutoré', 0);

-- --------------------------------------------------------

--
-- Structure de la table `booking_room`
--

CREATE TABLE `booking_room` (
  `id_booking` int NOT NULL,
  `id_room` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `booking_room`
--

INSERT INTO `booking_room` (`id_booking`, `id_room`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `light`
--

CREATE TABLE `light` (
  `id_light` int NOT NULL,
  `id_object` int NOT NULL,
  `intensity` int NOT NULL,
  `color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `light`
--

INSERT INTO `light` (`id_light`, `id_object`, `intensity`, `color`) VALUES
(1, 1, 34, 'blue'),
(2, 2, 78, 'white');

-- --------------------------------------------------------

--
-- Structure de la table `object`
--

CREATE TABLE `object` (
  `id_object` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `object`
--

INSERT INTO `object` (`id_object`, `name`, `quantity`) VALUES
(1, 'Lumière 1', 3),
(2, 'Lumière 2', 5);

-- --------------------------------------------------------

--
-- Structure de la table `room`
--

CREATE TABLE `room` (
  `id_room` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `capacity` int NOT NULL,
  `location` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `room`
--

INSERT INTO `room` (`id_room`, `name`, `capacity`, `location`, `description`) VALUES
(1, 'Projection', 30, 'B1-12', 'Salle pour visionner des films'),
(2, 'Informatique', 20, 'A1-03', 'Salle qui met à disposition des ordinateurs');

-- --------------------------------------------------------

--
-- Structure de la table `room_object`
--

CREATE TABLE `room_object` (
  `id_room` int NOT NULL,
  `id_object` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `room_object`
--

INSERT INTO `room_object` (`id_room`, `id_object`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` smallint NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `username`, `name`, `mail`, `password`, `role`, `created_at`) VALUES
(1, 'tyhtyh', 'yhthyh', 'tyhtyht', '$2y$10$DfRYXHAoMS9hIZ00WKar.eX9FRer6u3/RT/YqLEpDjUCzVJtVOC/K', 'student', '2021-12-02 11:36:17'),
(2, 'hermann', 'Hermann', 'hkamguin@gmail.com', '$2y$10$ALJgESOZFr.LyaUT8d.7QOEf7h2cxFrM2Jvf92lfgkk9ypQ3ktKYu', 'student', '2021-12-02 11:37:15'),
(3, 'Hermann', 'KAMGUIN', 'hermann@hkamguin.fr', '$2y$10$NYcvWzT0yPDYkkQ0cM93vOqxhlnGLjkHVF0jGaksVCgu5zkup2nXy', 'student', '2021-12-02 16:22:56'),
(4, '', '', '', '$2y$10$Y1pj.MKph2ChANxj.BzVvu9APLj9gHwrJXHBinP.u.T1N/w/PRyiG', '', '2021-12-02 16:47:08'),
(5, 'sdfsdf', 'sdfsdf', 'sdfsdf', '$2y$10$/CDjdSwiK55EFdPuokypketJAYjqqDQn90/zyeo09d3KUhrb6L.Oi', 'tcheater', '2021-12-02 16:53:54');

-- --------------------------------------------------------

--
-- Structure de la table `user_booking`
--

CREATE TABLE `user_booking` (
  `id_user` int NOT NULL,
  `id_booking` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user_booking`
--

INSERT INTO `user_booking` (`id_user`, `id_booking`) VALUES
(3, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id_booking`);

--
-- Index pour la table `light`
--
ALTER TABLE `light`
  ADD PRIMARY KEY (`id_light`);

--
-- Index pour la table `object`
--
ALTER TABLE `object`
  ADD PRIMARY KEY (`id_object`);

--
-- Index pour la table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id_room`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `booking`
--
ALTER TABLE `booking`
  MODIFY `id_booking` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `light`
--
ALTER TABLE `light`
  MODIFY `id_light` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `object`
--
ALTER TABLE `object`
  MODIFY `id_object` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `room`
--
ALTER TABLE `room`
  MODIFY `id_room` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
