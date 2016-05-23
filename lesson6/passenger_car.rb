require_relative 'railcar'
require_relative 'instance_counter'



class PassengerCar < Railcar

  include InstanceCounter
  attr_reader :type

  def initialize(name)
    super
    @type= 'passenger'
  end



end