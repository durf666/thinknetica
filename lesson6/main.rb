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
  delimiter
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
  delimiter
  puts 'Выберите тип поезда.'
  puts '1. Пассажирский'
  puts '2. Грузовой'
  print 'Ваш выбор:'
  
  i = gets.chomp.to_i
  begin
    case i
    when 1
      print 'Введите номер поезда:'
      name = gets.chomp
      @train = PassengerTrain.new(name)
      @trains.push(@train)
      if @train.valid?
        delimiter
        puts 'Создан новый поезд'
        puts 'Всего пассажирских поездов:' + PassengerTrain.instances.to_s
      else
        puts ''
      end
    when 2
      print 'Введите номер поезда:'
      name = gets.chomp
      @train = CargoTrain.new(name)
      @trains.push(@train)
      if @train.valid?
        delimiter
        puts 'Создан новый поезд'
      end 
    else
      delimiter
      puts '!!!Значение неверно!!!'
      add_train
    end
  rescue RuntimeError
    delimiter
    puts 'Формат ввода номера поезда неверный'
    add_train
  end
end

def add_station
  begin
    delimiter
    puts 'Введите название станции'
    name = gets.chomp
    @stations.push(Station.new(name))
  rescue RuntimeError
    delimiter
    puts "Ошибка при вводе имени станции"
    add_station
  end

end

def train_control
  if @trains.length > 0
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
  else
    delimiter
    puts 'Для того, тобы управлять поездами сначала создайте хотя бы 1!!!'
  end
end

def station_control
  if !@stations.length.zero?
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
    j = gets.chomp.to_i
    case j
    when 1
      puts 'Список поездов железной дороги:'
      @trains.each_with_index {|train, i| puts((i+1).to_s + '. ' + train.number  + ' ' + train.type)}
      puts 'Введите номер поезда, который вы желаете добавить на станцию'
      @name = gets.chomp
      @stations[i].receive_train(@name)
    end
  else
    delimiter
    puts 'Для того, тобы управлять станциями сначала создайте хотя бы 1!!!'
  end
end

def delimiter
  puts '********************************************************************'
end

loop do
main_menu
break if @i == 5
end