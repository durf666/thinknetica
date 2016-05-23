require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'passenger_car'
require_relative 'cargo_car'
require_relative 'route'
require_relative 'station'

@trains = []
@stations = []

private

def main_menu
  puts '************************'
  puts 'Программа управления железной дорогой. Выберите желаемое действие.'
  puts '1. Создать новую станцию'
  puts '2. Создать новый поезд'
  puts '3. Управление поездами'
  puts '4. Управление станциями'
  puts '5. Выход'
  print 'Ваш выбор:'

  @i = gets.chomp.to_i

  case @i
  when 1
    add_station
  when 2
    add_train
  when 3
    train_control
  when 4
    station_control
  end


end

def add_train
  puts '************************'
  puts 'Выберите тип поезда.'
  puts '1. Пассажирский'
  puts '2. Грузовой'
  print 'Ваш выбор:'
  
  i = gets.chomp.to_i
  case i
  when 1
    print 'Введите номер поезда:'
    name = gets.chomp
    @train = PassengerTrain.new(name)
    @trains.push(@train)
    puts 'Создан новый поезд'
  when 2
    print 'Введите номер поезда:'
    name = gets.chomp
    @train = CargoTrain.new(name)
    @trains.push(@train)
    puts 'Создан новый поезд' 
  else
    delimiter
    puts '!!!Значение неверно!!!'
    add_train
  end
end

def add_station
  puts 'Введите название станции'
  name = gets.chomp
  @stations.push(Station.new(name))
end

def train_control
  delimiter
  puts 'Список существующих поездов:'
  puts ''
  @trains.each_with_index {|train, i| puts((i+1).to_s + '. ' + train.number  + ' ' + train.type)}
  delimiter
  print 'Выберите поезд, которым вы желаете управлять:'
  puts ''
  i = gets.chomp.to_i - 1
  @train = @trains[i]
  delimiter
  puts "Информация о выбранном поезде"
  p @train
  puts '1. Добавить грузовой вагон'
  puts '2. Добавить пассажирский вагон'
  puts '3. Отцепить последний вагон'
  j = gets.chomp.to_i
  case j 
  when 1
    print 'Введите наименование вагона:'
    name = gets.chomp
    @car = CargoCar.new(name)
    @trains[i].add_railcar(@car)
  when 2
    print 'Введите наименование вагона:'
    name = gets.chomp
    @car = PassengerCar.new(name)
    @trains[i].add_railcar(@car)
  when 3
    @trains[i].remove_railcar
  end
end

def station_control
  delimiter
  puts 'Список существующих станций:'
  puts ''
  @stations.each_with_index {|station, i| puts((i+1).to_s + '. ' + station.name)}
  delimiter
  print 'Выберите станцию, которой вы желаете управлять:'
  puts ''
  i = gets.chomp.to_i - 1
  @station = @stations[i]
  puts "Информация о поездах на выбранной станции"
    @station.trains.each_with_index {|train, ind| puts((ind+1).to_s + '. ' + train)}
  delimiter
  puts '1. Добавить поезд на станцию'
  puts '2. В главное меню'
  j = gets.chomp.to_i - 1
  case j
  when 1
    puts 'Введите номер поезда'
    @name = gets.chomp
    @stations[i].receive_train(@name)
  end
end

def delimiter
  puts '************************'
end

loop do
main_menu
break if @i == 5
end