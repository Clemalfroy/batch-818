require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def sign_in
    # Ask for username
    username = @sessions_view.ask_for(:username)
    # Ask for password
    password = @sessions_view.ask_for(:password)
    # Check if we have an employee with this username
    employee = @employee_repository.find_by_username(username)
    if employee && employee.password == password
      @sessions_view.signed_successfully(employee)
      return employee
    end
    @sessions_view.wrong_credentials
    sign_in
    # if true => check if this is the right password for this employee
     # if true => return employee
     # if false => display a message 'wrong credentials', loop
    # if false => display a message 'wrong credentials', loop
  end
end
