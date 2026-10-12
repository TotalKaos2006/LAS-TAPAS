-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 12 okt 2026 om 08:53
-- Serverversie: 8.4.7
-- PHP-versie: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lastapas`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `arrangementen`
--

DROP TABLE IF EXISTS `arrangementen`;
CREATE TABLE IF NOT EXISTS `arrangementen` (
  `Naam` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Prijs` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Beschrijving` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `dranken`
--

DROP TABLE IF EXISTS `dranken`;
CREATE TABLE IF NOT EXISTS `dranken` (
  `Naam` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Prijs` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Aantal` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `18+` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `dranken`
--

INSERT INTO `dranken` (`Naam`, `Prijs`, `Aantal`, `18+`) VALUES
('Vino tinto', '', '', 'Ja'),
('Vino blanco', '', '', 'Ja'),
('Vino rosado', '', '', 'Ja'),
('Sangría', '', '', 'Ja'),
('Tinto de verano', '', '', 'Ja'),
('Cerveza', '', '', 'Ja'),
('Agua mineral', '', '', 'Nee'),
('Refrescos', '', '', 'Nee'),
('Zumo de naranja', '', '', 'Nee'),
('Café solo', '', '', 'Nee'),
('Café con leche', '', '', 'Nee'),
('Cortado', '', '', 'Nee');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `financien`
--

DROP TABLE IF EXISTS `financien`;
CREATE TABLE IF NOT EXISTS `financien` (
  `Transactie_ID` int NOT NULL AUTO_INCREMENT,
  `Datum` date DEFAULT NULL,
  `Omschrijving` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Bedrag` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Transactie_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gerechten`
--

DROP TABLE IF EXISTS `gerechten`;
CREATE TABLE IF NOT EXISTS `gerechten` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Naam` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Categorie` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Aantal` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `gerechten`
--

INSERT INTO `gerechten` (`ID`, `Naam`, `Categorie`, `Aantal`) VALUES
(1, 'Aceitunas marinadas', 'Tapas frías', NULL),
(2, 'Pan con tomate', 'Tapas frías', NULL),
(3, 'Tabla de quesos españoles', 'Tapas frías', NULL),
(4, 'Jamón serrano', 'Tapas frías', NULL),
(5, 'Ensalada de atún', 'Tapas frías', NULL),
(6, 'Gazpacho', 'Tapas frías', NULL),
(7, 'Salmonero', 'Tapas frías', NULL),
(8, 'Ensalada mixta', 'Tapas frías', NULL),
(9, 'Boquerones en vinagre', 'Tapas frías', NULL),
(10, 'Cóctel de gambas', 'Tapas frías', NULL),
(11, 'Patatas bravas', 'Tapas calientes', NULL),
(12, 'Patatas alioli', 'Tapas calientes', NULL),
(13, 'Gambas al ajillo', 'Tapas calientes', NULL),
(14, 'Calamares fritos', 'Tapas calientes', NULL),
(15, 'Croquetas', 'Tapas calientes', NULL),
(16, 'Dátiles con bacon', 'Tapas calientes', NULL),
(17, 'Alitas de pollo', 'Tapas calientes', NULL),
(18, 'Pollo al ajillo', 'Tapas calientes', NULL),
(19, 'Chorizo a la sidra', 'Tapas calientes', NULL),
(20, 'Chorizo al vino', 'Tapas calientes', NULL),
(21, 'Pimientos de padrón', 'Tapas calientes', NULL),
(22, 'Champiñones al ajillo', 'Tapas calientes', NULL),
(23, 'Tortilla española', 'Especialidades', NULL),
(24, 'Huevos rotos', 'Especialidades', NULL),
(25, 'Pinchos morunos', 'Especialidades', NULL),
(26, 'Pulpo a la gallega', 'Especialidades', NULL),
(27, 'Mini paella de mariscos', 'Especialidades', NULL),
(28, 'Mini paella de pollo', 'Especialidades', NULL),
(29, 'Paella mixta (tapa pequeña)', 'Especialidades', NULL),
(30, 'Empanadillas', 'Especialidades', NULL),
(31, 'Berenjenas fritas con miel', 'Especialidades', NULL),
(32, 'Lomo a la plancha', 'Especialidades', NULL),
(33, 'Montaditos variados', 'Especialidades', NULL),
(34, 'Pan con alioli', 'Especialidades', NULL),
(35, 'Crema catalana', 'Postres', NULL),
(36, 'Flan', 'Postres', NULL),
(37, 'Arroz con leche', 'Postres', NULL),
(38, 'Churros con chocolate', 'Postres', NULL),
(39, 'Tarta de Santiago', 'Postres', NULL),
(40, 'Leche frita', 'Postres', NULL),
(41, 'Helado de vainilla', 'Postres', NULL),
(42, 'Natillas', 'Postres', NULL),
(43, 'Fresas con nata', 'Postres', NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `personeel`
--

DROP TABLE IF EXISTS `personeel`;
CREATE TABLE IF NOT EXISTS `personeel` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Achternaam` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Functie` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Telefoonnummer` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Uurloon` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tafels`
--

DROP TABLE IF EXISTS `tafels`;
CREATE TABLE IF NOT EXISTS `tafels` (
  `Nummer` int NOT NULL,
  `Naam_Reservering` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Gekozen_Arrangement` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Plaats` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Aantal_Personen` int DEFAULT NULL,
  PRIMARY KEY (`Nummer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `tafels`
--

INSERT INTO `tafels` (`Nummer`, `Naam_Reservering`, `Gekozen_Arrangement`, `Status`, `Plaats`, `Aantal_Personen`) VALUES
(1, '', '', 'Beschikbaar', 'Begane grond', 0),
(2, '', '', 'Beschikbaar', 'Begane grond', 0),
(3, '', '', 'Beschikbaar', 'Begane grond', 0),
(4, '', '', 'Beschikbaar', 'Begane grond', 0),
(5, '', '', 'Beschikbaar', 'Begane grond', 0),
(6, '', '', 'Beschikbaar', 'Begane grond', 0),
(7, '', '', 'Beschikbaar', 'Begane grond', 0),
(8, '', '', 'Beschikbaar', 'Begane grond', 0),
(9, '', '', 'Beschikbaar', 'Begane grond', 0),
(10, '', '', 'Beschikbaar', 'Begane grond', 0),
(11, '', '', 'Beschikbaar', 'Eerste verdieping', 0),
(12, '', '', 'Beschikbaar', 'Eerste verdieping', 0),
(13, '', '', 'Beschikbaar', 'Eerste verdieping', 0),
(14, '', '', 'Beschikbaar', 'Eerste verdieping', 0),
(15, '', '', 'Beschikbaar', 'Eerste verdieping', 0),
(16, '', '', 'Beschikbaar', 'Eerste verdieping', 0),
(17, '', '', 'Beschikbaar', 'Eerste verdieping', 0),
(18, '', '', 'Beschikbaar', 'Eerste verdieping', 0),
(19, '', '', 'Beschikbaar', 'Eerste verdieping', 0),
(20, '', '', 'Beschikbaar', 'Eerste verdieping', 0),
(21, '', '', 'Beschikbaar', 'Eerste verdieping', 0),
(22, '', '', 'Beschikbaar', 'Eerste verdieping', 0),
(23, '', '', 'Beschikbaar', 'Eerste verdieping', 0),
(24, '', '', 'Beschikbaar', 'Eerste verdieping', 0),
(25, '', '', 'Beschikbaar', 'Eerste verdieping', 0),
(26, '', '', 'Beschikbaar', 'Eerste verdieping', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
