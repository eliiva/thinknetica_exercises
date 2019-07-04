module InstanceCounter
  module ClassMethods
    attr_accessor :instances

    def add_the_instance
      self.instances ||= 0
      self.instances +=1
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
