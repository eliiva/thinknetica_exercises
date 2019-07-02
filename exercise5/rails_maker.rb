class RailsMaker
  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def start
    puts "Добро пожаловать в конструктор железной дороги!"

    loop do
      puts ""
      puts "Выберите действие:"
      puts "1 - создать станцию"
      puts "2 - создать поезд"
      puts "3 - создать маршрут"
      puts "4 - добавить станцию в маршрут"
      puts "5 - удалить станцию из маршрута"
      puts "6 - назначить маршрут поезду"
      puts "7 - добавить вагон"
      puts "8 - отцепить вагон"
      puts "9 - переместить поезд по маршруту"
      puts "10 - посмотреть список станций"
      puts "11 - посмотреть список поездов"
      puts "12 - выйти из конструктора"
      puts ""

      choice = gets.chomp.to_i

      break if choice == 12

      case choice
        when 1 then create_station
        when 2 then create_train
        when 3 then create_route
        when 4 then add_station_to_route
        when 5 then delete_station_fron_route
        when 6 then assign_route_to_train
        when 7 then add_carriage
        when 8 then delete_carriage
        when 9 then change_station
        when 10 then stations_list
        when 11 then trains_list
        else
          puts "Выберите действие из списка"
      end
    end
  end

  private

  def create_station
    puts "Введите название станции"
    station_name = gets.chomp
    @stations << Station.new(station_name)

    puts "Станция #{station_name} создана!"
  end

  def create_train
    puts "Укажите тип поезда: 1 - грузовой, 2 - пассажирский"
    train_type = gets.chomp.to_i
      
    puts "Укажите номер поезда:"
    train_number = gets.chomp

    case train_type
      when 1 then @trains << CargoTrain.new(train_number)
      when 2 then @trains << PassengerTrain.new(train_number)
    end

    puts "Поезд №#{train_number} создан!"
  end

  def create_route
    stations_list

    puts "Выберите начальную станцию маршрута (укажите номер):"
    start_index = gets.chomp.to_i
    start_station = @stations[start_index - 1]

    puts "Выберите конечную станцию маршрута (укажите номер):"
    end_index = gets.chomp.to_i
    end_station = @stations[end_index - 1]

    if start_station && end_station && start_index != end_index
        @routes << Route.new(start_station, end_station)
    end
  end

  def add_station_to_route
    routes_list

    puts "Выберите маршрут (укажите номер):"
    route_num = gets.chomp.to_i
    route = @routes[route_num - 1]

    stations_list

    puts "Выберите станцию (укажите номер):"
    station_num = gets.chomp.to_i
    intermediate_station = @stations[station_num - 1]

    route.add_station(intermediate_station)
    puts "Станция добавлена в маршрут!"
  end

  def delete_station_fron_route
    routes_list

    puts "Выберите маршрут (укажите номер):"
    route_num = gets.chomp.to_i
    route = @routes[route_num - 1]

    stations_list

    puts "Выберите станцию (укажите номер):"
    station_num = gets.chomp.to_i
    intermediate_station = @stations[station_num - 1]

    route.delete_station(intermediate_station)
    puts "Станция удалена из маршрута!"
  end

  def assign_route_to_train
    trains_list

    puts "Выберите поезд:"
    train_index = gets.chomp.to_i
    train = @trains[train_index - 1]

    routes_list

    puts "Выберите маршрут (укажите номер):"
    route_num = gets.chomp.to_i
    route = @routes[route_num - 1]

    train.get_the_route(route)
    puts "Маршрут назначен!" 
  end

  def add_carriage
    trains_list

    puts "Выберите поезд:"
    train_index = gets.chomp.to_i
    train = @trains[train_index - 1]

    if train.type == :cargo
      carriage = CargoCarriage.new
    else
      carriage = PassengerCarriage.new
    end

    train.add_the_carriage(carriage)
    puts "Вагон добавлен!"
  end

  def delete_carriage
    trains_list

    puts "Выберите поезд:"
    train_index = gets.chomp.to_i
    train = @trains[train_index - 1]

    train.delete_the_carriage
    puts "Вагон отцеплен!"
  end

  def change_station
    trains_list

    puts "Выберите поезд:"
    train_index = gets.chomp.to_i
    train = @trains[train_index - 1]

    puts "Выберите направление:"
    puts "1 - вперед по маршруту"
    puts "2 - назад по маршруту"
    direction = gets.chomp.to_i

    case direction
      when 1 then train.go_forward
      when 2 then train.go_back
    end
  end

  def stations_list
    @stations.each.with_index(1) do |station, index|
      puts "#{index}: #{station.name}"
    end
  end

  def trains_list
    @trains.each.with_index(1) do |train, index|
      puts "#{index}: #{train.number} (#{train.type})"
    end
  end

  def routes_list
    @routes.each.with_index(1) do |route, index|
      puts "#{index}: #{route.station_list}"
    end
  end
end
