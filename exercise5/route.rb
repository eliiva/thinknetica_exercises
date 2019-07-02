class Route
  include InstanceCounter

  attr_reader :intermediate_stations

  def initialize(start_st, end_st)
    @start_station = start_st
    @end_station = end_st
    @intermediate_stations = []
    register_instance
  end

  def add_station(station)
    @intermediate_stations << station
  end

  def delete_station(station)
    @intermediate_stations.delete(station)
  end

  def station_list
    [@start_station, @intermediate_stations, @end_station].flatten
  end
end
