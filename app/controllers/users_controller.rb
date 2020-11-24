# frozen_string_literal: true
# Users are built and Edited in this Class

class UsersController < ApplicationController
  include ApplicationHelper
  before_action :find_user, only: %I[show edit update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(new_user_params)
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  def show
    return unless verify
  end

  def edit

  end

  def update
    if !@user
      render :new
    else
      @user.update(update_user_params)
      redirect_to user_path(@user)
    end
  end
end
