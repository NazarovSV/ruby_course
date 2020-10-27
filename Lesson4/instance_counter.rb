require_relative 'counter'

module InstanceCounter

  def self.included(base)
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  #@@Counter = 0

  module ClassMethods
    include Counter

    #@@Counter = 0

    def Instances
      @@Counter[self]
    end

  end

  module InstanceMethods
    include Counter

    protected
    def register_instance
      if @@Counter.has_key? self.class
        @@Counter[self.class] += 1
      else
        @@Counter[self.class] = 1
      end
    end

  end

end