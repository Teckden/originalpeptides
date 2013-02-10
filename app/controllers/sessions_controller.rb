# coding: utf-8
class SessionsController < ApplicationController

  before_filter :confirm_logged_in, only: [:show]

  layout 'admin'

  def show
    
  end

  def new
  end

  def create
    authorized_user = AdminUser.authenticate(params[:username], params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      redirect_to admin_path, :notice => "Вы вошли в систему."
    else
      redirect_to login_path, :notice => "Неправильное имя пользователя или пароль." 
    end
  end

  def destroy
    session[:user_id] = nil
    session[:username] = nil
    redirect_to login_url, notice: "Вы вышли из системы"
  end

end
