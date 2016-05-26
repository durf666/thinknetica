require_relative 'instance_counter'

# Class defines statoins in programm
class Station
  include InstanceCounter
  attr_reader :name
  attr_accessor :trains

  @@stations = []

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations.push self
    register_instance
    p Station.instances
  end

  def receive_train(train)
    @trains.push(train)
  end

  def send_train(tr_num)
    @trains.each do |train|
      if train.number == tr_num
        train.station += 1
        @trains.delete(train)
      end
    end
  end

  def show_trains
    trains.each_with_index { |railcar, index| yield(railcar, index) }
  end

  def self.all
    # ObjectSpace.each_object(Station) {|station| p station}
    p @@stations
  end

  def valid?
    true if validate!
  rescue
    false
  end

  protected

  def check_trains
    trains.each_with_index { |train, index| yield(train, index) }
  end

  def validate!
    raise 'Name cannot be blank' if name.length.zero?
  end
end
