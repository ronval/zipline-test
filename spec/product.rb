class Product

  #attr_accessor :name, :code

  def initialize(name = '', code = '')
    @name = name
    @code = code
  end

  def name=(name)
   @name = name 
  end

  def name
    @name
  end


  def code=(code)
    @code = code
  end

  def code
    @code
  end

end 