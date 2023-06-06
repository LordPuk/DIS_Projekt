-- Display my reads:
SELECT Title, Author
FROM (Books NATURAL JOIN (
    SELECT ISBN FROM Reads WHERE username = [username]
) AS My_reads);

-- Add reads:
INSERT INTO Reads(Username, ISBN, Start_date, Completion_date, Current_pages) VALUES (
    [username],
    [isbn],
    [s_date],
    [c_date],
    [pages]
);

-- Delete reads:
DELETE FROM Reads WHERE
    username = [username] AND
    ISBN = [isbn];

-- Update reads page progress:
UPDATE Reads SET
    Current_pages = [pages]
WHERE
    username = [username] AND
    ISBN = [isbn];



-- Info + genres on specific book:
SELECT * FROM Books WHERE ISBN = [isbn];
SELECT Genres FROM Has_genre WHERE ISBN = [isbn];



-- Add rates:
UPDATE Books SET
    Average_rate = (Average_rate * Voters + [user_vote]) / (Voters + 1), 
    Voters = voters + 1
WHERE
    ISBN = [isbn];
INSERT INTO Rates(Username, ISBN, Rating) VALUES (
    [username],
    [isbn],
    [rating]
);

-- Delete rates:
UPDATE Books SET
    Average_rate = (Average_rate * Voters - [user_vote]) / (Voters - 1), 
    Voters = voters - 1
WHERE
    ISBN = [isbn];
DELETE FROM Rates WHERE
    username = [username] AND
    ISBN = [isbn];



-- Add favorite book:
INSERT INTO Favorite_book(Username, ISBN) VALUES (
    [username],
    [isbn]
);

-- Delete favorite book:
DELETE FROM Favorite_book WHERE
    username = [username] AND
    ISBN = [isbn];



-- Check username:
SELECT Username FROM Users WHERE Username = [username];

-- Add User:
INSERT INTO Users(Username, Password, Creation_date) VALUES (
    [username],
    [password],
    [date]
);
-- Add Reader info:
INSERT INTO Readers(Username, Education, Language) VALUES (
    [username],
    [education],
    [languages]
);

-- Delete User:
DELETE FROM Users WHERE Username = [username];