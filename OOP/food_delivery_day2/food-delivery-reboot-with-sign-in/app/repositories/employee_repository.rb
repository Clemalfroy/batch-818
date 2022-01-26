require "csv"
require_relative "base_repository"
require_relative "../models/employee"

class EmployeeRepository < BaseRepository
  undef_method :create, :push

  def find_by_username(username)
    @elements.find { |employee| employee.username == username }
  end

  def all_riders
    @elements.select { |employee| employee.role == 'rider' }
  end

  private

  def row_to_element(row)
    Employee.new(row)
  end
end
