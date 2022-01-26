require_relative '../views/customers_view'

class CustomersController
  def initialize(customers_repository)
    @customers_repository = customers_repository
    @customers_view = CustomersView.new
  end

  def list
    display_customers
  end

  def add
    # Ask user for a name
    name = @customers_view.ask_for("Enter a new name:")
    # Ask user for an address
    address = @customers_view.ask_for("Enter a new address for #{name}:")
    # Create a new Customer instance with the data given by user
    customer = Customer.new(name: name, address: address)
    # Store it (in the repo)
    @customers_repository.create(customer)
  end

  private

  def display_customers
    # Get all the customers (from the repo)
    customers = @customers_repository.all
    # Display the customers to user
    @customers_view.display(customers)
  end
end
