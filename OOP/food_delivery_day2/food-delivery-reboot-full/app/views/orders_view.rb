class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      status = order.delivered? ? '[X]' : '[ ]'
      puts "#{status} #{index + 1} - Meal: #{order.meal.name} | Customer: #{order.customer.name} | Rider: #{order.employee.username}"
    end
  end

  def ask_for_index(element)
    puts "What is the index of the #{element} you want to select"
    gets.chomp.to_i - 1
  end

  def display_riders(riders)
    riders.each_with_index do |rider, index|
      puts "#{index + 1} -- #{rider.username}"
    end
  end
end
