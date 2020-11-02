require_relative 'wagon'

class PassengerWagon < Wagon

  def initialize(number, space)
    super number, space
    validate!
  end

  def take_volume
    super 1
  end

  private

  def validate!
    raise 'Кол-во мест должно быть числом!' unless @space.is_a? Integer
  end

end
