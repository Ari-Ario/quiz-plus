-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jan 11, 2024 at 08:40 AM
-- Server version: 8.1.0
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
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sold_copies` int DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `genre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published_at` date DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `subtitle`, `description`, `sold_copies`, `author`, `language`, `genre`, `published_at`, `rating`, `created_at`, `updated_at`) VALUES
(1, 'The Great Gatsby', 'A Novel', 'A classic novel exploring themes of decadence, idealism, and the American Dream.', 500, 'F. Scott Fitzgerald', 'English', 'Fiction', '1925-04-10', 2, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(2, 'To Kill a Mockingbird', 'A Pulitzer Prize-winning novel', 'A powerful story about racial injustice and moral growth set in the American South.', 700, 'Harper Lee', 'English', 'Fiction', '1960-07-11', 2, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(3, '1984', 'A Dystopian Novel', 'A chilling vision of a future society controlled by a totalitarian government.', 600, 'George Orwell', 'English', 'Science Fiction', '1949-06-08', 3, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(4, 'The Catcher in the Rye', 'A Novel', 'A classic story of teenage angst and alienation in the big city.', 450, 'J.D. Salinger', 'English', 'Fiction', '1951-07-16', 3, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(5, 'One Hundred Years of Solitude', 'A Magical Realism Epic', 'A multi-generational story about the Buendía family in the fictional town of Macondo.', 800, 'Gabriel Garcia Marquez', 'Spanish', 'Magical Realism', '1967-05-30', 2, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(6, 'The Hobbit', 'A Fantasy Novel', 'The story of Bilbo Baggins, a hobbit who is reluctantly dragged into an epic quest.', 700, 'J.R.R. Tolkien', 'English', 'Fantasy', '1937-09-21', 4, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(7, 'The Da Vinci Code', 'A Thriller', 'A captivating novel that blends art, science, religion, and history in a fast-paced mystery.', 1200, 'Dan Brown', 'English', 'Thriller', '2003-03-18', 2, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(8, 'Harry Potter and the Sorcerers Stone', 'A Fantasy Novel', 'The first book in the Harry Potter series, introducing the magical world of Hogwarts.', 1500, 'J.K. Rowling', 'English', 'Fantasy', '1997-06-26', 5, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(9, 'The Lord of the Rings', 'An Epic Fantasy Trilogy', 'A high-fantasy novel that follows the journey of the hobbit Frodo Baggins to destroy the One Ring.', 900, 'J.R.R. Tolkien', 'English', 'Fantasy', '1954-07-29', 4, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(10, 'Pride and Prejudice', 'A Classic Romance Novel', 'The story of Elizabeth Bennet and Mr. Darcy navigating societal expectations and love.', 600, 'Jane Austen', 'English', 'Romance', '1813-01-28', 4, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(11, 'The Shining', 'A Horror Novel', 'A psychological horror novel about a familys winter stay at an isolated hotel.', 550, 'Stephen King', 'English', 'Horror', '1977-01-28', 2, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(12, 'The Girl with the Dragon Tattoo', 'A Crime Thriller', 'A gripping mystery involving journalist Mikael Blomkvist and hacker Lisbeth Salander.', 800, 'Stieg Larsson', 'Swedish', 'Thriller', '2005-08-23', 1, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(13, 'Brave New World', 'A Dystopian Novel', 'A dystopian vision of a future society where people are controlled through pleasure.', 700, 'Aldous Huxley', 'English', 'Science Fiction', '1932-05-14', 5, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(14, 'The Hunger Games', 'A Dystopian Novel', 'In a post-apocalyptic world, teenagers participate in televised fights for survival.', 1200, 'Suzanne Collins', 'English', 'Science Fiction', '2008-09-14', 3, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(15, 'The Chronicles of Narnia', 'A Fantasy Series', 'A series of high-fantasy novels following the adventures of children in the magical land of Narnia.', 1000, 'C.S. Lewis', 'English', 'Fantasy', NULL, 2, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(16, 'The Fault in Our Stars', 'A Young Adult Novel', 'A heart-wrenching love story about two teenagers with cancer.', 950, 'John Green', 'English', 'Young Adult', '2012-01-10', 3, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(17, 'The Road', 'A Post-Apocalyptic Novel', 'A father and sons journey through a post-apocalyptic America.', 600, 'Cormac McCarthy', 'English', 'Fiction', '2006-09-26', 1, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(18, 'The Kite Runner', 'A Historical Drama', 'A novel spanning the tumultuous events in Afghanistan from the 1970s to the early 2000s.', 700, 'Khaled Hosseini', 'English', 'Historical Fiction', '2003-05-29', 3, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(19, 'The Girl on the Train', 'A Psychological Thriller', 'A psychological thriller that weaves together the lives of three women.', 1100, 'Paula Hawkins', 'English', 'Thriller', '2015-01-13', 4, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(20, 'The Grapes of Wrath', 'A Great Depression Novel', 'A novel depicting the struggles of a family during the Great Depression.', 500, 'John Steinbeck', 'English', 'Historical Fiction', '1939-04-14', 2, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(21, 'Faust', 'Eine Tragödie', 'Das berühmte Drama von Johann Wolfgang von Goethe über den gelehrten Faust.', 300, 'Johann Wolfgang von Goethe', 'Deutsch', 'Drama', '1808-01-01', 3, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(22, 'Der kleine Prinz', 'Eine poetische Erzählung', 'Die Geschichte eines jungen Prinzen, der auf verschiedenen Planeten Abenteuer erlebt.', 600, 'Antoine de Saint-Exupéry', 'Französisch', 'Kinderbuch', '1943-04-06', 1, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(23, 'Der Vorleser', 'Ein deutscher Roman', 'Eine Geschichte über Liebe, Schuld und die Nachwirkungen des Zweiten Weltkriegs.', 400, 'Bernhard Schlink', 'Deutsch', 'Fiction', '1995-09-12', 2, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(24, 'Das Parfum', 'Die Geschichte eines Mörders', 'Ein Roman über einen Parfümeur, der nach dem ultimativen Duft sucht.', 800, 'Patrick Süskind', 'Deutsch', 'Historischer Roman', '1985-09-17', 2, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(25, 'Le Comte de Monte-Cristo', 'Roman daventure', 'Un chef-dœuvre de la littérature française racontant lhistoire dEdmond Dantès.', 700, 'Alexandre Dumas', 'Französisch', 'Roman daventure', '1844-08-28', 5, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(26, 'Die unendliche Geschichte', 'Ein modernes Märchen', 'Ein Buch, das die Abenteuer des Jungen Bastian Balthazar Bux in der Fantasiewelt Phantásien erzählt.', 550, 'Michael Ende', 'Deutsch', 'Fantasy', '1979-09-01', 3, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(27, 'Les Misérables', 'Roman historique', 'Un roman historique classique de Victor Hugo, suivant la vie de Jean Valjean.', 900, 'Victor Hugo', 'Französisch', 'Roman historique', NULL, 3, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(28, 'Effi Briest', 'Ein Gesellschaftsroman', 'Ein Roman von Theodor Fontane über die tragische Geschichte der jungen Effi Briest.', 350, 'Theodor Fontane', 'Deutsch', 'Gesellschaftsroman', '1895-04-19', 3, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(29, 'Madame Bovary', 'Roman réaliste', 'Un roman réaliste de Gustave Flaubert décrivant la vie de la jeune Emma Bovary.', 500, 'Gustave Flaubert', 'Französisch', 'Roman réaliste', '1857-12-12', 5, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(30, 'Der Steppenwolf', 'Ein Entwicklungsroman', 'Ein philosophischer Roman von Hermann Hesse, der die innere Zerrissenheit des Protagonisten Harry Haller erforscht.', 450, 'Hermann Hesse', 'Deutsch', 'Philosophischer Roman', '1927-11-25', 3, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(31, 'Les Trois Mousquetaires', 'Roman historique', 'Un roman historique dAlexandre Dumas racontant les aventures des mousquetaires du roi.', 750, 'Alexandre Dumas', 'Französisch', 'Roman historique', '1844-03-20', 2, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(32, 'Der Zauberberg', 'Ein Roman', 'Ein epischer Roman von Thomas Mann über das Leben in einem Sanatorium in den Schweizer Alpen.', 400, 'Thomas Mann', 'Deutsch', 'Roman', '1924-11-01', 1, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(33, 'Les Misérables', 'Roman historique', 'Un roman historique classique de Victor Hugo, suivant la vie de Jean Valjean.', 900, 'Victor Hugo', 'Französisch', 'Roman historique', '1862-03-15', 4, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(34, 'Der Process', 'Ein Roman', 'Ein surrealer Roman von Franz Kafka, der die Geschichte von Josef K. erzählt, der ohne ersichtlichen Grund verhaftet wird.', 300, 'Franz Kafka', 'Deutsch', 'Surrealismus', '1925-04-01', 5, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(35, 'Germinal', 'Roman naturaliste', 'Un roman naturaliste dÉmile Zola dépeignant la vie difficile des mineurs dans le nord de la France.', 600, 'Émile Zola', 'Französisch', 'Roman naturaliste', NULL, 4, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(36, 'Der Sandmann', 'Eine Novelle', 'Eine Schauerromanze von E.T.A. Hoffmann, die die Geschichte von Nathanael und seinem Wahnvorstellungen erzählt.', 350, 'E.T.A. Hoffmann', 'Deutsch', 'Schauerromanze', '1816-05-12', 1, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(37, 'Le Petit Prince', 'Une œuvre poétique', 'Lhistoire dun jeune prince qui vit des aventures sur différentes planètes.', 600, 'Antoine de Saint-Exupéry', 'Französisch', 'Littérature jeunesse', '1943-04-06', 5, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(38, 'Der Untertan', 'Ein Roman', 'Ein satirischer Roman von Heinrich Mann, der die Karriere des opportunistischen Diederich Heßling beleuchtet.', 400, 'Heinrich Mann', 'Deutsch', 'Satire', '1918-05-01', 5, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(39, 'Les Fleurs du Mal', 'Recueil de poèmes', 'Un recueil de poèmes de Charles Baudelaire qui explore la dualité de la beauté et de la laideur.', 500, 'Charles Baudelaire', 'Französisch', 'Poésie', NULL, 3, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(40, 'Siddhartha', 'Ein Roman', 'Ein philosophischer Roman von Hermann Hesse, der die spirituelle Reise von Siddhartha auf der Suche nach Erleuchtung erzählt.', 550, 'Hermann Hesse', 'Deutsch', 'Philosophischer Roman', '1922-09-02', 1, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(41, 'Le Rouge et le Noir', 'Roman psychologique', 'Un roman psychologique de Stendhal explorant la montée sociale de Julien Sorel dans la France du XIXe siècle.', 450, 'Stendhal', 'Französisch', 'Roman psychologique', NULL, 2, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(42, 'Notre-Dame de Paris', 'Roman historique', 'Un roman historique de Victor Hugo situé dans le Paris médiéval, mettant en vedette le sonneur de cloches bossu, Quasimodo.', 800, 'Victor Hugo', 'Französisch', 'Roman historique', '1831-01-14', 1, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(43, 'Carrie', 'A Supernatural Horror Novel', 'The debut novel about a high school girl with telekinetic powers.', 300, 'Stephen King', 'English', 'Horror', '1974-04-05', 2, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(44, 'The Shining', 'A Horror Novel', 'A psychological horror novel about a familys winter stay at an isolated hotel.', 550, 'Stephen King', 'English', 'Horror', '1977-01-28', 4, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(45, 'It', 'A Supernatural Horror Novel', 'A novel about a group of kids facing an evil entity that often takes the form of a clown.', 800, 'Stephen King', 'English', 'Horror', '1986-09-15', 4, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(46, 'The Stand', 'A Post-Apocalyptic Horror Novel', 'A story of a world devastated by a plague and the battle between good and evil survivors.', 700, 'Stephen King', 'English', 'Horror', '1978-10-03', 5, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(47, 'Misery', 'A Psychological Horror Novel', 'A psychological thriller about an author held captive by his \"number one fan.\"', 400, 'Stephen King', 'English', 'Thriller', '1987-06-08', 5, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(48, '11/22/63', 'A Science Fiction Thriller', 'A novel about time travel and an attempt to prevent the assassination of John F. Kennedy.', 600, 'Stephen King', 'English', 'Thriller', '2011-11-08', 5, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(49, 'Pet Sematary', 'A Horror Novel', 'A novel about a burial ground that brings the dead back to life, but at a cost.', 450, 'Stephen King', 'English', 'Horror', '1983-11-14', 2, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(50, 'Cujo', 'A Horror Novel', 'A story about a rabid dog terrorizing a small town.', 350, 'Stephen King', 'English', 'Horror', '1981-09-08', 5, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(51, 'The Green Mile', 'A Serial Novel', 'A serialized novel set in a death row prison, exploring themes of justice and the supernatural.', 700, 'Stephen King', 'English', 'Fantasy', '1996-03-28', 4, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(52, 'The Dark Tower: The Gunslinger', 'A Fantasy Western', 'The first book in The Dark Tower series, following the gunslinger Roland on his quest.', 600, 'Stephen King', 'English', 'Fantasy', '1982-06-10', 3, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(53, 'Under the Dome', 'A Science Fiction Novel', 'A novel about a small town suddenly encased in an invisible dome, cutting it off from the outside world.', 800, 'Stephen King', 'English', 'Science Fiction', '2009-11-10', 3, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(54, 'Bag of Bones', 'A Supernatural Mystery', 'A novel about a writer haunted by the ghost of his late wife at their lakeside retreat.', 400, 'Stephen King', 'English', 'Mystery', '1998-09-22', 2, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(55, 'The Tommyknockers', 'A Science Fiction Horror Novel', 'A novel about the discovery of an alien object that affects the residents of a small town.', 500, 'Stephen King', 'English', 'Science Fiction', '1987-11-10', 5, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(56, 'Needful Things', 'A Horror Novel', 'A story about a mysterious shopkeeper selling cursed items in the town of Castle Rock.', 550, 'Stephen King', 'English', 'Horror', '1991-10-15', 3, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(57, 'Dolores Claiborne', 'A Psychological Thriller', 'A novel told from the perspective of an elderly woman who confesses to a crime she didnt commit.', 350, 'Stephen King', 'English', 'Thriller', '1992-11-10', 5, '2024-01-11 08:36:40', '2024-01-11 08:39:46'),
(58, 'The Outsider', 'A Crime Thriller', 'A novel that combines crime and supernatural elements, exploring the investigation of a brutal murder.', 600, 'Stephen King', 'English', 'Thriller', '2018-05-22', 2, '2024-01-11 08:36:40', '2024-01-11 08:39:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
