psql

CREATE DATABASE restaurant;

\c restaurant;

CREATE TABLE foods(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  cents INTEGER,
  cuisine VARCHAR(255)
);

CREATE TABLE parties (
  id SERIAL PRIMARY KEY,
  total_guests INTEGER,
  table_number INTEGER,
  paid BOOLEAN
);

CREATE TABLE orders(
  id SERIAL PRIMARY KEY,
  food_id INTEGER,
  table_id INTEGER
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255),
  password_hash VARCHAR(255)
);
