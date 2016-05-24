require_relative 'railcar'
require_relative 'instance_counter'



class PassengerCar < Railcar

  include InstanceCounter
  attr_reader :type, :seats
  attr_accessor :free_seats, :busy_seats

  def initialize(name)
    super
    @type= 'passenger'
    @seats= 30
    @free_seats = seats
    @busy_seats = 0
  end

  def sell_ticket
  	@busy_seats+= 1
  	@free_seats = @seats - @busy_seats
  end




end