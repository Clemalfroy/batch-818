require "csv"
require_relative "base_repository"
require_relative "../models/customer"

class CustomerRepository < BaseRepository
  private

  def row_to_element(row)
    Customer.new(row)
  end

  def headers
    ["id", "name", "address"]
  end

  def element_to_row(customer)
    [customer.id, customer.name, customer.address]
  end
end
