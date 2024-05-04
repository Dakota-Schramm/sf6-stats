#!/usr/bin/env ruby

require "./pg_helpers"

def query_characters
  conn = connect_to_database(ENV['PGDB'])
  res = conn.exec('SELECT * FROM characters')
  print_result(res)
  conn.close
end

def query_character(character_name)
  conn = connect_to_database(ENV['PGDB'])

  character_name = character_name.capitalize
  query_character_likes character_name, conn
  query_character_hates character_name, conn

  conn.close
end

def query_character_likes(character_name, conn)
  res = conn.exec("SELECT likes.*
    FROM characters
    JOIN likes ON characters.id = likes.character_id
    WHERE characters.name = '#{character_name}';
  ")
  puts "LIKES:"
  print_result(res)
end

def query_character_hates(character_name, conn)
  res = conn.exec("SELECT hates.*
    FROM characters
    JOIN hates ON characters.id = hates.character_id
    WHERE characters.name = '#{character_name}';
  ")
  puts "HATES:"
  print_result(res)
end