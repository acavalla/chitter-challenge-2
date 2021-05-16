class Peep
  attr_reader :time, :text, :id
  def initialize(text:, time:, id:)
    @text = text
    @time = time
    @id = id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect :dbname => 'chitter', :user => 'annie'
    end
    result = con.exec "SELECT * FROM peeps;"
    result.map do |row|
      new(text: row['text'],
          time: Time.parse(row['created_at']),
          id: row['id'])
    end
  end

  def self.create(text:, time: Time.now)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    result = con.exec "INSERT INTO peeps (text, created_at) VALUES ('#{text}', '#{time}') RETURNING id, text, created_at"
    new(text: result[0]['text'],
        time: result[0]['time'],
        id: result[0]['id'])
  end
end
