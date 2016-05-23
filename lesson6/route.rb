class Route
  attr_reader :first, :last
  attr_accessor :stations

  public

  def initialize(first, last)
    @first = first
    @last = last
    @stations = [first, last]
    validate!
  end

  def add_station(name)
    @stations.insert(-2, name)
  end

  def remove_station(name)
    @stations.delete(name) if !(name == first || name == last)
  end

  def show
    @stations.each {|station| puts station}
  end

  def valid?
    true if validate! 
  rescue
    false
  end

  protected

  def validate!
    raise 'Route cannot be blank' if stations.nil?
    raise 'Route must contain at least 2 stations' if stations.length < 2
  end

end