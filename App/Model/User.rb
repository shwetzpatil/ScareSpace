require 'bcrypt'
require_relative 'database_connection'

class User
  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    return if duplicate_email?(email)

    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.insert("users", "email, password", "'#{email}', '#{encrypted_password}'", "id, email" )

    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(id:)
    return unless id

    result = DatabaseConnection.select("*","users","id",id)

    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.select("*", "users", "email", email)

    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password

    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  private

  def self.duplicate_email?(email)
    email = DatabaseConnection.select("email","users", "email", email)
    email.any?
  end
end
