#!/usr/bin/env ruby

require 'pg'
require 'dotenv'

require "./pg_helpers"
require "./seed" 

def main
  Dotenv.load('.env', ".env.local")

  init_database(ENV['PGDB'])

  # res  = conn.exec('select tablename, tableowner from pg_tables')

  # res.each do |row|
  #   puts row['tablename'] + ' | ' + row['tableowner']
  # end

end

def init_database(db_name)
  conn = connect_to_database

  if !database_exists?(conn, db_name)
    create_database(conn, db_name)
    puts "Database '#{db_name}' created."
    seed_database(db_name)
    puts "Database '#{db_name}' seeded."
  else
    puts "Database '#{db_name}' already exists."
  end

  conn.close
end

def database_exists?(conn, db_name)
  # Check if the database exists
  result = conn.exec("SELECT 1 FROM pg_database WHERE datname = '#{db_name}'")
  return 0 < result.num_tuples
end

def create_database(conn, db_name)
  # Create the database
  conn.exec("CREATE DATABASE #{db_name}")
end

main
