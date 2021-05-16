require 'pg'

task :setup_test_database do
  p "Setting up test database..."
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(180) NOT NULL);")
    connection.exec("ALTER TABLE peeps ADD COLUMN created_at timestamp DEFAULT NOW();")
  end
end
