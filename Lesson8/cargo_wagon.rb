# frozen_string_literal: true

require_relative 'wagon'
require_relative 'validation'

class CargoWagon < Wagon
  def initialize(number, space)
    self.space = space
    super number, @space
  end

  validate :space, :type, Float
end
