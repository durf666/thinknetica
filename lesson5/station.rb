class Station
  attr_reader :name
  attr_accessor :trains

  @@stations = []

  public

  def initialize(name)
    @name = name
    @trains = []
    @@stations.push self
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
    @trains.each {|train| puts train}
  end

  def self.all
    # ObjectSpace.each_object(Station) {|station| p station}
    p @@stations
  end
end