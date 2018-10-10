require './App/Model/Availability.rb'

describe Availability do
  before(:each) do
    @lister = User.create(email: 'testtwo@example.com', password: 'password123')
    @booker = User.create(email: 'test@example.com', password: 'password123')
    @space = Space.create(name: 'patricks', address: 'tester street', price: '100.00', description: 'hole', lister_id: "#{@lister.id}")
  end
  it 'selects an available space' do
    Space.list(@space.id, @lister.id, 31)
    result = Availability.list(31).first
    expect(result.space_id).to eq(@space.id)
    expect(result.lister_id).to eq(@lister.id)
  end

  it 'selects all spaces with availabilities listed' do
    second_space = Space.create(name: 'patricks2', address: 'tester street2', price: '100.00', description: 'hole', lister_id: "#{@lister.id}")

    Space.list(@space.id, @lister.id, 31)
    Space.list(second_space.id, @lister.id, 31)

    result = Availability.list(31)

    expect(result[0].space_id).to eq(@space.id)
    expect(result[0].lister_id).to eq(@lister.id)
    expect(result[1].space_id).to eq(second_space.id)
    expect(result[1].lister_id).to eq(@lister.id)
  end
end
