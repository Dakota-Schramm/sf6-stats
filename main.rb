#!/usr/bin/env ruby

require 'pg'
require 'dotenv'

require "./pg_helpers"
require "./seed" 
require "./query"

def main
  Dotenv.load('.env', ".env.local")

  init_database(ENV['PGDB'])

  if ARGV.length == 0
    query_characters
  elsif ARGV.length == 1
    character = ARGV
  elsif ARGV.length == 2
    character, ex = ARGV
  end
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


main
