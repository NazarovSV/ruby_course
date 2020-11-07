# frozen_string_literal: true
require_relative 'accessors'
require_relative 'validation'


class Test
  extend Accessors
  extend Validation

  valid :name
  attribute_history :name

  def initialize(name)
    self.name = name
  end

end

test = Test.new "Sergey"
test.name = "Alex"
test.name = ""
test.name = "Joe"

puts test.name_history.inspect

