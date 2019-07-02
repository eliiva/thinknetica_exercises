module InstanceCounter
  module ClassMethods
    attr_reader :instances
    @@instances = 0
    def instances
      @@instances
    end

    def add_the_instance
      @@instances +=1
    end

  end
  
  module InstanceMethods
    protected
    def register_instance
      self.class.add_the_instance
    end
  end
  
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end
