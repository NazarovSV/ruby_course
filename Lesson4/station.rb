require_relative 'instance_counter'

class Station
  include InstanceCounter
  
  @@stations = []

  attr_reader :name
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
    @@stations.push self
    register_instance
  end

  def set_train_for_station(train)
    @trains.push train
  end

  def send_a_train(train)
    @trains.delete train
  end

  def trains_by_type(type)
    count = 0
    @trains.select { |train| count += 1 if train.class == type }
    count
  end
  
  def self.all
    @@stations
  end

end
