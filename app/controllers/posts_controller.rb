# coding: utf-8
class PostsController < ApplicationController
  layout 'blog'
  def index
    @posts = Post.all.reverse
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to post_path(@post), notice: 'Статья успешно добавлена в блог'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to post_path(@post), notice: 'Изменения успешно сохранены'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      redirect_to posts_path, notice: 'Статья успешно удалена'
    else
      redirect_to post_path(@post), notice: 'К сожалению статья не была удалена. Свяжитесь с разроботчиком'
    end
  end

end
