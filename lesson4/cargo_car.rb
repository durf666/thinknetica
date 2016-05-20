require_relative 'railcar'

class CargoCar < Railcar

  attr_reader :type

  def initialize(name)
    super
    @type= 'cargo'
  end
end