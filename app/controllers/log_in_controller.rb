class LogInController < ApplicationController

  include ApplicationHelper

  def login
    # byebug
    @user = User.new
  end

  def post_login
    # byebug
    @user = User.find_by(user_name: params[:user_name])
    if @user.try(:authenticate, params[:password])
      session[:user_name_id] = @user.id
      if @user.id == "admin"
        redirect_to admin_path(@user)
      else  
        redirect_to user_path(@user)
      end
    else
      render :login, alert: "Invalid UserName/Password!!"
    end
  end

  def logout
    # byebug
    session.destroy
    redirect_to login_path
  end


end
