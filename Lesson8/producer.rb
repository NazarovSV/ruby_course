# frozen_string_literal: true

require_relative 'validation'

module Producer
  include Validation

  attr_reader :company_name

  def company_name=(name)
    @company_name = name
    validate!
  end

  validate :company_name, :type, String
end
