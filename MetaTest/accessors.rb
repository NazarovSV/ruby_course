module Accessors

  def attribute_history(attribute_name)
    define_method(attribute_name.to_s) do
      instance_variable_get("@#{attribute_name}")
    end

    define_method("#{attribute_name}=") do |value|
      if instance_variable_get("@#{attribute_name}_history")
        instance_variable_get("@#{attribute_name}_history").push(value)
      else
        instance_variable_set("@#{attribute_name}_history", [value])
      end
      instance_variable_set("@#{attribute_name}", value)
    end

    define_method("#{attribute_name}_history") do
      instance_variable_get("@#{attribute_name}_history")
    end
  end

end