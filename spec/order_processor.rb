class OrderProcessor
  
  def initialize(order_processor, merchandise)
    @order_list = []  
    @order_processor = order_processor
    @merchandise = merchandise
  end
  
  def add_order(quantity, code)
    order_hash = {code=>quantity}
    @order_list.push(order_hash)
  end

  def process_order
    @order_processor.start(@order_list, @merchandise)
  end



end   