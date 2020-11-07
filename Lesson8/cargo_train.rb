# frozen_string_literal: true

require_relative 'train'
require_relative 'validation'

class CargoTrain < Train
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

  validate :attach_wagon, :type, CargoWagon
  validate :detach_wagon, :type, CargoWagon
end
