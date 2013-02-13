class OrderMailer < ActionMailer::Base
  default from: "notification@originalpeptides.com"

  def new_order(order)
    @order = order
    #@url = "http://originalpeptides.com.ua/orders"
    mail(to: "originalpeptides@gmail.com", subject: "New order has been placed")
  end
end
