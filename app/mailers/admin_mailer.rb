class AdminMailer < ApplicationMailer
  default from: 'Sam Ruby <depot@example.com>'

  def received(order)
    @order = order
    mail to: User.first.email
  end
end
