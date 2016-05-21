require_relative 'railcar'

class PassengerCar < Railcar

  attr_reader :type

  def initialize(name)
    super
    @type= 'passenger'
  end
end