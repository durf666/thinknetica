module InstanceCounter

    
  
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    def instances
      puts @instances
    end
    
    def register_instance
      @instances||= 0
      @instances+= 1
    end  
    
  
  end


  module InstanceMethods

    def initialize(name)
      super
      self.class.register_instance
    end

  end
end