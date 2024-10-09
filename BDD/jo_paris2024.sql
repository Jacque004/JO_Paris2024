-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 09 oct. 2024 à 12:56
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Déclaration de variables pour les anciens paramètres d'encodage
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Base de données : `jo_paris2024`
--
-- --------------------------------------------------------

-- Structure de la table `athletes`
CREATE TABLE `athletes` (
  `athlete_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `sport_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Structure de la table `countries`
CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(100) DEFAULT NULL,
  `country_code` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Structure de la table `events`
CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `sport_id` int(11) NOT NULL,
  `venue_id` int(11) NOT NULL,
  `event_date` datetime DEFAULT NULL,
  `round` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Structure de la table `results`
CREATE TABLE `results` (
  `result_id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `athlete_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `performance` varchar(255) DEFAULT NULL,
  `medal` enum('Or','Argent','Bronze','Aucun') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Structure de la table `sports`
CREATE TABLE `sports` (
  `sport_id` int(11) NOT NULL,
  `sport_name` varchar(100) DEFAULT NULL,
  `category` enum('individuel','équipe') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Structure de la table `teams`
CREATE TABLE `teams` (
  `team_id` int(11) NOT NULL,
  `team_name` varchar(255) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `sport_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Structure de la table `teams_members`
CREATE TABLE `teams_members` (
  `team_id` int(11) NOT NULL,
  `athlete_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Structure de la table `venues`
CREATE TABLE `venues` (
  `venue_id` int(11) NOT NULL,
  `venue_name` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Index pour la table `athletes`
ALTER TABLE `athletes`
  ADD PRIMARY KEY (`athlete_id`);

-- Index pour la table `countries`
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`);

-- Index pour la table `events`
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

-- Index pour la table `results`
ALTER TABLE `results`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `athlete_id` (`athlete_id`);

-- Index pour la table `sports`
ALTER TABLE `sports`
  ADD PRIMARY KEY (`sport_id`);

-- Index pour la table `teams`
ALTER TABLE `teams`
  ADD PRIMARY KEY (`team_id`);

-- Index pour la table `venues`
ALTER TABLE `venues`
  ADD PRIMARY KEY (`venue_id`);

-- AUTO_INCREMENT pour les tables `athletes`, `countries`, `events`, `results`, `sports`, `teams`
ALTER TABLE `athletes`
  MODIFY `athlete_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `sports`
  MODIFY `sport_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `teams`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT;

-- Contraintes pour la table `results`
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`athlete_id`) REFERENCES `athletes` (`athlete_id`);

-- Insertions dans les tables

-- Insertion dans la table `countries`
INSERT INTO countries (country_id, country_name, country_code) VALUES
(1, 'France', 'FRA'),
(2, 'United States', 'USA'),
(3, 'Japan', 'JPN'),
(4, 'Germany', 'GER'),
(5, 'Brazil', 'BRA'),
(6, 'Italy', 'ITA'),
(7, 'Australia', 'AUS'),
(8, 'China', 'CHN'),
(9, 'United Kingdom', 'GBR'),
(10, 'Canada', 'CAN'),
(11, 'Spain', 'ESP'),
(12, 'Mexico', 'MEX'),
(13, 'Argentina', 'ARG'),
(14, 'South Korea', 'KOR'),
(15, 'Russia', 'RUS'),
(16, 'India', 'IND'),
(17, 'Netherlands', 'NLD'),
(18, 'South Africa', 'ZAF'),
(19, 'New Zealand', 'NZL'),
(20, 'Sweden', 'SWE'),
(21, 'Norway', 'NOR'),
(22, 'Denmark', 'DEN'),
(23, 'Finland', 'FIN'),
(24, 'Poland', 'POL'),
(25, 'Turkey', 'TUR'),
(26, 'Egypt', 'EGY'),
(27, 'Chile', 'CHI'),
(28, 'Colombia', 'COL'),
(29, 'Greece', 'GRE'),
(30, 'Belgium', 'BEL');

-- Insertion dans la table `sports`
INSERT INTO sports (sport_id, sport_name, category) VALUES
(1, 'Athletics', 'individuel'),
(2, 'Swimming', 'individuel'),
(3, 'Basketball', 'équipe'),
(4, 'Football', 'équipe'),
(5, 'Cycling', 'individuel'),
(6, 'Gymnastics', 'individuel'),
(7, 'Tennis', 'individuel'),
(8, 'Volleyball', 'équipe'),
(9, 'Boxing', 'individuel'),
(10, 'Fencing', 'individuel'),
(11, 'Archery', 'individuel'),
(12, 'Badminton', 'individuel'),
(13, 'Handball', 'équipe'),
(14, 'Wrestling', 'individuel'),
(15, 'Table Tennis', 'individuel'),
(16, 'Judo', 'individuel'),
(17, 'Rowing', 'équipe'),
(18, 'Shooting', 'individuel'),
(19, 'Skateboarding', 'individuel'),
(20, 'Surfing', 'individuel'),
(21, 'Triathlon', 'individuel'),
(22, 'Weightlifting', 'individuel'),
(23, 'Equestrian', 'individuel'),
(24, 'Rugby', 'équipe'),
(25, 'Baseball', 'équipe'),
(26, 'Softball', 'équipe'),
(27, 'Karate', 'individuel'),
(28, 'Taekwondo', 'individuel'),
(29, 'Climbing', 'individuel'),
(30, 'Canoe/Kayak', 'individuel');
