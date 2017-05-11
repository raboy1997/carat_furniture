class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  PAYMENT_TYPES = [ "Наличный расчет", "Перевод на карту", "Наложеный платеж", "Другое" ]
  validates :name, :address, :email, :phone, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
  validates :phone,:presence => true,
            :numericality => true


  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

end
