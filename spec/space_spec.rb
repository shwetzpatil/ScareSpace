


describe Space do

  describe '.create' do
    it 'should create a new space and add it to the database' do
      new_user = User.create(email: 'test@example.com', password: 'password123')
      new_space = Space.create(id: 1, name: 'robbie', address: 'xyz', price: '100', description: 'abc', lister_id: new_user.id)
      expect(new_space.name).to eq 'robbie'
      expect(new_space).to respond_to :id
    end
  end
  describe '.update' do
  end
  describe '.find' do
  end
  describe '.all' do
    it 'should display all spaces' do
      DatabaseConnection.insert("spaces", "name", "'robbie'", "name")

      expect(Space.all).to include("robbie")

    end
  end
  describe '.delete' do
  end
end
