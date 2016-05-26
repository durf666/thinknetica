require_relative 'train'
require_relative 'instance_counter'
# Defines cargo train in programm
class CargoTrain < Train
  include InstanceCounter
  attr_reader :type

  def initialize(number)
    super
    @type = 'cargo'
    register_instance
  end
end
