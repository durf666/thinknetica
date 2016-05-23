require_relative 'railcar'
require_relative 'instance_counter'


class CargoCar < Railcar
  include InstanceCounter
  attr_reader :type

  def initialize(name)
    super
    @type= 'cargo'
  end
end