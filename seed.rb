#!/usr/bin/env ruby

require "./pg_helpers"

def seed_database(db_name)
  conn = connect_to_database(db_name)
  # Seed the database with initial data
  # You can execute SQL commands to insert data here
  conn.exec("CREATE TABLE IF NOT EXISTS characters (id SERIAL PRIMARY KEY, name VARCHAR(50))")
  conn.exec("INSERT INTO characters (name)
             VALUES
             ('Blanka'),
             ('Cammy'),
             ('Chun-Li'),
             ('Dee Jay'),
             ('Dhalsim'),
             ('E Honda'),
             ('Guile'),
             ('Jamie'),
             ('JP'),
             ('Juri'),
             ('Ken'),
             ('Kimberly'),
             ('Lily'),
             ('Luke'),
             ('Manon'),
             ('Marisa'),
             ('Ryu'),
             ('Zangief')
            ")
  # Add more seed data as needed

  conn.close
end
