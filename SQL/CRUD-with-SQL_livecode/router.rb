class Router
  def initialize(controller)
    @controller = controller
  end

  def start 
    puts "welcome mate"
    choice = gets.chomp.to_i
    case choice
    when 1 then @controller.update
    end
  end
end