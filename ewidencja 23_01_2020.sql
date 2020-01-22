-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Czas generowania: 22 Sty 2020, 23:55
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

DELIMITER $$
--
-- Procedury
--
DROP PROCEDURE IF EXISTS `WydajSprzet`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `WydajSprzet` (`ID_s` INT, `id_u` INT, `dat` DATE, `Opis` VARCHAR(100))  BEGIN
	INSERT INTO wydania VALUES (NULL, ID_s, ID_u, dat, Opis);
	UPDATE sprzet SET ID_uzytkownika = ID_u WHERE sprzet.ID_sprzetu = ID_u;
	COMMIT;
END$$

DROP PROCEDURE IF EXISTS `ZwrocSprzet`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ZwrocSprzet` (`ID_s` INT, `id_u` INT, `dat` DATE, `Opis` VARCHAR(100))  BEGIN
	INSERT INTO zwroty VALUES (NULL, ID_s, ID_u, dat, Opis);
	UPDATE sprzet SET ID_uzytkownika = NULL WHERE sprzet.ID_sprzetu = ID_s;
	COMMIT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dzial`
--

DROP TABLE IF EXISTS `dzial`;
CREATE TABLE IF NOT EXISTS `dzial` (
  `ID_dzialu` int(4) NOT NULL AUTO_INCREMENT,
  `Nazwa` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `Miejscowosc` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `Adres` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`ID_dzialu`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `dzial`
--

INSERT INTO `dzial` (`ID_dzialu`, `Nazwa`, `Miejscowosc`, `Adres`) VALUES
(4, 'IT', 'Rzeszów', 'Konarskiego 5'),
(5, 'HR', 'Rzeszów', 'Konarskiego 12'),
(6, 'BOK', 'Sędziłow MŁP', 'Słoneczna 37');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `producent`
--

DROP TABLE IF EXISTS `producent`;
CREATE TABLE IF NOT EXISTS `producent` (
  `ID_producenta` int(4) NOT NULL AUTO_INCREMENT,
  `Nazwa` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`ID_producenta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `producent`
--

INSERT INTO `producent` (`ID_producenta`, `Nazwa`) VALUES
(1, 'Samsung'),
(2, 'Lenovo'),
(3, 'Siemens'),
(4, 'Iiyama'),
(5, 'DELL');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprzet`
--

DROP TABLE IF EXISTS `sprzet`;
CREATE TABLE IF NOT EXISTS `sprzet` (
  `ID_sprzetu` int(4) NOT NULL AUTO_INCREMENT,
  `Typ` int(4) NOT NULL,
  `Producent` int(4) NOT NULL,
  `Model` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `Nr_seryjny` varchar(25) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL COMMENT 'Numer seryjny',
  `Nr_inwentarzowy` varchar(10) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL COMMENT 'Numer Inwentarzowy',
  `ID_uzytkownika` int(4) DEFAULT NULL,
  PRIMARY KEY (`ID_sprzetu`),
  KEY `Producent` (`Producent`),
  KEY `Typ` (`Typ`),
  KEY `ID_uzytkownika` (`ID_uzytkownika`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Urządzenia';

--
-- Zrzut danych tabeli `sprzet`
--

INSERT INTO `sprzet` (`ID_sprzetu`, `Typ`, `Producent`, `Model`, `Nr_seryjny`, `Nr_inwentarzowy`, `ID_uzytkownika`) VALUES
(21, 1, 5, 'OptiPlex 9090', '123456', 'PC001', 1),
(22, 2, 2, 'Thinkpad L540', '234561', 'L001', 3),
(23, 2, 2, 'ThinkPad E450', '345612', 'L002', 4),
(24, 3, 4, 'XU2290HS', '45612', 'M001', 1),
(25, 5, 3, 'OpenStage 60T', '561234', 'TS001', 3),
(26, 4, 1, 'A20e', '612345', 'TK001', 3),
(27, 4, 1, 'A30s', '112345', 'TK002', 4),
(28, 1, 5, 'OptiPlex 7010', '3432713', 'PC002', 2),
(29, 3, 4, 'XU2290HS', '784563', 'M002', 2),
(30, 5, 3, 'OpenStage 40T', '976585', 'TS002', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stanowiska`
--

DROP TABLE IF EXISTS `stanowiska`;
CREATE TABLE IF NOT EXISTS `stanowiska` (
  `ID_stanowiska` int(4) NOT NULL AUTO_INCREMENT,
  `Nazwa` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`ID_stanowiska`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `stanowiska`
--

INSERT INTO `stanowiska` (`ID_stanowiska`, `Nazwa`) VALUES
(1, 'Specjalista ds. IT'),
(2, 'Specjalista ds. Kadr'),
(3, 'Specjalista ds. Obsł');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `typ_sprzetu`
--

DROP TABLE IF EXISTS `typ_sprzetu`;
CREATE TABLE IF NOT EXISTS `typ_sprzetu` (
  `ID_typu` int(4) NOT NULL AUTO_INCREMENT,
  `Nazwa` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`ID_typu`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `typ_sprzetu`
--

INSERT INTO `typ_sprzetu` (`ID_typu`, `Nazwa`) VALUES
(1, 'Komputer PC'),
(2, 'Laptop'),
(3, 'Monitor'),
(4, 'Telefon komórkowy'),
(5, 'Telefon stacjonarny');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

DROP TABLE IF EXISTS `uzytkownik`;
CREATE TABLE IF NOT EXISTS `uzytkownik` (
  `ID_uzytkownika` int(4) NOT NULL AUTO_INCREMENT,
  `Imie` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `Nazwisko` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `ID_stanowiska` int(4) NOT NULL,
  `ID_dzialu` int(4) NOT NULL,
  PRIMARY KEY (`ID_uzytkownika`),
  KEY `ID_dzialu` (`ID_dzialu`),
  KEY `ID_stanowiska` (`ID_stanowiska`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `uzytkownik`
--

INSERT INTO `uzytkownik` (`ID_uzytkownika`, `Imie`, `Nazwisko`, `ID_stanowiska`, `ID_dzialu`) VALUES
(1, 'Adam', 'Kochalski', 1, 4),
(2, 'Joanna', 'Konstantynopolitańki', 2, 5),
(3, 'Piotr', 'Kowalski', 3, 6),
(4, 'Justyna', 'Bielawska', 3, 6),
(5, 'Daniel', 'Polański', 3, 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wydania`
--

DROP TABLE IF EXISTS `wydania`;
CREATE TABLE IF NOT EXISTS `wydania` (
  `ID_wydania` int(4) NOT NULL AUTO_INCREMENT,
  `ID_sprzetu` int(4) NOT NULL,
  `ID_uzytkownika` int(4) NOT NULL,
  `data_wydania` date NOT NULL,
  `Opis` varchar(100) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`ID_wydania`),
  KEY `ID_sprzetu` (`ID_sprzetu`),
  KEY `ID_uzytkownika` (`ID_uzytkownika`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `wydania`
--

INSERT INTO `wydania` (`ID_wydania`, `ID_sprzetu`, `ID_uzytkownika`, `data_wydania`, `Opis`) VALUES
(1, 23, 3, '2020-01-16', 'Nowy laptop'),
(2, 27, 3, '2020-01-16', 'Nowy telefon'),
(3, 22, 4, '2020-01-14', 'Używany. Wytarty klawisz Enter oraz dwie widoczne rysy na klapie sprzętu.'),
(4, 26, 4, '2020-01-15', 'Używany telefon, jedna rysa obok napisu \"samsung\" na ekranie. Nowe Etui oraz szkło hartowane na ekra'),
(5, 30, 2, '2020-01-17', 'Nowy telefon.'),
(6, 30, 2, '2020-01-23', 'Nowy Telefon');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zwroty`
--

DROP TABLE IF EXISTS `zwroty`;
CREATE TABLE IF NOT EXISTS `zwroty` (
  `ID_zwrotu` int(4) NOT NULL AUTO_INCREMENT,
  `ID_sprzetu` int(4) NOT NULL,
  `ID_uzytkownika` int(4) NOT NULL,
  `data_zwrotu` date NOT NULL,
  `Opis` varchar(100) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`ID_zwrotu`),
  KEY `ID_sprzetu` (`ID_sprzetu`),
  KEY `ID_uzytkownika` (`ID_uzytkownika`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `zwroty`
--

INSERT INTO `zwroty` (`ID_zwrotu`, `ID_sprzetu`, `ID_uzytkownika`, `data_zwrotu`, `Opis`) VALUES
(1, 22, 5, '2020-01-12', 'Wytarty klawisz Enter, dwie widoczne rysy na klapie laptopa.'),
(2, 26, 5, '2020-01-12', 'Widoczna rysa na ekranie obok napisu \"Samsung\"'),
(3, 30, 2, '2020-01-21', 'Słabo widoczne ślady użytkowania'),
(5, 30, 2, '2020-01-25', 'Słabo widoczne ślady uzytkowania');

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `sprzet`
--
ALTER TABLE `sprzet`
  ADD CONSTRAINT `sprzet_ibfk_2` FOREIGN KEY (`Producent`) REFERENCES `producent` (`ID_producenta`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `sprzet_ibfk_3` FOREIGN KEY (`Typ`) REFERENCES `typ_sprzetu` (`ID_typu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `sprzet_ibfk_4` FOREIGN KEY (`ID_uzytkownika`) REFERENCES `uzytkownik` (`ID_uzytkownika`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ograniczenia dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD CONSTRAINT `uzytkownik_ibfk_1` FOREIGN KEY (`ID_dzialu`) REFERENCES `dzial` (`ID_dzialu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `uzytkownik_ibfk_2` FOREIGN KEY (`ID_stanowiska`) REFERENCES `stanowiska` (`ID_stanowiska`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ograniczenia dla tabeli `wydania`
--
ALTER TABLE `wydania`
  ADD CONSTRAINT `wydania_ibfk_1` FOREIGN KEY (`ID_sprzetu`) REFERENCES `sprzet` (`ID_sprzetu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `wydania_ibfk_2` FOREIGN KEY (`ID_uzytkownika`) REFERENCES `uzytkownik` (`ID_uzytkownika`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ograniczenia dla tabeli `zwroty`
--
ALTER TABLE `zwroty`
  ADD CONSTRAINT `zwroty_ibfk_1` FOREIGN KEY (`ID_sprzetu`) REFERENCES `sprzet` (`ID_sprzetu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `zwroty_ibfk_2` FOREIGN KEY (`ID_uzytkownika`) REFERENCES `uzytkownik` (`ID_uzytkownika`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
