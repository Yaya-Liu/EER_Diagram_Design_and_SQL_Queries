Drop TABLE Distributors CASCADE CONSTRAINTS;
Drop TABLE Movies CASCADE CONSTRAINTS;
Drop TABLE Actors CASCADE CONSTRAINTS;
Drop TABLE Critics CASCADE CONSTRAINTS;
DROP TABLE Reviewed_By CASCADE CONSTRAINTS;
DROP TABLE Foreign_Movies CASCADE CONSTRAINTS;
DROP TABLE Domestic_Movies CASCADE CONSTRAINTS;

CREATE TABLE Distributors(
DNAME VARCHAR2(64),
DPHONE VARCHAR2(24),
DSTATE VARCHAR2(24),
CITY VARCHAR2(24),
STREET_ADDRESS VARCHAR2(255),
ZIPCODE VARCHAR2(12),
PRIMARY KEY (DNAME)
);

CREATE TABLE Movies(
TITLE VARCHAR2(64),
DIRECTOR VARCHAR2(32),
RELEASE_DATE DATE,
RATING INTEGER,
RUNNING_TIME INTEGER,
DNAME VARCHAR2(64),
PRIMARY KEY (TITLE, DIRECTOR),
FOREIGN KEY (DNAME) REFERENCES Distributors
);

CREATE TABLE Actors(
TITLE VARCHAR2(64),
DIRECTOR VARCHAR2(32),
ACTOR_NAME VARCHAR2(32),
PRIMARY KEY (TITLE, DIRECTOR, ACTOR_NAME),
FOREIGN KEY (TITLE, DIRECTOR) REFERENCES Movies
);

CREATE TABLE Critics(
CNAME VARCHAR2(32),
CRPHONE VARCHAR2(24),
PRIMARY KEY (CNAME)
);

CREATE TABLE Reviewed_By(
EVALUATION VARCHAR2(1024),
TITLE VARCHAR2(64),
DIRECTOR VARCHAR2(32),
CNAME VARCHAR2(32),
PRIMARY KEY (TITLE, DIRECTOR, CNAME, EVALUATION),
FOREIGN KEY (CNAME) REFERENCES Critics,
FOREIGN KEY (TITLE, DIRECTOR) REFERENCES Movies
);

CREATE TABLE Foreign_Movies(
F_LANGUAGE VARCHAR2(32),
ENGLISH_SUBTITLE CHAR(1),
TITLE VARCHAR2(64),
DIRECTOR VARCHAR2(32),
PRIMARY KEY (TITLE, DIRECTOR),
FOREIGN KEY (TITLE, DIRECTOR) REFERENCES Movies
);

CREATE TABLE Domestic_Movies(
COMEDY_FLAG CHAR(1),
FUNNINESS INTEGER,
DRAMA_FLAG CHAR(1),
DESCRIPTION VARCHAR2(255),
ACTION_FLAG CHAR(1),
HORROR_FLAG CHAR(1),
TITLE VARCHAR2(64),
DIRECTOR VARCHAR2(32),
PRIMARY KEY (TITLE, DIRECTOR),
FOREIGN KEY (TITLE, DIRECTOR) REFERENCES Movies
);

-- Insert values to 'Distributors'
INSERT INTO Distributors values('A24 Films', '(456) 875-0923', 'NY', 'New York City', '31 West 27th Street', '10001');
INSERT INTO Distributors values('Troma Films', '(303) 267-5890', 'CA', 'Los Angeles', '838 N Fairfax Avenue', '90046');
INSERT INTO Distributors values('Ais Insurance', '(310) 449-3000', 'CA', 'Los Angeles', '10250 Constellation Boulevard #27', '90067');
INSERT INTO Distributors values('Boutique Film', '(323) 960-0090','CA', 'Los Angeles', '639 North Larchmont Boulevard', '90004');
INSERT INTO Distributors values('Paramount Pictures', '(310) 452-3350','CA', 'Los Angeles', '5555 Melrose Avenue', '90015');
INSERT INTO Distributors values('Super D', '(949) 225-1170', 'CA', 'Irvine', '17822 Gillette Ave #A', '92614');

-- Insert values to 'Moives'
INSERT INTO Movies values('Lady Bird', 'Greta Gerwig', TO_DATE('2017-11-3', 'YYYY-MM-DD'), 5, 93, 'A24 Films');
INSERT INTO Movies values('Get Out', 'Jordan Peele', TO_DATE('2017-2-24','YYYY-MM-DD'), 4, 104, 'Troma Films');
INSERT INTO Movies values('TAMPOPO', 'Juzo Itami', TO_DATE('1985-11-13','YYYY-MM-DD'), 5, 114, 'Ais Insurance');
INSERT INTO Movies values('The Player', 'Robert Altman', TO_DATE('1992-4-10','YYYY-MM-DD'), 3, 124, 'Boutique Film');
INSERT INTO Movies values('Paycheck', 'John Woo', TO_DATE('2003-12-25','YYYY-MM-DD'), 4, 119, 'Paramount Pictures');
INSERT INTO Movies values('A Better Tomorrow III', 'John Woo',TO_DATE('1989-10-20', 'YYYY-MM-DD'), 5, 136, 'Super D');
INSERT INTO Movies values('Aliens', 'James Cameron', TO_DATE('1986-7-18','YYYY-MM-DD'), 5, 138, 'Troma Films');
INSERT INTO Movies values('Aliens1', 'Robert Letterman', TO_DATE('2009-5-27','YYYY-MM-DD'), 5, 94, 'Troma Films');
INSERT INTO Movies values('The Terminator', 'James Cameron', TO_DATE('1984-10-26','YYYY-MM-DD'), 5, 108, 'Troma Films');

