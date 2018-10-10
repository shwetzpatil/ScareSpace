describe DatabaseConnection do
  before(:each) {@connection = DatabaseConnection.setup}
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'scarespace')
      DatabaseConnection.setup
    end
  end

  describe '.connection' do
    it 'this connection is persistent' do
      expect(DatabaseConnection.connection).to eq @connection
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      expect(@connection).to receive(:exec).with("SELECT * FROM users;")
      DatabaseConnection.query("SELECT * FROM users;")
    end
  end

  describe '.select' do
    it 'selects required data' do
      expect(@connection).to receive(:exec).with("SELECT * FROM users WHERE id = '1';")
      DatabaseConnection.select('*', 'users', 'id', '1')
    end
  end

  describe '.insert' do
    it 'adds data to the table' do
      expect(@connection).to receive(:exec).with("INSERT INTO users (email, password) VALUES ('test@example.com', 'test') RETURNING id, email;")

      DatabaseConnection.insert("users", "email, password", "'test@example.com', 'test'", "id, email")
    end
  end

  describe '.all' do
    it 'selects all data from the table' do
      expect(@connection).to receive(:exec).with("SELECT * FROM spaces")

      DatabaseConnection.all("spaces")
    end
  end

  describe '.listed_spaces' do
    it 'selects all spaces with availabilities listed' do
      expect(@connection).to receive(:exec).with("SELECT * FROM availability WHERE date = 31;")
      DatabaseConnection.list(31)
    end
  end
end
