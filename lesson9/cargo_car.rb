require_relative 'railcar'
require_relative 'instance_counter'
  require_relative 'accessor'

# Defines cargo car in programm
class CargoCar < Railcar

  include InstanceCounter
  extend Accessors
  attr_reader :type
  attr_accessor :volume
  attr_accessor_with_history :free_volume
  strong_attr_accessor :busy_volume, 'Fixnum'

  def initialize(name, volume = 100)
    super
    @type = 'cargo'
    @volume = volume
    @free_volume = @volume
    @busy_volume = 0
  end

  def fill(volume)
    self.busy_volume = busy_volume + volume
    self.free_volume = @volume - busy_volume
  end
end
