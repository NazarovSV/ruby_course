# frozen_string_literal: true

module Accessors
  def attr_accessor_with_history(*attr)
    attr.each do |attribute_name|
      initialize_checks attribute_name, :attr_accessor_with_history

      build_attr_with_history_getter(attribute_name)
      build_attr_history_getter(attribute_name)
      build_attribute_setter attribute_name
    end
  end

  def strong_attr_accessor(attribute_name, class_type)
    initialize_checks attribute_name, :strong_attr_accessor
    build_attribute_setter attribute_name, {type: class_type }
  end

  private

  def initialize_checks(attribute_name, check_code)
    if @checks.nil?
      @checks = { attribute_name.to_sym => { check_code => nil } } if @checks.nil?
    elsif @checks[attribute_name.to_sym].nil?
      @checks[attribute_name.to_sym] = { check_code => nil }
    else
      @checks[attribute_name.to_sym][check_code] = nil
    end
  end

  def build_attr_with_history_getter(attribute)
    define_method(attribute) do
      instance_variable_get("@#{attribute}")
    end
  end

  def build_attribute_setter(attribute_name, options = {})
    checks = @checks
    type = options[:type]
    define_method("#{attribute_name}=") do |value|
      if checks[attribute_name].key? :strong_attr_accessor
        raise "Ошибка присвоения. Переменная принимает данные типа #{type}" unless value.is_a? type
      end

      if checks[attribute_name].key? :attr_accessor_with_history
        if instance_variable_get("@#{attribute_name}_history")
          instance_variable_get("@#{attribute_name}_history").push(value)
        else
          instance_variable_set("@#{attribute_name}_history", [value])
        end
      end

      instance_variable_set("@#{attribute_name}", value)
    end
  end

  def build_attr_history_getter(attribute_name)
    define_method("#{attribute_name}_history") do
      instance_variable_get("@#{attribute_name}_history")
    end
  end
end
