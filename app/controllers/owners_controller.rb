# frozen_string_literal: true
# Car and Camper Owners are Created, Deleted, Edited and Displayed in this Class

class OwnersController < ApplicationController
  include ApplicationHelper
  before_action :find_owner, only: %I[show edit update destroy]

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      redirect_to owner_path(@owner)
    else
      render :new
    end
  end

  def index
    @owner = Owner.all
    @cars = Car.all
    @campers = Camper.all
  end

  def show
    return unless verify
  end

  def update
    if !@owner
      render :new
    else
      @owner.update(owner_params)
      redirect_to owner_path(@owner)
    end
  end

  def destroy
    @owner.destroy
    redirect_to owners_path
  end
end
