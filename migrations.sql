psql

CREATE DATABASE restaurant;

\c restaurant;

CREATE TABLE food(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  price INTEGER
);

CREATE TABLE party (
  id SERIAL PRIMARY KEY,
  total_guests INTEGER,
  table_number INTEGER,
  paid BOOLEAN
);

CREATE TABLE bill(
  id SERIAL PRIMARY KEY,
  food_id INTEGER,
  table_id INTEGER
);
