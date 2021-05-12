class Peep
  def initialize(text)

  end

  def self.all
    con = PG.connect :dbname => 'chitter', :user => 'annie'
    result = con.exec "SELECT * FROM peeps;"
    result.map do |row|
      row['text'] + " " + row['created_at']
    end
  end
end
