require_relative 'product_pack'
require_relative 'merchandise'
require "pry"
Pry.config.input = STDIN
Pry.config.output = STDOUT

RSpec.describe Merchandise do 
  
  # describe ".onboard_product" do 
  #   it "adds product to a hash" do 
  #     pack = ProductPack.new(6.99, 3, "VS5-3P")
  #     pack.code = "VS5"
      
  #     expect(Merchandise.onboard_product(pack)).to include("VS5"=>[{quantity:3, price:6.99}])
  #   end 
  # end 

  describe ".available_products" do 
    it "returns the available_products hash list" do 
      pack_one = ProductPack.new(6.99, 3, "VS5-3P")
      pack_two = ProductPack.new(8.99, 5, "VS5-5P")
      pack_one.code = "VS5"
      pack_two.code = "VS5"
      
      Merchandise.onboard_product(pack_one)
      Merchandise.onboard_product(pack_two)
      
      expect(Merchandise.available_products).to include("VS5" => [{:price=>6.99, :quantity=>3}, {:price=>8.99, :quantity=>5}])
    end 
  end


end 







