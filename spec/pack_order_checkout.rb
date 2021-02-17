class PackOrderCheckout

  def start(order_list, merchandise_list)
    @order_list = order_list
    @merchandise_list = [merchandise_list]
  end

  def collect_packs
    
  end

  def items_quantity_order
    sum = Hash.new(0)
    @order_list.each_with_object(sum) do |hash, sum|
      hash.each { |key, value| sum[key] += value }
    end
    sum
  end



end 


