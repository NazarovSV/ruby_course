# frozen_string_literal: true

require_relative 'cargo_wagon'
require_relative 'cargo_train'
require_relative 'passenger_wagon'
require_relative 'passenger_train'
require_relative 'station'
require_relative 'route'

chertanovo = Station.new 'Чертаново'
domodedovo = Station.new 'Домодедово'
mihnevo = Station.new 'Михнево'
kievskay = Station.new 'Киевская'

route = Route.new mihnevo, kievskay

route.add_station chertanovo, 1
route.add_station domodedovo, 1

cargo_wagon_first = CargoWagon.new 'A333', 10.5
cargo_wagon_second = CargoWagon.new 'A334', 13.0

passenger_wagon_first = PassengerWagon.new 'П1-909', 10
passenger_wagon_second = PassengerWagon.new 'П1-910', 15
passenger_wagon_third = PassengerWagon.new 'П1-911', 20
passenger_wagon_fourth = PassengerWagon.new 'П1-923', 25

passenger_train_first = PassengerTrain.new '111-bd'
passenger_train_second = PassengerTrain.new 'eee-ce'
cargo_train = CargoTrain.new 'aaa-00'

passenger_train_first.attach_a_wagon passenger_wagon_first
2.times { passenger_wagon_first.take_volume }
passenger_train_first.attach_a_wagon passenger_wagon_second
10.times { passenger_wagon_second.take_volume }
passenger_train_first.attach_a_wagon passenger_wagon_third

passenger_train_second.attach_a_wagon passenger_wagon_fourth
25.times { passenger_wagon_fourth.take_volume }

cargo_train.attach_a_wagon cargo_wagon_first
cargo_wagon_first.take_volume 5.235
cargo_train.attach_a_wagon cargo_wagon_second
cargo_wagon_second.take_volume 5.235

passenger_train_first.take_route route
passenger_train_second.take_route route
cargo_train.take_route route

2.times do
  passenger_train_first.go_to_the_next_station
  cargo_train.go_to_the_next_station
end

def print_passenger_wagon_info(wagon)
  text = "\t\tПассажирский вагон номер \"#{wagon.number}\", свободно мест: #{wagon.free_space},"\
  "занято мест: #{wagon.occupied_space}"
  puts text
end

def print_cargo_wagon_info(wagon)
  text = "\t\tГрузовой вагон номер \"#{wagon.number}\", свободно объема: #{wagon.free_space},"\
  " занято объема: #{wagon.occupied_space}"
  puts text
end

route.stations.each do |station|
  puts "#{station.name}:\n"
  if station.trains.count.zero?
    puts "\t-"
  else
    station.execute_block do |train|
      wagon_case = {
        PassengerWagon => method(:print_passenger_wagon_info),
        CargoWagon => method(:print_cargo_wagon_info)
      }
      puts "\t#{train.class}: номер \"#{train.number}\" кол-во вагонов - #{train.wagons.count}"
      train.execute_block do |wagon|
        wagon_case[wagon.class].call wagon
      end
    end
  end
end
