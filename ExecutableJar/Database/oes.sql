-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;

SET time_zone = '+00:00';

SET foreign_key_checks = 0;

SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE DATABASE `OES` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `OES`;

DROP TABLE IF EXISTS `USERDETAILS`;

CREATE TABLE `USERDETAILS` (
  `USERNAME` VARCHAR(15) NOT NULL,
  `PASSWORD` VARCHAR(15) NOT NULL DEFAULT '12345',
  `FIRSTNAME` VARCHAR(10) NOT NULL,
  `MIDDLENAME` VARCHAR(10) DEFAULT '',
  `LASTNAME` VARCHAR(10) DEFAULT '',
  `GENDER` CHAR(1) NOT NULL,
  `E-MAIL` VARCHAR(30) NOT NULL,
  `MOBILE` CHAR(10) NOT NULL,
  `DOB` DATE NOT NULL,
  `REGNO` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `REGDATE` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ADDRESS` LONGTEXT NOT NULL,
  `COLLEGE` VARCHAR(60) NOT NULL,
  `VERIFY` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REGNO`),
  UNIQUE KEY `USERNAME` (`USERNAME`),
  UNIQUE KEY `E-MAIL` (`E-MAIL`),
  UNIQUE KEY `MOBILE` (`MOBILE`)
) ENGINE=INNODB AUTO_INCREMENT=52 DEFAULT CHARSET=LATIN1;

DROP TABLE IF EXISTS `COURSE_DETAILS`;

CREATE TABLE `COURSE_DETAILS` (
  `COURSE_NAME` VARCHAR(20) NOT NULL,
  `TIME` TIME NOT NULL,
  `COURSE_NO` INT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `DATE_OF_CREATION` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `HIDE` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
  `TOTAL_QUESTION` INT(5) UNSIGNED NOT NULL DEFAULT '0',
  `QUESTION_MARK` INT(5) UNSIGNED NOT NULL DEFAULT '4',
  PRIMARY KEY (`COURSE_NAME`),
  UNIQUE KEY `COURSE_NO` (`COURSE_NO`)
) ENGINE=INNODB AUTO_INCREMENT=35 DEFAULT CHARSET=LATIN1;

INSERT INTO `COURSE_DETAILS` (
  `COURSE_NAME`,
  `TIME`,
  `COURSE_NO`,
  `DATE_OF_CREATION`,
  `HIDE`,
  `TOTAL_QUESTION`,
  `QUESTION_MARK`
) VALUES (
  'APPTITUDE',
  '00:30:00',
  33,
  '2018-03-23 06:05:02',
  0,
  9,
  2
),
(
  'COMPUTER',
  '00:00:45',
  34,
  '2018-03-22 17:18:03',
  0,
  6,
  0
),
(
  'MATHS',
  '00:00:30',
  32,
  '2018-01-30 14:25:19',
  1,
  8,
  4
);

DROP TABLE IF EXISTS `QUESTIONS`;

