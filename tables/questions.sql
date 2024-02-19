-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Feb 15, 2024 at 03:52 PM
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
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int NOT NULL,
  `topic` enum('cinema','tech','tierwelt','animals','ch-norris','tiere','geography','astronomy','history','werkzeuge','music','science','basketball') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_1` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_2` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_3` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer_4` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer_5` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correct` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `topic`, `question_text`, `answer_1`, `answer_2`, `answer_3`, `answer_4`, `answer_5`, `correct`) VALUES
(1, 'tech', 'What is the primary purpose of Docker?', 'Containerization', 'Virtualization', 'Hardware optimization', 'Isolation of software environments', '', '1'),
(2, 'tech', 'What is the role of a load balancer in a web server infrastructure?', 'Distribute incoming network traffic', 'Enhance server security', 'Minimize server resources', '', '', '1'),
(3, 'tech', 'What is the purpose of version control systems?', 'Code collaboration', 'Bug tracking', 'Backup and recovery', 'Code history tracking', '', '1,3,4'),
(4, 'tech', 'What is the difference between HTTP and HTTPS?', 'Data encryption', 'Protocol for secure communication', 'Connection speed optimization', 'File transfer protocol', 'S for speed', '1,2'),
(5, 'tech', 'What is the significance of the 404 HTTP status code?', 'Successful request', 'Unauthorized access', 'Page not found', 'Server error', '', '3'),
(6, 'tech', 'What is the primary function of a firewall in network security?', 'Virus detection', 'Traffic monitoring', 'Unauthorized access prevention', 'Data encryption', 'Fire safety measures', '3'),
(7, 'tech', 'What is the purpose of an API (Application Programming Interface)?', 'User interface design', 'Data communication between software components', 'File storage', 'Hardware optimization', '', '2'),
(8, 'tech', 'What is the role of an ORM (Object-Relational Mapping) in software development?', 'Database optimization', 'Code deployment', 'Facilitate communication between frontend and backend', 'Mapping objects to database tables', '', '4'),
(9, 'tech', 'What does the acronym CDN stand for in the context of web development?', 'Content Distribution Network', 'Central Database Network', 'Code Development Namespace', 'Cryptographic Data Network', '', '1'),
(10, 'tech', 'What is the primary purpose of a cache in computing?', 'Temporary data storage', 'User authentication', 'Code compilation', 'Network packet filtering', '', '1'),
(11, 'tech', 'What is the concept of \"scalability\" in the context of software architecture?', 'Ability to handle increased workload', 'User interface responsiveness', 'Code readability', 'Data encryption strength', '', '1'),
(12, 'tech', 'What is the significance of the 502 HTTP status code?', 'Server not found', 'Bad gateway', 'Unauthorized access', 'Request timeout', '', '2'),
(13, 'tech', 'What is the main purpose of a Content Delivery Network (CDN) in web development?', 'Load balancing', 'Caching', 'Distributed server locations', '', '', '1,2,3'),
(14, 'tech', 'In the context of programming languages, what does \"static typing\" refer to?', 'Variables can change types at runtime', 'Variables must be declared with a specific type', 'Variables are not required', '', '', '2'),
(15, 'tech', 'What is the role of a reverse proxy in a web server setup?', 'Hide server details from clients', 'Load balancing', 'Data encryption', 'Request forwarding to backend servers', '', '1,4'),
(16, 'tech', 'What does the acronym SQL stand for?', 'Structured Query Language', 'Server Query Logic', 'Simple Question Language', '', '', '1'),
(17, 'tech', 'What is the purpose of Continuous Integration (CI) in software development?', 'Automated testing', 'Automated deployment', 'Code integration', 'Code analysis', '', '1,3,4'),
(18, 'tech', 'What is the primary role of a router in a computer network?', 'Connect different networks', 'Provide internet access', 'Protect against malware', 'Manage computer resources', '', '1'),
(19, 'tech', 'What is the purpose of a NoSQL database?', 'Structured data storage', 'Highly normalized data', 'Scalability and flexibility for unstructured data', '', '', '3'),
(20, 'tech', 'What is the difference between Git and SVN (Subversion)?', 'Centralized version control', 'Distributed version control', 'Branching and merging capabilities', 'Sequential commit numbering', '', '2,3'),
(21, 'tech', 'What is the role of a package manager in software development?', 'Manage software dependencies', 'Design user interfaces', 'Monitor server performance', 'Handle network security', '', '1'),
(22, 'tech', 'What does the term \"Microservices\" refer to in software architecture?', 'Large monolithic applications', 'Small independent modular services', 'Database management systems', 'Server virtualization techniques', '', '2'),
(23, 'tech', 'In the context of cybersecurity, what is the purpose of a honeypot?', 'Detect and attract attackers', 'Encrypt network traffic', 'Prevent phishing attacks', 'Analyze code vulnerabilities', '', '1'),
(24, 'tech', 'What is the role of a CDN in optimizing website performance?', 'Minimize latency for global users', 'Optimize server-side code', 'Enhance database security', 'Automate testing processes', '', '1'),
(25, 'tech', 'What is the purpose of a JWT (JSON Web Token) in authentication?', 'Store user credentials', 'Generate secure access tokens', 'Encrypt communication between client and server', 'Manage database connections', '', '2'),
(26, 'tech', 'What is the concept of \"Dependency Injection\" in software development?', 'Managing external libraries', 'Inversion of control', 'Data encryption', 'Memory allocation optimization', '', '2'),
(27, 'tech', 'What is the primary function of a CDN in the context of web security?', 'Firewall protection', 'DDoS mitigation', 'Encrypting sensitive data', 'User authentication', '', '2'),
(28, 'tech', 'What is the significance of the 503 HTTP status code?', 'Service unavailable', 'Unauthorized access', 'Page not found', 'Request timeout', '', '1'),
(29, 'tech', 'What is the purpose of the \"git clone\" command in Git?', 'Create a new branch', 'Commit changes to the repository', 'Copy a repository from a remote source', 'Delete a branch', '\'', '3'),
(30, 'tech', 'What is the primary advantage of using a CDN for serving static assets in web development?', 'Improved page load speed', 'Enhanced database performance', 'Reduced server security risks', 'Increased server-side processing', '\'', '1'),
(31, 'tierwelt', 'Welches Säugetier ist für seine fliegenden Fähigkeiten bekannt?', 'Giraffe', 'Fledermaus', 'Elefant', 'Koala', '', '2'),
(32, 'tierwelt', 'Welche Reptilienart ist dafür berühmt, ihre Beute durch Schlangenbewegungen zu fangen?', 'Schildkröte', 'Krokodil', 'Schlange', 'Eidechse', '', '3'),
(33, 'tierwelt', 'Welches Meerestier ist für seine Fähigkeit bekannt, Tinte als Verteidigungsmechanismus freizusetzen?', 'Delphin', 'Hai', 'Seestern', 'Oktopus', '', '4'),
(34, 'tierwelt', 'Welcher Vogel ist für sein imposantes Federkleid und seine Fähigkeit zum Fliegen in großen Höhen bekannt?', 'Pinguin', 'Papagei', 'Adler', 'Kolibri', '', '3'),
(35, 'tierwelt', 'Welche Art von Insekt ist für ihre sozialen Kolonien und Honigproduktion bekannt?', 'Ameise', 'Käfer', 'Schmetterling', 'Spinne', '', '1'),
(36, 'tierwelt', 'Welches Säugetier ist für seine Streifen und seine Fähigkeit zum Sprinten bekannt?', 'Bär', 'Zebra', 'Löwe', 'Elefant', '', '2'),
(37, 'tierwelt', 'Welche amphibische Kreatur verbringt einen Teil ihres Lebens im Wasser und einen Teil an Land?', 'Salamander', 'Krokodil', 'Schildkröte', 'Seepferdchen', '', '1'),
(38, 'tierwelt', 'Welches Raubtier ist für seine charakteristische Mähne bekannt?', 'Tiger', 'Leopard', 'Gepard', 'Löwe', '', '4'),
(39, 'tierwelt', 'Welches Meereslebewesen ist für seine leuchtenden Eigenschaften bekannt?', 'Walhai', 'Glühwürmchenfisch', 'Qualle', 'Seepferdchen', '', '2'),
(40, 'tierwelt', 'Welches Nagetier ist für seine Baufähigkeiten und Holzverarbeitung bekannt?', 'Hamster', 'Maus', 'Biber', 'Eichhörnchen', '', '3'),
(41, 'tierwelt', 'Welches Tier ist für seine Fähigkeit zur Echolokation bekannt, um Beute zu orten?', 'Fledermaus', 'Eule', 'Delfin', 'Faultier', '', '1'),
(42, 'tierwelt', 'Welches Tier ist für seine Wanderungen über weite Strecken bekannt, insbesondere in der Serengeti?', 'Elefant', 'Nashorn', 'Antilope', 'Gnu', '', '4'),
(43, 'tierwelt', 'Welches Tier ist für seine Fähigkeit zum Farbwechsel bekannt und lebt in verschiedenen Meereshabitaten?', 'Chamäleon', 'Tintenfisch', 'Leguan', 'Gecko', '', '1'),
(44, 'tierwelt', 'Welche Art von Affe ist dafür bekannt, lange Arme und einen langen Schwanz zu haben?', 'Gorilla', 'Orang-Utan', 'Kapuzineraffe', 'Lemur', '', '2'),
(45, 'tierwelt', 'Welches Meeressäugetier ist dafür bekannt, in Gruppen, auch als \"Pods\", zu leben?', 'Delfin', 'Wal', 'Seelöwe', 'Robbe', '', '1'),
(46, 'ch-norris', 'How many push-ups can Chuck Norris do?', '100', 'Chuck Norris doesn\'t do push-ups, he pushes the world down', 'None, the Earth pushes down for him', '500', 'Chuck Norris once did a push-up and caused an earthquake', '2,3,5'),
(47, 'ch-norris', 'What does Chuck Norris eat for breakfast?', 'Chuck Norris doesn\'t eat breakfast, breakfast eats what Chuck Norris eats', 'Pancakes', 'Cereal', 'Nails Chuck Norris eats nails for breakfast... without any milk.', 'Eggs, bacon and a side of justice', '1,4,5'),
(48, 'ch-norris', 'How does Chuck Norris celebrate his birthday?', 'Chuck Norris doesn\'t celebrate birthdays, birthdays celebrate Chuck Norris', 'With a cake', 'With a party', 'With friends', 'With a quiet dinner...', '1'),
(49, 'ch-norris', 'What happens when Chuck Norris enters a room?', 'Chuck Norris doesn\'t enter a room, the room makes way for Chuck Norris', 'People greet him', 'The room brightens up', 'Time stops', 'Chairs become uncomfortable, because they know Chuck Norris can break them with a glare', '1,3'),
(50, 'ch-norris', 'Why did Chuck Norris become an actor?', 'Chuck Norris didn\'t become an actor, acting became Chuck Norris', 'To showcase his talents', 'To entertain audiences', 'To challenge himself', 'Because Chuck Norris can do anything', '1'),
(51, 'ch-norris', 'How does Chuck Norris cut his hair?', 'Chuck Norris\'s hair doesn\'t need cutting, it\'s naturally perfect', 'With scissors', 'With a chainsaw', 'He doesn\'t need to, his hair stays perfect', 'Chuck Norris\'s hair cuts itself out of fear.', '5'),
(52, 'ch-norris', 'What does Chuck Norris do in his free time?', 'Chuck Norris doesn\'t have free time, time has Chuck Norris', 'Read books', 'Practice martial arts', 'Relax', 'Chuck Norris doesn\'t have free time, he has victory time.', '1,5'),
(53, 'ch-norris', 'What is Chuck Norris\'s favorite color?', 'Chuck Norris\'s favorite color is Chuck Norris', 'Red', 'Black', 'Chuck Norris\'s favorite color is all colors', 'Chuck Norris\'s favorite color is the color of fear.', '1,5'),
(54, 'ch-norris', 'How does Chuck Norris win arguments?', 'Chuck Norris doesn\'t argue, he just wins', 'With logic', 'With persuasion', 'By being right', 'Chuck Norris didn\'t win arguments, arguments became Chuck Norris.', '1,5'),
(55, 'ch-norris', 'What is Chuck Norris\'s favorite hobby?', 'Chuck Norris doesn\'t have hobbies, hobbies have Chuck Norris', 'Painting', 'Fishing', 'Roundhouse kicking', 'Chuck Norris\'s favorite hobby is being Chuck Norris.', '1,5'),
(56, 'ch-norris', 'How does Chuck Norris drink his coffee?', 'Chuck Norris doesn\'t need coffee, coffee needs Chuck Norris', 'With cream and sugar', 'With a straw', 'Chuck Norris doesn\'t drink coffee, he drinks victory', 'Chuck Norris drinks coffee by staring at the cup until it surrenders its caffeine.', '1,4,5'),
(57, 'ch-norris', 'What does Chuck Norris do before going to bed?', 'wash his theeth', 'Read a book', 'Meditate', 'Chuck Norris doesn\'t sleep, he waits', 'Chuck Norris doesn\'t need to prepare for bed, bed prepares for Chuck Norris.', '4,5'),
(58, 'ch-norris', 'How does Chuck Norris handle stress?', 'Deep breathing', 'Chuck Norris uses stress as a training tool', 'Yoga', 'Chuck Norris doesn\'t get stressed', 'Chuck Norris handles stress by roundhouse kicking it into oblivion.', '2,5'),
(59, 'ch-norris', 'What does Chuck Norris do when he\'s sick?', 'Chuck Norris\'s immune system fights illness', 'Take medicine', 'Power through it', 'Chuck Norris doesn\'t get sick', 'Chuck Norris sickens the sickness.', '5'),
(60, 'ch-norris', 'What does Chuck Norris say to fear?', 'Chuck Norris doesn\'t say anything to fear, fear says sorry to Chuck Norris', 'I\'m scared', 'I\'ll face you', 'Fear who?', 'Chuck Norris whispers, Fear is just a four-letter word', '1,5'),
(61, 'history', 'In welchem Jahr wurde die Berliner Mauer errichtet?', '1961', '1953', '1989', '', '', '1'),
(62, 'history', 'Wer war der erste Präsident der Vereinigten Staaten?', 'John Adams', 'Thomas Jefferson', 'George Washington', '', '', '3'),
(63, 'history', 'Welches Jahr markiert das Ende des Zweiten Weltkriegs?', '1945', '1939', '1955', '', '', '1'),
(64, 'history', 'Was war die Magna Carta?', 'Ein Friedensvertrag', 'Eine Verfassung', 'Ein Abkommen zwischen König John und den Baronen', '', '', '3'),
(65, 'history', 'Wer war die Herrscherin des antiken Ägyptens und die letzte Pharaonin?', 'Cleopatra', 'Nefertiti', 'Hatschepsut', '', '', '1'),
(66, 'history', 'In welchem Jahr wurde die Unabhängigkeit der Vereinigten Staaten erklärt?', '1776', '1789', '1799', '', '', '1'),
(67, 'history', 'Was war die industrielle Revolution?', 'Ein politischer Umsturz', 'Eine soziale Bewegung', 'Ein wirtschaftlicher und technologischer Wandel', '', '', '3'),
(68, 'history', 'Wer war der Architekt des Eiffelturms in Paris?', 'Gustave Eiffel', 'Antoni Gaudí', 'Le Corbusier', '', '', '1'),
(69, 'history', 'Was war die Renaissance?', 'Ein Zeitalter der Aufklärung', 'Eine kulturelle Wiedergeburt', 'Eine politische Revolution', '', '', '2'),
(70, 'history', 'Welches Ereignis führte zur Teilung Deutschlands nach dem Zweiten Weltkrieg?', 'Die Berliner Mauer', 'Die Gründung der NATO', 'Der Marshall-Plan', '', '', '1'),
(71, 'history', 'Wer war der Hauptanführer der amerikanischen Bürgerrechtsbewegung?', 'Malcolm X', 'Rosa Parks', 'Martin Luther King Jr.', '', '', '3'),
(72, 'history', 'In welchem Jahr endete der Kalte Krieg?', '1989', '1991', '1975', '', '', '2'),
(73, 'history', 'Welche antike Stadt wurde durch einen Vulkanausbruch im Jahr 79 n.Chr. zerstört?', 'Athen', 'Rom', 'Pompeji', '', '', '3'),
(74, 'history', 'Wer war der erste Mensch, der die Spitze des Mount Everest erreichte?', 'Tenzing Norgay', 'Edmund Hillary', 'Reinhold Messner', '', '', '1'),
(75, 'tiere', 'Welches Tier trägt ein gestreiftes Pyjama?', 'Pinguin', 'Maus', 'Tieger', 'Elefant', 'Zebra', '4, 5'),
(76, 'tiere', 'Welches Tier hat acht Arme oder Beine?', 'Spinne', 'Orang-Utan', 'Fledermaus', 'Tintenfisch', 'Goldfisch', '1, 4'),
(77, 'tiere', 'Welche Hunderassen sind bekannt, für Ihre Schnelligkeit?', 'Dackel', 'Windhund', 'Greyhound', 'Chihuahua', 'Bulldogge', '2, 3'),
(78, 'tiere', 'Welche diese Tiere sind bekannt, für ihre lange Zunge?', 'Wespe', 'Chamäleon', 'Hauskatze', 'Ameisenbär', 'Schuppentier', '2, 4, 5'),
(79, 'tiere', 'Welches Tiere vergraben Ihren Kod?', 'Katzen', 'Schmetterlinge', 'Wombats', 'Giraffe', 'Ameise', '1, 3'),
(80, 'tiere', 'Welche Tiere haben einen Rüssel?', 'Elefant', 'Ammeisenbären', 'Tapire', 'Seekühe', 'Schnabeltiere', '1, 2, 3, 4, 5'),
(81, 'tiere', 'Was können Delphine nicht?', 'Schwimmen', 'Tauchen', 'Fliegen', 'Echolokation', 'Feuer machen', '3, 5'),
(82, 'tiere', 'Welche Tiere gehören zu den Insekten?', 'Käfer', 'Mücken', 'Tausendfüssler', 'Spinne', 'Termiten', '1, 2, 5'),
(83, 'tiere', 'Welche dieser Tiere haben einen langen Hals?', 'Hunde', 'Chamäleon', 'Schwäne', 'Alpakas', 'Elefant', '3, 4'),
(84, 'tiere', 'Welches Tier kann seinen Schwanz abwerfen, um Feinde zu täuschen?', 'Echse', 'Eichhörnchen', 'Gecko', 'Eidechse', 'Schmetterling', '3, 4'),
(85, 'tiere', 'Welches Tier legt Eier?', 'Fledermaus', 'Wal', 'Schildkröte', 'Pinguin', 'Huhn', '3, 5'),
(86, 'tiere', 'Welches Tier hat einen giftigen Stachel?', 'Biene', 'Eidechse', 'Känguru', 'Skorpion', 'Nashorn', '1, 4'),
(87, 'tiere', 'Welches Tier ist für seine Intelligenz bekannt?', 'Schimpanse', 'Hund', 'Katze', 'Eichhörnchen', 'Elefant', '1, 5'),
(88, 'tiere', 'Welches Tier kann seinen Körper extrem verlängern?', 'Giraffe', 'Regenwurm', 'Gepard', 'Schlange', 'Löwe', '2, 4'),
(89, 'tiere', 'Welches Tier kann unter Wasser schlafen?', 'Delfin', 'Krokodil', 'Hai', 'Schildkröte', 'Frosch', '1, 4'),
(90, 'tiere', 'Welches Tier ist für seine Kletterfähigkeiten bekannt?', 'Elefant', 'Koala', 'Nashorn', 'Affe', 'Krokodil', '2, 4'),
(91, 'tiere', 'Welches Tier kann ultrasonic hören?', 'Maus', 'Elefant', 'Fledermaus', 'Delfin', 'Giraffe', '3, 4'),
(92, 'tiere', 'Welches Tier hat einen spitzen Schnabel zum Aufspießen von Beute?', 'Pelikan', 'Frosch', 'Giraffe', 'Fischreier', 'Hai', '1, 4'),
(93, 'tiere', 'Welches Tier hat ein sehr gutes Gedächtnis?', 'Elefant', 'Pinguin', 'Flamingo', 'Delfin', 'Schlange', '1, 4'),
(94, 'tiere', 'Welches Tier kann rückwärts fliegen?', 'Taube', 'Hummel', 'Kolibri', 'Fledermaus', 'Libelle', '3, 4'),
(95, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Zirkularspitze', 'Dampfknackhammer', 'Maulsäge', 'Gehrungssäge', 'Vibrationssäge', '3, 4'),
(96, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Schraubzwingen', 'Rotationszange', 'Schwebesäge', 'Federhämmerchen', 'Hobel', '1, 5'),
(97, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Schleifenator', 'Schlagbohrmaschine', 'Plasmaschraubenzieher', 'Feile', 'Schattenhammer', '2, 4'),
(98, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Fliegender Bolzenschneider', 'Wolkenschleifer', 'Maulschlüssel', 'Gummibandmessgerät', 'Messband', '3, 5'),
(99, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Paralleldreher', 'Wasserwaage', 'Gehrungssäge', 'Turbo-Tacker', 'Dimensionsregler', '2, 3'),
(100, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Kombizange', 'Paralleldreher', 'Virtueller Lötkolben', 'Zeitreise-Stichsäge', 'Meißel', '1, 5'),
(101, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Holographischer Winkel', 'Bleistift', 'Laserkabelentwirrer', 'Cuttermesser', 'Glitzerbandsäge', '2, 4'),
(102, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Schleifpapier', 'Plasmaschweißzange', 'Tachyonenhobel', 'Tacker', 'Antigravitationspinsel', '1, 4'),
(103, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Einhornhammer', 'Maulschlüssel', 'Laubsäge', 'Baubel', 'Rotationsbohrer', '2, 3'),
(104, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Beitel', 'Malerpinsel', 'Quernuss', 'Trockenzieher', 'Bogenhammer', '1, 2'),
(105, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Lichtschraubenschlüssel', 'Sichel', 'Rasenfaucher', 'Quantenstichsäge', 'Leim', '2, 5'),
(106, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Feuerzerkleinerer', 'Kultsäge', 'Mäuse Zange', 'Flachmeißel', 'Spachtel', '4, 5'),
(107, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Rohrzange', 'Maibrenner', 'Vibrofräse', 'Stemmeisen', 'Biegmeisel', '1, 4'),
(108, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Maulkrauler', 'Schutzbrille', 'Klauenhammer', 'Schutzmessstab', 'Partikelschleifer', '2, 3'),
(109, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Fuchsschwanz', 'Kneifzange', 'Tapetenschmeichler', 'Rotbrenner', 'Rotationszange', '1, 2'),
(110, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Klanghammer', 'Quacke', 'Multimeter', 'Plasmanadel', 'Gipsmesser', '3, 5'),
(111, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Abisolierzange', 'Nasswaage', 'Kombinationszange', 'Querschneider', 'Wurmlochschlüssel', '1, 3'),
(112, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Bio-Säbel', 'Kartätsche', 'Hohlbeitel', 'Kabelbinderzange', 'Elektro-Hebelsäge', '2, 3'),
(113, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Glasschneider', 'Taxirusbrecher', 'Elektronenbrecheisen', 'Schattenmesser', 'Bandsäge', '1, 5'),
(114, 'werkzeuge', 'Welche Werkzeuge gibt es wirklich?', 'Schwebespanner', 'Schreinerwinkel', 'Plasmaschweißzange', 'Wolkenschleifer', 'Blechschere', '2, 5'),
(115, 'cinema', 'Who invented camera?', 'Martin  and Emily', 'Quentin Tarantino', 'Steven Spielberg', 'Lumier brothers', 'Ahmad Faisal', '4'),
(116, 'cinema', 'Who invented storytelling?', 'Salma Hayek', 'Penelope Cruz', 'Sofia Vergara', 'Ancient Greeks', 'Mesopotamians', '5'),
(117, 'cinema', 'Who played the lead role in the movie \"Zorba the Greek\"?\r\n', 'Marlon Brando', 'Al Pacino', 'Robert De Niro', 'Yanis Varofakis', 'Anthony Quinn', '5'),
(118, 'cinema', 'Who directed the film \"Gone by the winds\"?\r\n', 'Martin Scorsese', 'Frank Darabont', 'Steven Spielberg', 'Victor Fleming', 'None of them', '4'),
(119, 'cinema', 'What is the title of first book about analysis of storytelling?\r\n', 'A new story', 'Aristotles poesy', 'Beggin of storytelling', 'Politea of Plato', 'Antigone of Sofokles', '2'),
(120, 'cinema', 'Which actor has a role in some of his own films?', 'Marlon Brando', 'Roberto de Niro ', 'Jack Nicholson', 'Jim Jarmusch', 'Golshifte Farahani', '4'),
(121, 'cinema', 'How many acts has a standard story?', 'Three acts', 'No acts but Actors', 'As many as needed', 'one act', 'None of them', '1'),
(122, 'cinema', 'What is common between film and theater?', 'Actors', 'Screen', 'Story', 'Director', 'All of them', '1, 3, 4'),
(123, 'cinema', 'Who is the author of Pride and Prejudice?', 'David Copperfield', 'Jane Rotchield', 'Jane Timberland', 'Richard Dawkins', 'Jane Austen', '5'),
(124, 'cinema', 'What is the film  \"Enemy at the Gate\" about?', ' The Battle for Leningrad', ' The Battle for Berlin', ' The Battle for Stalingrad', ' The Battle for Paris', ' The Battle for Athens', '3'),
(125, 'cinema', 'What is act one in a story about?', 'Starting the story', 'Main Actor or Actoeress', 'Presenting the story', 'Changing the course of story', 'None of them', '1'),
(126, 'cinema', 'Which Film festival is the first historically?', 'Canne', 'Hollywood', 'Oskar', 'Venice', 'Berlinal', '4'),
(127, 'cinema', 'Who played the lead role in the movie \"Malena\"?\r\n', 'Marlon Brando', 'Monica Belouchi', 'Robert De Niro', 'Yanis Varofakis', 'Anthony Quinn', '2'),
(128, 'cinema', 'Who directed the film \"A Time for Drunken Horses\"?\r\n', 'Martin Scorsese', 'Frank Darabont', 'Bahman Ghobadi', 'Victor Fleming', 'Alfred Hitchcock', '3'),
(129, 'cinema', 'Where was the stories of One Thousand and One Nights drawn?\r\n', 'Ancient stories', 'Aristotles poesy', 'Beggin of storytelling', 'Hezar Afsan', 'Antigone of Sofokles', '2'),
(130, 'cinema', 'Who plays the lead role in Hiroshima my love?', 'Marlon Brando', 'Emmanuelle Riva', 'Jack Nicholson', 'Lee Okohara', 'Golshifte Farahani', '2'),
(131, 'cinema', 'What are the main parts of post production?', 'Video record', 'Color grading', 'Sound cut', 'Acting', 'None of them', '2, 3'),
(132, 'cinema', 'Which one is a film Genre?', 'Dramaturgy', 'Drama', 'Story', 'Director', 'All of them', '2'),
(133, 'cinema', 'What does fiction means?', 'A long story', 'A standard Film', 'A documentary', 'A mocumentary', 'An invented story by the author', '5'),
(134, 'cinema', 'What does a cinematographer do?', 'Photography', 'Photoshop', 'Camera and Cadrage', 'recording sound', 'recording behind the scenes', '3'),
(135, 'geography', 'What is the capital of France?', 'Paris', 'Berlin', 'London', '', '', '1'),
(136, 'geography', 'Which ocean is the largest?', 'Pacific Ocean', 'Atlantic Ocean', 'Indian Ocean', '', '', '1'),
(137, 'geography', 'What is the tallest mountain in the world?', 'Mount Everest', 'K2', 'Kangchenjunga', '', '', '1'),
(138, 'geography', 'What is the longest river in the world?', 'Nile', 'Amazon', 'Yangtze', '', '', '1'),
(139, 'geography', 'Which country is known as the Land of the Rising Sun?', 'China', 'Japan', 'India', '', '', '2'),
(140, 'geography', 'What is the smallest country in the world?', 'Monaco', 'Vatican City', 'San Marino', '', '', '2'),
(141, 'geography', 'Which desert is the largest in the world?', 'Sahara Desert', 'Arabian Desert', 'Gobi Desert', '', '', '1'),
(142, 'geography', 'What is the capital of Australia?', 'Sydney', 'Melbourne', 'Canberra', '', '', '3'),
(143, 'geography', 'Which continent is the least populated?', 'Africa', 'Europe', 'Antarctica', '', '', '3'),
(144, 'geography', 'Which river runs through Baghdad?', 'Nile', 'Euphrates', 'Amazon', '', '', '2'),
(145, 'geography', 'What is the largest country in South America?', 'Brazil', 'Argentina', 'Colombia', '', '', '1'),
(146, 'geography', 'What is the capital of Canada?', 'Toronto', 'Vancouver', 'Ottawa', '', '', '3'),
(147, 'geography', 'Which is the smallest ocean?', 'Arctic Ocean', 'Indian Ocean', 'Southern Ocean', '', '', '1'),
(148, 'geography', 'What is the driest desert in the world?', 'Gobi Desert', 'Atacama Desert', 'Kalahari Desert', '', '', '3'),
(149, 'geography', 'Which city is known as the City of Love?', 'Paris', 'Venice', 'Rome', '', '', '1'),
(150, 'astronomy', 'What is the closest star to Earth?', 'Alpha Centauri', 'Sun', 'Proxima Centauri', '', '', '2'),
(151, 'astronomy', 'What is the largest planet in our solar system?', 'Jupiter', 'Saturn', 'Neptune', '', '', '1'),
(152, 'astronomy', 'What is the name of the galaxy containing the Earth?', 'Andromeda', 'Milky Way', 'Sombrero', '', '', '2'),
(153, 'astronomy', 'What causes the phases of the moon?', 'Rotation of the moon', 'Earth\'s shadow', 'Sun\'s position', '', '', '3'),
(154, 'astronomy', 'What is a shooting star?', 'A comet', 'A meteor', 'A planet', '', '', '2'),
(155, 'astronomy', 'What is the brightest star in the night sky?', 'Vega', 'Sirius', 'Polaris', '', '', '2'),
(156, 'astronomy', 'What is the name of the phenomenon when the moon completely blocks the sun?', 'Lunar eclipse', 'Solar eclipse', 'Transit', '', '', '2'),
(157, 'astronomy', 'What is the name of the point in space where gravity pulls so much that even light cannot escape?', 'Black hole', 'Supernova', 'Pulsar', '', '', '1'),
(158, 'astronomy', 'What is the study of celestial bodies beyond Earth\'s atmosphere called?', 'Astrology', 'Astronomy', 'Cosmology', '', '', '2'),
(159, 'astronomy', 'Which planet is known as the Red Planet?', 'Mars', 'Venus', 'Mercury', '', '', '1'),
(160, 'astronomy', 'What is the name of the closest galaxy to the Milky Way?', 'Andromeda', 'Whirlpool', 'Triangulum', '', '', '1'),
(161, 'astronomy', 'What is the hottest planet in our solar system?', 'Mercury', 'Venus', 'Earth', '', '', '2'),
(162, 'astronomy', 'What is the process of a star dying called?', 'Supernova', 'Black hole', 'Nebula', '', '', '1'),
(163, 'astronomy', 'What is the name of the force that pulls objects towards each other?', 'Gravity', 'Magnetism', 'Friction', '', '', '1'),
(164, 'astronomy', 'What are the two types of planets in our solar system?', 'Rocky and Gas giants', 'Terrestrial and Gas giants', 'Earth-like and Gas giants', '', '', '2'),
(165, 'animals', 'Which animal has the biggest heart in the world?', 'Giraffe', 'Elephant', 'Blue al', 'Kanguru', '', '1'),
(166, 'animals', 'Which is the fastest animal in the world?', 'cheetah', 'horse', 'ostrich', 'cat', '', '1'),
(167, 'animals', 'Which animal lives the longest on earth?', 'turtle', 'cobra', 'elephant', 'octopus', '', '1'),
(168, 'animals', 'Which of the following animal is not a mammal?', 'tiger', 'marsupial', 'fish', 'dog', '', '3'),
(169, 'animals', 'Which fish needs to come up for air?', 'koi fish', 'snapper', 'grouper', 'skate fish', '', '1'),
(170, 'animals', 'which animal can only be found in Australia?', 'tiger', 'black swam', 'koala', 'cobra', '', '3'),
(171, 'animals', 'Which animal has the longest gestation period?', 'african elephant', 'kangoru', 'cat', 'tiger', '', '1'),
(172, 'animals', 'how long can camel stay without water?', '2 days', '3 days', '8 days', '15 days', '', '4'),
(173, 'animals', 'which animal does not belong to the cold-blooded animals?', 'reptiles', 'fish', 'insect', 'horse', '', '4'),
(174, 'animals', 'How long can crocodile go without food?', '5 months', '8 months', '1 year', '3 years', '', '4'),
(175, 'music', 'Which category of musical instrument is reputed to be the oldest in the world?', 'strings', 'subtractive synthesis', 'wind instruments', 'drums', 'brass', '3'),
(176, 'music', 'Which is the national musical instrument of Japan?', 'Sitar (a plucked instrument)', 'Kalimba ', 'Koto (a kind of zither)', 'Bodhran', 'Oboe', '3'),
(177, 'music', 'Which rapper married TV star Kim Kardashian?', 'Kanye West', 'Snoop Doggy Dog', '50 Cents', 'LL Cool J', 'Eminem', '1'),
(178, 'music', 'Sometimes, fans like to believe that they see secret messages on the covers of record albums. According to a 1969 rumor, secret messages on album covers revealed that which Beatle had died in 1966?', 'Ringo Starr', 'John Coltraine', 'George Harrison', 'Elton John', 'Paul McCartney', '5'),
(179, 'music', 'Which controversial and collectable single by The Sex Pistols was banned by the B.B.C', 'God Save the Queen', 'Holidays in the Sun', 'Anarchy in the U.K.', 'Pretty Vacant', '', '1'),
(180, 'music', 'In which US city was the Dixieland jazz style developed?', 'New York', 'Chicago', 'New Orleans', 'Detroit', '', '3'),
(181, 'music', 'The Boogie genre is closest to these styles:', 'Punk/New Wave', 'Disco/Funk', 'Hard Rock/Heavy Metal', 'Boogie-Woogie', 'Synth-Pop', '2'),
(182, 'music', 'the Ramones arrived on the American music scene and are sometimes cited as the first true punk band. In which year did they release their debut album?', '1969', '1985', '2002', '1976', '1995', '4'),
(183, 'music', 'Farrokh Bulsara is/was the real name of…', 'Freddie Mercury\'', 'Frank Zappa', 'John Lennon', 'Sam Bankman Freed', 'Greta Thunfisch', '1'),
(184, 'music', 'The Hammond Organ has influenced genres from R&B, Jazz, Gospel, Funk to Hard Rock. It was first manufactured in', '1992', '1962', '1893', '1935', '1927', '4'),
(185, 'music', 'did Ozzy Osbourne really bite the head off a real bat during a concert?', 'No', 'Yes', 'Half-true', '', '', '2'),
(186, 'music', 'What does the name “ukulele” mean in Hawaiian?', 'jumping flea', 'waging dog', 'creepy snail', 'waging tail', 'agile ants', '1'),
(187, 'music', 'According to Guinness World Records, Madonna is the best selling female artist of all-time. By combining her unique abilities as a singer, songwriter and performer, she has become the most successful solo act in popular music. Which of her best selling si', 'Hung Up', 'Vogue', 'Like a Prayer', 'Music', '', '2'),
(188, 'music', 'Which one of the following chord symbols describes a dominant seventh chord', 'Am7b5', 'G7', 'Cmaj7', 'Dbo7', 'F#o7', '2'),
(189, 'music', 'Which early punk band caused a storm in Britain with singles like \'Anarchy in the U.K.\' and \'God Save the Queen\'? Hint ', 'Sex Pistols', 'The Who', 'The Dead Kennedys', 'The Ramones', 'The Stooges', '1'),
(190, 'music', 'The first Hammond organ, the Hammond Model A, started production in this year:', '1892', '1901', '1943', '1935', '1985', '3'),
(191, 'music', 'Which of the following styles preceded Be Bop?', 'Swing', 'Funk', 'Hip Hop', 'Rockabilly', 'Glam Rock', '1'),
(192, 'music', 'What rock icon was the founder of The Society for the Prevention of Cruelty to Long-haired Men?\n', 'Frank Zappa', 'Lou Reed', 'Phil Collins', 'David Bowie', 'Mick Jagger', '4'),
(193, 'music', 'Towards the end of the 1970s. Which style originating in Jamaica was mixed with punk to create a genre known as two-tone?', 'Hony tonk', 'Igbo rap', 'Bhangra', 'Ska', 'Reggae', '4'),
(194, 'music', 'The “Model-A” was the first Hammond Organ that hit the market. The most legendary Model, that came out 20 years later, was called…', 'Hammond Queen-B', 'Hammond Alpha-Male', 'Hammond FA-18', 'Hammond Model-D', 'Hammond B3', '5'),
(195, 'music', 'The saxophone is a popular jazz instrument, but what was its first use?', 'Symphonic', 'Hunting', 'Military', 'Recital', 'Samba', '3'),
(196, 'music', 'In the early 21st century, some bands with punk roots were given the label \'emo\' (even if they didn\'t associate themselves with the genre). What made the emo subgenre so controversial? ', 'Animal rights abuses', 'Links to self-harm and suicide', 'Implicit sexism', 'Anarchistic rhetoric', '', '2'),
(197, 'music', 'Most famous analogue synthesizers use this method to generate different timbres: ', 'frequency modulation', 'additive synthesis', 'analogue modeling', 'sampling technology', 'subtractive synthesis', '5'),
(198, 'music', 'Which one is NOT originally a South American genre of music?', 'Samba', 'Tango', 'Merengue', 'Klezmer', 'Bossa-Nova', '4'),
(199, 'music', 'In The Big Lebowski, The Dude can’t stand which band?', 'ABBA', 'Supertramp', 'Simon and Garfunkel', 'The Eagles', 'The Alan Parsons Project', '5'),
(200, 'music', 'What was Madonna\'s first top 10 hit?\n', 'Holiday', 'Papa Don’t Preach ', 'Like a Prayer', 'Like a virgin', 'La Isla Fea', '1'),
(201, 'music', 'The most famous Hammond Organs generate the frequencies mechanically and convert them to current by a process called… ', 'wavetable synthesis', 'electromagnetic induction', 'frequency modulation (fm)', 'subtractive synthesis', 'stepdown transformation', '2'),
(202, 'music', 'Johann Sebastian Bach was a composer and musician of which musical period?', 'Post-Modernism', 'Classical Period', 'Renaissance', 'Barock', 'Romantic Period', '4'),
(203, 'music', 'Which city is Techno said to originate from?', 'New York', 'Chicago', 'Detroit', 'Manchester', 'Houston', '3'),
(204, 'science', 'Birds evolved from dinosaurs. True or false? ', 'True', 'False', '', '', '', '1'),
(205, 'science', 'Which organ of the human body consumes the most energy?', 'The brain', 'The heart', 'The lungs', '', '', '1'),
(206, 'science', 'In which galaxy is the Earth located?', 'In the Milky Way', 'In Narnia', 'In Andromeda', '', '', '1'),
(207, 'science', 'What is the chemical formula of water?', 'O2H', 'H1C', 'H2O', '', '', '3'),
(208, 'science', 'Are humans carnivores, omnivores or herbivores?', 'Hervibores', 'Omnivores', 'Carnivores', '', '', '2'),
(209, 'science', 'What is the only natural satellite of the Earth? ', 'The moon', 'The sun', 'The stars', '', '', '1'),
(210, 'science', 'What is the age of the universe? ', 'Born yesterday', 'Approximately thirteen billion years', 'Five million years', '', '', '2'),
(211, 'science', 'Could you still live if the Earth stopped spinning? Yes or no. ', 'True', 'False', '', '', '', '2'),
(212, 'science', 'Tyrannosaurus rex was the largest dinosaur that ever lived. True or False?', 'True', 'False', '', '', '', '2'),
(213, 'science', 'What is the death of each member of a species called? ', 'Disappearance', 'Extinction', '', '', '', '2'),
(214, 'science', 'What is the closest planet to the Sun?', 'Mercury', 'Saturn', '', '', '', '1'),
(215, 'science', 'An electron carries a positive charges?', 'True', 'False', '', '', '', '2'),
(216, 'science', 'What are the 206 bones of the human body?', '242', '206', '300', '', '', '2'),
(217, 'science', 'What is the strongest bone in the human body?', 'Skull', 'Rib', 'Femur', '', '', '3'),
(218, 'basketball', 'What does NBA stand for ?', 'National Basketball Association ', 'No Balls Around ', 'Next Ball Amazing ', 'Natural Bread Association ', 'North Ballers Army ', '1'),
(219, 'basketball', 'Who is the shortest player in NBA history to win the slam dunk contest?\r\n', 'Nate Robinson ', 'Spud Webb', 'Isaiah Thomas ', 'Muggsy Bogues ', 'Yao Ming ', '2'),
(220, 'basketball', 'Who is the only player to win the NBA Defensive Player of the Year award four times in a row?', 'Kevin Garnet ', 'Dwight Howard ', 'Scottie Pippen ', 'Ben Wallace ', 'Nikola Jokic ', '4'),
(221, 'basketball', 'Who holds the record for the most points scored in a single game in NBA history?\r\n', 'LeBron James', 'Kobe Bryant ', 'Wilt Chamberlain ', 'Elgin Baylor ', 'Michael Jordan ', '3'),
(222, 'basketball', 'What was the original name of the Toronto Raptors?\r\n', 'Toronto Maggots', 'Toronto Dragons', 'Toronto Tree\'s ', 'Toronto Huskies', 'Toronto Burritos ', '4'),
(223, 'basketball', 'Who holds the record for the most steals in a single game in NBA history?\r\n', 'Kawhi Leonard ', 'Bob Cousy ', 'John Stockton ', 'Derrick Rose ', 'Jason Kidd ', '3'),
(224, 'basketball', 'What was the first year that the NBA introduced the slam dunk contest?\r\n', '1976-77', '1977-78', '1978-79', '1979-80', '1980-81', '3'),
(225, 'basketball', 'Who is the only player in NBA history to win the regular season MVP, Finals MVP, All-Star Game MVP, and Defensive Player of the Year in the same season?', 'Hakeem Olajuwon\r\n', 'Gary Payton ', 'LeBron James', 'Marcin Gortat ', 'Magic Johnson ', '1'),
(226, 'basketball', 'Which team has won the most NBA Championships in history?\r\n', 'Los Angeles Lakers', 'Boston Celtics', 'Miami Heat ', 'Portland Trail Blazers ', 'Golden State Warriors ', '2'),
(227, 'basketball', 'Which team holds the record for the longest winning streak in NBA history?\r\n', 'Los Angeles Lakers ', 'Philadelphia 76\'s ', 'Boston Celtics ', 'Golden State Warriors ', 'Memphis Grizzlies ', '3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
