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
    if ARGV[0] == "help" || ARGV[0] == "--help"
      puts help_message
      return
    end
    character = ARGV[0]
    query_character(character)
  elsif ARGV.length == 2
    command, arg1 = ARGV[0], ARGV[1]
  elsif ARGV.length == 3 
    command, arg1, arg2 = ARGV[0], ARGV[1], ARGV[2]

    if command == "weight-diff"
      query_weight_difference(arg1, arg2)
    end
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

def help_message
  <<~HELP
    USAGE: ruby main.rb [arguments]

    FEATURES:
      No Args:           Query basic character info
      Character:         Query info for a specific character
      Weight Difference: Query weight difference between two characters

  HELP
end

main
