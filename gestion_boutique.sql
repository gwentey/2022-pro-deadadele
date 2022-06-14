-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mar. 14 juin 2022 à 13:36
-- Version du serveur :  5.7.34
-- Version de PHP : 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_boutique`
--

-- --------------------------------------------------------

--
-- Structure de la table `atelier`
--

CREATE TABLE `atelier` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `atelier`
--

INSERT INTO `atelier` (`id`, `nom`) VALUES
(1, 'Boucherie'),
(2, 'Charcutier Traiteur'),
(3, 'Cuisine CFA'),
(4, 'Cuisine GRETA'),
(5, 'Cuisine Lycee'),
(6, 'Emballages'),
(7, 'Patisserie Boulangerie');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_client`
--

CREATE TABLE `categorie_client` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie_client`
--

INSERT INTO `categorie_client` (`id`, `nom`) VALUES
(1, 'Elèves'),
(2, 'Profs'),
(3, 'Autres');

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id`, `nom`) VALUES
(1, 'Non renseigné'),
(2, 'BTS2'),
(3, 'BTS3'),
(5, 'CAP1'),
(6, 'CAP2');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `id_categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `ville`, `telephone`, `mail`, `id_categorie`) VALUES
(1, 'Martin', 'Léo', 'Paris', '0192837465', 'az@er', 1),
(2, 'Bernard', 'Gabriel', 'Marseille', '', 'ze@rt', 2),
(3, 'Thomas', 'Raphaël', 'Strasbourg', '1234512345', 'er@ty', 2),
(4, 'Petit', 'Arthur', 'Lille', '0987609876', 'rt@yu', 3),
(5, 'Robert', 'Louis', 'Toulouse', '2975437156', 'ty@ui', 1);

-- --------------------------------------------------------

--
-- Structure de la table `destruction`
--

CREATE TABLE `destruction` (
  `id` int(11) NOT NULL,
  `id_production` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix` double NOT NULL,
  `date_destruction` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `destruction`
--

INSERT INTO `destruction` (`id`, `id_production`, `quantite`, `prix`, `date_destruction`) VALUES
(1, 1, 4, 10, '2022-01-12');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `id` int(11) NOT NULL,
  `id_moyen_reglement` int(11) DEFAULT NULL,
  `id_client` int(11) NOT NULL,
  `date` date NOT NULL,
  `date_reglement` date DEFAULT NULL,
  `total` float NOT NULL,
  `etat_annulation` int(11) NOT NULL DEFAULT '0',
  `reservation` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`id`, `id_moyen_reglement`, `id_client`, `date`, `date_reglement`, `total`, `etat_annulation`, `reservation`) VALUES
