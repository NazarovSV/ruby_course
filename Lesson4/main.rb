require_relative 'station'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

puts '- Создать станции:'
zavidovo = Station.new "Завидово"
chertanovo = Station.new "Чертаново"
rasskazovo = Station.new "Рассказово"
mihnevo = Station.new "Михнево"

puts "\n- Создать поезда:"
train = PassengerTrain.new "Полярный экспресс"
second_train = CargoTrain.new "Блейн Моно"

puts "\n- Создать маршруты и управлять станциями в нем(добавлять/удалять):"
first_route = Route.new zavidovo, mihnevo
second_route = Route.new mihnevo, zavidovo

first_route.add_station chertanovo, 1
first_route.add_station chertanovo, 1
first_route.add_station rasskazovo, 2

second_route.add_station rasskazovo, 1
second_route.add_station mihnevo, 2

first_route.remove_station chertanovo

first_route.all_stations
second_route.all_stations

puts "\n- Назначить маршрут поезду:"
train.take_route first_route
train.route.stations.each { |station| puts station.name }

puts "\nДобавлять вагоны к поезду:"
cargo_wagon = CargoWagon.new
passenger_wagon = PassengerWagon.new
train.attach_a_wagon cargo_wagon
puts train.wagons.length
train.attach_a_wagon passenger_wagon
puts train.wagons.length

puts "\n- Отцеплять вагоны от поезда:"
train.detach_a_wagon passenger_wagon
puts train.wagons.length

puts "\n- Перемещать поезд по маршруту вперед и назад:"
puts train.current_station.name
train.go_to_the_next_station
puts train.current_station.name
train.go_to_the_next_station
puts train.current_station.name
train.go_to_the_previous_station
puts train.current_station.name

puts "\n- Просмотривать список станций и список поездов на станций:"
rasskazovo.trains.each { |item| puts "На станции #{item.current_station.name} - #{item.number}" }
second_train.take_route first_route
second_train.go_to_the_next_station
rasskazovo.trains.each { |item| puts "На станции #{item.current_station.name} - #{item.number} - #{item.class}" }
puts rasskazovo.trains_by_type CargoTrain
puts rasskazovo.trains_by_type PassengerTrain
