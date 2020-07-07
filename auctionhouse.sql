-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Jul 2020 um 15:32
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `auctionhouse`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bid_for_set`
--

CREATE TABLE `bid_for_set` (
  `bid_id` int(11) NOT NULL,
  `fk_set_id` int(11) DEFAULT NULL,
  `fk_costumer_id` varchar(10) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date_and_hour` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `costumer`
--

CREATE TABLE `costumer` (
  `user_name` varchar(10) NOT NULL,
  `passwort` varchar(20) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `products`
--

CREATE TABLE `products` (
  `catalog_code` varchar(30) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `brief_description` varchar(50) DEFAULT NULL,
  `photo` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sets`
--

CREATE TABLE `sets` (
  `set_id` int(11) NOT NULL,
  `fk_catalog_number` varchar(30) DEFAULT NULL,
  `start_price` double DEFAULT NULL,
  `heighest_bid` double DEFAULT NULL,
  `remaining_auction_time` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `bid_for_set`
--
ALTER TABLE `bid_for_set`
  ADD PRIMARY KEY (`bid_id`),
  ADD KEY `fk_set_id` (`fk_set_id`),
  ADD KEY `fk_costumer_id` (`fk_costumer_id`);

--
-- Indizes für die Tabelle `costumer`
--
ALTER TABLE `costumer`
  ADD PRIMARY KEY (`user_name`);

--
-- Indizes für die Tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`catalog_code`);

--
-- Indizes für die Tabelle `sets`
--
ALTER TABLE `sets`
  ADD PRIMARY KEY (`set_id`),
  ADD KEY `fk_catalog_number` (`fk_catalog_number`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `bid_for_set`
--
ALTER TABLE `bid_for_set`
  ADD CONSTRAINT `bid_for_set_ibfk_1` FOREIGN KEY (`fk_set_id`) REFERENCES `sets` (`set_id`),
  ADD CONSTRAINT `bid_for_set_ibfk_2` FOREIGN KEY (`fk_costumer_id`) REFERENCES `costumer` (`user_name`);

--
-- Constraints der Tabelle `sets`
--
ALTER TABLE `sets`
  ADD CONSTRAINT `sets_ibfk_1` FOREIGN KEY (`fk_catalog_number`) REFERENCES `products` (`catalog_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
