require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'

require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'

require_relative 'router'

meals_csv = File.join(__dir__, 'data/meals.csv')
meals_repository = MealRepository.new(meals_csv)
meals_controller = MealsController.new(meals_repository)

customers_csv = File.join(__dir__, 'data/customers.csv')
customers_repository = CustomerRepository.new(customers_csv)
customers_controller = CustomersController.new(customers_repository)

router = Router.new(meals_controller, customers_controller)
router.run