-- Insert values to 'Actors'
INSERT INTO Actors values('Lady Bird', 'Greta Gerwig', 'Saoirse Ronan');
INSERT INTO Actors values('Lady Bird', 'Greta Gerwig', 'Pauly Shore');
INSERT INTO Actors values('Lady Bird', 'Greta Gerwig', 'Greta Gerwig');
INSERT INTO Actors values('Lady Bird', 'Greta Gerwig', 'Laurie Metcalf');
INSERT INTO Actors values('Lady Bird', 'Greta Gerwig', 'Jake McDorman');

INSERT INTO Actors values('Get Out', 'Jordan Peele', 'Daniel Kaluuya');
INSERT INTO Actors values('Get Out', 'Jordan Peele', 'Pauly Shore');
INSERT INTO Actors values('Get Out', 'Jordan Peele', 'Catherine Keener');
INSERT INTO Actors values('Get Out', 'Jordan Peele', 'Bradley Whitford');


INSERT INTO Actors values('TAMPOPO', 'Juzo Itami', 'Nobuko Miyamoto');
INSERT INTO Actors values('TAMPOPO', 'Juzo Itami', 'Tsutomu Yamazaki');
INSERT INTO Actors values('TAMPOPO', 'Juzo Itami', 'Koji Yakusho');

INSERT INTO Actors values('The Player', 'Robert Altman', 'Tim Robbins');
INSERT INTO Actors values('The Player', 'Robert Altman', 'Greta Scacchi');
INSERT INTO Actors values('The Player', 'Robert Altman', 'Fred Ward');
INSERT INTO Actors values('The Player', 'Robert Altman', 'Whoopi Goldberg');
INSERT INTO Actors values('The Player', 'Robert Altman', 'Pauly Shore');


INSERT INTO Actors values('Paycheck', 'John Woo', 'Ben Affleck');
INSERT INTO Actors values('Paycheck', 'John Woo', 'Aaron Eckhart');
INSERT INTO Actors values('Paycheck', 'John Woo', 'Pauly Shore');

INSERT INTO Actors values('A Better Tomorrow III', 'John Woo', 'Yun-Fat Chow');
INSERT INTO Actors values('A Better Tomorrow III', 'John Woo', 'Anita Mui');
INSERT INTO Actors values('A Better Tomorrow III', 'John Woo', 'Maggie Cheung');
INSERT INTO Actors values('A Better Tomorrow III', 'John Woo', 'Tony Leung Ka Fai');


INSERT INTO Actors values('Aliens', 'James Cameron', 'Sigourney Weaver');
INSERT INTO Actors values('Aliens', 'James Cameron', 'Carrie Henn');
INSERT INTO Actors values('Aliens', 'James Cameron', 'Michael Biehn');
INSERT INTO Actors values('Aliens', 'James Cameron', 'Paul Reiser');
INSERT INTO Actors values('Aliens', 'James Cameron', 'Bill Paxton');
INSERT INTO Actors values('Aliens', 'James Cameron', 'Pauly Shore');

INSERT INTO Actors values('Aliens1', 'Robert Letterman', 'Reese Witherspoon');
INSERT INTO Actors values('Aliens1', 'Robert Letterman', 'Hugh Laurie');
INSERT INTO Actors values('Aliens1', 'Robert Letterman', 'Pauly Shore');

INSERT INTO Actors values('The Terminator', 'James Cameron', 'Arnold Schwarzenegge');
INSERT INTO Actors values('The Terminator', 'James Cameron', 'Linda Hamilton');
INSERT INTO Actors values('The Terminator', 'James Cameron', 'Michael Biehn');
INSERT INTO Actors values('The Terminator', 'James Cameron', 'Pauly Shore');


-- Insert values to 'Actors'
INSERT INTO Critics values('Paul Byrnes', '(646) 791-3768');
INSERT INTO Critics values('Sandra Hall', '(745) 145-3166');
INSERT INTO Critics values('Roger Ebert', '(323) 337-9075');
INSERT INTO Critics values('Ben Lyons', '(703) 775-8922');

