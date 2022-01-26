require_relative "base_repository"
require_relative "../models/order"

class OrderRepository < BaseRepository
  def initialize(orders_csv_path, meal_repository, customer_repository, employee_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    super(orders_csv_path)
  end

  def undelivered_orders
    @elements.reject { |order| order.delivered? }
    # @elements.select do |order|
    #   order.delivered? == false
    # end
  end

  def mark_an_order_as_delivered(order)
    order.deliver!
    push
  end

  private

  def row_to_element(row)
    row[:meal] = @meal_repository.find(row[:meal_id].to_i)
    row[:customer] = @customer_repository.find(row[:customer_id].to_i)
    row[:employee] = @employee_repository.find(row[:employee_id].to_i)
    row[:delivered] = row[:delivered] == "true"
    Order.new(row)
  end

  def headers
    ["id", "meal_id", "customer_id", "employee_id", "delivered"]
  end

  def element_to_row(order)
    [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered?]
  end
end
