-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Feb 08, 2024 at 10:00 AM
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
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int NOT NULL,
  `question_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `topic` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `question_text`, `topic`) VALUES
(1, 'What is the primary purpose of Docker?', 'tech'),
(2, 'What is the role of a load balancer in a web server infrastructure?', 'tech'),
(3, 'What is the purpose of version control systems?', 'tech'),
(4, 'What is the difference between HTTP and HTTPS?', 'tech'),
(5, 'What is the significance of the 404 HTTP status code?', 'tech'),
(6, 'What is the primary function of a firewall in network security?', 'tech'),
(7, 'What is the purpose of an API (Application Programming Interface)?', 'tech'),
(8, 'What is the role of an ORM (Object-Relational Mapping) in software development?', 'tech'),
(9, 'What does the acronym CDN stand for in the context of web development?', 'tech'),
(10, 'What is the primary purpose of a cache in computing?', 'tech'),
(11, 'What is the concept of \"scalability\" in the context of software architecture?', 'tech'),
(12, 'What is the significance of the 502 HTTP status code?', 'tech'),
(13, 'What is the main purpose of a Content Delivery Network (CDN) in web development?', 'tech'),
(14, 'In the context of programming languages, what does \"static typing\" refer to?', 'tech'),
(15, 'What is the role of a reverse proxy in a web server setup?', 'tech'),
(16, 'What does the acronym SQL stand for?', 'tech'),
(17, 'What is the purpose of Continuous Integration (CI) in software development?', 'tech'),
(18, 'What is the primary role of a router in a computer network?', 'tech'),
(19, 'What is the purpose of a NoSQL database?', 'tech'),
(20, 'What is the difference between Git and SVN (Subversion)?', 'tech'),
(21, 'What is the role of a package manager in software development?', 'tech'),
(22, 'What does the term \"Microservices\" refer to in software architecture?', 'tech'),
(23, 'In the context of cybersecurity, what is the purpose of a honeypot?', 'tech'),
(24, 'What is the role of a CDN in optimizing website performance?', 'tech'),
(25, 'What is the purpose of a JWT (JSON Web Token) in authentication?', 'tech'),
(26, 'What is the concept of \"Dependency Injection\" in software development?', 'tech'),
(27, 'What is the primary function of a CDN in the context of web security?', 'tech'),
(28, 'What is the significance of the 503 HTTP status code?', 'tech'),
(29, 'What is the purpose of the \"git clone\" command in Git?', 'tech'),
(30, 'What is the primary advantage of using a CDN for serving static assets in web development?', 'tech'),
(31, 'Welches Säugetier ist für seine fliegenden Fähigkeiten bekannt?', 'tierwelt'),
(32, 'Welche Reptilienart ist dafür berühmt, ihre Beute durch Schlangenbewegungen zu fangen?', 'tierwelt'),
(33, 'Welches Meerestier ist für seine Fähigkeit bekannt, Tinte als Verteidigungsmechanismus freizusetzen?', 'tierwelt'),
(34, 'Welcher Vogel ist für sein imposantes Federkleid und seine Fähigkeit zum Fliegen in großen Höhen bekannt?', 'tierwelt'),
(35, 'Welche Art von Insekt ist für ihre sozialen Kolonien und Honigproduktion bekannt?', 'tierwelt'),
(36, 'Welches Säugetier ist für seine Streifen und seine Fähigkeit zum Sprinten bekannt?', 'tierwelt'),
(37, 'Welche amphibische Kreatur verbringt einen Teil ihres Lebens im Wasser und einen Teil an Land?', 'tierwelt'),
(38, 'Welches Raubtier ist für seine charakteristische Mähne bekannt?', 'tierwelt'),
(39, 'Welches Meereslebewesen ist für seine leuchtenden Eigenschaften bekannt?', 'tierwelt'),
(40, 'Welches Nagetier ist für seine Baufähigkeiten und Holzverarbeitung bekannt?', 'tierwelt'),
(41, 'Welches Tier ist für seine Fähigkeit zur Echolokation bekannt, um Beute zu orten?', 'tierwelt'),
(42, 'Welches Tier ist für seine Wanderungen über weite Strecken bekannt, insbesondere in der Serengeti?', 'tierwelt'),
(43, 'Welches Tier ist für seine Fähigkeit zum Farbwechsel bekannt und lebt in verschiedenen Meereshabitaten?', 'tierwelt'),
(44, 'Welche Art von Affe ist dafür bekannt, lange Arme und einen langen Schwanz zu haben?', 'tierwelt'),
(45, 'Welches Meeressäugetier ist dafür bekannt, in Gruppen, auch als \"Pods\", zu leben?', 'tierwelt'),
(46, 'How many push-ups can Chuck Norris do?', 'ch-norris'),
(47, 'What does Chuck Norris eat for breakfast?', 'ch-norris'),
(48, 'How does Chuck Norris celebrate his birthday?', 'ch-norris'),
(49, 'What happens when Chuck Norris enters a room?', 'ch-norris'),
(50, 'Why did Chuck Norris become an actor?', 'ch-norris'),
(51, 'How does Chuck Norris cut his hair?', 'ch-norris'),
(52, 'What does Chuck Norris do in his free time?', 'ch-norris'),
(53, 'What is Chuck Norris\'s favorite color?', 'ch-norris'),
(54, 'How does Chuck Norris win arguments?', 'ch-norris'),
(55, 'What is Chuck Norris\'s favorite hobby?', 'ch-norris'),
(56, 'How does Chuck Norris drink his coffee?', 'ch-norris'),
(57, 'What does Chuck Norris do before going to bed?', 'ch-norris'),
(58, 'How does Chuck Norris handle stress?', 'ch-norris'),
(59, 'What does Chuck Norris do when he\'s sick?', 'ch-norris'),
(60, 'What does Chuck Norris say to fear?', 'ch-norris'),
(61, 'In welchem Jahr wurde die Berliner Mauer errichtet?', 'history'),
(62, 'Wer war der erste Präsident der Vereinigten Staaten?', 'history'),
(63, 'Welches Jahr markiert das Ende des Zweiten Weltkriegs?', 'history'),
(64, 'Was war die Magna Carta?', 'history'),
(65, 'Wer war die Herrscherin des antiken Ägyptens und die letzte Pharaonin?', 'history'),
(66, 'In welchem Jahr wurde die Unabhängigkeit der Vereinigten Staaten erklärt?', 'history'),
(67, 'Was war die industrielle Revolution?', 'history'),
(68, 'Wer war der Architekt des Eiffelturms in Paris?', 'history'),
(69, 'Was war die Renaissance?', 'history'),
(70, 'Welches Ereignis führte zur Teilung Deutschlands nach dem Zweiten Weltkrieg?', 'history'),
(71, 'Wer war der Hauptanführer der amerikanischen Bürgerrechtsbewegung?', 'history'),
(72, 'In welchem Jahr endete der Kalte Krieg?', 'history'),
(73, 'Welche antike Stadt wurde durch einen Vulkanausbruch im Jahr 79 n.Chr. zerstört?', 'history'),
(74, 'Wer war der erste Mensch, der die Spitze des Mount Everest erreichte?', 'history'),
(75, 'Welches Tier trägt ein gestreiftes Pyjama?', 'tiere'),
(76, 'Welches Tier hat acht Arme oder Beine?', 'tiere'),
(77, 'Welche Hunderassen sind bekannt, für Ihre Schnelligkeit?', 'tiere'),
(78, 'Welche diese Tiere sind bekannt, für ihre lange Zunge?', 'tiere'),
(79, 'Welches Tiere vergraben Ihren Kod?', 'tiere'),
(80, 'Welche Tiere haben einen Rüssel?', 'tiere'),
(81, 'Was können Delphine nicht?', 'tiere'),
(82, 'Welche Tiere gehören zu den Insekten?', 'tiere'),
(83, 'Welche dieser Tiere haben einen langen Hals?', 'tiere'),
(84, 'Welches Tier kann seinen Schwanz abwerfen, um Feinde zu täuschen?', 'tiere'),
(85, 'Welches Tier legt Eier?', 'tiere'),
(86, 'Welches Tier hat einen giftigen Stachel?', 'tiere'),
(87, 'Welches Tier ist für seine Intelligenz bekannt?', 'tiere'),
(88, 'Welches Tier kann seinen Körper extrem verlängern?', 'tiere'),
(89, 'Welches Tier kann unter Wasser schlafen?', 'tiere'),
(90, 'Welches Tier ist für seine Kletterfähigkeiten bekannt?', 'tiere'),
(91, 'Welches Tier kann ultrasonic hören?', 'tiere'),
(92, 'Welches Tier hat einen spitzen Schnabel zum Aufspießen von Beute?', 'tiere'),
(93, 'Welches Tier hat ein sehr gutes Gedächtnis?', 'tiere'),
(94, 'Welches Tier kann rückwärts fliegen?', 'tiere'),
(95, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(96, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(97, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(98, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(99, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(100, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(101, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(102, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(103, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(104, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(105, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(106, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(107, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(108, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(109, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(110, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(111, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(112, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(113, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(114, 'Welche Werkzeuge gibt es wirklich?', 'werkzeuge'),
(115, 'Who invented camera?', 'cinema'),
(116, 'Who invented storytelling?', 'cinema'),
(117, 'Who played the lead role in the movie \"Zorba the Greek\"?\r\n', 'cinema'),
(118, 'Who directed the film \"Gone by the winds\"?\r\n', 'cinema'),
(119, 'What is the title of first book about analysis of storytelling?\r\n', 'cinema'),
(120, 'Which actor has a role in some of his own films?', 'cinema'),
(121, 'How many acts has a standard story?', 'cinema'),
(122, 'What is common between film and theater?', 'cinema'),
(123, 'Who is the author of Pride and Prejudice?', 'cinema'),
(124, 'What is the film  \"Enemy at the Gate\" about?', 'cinema'),
(125, 'What is act one in a story about?', 'cinema'),
(126, 'Which Film festival is the first historically?', 'cinema'),
(127, 'Who played the lead role in the movie \"Malena\"?\r\n', 'cinema'),
(128, 'Who directed the film \"A Time for Drunken Horses\"?\r\n', 'cinema'),
(129, 'Where was the stories of One Thousand and One Nights drawn?\r\n', 'cinema'),
(130, 'Who plays the lead role in Hiroshima my love?', 'cinema'),
(131, 'What are the main parts of post production?', 'cinema'),
(132, 'Which one is a film Genre?', 'cinema'),
(133, 'What does fiction means?', 'cinema'),
(134, 'What does a cinematographer do?', 'cinema'),
(135, 'What is the capital of France?', 'geography'),
(136, 'Which ocean is the largest?', 'geography'),
(137, 'What is the tallest mountain in the world?', 'geography'),
(138, 'What is the longest river in the world?', 'geography'),
(139, 'Which country is known as the Land of the Rising Sun?', 'geography'),
(140, 'What is the smallest country in the world?', 'geography'),
(141, 'Which desert is the largest in the world?', 'geography'),
(142, 'What is the capital of Australia?', 'geography'),
(143, 'Which continent is the least populated?', 'geography'),
(144, 'Which river runs through Baghdad?', 'geography'),
(145, 'What is the largest country in South America?', 'geography'),
(146, 'What is the capital of Canada?', 'geography'),
(147, 'Which is the smallest ocean?', 'geography'),
(148, 'What is the driest desert in the world?', 'geography'),
(149, 'Which city is known as the City of Love?', 'geography'),
(150, 'What is the closest star to Earth?', 'astronomy'),
(151, 'What is the largest planet in our solar system?', 'astronomy'),
(152, 'What is the name of the galaxy containing the Earth?', 'astronomy'),
(153, 'What causes the phases of the moon?', 'astronomy'),
(154, 'What is a shooting star?', 'astronomy'),
(155, 'What is the brightest star in the night sky?', 'astronomy'),
(156, 'What is the name of the phenomenon when the moon completely blocks the sun?', 'astronomy'),
(157, 'What is the name of the point in space where gravity pulls so much that even light cannot escape?', 'astronomy'),
(158, 'What is the study of celestial bodies beyond Earth\'s atmosphere called?', 'astronomy'),
(159, 'Which planet is known as the Red Planet?', 'astronomy'),
(160, 'What is the name of the closest galaxy to the Milky Way?', 'astronomy'),
(161, 'What is the hottest planet in our solar system?', 'astronomy'),
(162, 'What is the process of a star dying called?', 'astronomy'),
(163, 'What is the name of the force that pulls objects towards each other?', 'astronomy'),
(164, 'What are the two types of planets in our solar system?', 'astronomy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
