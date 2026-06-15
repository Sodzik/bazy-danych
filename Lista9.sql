-- {CZĘŚĆ 1} --

/* 1 */
DROP TABLE IF EXISTS `1nf-nowe`;

CREATE TABLE `1nf-nowe` (
    `author` VARCHAR(255) NOT NULL,
    `album` VARCHAR(255) NOT NULL,
    `song` VARCHAR(255) NOT NULL
);

INSERT INTO `1nf-nowe` VALUES
('Slipknot', 'All Hope Is Gone', 'Gehenna'),
('Slipknot', 'All Hope Is Gone', 'Psychosocial'),
('Lisa', 'Lalisa', 'Lalisa'),
('Lisa', 'Lalisa', 'Money'),
('Black Sabbath', 'Sabbath Bloody Sabbath', 'A National Acrobat'),
('Black Sabbath', 'Sabbath Bloody Sabbath', 'Sabbath Bloody Sabbath'),
('Pink Floyd', 'The Dark Side of the Moon', 'Money'),
('Pink Floyd', 'The Dark Side of the Moon', 'Time'),
('Pink Floyd', 'The Division Bell', 'High Hopes'),
('Pink Floyd', 'The Division Bell', 'Lost for Words');

/* 2 */
DROP TABLE IF EXISTS `Album_2nf`;
DROP TABLE IF EXISTS `Track_2nf`;

CREATE TABLE `Album_2nf` (
    `author` VARCHAR(255) NOT NULL,
    `album` VARCHAR(255) NOT NULL,
    `release_year` YEAR(4) NOT NULL,
    PRIMARY KEY(`author`, `album`)
);

INSERT INTO `Album_2nf` VALUES 
('Slipknot', 'All Hope Is Gone', '2008'),
('Lisa', 'Lalisa', '2021'),
('Black Sabbath', 'Sabbath Bloody Sabbath', '1973'),
('Pink Floyd', 'The Dark Side of the Moon', '1973'),
('Pink Floyd', 'The Division Bell', '1994');

CREATE TABLE `Track_2nf` (
    `author` VARCHAR(255) NOT NULL,
    `album` VARCHAR(255) NOT NULL,
    `track` VARCHAR(255) NOT NULL,
    `length` TIME NOT NULL,
    PRIMARY KEY(`author`, `album`, `track`),
    FOREIGN KEY(`author`, `album`) REFERENCES Album_2nf(`author`, `album`)
);

INSERT INTO `Track_2nf` VALUES 
('Slipknot', 'All Hope Is Gone', 'Gehenna', '00:06:53'),
('Slipknot', 'All Hope Is Gone', 'Psychosocial', '00:04:44'),
('Lisa', 'Lalisa', 'Lalisa', '00:03:27'),
('Lisa', 'Lalisa', 'Money', '00:02:48'),
('Black Sabbath', 'Sabbath Bloody Sabbath', 'A National Acrobat', '00:06:16'),
('Black Sabbath', 'Sabbath Bloody Sabbath', 'Sabbath Bloody Sabbath', '00:05:45'),
('Pink Floyd', 'The Dark Side of the Moon', 'Money', '00:06:22'),
('Pink Floyd', 'The Dark Side of the Moon', 'Time', '00:06:22'),
('Pink Floyd', 'The Division Bell', 'High Hopes', '00:08:31'),
('Pink Floyd', 'The Division Bell', 'Lost for Words', '00:05:15');

--3--
DROP TABLE IF EXISTS `Artist_3nf`;
DROP TABLE IF EXISTS `Country_3nf`;

CREATE TABLE `Country_3nf` (
    `country` VARCHAR(255) NOT NULL,
    `capital` VARCHAR(255) NOT NULL,
    `continent` VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (country)
);
INSERT INTO Country_3nf(country, capital, continent) 
VALUES
('Poland', 'Warsaw', 'Europe'),
('England', 'London', "Europe"),
('USA', 'Washington D.C.', 'North America');

CREATE TABLE `Artist_3nf` (
    `artist` VARCHAR(255) NOT NULL,
    `country` VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (artist),
    FOREIGN KEY (country) REFERENCES Country_3nf(country)
);

INSERT INTO Artist_3nf(artist, country) 
VALUES
('Behemoth', 'Poland'),
('Black Sabbath', 'England'),
('Pink Floyd', 'England'),
('Slipknot', 'USA');

/* 1 */
mysql -u root

/* 2 */
CREATE USER 'Robert'@'localhost' IDENTIFIED BY 'ZAQ!2wsx';

/* 3 */
GRANT SHOW DATABASES ON *.* TO 'Robert'@'localhost';
GRANT SELECT ON *.* TO 'Robert'@'localhost';
FLUSH PRIVILEGES;

/* 4 */
mysql -u Robert -p

/* 5 */
USE `world`;
SELECT * FROM `country`;

/* 6 */
DELETE FROM `country` WHERE `Name` = 'Germany';

/* 7 */
mysql -u root

/* 8 */
CREATE USER 'Sasiad'@'localhost' IDENTIFIED BY 'ZAQ!2wsx';
GRANT SHOW DATABASES ON *.* TO 'Sasiad'@'localhost';
GRANT SELECT, UPDATE, DELETE, INSERT ON world.* TO 'Sasiad'@'localhost';
FLUSH PRIVILEGES;
mysql -u Sasiad -p

/* 9 */
USE `world`;
DELETE FROM `country` WHERE `Name` = 'Germany';

/* 10 */
UPDATE `country` SET `Capital` = 2931 WHERE `Code` = 'POL';

/* 11 */
INSERT INTO `city` (`Name`, `CountryCode`) VALUES ('New Vegas', 'USA');

/* 12 */
SELECT `User`, `Host` FROM mysql.user;

/* 13 */
REVOKE INSERT, UPDATE, DELETE ON world.* FROM 'Sasiad'@'localhost';
FLUSH PRIVILEGES;

/* 14 */
REVOKE SELECT ON mysql.* FROM 'Sasiad'@'localhost';
FLUSH PRIVILEGES;

/* 15 */
GRANT UPDATE (`Name`) ON world.city TO 'sasiad'@'localhost';
FLUSH PRIVILEGES;

/* 16 */
mysql -u Sasiad -p

/* 17 */
UPDATE `city` SET `Name` = 'Cebula' WHERE `Name` = 'Warsaw';

/* 18 */
mysql -u root -p

/* 19 */
DROP USER 'Sasiad'@'localhost';

/* 20 */
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'ZAQ!2wsx';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

/* 21 */
DROP USER 'Robert'@'localhost';
DROP USER 'admin'@'localhost';