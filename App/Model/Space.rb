require 'pg'
require_relative 'database_connection'

class Space

  def initialize()
  end

  def self.all
    # result = DatabaseConnection.select("*", "spaces", "name", "robbie" )
    # connection = PG.connect(dbname: 'scarespace')
    # all_spaces = connection.exec "SELECT * FROM spaces"
    result = DatabaseConnection.all("spaces")
    result.map { |row| row['name']}
  end
end