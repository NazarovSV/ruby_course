require_relative 'instance_counter'

class Route
  include InstanceCounter

  attr_reader :stations

  def initialize(begin_station, end_station)
    @stations = [begin_station, end_station]
    register_instance
  end

  def add_station(station, station_number_on_the_route)
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

end
