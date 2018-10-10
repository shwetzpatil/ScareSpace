describe Space do

  before(:each) do
    @new_user = User.create(email: 'test@example.com', password: 'password123')
    @new_space = Space.create(name: 'robbiespace', address: 'xyz', price: '100', description: 'abc', lister_id: @new_user.id)
  end

  describe '.all' do
    it 'should display all spaces' do
      spaces = Space.all

      names = spaces.map(&:name)
      prices = spaces.map(&:price)
      expect(names).to include('robbiespace')
      expect(prices).to include('100.00')

    end
  end

  # on create expect address to be unique
  describe '.create' do
    it 'should create a new space and add it to the database' do
      expect(@new_space.name).to eq 'robbiespace'
      expect(@new_space).to respond_to :id
    end
  end

  describe '.update' do
    it 'should enable a user to update the name of their space' do
      Space.update(@new_space.id, name: 'robbiescaryspace')
      space_list = Space.all
      names = space_list.map(&:name)
      expect(names).to include 'robbiescaryspace'
      expect(names).not_to include 'robbiespace'
    end
  end

  describe '.find' do
    it 'finds a space' do
      expected_space = Space.find(@new_space.id)
      expect(expected_space.name).to eq"robbiespace"
      expect(expected_space.price).to eq "100.00"
    end
  end

  describe '.delete' do
    it 'should delete a space from the database based on name and user id' do
      Space.delete(@new_space.id)
      spaces = Space.all
      name = spaces.map(&:name)
      expect(name).not_to include("robbiespace")
    end
  end
  describe '.list' do
    it 'should list the space as available on a date' do
      Space.list(@new_space.id, @new_user.id, 31)
      result = Requests.list_available(31).first
      expect(result.space_id).to eq @new_space.id
    end
  end
end
