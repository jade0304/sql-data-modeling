DROP DATABASE IF EXISTS  craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE users
(
id SERIAL PRIMARY KEY,
username TEXT NOT NULL,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
address TEXT NOT NULL,
region_id INTEGER REFERENCES region
);

CREATE TABLE region
(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL
);

CREATE TABLE posts
(
id SERIAL PRIMARY KEY,
title TEXT,
text TEXT NOT NULL,
location TEXT,
username TEXT REFERENCES users,
region_id TEXT REFERENCES region,
category_id TEXT REFERENCES category
);

CREATE TABLE category
(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
);

INSERT INTO users (username, first_name, last_name, address, region_id)
VALUES
('kiwi', 'Sandra', 'Smith', '324 3 ST', '1'),
('strawberry', 'Julie', 'Harris', '345 4 ST', '2');

INSERT INTO region 
(name)
VALUES
('Boston'),
('Oregon'),
('Des Moines');

INSERT INTO posts
(title, text, location, username, region_id, category_id)
VALUES
('How to train dogs', 'take dogs for a walk daily', 'kiwi', '2', '1'),
('How to pet cats', 'dont touch them', 'strawberry', '1', '2');

INSERT INTO category 
(name)
VALUES
('dogs'),
('cats'),
('birds'),
('fish');