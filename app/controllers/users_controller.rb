class UsersController < ApplicationController

  include ApplicationHelper

  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def index
    @user = User.all
  end

  def show
    if @user.admin == true  
      redirect_to admin_path(@user)
    else 
      render :show
    end
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end


end
