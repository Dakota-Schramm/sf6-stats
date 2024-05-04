#!/usr/bin/env ruby

require "./pg_helpers"

def seed_database(db_name)
  conn = connect_to_database(db_name)
  # Seed the database with initial data
  # You can execute SQL commands to insert data here
  # Add more seed data as needed
  create_characters_table(conn)
  create_character_likes_table(conn)

  conn.close
end

def create_characters_table(conn)
  conn.exec("CREATE TABLE IF NOT EXISTS characters (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    height SMALLINT, 
    weight SMALLINT)
  ")
  conn.exec("INSERT INTO characters (name, height, weight)
             VALUES
             ('Blanka', 76, 216),
             ('Cammy', 65, 134),
             ('Chun-Li', 67, 0),
             ('Dee Jay', 72, 203),
             ('Dhalsim', 69, 106),
             ('E Honda', 73, 302),
             ('Guile', 72, 218),
             ('Jamie', 69, 170),
             ('JP', 75, 214),
             ('Juri', 65, 126),
             ('Ken', 69, 183),
             ('Kimberly', 66, 134),
             ('Lily', 63, 106),
             ('Luke', 73, 198),
             ('Manon', 69, 129),
             ('Marisa', 80, 269),
             ('Ryu', 69, 187),
             ('Zangief', 84, 399),
             ('Rashid', 70, 187),
             ('A.K.I.', 68, 126),
             ('Ed', 72, 190),
             ('Akuma', 70, 198)
            ")
end

def create_character_likes_table(conn)
  conn.exec("CREATE TABLE IF NOT EXISTS likes (
    id SERIAL PRIMARY KEY,
    character_id INTEGER references characters(id),
    thing VARCHAR(50) NOT NULL)
  ")

  conn.exec("INSERT INTO likes (character_id, thing)
             VALUES
             (1, 'Samantha'),
             (1, 'Blanka-chan Dolls')
            ")
end
