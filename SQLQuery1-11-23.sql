create database Ab104_1_11_2023_1 

USE Ab104_1_11_2023_1


CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY,
    Name VARCHAR(50),
    Surname VARCHAR(50),
    Username VARCHAR(50) UNIQUE,
    Password VARCHAR(50),
    Gender VARCHAR(20)
)

CREATE TABLE Artists (
    Id INT PRIMARY KEY IDENTITY,
    Name VARCHAR(50),
    Surname VARCHAR(50),
    Birthday DATE,
    Gender VARCHAR(15)
)

CREATE TABLE Categories (
    Id INT PRIMARY KEY IDENTITY,
    Name VARCHAR(50)
)

CREATE TABLE Musics (
    Id INT PRIMARY KEY IDENTITY,
    Name VARCHAR(50),
    Duration INT, 
    CategoryID INT,
    ArtistID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(Id),
    FOREIGN KEY (ArtistID) REFERENCES Artists(Id)
)

CREATE TABLE Playlist (
    Id INT PRIMARY KEY IDENTITY,
    Name VARCHAR(50),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(Id)
)


CREATE TABLE PlaylistMusic (
    Id INT PRIMARY KEY IDENTITY,
    PlaylistID INT,
    MusicID INT,
    FOREIGN KEY (PlaylistID) REFERENCES Playlist(Id),
    FOREIGN KEY (MusicID) REFERENCES Musics(Id)
)

INSERT INTO Users (,Name, Surname, Username, Password, Gender)
VALUES ('Ali', 'Huseynov', 'Ali690', '123', 'Male'),
('Vali', 'Aliyev', 'Vali720', '132', 'Male'),
('Salli', 'Ahmadov', 'Salli770', '231', 'Male'),
('Dali', 'Salvador', 'Sada', '321', 'Male')

INSERT INTO Artists (Name, Surname, Birthday, Gender) VALUES
('Fredie', 'Mercury', '1980-07-04', 'Male'),
('Ed', 'Sheeran', '1991-02-17', 'Male'),
('Eminem', 'Eminem', '1989-12-13', 'Female'),
('Bruno', 'Mars', '1985-10-08', 'Male')

INSERT INTO Categories (Name)
VALUES ('Rock'),('Hip-Hop'),('Jazz'),('Pop')

INSERT INTO Musics (Name, Duration, CategoryID, ArtistID)
VALUES ('Bohemian Rhapsody', 123, 1, 1),('Shape of You', 123, 2, 2),('Superman', 123, 3, 3),('Talking to Moon', 123, 4, 4)

INSERT INTO Playlist (Name)
VALUES ('My Playlist1'),('My Playlist2'),('My Playlist3')

Create VIEW SongInformation
AS
SELECT
 A.Name AS Artist, M.Name AS Music,M.Duration AS Duration,C.Name AS Category
FROM Musics M 
	INNER JOIN Artists A ON M.ArtistID = A.Id
	INNER JOIN Categories C ON M.CategoryID = C.Id 

	--bir iki xeta var idi onu alter ile duzeltdim
	--siz kodu yoxlayanda altere ehtiyac olmayacaq


Alter VIEW SongInformation
AS
SELECT
 A.Name AS Artist, M.Name AS Music,M.Duration AS Duration,C.Name AS Category
FROM Musics M 
	INNER JOIN Artists A ON M.ArtistID = A.Id
	INNER JOIN Categories C ON M.CategoryID = C.Id 

SELECT * FROM SongInformation




