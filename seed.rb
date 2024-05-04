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
    character_id INTEGER references characters(id) NOT NULL,
    thing VARCHAR(50) NOT NULL)
  ")

  conn.exec("INSERT INTO likes (character_id, thing)
             VALUES
             (1, 'Samantha'),
             (1, 'Blanka-chan Dolls'),
             (2, 'Cats'),
             (3, 'Days off'),
             (3, 'shopping with Li-Fen'),
             (4, 'singing'),
             (4, 'dancing'),
             (4, 'hollering'),
             (5, 'meditating'),
             (6, 'baths'),
             (7, 'watching sports'),
             (7, 'dog walking'),
             (8, 'Yun'),
             (8, 'Yang'),
             (8, 'dancing'),
             (8, 'his grandmother'),
             (9, 'chess puzzles'),
             (9, 'cleaning'),
             (9, 'local cuisines'),
             (10, 'motorcycles'),
             (10, 'spiders'),
             (11, 'family'),
             (12, '80''s music'),
             (12, 'sneakers'),
             (12, 'large numbers'),
             (13, 'cameras'),
             (13, 'birds of prey'),
             (14, 'travelling'),
             (14, 'PC games'),
             (14, 'wacky T-shirts'),
             (15, 'the color gold'),
             (15, 'cosmetics'),
             (15, 'her family'),
             (16, 'worthy opponents'),
             (16, 'ossobuco'),
             (16, 'fine arts'),
             (17, 'martial arts'),
             (18, 'wrestling'),
             (18, 'Cossack dancing'),
             (19, 'new stuff'),
             (19, 'movies'),
             (19, 'his friends'),
             (20, 'snakes'),
             (20, 'rain'),
             (20, 'Master F.A.N.G.'),
             (21, 'boxing'),
             (21, 'landslide victories'),
             (22, 'unknown'),
            ")
end

def create_character_hates_table(conn)
  conn.exec("CREATE TABLE IF NOT EXISTS hates (
    id SERIAL PRIMARY KEY,
    character_id INTEGER references characters(id) NOT NULL,
    thing VARCHAR(50) NOT NULL)
  ")

  conn.exec("INSERT INTO hates (character_id, thing)
             VALUES
             (1, 'Army Ants'),
             (2, 'Everything (if she''s grumpy)'),
             (3, 'Crime'),
             (3, 'indecisiveness'),
             (4, 'silence'),
             (5, 'distractions'),
             (5, 'harming others'),
             (6, 'indecisiveness'),
             (7, 'secretive people'),
             (7, 'layabouts'),
             (8, 'getting lectured'),
             (8, 'arrogance'),
             (9, 'stains on his clothes'),
             (9, 'sleep'),
             (10, 'buzzkills'),
             (10, 'rules'),
             (11, 'pointless meetings'),
             (12, 'tear-jerker movies'),
             (13, 'lies'),
             (14, 'horror games'),
             (15, 'crowds'),
             (15, 'chatterboxes'),
             (16, 'heights'),
             (17, 'spiders'),
             (18, 'projectiles (Hadokens, etc.)'),
             (19, 'fighting women and children'),
             (19, 'load times'),
             (19, 'trolls'),
             (20, 'nice weather'),
             (20, 'anyone but her master'),
             (21, 'idealists'),
             (21, 'M. Bison'),
             (21, 'needles'),
             (22, 'unknown'),
            ")
end

