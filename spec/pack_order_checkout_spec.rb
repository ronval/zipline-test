require_relative 'product_pack'
require_relative 'merchandise'
require_relative "order_interface"
require_relative "order_processor"
require_relative "pack_order_checkout"
require "pry"

Pry.config.input = STDIN
Pry.config.output = STDOUT

RSpec.describe PackOrderCheckout do 
  before(:context) do
    pack_one = ProductPack.new(6.99, 3, "VS5-3P")
      pack_two = ProductPack.new(8.99, 5, "VS5-5P")
      pack_one.code = "VS5"
      pack_two.code = "VS5"
      pack_one.name = "Vegemite Scroll"
      pack_two.name = "Vegemite Scroll"
      pack_three = ProductPack.new(9.95, 2, "MB11-2P")
      pack_four = ProductPack.new(16.95, 5, "MB11-5P")
      pack_three.code = "MB11"
      pack_four.code = "MB11"
      pack_three.name = "Blueberry Muffins"
      pack_four.name = "Blueberry Muffins"
      Merchandise.onboard_product(pack_one)
      Merchandise.onboard_product(pack_two)
      Merchandise.onboard_product(pack_three)
      Merchandise.onboard_product(pack_four)
  end
  
  describe ".start" do 
     
    it "should set order list instance variable" do
      available_products = Merchandise.available_products
      checkout_processor = PackOrderCheckout.new
      order_processor = OrderProcessor.new(checkout_processor, available_products)
      order_interace = OrderInterface.new(order_processor)
      order_interace.add_order(14, "VS5")
      order_interace.add_order(20, "VS5")
      order_interace.submit_order
      
      expect(checkout_processor.instance_variable_get(:@order_list)).to eq([{"VS5"=>14}, {"VS5"=>20}])
    end 

    it "should set merchandise list instance variable" do
      available_products = Merchandise.available_products
      checkout_processor = PackOrderCheckout.new
      order_processor = OrderProcessor.new(checkout_processor, available_products)
      order_interace = OrderInterface.new(order_processor)
      order_interace.add_order(14, "VS5")
      order_interace.add_order(20, "VS5")
      order_interace.submit_order
      
      expect(checkout_processor.instance_variable_get(:@merchandise_list)).to eq([{"MB11"=>[{:price=>9.95, :quantity=>2}, {:price=>16.95, :quantity=>5}], "VS5"=>[{:price=>6.99, :quantity=>3}, {:price=>8.99, :quantity=>5}]}])
    end 
  end 


  describe "#items_quantity_order" do 
    it "returns the total order amount for Vegemite orders" do 
      available_products = Merchandise.available_products
      checkout_processor = PackOrderCheckout.new
      order_processor = OrderProcessor.new(checkout_processor, available_products)
      order_interace = OrderInterface.new(order_processor)
      order_interace.add_order(14, "VS5")
      order_interace.add_order(20, "VS5")
      order_interace.add_order(20, "CF")
      order_interace.submit_order

      expect(checkout_processor.items_quantity_order).to eq({"VS5"=>34 , "CF"=>20})
    end 
    it "returns the total order amount for Vegemite orders and crossaint orders"
  end 

  describe "#collect_packs" do 
    it "collects the least number of packs given an order size" do 
    
      available_products = Merchandise.available_products
      checkout_processor = PackOrderCheckout.new
      order_processor = OrderProcessor.new(checkout_processor, available_products)
      order_interace = OrderInterface.new(order_processor)
      order_interace.add_order(14, "VS5")
      order_interace.add_order(20, "VS5")
      order_interace.submit_order

      expect(checkout_processor.collect_packs).to eq("34 VS5 - Total: $62.93 - Items 7X5 $8.99")
    end
  end 

    
  
  

end
