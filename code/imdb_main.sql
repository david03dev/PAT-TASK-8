-- 1. Create the IMDB database
CREATE DATABASE IF NOT EXISTS IMDB;

-- 2. Use the IMDB database
USE IMDB;

-- 3. Create Movies table
CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    release_year INT,
    duration INT
);

-- 4. Create Media table (for Video or Image related to Movies)
CREATE TABLE Media (
    media_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    media_type ENUM('Video', 'Image'),
    url VARCHAR(255),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

-- 5. Create Genres table
CREATE TABLE Genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50)
);

-- 6. Create Movie_Genres table (Many-to-Many relationship between Movies and Genres)
CREATE TABLE Movie_Genres (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY(movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

-- 7. Create Users table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100)
);

-- 8. Create Reviews table (Reviews belong to Movies and Users)
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    user_id INT,
    review_text TEXT,
    rating INT,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- 9. Create Artists table (Details of artists like actors, directors)
CREATE TABLE Artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    birthdate DATE
);

-- 10. Create Artist_Skills table (Artists can have multiple skills)
CREATE TABLE Artist_Skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_id INT,
    skill VARCHAR(100),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);

-- 11. Create Movie_Artists table (Artists perform multiple roles in a movie)
CREATE TABLE Movie_Artists (
    movie_id INT,
    artist_id INT,
    role VARCHAR(100),
    PRIMARY KEY(movie_id, artist_id, role),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);

-- 12. Insert sample data into Movies
INSERT INTO Movies (title, release_year, duration) VALUES 
('Inception', 2010, 148),
('The Dark Knight', 2008, 152),
('Interstellar', 2014, 169);

-- 13. Insert media for Movies
INSERT INTO Media (movie_id, media_type, url) VALUES 
(1, 'Video', 'http://example.com/inception_trailer.mp4'),
(1, 'Image', 'http://example.com/inception_poster.jpg'),
(2, 'Video', 'http://example.com/darkknight_trailer.mp4'),
(3, 'Image', 'http://example.com/interstellar_poster.jpg');

-- 14. Insert genres
INSERT INTO Genres (genre_name) VALUES ('Action'), ('Sci-Fi'), ('Thriller'), ('Adventure');

-- 15. Associate Movies with Genres
INSERT INTO Movie_Genres (movie_id, genre_id) VALUES 
(1, 2), (1, 3), 
(2, 1), (2, 3),
(3, 2), (3, 4);

-- 16. Insert users
INSERT INTO Users (username) VALUES ('john_doe'), ('jane_smith');

-- 17. Insert reviews for Movies
INSERT INTO Reviews (movie_id, user_id, review_text, rating) VALUES 
(1, 1, 'Amazing movie with mind-bending visuals!', 5),
(2, 2, 'Incredible action and storyline.', 4),
(3, 1, 'A beautiful portrayal of space travel.', 5);

-- 18. Insert artists
INSERT INTO Artists (name, birthdate) VALUES 
('Leonardo DiCaprio', '1974-11-11'),
('Christian Bale', '1974-01-30'),
('Matthew McConaughey', '1969-11-04');

-- 19. Insert artist skills
INSERT INTO Artist_Skills (artist_id, skill) VALUES 
(1, 'Acting'),
(2, 'Acting'),
(2, 'Martial Arts'),
(3, 'Acting');

-- 20. Insert roles artists perform in movies
INSERT INTO Movie_Artists (movie_id, artist_id, role) VALUES 
(1, 1, 'Lead Actor'),
(2, 2, 'Lead Actor'),
(3, 3, 'Lead Actor');