-- Insert values to 'Reviewed_by'
INSERT INTO Reviewed_By values('A gloriously funny and wistfully autobiographical coming-of-age comedy.', 'Lady Bird', 'Greta Gerwig', 'Paul Byrnes');
INSERT INTO Reviewed_By values('By focusing the storyline on a particular form of racism -- the kind that is often disguised as peculiar envy -- Get Out reveals something more insidious. ', 'Get Out', 'Jordan Peele', 'Sandra Hall');
INSERT INTO Reviewed_By values('It is a weird one, but it is a blast.', 'TAMPOPO', 'Juzo Itami', 'Roger Ebert');
INSERT INTO Reviewed_By values('A movie about todays Hollywood -- hilarious and heartless in about equal measure, and often at the same time.', 'The Player', 'Robert Altman', 'Roger Ebert');
INSERT INTO Reviewed_By values('There is a sense of treading water about this movie.', 'Paycheck', 'John Woo', 'Roger Ebert');
INSERT INTO Reviewed_By values('Melodramatic from the start, it finally goes over the top to deliver a solid emotional punch.', 'A Better Tomorrow III', 'John Woo', 'Roger Ebert');
INSERT INTO Reviewed_By values('Scene to scene, encounter to encounter, its tension builds unrelentingly. So, fasten your seat belts. It`s a blast.', 'Aliens', 'James Cameron', 'Roger Ebert');
INSERT INTO Reviewed_By values('Monsters Vs Aliens made me feel like a big kid again.', 'Aliens1', 'Robert Letterman', 'Ben Lyons');
INSERT INTO Reviewed_By values('The Terminator brings film violence into the realm of the surreal.', 'The Terminator', 'James Cameron', 'Roger Ebert');

-- Insert values to 'Foreign_Movies'
INSERT INTO Foreign_Movies values('Japanese', '1', 'TAMPOPO', 'Juzo Itami');
INSERT INTO Foreign_Movies values('Chinese', '1', 'A Better Tomorrow III', 'John Woo');

-- Insert values to 'Domestic_Movies'
INSERT INTO Domestic_Movies values('1', 1, '1', 'inspirational story', '0', '0', 'Lady Bird', 'Greta Gerwig');
INSERT INTO Domestic_Movies values('0', NULL, 0, NULL, '1', '1', 'Get Out', 'Jordan Peele');
INSERT INTO Domestic_Movies values('1', 5, 1, 'hilarious story', '1', '0', 'The Player', 'Robert Altman');
INSERT INTO Domestic_Movies values('1', 5, 0, NULL, '1', '0', 'Paycheck', 'John Woo');
INSERT INTO Domestic_Movies values('0', NULL, 0, NULL, '1', '1', 'Aliens', 'James Cameron');
INSERT INTO Domestic_Movies values('1', 1, 0, NULL, '1', '1', 'Aliens1', 'Robert Letterman');
INSERT INTO Domestic_Movies values('1', 1, 0, NULL, '1', '1', 'The Terminator', 'James Cameron');




-- Problem 1: Find the names of all distributors whose addresses are in Los Angeles.
SELECT DNAME
FROM Distributors
WHERE CITY = 'Los Angeles';

-- Problem 2: Find the directors of all horror movies distributed by Troma Films.
SELECT DISTINCT M.DIRECTOR
FROM Movies M, Distributors D, Domestic_Movies Dome
WHERE M.DNAME = D.DNAME AND
      D.DNAME = 'Troma Films' AND
      M.DIRECTOR = Dome.DIRECTOR AND
      M.TITLE = Dome.TITLE AND
      Dome.HORROR_FLAG = '1';
      
-- Problem 3: Find the names of all one-star comedies (i.e. all movies with a “funniness” of one star) that Pauly Shore has acted in.
SELECT A.TITLE
FROM  Actors A, Domestic_Movies Dome
WHERE A.ACTOR_NAME = 'Pauly Shore' AND
      A.TITLE = Dome.TITLE AND
      A.DIRECTOR = Dome.DIRECTOR AND
      Dome.Comedy_Flag = '1' AND
      Dome.FUNNINESS = 1; 

-- Problem 4: Find the name of every action film directed by John Woo that has been reviewed by Roger Ebert.
SELECT Dome.TITLE
FROM  Domestic_Movies Dome, Reviewed_by R
WHERE Dome.DIRECTOR = 'John Woo' AND
      Dome.ACTION_FLAG = '1' AND
      Dome.DIRECTOR = R.DIRECTOR AND
      Dome.TITLE = R.TITLE AND
      R.CNAME = 'Roger Ebert';

-- Problem 5: Find the names of all movies that have more than 4 actors.
SELECT DISTINCT A.TITLE
FROM  Actors A
GROUP BY A.TITLE, A.DIRECTOR
HAVING COUNT(A.ACTOR_NAME) > 4;

-- Problem 6: Find the total number of five-star movies.
SELECT COUNT(*) AS NUMBER_OF_5star_MOVIES
FROM Movies M
WHERE M.RATING = 5;




      
      
      
    

      
      
      
      



