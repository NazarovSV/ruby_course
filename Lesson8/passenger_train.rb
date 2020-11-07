# frozen_string_literal: true

require_relative 'train'
require_relative 'validation'
require_relative 'accessors'

class PassengerTrain < Train
  extend Accessors
  include Validation

  def attach_a_wagon(wagon)
    self.attach_wagon = wagon
    validate!
    super wagon
  end

  def detach_a_wagon(wagon)
    self.detach_wagon = wagon
    validate!
    super wagon
  end

  validate :attach_wagon, :type, PassengerWagon

  strong_attr_accessor :detach_wagon, PassengerWagon
end
