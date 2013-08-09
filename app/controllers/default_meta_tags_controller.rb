# coding: utf-8
class DefaultMetaTagsController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin', except: [:edit_meta_tags_for_blog]

  def index
  end

  def show
    @meta_tag = DefaultMetaTag.find(params[:id])
  end

  def edit
    @meta_tag = DefaultMetaTag.find(params[:id])
  end

  def update
    @meta_tag = DefaultMetaTag.find(params[:id])

    is_blog = request.referer == edit_meta_tags_url

    if @meta_tag.update_attributes(params[:default_meta_tag])
      redirect_to is_blog ? posts_path : default_meta_tags_path, notice: 'Мета теги успешно обновлены'
    else
      if is_blog
        render 'edit_meta_tags_for_blog', layout: 'blog'
      else
        render 'edit'
      end
    end
  end

  def edit_meta_tags_for_blog
    @meta_tag = DefaultMetaTag.find_by_method('posts_index')
    render layout: 'blog'
  end

end
