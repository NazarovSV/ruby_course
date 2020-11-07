# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'

class Route
  include InstanceCounter
  include Validation

  attr_reader :stations

  def initialize(begin_station, end_station)
    @stations = [begin_station, end_station]
    validate_route!
    register_instance
  end

  # def valid?
  #   validate!
  #   true
  # rescue StandardError
  #   false
  # end

  def add_station(station, position)
    @station = station
    validate!
    # validate_inserted_station! station
    validate_number_on_the_route! position
    @stations.insert position, station unless @stations.include? station
  end

  def remove_station(station)
    @stations.delete station
  end

  def all_stations
    @stations.each(&:print_station)
  end

  private

  attr_accessor :station

  validate :station, :type, Station

  def print_station(station)
    puts station.name
  end

  def validate_route!
    raise 'Начальная станция должна быть типа Station' unless @stations[0].is_a? Station
    raise 'Конечная станция должна быть типа Station' unless @stations[-1].is_a? Station

    @stations[1...-1].each_with_index do |station, index|
      raise "#{index + 1} cтанция в пути имеет не правильный тип" unless station.is_a? Station
    end
  end

  # def validate_inserted_station!(station)
  #   raise 'Параметр имеет не правильный тип' unless station.is_a? Station
  # end

  def validate_number_on_the_route!(index)
    return if index.positive? && index < @stations.length

    raise "Станция должна быть между 1 и #{@stations.length} включительно"
  end
end
