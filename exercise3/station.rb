class Station

  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_the_train(train)
    @trains << train
  end

  def trains_count
    trains_count = {"freight" => 0, "passenger" => 0}
    @trains.each do |train|
      if train["type"] == "freight"
        trains_count["freight"] += 1
      else
        trains_count["passenger"] += 1
      end
    end
    trains_count
  end

  def send_the_train(train)
    @trains.delete(train)
  end

end
