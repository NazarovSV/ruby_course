require_relative 'producer'

class Wagon
  include Producer

  def initialize(number, space)
    @space = space
    @free_space = space
    @number = number
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
