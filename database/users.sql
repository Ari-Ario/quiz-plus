-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Feb 11, 2024 at 09:52 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`) VALUES
(4, 'melke', '$2y$10$EUkQ1QpY7rtXoC1a8TrPNulbEs73sNZ/2oh7HNKLBqXkg3PA9VMn6', 'melke@melke.com'),
(5, 'tesfay', '$2y$10$ydSEzTCxWwlIE4UgpH3seOZSjSQEWFtMjhOw8Beygo8mBm.uQ7KRW', 'tesfay@tesfay.com'),
(7, 'smith', '$2y$10$XDL4aMUucbadziAoYXzrueBCIfZs3qsdLCFwA1IS/xlMeKjK.rROW', 'smith@matrix.com'),
(9, 'neomatrix', '$2y$10$bl9Fbhw53MypbLxtv79cZOdYiVgSCZVZOlm1cMtOj8v6yZ9wnv162', 'neo@matrix.com'),
(10, 'testuser', '$2y$10$Nqbq.8DdTPMxfKv7STPZvOAA26S1.qLuXkXXmraNXwiMvRZk83g.C', 'test@test.com'),
(11, 'test34', '$2y$10$7j1lS7OzCO40x1h/avq.Gembb6HO.wggG98szlru1nQK3iNHtGoNK', 'test23@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
