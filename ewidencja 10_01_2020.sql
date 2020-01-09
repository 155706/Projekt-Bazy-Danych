-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Czas generowania: 09 Sty 2020, 23:29
-- Wersja serwera: 8.0.18
-- Wersja PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `ewidencja`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dzial`
--

DROP TABLE IF EXISTS `dzial`;
CREATE TABLE IF NOT EXISTS `dzial` (
  `ID_dzialu` int(4) NOT NULL AUTO_INCREMENT,
  `Nazwa` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`ID_dzialu`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `dzial`
--

INSERT INTO `dzial` (`ID_dzialu`, `Nazwa`) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Spedycja');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprzet`
--

DROP TABLE IF EXISTS `sprzet`;
CREATE TABLE IF NOT EXISTS `sprzet` (
  `ID_sprzetu` int(4) NOT NULL AUTO_INCREMENT,
  `Typ` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `Producent` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `Model` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `Nr_ser` varchar(25) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL COMMENT 'Numer seryjny',
  `Nr_inwen` varchar(10) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL COMMENT 'Numer Inwentarzowy',
  `ID_uzytkownika` int(4) DEFAULT NULL,
  PRIMARY KEY (`ID_sprzetu`),
  KEY `ID_uzytkownika` (`ID_uzytkownika`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Urządzenia';

--
-- Zrzut danych tabeli `sprzet`
--

INSERT INTO `sprzet` (`ID_sprzetu`, `Typ`, `Producent`, `Model`, `Nr_ser`, `Nr_inwen`, `ID_uzytkownika`) VALUES
(0, 'Komputer', 'DELL', 'OptiPlex 9090', '1000', 'PC000', 0),
(1, 'Komputer', 'DELL', 'OptiPlex 9090', '1001', 'PC001', 1),
(2, 'Komputer', 'DELL', 'OptiPlex 9090', '1002', 'PC002', 2),
(3, 'Notebook', 'Lenovo', 'ThinkPad L540', '2001', 'NT001', 4),
(4, 'Notebook', 'Lenovo', 'ThinkPad L540', '2002', 'NT002', 5),
(5, 'Telefon stacjonarny', 'Siemens', 'OpenStage 60', '3001', 'TS001', 0),
(6, 'Telefon stacjonarny', 'Siemens', 'OpenStage 60', '3002', 'TS002', 1),
(7, 'Telefon stacjonarny', 'Siemens', 'OpenStage 60', '3003', 'TS003', 2),
(8, 'Telefon komórkowy', 'Samsung', 'A20e', '4001', 'TK001', 4),
(9, 'Telefon komórkowy', 'Samsung', 'A20e', '4002', 'TK002', 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

DROP TABLE IF EXISTS `uzytkownik`;
CREATE TABLE IF NOT EXISTS `uzytkownik` (
  `ID_uzytkownika` int(4) NOT NULL,
  `Imie` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `Nazwisko` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `Stanowisko` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `ID_dzialu` int(4) NOT NULL,
  PRIMARY KEY (`ID_uzytkownika`),
  KEY `ID_dzialu` (`ID_dzialu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `uzytkownik`
--

INSERT INTO `uzytkownik` (`ID_uzytkownika`, `Imie`, `Nazwisko`, `Stanowisko`, `ID_dzialu`) VALUES
(0, 'Janina', 'Nowak', 'Kadrowa', 2),
(1, 'Jan', 'Kowalski', 'Informatyk', 1),
(2, 'Adam', 'Kochany', 'Specjalista ds. IT', 1),
(4, 'Dariusz', 'Kopala', 'Spedytor', 3),
(5, 'Barbara', 'Woźna', 'Spedytor międzynarod', 3);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `sprzet`
--
ALTER TABLE `sprzet`
  ADD CONSTRAINT `sprzet_ibfk_1` FOREIGN KEY (`ID_uzytkownika`) REFERENCES `uzytkownik` (`ID_uzytkownika`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ograniczenia dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD CONSTRAINT `uzytkownik_ibfk_1` FOREIGN KEY (`ID_dzialu`) REFERENCES `dzial` (`ID_dzialu`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
