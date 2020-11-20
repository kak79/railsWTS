class LogInController < ApplicationController

  include ApplicationHelper

  def login
    @user = User.new
  end

  def post_login
    @user = User.find_by(user_name: params[:user][:email])
    if @user.try(:authenticate, params[:user][:password])
      session[:email_id] = @user.id
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
    useremail = request.env['omniauth.auth']['info']['email']
    username = request.env['omniauth.auth']['info']['name']
    @user = User.find_or_create_by(email: useremail) do |user|
      user.user_name = username
      user.password = SecureRandom.hex
    end
    session[:email_id] = @user.id
    redirect_to user_path(@user)
  end

end
