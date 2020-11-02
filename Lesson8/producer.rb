module Producer
  attr_reader :company_name

  def company_name=(name)
    @company_name = name
    validate_company_name!
  end

  protected
  def validate_company_name!
    raise 'Название компании должно быть типа String' if @company_name.class != String
  end
end
