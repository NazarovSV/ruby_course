require_relative 'train'

class PassengerTrain < Train

  def attach_a_wagon(wagon)
    super wagon if is_passenger_wagon wagon
  end

  def detach_a_wagon(wagon)
    super wagon if is_passenger_wagon wagon
  end

  private
  #Вынос условия для проверки, используемого в нескольких методах данного класса.
  #Приватно, потому что это внутренняя "кухня" методов классов,
  #которая не должна быть видна во вне
  def is_passenger_wagon(wagon)
    wagon.class == PassengerWagon
  end

end