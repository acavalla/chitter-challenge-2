require 'time'
require_relative 'database_connection'

class Peep
  attr_reader :time, :text, :id
  def initialize(text:, time:, id:)
    @text = text
    @time = time
    @id = id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |row|
      new(text: row['text'],
          time: Time.parse(row['created_at']),
          id: row['id'])
    end
  end

  def self.create(text:, time: Time.now)
    result = DatabaseConnection.query("INSERT INTO peeps (text, created_at) VALUES ('#{text}', '#{time}') RETURNING id, text, created_at").first
    new(text: result['text'],
        time: Time.parse(result['created_at']),
        id: result['id'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM peeps WHERE id = #{id} RETURNING id, text, created_at")
  end
end
