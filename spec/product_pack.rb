require 'product'

class ProductPack < Product
  
  def initialize(price = 0.0, quantity_per_pack = 0, sku = "")
    @price = price
    @quantity_per_pack = quantity_per_pack
    @sku = sku
  end

  attr_accessor :price, :quantity_per_pack, :sku

end 