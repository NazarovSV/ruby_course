require_relative 'instance_counter'

class Route
  include InstanceCounter

  attr_reader :stations

  def initialize(begin_station, end_station)
    @stations = [begin_station, end_station]
    validate!
    register_instance
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def add_station(station, station_number_on_the_route)
    validate_inserted_station! station
    validate_number_on_the_route! station_number_on_the_route
    if !@stations.include? station
      @stations.insert station_number_on_the_route, station
    end
  end

  def remove_station(station)
    @stations.delete station
  end

  def all_stations
    @stations.each { |station| puts station.name }
  end

  private

  def validate!
    raise 'Начальная станция должна быть типа Station' if @stations[0].class != Station
    raise 'Конечная станция должна быть типа Station' if @stations[-1].class != Station
    @stations[1...-1].each_with_index { |station, index| raise "#{index + 1} cтанция в пути имеет не правильный тип" if station.class != Station}
  end

  def validate_inserted_station! station
    raise 'Параметр имеет не правильный тип' if station.class != Station
  end

  def validate_number_on_the_route!(index)
    raise "Станция должна быть между #{1} и #{@stations.length} включительно" if index < 1 || index > @stations.length
  end

end
