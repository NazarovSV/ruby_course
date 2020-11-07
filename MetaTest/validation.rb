module Validation

  def valid(attribute_name)

    define_method(attribute_name) do
      instance_variable_get("@#{attribute_name}")
    end

    define_method("#{attribute_name}=") do |value|
      raise 'Строка пуста' unless value.length.positive?

      instance_variable_set("@#{attribute_name}", value)
    end

  end
end
