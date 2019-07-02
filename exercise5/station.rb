class Station
  include InstanceCounter

  attr_reader :name, :trains
  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
  end

  def take_the_train(train)
    @trains << train
  end

  def trains_count
    trains_count = {}
    @trains.each do |train|
      type = train.type
      if trains_count[type]
        trains_count[type] += 1
      else
        trains_count[type] = 1
      end
    end
    trains_count
  end

  def send_the_train(train)
    @trains.delete(train)
  end
end
