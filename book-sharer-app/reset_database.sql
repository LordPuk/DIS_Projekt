-- Entities:

DROP TABLE IF EXISTS Books CASCADE; -- Also has Ratings (because of week entities implementation)
CREATE TABLE Books(
    ISBN VARCHAR(13),
    Date_published DATE,
    Publisher VARCHAR(100),
    Title VARCHAR(500),
    Language VARCHAR(30),
    Page_number INT,
    Price FLOAT,
    Description VARCHAR(8000),
    Average_rate FLOAT, -- From: Ratings
    Voters FLOAT, -- From: Ratings
    Author VARCHAR(100) NOT NULL, -- Referential Integrity : 1 Author for each book
    PRIMARY KEY (ISBN),
    FOREIGN KEY (Author) REFERENCES Authors
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Authors CASCADE;
CREATE TABLE Authors(
    Name VARCHAR(100),
    PRIMARY KEY (Name)
);

DROP TABLE IF EXISTS Genres CASCADE;
CREATE TABLE Genres(
    Genre VARCHAR(100),
    PRIMARY KEY (Genre)
);

DROP TABLE IF EXISTS Users CASCADE;
CREATE TABLE Users(
    Username VARCHAR(30),
    Password VARCHAR(30),
    Creation_date DATE,
    PRIMARY KEY (Username)
);

DROP TABLE IF EXISTS Readers CASCADE;
CREATE TABLE Readers(
    Username VARCHAR(30), -- Indicate inheritance with superclass key
    Education VARCHAR(50),
    Language VARCHAR(30),
    PRIMARY KEY (Username),
    FOREIGN KEY (Username) REFERENCES Users
        ON DELETE CASCADE
        ON UPDATE CASCADE
);




-- Relationships:

DROP TABLE IF EXISTS Has_genre;
CREATE TABLE Has_genre(
    ISBN VARCHAR(13),
    Genre VARCHAR(100),
    PRIMARY KEY (ISBN, Genre),
    FOREIGN KEY (ISBN) REFERENCES Books
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (Genre) REFERENCES Genres
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Favorite_book;
CREATE TABLE Favorite_book(
    Username VARCHAR(30),
    ISBN VARCHAR(13),
    PRIMARY KEY (Username, ISBN),
    FOREIGN KEY (Username) REFERENCES Users
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (ISBN) REFERENCES Books
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Favorite_author;
CREATE TABLE Favorite_author(
    Username VARCHAR(30),
    Author VARCHAR(100),
    PRIMARY KEY (Username, Author),
    FOREIGN KEY (Username) REFERENCES Users
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (Author) REFERENCES Authors
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Favorite_genre;
CREATE TABLE Favorite_genre(
    Username VARCHAR(30),
    Genre VARCHAR(100),
    PRIMARY KEY (Username, Genre),
    FOREIGN KEY (Username) REFERENCES Users
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (Genre) REFERENCES Genres
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

/*
DROP TABLE IF EXISTS Friends;
CREATE TABLE Friends(
    Username VARCHAR(30),
    Friend VARCHAR(30),
    PRIMARY KEY (Username, Friend),
    FOREIGN KEY (Username) REFERENCES Users
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (Friend) REFERENCES Users
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
*/

DROP TABLE IF EXISTS Reads;
CREATE TABLE Reads(
    Username VARCHAR(30),
    ISBN VARCHAR(13),
    Start_date DATE,
    Completion_date DATE,
    Current_pages int,
    PRIMARY KEY (Username, ISBN),
    FOREIGN KEY (Username) REFERENCES Users
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (ISBN) REFERENCES Books
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Rates; -- ISBN in stead of RatingID (because of weak entity implementation)
CREATE TABLE Rates(
    Username VARCHAR(30),
    ISBN VARCHAR(13),
    Rating FLOAT,
    PRIMARY KEY (Username, ISBN),
    FOREIGN KEY (Username) REFERENCES Users
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (ISBN) REFERENCES Users
        ON DELETE CASCADE
        ON UPDATE CASCADE
);