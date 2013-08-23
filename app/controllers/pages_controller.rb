# coding: utf-8
class PagesController < ApplicationController

  before_filter :confirm_logged_in

  layout 'admin'

  def edit
    @page = Page.find_by_custom_url(params[:custom_url])
  end

  def update
    @page = Page.find_by_custom_url(params[:custom_url])

    if @page.update_attributes(params[:page])
      redirect_to else_path, notice: "Страница успешно обновлена"
    else
      render action: "edit"
    end
  end

end
