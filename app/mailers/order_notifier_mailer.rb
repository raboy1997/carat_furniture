class OrderNotifierMailer < ApplicationMailer
  default from: 'Sam Ruby <depot@example.com>'

  def received(order)
    @order = order
    mail to: order.email, subject: 'Подтверждение заказа в Pragmatic Store'
  end


end
