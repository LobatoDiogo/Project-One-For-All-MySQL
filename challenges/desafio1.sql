DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE IF NOT EXISTS plans (
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_type VARCHAR(30) NOT NULL,
    price decimal(4, 2) NOT NULL
);

INSERT INTO plans (plan_type, price) VALUES
	('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    sign_date DATE NOT NULL,
    plan_id INT NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
);

INSERT INTO users (username, age, sign_date, plan_id) VALUES
	('Barbara Liskov', 82, '2019-10-20', 1),
	('Robert Cecil Martin', 58, '2017-01-06', 1),
	('Ada Lovelace', 37, '2017-12-30', 2),
	('Martin Fowler', 46, '2017-01-17', 2),
	('Sandi Metz', 58, '2018-04-29', 2),
	('Paulo Freire', 19, '2018-02-14', 3),
	('Bell Hooks', 26, '2018-01-05', 3),
	('Christopher Alexander', 85, '2019-06-05', 4),
	('Judith Butler', 45, '2020-05-13', 4),
	('Jorge Amado', 58, '2017-02-17', 4);
    
CREATE TABLE IF NOT EXISTS artists (
	artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO artists (artist_name) VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');
    
CREATE TABLE IF NOT EXISTS following (
	artist_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT PRIMARY KEY (artist_id, user_id)
);

INSERT INTO following (artist_id, user_id) VALUES 
	('1', '1'),
	('2', '1'),
	('3', '1'),
	('1', '2'),
	('3', '2'),
	('2', '3'),
	('4', '4'),
	('5', '5'),
	('6', '5'),
	('6', '6'),
	('1', '6'),
	('6', '7'),
	('3', '9'),
	('2', '10');

CREATE TABLE IF NOT EXISTS albums (
	album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR (60) NOT NULL,
    release_year YEAR NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

INSERT INTO albums (album_name, release_year, artist_id) VALUES
	('Renaissance', '2022', '1'),
	('Jazz', '1978', '2'),
	('Hot Space', '1982', '2'),
	('Falso Brilhante', '1998', '3'),
	('Vento de Maio', '2001', '3'),
	('QVVJFA?', '2003', '4'),
	('Somewhere Far Beyond', '2007', '5'),
	('I Put A Spell On You', '2012', '6');
    
CREATE TABLE IF NOT EXISTS musics (
	music_id INT PRIMARY KEY AUTO_INCREMENT,
    music_name VARCHAR(200) NOT NULL,
    duration INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

INSERT INTO musics (music_name, duration, album_id) VALUES
	('BREAK MY SOUL', '279', '1'),
	("VIRGO\'S GROOVE", '369', '1'),
	('ALIEN SUPERSTAR', '116', '1'),
	("Don\'t Stop Me Now", '203', '2'),
	('Under Pressure', '152', '3'),
	('Como Nossos Pais', '105', '4'),
	('O Medo de Amar é o Medo de Ser Livre', '207', '5'),
	('Samba em Paris', '267', '6'),
	("The Bard\'s Song", '244', '7'),
	('Feeling Good', '100', '8');
    
CREATE TABLE IF NOT EXISTS history (
	reproduction_date DATETIME NOT NULL,
    user_id INT NOT NULL,
    music_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (music_id) REFERENCES musics(music_id),
    CONSTRAINT PRIMARY KEY (user_id, music_id)
);

INSERT INTO history (music_id, user_id, reproduction_date) VALUES
	('8', '1', '2022-02-28 10:45:55'),
	('2', '1', '2020-05-02 05:30:35'),
	('10', '1', '2020-03-06 11:22:33'),
	('10', '2', '2022-08-05 08:05:17'),
	('7', '2', '2020-01-02 07:40:33'),
	('10', '3', '2020-11-13 16:55:13'),
	('2', '3', '2020-12-05 18:38:30'),
	('8', '4', '2021-08-15 17:10:10'),
	('8', '5', '2022-01-09 01:44:33'),
	('5', '5', '2020-08-06 15:23:43'),
	('7', '6', '2017-01-24 00:31:17'),
	('1', '6', '2017-10-12 12:35:20'),
	('4', '7', '2011-12-15 22:30:49'),
	('4', '8', '2012-03-17 14:56:41'),
	('9', '9', '2022-02-24 21:14:22'),
	('3', '10', '2015-12-13 08:30:22');
