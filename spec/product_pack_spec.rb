require_relative 'product_pack'
require "pry"
Pry.config.input = STDIN
Pry.config.output = STDOUT

RSpec.describe ProductPack do 
  

  describe "#price=" do 
    it "sets the price of the product" do 
      pack = ProductPack.new
      
      pack.price = (9.99)
      expect(pack.price).to eq(9.99)
    end 
  end 

  describe "#price" do 
    it "gets the price of the product" do 
      pack = ProductPack.new(9.99, 3, "VS5-3P")
      expect(pack.price).to eq(9.99)
    end 
  end 

  describe "#quantity_per_pack=" do 
    it "sets the quantity_per_pack of the pack" do 
      pack = ProductPack.new(9.99, 3, "VS5-3P")
      pack.quantity_per_pack = 5
      expect(pack.quantity_per_pack).to eq(5)
    end
  end 

  describe "#quantity_per_pack" do 
    it "gets the quantity_per_pack of the pack" do 
      pack = ProductPack.new(9.99, 3, "VS5-3P")
      expect(pack.quantity_per_pack).to eq(3)
    end 
  end 

  describe "#sku=" do 
    it "sets the quantity_per_pack of the pack" do 
      pack = ProductPack.new(9.99, 3, "VS5-3P")
      pack.sku = "VS5-3P"
      expect(pack.sku).to eq("VS5-3P")
    end
  end 

  describe "#sku" do 
    it "gets the quantity_per_pack of the pack" do 
      pack = ProductPack.new(9.99, 3, "VS5-3P")
      expect(pack.sku).to eq("VS5-3P")
    end 
  end 

    
end 