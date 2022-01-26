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
    # if we have an employee with this username and with right password
    if employee && employee.password == password
      @sessions_view.signed_successfully(employee)
      return employee
    end
    # if not => display a message 'wrong credentials' and ask again
    @sessions_view.wrong_credentials
    sign_in
  end
end
