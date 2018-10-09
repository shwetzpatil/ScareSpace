require './App/Model/User.rb'
require 'pg'

describe User do
  describe '.create' do
    it 'creates a new user' do
      connection = PG.connect(dbname: 'scarespace')
      connection.exec 'TRUNCATE users, spaces, availability'
      new_user = User.create(email: 'test@example.com', password: 'password123')

      expect(new_user).to be_a User
      expect(new_user).to respond_to :id
      expect(new_user.email).to eq 'test@example.com'
    end

    it('hashes the password using BCrypt') do
      connection = PG.connect(dbname: 'scarespace')
      connection.exec 'TRUNCATE users, spaces, availability'

      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(email: 'test@example.com', password: 'password123')
    end
  end

  describe '.find' do

  end

  describe '.authenticate' do

  end
end
