require_relative 'database_connection'

class User
  attr_reader :id, :email
  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    result = DatabaseConnection.query("INSERT INTO users (email, password) VALUES ('#{email}', '#{password}') RETURNING id, email;").first
    new(id: result['id'],
        email: result['email'])
  end

  def self.find(id)
    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'").first
    new(id: result['id'],
        email: result['email'])
  end
end
