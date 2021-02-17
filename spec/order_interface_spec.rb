require_relative 'product_pack'
require_relative 'merchandise'
require_relative "order_interface"
require "pry"

Pry.config.input = STDIN
Pry.config.output = STDOUT

RSpec.describe OrderInterface do 

  describe ".new" do 
    it "assigns instance variable to order handler" do 
      order_handler = double("order_handler")
      interface = OrderInterface.new(order_handler)
      expect(interface.instance_variable_get(:@order_handler)).to eq(order_handler)
    end
  end 
  
  describe "#add_order" do 
    it "adds the product to an order list" do 
      order_handler = double("order_handler")
      expect(order_handler).to receive(:add_order).with(10, "VS5")
      order_interface = OrderInterface.new(order_handler)
      order_interface.add_order(10, "VS5")      
    end 
  end 


  describe "#submit_order" do 
    it "submits the order that the customer wants so it can be processed" do 
      order_handler = double("order_handler")
      expect(order_handler).to receive(:process_order)
      order_interface = OrderInterface.new(order_handler)      
      order_interface.submit_order
    end 
  end

end
