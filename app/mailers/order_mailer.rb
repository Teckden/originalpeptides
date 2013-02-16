# coding: utf-8
class OrderMailer < ActionMailer::Base
  #default from: "noreply@originalpeptides.com.ua"

  def new_order(order)
    @order = order
    @url = "http://originalpeptides.com.ua/orders"
    mail(to: "originalpeptides@gmail.com", subject: "На сайте оформлен новый заказ", from: "noreply@originalpeptides.com.ua")
  end
end
