require_relative 'database_connection'
require 'bcrypt'

class User
  attr_reader :id, :email
  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    return if check_email(email)
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
    result = check_email(email)
    return unless result
    return unless BCrypt::Password.new(result['password']) == password

    new(id: result['id'],
        email: result['email'])
  end

  private
  def self.check_email(email)
    DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';").first
  end
end
