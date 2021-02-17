require_relative 'product'

RSpec.describe Product do 
  

  describe "#name=" do 
    it "sets the name of the product" do 
      pastry = Product.new
      pastry.name = "Crossaint"
      expect(pastry.name).to eq("Crossaint")
    end 
  end 

  describe "#name" do 
    it "gets the name of the product" do 
      pastry = Product.new("Crossaint", "CF")
      expect(pastry.name).to eq("Crossaint")
    end 
  end 

  describe "#code=" do 
    it "sets the name of the product" do 
      pastry = Product.new
      pastry.code = "CF"
      expect(pastry.code).to eq("CF")
    end
  end 

  describe "#code" do 
    it "gets the code of the product" do 
      pastry = Product.new("Crossaint", "CF")
      expect(pastry.code).to eq("CF")
    end 
  end 

    
end 