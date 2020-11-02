require_relative 'wagon'

class CargoWagon < Wagon

  def initialize(number, space)
    super number, space
    validate!
  end

  def validate!
    raise 'Объем должен быть плавающим числом!' unless @space.is_a? Float
  end


end
