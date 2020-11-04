# frozen_string_literal: true

require_relative 'counter'

module InstanceCounter
  def self.included(base)
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module ClassMethods
    include Counter

    def instances
      @@counter[self]
    end
  end

  module InstanceMethods
    include Counter

    protected

    def register_instance
      @@counter[self.class] ||= 0
      @@counter[self.class] += 1
    end
  end
end
