class Availability
  attr_reader :id, :name, :space_id, :booker_id, :lister_id, :date

  def initialize(id:, space_id:, booker_id:, lister_id:, date:)
    @id = id
    @space_id = space_id
    @booker_id = booker_id
    @lister_id = lister_id
    @date = date
  end

  def self.list(date)
    result = DatabaseConnection.list(date)

    Availability.new(id: result[0]['id'], space_id: result[0]['space_id'], booker_id: result[0]['booker_id'], lister_id: result[0]['lister_id'], date: result[0]['date'])
  end
end
