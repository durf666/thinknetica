require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'passenger_car'
require_relative 'cargo_car'
require_relative 'route'
require_relative 'station'

@trains = []
@stations = []



def main_menu
  puts 'Программа управления железной дорогой. Выберите желаемое действие.'
  puts '1. Создать новую станцию'
  puts '2. Создать новый поезд'
  puts '3. Управление поездами'
  puts '4. Управление станциями'


  i = gets.chomp.to_i

  case i
  when 1
    puts 'Введите название станции'
    name = gets.chomp
    @stations.push(Station.new(name))
    @stations.each {|a| p a}
  when 2
    puts '222'
  when 3
    puts '333'
  when 4
    puts '444'
  end

end


main_menu