class Order < ApplicationRecord
    
    belongs_to :customer
    has_many :order_details, dependent: :destroy
    
    enum payment_method: { credit_card: 0, transfer: 1 }
    enum status: { wating_payment: 0, confirmation_payment: 1, making: 2, preparation: 3, prepared: 4 }
end
