class SessionsView
  def ask_for(stuff)
    puts "#{stuff}?"
    gets.chomp
  end

  def signed_successfully(employee)
    puts "Hi #{employee.username}! Nice to have you back :)"
  end

  def wrong_credentials
    puts 'Wrong credentials... Try again'
  end
end
