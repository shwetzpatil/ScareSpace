describe Requests do
  before(:each) do
    @lister = User.create(email: 'test@example.com', password: 'password123')
    @requester = User.create(email: 'testtwo@example.com', password: 'password123')
    @space = Space.create(name: 'patricks', address: 'tester street', price: '100.00', description: 'hole', lister_id: "#{@lister.id}")
  end

  describe '.list' do
    it 'selects an available space' do
      Space.list(@space.id, @lister.id, 31)
      result = Requests.list_available(31).first
      expect(result.space_id).to eq(@space.id)
      expect(result.lister_id).to eq(@lister.id)
    end

    it 'selects all spaces with availabilities listed' do
      second_space = Space.create(name: 'patricks2', address: 'tester street2', price: '100.00', description: 'hole', lister_id: "#{@lister.id}")

      Space.list(@space.id, @lister.id, 31)
      Space.list(second_space.id, @lister.id, 31)

      result = Requests.list_available(31)

      expect(result[0].space_id).to eq(@space.id)
      expect(result[0].lister_id).to eq(@lister.id)
      expect(result[1].space_id).to eq(second_space.id)
      expect(result[1].lister_id).to eq(@lister.id)
    end
  end

  describe '.book' do
    it 'should add a request to the database' do
      Space.list(@space.id, @lister.id, 31)
      Requests.book(@space.id, @requester.id, 31)
      result = Requests.list_available(31).first
      expect(result.requester_id).to eq(@requester.id)
    end
  end

  describe '.receive' do
    it 'should return a list of listed properties that have requests' do
      Space.list(@space.id, @lister.id, 31)
      Requests.book(@space.id, @requester.id, 31)
      result = Requests.receive(@lister.id).first
      expect(result.lister_id).to eq(@lister.id)
      expect(result.requester_id).to eq(@requester.id)
      expect(result.booker_id).to eq(@lister.id) # remains as the lister while unbooked
    end
  end

  describe '.accept' do
    xit 'should allow us to accept a request' do
      Space.list(@space.id, @lister.id, 31)
      Requests.book(@space.id, @requester.id, 31)
      Requests.accept(@space.id, @requester.id, 31)
      result = Requests.list_available(31).first
      expect(result.booker_id).to eq(@requester.id)
    end
  end

  describe '.decline' do
    xit 'should allow us to decline a request' do
      Space.list(@space.id, @lister.id, 31)
      Requests.book(@space.id, @requester.id, 31)
      Requests.decline(@space.id, @requester.id, 31)
      result = Requests.list_available(31).first
      expect(result.requester_id).not_to eq(@requester.id)
    end
  end
end
