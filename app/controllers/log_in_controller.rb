class LogInController < ApplicationController

  include ApplicationHelper

  def login
    @user = User.new
  end

  def post_login
    @user = User.find_by(user_name: params[:user][:user_name])
    if @user.try(:authenticate, params[:user][:password])
      session[:user_name_id] = @user.id
      redirect_to user_path(@user)
    else
      render :login
    end
  end

  def logout
    session.destroy
    redirect_to login_path
  end

  def google_login
    name = request.env['omniauth.auth']['info']['name']
    user_name = request.env['omniauth.auth']['uid']
    avatar = request.env['omniauth.auth']['info']['image']
    User.find_or_create_by(user_name: user_name) do |user|
      user.name = name
      user.avatar = avatar
      user.password = SecureRandom.hex
    end
    session[:user_name_id] = @user.id
    redirect_to user_path(@user)
  end

end
