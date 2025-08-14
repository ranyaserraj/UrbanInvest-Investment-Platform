-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 14 août 2025 à 09:56
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet3`
--

-- --------------------------------------------------------

--
-- Structure de la table `demande_conseil`
--

CREATE TABLE `demande_conseil` (
  `id_demande` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `type_projet` varchar(255) NOT NULL,
  `budget` decimal(15,2) NOT NULL,
  `objectifs` text NOT NULL,
  `contraintes` text DEFAULT NULL,
  `experience` text DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `demande_conseil`
--

INSERT INTO `demande_conseil` (`id_demande`, `id_user`, `type_projet`, `budget`, `objectifs`, `contraintes`, `experience`, `date_creation`) VALUES
(1, 21, 'commerce', 49837000.00, 'iuegfeof', 'iugfef', 'jcdboid', '2025-01-14 21:20:42'),
(2, 21, 'commerce', 34000.00, 'drftgyhuji', 'edrtfyguhij', 'edrftgyhujik', '2025-01-14 21:38:06'),
(3, 21, 'immobilier', 56000.00, 'dfgyhjuikol', 'dfgtyhjukil', 'dfghjkl', '2025-02-01 19:10:38'),
(4, 21, 'immobilier', 30000000.00, 'DÃ©velopper un complexe immobilier composÃ© de rÃ©sidences de luxe et dâespaces commerciaux Ã  FÃ¨s, visant Ã  rÃ©pondre Ã  la demande croissante de logements haut de gamme et de centres commerciaux modernes.\r\n', 'Respecter les normes de construction locales et les rÃ©gulations en matiÃ¨re dâurbanisme.\r\n', 'DÃ©butant dans l\'immobilier, mais avec une expÃ©rience prÃ©alable dans l\'investissement en actions et en entreprises locales.\r\n', '2025-02-02 14:13:32'),
(5, 21, 'immobilier', 29999000.00, 'developper un complexe immobilier compose de residences de luxe d\'espaces commerciaux a fes , visant a repondre a la demand croissante de logements haut de gamme et de centres commerciaux modernes', 'Respecter les normes de construction locales et les regulations en matiere d\'urbanisme.  \r\nChoisir un emplacement strategique, mais eviter des zones trop congestionnees ou sujettes a des risques naturels (inondations,Â etc.).', 'Debutant dans l\'immobilier, mais avec une experience prealable dans l\'investissement en actions et en entreprisesÂ locales.', '2025-02-02 14:35:21'),
(6, 21, 'commerce', 71000.00, 'dfghjkl', 'dfghjkl', 'ghjkl', '2025-02-02 15:03:46'),
(7, 21, 'commerce', 20000.00, 'snack rapide et simple', 'l\'emplacement', 'debutant', '2025-02-02 15:17:44');

-- --------------------------------------------------------

--
-- Structure de la table `etude_financier`
--

CREATE TABLE `etude_financier` (
  `id_etude` int(11) NOT NULL,
  `nom_complet` varchar(255) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `nom_du_projet` varchar(255) NOT NULL,
  `type_investissement` varchar(100) NOT NULL,
  `ville_region` varchar(100) NOT NULL,
  `adresse_exacte` varchar(100) NOT NULL,
  `superficie_estimee` varchar(255) NOT NULL,
  `budget_estimee` varchar(255) NOT NULL,
  `source_financement` varchar(255) NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etude_financier`
--

INSERT INTO `etude_financier` (`id_etude`, `nom_complet`, `telephone`, `nom_du_projet`, `type_investissement`, `ville_region`, `adresse_exacte`, `superficie_estimee`, `budget_estimee`, `source_financement`, `date_creation`) VALUES
(1, 'dfgh', 'rtyu', 'tyui', 'dfghj', 'dfghj', 'dfghj', '6', '0.03', 'dfgh', '2025-01-01 13:27:09'),
(2, 'cdkvdvkjv', '8393', 'fjfh', 'fdjfh', 'fdjkfdfdkjf', 'dekfje', '78', '678', 'hfge', '2025-01-01 21:05:26'),
(3, 'ghj', 'fgh', 'bnvn', 'iee', 'ew', 'woe', '1111', '22', 'dosd', '2025-01-02 00:00:23');

-- --------------------------------------------------------

--
-- Structure de la table `etude_marche`
--

