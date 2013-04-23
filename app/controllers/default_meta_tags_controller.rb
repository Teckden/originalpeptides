# coding: utf-8
class DefaultMetaTagsController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'

  def index
  end

  def show
    @meta_tag = DefaultMetaTag.find(params[:id])
  end

  def edit
    @meta_tag = DefaultMetaTag.find(params[:id])
  end

  def update
    @meta_tags = DefaultMetaTag.find(params[:id])

    if @meta_tags.update_attributes(params[:default_meta_tag])
      redirect_to default_meta_tags_path, notice: "Мета теги успешно обновлены"
    else
      render :edit
    end
  end

end
