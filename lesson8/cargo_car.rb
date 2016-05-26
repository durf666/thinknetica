require_relative 'railcar'
require_relative 'instance_counter'
# Defines cargo car in programm
class CargoCar < Railcar
  include InstanceCounter
  attr_reader :type, :volume
  attr_accessor :free_volume, :busy_volume

  def initialize(name, volume = 100)
    super
    @type = 'cargo'
    @volume = volume
    @free_volume = @volume
    @busy_volume = 0
  end

  def fill(volume)
    self.busy_volume = busy_volume + volume
    self.free_volume = free_volume - busy_volume
  end
end
