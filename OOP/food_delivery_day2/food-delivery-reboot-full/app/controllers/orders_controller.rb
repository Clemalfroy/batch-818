require_relative '../views/orders_view'
require_relative '../views/meals_view'
require_relative '../views/customers_view'
require_relative '../models/order'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @orders_view = OrdersView.new
  end

  def add
    # Select the meal
    meal = select('meal', @meal_repository, @meals_view)
    # Select the customer
    customer = select('customer', @customer_repository, @customers_view)
    # Select the rider
    rider = select('rider', @employee_repository, @orders_view)
    # Create the Order instance
    order = Order.new(meal: meal, customer: customer, employee: rider)
    # Store it (in the repo)
    @order_repository.create(order)
  end

  def list_undelivered_orders
    # Retrieve all the undelivered orders
    orders = @order_repository.undelivered_orders
    # Display the orders
    @orders_view.display(orders)
  end

  def list_my_orders(rider)
    display_undelivered_orders(rider)
  end

  def mark_as_delivered(rider)
    # Display all his undelivered orders
    orders = display_undelivered_orders(rider)
    # Ask user the index of the order he wants to mark as delivered
    order_index = @orders_view.ask_for_index(:order)
    # Retrieve the selected order
    order = orders[order_index]
    # Mark it as delivered and save it (in the repo)
    @order_repository.mark_an_order_as_delivered(order)
  end

  private

  # DRY refacto select_element to have one method instead of 3: select_meal, select_customer, select_rider
  def select(element, repo, view)
    # Retrieve the elements
    elements = repo == @employee_repository ? repo.all_riders : repo.all
    # Display element
    elements = repo == @employee_repository ? view.display_riders(elements) : view.display(elements)
    # Ask user which element he wants (index)
    element_index = @orders_view.ask_for_index(element)
    # Retrieve the element chosen by user
    elements[element_index]
  end

  def display_undelivered_orders(rider)
    # Retrieve the undelivered orders of the rider logged in
    orders = @order_repository.undelivered_orders.select { |order| order.employee == rider }
    # Display the orders
    @orders_view.display(orders)
    return orders
  end

  # def select_meal
  #   # Retrieve the meals
  #   meals = @meal_repository.all
  #   # Display meals
  #   @meals_view.display(meals)
  #   # Ask user which meal he wants (index)
  #   meal_index = @orders_view.ask_for_index(:meal)
  #   # Retrieve the meal chosen by user
  #   meals[meal_index]
  # end

  # def select_customer
  #   # Retrieve the customers
  #   customers = @customer_repository.all
  #   # Display customers
  #   @customers_view.display(customers)
  #   # Ask user which customer he wants (index)
  #   customer_index = @orders_view.ask_for_index(:customer)
  #   # Retrieve the customer chosen by user
  #   customers[customer_index]
  # end

  # def select_rider
  #   # Retrieve the riders
  #   riders = @employee_repository.all_riders
  #   # Display riders
  #   @orders_view.display_riders(riders)
  #   # Ask user which rider he wants (index)
  #   rider_index = @orders_view.ask_for_index(:rider)
  #   # Retrieve the rider chosen by user
  #   riders[rider_index]
  # end
end
