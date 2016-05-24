require_relative 'train'
require_relative 'instance_counter'

class PassengerTrain < Train

  include InstanceCounter
  attr_reader :type

  def initialize(number)
    super
    @type = 'passenger'
  end
end