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
    JOIN likes ON characters.character_id = likes.character_id
    WHERE characters.name = '#{character_name}';
  ")
  puts "LIKES:"
  print_result(res)
end

def query_character_hates(character_name, conn)
  res = conn.exec("SELECT hates.*
    FROM characters
    JOIN hates ON characters.character_id = hates.character_id
    WHERE characters.name = '#{character_name}';
  ")
  puts "HATES:"
  print_result(res)
end

def query_weight_difference(char_one, char_two)
  char_one = char_one.capitalize
  char_two = char_two.capitalize

  conn = connect_to_database(ENV['PGDB'])

  res_one = conn.exec("SELECT weight 
    FROM characters
    WHERE characters.name = '#{char_one}';
  ")

  res_two = conn.exec("SELECT weight 
    FROM characters
    WHERE characters.name = '#{char_two}';
  ")

  diff = (res_one[0]['weight'].to_i - res_two[0]['weight'].to_i).abs

  pp "The weight difference between #{char_one} and #{char_two} is #{diff} lbs."

  conn.close
end