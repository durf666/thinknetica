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
  print_menu
  @i = gets.chomp.to_i
  menu_selector(@i)
end

def print_menu
  delimiter
  puts 'Программа управления железной дорогой. Выберите желаемое действие.'
  puts '1. Создать новую станцию'
  puts '2. Создать новый поезд'
  puts '3. Управление поездами'
  puts '4. Управление станциями'
  puts '5. Выход'
  print 'Ваш выбор:'
end

def menu_selector(i)
  case i
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
  print_train_menu
  i = gets.chomp.to_i
  begin
    train_case(i)
  rescue RuntimeError
    train_rescue
  end
end

def print_train_menu
  delimiter
  puts 'Выберите тип поезда.'
  puts '1. Пассажирский'
  puts '2. Грузовой'
  print 'Ваш выбор:'
end

def train_do_1
  print 'Введите номер поезда:'
  name = gets.chomp
  @train = PassengerTrain.new(name)
  @trains.push(@train)
  if @train.valid?
    delimiter
    puts('Создан новый поезд Всего пассажирских поездов:' +
    PassengerTrain.instances.to_s)
  end
end

def train_do_2
  print 'Введите номер поезда:'
  name = gets.chomp
  @train = CargoTrain.new(name)
  @trains.push(@train)
  if @train.valid?
    delimiter
    puts('Создан новый поезд Всего грузовых поездов:' +
    CargoTrain.instances.to_s)
  end
end

def train_rescue
  delimiter
  puts 'Формат ввода номера поезда неверный'
  add_train
end

def train_else
  delimiter
  puts '!!!Значение неверно!!!'
  add_train
end

def train_case(i)
  case i
  when 1
    train_do_1
  when 2
    train_do_2
  else
    train_else
  end
end

def add_station
  delimiter
  puts 'Введите название станции'
  name = gets.chomp
  @stations.push(Station.new(name))
rescue RuntimeError
  delimiter
  puts "Ошибка при вводе имени станции"
  add_station
end

def train_control
  if !@trains.empty?
    delimiter
    puts 'Список существующих поездов:'
    puts ''
    @trains.each_with_index do |train, i|
      puts((i + 1).to_s + '. ' + train.number + ' ' + train.type)
    end
    delimiter
    print 'Выберите поезд, которым вы желаете управлять:'
    puts ''
    i = gets.chomp.to_i - 1
    @train = @trains[i]
    delimiter
    puts "К выбранному поезду присоединены следующие вагоны:"
    @train.wagons do |railcar, index|
      if railcar.type == 'passenger'
        puts((index + 1).to_s + '. ' + railcar.type + '; Св. мест: ' +
        railcar.free_seats.to_s + '; Зан. мест: ' + railcar.busy_seats.to_s)
      else
        puts((index + 1).to_s + '. ' + railcar.type + '; Св. объем: ' +
        railcar.free_volume.to_s + '; Зан. объем: ' + railcar.busy_volume.to_s)
      end
    end
    delimiter
    puts '1. Добавить грузовой вагон'
    puts '2. Добавить пассажирский вагон'
    puts '3. Отцепить последний вагон'
    puts '4. Управление вагонами'
    j = gets.chomp.to_i
    case j
    when 1
      print 'Введите наименование вагона:'
      name = gets.chomp
      print 'Укажите объем вагона:'
      volume = gets.chomp
      @car = CargoCar.new(name, volume)
      @trains[i].add_railcar(@car)
      puts('Объем вагона:' + @car.volume.to_s)
    when 2
      print 'Введите наименование вагона:'
      name = gets.chomp
      print 'Укажите количество мест в вагоне:'
      seats = gets.chomp
      @car = PassengerCar.new(name, seats)
      @trains[i].add_railcar(@car)
      puts('Количество мест в вагоне:' + @car.seats.to_s)
    when 3
      @trains[i].remove_railcar
    when 4
      print 'Введите номер вагона:'
      car_number = gets.chomp.to_i
      if @trains[i].railcars[car_number - 1].type == 'passenger'
        delimiter
        puts '1. Занять место в вагоне'
        delimiter
        input = gets.chomp.to_i
        @trains[i].railcars[car_number - 1].sell_ticket if input == 1
      else
        delimiter
        puts '1. Заполнить объем в вагоне'
        delimiter
        input = gets.chomp.to_i
        if input == 1
          puts 'Введите желаемый объем:'
          volume = gets.chomp.to_i
          @trains[i].railcars[car_number - 1].fill(volume)
        end
      end
    end
  else
    delimiter
    puts 'Для того, тобы управлять поездами сначала создайте хотя бы 1!!!'
  end
end

def station_control
  if !@stations.length.zero?
    station_menu
    i = gets.chomp.to_i - 1
    station_exists(i) ? i <= Station.instances : puts("Станции не существует")
  else
    delimiter
    puts 'Для того, тобы управлять станциями сначала создайте хотя бы 1!!!'
  end
end

def station_menu
  delimiter
  puts 'Список существующих станций:'
  puts ''
  @stations.each_with_index do |station, i|
    puts((i + 1).to_s + '. ' + station.name)
  end
  delimiter
  print 'Выберите станцию, которой вы желаете управлять:'
  puts ''
end

def station_case(i, j)
  case j
  when 1
    puts 'Список поездов железной дороги:'
    @trains.each_with_index do |train, num|
      puts("#{(num + 1)} . #{train.number} #{train.type}")
    end
    puts 'Введите номер поезда, который вы желаете добавить на станцию'
    @stations[i].receive_train(@trains[gets.chomp.to_i-1])
    p @stations[i]
  end
end

def station_exists(i)
  puts "Информация о поездах на выбранной станции"
  @stations[i].show_trains do |train, index|
    puts((index + 1).to_s + '. Номер поезда: ' + train.number +
    '; Количество вагонов: ' + train.railcars.length.to_s)
  end
  delimiter
  puts '1. Добавить поезд на станцию'
  puts '2. В главное меню'
  j = gets.chomp.to_i
end

def delimiter
  puts '********************************************************************'
end

def start_values
  @train = PassengerTrain.new('111-11')
  @trains.push(@train)
  @car = PassengerCar.new('aaa', 25)
  @train.add_railcar(@car)
  @car = PassengerCar.new('bbb', 40)
  @train.add_railcar(@car)
  @train = PassengerTrain.new('222-22')
  @trains.push(@train)
  @train = CargoTrain.new('33333')
  @trains.push(@train)
  @car = CargoCar.new('bbb', 40)
  @train.add_railcar(@car)
  @car = CargoCar.new('ccc', 100)
  @train.add_railcar(@car)
  @station = Station.new('Gadyukino')
  @station.receive_train(@train)
  @stations.push(@station)
  @stations.push(Station.new('New Vasyuki'))
end

start_values
loop do
  main_menu
  break if @i == 5
end
