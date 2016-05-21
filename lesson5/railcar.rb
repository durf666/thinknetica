class Railcar
  require_relative 'vendor'
  include Vendor

  attr_reader :name

  def initialize(name)
    self.vendor= name
  end
end