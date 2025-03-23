-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : dim. 23 mars 2025 à 14:32
-- Version du serveur : 8.0.30
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `clinique_veterinaire`
--

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

CREATE TABLE `animal` (
  `id` int NOT NULL,
  `photo_id` int NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `espece` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_naissance` date NOT NULL,
  `proprietaire_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `animal`
--

INSERT INTO `animal` (`id`, `photo_id`, `nom`, `espece`, `date_naissance`, `proprietaire_id`) VALUES
(1, 2, 'felix', 'oiseau', '2025-03-22', 13),
(2, 3, 'chattou', 'chat', '2025-03-22', 13);

-- --------------------------------------------------------

--
-- Structure de la table `consultation`
--

CREATE TABLE `consultation` (
  `id` int NOT NULL,
  `animal_id` int DEFAULT NULL,
  `assistant_id` int DEFAULT NULL,
  `veterinaire_id` int DEFAULT NULL,
  `traitements_id` int DEFAULT NULL,
  `date_creation` date NOT NULL,
  `date_rdv` datetime NOT NULL,
  `motif` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `consultation`
--

INSERT INTO `consultation` (`id`, `animal_id`, `assistant_id`, `veterinaire_id`, `traitements_id`, `date_creation`, `date_rdv`, `motif`, `statut`) VALUES
(1, 2, NULL, 11, NULL, '2025-03-22', '2025-03-22 17:34:33', 'opération de la jambe', 'en cours'),
(2, 2, NULL, 11, NULL, '2025-03-22', '2025-03-22 17:34:33', 'animal malade', 'en cours'),
(3, 1, 12, 11, NULL, '2025-03-22', '2025-03-22 21:34:33', 'malade', 'programmé'),
(4, 1, 12, 11, 1, '2025-03-22', '2025-03-22 21:34:33', 'malade immaginaire', 'programmé');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250318131056', '2025-03-18 13:11:19', 19),
('DoctrineMigrations\\Version20250318133126', '2025-03-18 13:31:32', 65),
('DoctrineMigrations\\Version20250318133357', '2025-03-18 13:34:04', 16),
('DoctrineMigrations\\Version20250318134041', '2025-03-18 13:40:45', 77),
('DoctrineMigrations\\Version20250318134506', '2025-03-18 13:45:11', 213),
('DoctrineMigrations\\Version20250318143852', '2025-03-18 14:38:57', 27),
('DoctrineMigrations\\Version20250318150657', '2025-03-18 15:07:02', 16),
('DoctrineMigrations\\Version20250322144223', '2025-03-22 14:42:47', 89),
('DoctrineMigrations\\Version20250322165506', '2025-03-22 16:55:10', 87);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int NOT NULL,
  `chemin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `chemin`, `file_path`) VALUES
(2, NULL, 'bird-67deeeb84560b835523872.jpg'),
(3, NULL, 'objet-67def238665b9859288361.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `traitement`
--

CREATE TABLE `traitement` (
  `id` int NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` double NOT NULL,
  `duree` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `traitement`
--

INSERT INTO `traitement` (`id`, `nom`, `description`, `prix`, `duree`) VALUES
(1, 'traitement', 'ceci est un traitement', 15.2, 2),
(3, 'médicament', 'médicament pour ton petit poney', 100, 10),
(4, 'pommade', 'pommade pour chien', 25.25, 10);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `password`, `roles`, `email`) VALUES
(2, 'alexis', 'pierre', '$2y$13$st07U183NQqTS5Ljge7ZB..UC6ojWHkIn/.9nWFUoiRaNAIjHtLAC', '[]', 'test@gmail.com'),
(4, 'hosen', 'mohsen', '$2y$13$stD/NxmrVClFw/fuT5m6guQoy6UcrwNHmhTYOBNL6dQdaQOEW1fgW', '[]', 'mohsen@gmail.com'),
(5, 'hosen', 'mohsen', '$2y$13$0djWEerP4.wlEL4XQVxsV.ohWMvYH/gmWfznKo4CtsBOdCmYxSXha', '[\"ROLE_ADMIN\"]', 'mohsen1@gmail.com'),
(6, 'hosen', 'mohsen', '$2y$13$Bof9T6VP7iV9fUtGTatYfe2KO/2CB5kN8XwqiFVLiPX0gLNC9yuWq', '[\"ROLE_ADMIN\"]', 'mohsen2@gmail.com'),
(10, 'coualan', 'yoann', '$2y$13$edUIV0OGljJovvKT0n/k4emExurzNxLLOgDYYRi4R.xqUOsJqKpyS', '[\"ROLE_DIRECTOR\", \"ROLE_USER\"]', 'yoann@gmail.com'),
(11, 'jean', 'pierre', '$2y$13$zJ0KoU8Y.49rXMWI5z20zO27.kFT1g2SZ.SMnWy3j3x5huIH/fIr2', '[\"ROLE_VETERINARIAN\"]', 'pierre@gmail.com'),
(12, 'jean', 'marie', '$2y$13$oQ8E0aTKTvs4Zjdo0rhahOHyKAE6zu3fc8hO/2vt.wDUFVdZSGOPe', '[\"ROLE_ASSISTANT\"]', 'marie@gmail.com'),
(13, 'jean', 'client', '$2y$13$ItHZ4ml.AX70.oJwKzpOZOoniGrLSizEixq62h5/IXgowKcjJtw3G', '[]', 'client@gmail.com'),
(14, 'jean', 'client', '$2y$13$lX6HYv/hxKXE9dq3PCeJtObhLmtbGREXUObBNPDUM9hofo.OjdylC', '[]', 'client2@gmail.com'),
(15, 'jean', 'client', '$2y$13$9fcGLdv4g9jAch6gI1IiOOd7tqy8SEQKFUNbFAyqWutBRlmbThu7.', '[]', 'client3@gmail.com');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6AAB231F7E9E4C8C` (`photo_id`),
  ADD KEY `IDX_6AAB231F76C50E4A` (`proprietaire_id`);

--
-- Index pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_964685A68E962C16` (`animal_id`),
  ADD KEY `IDX_964685A6E05387EF` (`assistant_id`),
  ADD KEY `IDX_964685A65C80924` (`veterinaire_id`),
  ADD KEY `IDX_964685A6C5AE08D8` (`traitements_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `traitement`
--
ALTER TABLE `traitement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `animal`
--
ALTER TABLE `animal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `media`
--
ALTER TABLE `media`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `traitement`
--
ALTER TABLE `traitement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `FK_6AAB231F76C50E4A` FOREIGN KEY (`proprietaire_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_6AAB231F7E9E4C8C` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`);

--
-- Contraintes pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `FK_964685A65C80924` FOREIGN KEY (`veterinaire_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_964685A68E962C16` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`),
  ADD CONSTRAINT `FK_964685A6C5AE08D8` FOREIGN KEY (`traitements_id`) REFERENCES `traitement` (`id`),
  ADD CONSTRAINT `FK_964685A6E05387EF` FOREIGN KEY (`assistant_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
