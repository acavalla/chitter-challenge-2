class Peep
  def initialize(text)

  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect :dbname => 'chitter', :user => 'annie'
    end
    result = con.exec "SELECT * FROM peeps;"
    result.map do |row|
      row['text'] + " " + row['created_at']
    end
  end

  def self.create(text:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    result = con.exec "INSERT INTO peeps (text) VALUES ('#{text}')"
  end
end
