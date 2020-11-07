# frozen_string_literal: true

require_relative 'producer'
require_relative 'validation'

class Wagon
  include Producer
  include Validation

  validate :number, :format, /^.{6}$/i.freeze

  def initialize(number, space)
    #self.space = space
    #validate!
    @free_space = space
    self.number = number
  end

  def take_volume(space)
    validate_operation! space
    @free_space -= space
  end

  def occupied_space
    @space - @free_space
  end

  attr_reader :free_space, :number

  private

  def validate_operation!(space)
    raise 'Операция невозможна. В вагоне не достаточно места' if (@free_space - space).negative?
  end
end
