class Train

  attr_reader :wagons, :number, :route

  def initialize(number)
    @number = number
    @wagons = []
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

  protected
  #т.к. работа будет только с дочерними классами, а Train выступает в роли абстрактного класса,
  # то само добавление вагонов можно скрыть и использовать в дочерних классах через super после того как
  # будут проведены соответствующие проверки в дочерних классах(в каждом своя реализоация)
  def attach_a_wagon(wagon)
    if train_is_standing
      @wagons.push wagon
    end
  end

  #ситуация аналогично добавлению вагона
  def detach_a_wagon(wagon)
    if train_is_standing && @wagons.any?
      @wagons.delete wagon
    end
  end

  private
  #вынесено в private т.к. метод, который использует метод is_cargo_wagon реализован
  #только в классе train и доступа в дочерних классах к нему не требуется
  def move_train(step)
    if @current_station_index + step > 0 && @current_station_index + step < @route.stations.length
      @route.stations[@current_station_index].send_a_train self
      @current_station_index += step
      @route.stations[@current_station_index].set_train_for_station self
    end
  end

  #вынесено в private т.к. методы attach_a_wagon и detach_a_wagon реализованы на уровне родительского класса,
  #и в классах потомках не требуется вызов этого метода
  def train_is_standing
    @speed == 0
  end

end
