require 'pg'
require_relative 'Availability'

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

  def self.select(details, table, attribute, value)
    @connection.exec("SELECT #{details} FROM #{table} WHERE #{attribute} = '#{value}';")
  end

  def self.insert(table, column_names, values, return_values)
    @connection.exec("INSERT INTO #{table} (#{column_names}) VALUES (#{values}) RETURNING #{return_values};")
  end

  def self.all(table)
    @connection.exec("SELECT * FROM #{table}")
  end

  def self.list(date)
    @connection.exec("SELECT * FROM availability WHERE date = #{date} AND lister_id = booker_id;")
  end
end
