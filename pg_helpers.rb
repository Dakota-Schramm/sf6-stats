#!/usr/bin/env ruby

def connect_to_database(db_name="postgres")
  conn = PG.connect(
    dbname: db_name,
    user: ENV['PGUSER'], 
    password: ENV['PGPASSWORD']
  )
end
