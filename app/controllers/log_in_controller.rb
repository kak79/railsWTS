# frozen_string_literal: true
# Users are logged into and out of the Session in this Class

class LogInController < ApplicationController
  include ApplicationHelper
  def login
    @user = User.new
  end

  def post_login
    @user = User.find_by(email: params[:user][:email])
    if @user.try(:authenticate, params[:user][:password])
      session[:email_id] = @user.id
      redirect_to user_path(@user)
    else
      @user = User.new
      @error = "Invalid email or password"
      render :login
    end
  end

  def logout
    session.destroy
    redirect_to login_path
  end

  def google_log
    useremail = request.env['omniauth.auth']['info']['email']
    username = request.env['omniauth.auth']['info']['name']
    @user = User.find_or_create_by(email: useremail) do |user|
      user.user_name = username
      user.password = SecureRandom.hex(5)
      user.password_confirmation=user.password
    end
    session[:email_id] = @user.id
    redirect_to user_path(@user)
  end
end
