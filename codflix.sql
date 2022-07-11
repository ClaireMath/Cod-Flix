-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : ven. 08 juil. 2022 à 14:32
-- Version du serveur :  5.7.32
-- Version de PHP : 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données : `codflix`
--

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
                         `id` int(11) NOT NULL,
                         `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
                                       (1, 'Action'),
                                       (2, 'Horror'),
                                       (3, 'Science-Fiction'),
                                       (4, 'Thriller'),
                                       (5, 'Comedy'),
                                       (6, 'Drama');

-- --------------------------------------------------------

--
-- Structure de la table `history`
--

CREATE TABLE `history` (
                           `id` int(11) NOT NULL,
                           `user_id` int(11) NOT NULL,
                           `media_id` int(11) NOT NULL,
                           `start_date` datetime NOT NULL,
                           `finish_date` datetime DEFAULT NULL,
                           `watch_duration` int(11) NOT NULL DEFAULT '0' COMMENT 'in seconds'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
                         `id` int(11) NOT NULL,
                         `genre_id` int(11) NOT NULL,
                         `title` varchar(100) NOT NULL,
                         `type` varchar(20) NOT NULL,
                         `status` varchar(20) NOT NULL,
                         `release_date` date NOT NULL,
                         `summary` longtext NOT NULL,
                         `trailer_url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `genre_id`, `title`, `type`, `status`, `release_date`, `summary`, `trailer_url`) VALUES
                                                                                                                (1, 3, 'Back to the Future', 'movie', '', '1985-10-30', 'Back to the Future is a 1985 American science fiction film directed by Robert Zemeckis, and written by Zemeckis and Bob Gale. It stars Michael J. Fox, Christopher Lloyd, Lea Thompson, Crispin Glover, and Thomas F. Wilson. Set in 1985, the story follows Marty McFly (Fox), a teenager accidentally sent back to 1955 in a time-traveling DeLorean automobile built by his eccentric scientist friend Emmett \"Doc\" Brown (Lloyd). While in the past, Marty inadvertently prevents his future parents from falling in love—threatening his existence—and is forced to reconcile the pair and somehow get back to the future.', 'https://www.youtube.com/embed/qvsgGtivCgs'),
                                                                                                                (2, 4, 'Shutter Island', 'movie', '', '2010-02-24', 'In 1954, up-and-coming U.S. marshal Teddy Daniels is assigned to investigate the disappearance of a patient from Boston\'s Shutter Island Ashecliffe Hospital. He\'s been pushing for an assignment on the island for personal reasons, but before long he thinks he\'s been brought there as part of a twisted plot by hospital doctors whose radical treatments range from unethical to illegal to downright sinister. Teddy\'s shrewd investigating skills soon provide a promising lead, but the hospital refuses him access to records he suspects would break the case wide open. As a hurricane cuts off communication with the mainland, more dangerous criminals \'escape\' in the confusion, and the puzzling, improbable clues multiply, Teddy begins to doubt everything - his memory, his partner, even his own sanity.', 'https://www.youtube.com/embed/5iaYLCiq5RM'),
                                                                                                                (3, 3, 'Stranger Things', 'series', '', '2016-07-15', 'Stranger Things is set in the fictional rural town of Hawkins, Indiana, during the 1980s. The nearby Hawkins National Laboratory ostensibly performs scientific research for the United States Department of Energy, but secretly does experiments into the paranormal and supernatural, including those that involve human test subjects. Inadvertently, they have created a portal to an alternate dimension, \"the Upside Down\". The influence of the Upside Down starts to affect the unknowing residents of Hawkins in calamitous ways.', 'https://www.youtube.com/embed/mnd7sFt5c3A'),
                                                                                                                (4, 5, 'The IT Crowd', 'series', '', '2006-02-03', 'The IT Crowd is set in the offices of Reynholm Industries, a fictional British corporation at 123 Carenden Road in Central London. It focuses on the shenanigans of the three members of the IT support team, who dwell in a dingy, cluttered basement—a great contrast to the shining modern architecture and stunning London views enjoyed by the rest of the organisation. The obscurity surrounding the company\'s business is a running gag; all that is known is that it bought and sold ITV, has a chemicals laboratory, and makes an unnamed product. In one episode, Denholm Reynholm claims the company has bought mobile-phone carriers and television stations, creating \"the largest communications empire in the UK\", but it is unclear whether this is true.', 'https://www.youtube.com/embed/MwwTfkXk7U0'),
                                                                                                                (5, 3, 'Back to the Future II', 'movie', '', '1989-12-20', 'Marty McFly has only just gotten back from the past, when he is once again picked up by Dr. Emmett Brown and sent through time to the future. Marty\'s job in the future is to pose as his own son to prevent him from being thrown in prison. Unfortunately, things get worse when the future changes the present.', 'https://www.youtube.com/embed/MdENmefJRpw'),
                                                                                                                (6, 3, 'Back to the Future III', 'movie', '', '1990-07-18', 'Stranded in 1955, Marty McFly receives written word from his friend, Doctor Emmett Brown, as to where can be found the DeLorean time machine. However, an unfortunate discovery prompts Marty to go to his friend\'s aid. Using the time machine, Marty travels to the old west where his friend has run afoul of a gang of thugs and has fallen in love with a local schoolteacher. Using the technology from the time, Marty and Emmett devise one last chance to send the two of them back to the future.', 'https://www.youtube.com/embed/3C8c3EoEfw4');

-- --------------------------------------------------------

--
-- Structure de la table `stream`
--

CREATE TABLE `stream` (
                          `id` int(11) NOT NULL,
                          `name_series` varchar(100) NOT NULL,
                          `season_number` int(11) NOT NULL,
                          `episode_number` int(11) NOT NULL,
                          `episode_title` varchar(100) NOT NULL,
                          `duration` time NOT NULL,
                          `stream_description` longtext NOT NULL,
                          `stream_trailer_url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
                        `id` int(11) NOT NULL,
                        `email` varchar(254) NOT NULL,
                        `password` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
                                                   (1, 'coding@factory.fr', '123456'),
                                                   (3, 'claira.m@live.fr', 'z'),
                                                   (5, 'robin@robin.fr', 'password');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
    ADD PRIMARY KEY (`id`);

--
-- Index pour la table `history`
--
ALTER TABLE `history`
    ADD PRIMARY KEY (`id`),
    ADD KEY `history_user_id_fk_media_id` (`user_id`),
    ADD KEY `history_media_id_fk_media_id` (`media_id`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
    ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stream`
--
ALTER TABLE `stream`
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
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `history`
--
ALTER TABLE `history`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `media`
--
ALTER TABLE `media`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `stream`
--
ALTER TABLE `stream`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `history`
--
ALTER TABLE `history`
    ADD CONSTRAINT `history_media_id_fk_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `history_user_id_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
