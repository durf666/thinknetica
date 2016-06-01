# Defines function simillar 4 all railcars
class Railcar
  require_relative 'vendor'
  include Vendor

  attr_reader :name

  def initialize(name, _parameter)
    self.vendor = name
    register_instance
  end

  def valid?
    true if validate!
  rescue
    false
  end

  protected

  def validate!
    raise 'Name cannot be blank' if vendor.nil?
  end
end
