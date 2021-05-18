require_relative 'database_connection'
require 'bcrypt'

class User
  attr_reader :id, :email
  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (email, password) VALUES ('#{email}', '#{encrypted_password}') RETURNING id, email;").first
    new(id: result['id'],
        email: result['email'])
  end

  def self.find(id)
    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'").first
    new(id: result['id'],
        email: result['email'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';").first
    return unless result
    return unless BCrypt::Password.new(result['password']) == password

    User.new(id: result['id'],
             email: result['email'])
  end
end
