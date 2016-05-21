module InstanceCounter


  
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      puts(@@instances)
    end
  end


  module InstanceMethods
    @@instances = 0
    def register_instance
      @@instances += 1
    end

    def initialize(name)
      super
      register_instance
    end

  end
end