class Train
  attr_accessor :speed, :railcars, :route, :station
  attr_reader :type, :number

  def initialize(number, type, railcars)
    @number = number
    @type = type
    @railcars = railcars
    @speed = 0
  end

  def speed_up(value)
    @speed+= value
  end

  def speed_down(value)
    @speed-= value
  end

  def stop
    @speed= 0
  end

  def show_railars
    puts @railcars
  end

  def add_railcar
    @railcars += 1 if @speed == 0
  end

  def remove_railcar
    @railcars += -1 if @speed == 0
  end

  def set_route(route)
    @route = route
    @station = 0
  end

  def current_station
    puts @route.stations[@station]
  end

  def next_station
    puts @route.stations[@station+1] if @station < @route.stations.length
  end

  def last_station
    puts @route.stations[@station-1] if @station > 0    
  end

end