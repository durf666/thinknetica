module InstanceCounter

    
  
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :instances
    
    # def register_instance
    #   @instances||= 0
    #   @instances+= 1
    # end  
    
  
  end


  module InstanceMethods

    protected
    def register_instance
      self.class.instances||=0
      self.class.instances+=1
    end
    def initialize(name)
      super
      # self.class.register_instance
      register_instance

    end

  end
end