CREATE TABLE `QUESTIONS` (
  `Q_ID` VARCHAR(5) NOT NULL,
  `Q_STATEMENT` LONGTEXT NOT NULL,
  `OPTION_1` VARCHAR(150) NOT NULL,
  `OPTION_2` VARCHAR(150) NOT NULL,
  `OPTION_3` VARCHAR(150) NOT NULL,
  `OPTION_4` VARCHAR(150) NOT NULL,
  `CORRECT_OPTION` INT(1) NOT NULL,
  `COURSE_NAME` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Q_ID`),
  KEY `COURSE_NAME` (`COURSE_NAME`),
  CONSTRAINT `QUESTIONS_IBFK_1` FOREIGN KEY (`COURSE_NAME`) REFERENCES `COURSE_DETAILS` (`COURSE_NAME`)
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;

INSERT INTO `QUESTIONS` (
  `Q_ID`,
  `Q_STATEMENT`,
  `OPTION_1`,
  `OPTION_2`,
  `OPTION_3`,
  `OPTION_4`,
  `CORRECT_OPTION`,
  `COURSE_NAME`
) VALUES (
  'Ap1',
  'what 3% of 5% is?',
  '60%',
  '30%',
  '15%',
  '45%',
  2,
  'APPTITUDE'
),
(
  'AP2',
  'In how many ways the letter ‘SOLVING’ can be\nrearranged to make 7 letter words such that none\nof the letters repeat?',
  '49',
  '5040',
  '7670',
  'None of the above',
  2,
  'APPTITUDE'
),
(
  'AP3',
  'What is the missing letter in this series?\n  b e h k n ? t',
  'q',
  'r',
  's',
  'u',
  2,
  'APPTITUDE'
),
(
  'AP4',
  'The average age of a group of 5 students was 10.The \naverage age increased by 4 years when 2 new \nstudents joined the group.What is the average age of \nthe two new students who joined the group?',
  '15',
  '20',
  '22',
  '24',
  4,
  'APPTITUDE'
),
(
  'AP5',
  'If you unscramble the letters YKANE, you will get the \nname of a:',
  'Mountain Pass',
  'Warrior',
  'Flower',
  'Country',
  4,
  'APPTITUDE'
),
(
  'AP6',
  '3 is 80% of what number?',
  '2.50',
  '3.00',
  '3.75',
  '3.50',
  3,
  'APPTITUDE'
),
(
  'AP7',
  'In an equation, (96)^(1/2) ÷ (k)^(1/2) = 2*(6)^(1/2);\nwhat value of k will satisfy the equation?',
  '2',
  '4',
  '6',
  '8',
  2,
  'APPTITUDE'
),
(
  'AP8',
  'To the correct number of significant figures, \n(5.0 x 10^-5) ÷ (2.00 x 10^-2) is?',
  '2.5X10^-7',
  '2.5X10^-3',
  '2.50X10^-3',
  'None of the above',
  2,
  'APPTITUDE'
),
(
  'AP9',
  'The product of 3×2 matrix and 2×3 matrix will result \nin what order matrix?',
  '3x2',
  '2x2',
  '2x3',
  '3x3',
  4,
  'APPTITUDE'
),
(
  'CM1',
  'Who is the father of personal computer?',
  'IBM',
  'APPLE',
  'MS',
  'NONE OF THESE',
  1,
  'COMPUTER'
),
(
  'CM2',
  'Which is the first electronic digital computer? ',
  'ENIAC',
  'MARK1 ',
  'Z3',
  'iCOM',
  1,
  'COMPUTER'
),
(
  'CM3',
  'IC chips used in computer are usually made of?		',
  'Lead',
  'Silicon',
  'Gold',
  'Silver',
  2,
  'COMPUTER'
),
(
  'CM4',
  'INDIA\'S FIRST SUPERCOMPUTER PARAM 8000 WAS INSTALLED IN ??',	'1990',	'1991',	'1992',	'1993',	1,	'COMPUTER'),
('CM5',	'THE CPU\'s ALU contains:',
  'RAM Spaces',
  'Registers',
  'Byte Spaces',
  'Secondary Storage spaces',
  2,
  'COMPUTER'
),
(
  'CM6',
  'Which is example of recursion : ',
  'void func(){return func();}',
  'String func(){return \"func()\";}',
  'int func(){return 1;}',
  'None',
  1,
  'COMPUTER'
),
(
  'MQ1',
  'What is the unit digit in the product \nof (3547)^153 * (251)^72  ?',
  '1',
  '3',
  '7',
  '5',
  3,
  'MATHS'
),
(
  'MQ2',
  'What is the remainder when 2^31 is divided by 5 ?',
  '1',
  '2',
  '3',
  '4',
  3,
  'MATHS'
),
(
  'MQ3',
  'The H.C.F of 1.75 , 5.6 , 7 is :  ',
  '0.07',
  '0.7',
  '3.5',
  '0.35',
  4,
  'MATHS'
),
(
  'MQ4',
  'Three numbers are in ratio 1:2:3 and their HCF is 12.\nThe numbers are : ',
  '4,8,12',
  '5,10,15',
  '10,20,30',
  '12,24,36',
  4,
  'MATHS'
),
(
  'MQ5',
  'Two pipes A and B can fill a tank in 36 hours and 45 hours\nrespectively.If both the pipes are opened simultaneously,\nhow much time will be taken to fill the tank ? ',
  '20 hours',
  '25 hours',
  '18 hours',
  '22 hours',
  1,
  'MATHS'
),
(
  'MQ6',
  'A train running at a certain speed crosses a stationary\nengine in 20 seconds.To find out the speed of the train,\nwhich of the following information is necessary ?',
  'Only the length of the train',
  'Only the length of the engine',
  'Either the length of the train or the length of the engine',
  'Both the length of the train and the length of the engine',
  4,
  'MATHS'
),
(
  'MQ7',
  'If sin x + cosec x = 2,then find the value of\n(sin x)^7 + (cosec x)^7 ?',
  '1',
  '2',
  '0',
  '2^7',
  3,
  'MATHS'
),
(
  'MQ8',
  'On which of the point will the graph of x=3 and y=8 intersect\neach other ',
  '(0,0)',
  '(3,8)',
  '(8,3)',
  '(-3,-8)',
  2,
  'MATHS'
);

DROP TABLE IF EXISTS `RESULT`;

CREATE TABLE `RESULT` (
  `USERNAME` VARCHAR(15) NOT NULL,
  `COURSE_NAME` VARCHAR(20) NOT NULL,
  `TIME_TAKEN` TIME NOT NULL DEFAULT '00:00:00',
  `TOTAL_QUESTIONS` INT(3) NOT NULL,
  `WRONG_QUESTION` INT(3) NOT NULL,
  `ATTEMPTED_QUESTION` INT(3) NOT NULL,
  `OBTAINED_MARKS` INT(5) NOT NULL,
  `TOTAL_MARKS` INT(5) NOT NULL,
  `PERCENTAGE` FLOAT NOT NULL,
  `TEST_DATE` TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  KEY `USERNAME` (`USERNAME`),
  KEY `COURSE_NAME` (`COURSE_NAME`),
  CONSTRAINT `RESULT_IBFK_1` FOREIGN KEY (`USERNAME`) REFERENCES `USERDETAILS` (`USERNAME`),
  CONSTRAINT `RESULT_IBFK_2` FOREIGN KEY (`COURSE_NAME`) REFERENCES `COURSE_DETAILS` (`COURSE_NAME`)
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;

-- 2018-03-23 11:03:35