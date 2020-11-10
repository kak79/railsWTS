class LogInController < ApplicationController

  include ApplicationHelper

  def login
    byebug
    @user = User.new
  end

  def post_login
    byebug
    @user = User.find_by(user_name: params[:user][:user_name])
    if @user && @user.authenticate(params[:user_name][:password])
      session[:user_name_id] = @user.id
      redirect_to user_path(@user) 
      
    else
      @user ||= User.new
      render :login
    end
  end

  def logout
    byebug
    session.destroy
    redirect_to login_path
  end


end
