require 'bcrypt'
require 'pg'

class User
  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    encrypted_password = BCrypt::Password.create(password)

    connection = PG.connect(dbname: 'scarespace')
    result = connection.exec("INSERT INTO users (email, password) VALUES ('#{email}', '#{encrypted_password}') RETURNING id, email;")

    User.new(id: result[0]['id'], email: result[0]['email'])
  end
end
