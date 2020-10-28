# require_relative 'station'
# require_relative 'route'
# require_relative 'passenger_train'
# require_relative 'cargo_train'
# require_relative 'passenger_wagon'
# require_relative 'cargo_wagon'
#
# puts '- Создать станции:'
# zavidovo = Station.new "Завидово"
# chertanovo = Station.new "Чертаново"
# rasskazovo = Station.new "Рассказово"
# mihnevo = Station.new "Михнево"
#
# puts "\n- Создать поезда:"
# passenger_train = PassengerTrain.new "123-52"
# passenger_train.company_name = "Velko"
# cargo_train = CargoTrain.new "ffr24"
# cargo_train.company_name = "123"
#
# puts "\n- Создать маршруты и управлять станциями в нем(добавлять/удалять):"
# first_route = Route.new zavidovo, mihnevo
# second_route = Route.new mihnevo, zavidovo
#
# first_route.add_station chertanovo, 1
# # fake = Class.new do
# #   attr_accessor :name
# #
# #   def name=(name)
# #     @name = name
# #   end
# # end
# # first_route.add_station fake, 1
# puts first_route.valid?
#
# first_route.add_station rasskazovo, 2
#
# second_route.add_station rasskazovo, 1
# second_route.add_station mihnevo, 2
#
# first_route.remove_station chertanovo
#
# first_route.all_stations
# second_route.all_stations
#
# puts "\n- Назначить маршрут поезду:"
# passenger_train.take_route first_route
# passenger_train.route.stations.each { |station| puts station.name }
#
# puts "\nДобавлять вагоны к поезду:"
# cargo_wagon = CargoWagon.new
# passenger_wagon = PassengerWagon.new
# #passenger_train.attach_a_wagon cargo_wagon
# puts passenger_train.wagons.length
# passenger_train.attach_a_wagon passenger_wagon
# puts passenger_train.wagons.length
#
# puts "\n- Отцеплять вагоны от поезда:"
# passenger_train.detach_a_wagon passenger_wagon
# puts passenger_train.wagons.length
#
# puts "\n- Перемещать поезд по маршруту вперед и назад:"
# puts passenger_train.current_station.name
# passenger_train.go_to_the_next_station
# puts passenger_train.current_station.name
# passenger_train.go_to_the_next_station
# puts passenger_train.current_station.name
# passenger_train.go_to_the_previous_station
# puts passenger_train.current_station.name
#
# puts "\n- Просмотривать список станций и список поездов на станций:"
# rasskazovo.trains.each { |item| puts "На станции #{item.current_station.name} - #{item.number}" }
# cargo_train.take_route first_route
# cargo_train.go_to_the_next_station
# rasskazovo.trains.each { |item| puts "На станции #{item.current_station.name} - #{item.number} - #{item.class}" }
# puts rasskazovo.trains_by_type CargoTrain
# puts rasskazovo.trains_by_type PassengerTrain

require_relative 'text_ui'

ui = TextUI.new
ui.start_dialog_create_train