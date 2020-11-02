require_relative 'passenger_train'
require_relative 'cargo_train'

class TextUI

  TRAIN_TYPE = {
    PassengerTrain => 'пассажирский',
    CargoTrain => 'грузовой'
  }

  def start_dialog_create_train
    begin

    number_of_type = get_train_type_index
    number = train_number

    train = TRAIN_TYPE.keys[number_of_type-1].new number

    company = train_producer

    train.company_name = company

    puts "Заведен #{TRAIN_TYPE[train.class]} поезд номер \"#{train.number}\" фирмы \"#{train.company_name}\""

    rescue StandardError => e
      puts e.message
      #puts e.backtrace
      retry
    end
  end

  private

  def train_producer
    puts 'Введите название фирмы поезда'
    company = gets.chomp
  end

  def train_number
    puts 'Введите номер поезда:'
    gets.chomp
  end

  def get_train_type_index
    puts 'Выберите тип поезда:'

    TRAIN_TYPE.each_with_index do |(_, locale_name), index|
      puts "#{index + 1} - #{locale_name}"
    end

    puts 'Введите число:'
    number_of_type = gets.chomp.to_i
    validate_train_choice! number_of_type
    number_of_type
  end

  def validate_train_choice!(type_index)
    raise 'Ошибка выбора варианта поезда' if correct_index type_index
  end

  def correct_index(index)
    index <= 0 || index > TRAIN_TYPE.count
  end
end
