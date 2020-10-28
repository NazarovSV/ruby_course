require_relative 'train'

class PassengerTrain < Train

  def attach_a_wagon(wagon)
    super wagon if validate_type! wagon
  end

  def detach_a_wagon(wagon)
    super wagon if validate_type! wagon
  end

  private
  #Вынос условия для проверки, используемого в нескольких методах данного класса.
  #Приватно, потому что это внутренняя "кухня" методов классов,
  #которая не должна быть видна во вне
  def validate_type!(wagon)
    raise 'Можно добавлять только грузовые вагоны' if wagon.class != PassengerWagon
  end

end
