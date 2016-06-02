module Validate
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, valid_type, *args)
      @validation ||=[]
      @validation << {name: name, valid_type: valid_type, args: args}
    end

    def validations
      @validation ||= []
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |val|
        send "#{val[:valid_type]}_validation", val[:name], val[:args]
      end
      true
    end

    def valid?
      validate!
    rescue
      false
    end

    private

    def presence_validation(name, *args)
      raise "@#{name} cannot be empty" if instance_variable_get("@#{name}").nil?
    end

    def format_validation(name, *args)
      raise "@#{name} format is incorrect" if instance_variable !~ regexp
    end

    def type_validation(name, *args)
      raise "@#{name} class is incorrect" unless instance_variable_get("@#{name}").class == args[0][0]
    end



  end
end