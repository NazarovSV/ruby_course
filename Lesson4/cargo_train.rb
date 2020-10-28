require_relative 'train'

class CargoTrain < Train

  def attach_a_wagon(new_wagon)
    if is_cargo_wagon CargoWagon
      super new_wagon
    end
  end

  def detach_a_wagon(wagon_for_delete)
    if is_cargo_wagon CargoWagon
      super wagon_for_delete
    end
  end

  private
  #Вынос условия для проверки, используемого в нескольких методах данного класса.
  #Приватно, потому что это внутренняя "кухня" методов классов,
  #которая не должна быть видна во вне
  def is_cargo_wagon(wagon)
    wagon.class == CargoWagon
  end

end
