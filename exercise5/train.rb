class Train
  include Manufacturer
  include InstanceCounter

  attr_reader :speed, :number, :type, :carriages
  @@trains = {}

  def self.find(num)
    @@trains[num]
  end

  def initialize(number)
    @type = type
    @number = number
    @carriages = []
    @speed = 0
    @@trains[@number] = self
    register_instance
  end

  def speed_up(val)
    @speed += val
  end

  def stop
    @speed = 0
  end

  def add_the_carriage(carriage)
    @carriages << carriage if (carriage.type == @type) && @speed == 0
  end

  def delete_the_carriage
    @carriages.pop if @speed == 0
  end

  def get_the_route(route)
    @route = route
    @station_num = 0

    current_station.take_the_train(self)
  end

  def go_forward
    if next_station
      current_station.send_the_train(self)
      next_station.take_the_train(self)

      @station_num += 1
    end
  end

  def go_back
    if @station_num != 0
      current_station.send_the_train(self)
      previous_station.take_the_train(self)

      @station_num -= 1
    end
  end

  def current_station
    @route.station_list[@station_num]
  end

  def previous_station
    @route.station_list[@station_num - 1] if @station_num != 0
  end

  def next_station
    @route.station_list[@station_num + 1]
  end
end
