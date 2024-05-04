#!/usr/bin/env ruby

def connect_to_database(db_name="postgres")
  conn = PG.connect(
    dbname: db_name,
    user: ENV['PGUSER'], 
    password: ENV['PGPASSWORD']
  )
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

def print_result(res)
  res.each do |row|
    puts row.to_s
  end
end