CREATE TABLE `etude_marche` (
  `id_marche` int(11) NOT NULL,
  `nom_projet` varchar(255) NOT NULL,
  `type_investissement` varchar(255) NOT NULL,
  `ville_region` varchar(255) NOT NULL,
  `adresse_exacte` text NOT NULL,
  `superficie_estimee` varchar(255) NOT NULL,
  `objectif_etude` text NOT NULL,
  `type_clientele` text NOT NULL,
  `concurrents` text NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etude_marche`
--

INSERT INTO `etude_marche` (`id_marche`, `nom_projet`, `type_investissement`, `ville_region`, `adresse_exacte`, `superficie_estimee`, `objectif_etude`, `type_clientele`, `concurrents`, `date_creation`, `id_user`) VALUES
(6, 'cdiucgd', 'cdce', 'cdic', 'cie', '678', 'dwiudwdw', 'jkdbdd', 'bjc', '2025-01-02 23:40:16', 1),
(7, 'dfghj', 'dfghj', 'dfghj', 'dfghj', '4567', 'fghjk', 'fghjktyui', 'vbn', '2025-01-02 23:40:50', 1),
(8, 'fghj', 'css', 'bdif', 'fiufe', '832', 'dfiufe', 'iudgfe', 'f', '2025-01-02 23:47:24', 1),
(10, 'hhhh', 'dd', 'dd', 'ee', '345', 'd', 'f', 's', '2025-01-03 20:06:34', 1),
(12, 'ranya', 's', 's', 's', '1', 's', 'ss', 's', '2025-01-04 16:04:29', 1),
(13, 'dhdj', 'djo', 'dojcdi', 'dknc', '284', 'kdv', 'dhid', 'cdic', '2025-01-04 19:35:18', 2),
(14, 'bb', 'bb', 'ug', 'nk', '567', 'uyf', 'uyf', 'oih', '2025-01-11 15:00:59', 1),
(16, 'Espace Urbain', 'Immobilier Commercia', 'Casablanca, Région Casablanca-Settat', 'Boulevard Al Massira Al Khadra, Casablanca', '15 000 m²', 'Évaluer la faisabilité économique et technique.', 'Familles, jeunes actifs, touristes, commerçants locaux', 'Morocco Mall, Anfaplace, Marina Shopping', '2025-01-12 21:49:06', 21),
(37, 'fghjk', 'fghjk', 'dfghjk', 'fghjkl', '5678', 'ghjk', 'g', 'ghjk', '2025-02-02 16:50:04', 21);

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `id_paiement` int(11) NOT NULL,
  `id_marche` int(11) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `validated` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`id_paiement`, `id_marche`, `image_path`, `validated`) VALUES
(1, 13, '/uploads/13_1736173253525.jpg', 0),
(2, 6, '/uploads/6_1736280567226.jpg', 0),
(3, 7, '/uploads/7_1736280662961.jpg', 0),
(4, 8, '/uploads/8_1736607042596.jpg', 0),
(5, 16, '/uploads/16_1736718900636.png', 0);

-- --------------------------------------------------------

--
-- Structure de la table `traitement_conseil`
--

CREATE TABLE `traitement_conseil` (
  `id_traitement` int(11) NOT NULL,
  `id_demande` int(11) NOT NULL,
  `analyse_marche` text NOT NULL,
  `recommandations` text NOT NULL,
  `strategies_invest` text NOT NULL,
  `risques` text NOT NULL,
  `conclusion` text DEFAULT NULL,
  `date_traitement` timestamp NOT NULL DEFAULT current_timestamp(),
  `statut` varchar(50) DEFAULT 'en_attente',
  `pdf_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `traitement_conseil`
--

INSERT INTO `traitement_conseil` (`id_traitement`, `id_demande`, `analyse_marche`, `recommandations`, `strategies_invest`, `risques`, `conclusion`, `date_traitement`, `statut`, `pdf_path`) VALUES
(1, 1, 'jhfouefhe', 'lhefpeihf', 'lkefp3gf', 'peihepf', 'oiebfpiefh3', '2025-01-14 21:24:54', 'completé', NULL),
(2, 2, 'oihopojdw', 'bciehfiep', 'oiceipfhe', 'ifhipef', 'buveipf', '2025-01-14 21:38:36', 'completé', 'conseil_2_1736890716594.pdf'),
(3, 2, 'oihopojdw', 'bciehfiep', 'oiceipfhe', 'ifhipef', 'buveipf', '2025-01-14 21:38:41', 'completé', 'conseil_2_1736890721270.pdf'),
(4, 2, 'oihopojdw', 'bciehfiep', 'oiceipfhe', 'ifhipef', 'buveipf', '2025-01-14 21:38:42', 'completé', 'conseil_2_1736890722139.pdf'),
(5, 2, 'oihopojdw', 'bciehfiep', 'oiceipfhe', 'ifhipef', 'buveipf', '2025-01-14 21:38:42', 'completé', 'conseil_2_1736890722299.pdf'),
(6, 2, 'oihopojdw', 'bciehfiep', 'oiceipfhe', 'ifhipef', 'buveipf', '2025-01-14 21:38:42', 'completé', 'conseil_2_1736890722438.pdf'),
(7, 3, 'dfghjk', 'dfghjk', 'fghjkl', 'fgyhjukil', 'fghjkl', '2025-02-01 19:11:06', 'completé', 'conseil_3_1738437066251.pdf'),
(8, 3, 'dfghjk', 'dfghjk', 'fghjkl', 'fgyhjukil', 'fghjkl', '2025-02-01 19:11:07', 'completé', 'conseil_3_1738437067428.pdf'),
(9, 3, 'dfghjk', 'dfghjk', 'fghjkl', 'fgyhjukil', 'fghjkl', '2025-02-01 19:11:12', 'completé', 'conseil_3_1738437072539.pdf'),
(10, 3, 'dfghjk', 'dfghjk', 'fghjkl', 'fgyhjukil', 'fghjkl', '2025-02-01 19:11:14', 'completé', 'conseil_3_1738437074750.pdf'),
(11, 3, 'dfghjk', 'dfghjk', 'fghjkl', 'fgyhjukil', 'fghjkl', '2025-02-01 19:11:15', 'completé', 'conseil_3_1738437075693.pdf'),
(12, 3, 'dfghjk', 'dfghjk', 'fghjkl', 'fgyhjukil', 'fghjkl', '2025-02-01 19:11:16', 'completé', 'conseil_3_1738437076045.pdf'),
(13, 3, 'dfghjk', 'dfghjk', 'fghjkl', 'fgyhjukil', 'fghjkl', '2025-02-01 19:11:16', 'completé', 'conseil_3_1738437076255.pdf'),
(14, 3, 'dfghjk', 'dfghjk', 'fghjkl', 'fgyhjukil', 'fghjkl', '2025-02-01 19:11:16', 'completé', 'conseil_3_1738437076435.pdf'),
(15, 3, 'dfghjk', 'dfghjk', 'fghjkl', 'fgyhjukil', 'fghjkl', '2025-02-01 19:11:16', 'completé', 'conseil_3_1738437076583.pdf'),
(16, 3, 'dfghjk', 'dfghjk', 'fghjkl', 'fgyhjukil', 'fghjkl', '2025-02-01 19:11:22', 'completé', 'conseil_3_1738437082939.pdf'),
(17, 3, 'dfghjk', 'dfghjk', 'fghjkl', 'fgyhjukil', 'fghjkldfghjukilo;lkmjnhbvftgyhuikolp;', '2025-02-01 19:11:33', 'completé', 'conseil_3_1738437093589.pdf'),
(19, 5, 'Le marche immobilier a Fes presente plusieurs opportunites, mais aussi des defis specifiques. D\'un cote, la ville beneficie d\'un fort potentiel de croissance, alimente par sa position strategique entre les grandes villes comme Casablanca et Rabat, ainsi que son attractiviteÂ touristique.', 'Choisir un emplacement qui beneficie a la fois de la proximite des zones commerciales et residentielles, tout en etant suffisamment eloigne du centre-ville congestionne pour eviter les problemes de circulation etÂ deÂ congestion', 'Demarrer avec une premiere phase de construction limitee a un nombre d\'unitÃ©s residentielles et de commerces pour tester la demande.', 'Bien que la demande soit elevee, il existe un risque de suroffre si d\'autres projets immobiliers de grande envergure se developpent dansÂ laÂ memeÂ zone', 'Le marche immobilier de Fes presente un potentiel interessant, en particulier dans les segments residentiels et commerciauxÂ hautÂ deÂ gamme.', '2025-02-02 14:40:25', 'completé', NULL),
(20, 4, 'un interet croissant pour des projets modernes offrant des infrastructures de qualite et des equipements haut de gamme', 'Respecter les normes de construction locales', 'Choisir un emplacement qui beneficie a la fois de la proximite des zones commerciales', 'Debutant dans l\'immobilier', 'Le marche immobilier de Fes presente un potentiel interessant', '2025-02-02 14:51:50', 'completé', NULL),
(21, 6, 'dfghjk', 'sdfghjk', 'dfghjkl', 'sdfghjkl', 'dfghjkl;', '2025-02-02 15:04:10', 'completé', 'conseil_6_1738508650516.pdf'),
(22, 7, 'projet croissant', 'snack pres d\'universite', 'usage de reseaux sociaux', 'les ingredients', 'projet potentiel et rentable..', '2025-02-02 15:21:10', 'completé', 'conseil_7_1738509670490.pdf');

-- --------------------------------------------------------

--
-- Structure de la table `traitement_etude_marche`
--

CREATE TABLE `traitement_etude_marche` (
  `id_traitement` int(11) NOT NULL,
  `id_marche` int(11) DEFAULT NULL,
  `date_traitement` datetime DEFAULT current_timestamp(),
  `commentaire` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `rapport_path` varchar(255) DEFAULT NULL,
  `status_traitement` enum('en_cours','traite') DEFAULT 'en_cours'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `traitement_etude_marche`
--

INSERT INTO `traitement_etude_marche` (`id_traitement`, `id_marche`, `date_traitement`, `commentaire`, `image_path`, `rapport_path`, `status_traitement`) VALUES
(7, 16, '2025-01-12 22:56:24', 'projet rentable', '1736718984052_Screenshot 2024-05-28 211909.png;', '1736718984066_baba_riad.pdf', 'en_cours');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `uemail` varchar(50) DEFAULT NULL,
  `upwd` varchar(50) DEFAULT NULL,
  `umobile` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `uname`, `uemail`, `upwd`, `umobile`) VALUES
(1, 'ranya', 'ranya@gmail.com', '2004', '123'),
(2, 'redouane', 'redouane@gmail.com', '2002', '1234'),
(3, 'hind', 'hind@gmail.com', NULL, '123'),
(8, 'expert1', 'expert1@gmail.com', 'expert1', '1111'),
(9, 'expert2', 'expert2@gmail.com', 'expert2', '2222'),
(10, 'expert3', 'expert3@gmail.com', 'expert3', '3333'),
(21, 'ranya', 'ranyaserraj18@gmail.com', '2025', '0619787139'),
(24, 'houda ait mouch', 'houdaaitmouch@gmail.com', '2121', '1234567890');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `demande_conseil`
--
ALTER TABLE `demande_conseil`
  ADD PRIMARY KEY (`id_demande`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `etude_financier`
--
ALTER TABLE `etude_financier`
  ADD PRIMARY KEY (`id_etude`);

--
-- Index pour la table `etude_marche`
--
ALTER TABLE `etude_marche`
  ADD PRIMARY KEY (`id_marche`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`id_paiement`),
  ADD KEY `id_marche` (`id_marche`);

--
-- Index pour la table `traitement_conseil`
--
ALTER TABLE `traitement_conseil`
  ADD PRIMARY KEY (`id_traitement`),
  ADD KEY `id_demande` (`id_demande`);

--
-- Index pour la table `traitement_etude_marche`
--
ALTER TABLE `traitement_etude_marche`
  ADD PRIMARY KEY (`id_traitement`),
  ADD KEY `id_marche` (`id_marche`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `demande_conseil`
--
ALTER TABLE `demande_conseil`
  MODIFY `id_demande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `etude_financier`
--
ALTER TABLE `etude_financier`
  MODIFY `id_etude` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `etude_marche`
--
ALTER TABLE `etude_marche`
  MODIFY `id_marche` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `id_paiement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `traitement_conseil`
--
ALTER TABLE `traitement_conseil`
  MODIFY `id_traitement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `traitement_etude_marche`
--
ALTER TABLE `traitement_etude_marche`
  MODIFY `id_traitement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `demande_conseil`
--
ALTER TABLE `demande_conseil`
  ADD CONSTRAINT `demande_conseil_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `etude_marche`
--
ALTER TABLE `etude_marche`
  ADD CONSTRAINT `etude_marche_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `paiement_ibfk_1` FOREIGN KEY (`id_marche`) REFERENCES `etude_marche` (`id_marche`);

--
-- Contraintes pour la table `traitement_conseil`
--
ALTER TABLE `traitement_conseil`
  ADD CONSTRAINT `traitement_conseil_ibfk_1` FOREIGN KEY (`id_demande`) REFERENCES `demande_conseil` (`id_demande`);

--
-- Contraintes pour la table `traitement_etude_marche`
--
ALTER TABLE `traitement_etude_marche`
  ADD CONSTRAINT `traitement_etude_marche_ibfk_1` FOREIGN KEY (`id_marche`) REFERENCES `etude_marche` (`id_marche`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
