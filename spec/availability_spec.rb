require './App/Model/Availability.rb'

describe Availability do
  it 'selects an available space' do
    lister = User.create(email: 'testtwo@example.com', password: 'password123')
    booker = User.create(email: 'test@example.com', password: 'password123')
    space = Space.create(id: '200', name: 'patricks', address: 'tester street', price: '100.00', description: 'hole', lister_id: "#{lister.id}")
    DatabaseConnection.insert('availability', 'date, space_id, booker_id, lister_id', "31, '#{space.id}', '#{lister.id}', '#{lister.id}'", '*' )
    result = Availability.list(31).first
    expect(result.space_id).to eq(space.id)
    expect(result.lister_id).to eq(lister.id)
  end

  it 'selects all spaces with availabilities listed' do
    lister = User.create(email: 'testtwo@example.com', password: 'password123')
    booker = User.create(email: 'test@example.com', password: 'password123')
    space = Space.create(id: '200', name: 'patricks', address: 'tester street', price: '100.00', description: 'hole', lister_id: "#{lister.id}")
    space2 = Space.create(id: '300', name: 'patricks2', address: 'tester street2', price: '100.00', description: 'hole', lister_id: "#{lister.id}")
    DatabaseConnection.insert('availability', 'date, space_id, booker_id, lister_id', "31, '#{space.id}', '#{lister.id}', '#{lister.id}'", '*' )
    DatabaseConnection.insert('availability', 'date, space_id, booker_id, lister_id', "31, '#{space2.id}', '#{lister.id}', '#{lister.id}'", '*' )
    result = Availability.list(31)
    expect(result[0].space_id).to eq(space.id)
    expect(result[0].lister_id).to eq(lister.id)
    expect(result[1].space_id).to eq(space2.id)
    expect(result[1].lister_id).to eq(lister.id)
  end
end
