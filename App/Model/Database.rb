require 'pg'

class DatabaseConnection
  def self.setup
    @connection = PG.connect(dbname: 'scarespace')
  end

  def self.connection
    @connection
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end
