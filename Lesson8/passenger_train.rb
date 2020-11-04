# frozen_string_literal: true

require_relative 'train'

class PassengerTrain < Train
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
    raise 'Можно добавлять только пассажирские вагоны' unless wagon.is_a? PassengerWagon
  end
end
