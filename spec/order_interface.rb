class OrderInterface

  def initialize(order_handler)
    @order_handler = order_handler
  end

  def add_order(quantity, code)
    @order_handler.add_order(quantity, code)
  end

  def submit_order
    @order_handler.process_order
  end



end 







