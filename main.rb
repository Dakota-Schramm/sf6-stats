#!/usr/bin/env ruby

require 'pg'
require 'dotenv'

Dotenv.load('.env', ".env.local")

conn = PG.connect("localhost", 5432, '', '', ENV['PGDB'], ENV['PGUSER'], ENV['PGPASSWORD'])
res  = conn.exec('select tablename, tableowner from pg_tables')

res.each do |row|
  puts row['tablename'] + ' | ' + row['tableowner']
end