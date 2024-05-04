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
  res = conn.exec("SELECT likes.*
    FROM characters
    JOIN likes ON characters.id = likes.character_id
    WHERE characters.name = '#{character_name}';
  ")
  print_result(res)
  conn.close
end