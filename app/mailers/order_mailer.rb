class OrderMailer < ActionMailer::Base
  default from: "notification@example.com"

  def new_order(order)
    @order = order
    @url = "http://example.com/orders"
    mail(to: "", subject: "New order has been placed")
  end
end
