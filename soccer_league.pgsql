DROP DATABASE IF EXISTS  soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams  
(
id SERIAL PRIMARY KEY,
team_name TEXT NOT NULL,
city TEXT NOT NULL
);

CREATE TABLE goals
(
id SERIAL PRIMARY KEY,
player_id INTEGER REFERENCES player,
team_id INTEGER NOT NULL
match_id INTEGER REFERENCES match
score INTEGER
);

CREATE TABLE player
(
id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
team_name TEXT NOT NULL
);

CREATE TABLE referees
(
id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL
last_name TEXT NOT NULL
);

CREATE TABLE matches
(
id SERIAL PRIMARY KEY,
team1 TEXT NOT NULL,
team2 TEXT NOT NULL,
date DATE,
season_id INTEGER REFERENCES season,
referee_id INTEGER REFERENCES referee
);

CREATE TABLE season
(
id SERIAL PRIMARY KEY,
start DATE NOT NULL,
end DATE NOT NULL
);

INSERT INTO teams
(team_name, city)
VALUES
('Manchester United', 'Manchester'),
('Liverpool', 'London'),
('Mancity', 'Manchester'),
('Tottenham Hotspur', 'Tottenham');

INSERT INTO goals
(player_id, team_id, match_id, score)
VALUES
('1', '1', '1', '5')
('2', '2', '1', '10');

INSERT INTO player
(name, team_name)
VALUES
('Kevin', 'De Bruyne', '3'),
('Son', 'Heung-Min', '4'),
('Mohamed', 'Salah', '2');

INSERT INTO referees
(first_name, last_name)
VALUES
('Andy', 'Madley'),
('Graham', 'Scott'),
('Darren', 'England');

INSERT INTO matches
(team1, team2, date, referee_id)
VALUES
('Manchester United', 'Mancity', '02-03-2021')
('Liverpool', 'Mancity', '02-03-2021');

INSERT INTO season
(start, end)
VALUES
('01-02-2021', '08-09-2021')