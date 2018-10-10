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

    result.map { |row| Availability.new(id: row['id'], space_id: row['space_id'], booker_id: row['booker_id'], lister_id: row['lister_id'], date: row['date']) }
  end
end
