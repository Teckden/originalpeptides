class PostsController < ApplicationController
  layout 'blog'
  def index
    @posts = Post.all.reverse
  end

  def show
  end

  def create
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def new
  end
end
