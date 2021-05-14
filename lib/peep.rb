class Peep
  attr_reader :time, :text
  def initialize(text:, time:)
    @text = text
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect :dbname => 'chitter', :user => 'annie'
    end
    result = con.exec "SELECT * FROM peeps;"
    result.map do |row|
      Peep.new(text: row['text'],
               time: DateTime.parse(row['created_at']))
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
