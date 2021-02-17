require_relative 'product_pack'
require_relative 'merchandise'
require_relative "order_interface"
require_relative "order_processor"
require "pry"

Pry.config.input = STDIN
Pry.config.output = STDOUT

RSpec.describe OrderProcessor do 

  describe ".new" do 
    it "assigns instance variable to order processor" do 
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
      available_products = Merchandise.available_products

      processor = double("processor")
      order_processor = OrderProcessor.new(processor, available_products)
      expect(order_processor.instance_variable_get(:@order_processor)).to eq(processor)
    end

    it "assigns instance variable to order list" do 
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
      available_products = Merchandise.available_products
      processor = double("processor")
      order_processor = OrderProcessor.new(processor, available_products)
      expect(order_processor.instance_variable_get(:@order_list)).to eq([])
    end

    it "assigns instance variable to merchandise list" do 
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
      available_products = Merchandise.available_products


      processor = double("processor")
      order_processor = OrderProcessor.new(processor, available_products)
      expect(order_processor.instance_variable_get(:@merchandise)).to eq(available_products)
    end
  end 
  
  describe "#add_order" do 
    it "adds the one product to an order list" do 
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
      available_products = Merchandise.available_products


      processor = double("processor")
      order_processor = OrderProcessor.new(processor, available_products)
      expect(order_processor.add_order(10, "VS5")).to include({"VS5" => 10})     
    end 
  
    it "adds the two products to an order list" do 
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
      available_products = Merchandise.available_products


      processor = double("processor")
      order_processor = OrderProcessor.new(processor, available_products)
      order_processor.add_order(10, "VS5")
      expect(order_processor.add_order(15, "VS5")).to include({"VS5" => 10}, {"VS5"=>15})     
    end 
  end 


  describe "#process_order" do 
    it "submits order so it can be processed" do 
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
      available_products = Merchandise.available_products

      processor = double("processor")
      expect(processor).to receive(:start).with([{"VS5" => 10}, {"VS5"=>15}], available_products)
      order_processor = OrderProcessor.new(processor, available_products)
      order_processor.add_order(10, "VS5")
      order_processor.add_order(15, "VS5")
      order_processor.process_order
    end 
  end

end
