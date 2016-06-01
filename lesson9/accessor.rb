module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      history_name = "@#{name}_history".to_sym

      define_method(name) {instance_variable_get(var_name)}
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name,value)
        if instance_variable_defined? ("@#{name}_history")
          instance_variable_set(history_name, instance_variable_get(history_name)+[value])
        else
          instance_variable_set("@#{name}_history", [value])
        end
      end
      define_method("#{name}_history".to_sym) {instance_variable_get(var_name) }
    end
  end

  def strong_attr_accessor(name, klass)
    var_name = "@#{name}".to_sym
    define_method(name) {instance_variable_get(var_name)}
    define_method("#{name}=".to_sym) do |value|
      (value.class.to_s == klass.to_s) ? instance_variable_set(var_name,value) : (raise 'Incorrect type')
    end
  end


end
