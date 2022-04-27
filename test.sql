-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Čtv 16. pro 2021, 18:38
-- Verze serveru: 10.4.22-MariaDB
-- Verze PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `test`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `name`, `email`, `content`, `created_at`) VALUES
(24, 8, 'test1', 'radous.vilimek@seznam.cz', 'Koment 1', '2021-12-16 16:55:06'),
(25, 8, 'test2', 'radous.vilimek@seznam.cz', 'Koment 2', '2021-12-16 16:55:17'),
(26, 12, 'test1', 'radous.vilimek@seznam.cz', 'Koment 1', '2021-12-16 17:07:27'),
(27, 12, 'test 2', 'radous.vilimek@seznam.cz', 'Koment 2', '2021-12-16 17:07:41');

-- --------------------------------------------------------

--
-- Struktura tabulky `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `created_at`) VALUES
(7, 'Centrální registr dovozců', 'Pro Ministerstvo dopravy jsme dva roky rozvíjeli centrální registr dovozců fungující na principu informačního systému ve webové aplikaci. Jedná se o rozsáhlý evidenční systém napojený na několik různých subjektů. Rozsáhlou databázi využívali krajští úředníci po celé ČR.', '2021-12-16 15:51:44'),
(8, 'Eurolines', 'Již delší dobu pracujeme na prodejních webových stránkách známého dopravce, přes které se uskuteční velké množství prodejů a rezervací jízdenek. Systém je propojen na ostatní externí systémy, díky čemuž je proces rezervace maximálně automatizován.', '2021-12-16 16:44:56'),
(9, 'Koopolis', 'Jedná se o rozsáhlý, robustní a uživatelsky konfigurovatelný CMS vyvinutý pro Fond dalšího vzdělávání. Téměř všechny části systému jsou konfigurovatelné přes uživatelsky přívětivé rozhraní, je tedy možné celek snadno přizpůsobovat aktuálním potřebám.', '2021-12-16 16:59:08'),
(10, 'Generátor smluv Legito', 'Pro známý startup s globálním potenciálem Legito jsme zpracovali jednodušší editor, který umožňuje dynamicky sestavovat konfigurovatelné smlouvy. Díky tomu jsme firmě dopomohli k mnohem snadnější expanzi do zahraničí', '2021-12-16 17:00:21'),
(11, '3D simulátor pro strojvůdce – ČD Cargo', 'Pro společnost ČD Cargo jsme zpracovali 3D simulátor lokomotiv, který umožnil v reálném čase testovat údržbové systémy. Modely lokomotiv byly vytvořeny na základě plánů skutečných lokomotiv.', '2021-12-16 17:02:51'),
(12, 'Tvorba interaktních e-learningových kurzů – Czechtrade', 'Díky speciálně vytvořené administraci bylo možné vytvořit například dialogové bubliny pro nadabované texty, a to včetně časování, nebo různá interaktivní cvičení. Snažili jsme se o zatraktivnění výuky formou interaktivních cvičení a namluvených dialogů animovaných aktérů, což umožnilo lepší zapojení uživatele do celého procesu. Výsledné kurzy byly exportovatelné do SCORM.', '2021-12-16 17:06:39');

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `user_id` int(5) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(1) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`, `email`) VALUES
(1, 'rada', '$2y$10$1LzLfepcCPa.jEOzOfaCCuEXxUDx32rH8F3J1WhR5eWysPbognvyW', 1, ''),
(2, 'adsf', '$2y$10$8wXubnkD7oGARjcpHxIA2OfR0A4GDqrpU9g0AheDxYTlsbpp9QYj6', 1, 'radous.vilimek@seznam.cz'),
(3, 'test2', '$2y$10$cEn/fol0XhsWvqft0um7EuAp3EAB7ajBG.AMWYNN4dA91GGuW8MBW', 1, 'radous.vilimek@seznam.cz'),
(4, 'test3', '$2y$10$K2pfqcIIXQeJOtS93j6pbuY24VJhW5be.seQxjaY1N4qXCay9ZWiq', 1, 'radous.vilimek@seznam.cz'),
(5, 'rada22', '$2y$10$YDY3y11oTat2RXeD46CSMONKe8dtkr3qM0rryNeHV8yTLaQoVq2Zi', 1, 'radous.vilimek@seznam.cz');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexy pro tabulku `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pro tabulku `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
