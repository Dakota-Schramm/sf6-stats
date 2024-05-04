#!/usr/bin/env ruby

require "./pg_helpers"

def query_characters
  conn = connect_to_database(ENV['PGDB'])
  res = conn.exec('SELECT * FROM characters')
  print_result(res)
  conn.close
end