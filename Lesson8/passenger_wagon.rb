# frozen_string_literal: true

require_relative 'wagon'

class PassengerWagon < Wagon
  def initialize(number, space)
    self.space = space
    super number, space
  end

  def take_volume
    super 1
  end

  validate :space, :type, Integer
end
