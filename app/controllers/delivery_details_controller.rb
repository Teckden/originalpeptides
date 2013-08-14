# coding: utf-8
class DeliveryDetailsController < ApplicationController

  before_filter :confirm_logged_in

  layout 'admin'

  def edit
    @delivery_details = Page.find_by_page(params[:custom_url])
  end

  def update
    @delivery_detail = Page.find_by_page(params[:custom_url])

    if @delivery_detail.update_attributes(params[:page])
      redirect_to else_path, notice: "Страница успешно обновлена"
    else
      render action: "edit"
    end
  end

end
