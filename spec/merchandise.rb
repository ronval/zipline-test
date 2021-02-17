class Merchandise 
  @@onboard_product = {}
  
  def self.onboard_product(product)
    # if @@onboard_product.key?(product.code)
    #   product_type = @@onboard_product[product.code]
    #   product_type[product.sku] = {quantity:product.quantity_per_pack, price:product.price}
    # else
    #   @@onboard_product[product.code] = {product.sku => {quantity:product.quantity_per_pack, price:product.price}}
    # end
    if @@onboard_product.key?(product.code)
      
      @@onboard_product[product.code].push({quantity:product.quantity_per_pack, price:product.price}) unless @@onboard_product[product.code].include?({quantity:product.quantity_per_pack, price:product.price})
    else
      @@onboard_product[product.code] = [{quantity:product.quantity_per_pack, price:product.price}]
    end
    return @@onboard_product
  end

  def self.available_products
    @@onboard_product
  end

end 

    # if @@onboard_product.key?(product.code)
    #   product_type = 
    #   @@onboard_product[product.code].push({quantity:product.quantity_per_pack, price:product.price})
    # else
    #   @@onboard_product[product.code] = [{quantity:product.quantity_per_pack, price:product.price}]
    # end