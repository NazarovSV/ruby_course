class Station

  attr_reader :name

  def initialize(name)
    @name = name
    @current_trains = []
  end

  def set_train_for_station(train)
    @current_trains.push train
  end

  def send_a_train(train)
    @current_trains.delete train
  end

  def trains_on_station
    @current_trains
  end

  def trains_by_type(type)
    @current_trains.select { |train| train.type == type}
  end

end
