-- Mass-upload from .csv-files (loads data into database tables)

SET CLIENT_ENCODING TO 'utf8'; -- kan ikke helt husk hvorfor, men krævet under masse upload

START TRANSACTION;
\copy Authors FROM 'data/Authors_data.csv' DELIMITER ';' ;
\copy Books FROM 'data/Books_data.csv' DELIMITER ';';
\copy Genres FROM 'data/Genres_data.csv' DELIMITER ';' ;
--\copy Has_genre FROM 'data/Has_genre_data.csv' DELIMITER ';' ;
\copy Users FROM 'data/Users_data.csv' DELIMITER ';' ;
\copy Readers FROM 'data/Readers_data.csv' DELIMITER ';' ;
COMMIT;