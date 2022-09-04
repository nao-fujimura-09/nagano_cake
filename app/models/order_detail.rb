class OrderDetail < ApplicationRecord
  
  belongs_to :order
  belongs_to :item
  
  def sub_total
    item.add_tax_price * amount
  end
  
  enum making_status: { impossible_make: 0, waiting_make: 1, making: 2, complite_make: 3 }
end
