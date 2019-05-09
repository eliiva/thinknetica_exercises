class Train
  attr_reader :speed, :number, :type, :carriage_quantity

  def initialize(number, type, quant)
    @number = number
    @type = type
    @carriage_quantity = quant
    @speed = 0
  end

  def speed_up(val)
    @speed += val
  end

  def stop
    @speed = 0
  end

  def increase_carriage_quant
    @carriage_quantity += 1 if @speed == 0
  end

  def decrease_carriage_quant
    @carriage_quantity -= 1 if (@speed == 0) && (@carriage_quantity > 0)
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
