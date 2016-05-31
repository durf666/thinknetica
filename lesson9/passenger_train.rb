require_relative 'train'
require_relative 'instance_counter'

# Specific functions 4 passenger trains
class PassengerTrain < Train
  include InstanceCounter
  attr_reader :type

  def initialize(number)
    super
    @type = 'passenger'
    register_instance
  end
end
