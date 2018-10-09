require 'pg'
require_relative 'Database_connection'
require_relative 'User'

class Space
  attr_reader :id, :name, :address, :price, :description, :lister_id

  def initialize(id:, name:, address:, price:, description:, lister_id:)
    @id = id
    @name = name
    @address = address
    @price = price
    @description = description
    @lister_id = lister_id
  end

  def self.all
    result = DatabaseConnection.all("spaces")
    result.map { |row| row['name']}
  end

  def self.create(id:, name:, address:, price:, description:, lister_id:)
    result = DatabaseConnection.insert("spaces", "id, name, address, price, description, lister_id", "'#{id}', '#{name}', '#{address}','#{price}', '#{description}', '#{lister_id}'", "id, name, address, price, description, lister_id")
    Space.new(id: result[0]['id'], name: result[0]['name'], address: result[0]['address'], price: result[0]['price'], description: result[0]['description'], lister_id: result[0]['lister_id'])
  end
end
