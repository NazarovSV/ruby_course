# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'
require_relative 'accessors'
require_relative 'train'

class Station
  include InstanceCounter
  include Validation
  extend Accessors

  @@stations = []

  # validate :name, :type, String
  attr_accessor_with_history :name
  strong_attr_accessor :name, String

  attr_reader :trains

  def initialize(name)
    self.name = name
    @trains = []
    validate!
    @@stations.push self
    register_instance
  end

  # def name=(value)
  #   puts self.methods
  #   super value
  # end

  def execute_block(&block)
    @trains.each { |train| block.call train }
  end

  def add_train_for_station(train)
    self.train = train
    validate!
    @trains.push train
  end

  def send_a_train(train)
    @trains.delete train
  end

  def trains_by_type(type)
    self.train_type = type
    @trains.count { |train| train.is_a? type }
  end

  def self.all
    @@stations
  end

  validate :train, :type, Train
  validate :train_type, :type, Train
end
