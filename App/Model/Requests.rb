class Requests
  attr_reader :id, :name, :space_id, :booker_id, :lister_id, :date, :requester_id

  def initialize(id:, space_id:, booker_id:, lister_id:, date:, requester_id:)
    @id = id
    @space_id = space_id
    @booker_id = booker_id
    @lister_id = lister_id
    @date = date
    @requester_id = requester_id
  end

  def self.list_available(date)
    result = DatabaseConnection.list(date)

    result.map { |row| Requests.new(id: row['id'], space_id: row['space_id'], booker_id: row['booker_id'], lister_id: row['lister_id'], date: row['date'], requester_id: row['requester_id']) }
  end

  def self.book(space_id, requester_id, date)
    DatabaseConnection.query("UPDATE availability SET requester_id = '#{requester_id}' WHERE space_id = '#{space_id}' AND date = '#{date}';")
  end

  def self.receive(requester_id)
    result = DatabaseConnection.all("availability")
    result.map { |row| Requests.new(id: row['id'], date: row['date'], space_id: row['space_id'], booker_id: row['booker_id'], lister_id: row['lister_id'], requester_id: row['requester_id']) }
  end

  def self.accept(space_id, requester_id, date)
    DatabaseConnection.query("UPDATE availability SET booker_id = '#{requester_id}' WHERE space_id = '#{space_id}' AND date = '#{date}';")
  end

  def self.decline(space_id, requester_id, date)
    DatabaseConnection.query("UPDATE availability SET requester_id = null WHERE space_id = '#{space_id}' AND date = '#{date}';")

  end
end
