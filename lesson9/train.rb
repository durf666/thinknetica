# Class defines train in programm
class Train
  require_relative 'vendor'
  include Vendor

  attr_accessor :speed, :railcars, :route, :station
  attr_reader :number, :index
  @@trains = {}
  NUMBER_FORMAT = /^[a-z0-9]{3}[-]*[a-z0-9]{2}$/i

  def initialize(number)
    @number = number
    validate!
    @railcars = []
    @@trains[number] = self
    @speed = 0
    @index = 0
  end

  def speed_up(value)
    @speed += value
  end

  def speed_down(value)
    @speed -= value
  end

  def stop
    @speed = 0
  end

  def show_railars
    puts @railcars
  end

  def add_railcar(car)
    @railcars.push(car) if speed.zero? && correct_car?(car)
  end

  def remove_railcar
    @railcars.pop if speed.zero?
  end

  def route(route)
    @route = route
    @station = 0
  end

  def current_station
    puts @route.stations[@station]
  end

  def next_station
    puts @route.stations[@station + 1] if @station < @route.stations.length
  end

  def last_station
    puts @route.stations[@station - 1] if @station > 0
  end

  def self.find(number)
    # ObjectSpace.each_object(Train) {|train| p train if number == train.number}
    p @@trains[number]
  end

  def valid?
    true if validate!
  rescue
    false
  end

  def wagons
    railcars.each_with_index { |railcar, index| yield(railcar, index) }
  end

  protected

  def stopped?
    speed.zero?
  end

  def correct_car?(car)
    car.type == type
  end

  def validate!
    raise 'Number cannot be blank' if number.nil?
    raise 'Number has wrong format' if number !~ NUMBER_FORMAT
    true
  end
end