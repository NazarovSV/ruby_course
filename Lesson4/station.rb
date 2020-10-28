require_relative 'instance_counter'

class Station
  include InstanceCounter
  
  @@stations = []

  attr_reader :name
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations.push self
    register_instance
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def set_train_for_station(train)
    validate_train_type! train
    @trains.push train
  end

  def send_a_train(train)
    @trains.delete train
  end

  def trains_by_type(type)
    validate_train_type! type
    @trains.count { |train| train.class == type }
  end
  
  def self.all
    @@stations
  end

  private
  def validate!
    raise 'Название станции должно быть типа string' if @name.class != String
  end

  def validate_train_type!(type)
    raise 'Tип не является наследником типа Train' if type.class.superclass != Train
  end

end
