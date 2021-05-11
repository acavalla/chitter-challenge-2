class Peep
  def initialize(text)

  end

  def self.all
    con = PG.connect :dbname => 'chitter', :user => 'annie'
    rs = con.exec "SELECT * FROM peeps;"
    @peeps = []
    rs.map do |row|
      row['text']
    end
  end
end
