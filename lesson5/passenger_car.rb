require_relative 'railcar'
require_relative 'instance_counter'

# include InstanceCounter

class PassengerCar < Railcar

  attr_reader :type

  def initialize(name)
    super
    @type= 'passenger'
  end

include InstanceCounter

end