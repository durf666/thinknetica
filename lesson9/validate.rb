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
        name = val[:name]
        type = val[:valid_type]
        args = val[:args]
        case val[:valid_type]
        when :presence

          raise "@#{val[:name]} cannot be empty" if instance_variable_get("@#{val[:name]}").nil?
          p '1'
        when :format
          regexp = val[:args]
          raise "@#{val[:name]} format is incorrect" if instance_variable !~ regexp
          p '2'
        when :type
          p val[:args]
          p instance_variable_get("@#{val[:name]}").class.ancestors
          raise "@#{val[:name]} class is incorrect" unless instance_variable_get("@#{val[:name]}").class.ancestors.include? val[:args]
          p '3'
        end
      end
      true
    end

    def valid?
      validate!
    rescue
      false
    end
  end
end