require 'pg'
require './App/Model/Space.rb'
require './App/Model/Database_Connection.rb'

describe Space do
  before(:each) do
    @connection = DatabaseConnection.setup
    @connection.query('TRUNCATE users, spaces, availability;')
  end

  describe '.create' do
  end
  describe '.update' do
  end
  describe '.find' do
  end
  describe '.all' do
    it 'should display all spaces' do
      # space1 = @connection.exec("INSERT INTO spaces (name) VALUES ('robbie');")
      DatabaseConnection.insert("spaces", "name", "'robbie'", "name")
    
      expect(Space.all).to include("robbie")

    end
  end
  describe '.delete' do
  end
end