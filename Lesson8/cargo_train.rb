# frozen_string_literal: true

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

  def validate_type!(wagon)
    raise 'Можно добавлять только грузовые вагоны' unless wagon.is_a? CargoWagon
  end
end
