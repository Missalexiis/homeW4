CREATE TABLE IF NOT EXISTS genres(
	genre_id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name_genre VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS artists (
	artist_id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name_artist VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS artists_genres(
	artist_genre_id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	genre_id INT, 
	artist_id INT, 
	FOREIGN KEY (genre_id)  REFERENCES genres (genre_id) ON DELETE SET NULL,
	FOREIGN KEY (artist_id) REFERENCES artists (artist_id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS albums (
	album_id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name_album VARCHAR(100) NOT NULL,
	release_year DATE
);

CREATE TABLE IF NOT EXISTS artists_albums (
	artist_album_id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	artist_id INT, 
	album_id INT, 
	FOREIGN KEY (artist_id) REFERENCES artists (artist_id) ON DELETE SET NULL,
	FOREIGN KEY (album_id) REFERENCES albums (album_id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS digests (
	digest_id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name_digest VARCHAR(100) NOT NULL,
	release_year DATE
);

CREATE TABLE IF NOT EXISTS compositions (
	compositions_id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name_composition VARCHAR(100) NOT NULL,
	duration DECIMAL(4, 2),
	album_id INT, 
	FOREIGN KEY (album_id) REFERENCES albums (album_id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS compositions_digests (
	composition_digest_id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	compositions_id INT, 
	digest_id INT, 
	FOREIGN KEY (compositions_id) REFERENCES compositions (compositions_id) ON DELETE SET NULL,
	FOREIGN KEY (digest_id) REFERENCES digests (digest_id) ON DELETE SET NULL
);

INSERT INTO artists 
	(name_artist)
VALUES 
	('Noize_mc'),
	('Miyagi'),
	('The Prodigy'),
	('МакSим'),
	('Руки Вверх!'),
	('System of A Down'),
	('Linkin Park'),
	('Нейромонах Феофан'),
	('Queen'),
	('Кино'),
	('Kiss'),
	('Black Sabbath')
;


INSERT INTO genres 
	(name_genre)
VALUES
	('Rap'),
	('Electonics'),
	('Pop'),
	('Progressive metal'),
	('Drum and bass'),
	('Rock')
;

INSERT INTO artists_genres 
	(artist_id, genre_id)
VALUES 
	(1, 1),
	(2, 1),
	(3, 2),
	(4, 3),
	(5, 3),
	(6, 4),
	(7, 6),
	(8, 5),
	(9, 6),
	(10, 6),
	(11, 6),
	(12, 6)
;

INSERT INTO albums 
	(name_album, release_year)
VALUES
	('Выход в город', '2021-11-18'),
	('Новый альбом', '2012-03-30'),
	('Buster Keaton', '2019-06-21'),
	('King Kong', '2019-11-14'),
	('Experience', '1992-09-01'),
	('Music for the Jilted Generation', '1994-07-04'),
	('The Day Is My Enemy', '2015-03-30'),
	('Трудный возраст', '2006-03-28'),
	('Мой рай', '2007-11-15'),
	('Открой мне дверь!', '2012-01-01'),
	('Когда мы были молодыми', '2020-01-01'),
	('Toxicity', '1999-05-06'),
	('Hypnotize', '2005-10-31'),
	('Steal This Album!', '2002-10-26'),
	('В душе драм, в сердце светлая Русь', '2015-02-03'),
	('Made in Heaven', '1995-06-05'),
	('A Kind of Magic', '1989-08-09'),
	('Innuendo', '1991-04-07'),
	('Группа крови', '1988-01-01'),
	('Чёрный альбом', '1991-02-03'),
	('Monster', '2012-10-15'),
	('Kiss', '1974-02-18'),
	('13', '2013-01-01'),
	('Past Lives', '2002-01-02'),
	('Sabotage', '1975-01-01')
;

INSERT INTO artists_albums 
	(artist_id, album_id)
VALUES
	(1, 1),
	(1, 2),
	(2, 3),
	(2, 4),
	(3, 5),
	(3, 6),
	(3, 7),
	(4, 8),
	(4, 9),
	(5, 10),
	(5, 11),
	(6, 12),
	(6, 13),
	(7, 14),
	(8, 15),
	(9, 16),
	(9, 17),
	(9, 18),
	(10, 19),
	(10, 20),
	(11, 21),
	(11, 22),
	(11, 23),
	(12, 24),
	(12, 25)
;

INSERT INTO digests 
	(name_digest, release_year)
VALUES 
	('Mp-3 Collection', '2006-01-01'),
	('Unreleased', '2011-01-01'),
	('Their Law: The Singles', '2005-02-04'),
	('Медляки', '2013-02-05'),
	('Studio Collection', '2019-05-06'),
	('Greatest Hits', '1991-02-05'),
	('Неизвестные песни', '1989-12-22'),
	('100,000 Years', '2012-08-09'),
	('New_rap', '2022-01-02')
;

INSERT INTO compositions 
	(name_composition, duration, album_id)
VALUES
	('Вояджер-1', '3.39', 1),
	('Миокард', '3.02', 1),
	('Вьетнам', '4.02', 2),
	('Я глуп', '3.5', 2),
	('Captain', '3.34', 3),
	('Angel', '3.35', 3),
	('Jumanji', '3.36', 4),
	('Wind it UP', '4.33', 5),
	('Your Love', '5.31', 5),
	('Breathe', '5.34', 6),
	('Omen', '3.36', 6),
	('Invisible Sun', '4.16', 7),
	('The Day Is My Enemy', '4.24', 7),
	('Знаешь ли ты', '4.02', 8),
	('Ветром стать', '3.12', 8),
	('Научусь летать', '3.51', 9),
	('Не отдам', '3.37', 9),
	('Крошка моя', '4.10', 10),
	('18 мне уже', '4.07', 10),
	('Мой Алёшка', '3.25', 11),
	('Студент', '3.51', 11),
	('Chop Suey!', '3.31', 12),
	('Lonely Day', '2.47', 12),
	('ATWA', '2.56', 13),
	('B.Y.O.B', '4.15', 13),
	('Numb', '3.07', 14),
	('Faint', '2.44', 14),
	('In the End', '3.36', 14),
	('Притоптать', '2.55', 15),
	('Под драм легко', '2.44', 15),
	('Its A Beautiful Day', '2.34', 16),
	('Made in Heaven', '5.25', 16),
	('One Vision', '5.11', 17),
	('One Year of love', '4.27', 17),
	('Innuendo', '6.33', 18),
	('The show must go on', '4.31', 18),
	('Война', '4.04', 19),
	('В наших глазах', '3.34', 19),
	('Кончится лето', '5.56', 20),
	('Звезда', '4.30', 20),
	('Wall of sound', '2.55', 21),
	('Feak', '3.35', 21),
	('I was made for loving you', '4.28', 22),
	('Heavens on fire', '3.20', 22),
	('Detroit Rock City', '3.55', 23),
	('Love Gun', '3.15', 23),
	('Strangers Again', '3.42', 24),
	('The Fuss', '2.50', 24),
	('Iron Man', '0.18', 25),
	('War pigs', '7.54', 25)
;

INSERT INTO compositions_digests (
	compositions_id, digest_id
	)
VALUES
	(1, 2),
	(2, 2),
	(2, 3),
	(3, 8),
	(4, 5),
	(4, 6),
	(5, 2),
	(6, 9),
	(6, 2),
	(7, 4),
	(8, 6),
	(9, 9),
	(10, 5),
	(11, Null),
	(12, 9),
	(13, 1),
	(14, 2),
	(15, 3),
	(16, 4),
	(16, 5),
	(17, 6),
	(18, 7),
	(19, 8),
	(20, 9),
	(21, 1),
	(22, 2),
	(23, 8),
	(24, 5),
	(24, 6),
	(25, 2),
	(26, 9),
	(26, 2),
	(27, 4),
	(28, 6),
	(29, 9),
	(30, 5),
	(31, 2),
	(32, 2),
	(32, 3),
	(33, 8),
	(34, 5),
	(34, 6),
	(35, 2),
	(36, 9),
	(36, 2),
	(37, 4),
	(38, 6),
	(39, 9),
	(40, 5),
	(41, 2),
	(42, 2),
	(42, 3),
	(43, 8),
	(44, 5),
	(44, 6),
	(45, 2),
	(46, 9),
	(46, 2),
	(47, 4),
	(48, 6),
	(49, 9),
	(50, 5)
;
SELECT 
	name_album, 
	release_year
FROM albums
WHERE TO_CHAR(release_year, 'YYYY') = '2018'
;

SELECT 
	name_composition,
	duration
FROM 
	compositions
ORDER BY duration DESC
LIMIT 1
;

SELECT 
	name_composition,
	duration
FROM 
	compositions
WHERE duration > 3.5
ORDER BY duration 
;

SELECT 
	name_digest, 
	release_year
FROM 
	digests
WHERE release_year BETWEEN '2018-01-01' AND '2020-12-31'
;

SELECT 
	name_artist
FROM artists
WHERE name_artist NOT LIKE '% %'
;


SELECT 
	name_composition
FROM compositions
WHERE 
	name_composition ~* '.*мой.*' 
	OR name_composition ~* '.*my.*'
;

-- 1 количество исполнителей в каждом жанре

SELECT name_genre, COUNT(artist_id) as count_artists
FROM genres 
	JOIN artists_genres USING(genre_id)
GROUP BY name_genre;

-- 2 количество треков, вошедших в альбомы 2019-2020 годов;

SELECT name_album, release_year, COUNT(name_composition) AS count_trek
FROM albums 
	JOIN compositions USING(album_id)
WHERE release_year BETWEEN '2019-01-01' AND '2020-12-31'
GROUP BY name_album, release_year;

--3 средняя продолжительность треков по каждому альбому;

SELECT name_album, ROUND(AVG(duration), 2) AS avg_duration_trek
FROM albums 
	JOIN compositions USING(album_id)
GROUP BY name_album;

--4 все исполнители, которые не выпустили альбомы в 2020 году;

SELECT DISTINCT name_artist FROM artists
	JOIN artists_albums USING(artist_id)
	JOIN albums AS a USING(album_id)
	WHERE artist_id NOT IN (SELECT artist_id FROM artists_albums
	JOIN albums USING(album_id)
	WHERE TO_CHAR(albums.release_year, 'YYYY') LIKE '%2020%');
--5 названия сборников, в которых присутствует конкретный исполнитель (выберите сами);

SELECT name_digest, name_artist
FROM digests 
	JOIN compositions_digests USING(digest_id)
	JOIN compositions USING(compositions_id)
	JOIN albums USING(album_id)
	JOIN artists_albums USING(album_id)
	JOIN artists USING(artist_id)
WHERE name_artist LIKE 'Noize%';


--6 название альбомов, в которых присутствуют исполнители более 1 жанра;

SELECT name_album, name_artist, COUNT(name_genre) AS count_genre
FROM albums
	JOIN artists_albums USING(album_id)
	JOIN artists USING(artist_id)
	JOIN artists_genres USING(artist_id)
	JOIN genres USING(genre_id)
GROUP BY name_album, name_artist
HAVING COUNT(name_genre) > 1;

--7 наименование треков, которые не входят в сборники;

SELECT name_composition
FROM compositions 
	JOIN compositions_digests USING(compositions_id)
WHERE compositions_digests.digest_id is null;



--8 исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);

SELECT name_artist, duration
FROM artists 
	INNER JOIN artists_albums USING(artist_id)
	INNER JOIN albums USING(album_id)
	INNER JOIN compositions USING(album_id)
WHERE duration = (SELECT MIN(duration)
				  FROM compositions);


--название альбомов, содержащих наименьшее количество треков.

select Name_album, COUNT(name_composition) count_trek FROM albums
JOIN compositions ON albums.album_id = compositions.album_id
GROUP BY name_album
HAVING COUNT(name_composition) = ( 
    SELECT COUNT(name_composition) FROM albums
	JOIN compositions ON albums.album_id= compositions.album_id
    GROUP BY name_album
	ORDER BY COUNT(name_composition)
	LIMIT 1);

