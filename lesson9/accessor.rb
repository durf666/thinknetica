module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      var_name = "@#{name}_history".to_sym

      define_method(name) {instance_variable_get(var_name)}
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name,value)
        if instance_variable_defined? ("@#{name}_history")
          %Q(@#{name}_history << value)
        else
          instance_variable_set("@#{name}_history", [nil])
        end
      end
      define_method("#{name}_history".to_sym) {instance_variable_get(var_name) }
    end
  end
end
