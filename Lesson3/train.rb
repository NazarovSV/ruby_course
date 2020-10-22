class Train

  TYPE = [:passenger, :cargo]

  def initialize(number, type, number_of_wagons)
    @number = number
    @type = type
    @number_of_wagons = number_of_wagons
    @speed = 0
    @move = {back: -1, forward: 1}
  end

  def add_speed(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def current_speed
    @speed
  end

  def number_of_wagons
    @number_of_wagons
  end

  def attach_a_wagon
    if @speed == 0
      @number_of_wagons += 1
    end
  end

  def detach_a_wagon
    if @speed == 0
      @number_of_wagons -= 1
    end
  end

  def take_route(route)
    @route = route
    @current_station_index = 0
    @route.stations[@current_station_index].set_train_for_station self
  end

  def go_to_the_next_station
    move_train @move[:forward]
  end

  def go_to_the_previous_station
    move_train @move[:back]
  end

  def previous_station
    if @current_station_index - 1 >= 0
      @route.stations[@current_station_index - 1]
    else
      nil
    end
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def next_station
    @route.stations[@current_station_index + 1]
  end

  private
  def move_train(step)
    if @current_station_index + step > 0 && @current_station_index + step < @route.stations.length
      @route.stations[@current_station_index].send_a_train self
      @current_station_index += step
      @route.stations[@current_station_index].set_train_for_station self
    end
  end

end
