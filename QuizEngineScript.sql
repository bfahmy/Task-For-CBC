SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";



--
-- Database: `quizmaker`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `false1` varchar(45) DEFAULT NULL,
  `false2` varchar(45) DEFAULT NULL,
  `false3` varchar(45) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `true1` varchar(45) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_answer_question1_idx` (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`false1`, `false2`, `false3`, `question_id`, `true1`, `id`) VALUES
('Silver', 'Blue', 'Green', 1, 'Gold', 1),
('Madrid', 'Valencia', 'Seville', 2, 'Barcelona', 2),
('Vincent Van Gogh', 'Rembrandt', 'Michelangelo', 3, 'Leonardo Da Vinci', 3),
('Turkey', 'Gerymany', 'Albania', 4, 'Greece', 4),
('Nice', 'Lyon', 'Monaco', 5, 'Paris', 5),
('Duritz', 'Scott', 'Johnny ', 6, 'Aaron', 6),
('AC / DC', 'Metallica', 'Backstreet Boys', 7, 'The Beatles', 7),
('Johnny Logan', 'Madonna', 'Adam Duritz', 8, 'Michael Jackson', 8),
('Cyrus', 'Perry', 'Istrefi', 9, 'Fenty', 9),
('Tommy Lee', 'Max Roach', 'Neil Peart', 10, 'Lars Ulrich', 10),
('12', '13', '10', 11, '11', 11),;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Art'),
(2, 'Music'),
(3, 'Film / TV'),
(4, 'Sports'),
(5, 'Economy');

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_question_user1_idx` (`user_id`),
  KEY `fk_question_category1_idx` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `name`, `date`, `user_id`, `category_id`, `image`) VALUES
(1, 'What color are often the domes of churches in Russia?', '2018-08-25', 3, 1, 'rusia.jpg'),
(2, 'In which Spanish city did the Joan Miro museum open in 1975?', '2018-08-25', 4, 1, 'spain-museums.jpg'),
(3, 'Who did the Mona Lisa paint?', '2018-08-25', 3, 2, 'mona-lisa.jpg'),
(4, 'In which country was the famous painter El Greco born?', '2018-08-25', 4, 2, 'el_greco.jpg'),
(5, 'In which city is the composer FrÃ©dÃ©ric Chopin buried?', '2018-08-25', 3, 3, 'frederic.jpg'),
(6, 'What is Elvis Presley s middle name?', '2018-08-25', 4, 3, 'elvis-presley.jpg'),
(7, 'Which famous group was once known as The Quarrymen?', '2018-08-25', 3, 4, NULL),
(8, 'Who did win the most Grammy Awards in the 80?', '2018-08-25', 4, 4, 'Grammy-Awards.jpg'),
(9, 'What is the surname of the singer Rihanna?', '2018-08-25', 3, 5, 'Rihanna.jpg'),
(10, 'Who is the drummer of Metallica?', '2018-08-25', 3, 2, 'Metallica.jpg'),
(11, 'How many oscars did the Titanic movie got?', '2018-08-25', 4, 5, 'titanic.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role1_idx` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role_id`) VALUES
(3, 'Basem', '1234', 1),
(4, 'Fhamy', '1234', 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `fk_answer_question1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `fk_question_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_question_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;