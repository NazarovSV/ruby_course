require_relative 'train'

class CargoTrain < Train

  def attach_a_wagon(wagon)
    validate_type! wagon
    super wagon
  end

  def detach_a_wagon(wagon)
    validate_type! wagon
    super wagon
  end

  private
  #Вынос условия для проверки, используемого в нескольких методах данного класса.
  #Приватно, потому что это внутренняя "кухня" методов классов,
  #которая не должна быть видна во вне
  def validate_type!(wagon)
    raise 'Можно добавлять только грузовые вагоны' if wagon.class != CargoWagon
  end

end
