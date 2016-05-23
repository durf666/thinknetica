class Railcar
  require_relative 'vendor'
  include Vendor

  attr_reader :name

  public

  def initialize(name)
    self.vendor= name
    validate!
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