(1, 3, 5, '2022-01-12', '2022-01-12', 2, 0, 0),
(2, 1, 1, '2022-01-12', '2022-01-12', 5.2, 0, 1),
(3, 2, 4, '2022-01-12', '2022-01-13', 8.4, 0, 0),
(4, 0, 2, '2022-01-13', NULL, 0.45, 1, 0),
(5, 2, 1, '2022-01-17', '2022-01-17', 1.15, 0, 1),
(6, 0, 1, '2022-01-17', NULL, 0, 1, 1),
(7, 0, 3, '2022-01-17', NULL, 0.15, 1, 1),
(8, 0, 1, '2022-02-07', NULL, 4, 1, 1),
(9, 0, 3, '2022-02-07', NULL, 1, 0, 0),
(10, 0, 3, '2022-02-07', NULL, 9.15, 0, 1),
(11, 3, 1, '2022-02-07', '2022-05-23', 0.3, 0, 0),
(12, 0, 3, '2022-02-10', NULL, 59.65, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `famille_produit`
--

CREATE TABLE `famille_produit` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `famille_produit`
--

INSERT INTO `famille_produit` (`id`, `nom`) VALUES
(1, 'Plats cuisinés avec garniture'),
(2, 'Plats cuisinés sans garniture'),
(3, 'Divers'),
(4, 'Charcuterie à cuire'),
(5, 'Entrées froides'),
(6, 'Pâtisserie charcutière'),
(7, 'Garniture'),
(8, 'Plat complet traditionnel'),
(9, 'Plat cuisiné festif '),
(10, 'Potage'),
(11, 'Petits fours'),
(12, 'Pâtisserie'),
(13, 'Boulangerie'),
(14, 'Confiserie'),
(15, 'Charcuterie cuite');

-- --------------------------------------------------------

--
-- Structure de la table `mode_reglement`
--

CREATE TABLE `mode_reglement` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `mode_reglement`
--

INSERT INTO `mode_reglement` (`id`, `nom`) VALUES
(0, 'Non réglé'),
(1, 'Carte Bancaire'),
(2, 'Chèque'),
(3, 'Espèce');

-- --------------------------------------------------------

--
-- Structure de la table `production`
--

CREATE TABLE `production` (
  `id` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_atelier` int(11) NOT NULL,
  `id_prof` int(11) NOT NULL,
  `temperature` int(11) NOT NULL,
  `date_fabrication` varchar(255) NOT NULL,
  `date_peremption` varchar(255) NOT NULL,
  `quantite` float NOT NULL,
  `conditionnement` int(11) NOT NULL,
  `etat_congelation` tinyint(1) DEFAULT NULL,
  `etat_affichage` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `production`
--

INSERT INTO `production` (`id`, `id_classe`, `id_produit`, `id_atelier`, `id_prof`, `temperature`, `date_fabrication`, `date_peremption`, `quantite`, `conditionnement`, `etat_congelation`, `etat_affichage`) VALUES
(1, 1, 1, 1, 1, 1, '12/01/2022', '16/01/2022', 2, 0, NULL, 0),
(2, 6, 2, 3, 6, 1, '12/01/2022', '14/01/2022', 3, 3, NULL, 0),
(3, 3, 3, 4, 6, 1, '12/01/2022', '18/01/2022', 4, 3, NULL, 0),
(4, 1, 4, 6, 1, 1, '13/01/2022', '13/04/2022', 1, 21, 1, 1),
(5, 6, 5, 5, 2, 1, '17/01/2022', '17/04/2022', 1, 13, 1, 1),
(6, 1, 6, 1, 1, 1, '10/02/2022', '19/02/2022', 1, 10, NULL, 1),
(7, 1, 7, 1, 1, 1, '10/02/2022', '22/02/2022', 1, 12, NULL, 1),
(8, 1, 10, 1, 7, 1, '23/05/2022', '24/05/2022', 1, 1, NULL, 1),
(9, 1, 11, 1, 1, 3, '12/05/2022', '12/08/2022', 2, 0, 1, 0),
(10, 1, 12, 1, 1, 1, '14/06/2022', '15/06/2022', 1, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `id_famille` int(11) NOT NULL,
  `id_unite` int(11) NOT NULL,
  `denomination` varchar(255) NOT NULL,
  `prix` float NOT NULL,
  `etat_affichage` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `id_famille`, `id_unite`, `denomination`, `prix`, `etat_affichage`) VALUES
(1, 1, 1, 'test1', 10, 0),
(2, 1, 1, 'boucherie', 1, 0),
(3, 9, 1, 'cfa', 4.2, 0),
(4, 9, 1, 'oui', 0.15, 1),
(5, 11, 1, 'tartine', 1, 1),
(6, 1, 1, 'test1', 50, 1),
(7, 1, 1, 'test2', 8.5, 1),
(8, 3, 1, 'Salade de fromage', 39, 1),
(9, 1, 1, 'Exampole', 6, 1),
(10, 3, 1, 'Salade Composée', 8, 1),
(11, 1, 2, 'Salade de pomme', 92.4, 0),
(12, 1, 1, ' jjhio', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

CREATE TABLE `professeur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`id`, `nom`, `prenom`) VALUES
(1, 'Non renseigné', NULL),
(2, 'Carpentier', 'Jules'),
(6, 'Moreau', 'Jade'),
(7, 'Leroy', 'Jean'),
(8, 'Berger', 'Claude'),
(9, 'Roux', 'Simone');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'Utilisateur'),
(2, 'Administrateur'),
(3, 'Madame Pasqualini');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `total_atelier`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `total_atelier` (
`id` int(11)
,`nom` varchar(255)
,`id_facture` int(11)
,`id_production` int(11)
,`prix_total` float
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `total_atelier_non_paye`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `total_atelier_non_paye` (
`id` int(11)
,`nom` varchar(255)
,`id_facture` int(11)
,`id_production` int(11)
,`prix_total` float
);

-- --------------------------------------------------------

--
-- Structure de la table `transfert`
--

CREATE TABLE `transfert` (
  `id` int(11) NOT NULL,
  `id_production` int(15) NOT NULL,
  `id_type_transfert` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix` double NOT NULL,
  `date_transfert` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `transfert`
--

INSERT INTO `transfert` (`id`, `id_production`, `id_type_transfert`, `quantite`, `prix`, `date_transfert`) VALUES
(1, 3, 2, 1, 4.2, '2022-01-12'),
(2, 2, 1, 2, 1, '2022-01-12'),
(3, 9, 1, 1, 92.4, '2022-05-23');

-- --------------------------------------------------------

--
-- Structure de la table `type_produit`
--

CREATE TABLE `type_produit` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prix` float NOT NULL,
  `id_famille` int(11) NOT NULL,
  `id_unite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_produit`
--

INSERT INTO `type_produit` (`id`, `nom`, `prix`, `id_famille`, `id_unite`) VALUES
(3, 'Petit sac de transport papier', 0.15, 1, 1),
(4, 'Grand sac de transport papier', 0.25, 1, 1),
(5, 'Charcuterie à cuire à base de porc', 10, 2, 3),
(6, 'Charcuterie cuite : pâté, terrine et galantine de porc', 10, 3, 3),
(7, 'Charcuterie cuite : pâté, terrine et galantine de volaille et lapin', 11, 3, 3),
(8, 'Charcuterie cuite : terrine de poisson et/ou  fruits de mer', 11, 3, 3),
(9, 'Charcuterie cuite : terrine festive', 27, 3, 3),
(10, 'Charcuterie cuite : produits tripiers', 6, 3, 3),
(11, 'Charcuterie cuite : saucisserie', 11, 3, 3),
(12, 'Charcuterie cuite : saucisserie sèche', 8, 3, 3),
(13, 'Entrées froides : poisson fumé', 30, 4, 3),
(14, 'Entrées froides : foie gras de canard', 60, 4, 3),
(15, 'Entrées froides à base de légumes', 1, 4, 2),
(16, 'Entrées froides : poisson froid', 3, 4, 2),
(17, 'Pâtisserie charcutière : quiche simple  et pizza', 1, 5, 2),
(18, 'Pâtisserie charcutière : tourte/quiche prestige', 1.2, 5, 2),
(19, 'Pâtisserie charcutière : crêpes fourrées', 1.5, 5, 2),
(20, 'Pâtisserie charcutière : feuilleté garniture simple', 1, 5, 2),
(21, 'Pâtisserie charcutière : feuilleté garniture plus élaborée', 1.2, 5, 2),
(22, 'Plats cuisinés sans garniture à base de porc, poulet ou dinde', 2, 6, 2),
(23, 'Plats cuisinés sans garniture à base de gibier, canard, lapin, bœuf, veau et agneau(bas morceaux)', 2.1, 6, 2),
(24, 'Plats cuisinés sans garniture à base de morceaux nobles de bœuf , veau et agneau', 2.7, 6, 2),
(25, 'Plats cuisinés sans garniture : poisson en filet ou darne', 2.7, 6, 2),
(26, 'Plats cuisinés sans garniture : poisson en mousseline', 1.5, 6, 2),
(27, 'Garniture à base de féculents', 0.5, 7, 2),
(28, 'Garniture à base de légumes', 0.7, 7, 2),
(29, 'Garniture : gratin', 1, 7, 2),
(30, 'Plat complet traditionnel', 3.5, 8, 2),
(31, 'Plat cuisiné festif', 4.2, 9, 2),
(42, 'Potage à base de légumes', 2, 10, 4),
(43, 'Potage à base de poissons', 3.5, 10, 4),
(44, 'Petits fours : bouchée cocktail salée', 0.5, 11, 1),
(45, 'Petits fours : bouchée cocktail sucrée', 0.5, 11, 1),
(46, 'Pâtisserie simple, un seul appareil', 0.9, 12, 2),
(47, 'Pâtisserie simple, deux appareils', 1, 12, 2),
(48, 'Pâtisserie : gâteau élaboré individuel', 1.8, 12, 2),
(49, ' Pâtisserie : gâteau élaboré,  à partager', 1.7, 12, 2),
(50, 'Pâtisserie : entremets pâtissier individuel ou à partager', 2.4, 12, 2),
(51, 'Pâtisserie : tarte sucrée de base', 1, 12, 2),
(52, 'Pâtisserie : tarte sucrée complexe', 1.2, 12, 2),
(53, 'Pâtisserie : biscuits secs', 8, 12, 3),
(54, 'Boulangerie : pain', 2, 13, 2),
(55, 'Boulangerie : viennoiseries', 0.5, 13, 2),
(56, 'Confiserie : chocolats', 20, 14, 3),
(57, 'Confiserie sans chocolat', 10, 14, 3);

-- --------------------------------------------------------

--
-- Structure de la table `unite`
--

CREATE TABLE `unite` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `unite`
--

INSERT INTO `unite` (`id`, `nom`) VALUES
(1, 'Portion'),
(2, '&nbsp;Kg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'),
(3, '&nbsp;Pièce&nbsp;&nbsp;'),
(4, '&nbsp;Litre');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `mot_de_passe`, `role`) VALUES
(13, 'utilisateur', '$2y$10$Zwq.D9NdgokKFrLXNoVnzOJoOnlpX.K1TbBOViPCA8FFSaR4gNA6.', 1),
(14, 'administrateur', '$2y$10$TXLQciBBBPls1J06CNhhJOp1qSWA0/oldSil6IIUAR.XEcYJuGYtK', 2),
(15, 'superviseur', '$2y$10$VND54Ww1CKHwjLZINHzTI.UMRO66hZsvu8oASXJLxfRUnGtlisv0C', 3),
(16, 'moi', '', 1);

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE `vente` (
  `id_facture` int(11) NOT NULL,
  `id_production` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix_unitaire` float NOT NULL,
  `prix_total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`id_facture`, `id_production`, `quantite`, `prix_unitaire`, `prix_total`) VALUES
(1, 2, 2, 1, 2),
(2, 2, 1, 1, 1),
(2, 3, 1, 4.2, 4.2),
(3, 3, 2, 4.2, 8.4),
(4, 4, 0, 0.15, 0),
(5, 4, 1, 0.15, 0.15),
(6, 4, 0, 1.15, 0),
(7, 4, 0, 0.15, 0),
(10, 4, 2, 0.5, 1),
(11, 4, 2, 0.15, 0.3),
(5, 5, 1, 1, 1),
(8, 5, 0, 1, 0),
(9, 5, 1, 1, 1),
(10, 5, 3, 3, 9),
(12, 7, 1, 8.5, 8.5);

-- --------------------------------------------------------

--
-- Structure de la vue `total_atelier`
--
DROP TABLE IF EXISTS `total_atelier`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_atelier`  AS   (select `atelier`.`id` AS `id`,`atelier`.`nom` AS `nom`,`vente`.`id_facture` AS `id_facture`,`vente`.`id_production` AS `id_production`,`vente`.`prix_total` AS `prix_total` from (((`facture` join `vente` on((`vente`.`id_facture` = `facture`.`id`))) join `production` on((`vente`.`id_production` = `production`.`id`))) join `atelier` on((`production`.`id_atelier` = `atelier`.`id`))) where ((`facture`.`date_reglement` is not null) and (`facture`.`date_reglement` between '2010-10-10' and '2034-10-10')))  ;

-- --------------------------------------------------------

--
-- Structure de la vue `total_atelier_non_paye`
--
DROP TABLE IF EXISTS `total_atelier_non_paye`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_atelier_non_paye`  AS SELECT `atelier`.`id` AS `id`, `atelier`.`nom` AS `nom`, `vente`.`id_facture` AS `id_facture`, `vente`.`id_production` AS `id_production`, `vente`.`prix_total` AS `prix_total` FROM (`atelier` left join (`production` left join (`vente` left join `facture` on((`vente`.`id_facture` = `facture`.`id`))) on((`production`.`id` = `vente`.`id_production`))) on((`atelier`.`id` = `production`.`id_atelier`))) WHERE isnull(`facture`.`date_reglement`) GROUP BY `atelier`.`id` ORDER BY `atelier`.`id` ASC ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `atelier`
--
ALTER TABLE `atelier`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categorie_client`
--
ALTER TABLE `categorie_client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `destruction`
--
ALTER TABLE `destruction`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `famille_produit`
--
ALTER TABLE `famille_produit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mode_reglement`
--
ALTER TABLE `mode_reglement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `production`
--
ALTER TABLE `production`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `transfert`
--
ALTER TABLE `transfert`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_produit`
--
ALTER TABLE `type_produit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `unite`
--
ALTER TABLE `unite`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`id_production`,`id_facture`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `atelier`
--
ALTER TABLE `atelier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `categorie_client`
--
ALTER TABLE `categorie_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `destruction`
--
ALTER TABLE `destruction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `famille_produit`
--
ALTER TABLE `famille_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `mode_reglement`
--
ALTER TABLE `mode_reglement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `production`
--
ALTER TABLE `production`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `professeur`
--
ALTER TABLE `professeur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `transfert`
--
ALTER TABLE `transfert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `type_produit`
--
ALTER TABLE `type_produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT pour la table `unite`
--
ALTER TABLE `unite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
