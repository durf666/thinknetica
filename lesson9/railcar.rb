# Defines function simillar 4 all railcars
require_relative 'vendor'
require_relative 'validate'

class Railcar

  include Vendor
  include Validate

  attr_reader :name
  validate :name, :presence

  def initialize(name, _parameter)
    self.vendor = name
    register_instance
  end


end
