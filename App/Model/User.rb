require 'bcrypt'
require 'pg'

class User
  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    return if duplicate_email?(email)

    encrypted_password = BCrypt::Password.create(password)
    connection = PG.connect(dbname: 'scarespace')

    result = connection.exec("INSERT INTO users (email, password) VALUES ('#{email}', '#{encrypted_password}') RETURNING id, email;")

    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(id:)
    return unless id

    connection = PG.connect(dbname: 'scarespace')

    result = connection.exec("SELECT * FROM users WHERE id = '#{id}';")

    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    connection = PG.connect(dbname: 'scarespace')
    result = connection.exec("SELECT * FROM users WHERE email = '#{email}';")

    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password

    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  private

  def self.duplicate_email?(email)
    connection = PG.connect(dbname: 'scarespace')
    email = connection.exec("SELECT email FROM users WHERE email = '#{email}';")
    email.any?
  end
end
