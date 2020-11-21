# frozen_string_literal: true
# Users are built and Edited in this Class

class UsersController < ApplicationController
  include ApplicationHelper
  before_action :find_user, only: %I[show edit update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    return unless verify
  end

  def update
    if !@user
      redirect_to new_user_path
    else
      @user.update(user_params)
      redirect_to user_path(@user)
    end
  end
end
