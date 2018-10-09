require './App/Model/Database.rb'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'scarespace')
      DatabaseConnection.setup
    end
  end

  describe '.connection' do
    it 'this connection is persistent' do
      connection = DatabaseConnection.setup
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup
      expect(connection).to receive(:exec).with ("SELECT * FROM users;")
      DatabaseConnection.query("SELECT * FROM users;")
    end
  end
end
