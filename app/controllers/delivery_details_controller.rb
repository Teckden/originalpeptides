# coding: utf-8
class DeliveryDetailsController < ApplicationController

  before_filter :confirm_logged_in, except: [:show, :index]

  layout 'admin'

  def index
    @delivery_details = DeliveryDetail.all
  end

  def new
    @delivery_detail = DeliveryDetail.new
  end

  def edit
    @delivery_detail = DeliveryDetail.find(params[:id])
  end

  def create
    @delivery_detail = DeliveryDetail.new(params[:delivery_detail])

    if @delivery_detail.save
      redirect_to action: 'index', notice: 'Файл оплаты и доставки удачно создан.'
    else
      render action: "new"
    end
  end

  def update
    @delivery_detail = DeliveryDetail.find(params[:id])

    if @delivery_detail.update_attributes(params[:delivery_detail])
      redirect_to action: 'index', notice: 'Файл оплаты и доставки удачно создан.'
    else
      render action: "edit"
    end
  end

  def destroy
    @delivery_detail = DeliveryDetail.find(params[:id])
    @delivery_detail.destroy

    redirect_to delivery_details_url
  end
end
