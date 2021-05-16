require 'pg'

task :setup_test_database do
  p "Setting up test database..."
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end
