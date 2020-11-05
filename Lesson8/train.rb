# frozen_string_literal: true

require_relative 'producer'
require_relative 'instance_counter'

class Train
  include InstanceCounter
  include Producer

  @@trains = {}

  attr_reader :wagons, :number, :route

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
    @move = { back: -1, forward: 1 }
    validate!
    @@trains[number] = self
    register_instance
  end

  def execute_block(&block)
    @wagons.each { |wagon| block.call wagon }
  end

  def self.find(number)
    @@trains[number]
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
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
    @route.stations[@current_station_index].add_train_for_station self
  end

  def go_to_the_next_station
    move_train @move[:forward]
  end

  def go_to_the_previous_station
    move_train @move[:back]
  end

  def previous_station
    return @route.stations[@current_station_index - 1] if (@current_station_index - 1).positive?
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def next_station
    @route.stations[@current_station_index + 1]
  end

  protected

  def attach_a_wagon(wagon)
    @wagons.push wagon if train_is_standing?
  end

  def detach_a_wagon(wagon)
    @wagons.delete wagon if train_is_standing? && @wagons.any?
  end

  private

  def move_train(step)
    return if (@current_station_index + step).positive? && @current_station_index + step < @route.stations.length

    @route.stations[@current_station_index].send_a_train self
    @current_station_index += step
    @route.stations[@current_station_index].add_train_for_station self
  end

  def train_is_standing?
    @speed.zero?
  end

  NUMBER_FORMAT = /^[а-яa-z0-9]{3}-?[a-z0-9]{2}$/i.freeze

  def validate!
    raise 'Не корректный номер поезда' unless NUMBER_FORMAT.match?(@number)
  end
end
